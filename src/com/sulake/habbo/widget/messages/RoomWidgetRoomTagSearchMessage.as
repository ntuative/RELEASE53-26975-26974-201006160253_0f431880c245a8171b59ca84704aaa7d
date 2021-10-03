package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_732:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1777:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_732);
         var_1777 = param1;
      }
      
      public function get tag() : String
      {
         return var_1777;
      }
   }
}
