package art.arcane.auram.util;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class OllamaClient {

    private final String baseUrl;
    private final String model;

    public OllamaClient(String baseUrl, String model) {
        if (baseUrl.contains("localhost")) {
            baseUrl = baseUrl.replace("localhost", "127.0.0.1");
        }
        this.baseUrl = baseUrl.endsWith("/") ? baseUrl : baseUrl + "/";
        this.model = model;
    }

    public String generateResponse(String prompt) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(this.baseUrl + "chat/completions");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", "Bearer ollama"); // Dummy key needed for strict parsers
            conn.setDoOutput(true);
            conn.setConnectTimeout(50000); // 5 seconds to connect
            conn.setReadTimeout(1200000);  // 2 minutes to read response
            JsonObject message = new JsonObject();
            message.addProperty("role", "user");
            message.addProperty("content", prompt);

            JsonArray messages = new JsonArray();
            messages.add(message);

            JsonObject reasoning = new JsonObject();
            reasoning.addProperty("effort", "low");
            
            JsonObject payload = new JsonObject();
            payload.addProperty("model", this.model);
            //payload.add("reasoning", reasoning);
            payload.add("messages", messages);
            payload.addProperty("temperature", 0.2);
            payload.addProperty("stream", false); // Critical for non-streaming
            String jsonInputString = payload.toString();
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int code = conn.getResponseCode();
            if (code != 200) {
                // Read the Error Stream to see why it failed
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8))) {
                    StringBuilder response = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        response.append(line);
                    }
                    System.err.println("Ollama API Error (" + code + "): " + response.toString());
                }
                return "none";
            }

            StringBuilder response = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
            }

            JsonObject jsonResponse = JsonParser.parseString(response.toString()).getAsJsonObject();
            return jsonResponse.getAsJsonArray("choices")
                    .get(0).getAsJsonObject()
                    .getAsJsonObject("message")
                    .get("content").getAsString();

        } catch (Exception e) {
            System.err.println("Ollama Connection Failed: " + e.getMessage());
            e.printStackTrace();
            return "none";
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
    }
}