package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1547:int;
      
      private var var_1548:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1547;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1547 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1547 = this.var_1547;
         _loc1_.var_1548 = this.var_1548;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1548 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1548;
      }
   }
}
