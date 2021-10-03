package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_468:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_334:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_862:int;
      
      private var var_280:Boolean;
      
      private var var_2309:Boolean;
      
      private var var_1527:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_862 = param2;
         var_2309 = param3;
         var_280 = param4;
         var_1527 = param5;
      }
      
      public function get position() : int
      {
         return var_862;
      }
      
      public function get isActive() : Boolean
      {
         return var_280;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1527;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2309;
      }
   }
}
