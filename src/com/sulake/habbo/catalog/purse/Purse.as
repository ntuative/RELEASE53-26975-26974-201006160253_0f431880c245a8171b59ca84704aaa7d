package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2100:int = 0;
      
      private var var_1607:int = 0;
      
      private var var_1806:Boolean = false;
      
      private var var_2018:int = 0;
      
      private var var_2099:int = 0;
      
      private var var_1606:int = 0;
      
      private var var_2101:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1607;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1607 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1806 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_2101 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1607 > 0 || var_1606 > 0;
      }
      
      public function get credits() : int
      {
         return var_2018;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_2099 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1606;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1806;
      }
      
      public function get pastClubDays() : int
      {
         return var_2101;
      }
      
      public function get pastVipDays() : int
      {
         return var_2099;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2100 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2100;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1606 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2018 = param1;
      }
   }
}
