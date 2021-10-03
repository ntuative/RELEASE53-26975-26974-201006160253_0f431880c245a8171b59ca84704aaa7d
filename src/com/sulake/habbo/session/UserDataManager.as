package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.GetPetInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetSelectedBadgesMessageComposer;
   
   public class UserDataManager implements IUserDataManager
   {
       
      
      private var _userIds:Map;
      
      private var var_727:Map;
      
      private var var_411:Map;
      
      private var _connection:IConnection;
      
      public function UserDataManager()
      {
         super();
         var_411 = new Map();
         _userIds = new Map();
         var_727 = new Map();
      }
      
      public function removeUserDataByIndex(param1:int) : void
      {
         var _loc2_:int = _userIds.getValue(param1);
         var_411.remove(_loc2_);
         _userIds.remove(param1);
      }
      
      public function updateName(param1:int, param2:String) : void
      {
         var _loc3_:IUserData = getUserData(param1);
         if(_loc3_ != null)
         {
            _loc3_.name = param2;
         }
      }
      
      public function getUserData(param1:int) : IUserData
      {
         return var_411.getValue(param1);
      }
      
      public function getUserBadges(param1:int) : Array
      {
         if(_connection != null)
         {
            _connection.send(new GetSelectedBadgesMessageComposer(param1));
         }
         var _loc2_:* = var_727.getValue(param1) as Array;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         return _loc2_;
      }
      
      public function updateFigure(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:int = _userIds.getValue(param1);
         var _loc5_:IUserData = getUserData(_loc4_);
         if(_loc5_ != null)
         {
            _loc5_.figure = param2;
            _loc5_.sex = param3;
         }
      }
      
      public function setUserBadges(param1:int, param2:Array) : void
      {
         var_727.remove(param1);
         var_727.add(param1,param2);
      }
      
      public function setUserData(param1:IUserData) : void
      {
         var_411.remove(param1.webID);
         _userIds.remove(param1.id);
         var_411.add(param1.webID,param1);
         _userIds.add(param1.id,param1.webID);
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_411.dispose();
         var_411 = null;
         _userIds.dispose();
         var_411 = null;
         var_727.dispose();
         var_727 = null;
      }
      
      public function requestPetInfo(param1:int) : void
      {
         var _loc2_:IUserData = getUserData(param1);
         if(_loc2_ != null && _connection != null)
         {
            _connection.send(new GetPetInfoMessageComposer(_loc2_.webID));
         }
      }
      
      public function getUserDataByIndex(param1:int) : IUserData
      {
         var _loc2_:int = _userIds.getValue(param1);
         return getUserData(_loc2_);
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
