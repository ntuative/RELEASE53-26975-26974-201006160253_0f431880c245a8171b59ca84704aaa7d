package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1605:String;
      
      private var var_1521:String;
      
      private var var_1105:String;
      
      private var var_436:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1605 = String(param1.@align);
         var_1105 = String(param1.@base);
         var_1521 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_436 = Number(_loc2_);
            if(var_436 > 1)
            {
               var_436 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1605;
      }
      
      public function get ink() : String
      {
         return var_1521;
      }
      
      public function get base() : String
      {
         return var_1105;
      }
      
      public function get isBlended() : Boolean
      {
         return var_436 != 1;
      }
      
      public function get blend() : Number
      {
         return var_436;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
