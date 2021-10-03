package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1019:int = 0;
      
      private var var_1385:int = 0;
      
      private var var_1726:String = "";
      
      private var var_1020:int = 0;
      
      private var var_2165:String = "";
      
      private var var_2164:int = 0;
      
      private var var_1490:String = "";
      
      private var var_2054:int = 0;
      
      private var var_2166:int = 0;
      
      private var var_1724:String = "";
      
      private var var_2163:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2054 = param1;
         var_1724 = param2;
         var_1490 = param3;
         var_1726 = param4;
         var_2165 = param5;
         if(param6)
         {
            var_1385 = 1;
         }
         else
         {
            var_1385 = 0;
         }
         var_2164 = param7;
         var_2166 = param8;
         var_1020 = param9;
         var_2163 = param10;
         var_1019 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2054,var_1724,var_1490,var_1726,var_2165,var_1385,var_2164,var_2166,var_1020,var_2163,var_1019];
      }
      
      public function dispose() : void
      {
      }
   }
}
