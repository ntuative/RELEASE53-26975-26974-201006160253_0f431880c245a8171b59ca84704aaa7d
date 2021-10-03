package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_415:String = "";
      
      private var var_1956:String = "";
      
      private var var_1955:int = 0;
      
      private var var_1957:int = 0;
      
      private var _type:int = 0;
      
      private var var_1954:String = "";
      
      private var var_653:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1958:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1955 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1954 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_415 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_653 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1955;
      }
      
      public function set webID(param1:int) : void
      {
         var_1958 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1954;
      }
      
      public function set custom(param1:String) : void
      {
         var_1956 = param1;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function get sex() : String
      {
         return var_653;
      }
      
      public function get custom() : String
      {
         return var_1956;
      }
      
      public function get webID() : int
      {
         return var_1958;
      }
      
      public function set xp(param1:int) : void
      {
         var_1957 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1957;
      }
   }
}
