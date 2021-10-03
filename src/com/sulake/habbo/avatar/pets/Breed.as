package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_616:String;
      
      private var _id:int;
      
      private var var_2330:String = "";
      
      private var var_2329:int;
      
      private var var_2328:String;
      
      private var var_1825:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2329 = parseInt(param1.@pattern);
         var_616 = String(param1.@gender);
         var_1825 = Boolean(parseInt(param1.@colorable));
         var_2330 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2330;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1825;
      }
      
      public function get gender() : String
      {
         return var_616;
      }
      
      public function get patternId() : int
      {
         return var_2329;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2328;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2328 = param1;
      }
   }
}
