package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1595:Array;
      
      private var var_1891:int;
      
      private var var_1889:int;
      
      private var var_1888:int;
      
      private var var_1890:int;
      
      private var _dayOffsets:Array;
      
      private var var_1887:int;
      
      private var var_1596:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1595;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1595 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1889;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1596 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1891 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1888;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1890;
      }
      
      public function get offerCount() : int
      {
         return var_1887;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1887 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1596;
      }
      
      public function get averagePrice() : int
      {
         return var_1891;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1890 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1888 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1889 = param1;
      }
   }
}
