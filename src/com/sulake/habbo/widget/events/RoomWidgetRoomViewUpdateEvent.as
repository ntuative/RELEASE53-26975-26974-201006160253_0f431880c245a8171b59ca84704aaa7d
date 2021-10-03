package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_646:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_659:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_281:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1603:Point;
      
      private var var_1604:Rectangle;
      
      private var var_152:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1604 = param2;
         var_1603 = param3;
         var_152 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1604 != null)
         {
            return var_1604.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_152;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1603 != null)
         {
            return var_1603.clone();
         }
         return null;
      }
   }
}
