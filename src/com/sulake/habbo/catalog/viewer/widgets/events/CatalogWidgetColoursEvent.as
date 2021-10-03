package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1286:Array;
      
      private var var_1835:String;
      
      private var var_1834:String;
      
      private var var_1836:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1286 = param1;
         var_1835 = param2;
         var_1834 = param3;
         var_1836 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1286;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1835;
      }
      
      public function get colourAssetName() : String
      {
         return var_1834;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1836;
      }
   }
}
