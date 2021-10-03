package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1946:Number;
      
      private var var_610:Number = 0;
      
      private var var_1947:Number;
      
      private var var_611:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1946 = param1;
         var_1947 = param2;
      }
      
      public function update() : void
      {
         var_611 += var_1947;
         var_610 += var_611;
         if(var_610 > 0)
         {
            var_610 = 0;
            var_611 = var_1946 * -1 * var_611;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_611 = param1;
         var_610 = 0;
      }
      
      public function get location() : Number
      {
         return var_610;
      }
   }
}
