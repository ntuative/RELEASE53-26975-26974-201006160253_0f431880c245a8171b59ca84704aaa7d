package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_992:String = "RWOCM_CLUB_MAIN";
      
      public static const const_593:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1883:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_593);
         var_1883 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1883;
      }
   }
}
