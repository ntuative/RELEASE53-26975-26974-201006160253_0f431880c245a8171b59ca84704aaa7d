package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_901:LegacyWallGeometry = null;
      
      private var var_625:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_624:TileHeightMap = null;
      
      private var var_2026:String = null;
      
      private var _roomId:int = 0;
      
      private var var_623:SelectedRoomObjectData = null;
      
      private var var_902:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_901 = new LegacyWallGeometry();
         var_902 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_625 != null)
         {
            var_625.dispose();
         }
         var_625 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_624 != null)
         {
            var_624.dispose();
         }
         var_624 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2026 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_901;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_623;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_902;
      }
      
      public function dispose() : void
      {
         if(var_624 != null)
         {
            var_624.dispose();
            var_624 = null;
         }
         if(var_901 != null)
         {
            var_901.dispose();
            var_901 = null;
         }
         if(var_902 != null)
         {
            var_902.dispose();
            var_902 = null;
         }
         if(var_625 != null)
         {
            var_625.dispose();
            var_625 = null;
         }
         if(var_623 != null)
         {
            var_623.dispose();
            var_623 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_624;
      }
      
      public function get worldType() : String
      {
         return var_2026;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_623 != null)
         {
            var_623.dispose();
         }
         var_623 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_625;
      }
   }
}
