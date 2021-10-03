package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;
   
   public class RecyclerStatusMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1363:int = 3;
      
      public static const const_909:int = 2;
      
      public static const const_1371:int = 1;
       
      
      public function RecyclerStatusMessageEvent(param1:Function)
      {
         super(param1,RecyclerStatusMessageParser);
      }
      
      public function getParser() : RecyclerStatusMessageParser
      {
         return var_7 as RecyclerStatusMessageParser;
      }
   }
}
