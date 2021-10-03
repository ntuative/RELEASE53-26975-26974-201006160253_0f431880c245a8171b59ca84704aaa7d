package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1715:int;
      
      private var var_1717:int = 0;
      
      private var var_1714:String;
      
      private var var_1716:int;
      
      private var var_1718:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1715 = param1;
         var_1716 = param2;
         var_1718 = param3;
         var_1714 = param4;
      }
      
      public function get length() : int
      {
         return var_1716;
      }
      
      public function get name() : String
      {
         return var_1718;
      }
      
      public function get creator() : String
      {
         return var_1714;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1717;
      }
      
      public function get id() : int
      {
         return var_1715;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1717 = param1;
      }
   }
}
