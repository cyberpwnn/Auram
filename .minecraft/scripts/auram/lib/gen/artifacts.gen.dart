// GENERATED – do not modify by hand

// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: constant_identifier_names
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: unused_element
import "package:auram/model/config.dart";import "package:auram/model/models.dart";import "package:artifact/artifact.dart";import "dart:core";
typedef _0=ArtifactCodecUtil;typedef _1=Map<String,dynamic>;typedef _2=List<String>;typedef _3=String;typedef _4=dynamic;typedef _5=int;typedef _6=ArtifactModelExporter;typedef _7=ArgumentError;typedef _8=Exception;typedef _9=Config;typedef _a=BotaniaApothecaryRecipe;typedef _b=BotaniaAltarRecipe;typedef _c=BotaniaDaisyRecipe;typedef _d=BotaniaInfusionRecipe;typedef _e=FurnaceRecipe;typedef _f=ShapedRecipe;typedef _g=ShapelessRecipe;typedef _h=Item;typedef _i=Recipe;typedef _j=ArtifactModelImporter<Config>;typedef _k=double;typedef _l=List;typedef _m=bool;typedef _n=ArtifactModelImporter<BotaniaApothecaryRecipe>;typedef _o=List<Item>;typedef _p=ArtifactModelImporter<BotaniaAltarRecipe>;typedef _q=ArtifactModelImporter<BotaniaDaisyRecipe>;typedef _r=ArtifactModelImporter<BotaniaInfusionRecipe>;typedef _s=BotaniaInfusionCatalyst;typedef _t=ArtifactModelImporter<FurnaceRecipe>;typedef _u=ArtifactModelImporter<ShapedRecipe>;typedef _v=List<List<Item>>;typedef _w=ArtifactModelImporter<ShapelessRecipe>;typedef _x=ArtifactModelImporter<Item>;typedef _y=ArtifactModelImporter<Recipe>;typedef _z=ArtifactAccessor;typedef _10=List<dynamic>;
_7 __x(_3 c,_3 f)=>_7('${_S[23]}$c.$f');
const _2 _S=['seed','difficultyMultiplier','craftingFluids','craftingTools','_subclass_Recipe','inputs','output','BotaniaApothecaryRecipe','input','outputs','mana','BotaniaAltarRecipe','ticks','BotaniaDaisyRecipe','catalyst','BotaniaInfusionRecipe','FurnaceRecipe','pattern','ShapedRecipe','ShapelessRecipe','quantity','Item','auram','Missing required '];const _10 _V=["auram",<_3>["<liquid:water>", "<liquid:lava>", "<liquid:creosote>"],<_3>["<ore:artisansCutters>", "<ore:artisansHammer>", "<ore:artisansFramingHammer>", "<ore:artisansHandsaw>", "<ore:artisansCuttingBoard>", "<ore:artisansPan>", "<ore:artisansBeaker>", "<ore:artisansBurner>", "<ore:artisansPencil>", "<ore:artisansTSquare>", "<ore:artisansDriver>", "<ore:artisansSpanner>", "<ore:artisansLens>", "<ore:artisansSifter>", "<ore:artisansGemCutter>", "<ore:artisansPliers>", "<ore:artisansAthame>", "<ore:artisansGrimmoire>", "<ore:artisansChisel>", "<ore:artisansTrowel>", "<ore:artisansCarver>", "<ore:artisansRazor>", "<ore:artisansCompass>", "<ore:artisansQuill>", "<ore:artisansNeedle>", "<ore:artisansShears>", "<ore:artisansPunch>", "<ore:artisansGroover>", "<ore:artisansMortar>", "<ore:artisansKnife>", "<ore:artisansHatchet>", "<ore:artisansFile>", "<ore:artisansSolderer>"],<_h>[],1000,BotaniaInfusionCatalyst.none,<_o>[]];const _m _T=true;const _m _F=false;_5 _ = ((){if(!_z.$i(_S[22])){_z.$r(_S[22],_z(isArtifact: $isArtifact,artifactMirror:{},constructArtifact:$constructArtifact,artifactToMap:$artifactToMap,artifactFromMap:$artifactFromMap));}return 0;})();

extension $Config on _9{
  _9 get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[0]:_0.ea(seed),_S[1]:_0.ea(difficultyMultiplier),_S[2]:craftingFluids.$m((e)=> _0.ea(e)).$l,_S[3]:craftingTools.$m((e)=> _0.ea(e)).$l,}.$nn;}
  static _j get from=>_j(fromMap);
  static _9 fromMap(_1 r){_;_1 m=r.$nn;return _9(seed: m.$c(_S[0]) ?  _0.da(m[_S[0]], _3) as _3 : _V[0],difficultyMultiplier: m.$c(_S[1]) ?  _0.da(m[_S[1]], _k) as _k : 1.0,craftingFluids: m.$c(_S[2]) ?  (m[_S[2]] as _l).$m((e)=> _0.da(e, _3) as _3).$l : _V[1],craftingTools: m.$c(_S[3]) ?  (m[_S[3]] as _l).$m((e)=> _0.da(e, _3) as _3).$l : _V[2],);}
  _9 copyWith({_3? seed,_m resetSeed=_F,_k? difficultyMultiplier,_m resetDifficultyMultiplier=_F,_k? deltaDifficultyMultiplier,_2? craftingFluids,_m resetCraftingFluids=_F,_2? appendCraftingFluids,_2? removeCraftingFluids,_2? craftingTools,_m resetCraftingTools=_F,_2? appendCraftingTools,_2? removeCraftingTools,})=>_9(seed: resetSeed?_V[0]:(seed??_H.seed),difficultyMultiplier: deltaDifficultyMultiplier!=null?(difficultyMultiplier??_H.difficultyMultiplier)+deltaDifficultyMultiplier:resetDifficultyMultiplier?1.0:(difficultyMultiplier??_H.difficultyMultiplier),craftingFluids: ((resetCraftingFluids?_V[1]:(craftingFluids??_H.craftingFluids)) as _2).$u(appendCraftingFluids,removeCraftingFluids),craftingTools: ((resetCraftingTools?_V[2]:(craftingTools??_H.craftingTools)) as _2).$u(appendCraftingTools,removeCraftingTools),);
  static _9 get newInstance=>_9();
}
extension $BotaniaApothecaryRecipe on _a{
  _a get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'BotaniaApothecaryRecipe',_S[5]:inputs.$m((e)=> e.toMap()).$l,_S[6]:output.toMap(),}.$nn;}
  static _n get from=>_n(fromMap);
  static _a fromMap(_1 r){_;_1 m=r.$nn;return _a(inputs: m.$c(_S[5]) ?  (m[_S[5]] as _l).$m((e)=>$Item.fromMap((e) as Map<String, dynamic>)).$l : _V[3],output: m.$c(_S[6])?$Item.fromMap((m[_S[6]]) as Map<String, dynamic>):throw __x(_S[7],_S[6]),);}
  _a copyWith({_o? inputs,_m resetInputs=_F,_o? appendInputs,_o? removeInputs,_h? output,})=>_a(inputs: ((resetInputs?_V[3]:(inputs??_H.inputs)) as _o).$u(appendInputs,removeInputs),output: output??_H.output,);
  static _a get newInstance=>_a(output: $Item.newInstance,);
}
extension $BotaniaAltarRecipe on _b{
  _b get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'BotaniaAltarRecipe',_S[8]:input.toMap(),_S[9]:outputs.$m((e)=> e.toMap()).$l,_S[10]:_0.ea(mana),}.$nn;}
  static _p get from=>_p(fromMap);
  static _b fromMap(_1 r){_;_1 m=r.$nn;return _b(input: m.$c(_S[8])?$Item.fromMap((m[_S[8]]) as Map<String, dynamic>):throw __x(_S[11],_S[8]),outputs: m.$c(_S[9]) ?  (m[_S[9]] as _l).$m((e)=>$Item.fromMap((e) as Map<String, dynamic>)).$l : _V[3],mana: m.$c(_S[10]) ?  _0.da(m[_S[10]], _5) as _5 : _V[4],);}
  _b copyWith({_h? input,_o? outputs,_m resetOutputs=_F,_o? appendOutputs,_o? removeOutputs,_5? mana,_m resetMana=_F,_5? deltaMana,})=>_b(input: input??_H.input,outputs: ((resetOutputs?_V[3]:(outputs??_H.outputs)) as _o).$u(appendOutputs,removeOutputs),mana: deltaMana!=null?(mana??_H.mana)+deltaMana:resetMana?_V[4]:(mana??_H.mana),);
  static _b get newInstance=>_b(input: $Item.newInstance,);
}
extension $BotaniaDaisyRecipe on _c{
  _c get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'BotaniaDaisyRecipe',_S[8]:input.toMap(),_S[6]:output.toMap(),_S[12]:_0.ea(ticks),}.$nn;}
  static _q get from=>_q(fromMap);
  static _c fromMap(_1 r){_;_1 m=r.$nn;return _c(input: m.$c(_S[8])?$Item.fromMap((m[_S[8]]) as Map<String, dynamic>):throw __x(_S[13],_S[8]),output: m.$c(_S[6])?$Item.fromMap((m[_S[6]]) as Map<String, dynamic>):throw __x(_S[13],_S[6]),ticks: m.$c(_S[12]) ?  _0.da(m[_S[12]], _5) as _5 : 200,);}
  _c copyWith({_h? input,_h? output,_5? ticks,_m resetTicks=_F,_5? deltaTicks,})=>_c(input: input??_H.input,output: output??_H.output,ticks: deltaTicks!=null?(ticks??_H.ticks)+deltaTicks:resetTicks?200:(ticks??_H.ticks),);
  static _c get newInstance=>_c(input: $Item.newInstance,output: $Item.newInstance,);
}
extension $BotaniaInfusionRecipe on _d{
  _d get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'BotaniaInfusionRecipe',_S[8]:input.toMap(),_S[6]:output.toMap(),_S[14]:catalyst.name,_S[10]:_0.ea(mana),}.$nn;}
  static _r get from=>_r(fromMap);
  static _d fromMap(_1 r){_;_1 m=r.$nn;return _d(input: m.$c(_S[8])?$Item.fromMap((m[_S[8]]) as Map<String, dynamic>):throw __x(_S[15],_S[8]),output: m.$c(_S[6])?$Item.fromMap((m[_S[6]]) as Map<String, dynamic>):throw __x(_S[15],_S[6]),catalyst: m.$c(_S[14]) ? _0.e(BotaniaInfusionCatalyst.values, m[_S[14]]) as BotaniaInfusionCatalyst : _V[5],mana: m.$c(_S[10]) ?  _0.da(m[_S[10]], _5) as _5 : _V[4],);}
  _d copyWith({_h? input,_h? output,_s? catalyst,_m resetCatalyst=_F,_5? mana,_m resetMana=_F,_5? deltaMana,})=>_d(input: input??_H.input,output: output??_H.output,catalyst: resetCatalyst?_V[5]:(catalyst??_H.catalyst),mana: deltaMana!=null?(mana??_H.mana)+deltaMana:resetMana?_V[4]:(mana??_H.mana),);
  static _d get newInstance=>_d(input: $Item.newInstance,output: $Item.newInstance,);
}
extension $FurnaceRecipe on _e{
  _e get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'FurnaceRecipe',_S[8]:input.toMap(),_S[6]:output.toMap(),}.$nn;}
  static _t get from=>_t(fromMap);
  static _e fromMap(_1 r){_;_1 m=r.$nn;return _e(input: m.$c(_S[8])?$Item.fromMap((m[_S[8]]) as Map<String, dynamic>):throw __x(_S[16],_S[8]),output: m.$c(_S[6])?$Item.fromMap((m[_S[6]]) as Map<String, dynamic>):throw __x(_S[16],_S[6]),);}
  _e copyWith({_h? input,_h? output,})=>_e(input: input??_H.input,output: output??_H.output,);
  static _e get newInstance=>_e(input: $Item.newInstance,output: $Item.newInstance,);
}
extension $ShapedRecipe on _f{
  _f get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'ShapedRecipe',_S[17]:pattern.$m((e)=> e.$m((e)=> e?.toMap()).$l).$l,_S[6]:output.toMap(),}.$nn;}
  static _u get from=>_u(fromMap);
  static _f fromMap(_1 r){_;_1 m=r.$nn;return _f(pattern: m.$c(_S[17]) ?  (m[_S[17]] as _l).$m((e)=> (e as _l).$m((e)=>$Item.fromMap((e) as Map<String, dynamic>)).$l).$l : _V[6],output: m.$c(_S[6])?$Item.fromMap((m[_S[6]]) as Map<String, dynamic>):throw __x(_S[18],_S[6]),);}
  _f copyWith({_v? pattern,_m resetPattern=_F,_v? appendPattern,_v? removePattern,_h? output,})=>_f(pattern: ((resetPattern?_V[6]:(pattern??_H.pattern)) as _v).$u(appendPattern,removePattern),output: output??_H.output,);
  static _f get newInstance=>_f(output: $Item.newInstance,);
}
extension $ShapelessRecipe on _g{
  _g get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{_S[4]: 'ShapelessRecipe',_S[5]:inputs.$m((e)=> e.toMap()).$l,_S[6]:output.toMap(),}.$nn;}
  static _w get from=>_w(fromMap);
  static _g fromMap(_1 r){_;_1 m=r.$nn;return _g(inputs: m.$c(_S[5]) ?  (m[_S[5]] as _l).$m((e)=>$Item.fromMap((e) as Map<String, dynamic>)).$l : _V[3],output: m.$c(_S[6])?$Item.fromMap((m[_S[6]]) as Map<String, dynamic>):throw __x(_S[19],_S[6]),);}
  _g copyWith({_o? inputs,_m resetInputs=_F,_o? appendInputs,_o? removeInputs,_h? output,})=>_g(inputs: ((resetInputs?_V[3]:(inputs??_H.inputs)) as _o).$u(appendInputs,removeInputs),output: output??_H.output,);
  static _g get newInstance=>_g(output: $Item.newInstance,);
}
extension $Item on _h{
  _h get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;return<_3,_4>{'id':_0.ea(id),_S[20]:_0.ea(quantity),}.$nn;}
  static _x get from=>_x(fromMap);
  static _h fromMap(_1 r){_;_1 m=r.$nn;return _h(id: m.$c('id')? _0.da(m['id'], _3) as _3:throw __x(_S[21],'id'),quantity: m.$c(_S[20]) ?  _0.da(m[_S[20]], _5) as _5 : 1,);}
  _h copyWith({_3? id,_5? quantity,_m resetQuantity=_F,_5? deltaQuantity,})=>_h(id: id??_H.id,quantity: deltaQuantity!=null?(quantity??_H.quantity)+deltaQuantity:resetQuantity?1:(quantity??_H.quantity),);
  static _h get newInstance=>_h(id: '',);
}
extension $Recipe on _i{
  _i get _H=>this;
  _6 get to=>_6(toMap);
  _1 toMap(){_;if (_H is _a){return (_H as _a).toMap();}if (_H is _b){return (_H as _b).toMap();}if (_H is _c){return (_H as _c).toMap();}if (_H is _d){return (_H as _d).toMap();}if (_H is _e){return (_H as _e).toMap();}if (_H is _f){return (_H as _f).toMap();}if (_H is _g){return (_H as _g).toMap();}return<_3,_4>{}.$nn;}
  static _y get from=>_y(fromMap);
  static _i fromMap(_1 r){_;_1 m=r.$nn;if(m.$c(_S[4])){String _I=m[_S[4]] as _3;if(_I==_S[7]){return $BotaniaApothecaryRecipe.fromMap(m);}if(_I==_S[11]){return $BotaniaAltarRecipe.fromMap(m);}if(_I==_S[13]){return $BotaniaDaisyRecipe.fromMap(m);}if(_I==_S[15]){return $BotaniaInfusionRecipe.fromMap(m);}if(_I==_S[16]){return $FurnaceRecipe.fromMap(m);}if(_I==_S[18]){return $ShapedRecipe.fromMap(m);}if(_I==_S[19]){return $ShapelessRecipe.fromMap(m);}}return _i();}
  static _i get newInstance=>_i();
}

bool $isArtifact(dynamic v)=>v==null?false : v is! Type ?$isArtifact(v.runtimeType):v == _9 ||v == _a ||v == _b ||v == _c ||v == _d ||v == _e ||v == _f ||v == _g ||v == _h ||v == _i ;
T $constructArtifact<T>() => T==_9 ?$Config.newInstance as T :T==_a ?$BotaniaApothecaryRecipe.newInstance as T :T==_b ?$BotaniaAltarRecipe.newInstance as T :T==_c ?$BotaniaDaisyRecipe.newInstance as T :T==_d ?$BotaniaInfusionRecipe.newInstance as T :T==_e ?$FurnaceRecipe.newInstance as T :T==_f ?$ShapedRecipe.newInstance as T :T==_g ?$ShapelessRecipe.newInstance as T :T==_h ?$Item.newInstance as T :T==_i ?$Recipe.newInstance as T : throw _8();
_1 $artifactToMap(Object o)=>o is _9 ?o.toMap():o is _a ?o.toMap():o is _b ?o.toMap():o is _c ?o.toMap():o is _d ?o.toMap():o is _e ?o.toMap():o is _f ?o.toMap():o is _g ?o.toMap():o is _h ?o.toMap():o is _i ?o.toMap():throw _8();
T $artifactFromMap<T>(_1 m)=>T==_9 ?$Config.fromMap(m) as T:T==_a ?$BotaniaApothecaryRecipe.fromMap(m) as T:T==_b ?$BotaniaAltarRecipe.fromMap(m) as T:T==_c ?$BotaniaDaisyRecipe.fromMap(m) as T:T==_d ?$BotaniaInfusionRecipe.fromMap(m) as T:T==_e ?$FurnaceRecipe.fromMap(m) as T:T==_f ?$ShapedRecipe.fromMap(m) as T:T==_g ?$ShapelessRecipe.fromMap(m) as T:T==_h ?$Item.fromMap(m) as T:T==_i ?$Recipe.fromMap(m) as T:throw _8();
