package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_135:int = 0;
      
      public static const const_129:int = 1;
      
      public static const const_105:int = 2;
      
      public static const const_664:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1458:int = 0;
      
      private var var_2094:String = "";
      
      private var var_206:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_206 = param2;
         var_1458 = param3;
         var_2094 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2094;
      }
      
      public function get chatType() : int
      {
         return var_1458;
      }
      
      public function get text() : String
      {
         return var_206;
      }
   }
}
