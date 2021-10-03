package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_130:String = "RSPE_VOTE_RESULT";
      
      public static const const_122:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1447:int = 0;
      
      private var var_1151:String = "";
      
      private var var_753:Array;
      
      private var var_1048:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1048 = [];
         var_753 = [];
         super(param1,param2,param7,param8);
         var_1151 = param3;
         var_1048 = param4;
         var_753 = param5;
         if(var_753 == null)
         {
            var_753 = [];
         }
         var_1447 = param6;
      }
      
      public function get votes() : Array
      {
         return var_753.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1447;
      }
      
      public function get question() : String
      {
         return var_1151;
      }
      
      public function get choices() : Array
      {
         return var_1048.slice();
      }
   }
}
