package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2340:int;
      
      private var var_2341:Boolean;
      
      private var _offerId:int;
      
      private var var_1938:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2341 = param1.readBoolean();
         var_2340 = param1.readInteger();
         var_1938 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1938;
      }
      
      public function get monthsRequired() : int
      {
         return var_2340;
      }
      
      public function get isVip() : Boolean
      {
         return var_2341;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
