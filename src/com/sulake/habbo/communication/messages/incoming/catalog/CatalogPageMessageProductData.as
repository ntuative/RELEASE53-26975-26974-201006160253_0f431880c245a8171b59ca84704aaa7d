package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_248:String = "e";
      
      public static const const_83:String = "i";
      
      public static const const_84:String = "s";
       
      
      private var var_1026:String;
      
      private var var_1225:String;
      
      private var var_1227:int;
      
      private var var_2032:int;
      
      private var var_1025:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1225 = param1.readString();
         var_2032 = param1.readInteger();
         var_1026 = param1.readString();
         var_1025 = param1.readInteger();
         var_1227 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1025;
      }
      
      public function get productType() : String
      {
         return var_1225;
      }
      
      public function get expiration() : int
      {
         return var_1227;
      }
      
      public function get furniClassId() : int
      {
         return var_2032;
      }
      
      public function get extraParam() : String
      {
         return var_1026;
      }
   }
}
