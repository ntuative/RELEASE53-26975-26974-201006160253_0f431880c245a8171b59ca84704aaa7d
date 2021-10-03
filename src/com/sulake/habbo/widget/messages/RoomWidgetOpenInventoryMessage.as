package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1049:String = "inventory_badges";
      
      public static const const_1420:String = "inventory_clothes";
      
      public static const const_1404:String = "inventory_furniture";
      
      public static const const_689:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_973:String = "inventory_effects";
       
      
      private var var_1852:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_689);
         var_1852 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1852;
      }
   }
}
