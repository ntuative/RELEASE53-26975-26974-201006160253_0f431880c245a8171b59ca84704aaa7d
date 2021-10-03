package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_391:int = 0;
      
      public static const const_126:int = 2;
      
      public static const const_164:int = 1;
      
      public static const const_534:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2131:Boolean;
      
      private var var_2132:Boolean;
      
      private var var_2210:int;
      
      private var var_2130:Array;
      
      private var var_2211:int;
      
      private var var_2135:Boolean;
      
      private var var_1209:String;
      
      private var var_2133:int;
      
      private var var_2134:Boolean;
      
      private var var_2058:int;
      
      private var var_1245:int;
      
      private var _roomId:int;
      
      private var var_682:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_2133;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2133 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_2134 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_682;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2135;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2211 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2130 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_682 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2131;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2132;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2210;
      }
      
      public function get categoryId() : int
      {
         return var_1245;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2135 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_2134;
      }
      
      public function get controllerCount() : int
      {
         return var_2211;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2130;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2058 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2131 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2132 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2210 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_2058;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1245 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1209 = param1;
      }
      
      public function get description() : String
      {
         return var_1209;
      }
   }
}
