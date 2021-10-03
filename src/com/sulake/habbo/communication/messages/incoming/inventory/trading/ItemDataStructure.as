package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1164:String;
      
      private var var_1819:int;
      
      private var var_1818:int;
      
      private var var_1519:int;
      
      private var var_1815:int;
      
      private var _category:int;
      
      private var var_2502:int;
      
      private var var_1813:int;
      
      private var var_1814:int;
      
      private var var_1812:int;
      
      private var var_1816:int;
      
      private var var_1817:Boolean;
      
      private var var_1477:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1819 = param1;
         var_1164 = param2;
         var_1818 = param3;
         var_1812 = param4;
         _category = param5;
         var_1477 = param6;
         var_1519 = param7;
         var_1814 = param8;
         var_1813 = param9;
         var_1816 = param10;
         var_1815 = param11;
         var_1817 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1812;
      }
      
      public function get extra() : int
      {
         return var_1519;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function get groupable() : Boolean
      {
         return var_1817;
      }
      
      public function get creationMonth() : int
      {
         return var_1816;
      }
      
      public function get roomItemID() : int
      {
         return var_1818;
      }
      
      public function get itemType() : String
      {
         return var_1164;
      }
      
      public function get itemID() : int
      {
         return var_1819;
      }
      
      public function get songID() : int
      {
         return var_1519;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1814;
      }
      
      public function get creationYear() : int
      {
         return var_1815;
      }
      
      public function get creationDay() : int
      {
         return var_1813;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
