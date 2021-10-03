package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_415:String;
      
      private var var_1794:int;
      
      private var var_2264:String;
      
      private var var_1075:int;
      
      private var var_1368:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1368;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1368 = param1.readInteger();
         var_2264 = param1.readString();
         var_1794 = param1.readInteger();
         var_415 = param1.readString();
         var_1075 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2264;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function get petType() : int
      {
         return var_1075;
      }
      
      public function get level() : int
      {
         return var_1794;
      }
   }
}
