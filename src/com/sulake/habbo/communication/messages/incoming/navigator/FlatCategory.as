package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_355:Boolean;
      
      private var var_1467:int;
      
      private var var_1651:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1467 = param1.readInteger();
         var_1651 = param1.readString();
         var_355 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_355;
      }
      
      public function get nodeName() : String
      {
         return var_1651;
      }
      
      public function get nodeId() : int
      {
         return var_1467;
      }
   }
}
