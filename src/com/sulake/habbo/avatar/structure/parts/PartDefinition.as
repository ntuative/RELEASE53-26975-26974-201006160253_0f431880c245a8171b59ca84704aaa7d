package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1508:int = -1;
      
      private var var_1222:Boolean;
      
      private var var_1221:String;
      
      private var var_1753:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1753 = String(param1["set-type"]);
         var_1221 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1222 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1508 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1221;
      }
      
      public function get staticId() : int
      {
         return var_1508;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1508 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1222;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1222 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1221 = param1;
      }
      
      public function get setType() : String
      {
         return var_1753;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
