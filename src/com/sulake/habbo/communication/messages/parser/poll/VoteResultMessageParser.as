package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1447:int;
      
      private var var_1151:String;
      
      private var var_753:Array;
      
      private var var_1048:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_753.slice();
      }
      
      public function flush() : Boolean
      {
         var_1151 = "";
         var_1048 = [];
         var_753 = [];
         var_1447 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1447;
      }
      
      public function get question() : String
      {
         return var_1151;
      }
      
      public function get choices() : Array
      {
         return var_1048.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1151 = param1.readString();
         var_1048 = [];
         var_753 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1048.push(param1.readString());
            var_753.push(param1.readInteger());
            _loc3_++;
         }
         var_1447 = param1.readInteger();
         return true;
      }
   }
}
