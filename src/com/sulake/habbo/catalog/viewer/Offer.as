package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1001:String = "price_type_none";
      
      public static const const_499:String = "pricing_model_multi";
      
      public static const const_325:String = "price_type_credits";
      
      public static const const_486:String = "price_type_credits_and_pixels";
      
      public static const const_385:String = "pricing_model_bundle";
      
      public static const const_423:String = "pricing_model_single";
      
      public static const const_532:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1318:String = "pricing_model_unknown";
      
      public static const const_431:String = "price_type_pixels";
       
      
      private var var_2086:int;
      
      private var var_917:int;
      
      private var _offerId:int;
      
      private var var_918:int;
      
      private var var_426:String;
      
      private var var_631:String;
      
      private var var_418:ICatalogPage;
      
      private var var_425:IProductContainer;
      
      private var var_1349:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1349 = param1.localizationId;
         var_917 = param1.priceInCredits;
         var_918 = param1.priceInPixels;
         var_418 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_426;
      }
      
      public function get page() : ICatalogPage
      {
         return var_418;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2086 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_425;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_918;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1349 = "";
         var_917 = 0;
         var_918 = 0;
         var_418 = null;
         if(var_425 != null)
         {
            var_425.dispose();
            var_425 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2086;
      }
      
      public function get priceInCredits() : int
      {
         return var_917;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_426 = const_423;
            }
            else
            {
               var_426 = const_499;
            }
         }
         else if(param1.length > 1)
         {
            var_426 = const_385;
         }
         else
         {
            var_426 = const_1318;
         }
      }
      
      public function get priceType() : String
      {
         return var_631;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_426)
         {
            case const_423:
               var_425 = new SingleProductContainer(this,param1);
               break;
            case const_499:
               var_425 = new MultiProductContainer(this,param1);
               break;
            case const_385:
               var_425 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_426);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1349;
      }
      
      private function analyzePriceType() : void
      {
         if(var_917 > 0 && var_918 > 0)
         {
            var_631 = const_486;
         }
         else if(var_917 > 0)
         {
            var_631 = const_325;
         }
         else if(var_918 > 0)
         {
            var_631 = const_431;
         }
         else
         {
            var_631 = const_1001;
         }
      }
   }
}
