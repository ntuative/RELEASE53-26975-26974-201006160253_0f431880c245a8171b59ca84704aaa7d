package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2221:int;
      
      private var var_439:Boolean;
      
      private var var_2222:Boolean;
      
      private var var_969:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2222 = param1.readBoolean();
         if(var_2222)
         {
            var_2221 = param1.readInteger();
            var_439 = param1.readBoolean();
         }
         else
         {
            var_969 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_969 != null)
         {
            var_969.dispose();
            var_969 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2221;
      }
      
      public function get owner() : Boolean
      {
         return var_439;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2222;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_969;
      }
   }
}
