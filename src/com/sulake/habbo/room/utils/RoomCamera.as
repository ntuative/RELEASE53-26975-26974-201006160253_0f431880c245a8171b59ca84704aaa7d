package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_368:Number = 0.5;
      
      private static const const_807:int = 3;
      
      private static const const_1121:Number = 1;
       
      
      private var var_2066:Boolean = false;
      
      private var var_2069:Boolean = false;
      
      private var var_1094:int = 0;
      
      private var var_276:Vector3d = null;
      
      private var var_2063:int = 0;
      
      private var var_2064:int = 0;
      
      private var var_2071:Boolean = false;
      
      private var var_2072:int = -2;
      
      private var var_2068:Boolean = false;
      
      private var var_2070:int = 0;
      
      private var var_2067:int = -1;
      
      private var var_424:Vector3d = null;
      
      private var var_2065:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_2063;
      }
      
      public function get targetId() : int
      {
         return var_2067;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_2070 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_2063 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2066 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_2067 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2069 = param1;
      }
      
      public function dispose() : void
      {
         var_424 = null;
         var_276 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_424 == null)
         {
            var_424 = new Vector3d();
         }
         var_424.assign(param1);
         var_1094 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_2072;
      }
      
      public function get screenHt() : int
      {
         return var_2065;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_2064 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_276;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_2065 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_2070;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2066;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2069;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_424 != null && var_276 != null)
         {
            ++var_1094;
            _loc2_ = Vector3d.dif(var_424,var_276);
            if(_loc2_.length <= const_368)
            {
               var_276 = var_424;
               var_424 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_368 * (const_807 + 1))
               {
                  _loc2_.mul(const_368);
               }
               else if(var_1094 <= const_807)
               {
                  _loc2_.mul(const_368);
               }
               else
               {
                  _loc2_.mul(const_1121);
               }
               var_276 = Vector3d.sum(var_276,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2071 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_2064;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2068 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_2072 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_276 != null)
         {
            return;
         }
         var_276 = new Vector3d();
         var_276.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2071;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2068;
      }
   }
}
