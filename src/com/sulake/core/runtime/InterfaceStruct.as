package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_441:uint;
      
      private var var_1116:IUnknown;
      
      private var var_1375:String;
      
      private var var_1115:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1115 = param1;
         var_1375 = getQualifiedClassName(var_1115);
         var_1116 = param2;
         var_441 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1115;
      }
      
      public function get disposed() : Boolean
      {
         return var_1116 == null;
      }
      
      public function get references() : uint
      {
         return var_441;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_441) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1116;
      }
      
      public function get iis() : String
      {
         return var_1375;
      }
      
      public function reserve() : uint
      {
         return ++var_441;
      }
      
      public function dispose() : void
      {
         var_1115 = null;
         var_1375 = null;
         var_1116 = null;
         var_441 = 0;
      }
   }
}
