package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1795:String;
      
      private var var_415:String;
      
      private var var_616:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_415 = param1;
         var_616 = param2;
         var_1795 = param3;
      }
      
      public function get race() : String
      {
         return var_1795;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function get gender() : String
      {
         return var_616;
      }
   }
}
