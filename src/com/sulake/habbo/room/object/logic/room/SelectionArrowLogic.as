package com.sulake.habbo.room.object.logic.room
{
   import com.sulake.habbo.room.messages.RoomObjectVisibilityUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   
   public class SelectionArrowLogic extends ObjectLogicBase
   {
       
      
      public function SelectionArrowLogic()
      {
         super();
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(_loc2_ != null)
         {
            _loc2_.setNumber(RoomObjectVariableEnum.const_238,1);
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectVisibilityUpdateMessage = param1 as RoomObjectVisibilityUpdateMessage;
         if(_loc2_ != null)
         {
            _loc3_ = object.getModelController();
            if(_loc2_.type == RoomObjectVisibilityUpdateMessage.const_461)
            {
               if(_loc3_ != null)
               {
                  _loc3_.setNumber(RoomObjectVariableEnum.const_107,Number(true));
               }
            }
            else if(_loc2_.type == RoomObjectVisibilityUpdateMessage.const_420)
            {
               if(_loc3_ != null)
               {
                  _loc3_.setNumber(RoomObjectVariableEnum.const_107,Number(false));
               }
            }
         }
      }
   }
}
