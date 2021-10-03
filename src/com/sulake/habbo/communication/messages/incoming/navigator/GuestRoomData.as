package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1713:int;
      
      private var var_2273:String;
      
      private var var_2274:int;
      
      private var var_2272:int;
      
      private var var_725:Boolean;
      
      private var var_2135:Boolean;
      
      private var var_440:int;
      
      private var var_1209:String;
      
      private var var_2058:int;
      
      private var var_1245:int;
      
      private var _ownerName:String;
      
      private var var_795:String;
      
      private var var_2275:int;
      
      private var var_2276:RoomThumbnailData;
      
      private var var_2062:Boolean;
      
      private var var_682:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_682 = new Array();
         super();
         var_440 = param1.readInteger();
         var_725 = param1.readBoolean();
         var_795 = param1.readString();
         _ownerName = param1.readString();
         var_2058 = param1.readInteger();
         var_1713 = param1.readInteger();
         var_2275 = param1.readInteger();
         var_1209 = param1.readString();
         var_2274 = param1.readInteger();
         var_2062 = param1.readBoolean();
         var_2272 = param1.readInteger();
         var_1245 = param1.readInteger();
         var_2273 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_682.push(_loc4_);
            _loc3_++;
         }
         var_2276 = new RoomThumbnailData(param1);
         var_2135 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2275;
      }
      
      public function get roomName() : String
      {
         return var_795;
      }
      
      public function get userCount() : int
      {
         return var_1713;
      }
      
      public function get score() : int
      {
         return var_2272;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2273;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2062;
      }
      
      public function get tags() : Array
      {
         return var_682;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2135;
      }
      
      public function get event() : Boolean
      {
         return var_725;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_682 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1245;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2274;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2276;
      }
      
      public function get doorMode() : int
      {
         return var_2058;
      }
      
      public function get flatId() : int
      {
         return var_440;
      }
      
      public function get description() : String
      {
         return var_1209;
      }
   }
}
