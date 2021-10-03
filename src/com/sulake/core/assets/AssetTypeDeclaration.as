package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2220:Class;
      
      private var var_2218:Class;
      
      private var var_2219:String;
      
      private var var_1416:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2219 = param1;
         var_2218 = param2;
         var_2220 = param3;
         if(rest == null)
         {
            var_1416 = new Array();
         }
         else
         {
            var_1416 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2220;
      }
      
      public function get assetClass() : Class
      {
         return var_2218;
      }
      
      public function get mimeType() : String
      {
         return var_2219;
      }
      
      public function get fileTypes() : Array
      {
         return var_1416;
      }
   }
}
