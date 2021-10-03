package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_2267:int;
      
      private var var_1429:int;
      
      private var var_1891:int;
      
      private var var_2025:int = -1;
      
      private var var_153:int;
      
      private var var_1754:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1428:int;
      
      private var _furniId:int;
      
      private var var_1477:String;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1754 = param3;
         var_1477 = param4;
         var_1429 = param5;
         var_153 = param6;
         var_1891 = param7;
         var_1428 = param8;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get furniType() : int
      {
         return var_1754;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_2267 = param1;
      }
      
      public function get price() : int
      {
         return var_1429;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function get imageCallback() : int
      {
         return var_2267;
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
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_2025 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1429 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1428 = param1;
      }
      
      public function get status() : int
      {
         return var_153;
      }
      
      public function get averagePrice() : int
      {
         return var_1891;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
   }
}
