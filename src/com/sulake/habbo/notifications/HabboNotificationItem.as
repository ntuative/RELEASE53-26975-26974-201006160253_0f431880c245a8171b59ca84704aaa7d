package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_79:HabboNotificationItemStyle;
      
      private var var_20:String;
      
      private var var_23:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         var_20 = param1;
         var_79 = param2;
         var_23 = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_79.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(var_23 != null)
            {
               var_23.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return var_79;
      }
      
      public function get content() : String
      {
         return var_20;
      }
   }
}
