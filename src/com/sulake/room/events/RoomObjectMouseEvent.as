package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1588:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1587:String = "ROE_MOUSE_ENTER";
      
      public static const const_498:String = "ROE_MOUSE_MOVE";
      
      public static const const_1714:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_219:String = "ROE_MOUSE_CLICK";
      
      public static const const_441:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2042:Boolean;
      
      private var var_2037:Boolean;
      
      private var var_2043:Boolean;
      
      private var var_2044:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2043 = param4;
         var_2044 = param5;
         var_2042 = param6;
         var_2037 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2037;
      }
      
      public function get altKey() : Boolean
      {
         return var_2043;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2044;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2042;
      }
   }
}
