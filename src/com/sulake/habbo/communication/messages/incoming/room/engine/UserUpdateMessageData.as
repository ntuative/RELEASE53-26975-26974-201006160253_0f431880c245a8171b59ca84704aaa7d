package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      private var var_224:int = 0;
      
      private var var_2013:int = 0;
      
      private var var_2314:Number = 0;
      
      private var var_2315:Number = 0;
      
      private var var_2318:Number = 0;
      
      private var var_2317:Number = 0;
      
      private var var_2316:Boolean = false;
      
      private var var_83:Number = 0;
      
      private var _id:int = 0;
      
      private var var_235:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_235 = [];
         super();
         _id = param1;
         var_83 = param2;
         _y = param3;
         var_84 = param4;
         var_2317 = param5;
         var_224 = param6;
         var_2013 = param7;
         var_2314 = param8;
         var_2315 = param9;
         var_2318 = param10;
         var_2316 = param11;
         var_235 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function get localZ() : Number
      {
         return var_2317;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2316;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_2013;
      }
      
      public function get targetX() : Number
      {
         return var_2314;
      }
      
      public function get targetY() : Number
      {
         return var_2315;
      }
      
      public function get targetZ() : Number
      {
         return var_2318;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get actions() : Array
      {
         return var_235.slice();
      }
   }
}
