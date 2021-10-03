package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_1327:String;
      
      private var var_1551:String;
      
      private var var_2000:int;
      
      private var var_2001:int;
      
      private var var_316:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         super();
         var_316 = param1.readInteger();
         var_1327 = param1.readString();
         var_1551 = param1.readString();
         var_2001 = param1.readInteger();
         var_2000 = param1.readInteger();
      }
      
      public function get params() : String
      {
         return var_1551;
      }
      
      public function get cooldownPeriod() : int
      {
         return var_2000;
      }
      
      public function get performCount() : int
      {
         return var_2001;
      }
      
      public function get stuffId() : int
      {
         return var_316;
      }
      
      public function get stuffName() : String
      {
         return var_1327;
      }
   }
}
