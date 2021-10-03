package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_84:Number = 0;
      
      private var _data:String = "";
      
      private var var_1519:int = 0;
      
      private var var_36:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2311:Boolean = false;
      
      private var var_2500:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_224:String = "";
      
      private var var_2312:int = 0;
      
      private var var_2313:int = 0;
      
      private var var_2045:int = 0;
      
      private var var_2041:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2311 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2311;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_224;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_205)
         {
            var_2045 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_205)
         {
            var_2312 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_205)
         {
            var_2313 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_205)
         {
            var_224 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_205)
         {
            var_2041 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            var_36 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_2045;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2312;
      }
      
      public function get wallY() : Number
      {
         return var_2313;
      }
      
      public function get localY() : Number
      {
         return var_2041;
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_84 = param1;
         }
      }
   }
}
