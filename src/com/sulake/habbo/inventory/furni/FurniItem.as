package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2126:int;
      
      private var var_2215:Boolean;
      
      private var var_1715:int;
      
      private var var_1477:String;
      
      private var var_2306:Boolean = false;
      
      private var var_1738:int;
      
      private var var_472:int;
      
      private var var_1164:String;
      
      private var var_1574:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1291:int;
      
      private var var_2214:Boolean;
      
      private var var_2305:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_2126 = param1;
         var_1164 = param2;
         _objId = param3;
         var_1291 = param4;
         var_1477 = param5;
         var_2215 = param6;
         var_2214 = param7;
         var_1738 = param8;
         var_1574 = param9;
         var_1715 = param10;
         var_472 = -1;
      }
      
      public function get songId() : int
      {
         return var_1715;
      }
      
      public function get iconCallbackId() : int
      {
         return var_472;
      }
      
      public function get method_2() : int
      {
         return var_1738;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2305 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2306 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_472 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2214;
      }
      
      public function get slotId() : String
      {
         return var_1574;
      }
      
      public function get classId() : int
      {
         return var_1291;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2215;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_2126;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2306;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2305;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1164;
      }
   }
}
