package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1157:int = 80;
       
      
      private var var_549:Map;
      
      private var var_795:String = "";
      
      private var var_1422:Array;
      
      public function UserRegistry()
      {
         var_549 = new Map();
         var_1422 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_549.getValue(var_1422.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_795;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_549.getValue(param1) != null)
         {
            var_549.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_795);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_795 == "")
         {
            var_1422.push(param1);
         }
         var_549.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_549;
      }
      
      public function unregisterRoom() : void
      {
         var_795 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_549.length > const_1157)
         {
            _loc1_ = var_549.getKey(0);
            var_549.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_795 = param1;
         if(var_795 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
