package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_2038:String = "";
      
      private var var_163:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_2038 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_163 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_2038;
      }
      
      public function get objectId() : String
      {
         return var_163;
      }
   }
}
