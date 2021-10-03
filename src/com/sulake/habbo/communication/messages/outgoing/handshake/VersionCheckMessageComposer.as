package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2287:String;
      
      private var var_1401:String;
      
      private var var_2288:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2288 = param1;
         var_1401 = param2;
         var_2287 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2288,var_1401,var_2287];
      }
      
      public function dispose() : void
      {
      }
   }
}
