package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1181:String = "F";
      
      public static const const_900:String = "M";
       
      
      private var var_83:Number = 0;
      
      private var var_415:String = "";
      
      private var var_2162:int = 0;
      
      private var var_1956:String = "";
      
      private var var_1955:int = 0;
      
      private var var_1957:int = 0;
      
      private var var_1954:String = "";
      
      private var var_653:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_224:int = 0;
      
      private var var_2161:String = "";
      
      private var _name:String = "";
      
      private var var_1958:int = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_224 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_205)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2162;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_205)
         {
            var_1955 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2161;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_205)
         {
            var_1954 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_205)
         {
            var_2161 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_205)
         {
            var_1957 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_205)
         {
            var_415 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_205)
         {
            var_2162 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_205)
         {
            var_653 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1955;
      }
      
      public function get groupID() : String
      {
         return var_1954;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_205)
         {
            var_1958 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_205)
         {
            var_1956 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get sex() : String
      {
         return var_653;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function get webID() : int
      {
         return var_1958;
      }
      
      public function get custom() : String
      {
         return var_1956;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_84 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_83 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1957;
      }
   }
}
