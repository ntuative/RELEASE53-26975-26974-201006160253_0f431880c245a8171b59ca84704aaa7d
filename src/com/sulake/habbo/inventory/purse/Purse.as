package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1803:Boolean = false;
      
      private var var_1804:int = 0;
      
      private var var_1607:int = 0;
      
      private var var_1805:int = 0;
      
      private var var_1806:Boolean = false;
      
      private var var_1610:int = 0;
      
      private var var_1606:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1610 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1804;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1803;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1803 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1806;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1804 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1607 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1610;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1806 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1805 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1607;
      }
      
      public function get pixelBalance() : int
      {
         return var_1805;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1606 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1606;
      }
   }
}
