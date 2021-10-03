package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.data.ColorData;
   import com.sulake.habbo.room.object.visualization.furniture.data.LayerData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class FurnitureVisualization extends RoomObjectSpriteVisualization
   {
      
      protected static const const_1449:Number = Math.sqrt(0.5);
       
      
      protected var _direction:int;
      
      protected var var_2422:int = -1;
      
      private var var_570:Array;
      
      private var var_2331:int = -1;
      
      protected var _data:FurnitureVisualizationData = null;
      
      protected var _alphaMultiplier:Number = 1.0;
      
      protected var _type:String = "";
      
      private var var_563:Array;
      
      protected var var_1687:String = null;
      
      private var var_569:Array;
      
      private var var_565:Array;
      
      private var var_2333:Number = 0.0;
      
      private var var_567:Array;
      
      private var var_1438:Boolean = true;
      
      private var var_672:Array;
      
      private var var_673:Array;
      
      private var var_2334:Number = 0.0;
      
      private var var_566:Array;
      
      private var var_564:Array;
      
      private var var_568:Array;
      
      protected var var_2417:Number = NaN;
      
      private var var_2332:int = -1;
      
      public function FurnitureVisualization()
      {
         var_673 = [];
         var_672 = [];
         var_563 = [];
         var_566 = [];
         var_568 = [];
         var_565 = [];
         var_570 = [];
         var_564 = [];
         var_569 = [];
         var_567 = [];
         super();
         reset();
      }
      
      protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(false)
         {
            return var_564[param1];
         }
         if(_data == null)
         {
            return LayerData.const_449;
         }
         var _loc4_:Number = _data.getZOffset(param1,param2,param3);
         var_564[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteAssetName(param1:int, param2:Number) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(_data == null)
         {
            return "";
         }
         var _loc3_:String = "null";
         var _loc4_:Boolean = false;
         if(_loc3_ == null || _loc3_.length == 0)
         {
            _loc5_ = _data.getSize(param2);
            _loc3_ = _type;
            _loc6_ = "";
            if(param1 < spriteCount - 1)
            {
               _loc6_ = String.fromCharCode("a".charCodeAt() + param1);
            }
            else
            {
               _loc6_ = "sd";
            }
            if(_loc5_ == 1)
            {
               _loc3_ += "_icon_" + _loc6_;
               _loc4_ = false;
            }
            else
            {
               _loc3_ += "_" + _loc5_ + "_" + _loc6_ + "_" + _direction;
               _loc4_ = true;
            }
            var_673[param1] = _loc3_;
            var_672[param1] = _loc4_;
         }
         if(_loc4_)
         {
            _loc7_ = getFrameNumber(param1,param2);
            _loc3_ += "_" + _loc7_;
         }
         return _loc3_;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is FurnitureVisualizationData))
         {
            return false;
         }
         _data = param1 as FurnitureVisualizationData;
         _type = _data.getType();
         return true;
      }
      
      protected function getSpriteInk(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_567[param1];
         }
         if(_data == null)
         {
            return LayerData.const_438;
         }
         var _loc4_:int = _data.getInk(param1,_direction,param3);
         var_567[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_570[param1];
         }
         if(_data == null)
         {
            return LayerData.const_404;
         }
         var _loc4_:int = _data.getYOffset(param1,param2,param3);
         var_570[param1] = _loc4_;
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _data = null;
         var_673 = null;
         var_672 = null;
         var_563 = null;
         var_566 = null;
         var_568 = null;
         var_565 = null;
         var_570 = null;
         var_564 = null;
         var_569 = null;
         var_567 = null;
      }
      
      protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         if(false)
         {
            return var_569[param1];
         }
         if(_data == null)
         {
            return true;
         }
         var _loc4_:* = !_data.getIgnoreMouse(param1,_direction,param3);
         var_569[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function updateAnimation(param1:Number) : Boolean
      {
         return false;
      }
      
      protected function updateSprites(param1:int, param2:Number) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = NaN;
         var _loc10_:int = 0;
         if(_data == null)
         {
            return;
         }
         var _loc3_:int = _data.getLayerCount(param1) + 1;
         if(_loc3_ != spriteCount)
         {
            createSprites(_loc3_);
         }
         updateAssetNameCache(_direction,param1);
         updateSpriteValueCache(_direction,param1);
         var _loc4_:Boolean = false;
         if(var_1687 != null && var_1687.indexOf("http") == 0)
         {
            _loc4_ = true;
         }
         var _loc5_:int = spriteCount - 1;
         while(_loc5_ >= 0)
         {
            _loc6_ = getSpriteAssetName(_loc5_,param1);
            _loc7_ = getSprite(_loc5_);
            if(_loc7_ != null)
            {
               _loc8_ = null;
               if(assetCollection != null)
               {
                  _loc8_ = assetCollection.getAsset(_loc6_);
               }
               if(_loc8_ != null && _loc8_.asset != null)
               {
                  _loc7_.visible = true;
                  _loc7_.asset = _loc8_.asset.content as BitmapData;
                  _loc7_.flipH = _loc8_.flipH;
                  _loc7_.flipV = _loc8_.flipV;
                  _loc7_.offsetX = _loc8_.offsetX;
                  _loc7_.offsetY = _loc8_.offsetY;
                  _loc9_ = 0;
                  if(_loc5_ < spriteCount - 1)
                  {
                     _loc7_.tag = getSpriteTag(_loc5_,_direction,param1);
                     _loc7_.alpha = getSpriteAlpha(_loc5_,_direction,param1);
                     _loc7_.color = getSpriteColor(_loc5_,var_2422,param1);
                     _loc7_.offsetX += getSpriteXOffset(_loc5_,_direction,param1);
                     _loc7_.offsetY += getSpriteYOffset(_loc5_,_direction,param1);
                     _loc7_.capturesMouse = getSpriteMouseCapture(_loc5_,_direction,param1);
                     _loc7_.blendMode = getBlendMode(getSpriteInk(_loc5_,_direction,param1));
                     _loc9_ = Number(getSpriteZOffset(_loc5_,_direction,param1));
                     _loc9_ -= _loc5_ * 0.001;
                  }
                  else
                  {
                     _loc10_ = 48;
                     _loc10_ *= _alphaMultiplier;
                     _loc7_.alpha = _loc10_;
                     _loc7_.capturesMouse = false;
                     _loc9_ = 1;
                  }
                  _loc9_ *= param2;
                  _loc7_.relativeDepth = _loc9_;
                  _loc7_.assetName = _loc6_;
                  _loc7_.clickHandling = _loc4_;
               }
               else
               {
                  _loc7_.asset = null;
                  _loc7_.assetName = "";
                  _loc7_.tag = "";
                  _loc7_.flipH = false;
                  _loc7_.flipV = false;
                  _loc7_.offsetX = 0;
                  _loc7_.offsetY = 0;
                  _loc7_.relativeDepth = 0;
                  _loc7_.clickHandling = false;
               }
            }
            _loc5_--;
         }
         var_1438 = false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc5_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         if(_data == null)
         {
            return;
         }
         var _loc3_:Boolean = false;
         var _loc4_:Number = param1.scale;
         if(updateObject(_loc4_,param1.direction.x))
         {
            _loc3_ = true;
         }
         if(updateModel(_loc4_))
         {
            _loc3_ = true;
         }
         if(updateAnimation(_loc4_))
         {
            _loc3_ = true;
         }
         if(_loc3_ || var_150 != _loc4_)
         {
            _loc5_ = const_1449;
            updateSprites(_loc4_,_loc5_);
            var_150 = _loc4_;
            increaseUpdateId();
         }
      }
      
      override protected function reset() : void
      {
         super.reset();
         _direction = -1;
         _data = null;
         var_673 = [];
         var_672 = [];
         var_563 = [];
         var_566 = [];
         var_568 = [];
         var_565 = [];
         var_570 = [];
         var_564 = [];
         var_569 = [];
         var_567 = [];
         this.createSprites(0);
      }
      
      protected function getBlendMode(param1:int) : String
      {
         var _loc2_:String = "null";
         switch(param1)
         {
            case LayerData.const_943:
               _loc2_ = "null";
               break;
            case LayerData.INK_DARKEN:
               _loc2_ = "null";
               break;
            case LayerData.const_978:
               _loc2_ = "null";
         }
         return _loc2_;
      }
      
      private function updateAssetNameCache(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         if(var_2331 != param1 || var_2334 != param2)
         {
            _loc3_ = spriteCount - 1;
            while(_loc3_ >= 0)
            {
               var_673[_loc3_] = "";
               var_672[_loc3_] = false;
               _loc3_--;
            }
            var_2331 = param1;
            var_2334 = param2;
         }
      }
      
      protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         if(false && !var_1438)
         {
            return var_566[param1];
         }
         if(_data == null)
         {
            return LayerData.const_379;
         }
         var _loc4_:int = _data.getAlpha(param1,param2,param3);
         _loc4_ *= _alphaMultiplier;
         var_566[param1] = _loc4_;
         return _loc4_;
      }
      
      private function updateSpriteValueCache(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         if(var_2332 != param1 || var_2333 != param2)
         {
            _loc3_ = spriteCount - 1;
            while(_loc3_ >= 0)
            {
               var_563[_loc3_] = null;
               var_566[_loc3_] = null;
               var_568[_loc3_] = null;
               var_565[_loc3_] = null;
               var_570[_loc3_] = null;
               var_564[_loc3_] = null;
               var_569[_loc3_] = null;
               var_567[_loc3_] = null;
               _loc3_--;
            }
            var_2332 = param1;
            var_2333 = param2;
         }
      }
      
      protected function getSpriteTag(param1:int, param2:int, param3:int) : String
      {
         if(false)
         {
            return var_563[param1];
         }
         if(_data == null)
         {
            return "";
         }
         var _loc4_:String = _data.getTag(param1,_direction,param3);
         var_563[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:* = NaN;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_168 != _loc3_.getUpdateID())
         {
            var_2422 = _loc3_.getNumber(RoomObjectVariableEnum.const_239);
            _loc4_ = Number(_loc3_.getNumber(RoomObjectVariableEnum.const_238));
            if(isNaN(_loc4_))
            {
               _loc4_ = 1;
            }
            if(_loc4_ != _alphaMultiplier)
            {
               _alphaMultiplier = _loc4_;
               var_1438 = true;
            }
            var_1687 = _loc3_.getString(RoomObjectVariableEnum.const_330);
            var_168 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_301 != _loc3_.getUpdateID() || param1 != var_150 || param2 != var_2417)
         {
            _loc4_ = _loc3_.getDirection().x - (param2 + 135);
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = _data.getDirectionValue(_loc4_,param1);
            _direction = _loc5_;
            var_301 = _loc3_.getUpdateID();
            var_2417 = param2;
            return true;
         }
         return false;
      }
      
      protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_565[param1];
         }
         if(_data == null)
         {
            return LayerData.const_450;
         }
         var _loc4_:int = _data.getXOffset(param1,param2,param3);
         var_565[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_568[param1];
         }
         if(_data == null)
         {
            return ColorData.const_70;
         }
         var _loc4_:int = _data.getColor(param1,param2,param3);
         var_568[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getFrameNumber(param1:int, param2:int) : int
      {
         return 0;
      }
   }
}
