package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_559:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_206:String;
      
      private var var_767:String;
      
      private var var_1626:String;
      
      private var var_163:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_163 = param2;
         var_1626 = param3;
         var_206 = param4;
         var_767 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1626;
      }
      
      public function get colorHex() : String
      {
         return var_767;
      }
      
      public function get text() : String
      {
         return var_206;
      }
      
      public function get objectId() : int
      {
         return var_163;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
