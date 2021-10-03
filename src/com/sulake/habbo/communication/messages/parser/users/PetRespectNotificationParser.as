package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1918:int;
      
      private var var_1247:PetData;
      
      private var var_1919:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1918;
      }
      
      public function get petData() : PetData
      {
         return var_1247;
      }
      
      public function flush() : Boolean
      {
         var_1247 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1919;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1918 = param1.readInteger();
         var_1919 = param1.readInteger();
         var_1247 = new PetData(param1);
         return true;
      }
   }
}
