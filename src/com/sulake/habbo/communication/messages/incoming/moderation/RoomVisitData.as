package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_795:String;
      
      private var var_1959:int;
      
      private var var_1668:Boolean;
      
      private var _roomId:int;
      
      private var var_1960:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1668 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_795 = param1.readString();
         var_1960 = param1.readInteger();
         var_1959 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1668;
      }
      
      public function get roomName() : String
      {
         return var_795;
      }
      
      public function get enterMinute() : int
      {
         return var_1959;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1960;
      }
   }
}
