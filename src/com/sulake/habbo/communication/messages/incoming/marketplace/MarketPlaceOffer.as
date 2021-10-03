package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1429:int;
      
      private var var_1891:int;
      
      private var var_2025:int = -1;
      
      private var var_153:int;
      
      private var var_1754:int;
      
      private var _offerId:int;
      
      private var var_1428:int;
      
      private var _furniId:int;
      
      private var var_1477:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1754 = param3;
         var_1477 = param4;
         var_1429 = param5;
         var_153 = param6;
         var_2025 = param7;
         var_1891 = param8;
         var_1428 = param9;
      }
      
      public function get status() : int
      {
         return var_153;
      }
      
      public function get price() : int
      {
         return var_1429;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2025;
      }
      
      public function get offerCount() : int
      {
         return var_1428;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1754;
      }
      
      public function get averagePrice() : int
      {
         return var_1891;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
   }
}
