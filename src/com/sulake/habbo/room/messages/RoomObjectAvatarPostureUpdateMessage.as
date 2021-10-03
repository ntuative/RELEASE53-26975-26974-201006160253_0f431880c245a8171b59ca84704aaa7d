package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2019:String;
      
      private var var_835:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2019 = param1;
         var_835 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2019;
      }
      
      public function get parameter() : String
      {
         return var_835;
      }
   }
}
