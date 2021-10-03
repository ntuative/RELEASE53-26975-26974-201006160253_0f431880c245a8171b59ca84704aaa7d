package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarImage implements IAvatarImage, IDisposable
   {
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const const_1113:int = 2;
      
      private static const const_1112:String = AvatarSetType.const_36;
      
      private static const const_1114:String = "Default";
       
      
      private var var_415:AvatarFigureContainer;
      
      private var var_1157:Array;
      
      protected var _isDisposed:Boolean;
      
      private var var_175:Array;
      
      private var var_897:Boolean = false;
      
      private var var_2004:String;
      
      protected var var_152:String;
      
      private var var_2514:int;
      
      private var _image:BitmapData;
      
      protected var var_2421:int;
      
      private var var_136:AvatarImageCache;
      
      private var var_332:Boolean;
      
      private var var_416:Boolean;
      
      private var _assets:AssetAliasCollection;
      
      private var var_508:IAvatarDataContainer;
      
      private var var_520:int = 0;
      
      private var var_2513:int;
      
      private var var_1323:int = 0;
      
      private var var_1426:Boolean;
      
      private var var_235:Array;
      
      protected var var_92:int;
      
      private var var_801:String;
      
      private var var_619:Array;
      
      private var var_1156:Boolean = false;
      
      private var var_898:IActiveActionData;
      
      protected var var_258:IActiveActionData;
      
      protected var var_80:AvatarStructure;
      
      private var var_459:Map;
      
      public function AvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String, param5:String = null)
      {
         var_235 = [];
         var_619 = new Array();
         super();
         var_332 = true;
         var_80 = param1;
         _assets = param2;
         var_152 = param4;
         if(var_152 == null)
         {
            var_152 = AvatarScaleType.const_53;
         }
         if(param3 == null)
         {
            param3 = new AvatarFigureContainer("hr-893-45.hd-180-2.ch-210-66.lg-270-82.sh-300-91.wa-2007-.ri-1-");
            Logger.log("Using default avatar figure");
         }
         var_415 = param3;
         var_136 = new AvatarImageCache(var_80,this,_assets,var_152);
         setDirection(const_1112,const_1113);
         var_235 = new Array();
         var_898 = new ActiveActionData(AvatarAction.const_413);
         var_898.definition = var_80.getActionDefinition(const_1114);
         resetActions();
         var_459 = new Map();
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      public function getCanvasOffsets() : Array
      {
         return var_619;
      }
      
      public function getSprites() : Array
      {
         return var_175;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_isDisposed)
         {
            var_80 = null;
            _assets = null;
            var_136 = null;
            var_258 = null;
            var_415 = null;
            var_508 = null;
            var_235 = null;
            if(_image)
            {
               _image.dispose();
            }
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            if(var_459)
            {
               for each(_loc2_ in var_459)
               {
                  _loc2_.dispose();
               }
               var_459.dispose();
               var_459 = null;
            }
            _image = null;
            var_619 = null;
            _isDisposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         param2 += var_1323;
         if(param2 < AvatarDirectionAngle.const_888)
         {
            param2 = AvatarDirectionAngle.const_276 + (param2 + 1);
         }
         if(param2 > AvatarDirectionAngle.const_276)
         {
            param2 -= NaN;
         }
         if(var_80.isMainAvatarSet(param1))
         {
            var_92 = param2;
         }
         if(param1 == AvatarSetType.const_45 || param1 == AvatarSetType.const_36)
         {
            var_2421 = param2;
         }
         getCache().setDirection(param1,param2);
         var_332 = true;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return _assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function get avatarSpriteData() : IAvatarDataContainer
      {
         return var_508;
      }
      
      public function initActionAppends() : void
      {
         var_235 = new Array();
         var_897 = false;
         var_801 = "";
         var_1426 = false;
      }
      
      public function isAnimating() : Boolean
      {
         return var_416;
      }
      
      public function endActionAppends() : void
      {
         sortActions();
         resetActions();
         setActionsToParts();
      }
      
      private function setActionsToParts() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_1157)
         {
            if(!(!_loc1_ || !_loc1_.definition))
            {
               if(_loc1_.definition.isAnimation && _loc1_.actionParameter == "")
               {
                  _loc1_.actionParameter = "1";
               }
               setActionToParts(_loc1_);
               if(_loc1_.definition.isAnimation)
               {
                  var_416 = true;
                  _loc2_ = var_80.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
                  if(_loc2_ != null)
                  {
                     var_175 = var_175.concat(_loc2_.spriteData);
                     if(_loc2_.hasDirectionData())
                     {
                        var_1323 = _loc2_.directionData.offset;
                     }
                     if(_loc2_.hasAvatarData())
                     {
                        var_508 = _loc2_.avatarData;
                     }
                  }
               }
               if(_loc1_.actionType == AvatarAction.const_465)
               {
                  var_416 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_279)
               {
                  var_416 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_290)
               {
                  var_416 = true;
               }
            }
         }
      }
      
      public function getSubType() : int
      {
         return -1;
      }
      
      private function sortActions() : void
      {
         var_897 = true;
         if(var_2004 == var_801)
         {
            return;
         }
         var_2004 = var_801;
         var_1157 = var_80.sortActions(var_235);
         if(var_1157 == null)
         {
            var_619 = new Array(0,0,0);
         }
         else
         {
            var_619 = var_80.getCanvasOffsets(var_1157,var_152,var_92);
         }
      }
      
      private function addActionData(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         if(var_235 == null)
         {
            var_235 = new Array();
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_235.length)
         {
            _loc3_ = var_235[_loc4_];
            if(_loc3_.actionType == param1 && _loc3_.actionParameter == param2)
            {
               return;
            }
            _loc4_++;
         }
         var_235.push(new ActiveActionData(param1,param2));
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return var_80.getPartColor(var_415,param1);
      }
      
      public function getCroppedImage(param1:String) : BitmapData
      {
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(var_258 == null)
         {
            return null;
         }
         var _loc2_:AvatarImageCache = getCache();
         var _loc3_:AvatarCanvas = var_80.getCanvas(var_152,var_258.definition.geometryType);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         var _loc5_:Array = var_80.getBodyParts(param1,var_258.definition,var_92);
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = _loc5_[_loc7_];
            _loc10_ = _loc2_.getImageContainer(_loc9_,var_520);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.image;
               if(_loc11_ == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc12_ = _loc10_.regPoint.clone();
               _loc4_.copyPixels(_loc11_,_loc11_.rect,_loc12_,null,null,true);
               _loc13_ = new Rectangle(_loc12_.x,_loc12_.y,_loc11_.width,_loc11_.height);
               if(_loc6_ == null)
               {
                  _loc6_ = _loc13_;
               }
               else
               {
                  _loc6_ = _loc6_.union(_loc13_);
               }
            }
            _loc7_--;
         }
         if(_loc6_ == null)
         {
            _loc6_ = new Rectangle(0,0,1,1);
         }
         var _loc8_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc8_.copyPixels(_loc4_,_loc6_,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc8_;
      }
      
      public function getScale() : String
      {
         return var_152;
      }
      
      public function get petBreed() : int
      {
         return -1;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         setDirection(param1,_loc3_);
      }
      
      public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(!var_332)
         {
            return _image;
         }
         if(var_258 == null)
         {
            return null;
         }
         if(!var_897)
         {
            endActionAppends();
         }
         var _loc3_:String = getFullImageCacheKey();
         if(_loc3_ != null)
         {
            if(false)
            {
               var_332 = false;
               if(param2)
               {
                  return (var_459[_loc3_] as BitmapData).clone();
               }
               _image = var_459[_loc3_] as BitmapData;
               var_1156 = true;
               return _image;
            }
         }
         var _loc4_:AvatarImageCache = getCache();
         var _loc5_:AvatarCanvas = var_80.getCanvas(var_152,var_258.definition.geometryType);
         if(var_1156 || _image == null || _loc5_ != null && (_image.width != _loc5_.width || _image.height != _loc5_.height))
         {
            _loc5_ = var_80.getCanvas(var_152,var_258.definition.geometryType);
            if(_loc5_ == null)
            {
               return null;
            }
            if(_image != null && !var_1156)
            {
               _image.dispose();
            }
            _image = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
            var_1156 = false;
         }
         var _loc6_:Array = var_80.getBodyParts(param1,var_258.definition,var_92);
         _image.lock();
         _image.fillRect(_image.rect,16777215);
         var _loc7_:Point = _loc5_.offset;
         if(_loc7_ == null)
         {
            _loc7_ = new Point(0,0);
         }
         var _loc8_:int = _loc6_.length - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = _loc6_[_loc8_];
            _loc10_ = _loc4_.getImageContainer(_loc9_,var_520);
            if(_loc10_ && _loc10_.image && _loc10_.regPoint)
            {
               _loc11_ = _loc10_.image;
               _loc12_ = _loc10_.regPoint.clone();
               _image.copyPixels(_loc11_,_loc11_.rect,_loc12_.add(_loc7_),null,null,true);
            }
            _loc8_--;
         }
         _image.unlock();
         var_332 = false;
         if(var_508 != null)
         {
            if(false)
            {
               _loc13_ = convertToGrayscale(_image);
               if(_image)
               {
                  _image.dispose();
               }
               _image = _loc13_;
               _image.paletteMap(_image,_image.rect,new Point(0,0),var_508.reds,[],[]);
            }
            else
            {
               _image.copyChannel(_image,_image.rect,new Point(0,0),2,8);
            }
         }
         if(_loc3_ != null)
         {
            var_459.add(_loc3_,_image.clone());
         }
         if(_image && param2)
         {
            return _image.clone();
         }
         return _image;
      }
      
      private function resetActions() : Boolean
      {
         var_416 = false;
         var_175 = [];
         var_508 = null;
         var_1323 = 0;
         var_80.removeDynamicItems();
         var_258 = var_898;
         var_258.definition = var_898.definition;
         setActionToParts(var_898);
         getCache().resetBodyPartCache(var_898);
         return true;
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         var_520 += param1;
         var_332 = true;
      }
      
      private function errorThis(param1:String) : void
      {
         Logger.log("[AvatarImageError] " + param1);
      }
      
      private function getCache() : AvatarImageCache
      {
         if(var_136 == null)
         {
            var_136 = new AvatarImageCache(var_80,this,_assets,var_152);
         }
         return var_136;
      }
      
      private function setActionToParts(param1:IActiveActionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            var_258 = param1;
            getCache().setGeometryType(param1.definition.geometryType);
         }
         getCache().setAction(param1);
         var_332 = true;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc3_:* = 0.33;
         var _loc4_:* = 0.33;
         var _loc5_:* = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc3_ = 0.3;
               _loc4_ = 0.59;
               _loc5_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc3_ = 1;
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc3_ = 0;
               _loc4_ = 1;
               _loc5_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc3_ = 0.3086;
               _loc4_ = 0.6094;
               _loc5_ = 0.082;
         }
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,0,0,0,1,0];
         var _loc8_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,4294967295);
         _loc9_.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,new Point(0,0),_loc8_);
         return _loc9_;
      }
      
      public function getFigure() : AvatarFigureContainer
      {
         return var_415;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData
      {
         return var_80.getBodyPartData(param1.animation.id,var_520,param1.id);
      }
      
      public function getDirection() : int
      {
         return var_92;
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_897 = false;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         var_801 = var_801 + param1 + _loc3_;
         switch(param1)
         {
            case AvatarAction.const_485:
               switch(_loc3_)
               {
                  case AvatarAction.const_985:
                     if(var_92 == 0)
                     {
                        setDirection(AvatarSetType.const_36,4);
                     }
                     else
                     {
                        setDirection(AvatarSetType.const_36,2);
                     }
                  case AvatarAction.const_567:
                     var_1426 = true;
                  case AvatarAction.const_413:
                  case AvatarAction.const_967:
                  case AvatarAction.const_465:
                  case AvatarAction.const_860:
                  case AvatarAction.const_699:
                     addActionData(_loc3_);
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_258:
               switch(_loc3_)
               {
                  case AvatarAction.const_702:
                  case AvatarAction.const_474:
                  case AvatarAction.const_695:
                     addActionData(_loc3_);
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_831:
            case AvatarAction.const_290:
            case AvatarAction.const_279:
            case AvatarAction.const_399:
            case AvatarAction.const_395:
            case AvatarAction.const_883:
               addActionData(param1,_loc3_);
               break;
            case AvatarAction.const_960:
            case AvatarAction.const_920:
               _loc4_ = var_80.getActionDefinitionWithState(param1);
               if(_loc4_ != null)
               {
                  logThis("appendAction:" + [_loc3_,"->",_loc4_.getParameterValue(_loc3_)]);
                  _loc3_ = _loc4_.getParameterValue(_loc3_);
               }
               addActionData(param1,_loc3_);
               break;
            default:
               errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      private function getFullImageCacheKey() : String
      {
         if(var_1426 && false && var_92 == var_2421)
         {
            return var_92 + var_801 + var_520 % 4;
         }
         return null;
      }
      
      public function get petType() : int
      {
         return -1;
      }
   }
}
