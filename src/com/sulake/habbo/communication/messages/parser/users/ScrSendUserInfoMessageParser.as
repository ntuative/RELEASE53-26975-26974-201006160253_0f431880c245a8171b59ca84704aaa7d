package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1296:int = 2;
      
      public static const const_1713:int = 1;
       
      
      private var var_2291:int;
      
      private var var_2290:int;
      
      private var var_1806:Boolean;
      
      private var var_2293:int;
      
      private var var_1283:String;
      
      private var var_2289:Boolean;
      
      private var var_2099:int;
      
      private var var_2292:int;
      
      private var var_2101:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2290;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1806;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2292;
      }
      
      public function get memberPeriods() : int
      {
         return var_2293;
      }
      
      public function get productName() : String
      {
         return var_1283;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2289;
      }
      
      public function get responseType() : int
      {
         return var_2291;
      }
      
      public function get pastClubDays() : int
      {
         return var_2101;
      }
      
      public function get pastVipDays() : int
      {
         return var_2099;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1283 = param1.readString();
         var_2290 = param1.readInteger();
         var_2293 = param1.readInteger();
         var_2292 = param1.readInteger();
         var_2291 = param1.readInteger();
         var_2289 = param1.readBoolean();
         var_1806 = param1.readBoolean();
         var_2101 = param1.readInteger();
         var_2099 = param1.readInteger();
         return true;
      }
   }
}
