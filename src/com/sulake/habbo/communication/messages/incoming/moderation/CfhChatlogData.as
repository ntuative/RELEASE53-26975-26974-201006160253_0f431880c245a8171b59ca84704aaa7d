package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1974:int;
      
      private var var_1119:int;
      
      private var var_1975:int;
      
      private var var_1569:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1569 = param1.readInteger();
         var_1975 = param1.readInteger();
         var_1119 = param1.readInteger();
         var_1974 = param1.readInteger();
         var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1569);
      }
      
      public function get chatRecordId() : int
      {
         return var_1974;
      }
      
      public function get reportedUserId() : int
      {
         return var_1119;
      }
      
      public function get callerUserId() : int
      {
         return var_1975;
      }
      
      public function get callId() : int
      {
         return var_1569;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_113;
      }
   }
}
