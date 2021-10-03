package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_117:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1267:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_117);
         var_1267 = param1;
      }
      
      public function get method_3() : int
      {
         return var_1267;
      }
   }
}
