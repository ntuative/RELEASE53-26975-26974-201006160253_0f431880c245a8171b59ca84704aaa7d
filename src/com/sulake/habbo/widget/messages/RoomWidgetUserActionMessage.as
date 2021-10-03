package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_756:String = "RWUAM_RESPECT_USER";
      
      public static const const_585:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_624:String = "RWUAM_START_TRADING";
      
      public static const const_717:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_752:String = "RWUAM_WHISPER_USER";
      
      public static const const_662:String = "RWUAM_IGNORE_USER";
      
      public static const const_444:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_576:String = "RWUAM_BAN_USER";
      
      public static const const_594:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_382:String = "RWUAM_KICK_USER";
      
      public static const const_651:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_746:String = " RWUAM_RESPECT_PET";
      
      public static const const_451:String = "RWUAM_KICK_BOT";
      
      public static const const_1209:String = "RWUAM_TRAIN_PET";
      
      public static const const_682:String = "RWUAM_PICKUP_PET";
      
      public static const const_665:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_675:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
