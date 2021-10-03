package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_854:String = "whisper";
      
      public static const const_1208:String = "shout";
      
      public static const const_635:String = "RWWCIDE_CHAT_INPUT_CONTENT";
       
      
      private var var_1921:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_635,param3,param4);
         var_1921 = param1;
         _userName = param2;
      }
      
      public function get messageType() : String
      {
         return var_1921;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
