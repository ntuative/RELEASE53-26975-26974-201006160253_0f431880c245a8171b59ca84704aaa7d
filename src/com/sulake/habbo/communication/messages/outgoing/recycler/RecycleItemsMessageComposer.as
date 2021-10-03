package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_938:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_938 = new Array();
         var_938.push(param1.length);
         var_938 = var_938.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_938;
      }
   }
}
