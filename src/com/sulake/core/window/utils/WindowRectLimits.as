package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_420:int = -2.147483648E9;
      
      private var var_423:int = 2.147483647E9;
      
      private var var_422:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_421:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_423;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_421 == int.MIN_VALUE && var_423 == int.MAX_VALUE && var_420 == int.MIN_VALUE && var_422 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_423 = param1;
         if(var_423 < int.MAX_VALUE && true && _target.width > var_423)
         {
            _target.width = var_423;
         }
      }
      
      public function setEmpty() : void
      {
         var_421 = int.MIN_VALUE;
         var_423 = int.MAX_VALUE;
         var_420 = int.MIN_VALUE;
         var_422 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_422 = param1;
         if(var_422 < int.MAX_VALUE && true && _target.height > var_422)
         {
            _target.height = var_422;
         }
      }
      
      public function get minHeight() : int
      {
         return var_420;
      }
      
      public function get minWidth() : int
      {
         return var_421;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_421 = var_421;
         _loc2_.var_423 = var_423;
         _loc2_.var_420 = var_420;
         _loc2_.var_422 = var_422;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_421 = param1;
         if(var_421 > int.MIN_VALUE && true && _target.width < var_421)
         {
            _target.width = var_421;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_420 = param1;
         if(var_420 > int.MIN_VALUE && true && _target.height < var_420)
         {
            _target.height = var_420;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_422;
      }
   }
}
