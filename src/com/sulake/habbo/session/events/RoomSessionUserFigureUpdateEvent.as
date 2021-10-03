package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_156:String = "RSUBE_FIGURE";
       
      
      private var var_616:String = "";
      
      private var var_415:String = "";
      
      private var _userId:int = 0;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_156,param1,param5,param6);
         _userId = param2;
         var_415 = param3;
         var_616 = param4;
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
