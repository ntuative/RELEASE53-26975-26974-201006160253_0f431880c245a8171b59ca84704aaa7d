package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1794:int;
      
      private var var_1918:int;
      
      private var var_1735:int;
      
      private var var_1790:int;
      
      private var _nutrition:int;
      
      private var var_1368:int;
      
      private var var_1788:int;
      
      private var var_1791:int;
      
      private var _energy:int;
      
      private var var_1796:int;
      
      private var var_1797:int;
      
      private var _ownerName:String;
      
      private var var_1789:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1794;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1918 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1794 = param1;
      }
      
      public function get petId() : int
      {
         return var_1368;
      }
      
      public function get experienceMax() : int
      {
         return var_1791;
      }
      
      public function get nutritionMax() : int
      {
         return var_1790;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1788 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1789;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1368 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1797;
      }
      
      public function get respect() : int
      {
         return var_1918;
      }
      
      public function get levelMax() : int
      {
         return var_1788;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1791 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1735 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1790 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1789 = param1;
      }
      
      public function get experience() : int
      {
         return var_1735;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1797 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1796 = param1;
      }
      
      public function get age() : int
      {
         return var_1796;
      }
   }
}
