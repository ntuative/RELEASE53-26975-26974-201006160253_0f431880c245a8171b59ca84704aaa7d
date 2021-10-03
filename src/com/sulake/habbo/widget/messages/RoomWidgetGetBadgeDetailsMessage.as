package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_727:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1042:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_727);
         var_1042 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1042;
      }
   }
}
