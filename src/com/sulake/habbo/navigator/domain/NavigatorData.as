package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1485:int = 10;
       
      
      private var var_2375:Boolean;
      
      private var var_2369:int;
      
      private var var_1468:int;
      
      private var var_2370:Boolean;
      
      private var var_1183:Array;
      
      private var var_996:Dictionary;
      
      private var var_1184:Array;
      
      private var var_2477:int;
      
      private var var_2372:int;
      
      private var var_2368:UserDefinedRoomEvents;
      
      private var var_1702:int;
      
      private var var_2367:int;
      
      private var var_2169:int;
      
      private var var_678:PublicRoomShortData;
      
      private var var_470:RoomEventData;
      
      private var var_147:MsgWithRequestId;
      
      private var var_2373:Boolean;
      
      private var var_2374:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_2371:Boolean;
      
      private var var_219:GuestRoomData;
      
      private var var_824:Boolean;
      
      private var var_677:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1183 = new Array();
         var_1184 = new Array();
         var_996 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_147 != null && var_147 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2371;
      }
      
      public function startLoading() : void
      {
         this.var_824 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_2369;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2371 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_470 != null)
         {
            var_470.dispose();
         }
         var_470 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1702;
      }
      
      public function get stuffStates() : Array
      {
         return var_2374;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_147 != null && var_147 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_147 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_219;
      }
      
      public function get allCategories() : Array
      {
         return var_1183;
      }
      
      public function onRoomExit() : void
      {
         if(var_470 != null)
         {
            var_470.dispose();
            var_470 = null;
         }
         if(var_678 != null)
         {
            var_678.dispose();
            var_678 = null;
         }
         if(var_219 != null)
         {
            var_219.dispose();
            var_219 = null;
         }
         var_677 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_147 = param1;
         var_824 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_219 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1702 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_147 = param1;
         var_824 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_678 = null;
         var_219 = null;
         var_677 = false;
         if(param1.guestRoom)
         {
            var_677 = param1.owner;
         }
         else
         {
            var_678 = param1.publicSpace;
            var_470 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_677;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2477 = param1.limit;
         this.var_1468 = param1.favouriteRoomIds.length;
         this.var_996 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_996[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_147 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_2375;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_2374 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_678;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_147 = param1;
         var_824 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_2169 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_219 != null && var_677;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_2368;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2370;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1183 = param1;
         var_1184 = new Array();
         for each(_loc2_ in var_1183)
         {
            if(_loc2_.visible)
            {
               var_1184.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2372;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2367;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1184;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_147 == null)
         {
            return;
         }
         var_147.dispose();
         var_147 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_2375 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_470;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_996[param1] = !!param2 ? "yes" : null;
         var_1468 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_147 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_2169;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_147 != null && var_147 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2370 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2372 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2373 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_2368 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_824;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1702 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1468 >= var_2477;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_219 != null)
         {
            var_219.dispose();
         }
         var_219 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2367 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2373;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_219 != null && !var_677;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2369 = param1;
      }
   }
}
