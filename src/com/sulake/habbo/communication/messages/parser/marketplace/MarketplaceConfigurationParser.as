package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1962:int;
      
      private var var_1562:int;
      
      private var var_1964:int;
      
      private var var_1961:int;
      
      private var var_1963:int;
      
      private var var_1563:int;
      
      private var var_1966:int;
      
      private var var_1315:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1962;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1562;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1966;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1961;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1963;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1563;
      }
      
      public function get commission() : int
      {
         return var_1964;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1315 = param1.readBoolean();
         var_1964 = param1.readInteger();
         var_1562 = param1.readInteger();
         var_1563 = param1.readInteger();
         var_1961 = param1.readInteger();
         var_1962 = param1.readInteger();
         var_1963 = param1.readInteger();
         var_1966 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1315;
      }
   }
}
