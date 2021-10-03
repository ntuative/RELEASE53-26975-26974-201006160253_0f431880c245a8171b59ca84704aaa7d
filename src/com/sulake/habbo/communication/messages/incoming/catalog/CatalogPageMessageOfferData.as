package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_953:Array;
      
      private var var_917:int;
      
      private var var_1349:String;
      
      private var _offerId:int;
      
      private var var_918:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1349 = param1.readString();
         var_917 = param1.readInteger();
         var_918 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_953 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_953.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_953;
      }
      
      public function get priceInCredits() : int
      {
         return var_917;
      }
      
      public function get localizationId() : String
      {
         return var_1349;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_918;
      }
   }
}
