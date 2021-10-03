package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1568:String;
      
      private var var_684:String;
      
      private var var_1566:String;
      
      private var var_1567:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1567 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1568 = _loc5_[0];
         var_1566 = _loc5_[1];
         _name = param2;
         var_684 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1568;
      }
      
      public function get languageCode() : String
      {
         return var_1567;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_684;
      }
      
      public function get encoding() : String
      {
         return var_1566;
      }
      
      public function get id() : String
      {
         return var_1567 + "_" + var_1568 + "." + var_1566;
      }
   }
}
