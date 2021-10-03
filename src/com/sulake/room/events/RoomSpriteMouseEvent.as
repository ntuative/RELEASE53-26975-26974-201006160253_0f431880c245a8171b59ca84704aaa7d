package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2037:Boolean = false;
      
      private var var_2043:Boolean = false;
      
      private var var_2038:String = "";
      
      private var _type:String = "";
      
      private var var_2042:Boolean = false;
      
      private var var_2045:Number = 0;
      
      private var var_2036:Number = 0;
      
      private var var_2040:Number = 0;
      
      private var var_2039:String = "";
      
      private var var_2041:Number = 0;
      
      private var var_2044:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2039 = param2;
         var_2038 = param3;
         var_2036 = param4;
         var_2040 = param5;
         var_2045 = param6;
         var_2041 = param7;
         var_2044 = param8;
         var_2043 = param9;
         var_2042 = param10;
         var_2037 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2044;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2037;
      }
      
      public function get localX() : Number
      {
         return var_2045;
      }
      
      public function get localY() : Number
      {
         return var_2041;
      }
      
      public function get canvasId() : String
      {
         return var_2039;
      }
      
      public function get altKey() : Boolean
      {
         return var_2043;
      }
      
      public function get spriteTag() : String
      {
         return var_2038;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2036;
      }
      
      public function get screenY() : Number
      {
         return var_2040;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2042;
      }
   }
}
