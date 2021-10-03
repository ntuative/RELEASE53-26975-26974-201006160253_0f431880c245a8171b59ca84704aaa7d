package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_698:int = 2;
      
      public static const const_914:int = 6;
      
      public static const const_735:int = 1;
      
      public static const const_743:int = 3;
      
      public static const const_977:int = 4;
      
      public static const const_531:int = 5;
       
      
      private var var_1729:String;
      
      private var var_1180:int;
      
      private var var_1730:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1180 = param2;
         var_1730 = param3;
         var_1729 = param4;
      }
      
      public function get time() : String
      {
         return var_1729;
      }
      
      public function get senderId() : int
      {
         return var_1180;
      }
      
      public function get messageText() : String
      {
         return var_1730;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
