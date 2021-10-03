package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_479:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_510:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_81:String = "RWPDUE_CONTENTS";
      
      public static const const_376:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_448:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_66:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_206:String;
      
      private var var_1781:BitmapData;
      
      private var var_163:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_163 = param2;
         var_206 = param3;
         _controller = param4;
         var_1781 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1781;
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
