package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2445:int;
      
      private var var_2447:int;
      
      private var var_93:Array;
      
      private var var_229:Array;
      
      private var var_2446:int;
      
      private var var_2444:int;
      
      private var var_2442:int;
      
      private var var_2443:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_93 = new Array();
         this.var_229 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2445;
      }
      
      public function get friends() : Array
      {
         return this.var_229;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2446;
      }
      
      public function get categories() : Array
      {
         return this.var_93;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2447;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2443;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2443 = param1.readInteger();
         this.var_2446 = param1.readInteger();
         this.var_2445 = param1.readInteger();
         this.var_2442 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_93.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_229.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2447 = param1.readInteger();
         this.var_2444 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2442;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2444;
      }
   }
}
