package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1886:int;
      
      private var var_1885:String;
      
      private var var_1069:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1069 = param1.readInteger();
         this.var_1885 = param1.readString();
         this.var_1886 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1069;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1886;
      }
      
      public function get requesterName() : String
      {
         return this.var_1885;
      }
   }
}
