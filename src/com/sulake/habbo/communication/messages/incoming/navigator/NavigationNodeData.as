package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1467:int;
      
      private var var_1651:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1467 = param1;
         var_1651 = param2;
         Logger.log("READ NODE: " + var_1467 + ", " + var_1651);
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
