package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_539:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_749:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_686:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var _effectType:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         _effectType = param2;
      }
      
      public function get effectType() : int
      {
         return _effectType;
      }
   }
}
