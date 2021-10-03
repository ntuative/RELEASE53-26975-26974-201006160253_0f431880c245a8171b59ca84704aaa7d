package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_210:String = "RWUIUE_PEER";
      
      public static const const_224:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1256:String = "BOT";
      
      public static const const_1030:int = 2;
      
      public static const const_1424:int = 0;
      
      public static const const_1050:int = 3;
       
      
      private var var_415:String = "";
      
      private var var_1261:String = "";
      
      private var var_2304:Boolean = false;
      
      private var var_1957:int = 0;
      
      private var var_1979:int = 0;
      
      private var var_2298:Boolean = false;
      
      private var var_1262:String = "";
      
      private var var_2302:Boolean = false;
      
      private var var_922:int = 0;
      
      private var var_2303:Boolean = true;
      
      private var var_1042:int = 0;
      
      private var var_2297:Boolean = false;
      
      private var var_1451:Boolean = false;
      
      private var var_2300:Boolean = false;
      
      private var var_1977:int = 0;
      
      private var var_2299:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_264:Array;
      
      private var var_1449:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1958:int = 0;
      
      private var var_2296:Boolean = false;
      
      private var var_2301:int = 0;
      
      private var var_1978:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_264 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1979;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1979 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2304;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2303;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2303 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2302 = param1;
      }
      
      public function get motto() : String
      {
         return var_1261;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2297 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1451;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1261 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2296;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1978;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1451 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2299;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1977 = param1;
      }
      
      public function get badges() : Array
      {
         return var_264;
      }
      
      public function get amIController() : Boolean
      {
         return var_2298;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2298 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2296 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2301 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1978 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1262 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2302;
      }
      
      public function set figure(param1:String) : void
      {
         var_415 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1977;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1449;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2297;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_922 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2301;
      }
      
      public function get realName() : String
      {
         return var_1262;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function set webID(param1:int) : void
      {
         var_1958 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_264 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2300 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2299 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_922;
      }
      
      public function get webID() : int
      {
         return var_1958;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1042 = param1;
      }
      
      public function get xp() : int
      {
         return var_1957;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2304 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1042;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2300;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1449 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1957 = param1;
      }
   }
}
