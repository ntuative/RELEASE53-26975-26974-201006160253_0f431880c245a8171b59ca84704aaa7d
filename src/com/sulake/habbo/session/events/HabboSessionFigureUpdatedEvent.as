package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class HabboSessionFigureUpdatedEvent extends Event
   {
      
      public static const const_696:String = "HABBO_SESSION_FIGURE_UPDATE";
       
      
      private var var_616:String;
      
      private var var_415:String;
      
      private var _userId:int;
      
      public function HabboSessionFigureUpdatedEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_696,param4,param5);
         _userId = param1;
         var_415 = param2;
         var_616 = param3;
      }
      
      public function get gender() : String
      {
         return var_616;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
