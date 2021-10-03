package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_130:String = "RWPUE_VOTE_RESULT";
      
      public static const const_122:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1447:int;
      
      private var var_1151:String;
      
      private var var_753:Array;
      
      private var var_1048:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1151 = param2;
         var_1048 = param3;
         var_753 = param4;
         if(var_753 == null)
         {
            var_753 = [];
         }
         var_1447 = param5;
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
