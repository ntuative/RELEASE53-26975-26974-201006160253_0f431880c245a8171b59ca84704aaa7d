package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class IdentityAccountsMessageParser implements IMessageParser
   {
       
      
      private var var_1666:Map;
      
      public function IdentityAccountsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1666 = new Map();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1666.add(param1.readInteger(),param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get accounts() : Map
      {
         return var_1666;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
