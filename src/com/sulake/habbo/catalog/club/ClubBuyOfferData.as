package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1765:int;
      
      private var var_1773:Boolean = false;
      
      private var var_1768:int;
      
      private var var_1764:int;
      
      private var var_1769:int;
      
      private var var_1294:String;
      
      private var var_1429:int;
      
      private var _offerId:int;
      
      private var var_1763:int;
      
      private var var_1766:Boolean;
      
      private var var_1767:Boolean;
      
      private var var_418:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1294 = param2;
         var_1429 = param3;
         var_1767 = param4;
         var_1766 = param5;
         var_1768 = param6;
         var_1769 = param7;
         var_1764 = param8;
         var_1765 = param9;
         var_1763 = param10;
      }
      
      public function get month() : int
      {
         return var_1765;
      }
      
      public function get page() : ICatalogPage
      {
         return var_418;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1766;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_418 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_325;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1767;
      }
      
      public function get localizationId() : String
      {
         return var_1294;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1769;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_1773;
      }
      
      public function get day() : int
      {
         return var_1763;
      }
      
      public function get year() : int
      {
         return var_1764;
      }
      
      public function get price() : int
      {
         return var_1429;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_1773 = param1;
      }
      
      public function get periods() : int
      {
         return var_1768;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1429;
      }
      
      public function get productCode() : String
      {
         return var_1294;
      }
   }
}
