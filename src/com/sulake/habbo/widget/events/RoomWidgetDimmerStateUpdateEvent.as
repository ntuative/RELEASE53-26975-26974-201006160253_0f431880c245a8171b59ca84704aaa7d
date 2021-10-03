package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_63:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1129:int;
      
      private var _color:uint;
      
      private var var_1130:int;
      
      private var var_1850:int;
      
      private var var_36:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_63,param6,param7);
         var_36 = param1;
         var_1850 = param2;
         var_1129 = param3;
         _color = param4;
         var_1130 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1130;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1129;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function get presetId() : int
      {
         return var_1850;
      }
   }
}
