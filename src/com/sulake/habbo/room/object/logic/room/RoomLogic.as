package com.sulake.habbo.room.object.logic.room
{
   import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
   import com.sulake.habbo.room.events.RoomObjectWallMouseEvent;
   import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.ColorConverter;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class RoomLogic extends ObjectLogicBase
   {
       
      
      private var var_1640:int = 1500;
      
      private var var_1641:int = 255;
      
      private var var_1642:int = 255;
      
      private var var_1386:uint = 16777215;
      
      private var var_1123:uint = 16777215;
      
      protected var var_89:RoomPlaneParser = null;
      
      private var var_951:int = 0;
      
      private var var_1316:int = 255;
      
      private var _color:uint = 16777215;
      
      private var var_460:RoomPlaneBitmapMaskParser = null;
      
      public function RoomLogic()
      {
         super();
         var_89 = new RoomPlaneParser();
         var_460 = new RoomPlaneBitmapMaskParser();
      }
      
      override public function update(param1:int) : void
      {
         super.update(param1);
         updateBackgroundColor(param1);
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         if(param1 == null || object == null)
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:RoomObjectRoomUpdateMessage = param1 as RoomObjectRoomUpdateMessage;
         if(_loc3_ != null)
         {
            updatePlaneProperties(_loc3_,_loc2_);
            return;
         }
         var _loc4_:RoomObjectRoomMaskUpdateMessage = param1 as RoomObjectRoomMaskUpdateMessage;
         if(_loc4_ != null)
         {
            updatePlaneMasks(_loc4_,_loc2_);
            return;
         }
         var _loc5_:RoomObjectRoomPlaneVisibilityUpdateMessage = param1 as RoomObjectRoomPlaneVisibilityUpdateMessage;
         if(_loc5_ != null)
         {
            updatePlaneVisibilities(_loc5_,_loc2_);
            return;
         }
         var _loc6_:RoomObjectRoomColorUpdateMessage = param1 as RoomObjectRoomColorUpdateMessage;
         if(_loc6_ != null)
         {
            updateColors(_loc6_,_loc2_);
            return;
         }
      }
      
      override public function initialize(param1:XML) : void
      {
         if(param1 == null || object == null)
         {
            return;
         }
         if(!var_89.initializeFromXML(param1))
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc2_ != null)
         {
            _loc2_.setString(RoomObjectVariableEnum.const_890,param1.toString(),true);
            _loc2_.setNumber(RoomObjectVariableEnum.const_706,16777215);
            _loc2_.setNumber(RoomObjectVariableEnum.const_586,1);
            _loc2_.setNumber(RoomObjectVariableEnum.const_644,1);
            _loc2_.setNumber(RoomObjectVariableEnum.const_548,1);
         }
      }
      
      private function updateColors(param1:RoomObjectRoomColorUpdateMessage, param2:IRoomObjectModelController) : void
      {
         var _loc3_:int = param1.color;
         var _loc4_:int = param1.light;
         param2.setNumber(RoomObjectVariableEnum.const_986,int(param1.bgOnly));
         var_1386 = _color;
         var_1641 = var_1316;
         var_1123 = _loc3_;
         var_1642 = _loc4_;
         var_951 = getTimer();
         var_1640 = 1500;
      }
      
      private function updatePlaneVisibilities(param1:RoomObjectRoomPlaneVisibilityUpdateMessage, param2:IRoomObjectModelController) : void
      {
         var _loc3_:int = 0;
         if(param1.visible)
         {
            _loc3_ = 1;
         }
         switch(param1.type)
         {
            case RoomObjectRoomPlaneVisibilityUpdateMessage.const_832:
               param2.setNumber(RoomObjectVariableEnum.const_586,_loc3_);
               break;
            case RoomObjectRoomPlaneVisibilityUpdateMessage.const_979:
               param2.setNumber(RoomObjectVariableEnum.const_644,_loc3_);
               param2.setNumber(RoomObjectVariableEnum.const_548,_loc3_);
         }
      }
      
      private function updatePlaneMasks(param1:RoomObjectRoomMaskUpdateMessage, param2:IRoomObjectModelController) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:Boolean = false;
         switch(param1.type)
         {
            case RoomObjectRoomMaskUpdateMessage.const_483:
               _loc5_ = "null";
               if(param1.maskCategory == RoomObjectRoomMaskUpdateMessage.const_202)
               {
                  _loc5_ = "null";
               }
               var_460.addMask(param1.maskId,param1.maskType,param1.maskLocation,_loc5_);
               _loc4_ = true;
               break;
            case RoomObjectRoomMaskUpdateMessage.const_617:
               _loc4_ = var_460.removeMask(param1.maskId);
         }
         if(_loc4_)
         {
            _loc6_ = var_460.getXML();
            _loc7_ = _loc6_.toXMLString();
            param2.setString(RoomObjectVariableEnum.const_944,_loc7_);
         }
      }
      
      private function updatePlaneProperties(param1:RoomObjectRoomUpdateMessage, param2:IRoomObjectModelController) : void
      {
         switch(param1.type)
         {
            case RoomObjectRoomUpdateMessage.const_573:
               param2.setString(RoomObjectVariableEnum.const_708,param1.value);
               break;
            case RoomObjectRoomUpdateMessage.const_736:
               param2.setString(RoomObjectVariableEnum.const_632,param1.value);
               break;
            case RoomObjectRoomUpdateMessage.const_555:
               param2.setString(RoomObjectVariableEnum.const_557,param1.value);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(var_89 != null)
         {
            var_89.dispose();
            var_89 = null;
         }
         if(var_460 != null)
         {
            var_460.dispose();
            var_460 = null;
         }
      }
      
      private function updateBackgroundColor(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:Number = NaN;
         if(object == null)
         {
            return;
         }
         if(var_951)
         {
            _loc2_ = param1;
            _loc3_ = _color;
            _loc4_ = var_1316;
            if(_loc2_ - var_951 >= var_1640)
            {
               _loc3_ = var_1123;
               _loc4_ = var_1642;
               var_951 = 0;
            }
            else
            {
               _loc7_ = var_1386 >> 16 & 255;
               _loc8_ = var_1386 >> 8 & 255;
               _loc9_ = var_1386 & 255;
               _loc10_ = var_1123 >> 16 & 255;
               _loc11_ = var_1123 >> 8 & 255;
               _loc12_ = var_1123 & 255;
               _loc13_ = (_loc2_ - var_951) / var_1640;
               _loc7_ += (_loc10_ - _loc7_) * _loc13_;
               _loc8_ += (_loc11_ - _loc8_) * _loc13_;
               _loc9_ += (_loc12_ - _loc9_) * _loc13_;
               _loc3_ = (_loc7_ << 16) + (_loc8_ << 8) + _loc9_;
               _loc4_ = var_1641 + (var_1642 - var_1641) * _loc13_;
               _color = _loc3_;
               var_1316 = _loc4_;
            }
            _loc5_ = ColorConverter.rgbToHSL(_loc3_);
            _loc5_ = (_loc5_ & 16776960) + _loc4_;
            _loc3_ = ColorConverter.hslToRGB(_loc5_);
            _loc6_ = object.getModel() as IRoomObjectModelController;
            if(_loc6_ == null)
            {
               return;
            }
            _loc6_.setNumber(RoomObjectVariableEnum.const_706,_loc3_);
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc26_:* = null;
         var _loc27_:* = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         if(param2 == null)
         {
            return;
         }
         var _loc3_:RoomSpriteMouseEvent = param1;
         if(_loc3_ == null)
         {
            return;
         }
         if(object == null || param1 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         var _loc6_:String = _loc3_.spriteTag;
         if(_loc6_.indexOf("@") >= 0)
         {
            _loc5_ = parseInt(_loc6_.substr(_loc6_.indexOf("@") + 1));
         }
         if(_loc5_ < 1 || _loc5_ > var_89.planeCount)
         {
            if(param1.type == MouseEvent.ROLL_OUT)
            {
               _loc4_.setNumber(RoomObjectVariableEnum.const_107,0);
            }
            return;
         }
         _loc5_--;
         var _loc7_:* = null;
         var _loc8_:IVector3d = var_89.getPlaneLocation(_loc5_);
         var _loc9_:IVector3d = var_89.getPlaneLeftSide(_loc5_);
         var _loc10_:IVector3d = var_89.getPlaneRightSide(_loc5_);
         var _loc11_:IVector3d = var_89.getPlaneNormalDirection(_loc5_);
         var _loc12_:IVector3d = var_89.getPlaneNormal(_loc5_);
         var _loc13_:int = var_89.getPlaneType(_loc5_);
         if(_loc8_ == null || _loc9_ == null || _loc10_ == null || _loc11_ == null)
         {
            return;
         }
         var _loc14_:Number = _loc9_.length;
         var _loc15_:Number = _loc10_.length;
         if(_loc14_ == 0 || _loc15_ == 0)
         {
            return;
         }
         var _loc16_:Number = _loc3_.screenX;
         var _loc17_:Number = _loc3_.screenY;
         var _loc18_:Point = new Point(_loc16_,_loc17_);
         _loc7_ = param2.getPlanePosition(_loc18_,_loc8_,_loc9_,_loc10_);
         if(_loc7_ == null)
         {
            _loc4_.setNumber(RoomObjectVariableEnum.const_107,0);
            return;
         }
         var _loc19_:Vector3d = Vector3d.sum(_loc8_,Vector3d.sum(Vector3d.product(_loc9_,_loc7_.x / _loc14_),Vector3d.product(_loc10_,_loc7_.y / _loc15_)));
         var _loc20_:Number = _loc19_.x;
         var _loc21_:Number = _loc19_.y;
         var _loc22_:Number = _loc19_.z;
         if(_loc7_.x >= 0 && _loc7_.x < _loc14_ && _loc7_.y >= 0 && _loc7_.y < _loc15_)
         {
            _loc4_.setNumber(RoomObjectVariableEnum.const_1243,_loc20_);
            _loc4_.setNumber(RoomObjectVariableEnum.const_1305,_loc21_);
            _loc4_.setNumber(RoomObjectVariableEnum.const_1194,_loc22_);
            _loc4_.setNumber(RoomObjectVariableEnum.const_107,_loc5_ + 1);
            var _loc23_:String = "";
            var _loc24_:int = 0;
            var _loc25_:* = null;
            switch(param1.type)
            {
               case MouseEvent.MOUSE_MOVE:
               case MouseEvent.ROLL_OVER:
               case MouseEvent.CLICK:
                  _loc26_ = "";
                  if(param1.type == MouseEvent.MOUSE_MOVE || param1.type == MouseEvent.ROLL_OVER)
                  {
                     _loc26_ = "null";
                  }
                  else if(param1.type == MouseEvent.CLICK)
                  {
                     _loc26_ = "null";
                  }
                  _loc24_ = object.getId();
                  _loc23_ = object.getType();
                  if(eventDispatcher != null)
                  {
                     if(_loc13_ == RoomPlaneData.const_167)
                     {
                        _loc25_ = new RoomObjectTileMouseEvent(_loc26_,_loc24_,_loc23_,_loc20_,_loc21_,_loc22_);
                     }
                     else if(_loc13_ == RoomPlaneData.const_150 || _loc13_ == RoomPlaneData.const_255)
                     {
                        _loc27_ = 90;
                        if(_loc11_ != null)
                        {
                           _loc27_ = Number(_loc11_.x + 90);
                           if(_loc27_ > 360)
                           {
                              _loc27_ -= 360;
                           }
                        }
                        _loc28_ = _loc9_.length * _loc7_.x / _loc14_;
                        _loc29_ = _loc10_.length * _loc7_.y / _loc15_;
                        _loc25_ = new RoomObjectWallMouseEvent(_loc26_,_loc24_,_loc23_,_loc8_,_loc9_,_loc10_,_loc28_,_loc29_,_loc27_);
                     }
                     if(_loc25_ != null)
                     {
                        eventDispatcher.dispatchEvent(_loc25_);
                     }
                  }
            }
            return;
         }
         _loc4_.setNumber(RoomObjectVariableEnum.const_107,0);
      }
   }
}
