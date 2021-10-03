package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_805:int = 2;
      
      private static const const_1063:Array = [0,0,0];
       
      
      private var var_751:int = 0;
      
      private var var_415:String;
      
      private var var_2014:int = 0;
      
      private const const_1450:int = 1;
      
      private var var_419:String = "";
      
      private var var_696:int = 0;
      
      private var var_1214:int = 0;
      
      private var var_1734:Boolean = false;
      
      private var var_416:Boolean;
      
      private const const_1062:int = 3;
      
      private var var_1090:int = 0;
      
      private var _effectType:int = 0;
      
      private var var_65:IAvatarImage = null;
      
      private var var_1493:String = "";
      
      private var var_2017:Boolean = false;
      
      private var var_507:Boolean = false;
      
      private var var_2031:Boolean = false;
      
      private var var_695:int = 0;
      
      private var _isDisposed:Boolean;
      
      private const const_1720:int = 3;
      
      private var var_1383:int = -1;
      
      private var var_1592:int = -1;
      
      private var var_1336:Boolean = false;
      
      private var var_2426:Array;
      
      private const const_1117:int = 0;
      
      private var var_1593:int = -1;
      
      private var var_1494:int = -1;
      
      private var var_1091:int = 0;
      
      private var var_1594:int = 0;
      
      private var var_616:String;
      
      private var var_903:Boolean = false;
      
      private var var_1337:Boolean = false;
      
      private var var_516:BitmapDataAsset;
      
      private const const_1473:int = 2;
      
      private var _visualizationData:AvatarVisualizationData = null;
      
      private var var_318:BitmapDataAsset;
      
      private var var_479:Map;
      
      public function AvatarVisualization()
      {
         var_2426 = new Array();
         super();
         var_479 = new Map();
         var_416 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as AvatarVisualizationData;
         createSprites(const_1062);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_1337 = false;
         }
         if(var_419 == "sit" || var_419 == "lay")
         {
            var_1090 = param1 / 2;
         }
         else
         {
            var_1090 = 0;
         }
         var_1336 = false;
         var_903 = false;
         if(var_419 == "lay")
         {
            var_903 = true;
            _loc2_ = int(var_1493);
            if(_loc2_ < 0)
            {
               var_1336 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_168)
         {
            var_2031 = param1.getNumber(RoomObjectVariableEnum.const_211) > 0;
            var_2017 = param1.getNumber(RoomObjectVariableEnum.const_228) > 0;
            var_1734 = param1.getNumber(RoomObjectVariableEnum.const_481) > 0;
            var_1337 = param1.getNumber(RoomObjectVariableEnum.const_713) > 0;
            var_507 = param1.getNumber(RoomObjectVariableEnum.const_983) > 0;
            var_1214 = param1.getNumber(RoomObjectVariableEnum.const_275);
            var_419 = param1.getString(RoomObjectVariableEnum.const_434);
            var_1493 = param1.getString(RoomObjectVariableEnum.const_606);
            var_1594 = param1.getNumber(RoomObjectVariableEnum.const_870);
            _effectType = param1.getNumber(RoomObjectVariableEnum.const_1031);
            var_1091 = param1.getNumber(RoomObjectVariableEnum.const_478);
            var_751 = param1.getNumber(RoomObjectVariableEnum.const_311);
            var_1494 = param1.getNumber(RoomObjectVariableEnum.const_358);
            if(var_1091 > 0 && param1.getNumber(RoomObjectVariableEnum.const_311) > 0)
            {
               var_751 = var_1091;
            }
            else
            {
               var_751 = 0;
            }
            validateActions(param2);
            var_616 = param1.getString(RoomObjectVariableEnum.const_1027);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_179);
            updateFigure(_loc3_);
            var_168 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_479)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_479.reset();
         var_65 = null;
         _loc2_ = getSprite(const_1117);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
         }
      }
      
      private function updateFigure(param1:String) : void
      {
         if(var_415 != param1)
         {
            var_415 = param1;
            resetImages();
         }
      }
      
      override public function dispose() : void
      {
         if(var_479 != null)
         {
            resetImages();
            var_479.dispose();
            var_479 = null;
         }
         _visualizationData = null;
         var_318 = null;
         var_516 = null;
         super.dispose();
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(const_1450);
         var_318 = null;
         if(var_419 == "mv" || var_419 == "std")
         {
            _loc2_.visible = true;
            if(var_318 == null || param1 != var_150)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  var_318 = var_65.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  var_318 = var_65.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(var_318 != null)
               {
                  _loc2_.asset = var_318.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            var_318 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_479.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_415,param1,var_616,this);
            if(_loc3_ != null)
            {
               var_479.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_516 = null;
         var _loc2_:IRoomObjectSprite = getSprite(const_1473);
         if(var_507)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               var_516 = _visualizationData.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               var_516 = _visualizationData.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(var_419 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(var_419 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(var_516 != null)
            {
               _loc2_.asset = var_516.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_visualizationData == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc9_ || _loc5_ != var_150 || var_65 == null)
         {
            if(_loc5_ != var_150)
            {
               _loc7_ = true;
               validateActions(_loc5_);
            }
            if(_loc7_ || var_65 == null)
            {
               var_65 = getAvatarImage(_loc5_);
               _loc6_ = true;
            }
            if(var_65 == null)
            {
               return;
            }
            updateShadow(_loc5_);
            updateTypingBubble(_loc5_);
            _loc8_ = updateObject(_loc3_,param1,true);
            updateActions(var_65);
            var_150 = _loc5_;
         }
         else
         {
            _loc8_ = updateObject(_loc3_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = var_416 || var_695 > 0;
         if(_loc10_)
         {
            var_695 = const_805;
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --var_695;
            --var_696;
            if(!(var_696 <= 0 || _loc7_ || _loc9_ || _loc6_))
            {
               return;
            }
            var_65.updateAnimationByFrames(1);
            var_696 = const_805;
            _loc13_ = var_65.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1063;
            }
            _loc12_ = getSprite(const_1117);
            if(_loc12_ != null)
            {
               _loc16_ = var_65.getImage(AvatarSetType.const_36,false);
               if(_loc16_ != null)
               {
                  _loc12_.asset = _loc16_;
               }
               if(_loc12_.asset)
               {
                  _loc12_.offsetX = -1 * _loc5_ / 2 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + _loc5_ / 4 + _loc13_[1] + var_1090;
               }
               if(var_903)
               {
                  if(var_1336)
                  {
                     _loc12_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc12_.relativeDepth = -0.409 + _loc13_[2];
                  }
               }
               else
               {
                  _loc12_.relativeDepth = -0.01 + _loc13_[2];
               }
            }
            _loc12_ = getSprite(const_1473);
            if(_loc12_ != null && _loc12_.visible)
            {
               if(!var_903)
               {
                  _loc12_.relativeDepth = -0.02 + _loc13_[2];
               }
               else
               {
                  _loc12_.relativeDepth = -0.44 + _loc13_[2];
               }
            }
            var_416 = var_65.isAnimating();
            _loc14_ = const_1062;
            for each(_loc15_ in var_65.getSprites())
            {
               if(_loc15_.id == "avatar")
               {
                  _loc12_ = getSprite(const_1117);
                  _loc17_ = var_65.getLayerData(_loc15_);
                  _loc18_ = _loc15_.getDirectionOffsetX(var_65.getDirection());
                  _loc19_ = _loc15_.getDirectionOffsetY(var_65.getDirection());
                  if(_loc17_ != null)
                  {
                     _loc18_ += _loc17_.dx;
                     _loc19_ += _loc17_.dy;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc18_ /= 2;
                     _loc19_ /= 2;
                  }
                  _loc12_.offsetX += _loc18_;
                  _loc12_.offsetY += _loc19_;
               }
               else
               {
                  _loc12_ = getSprite(_loc14_);
                  if(_loc12_ != null)
                  {
                     _loc12_.visible = true;
                     _loc20_ = var_65.getLayerData(_loc15_);
                     _loc21_ = 0;
                     _loc22_ = _loc15_.getDirectionOffsetX(var_65.getDirection());
                     _loc23_ = _loc15_.getDirectionOffsetY(var_65.getDirection());
                     _loc24_ = _loc15_.getDirectionOffsetZ(var_65.getDirection());
                     _loc25_ = 0;
                     if(_loc15_.hasDirections)
                     {
                        _loc25_ = var_65.getDirection();
                     }
                     if(_loc20_ != null)
                     {
                        _loc21_ = _loc20_.animationFrame;
                        _loc22_ += _loc20_.dx;
                        _loc23_ += _loc20_.dy;
                        _loc25_ += _loc20_.directionOffset;
                     }
                     if(_loc5_ < 48)
                     {
                        _loc22_ /= 2;
                        _loc23_ /= 2;
                     }
                     if(_loc25_ < 0)
                     {
                        _loc25_ += 8;
                     }
                     else if(_loc25_ > 7)
                     {
                        _loc25_ -= 8;
                     }
                     _loc26_ = var_65.getScale() + "_" + _loc15_.member + "_" + _loc25_ + "_" + _loc21_;
                     _loc27_ = var_65.getAsset(_loc26_);
                     if(_loc27_ == null)
                     {
                        continue;
                     }
                     _loc12_.asset = _loc27_.content as BitmapData;
                     _loc12_.offsetX = -_loc27_.offset.x - _loc5_ / 2 + _loc22_;
                     _loc12_.offsetY = -_loc27_.offset.y + _loc23_ + var_1090;
                     if(var_903)
                     {
                        _loc12_.relativeDepth = -0.409 - 0.1 * spriteCount * _loc24_;
                     }
                     else
                     {
                        _loc12_.relativeDepth = -0.01 - 0.1 * spriteCount * _loc24_;
                     }
                     if(_loc15_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc14_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_301 != param1.getUpdateID() || var_1383 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1494;
            if(var_419 == "float")
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
            }
            _loc5_ = (_loc5_ % 360 + 360) % 360;
            if(_loc4_ != var_1593 || param3)
            {
               var_1593 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_65.setDirectionAngle(AvatarSetType.const_36,_loc4_);
            }
            if(_loc5_ != var_1592 || param3)
            {
               var_1592 = _loc5_;
               if(var_1592 != var_1593)
               {
                  _loc5_ -= 112.5;
                  _loc5_ = (_loc5_ + 360) % 360;
                  var_65.setDirectionAngle(AvatarSetType.const_45,_loc5_);
               }
            }
            var_301 = param1.getUpdateID();
            var_1383 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_485,var_419,var_1493);
         if(var_1214 > 0)
         {
            param1.appendAction(AvatarAction.const_258,AvatarAction.const_1301[var_1214]);
         }
         if(var_1594 > 0)
         {
            param1.appendAction(AvatarAction.const_831,var_1594);
         }
         if(var_2014 > 0)
         {
            param1.appendAction(AvatarAction.const_883,var_2014);
         }
         if(var_1091 > 0)
         {
            param1.appendAction(AvatarAction.const_960,var_1091);
         }
         if(var_751 > 0)
         {
            param1.appendAction(AvatarAction.const_920,var_751);
         }
         if(var_2031)
         {
            param1.appendAction(AvatarAction.const_290);
         }
         if(var_1734 || var_1337)
         {
            param1.appendAction(AvatarAction.const_395);
         }
         if(var_2017)
         {
            param1.appendAction(AvatarAction.const_279);
         }
         if(_effectType > 0)
         {
            param1.appendAction(AvatarAction.const_399,_effectType);
         }
         param1.endActionAppends();
         var_416 = param1.isAnimating();
         var _loc2_:int = const_1062;
         for each(_loc3_ in var_65.getSprites())
         {
            if(_loc3_.id != "avatarImage")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
