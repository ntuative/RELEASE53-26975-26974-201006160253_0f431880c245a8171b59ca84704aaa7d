package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_972:String = "select_outfit";
       
      
      private var var_1926:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_972);
         var_1926 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1926;
      }
   }
}
