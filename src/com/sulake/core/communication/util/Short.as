package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_799:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_799 = new ByteArray();
         var_799.writeShort(param1);
         var_799.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_799.position = 0;
         if(false)
         {
            _loc1_ = var_799.readShort();
            var_799.position = 0;
         }
         return _loc1_;
      }
   }
}
