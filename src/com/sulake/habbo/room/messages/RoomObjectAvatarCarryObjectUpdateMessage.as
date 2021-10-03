package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1164:int;
      
      private var var_1434:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1164 = param1;
         var_1434 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1164;
      }
      
      public function get itemName() : String
      {
         return var_1434;
      }
   }
}
