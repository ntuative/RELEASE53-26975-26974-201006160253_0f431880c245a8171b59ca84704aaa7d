package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1838:Array;
      
      private var var_1841:String;
      
      private var var_1839:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1841 = param1;
         var_1838 = param2;
         var_1839 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1841;
      }
      
      public function get yieldList() : Array
      {
         return var_1838;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1839;
      }
   }
}
