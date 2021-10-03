package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1929:int;
      
      private var var_1423:int;
      
      private var var_744:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1423 = param1.readInteger();
         var_1929 = param1.readInteger();
         var_744 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_744.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1929;
      }
      
      public function get prizes() : Array
      {
         return var_744;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1423;
      }
   }
}
