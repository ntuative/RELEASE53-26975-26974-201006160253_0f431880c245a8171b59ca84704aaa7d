package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1765:int;
      
      private var var_1429:int;
      
      private var var_1768:int;
      
      private var _offerId:int;
      
      private var var_1764:int;
      
      private var var_1763:int;
      
      private var var_1766:Boolean;
      
      private var var_1769:int;
      
      private var var_1767:Boolean;
      
      private var var_1294:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1294 = param1.readString();
         var_1429 = param1.readInteger();
         var_1767 = param1.readBoolean();
         var_1766 = param1.readBoolean();
         var_1768 = param1.readInteger();
         var_1769 = param1.readInteger();
         var_1764 = param1.readInteger();
         var_1765 = param1.readInteger();
         var_1763 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1764;
      }
      
      public function get month() : int
      {
         return var_1765;
      }
      
      public function get price() : int
      {
         return var_1429;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1768;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1769;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1767;
      }
      
      public function get day() : int
      {
         return var_1763;
      }
      
      public function get vip() : Boolean
      {
         return var_1766;
      }
      
      public function get productCode() : String
      {
         return var_1294;
      }
   }
}
