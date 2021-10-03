package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_1002:int = 3;
      
      public static var var_1006:int = 5;
      
      public static var var_1186:int = 7;
      
      public static var var_679:int = 0;
      
      public static var var_1185:int = 6;
      
      public static var var_1007:int = 4;
      
      public static var var_1005:int = 2;
      
      public static var var_1004:int = 1;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_7 as ChangeUserNameResultMessageParser;
      }
   }
}
