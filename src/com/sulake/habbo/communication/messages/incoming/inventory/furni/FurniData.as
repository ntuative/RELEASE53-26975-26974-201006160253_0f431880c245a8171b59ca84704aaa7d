package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1477:String;
      
      private var var_1164:String;
      
      private var var_2212:Boolean;
      
      private var var_1519:int;
      
      private var var_2126:int;
      
      private var var_2213:Boolean;
      
      private var var_1574:String = "";
      
      private var var_2215:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1291:int;
      
      private var var_2214:Boolean;
      
      private var var_1715:int = -1;
      
      private var var_1738:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2126 = param1;
         var_1164 = param2;
         _objId = param3;
         var_1291 = param4;
         _category = param5;
         var_1477 = param6;
         var_2212 = param7;
         var_2215 = param8;
         var_2214 = param9;
         var_2213 = param10;
         var_1738 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1574;
      }
      
      public function get extra() : int
      {
         return var_1519;
      }
      
      public function get classId() : int
      {
         return var_1291;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2213;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2212;
      }
      
      public function get stripId() : int
      {
         return var_2126;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function get songId() : int
      {
         return var_1715;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1574 = param1;
         var_1519 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1164;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get method_2() : int
      {
         return var_1738;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2214;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2215;
      }
   }
}
