package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetItemDataMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_163:int = 0;
      
      public function GetItemDataMessageComposer(param1:int, param2:int = 0, param3:int = 0)
      {
         super();
         var_163 = param1;
         _roomId = param2;
         _roomCategory = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_163];
      }
      
      public function dispose() : void
      {
      }
   }
}
