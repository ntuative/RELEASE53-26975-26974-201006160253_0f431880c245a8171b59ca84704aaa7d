package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1446:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_987:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1446 = param1;
         var_987 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_987;
      }
      
      public function get identifier() : IID
      {
         return var_1446;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1446 = null;
            while(false)
            {
               var_987.pop();
            }
            var_987 = null;
         }
      }
   }
}
