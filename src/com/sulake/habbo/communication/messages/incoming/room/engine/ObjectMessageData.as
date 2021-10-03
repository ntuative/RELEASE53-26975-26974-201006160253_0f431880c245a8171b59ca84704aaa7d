package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1066:int = 0;
      
      private var _data:String = "";
      
      private var var_1519:int = -1;
      
      private var var_36:int = 0;
      
      private var _type:int = 0;
      
      private var var_1068:int = 0;
      
      private var var_2500:String = "";
      
      private var var_1738:int = 0;
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_224:int = 0;
      
      private var var_1739:String = null;
      
      private var var_83:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function get extra() : int
      {
         return var_1519;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_224 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_83 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_205)
         {
            var_1519 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            var_36 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get method_2() : int
      {
         return var_1738;
      }
      
      public function get staticClass() : String
      {
         return var_1739;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set method_2(param1:int) : void
      {
         if(!var_205)
         {
            var_1738 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_205)
         {
            var_1739 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_205)
         {
            var_1066 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_205)
         {
            var_1068 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_84 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1066;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get sizeY() : int
      {
         return var_1068;
      }
   }
}
