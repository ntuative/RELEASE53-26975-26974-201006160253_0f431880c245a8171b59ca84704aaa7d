package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_494:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_764:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_767:String;
      
      private var var_163:int;
      
      private var var_206:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_163 = param2;
         var_206 = param3;
         var_767 = param4;
      }
      
      public function get objectId() : int
      {
         return var_163;
      }
      
      public function get text() : String
      {
         return var_206;
      }
      
      public function get colorHex() : String
      {
         return var_767;
      }
   }
}
