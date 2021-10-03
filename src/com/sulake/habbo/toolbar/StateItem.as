package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1343:Boolean;
      
      private var var_2363:String;
      
      private var _frames:XMLList;
      
      private var var_1133:String = "-1";
      
      private var var_683:String;
      
      private var var_174:int = 120;
      
      private var var_1462:String = "-1";
      
      private var var_1463:String;
      
      private var var_2364:Boolean;
      
      private var var_1701:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1343 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_2364 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_174 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1463 = param1.@namebase;
         }
         else
         {
            var_1463 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1133 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1462 = param1.@nextState;
         }
         else
         {
            var_1462 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1701 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_2363 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_683 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1133 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_2364;
      }
      
      public function get defaultState() : String
      {
         return var_1701;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1701 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_2363;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_174;
      }
      
      public function get loop() : Boolean
      {
         return var_1343;
      }
      
      public function get nextState() : String
      {
         return var_1462;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_683;
      }
      
      public function get stateOver() : String
      {
         return var_1133;
      }
      
      public function get nameBase() : String
      {
         return var_1463;
      }
   }
}
