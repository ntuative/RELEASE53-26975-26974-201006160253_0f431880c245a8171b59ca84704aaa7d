package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_213:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1869:Boolean = false;
      
      private var var_1868:int = 0;
      
      private var var_1867:int = 0;
      
      private var var_1871:int;
      
      private var var_1870:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_213,param6,param7);
         var_1870 = param1;
         var_1867 = param2;
         var_1868 = param3;
         var_1869 = param4;
         var_1871 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1871;
      }
      
      public function get pastPeriods() : int
      {
         return var_1868;
      }
      
      public function get periodsLeft() : int
      {
         return var_1867;
      }
      
      public function get daysLeft() : int
      {
         return var_1870;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1869;
      }
   }
}
