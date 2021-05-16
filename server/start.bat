@echo off
:a
java -Xmx5G -Xms5G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=10 -XX:G1MaxNewSizePercent=20 -XX:+UseStringDeduplication -XX:StringDeduplicationAgeThreshold=4 -XX:MaxGCPauseMillis=100 -XX:+ParallelRefProcEnabled -XX:ConcGCThreads=4 -jar forge-1.12.2-14.23.5.2854.jar nogui
pause
goto a