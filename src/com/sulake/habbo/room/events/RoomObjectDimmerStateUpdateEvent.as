package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_63:String = "RODSUE_DIMMER_STATE";
       
      
      private var var_1129:int;
      
      private var _color:uint;
      
      private var var_1130:int;
      
      private var var_1850:int;
      
      private var var_36:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:int, param2:String, param3:int, param4:int, param5:int, param6:uint, param7:int, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_63,param1,param2,param8,param9);
         var_36 = param3;
         var_1850 = param4;
         var_1129 = param5;
         _color = param6;
         var_1130 = param7;
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
