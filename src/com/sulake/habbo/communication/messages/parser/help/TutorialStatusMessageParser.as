package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1149:Boolean;
      
      private var var_1148:Boolean;
      
      private var var_1150:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1149;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1148;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1150 = param1.readBoolean();
         var_1148 = param1.readBoolean();
         var_1149 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1150;
      }
      
      public function flush() : Boolean
      {
         var_1150 = false;
         var_1148 = false;
         var_1149 = false;
         return true;
      }
   }
}
