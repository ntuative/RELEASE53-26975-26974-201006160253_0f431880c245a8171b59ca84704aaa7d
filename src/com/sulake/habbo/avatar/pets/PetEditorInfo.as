package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1937:Boolean;
      
      private var var_1938:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1937 = Boolean(parseInt(param1.@club));
         var_1938 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1937;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1938;
      }
   }
}
