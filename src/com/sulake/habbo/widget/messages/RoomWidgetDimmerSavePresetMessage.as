package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_621:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1756:int;
      
      private var var_1759:int;
      
      private var var_1992:Boolean;
      
      private var var_1130:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_621);
         var_1759 = param1;
         var_1756 = param2;
         _color = param3;
         var_1130 = param4;
         var_1992 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1756;
      }
      
      public function get presetNumber() : int
      {
         return var_1759;
      }
      
      public function get brightness() : int
      {
         return var_1130;
      }
      
      public function get apply() : Boolean
      {
         return var_1992;
      }
   }
}
