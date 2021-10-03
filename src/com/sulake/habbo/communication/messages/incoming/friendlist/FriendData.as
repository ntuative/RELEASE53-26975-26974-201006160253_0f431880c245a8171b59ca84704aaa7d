package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_415:String;
      
      private var var_1264:String;
      
      private var var_1261:String;
      
      private var var_1245:int;
      
      private var var_616:int;
      
      private var var_1262:String;
      
      private var _name:String;
      
      private var var_1263:Boolean;
      
      private var var_816:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_616 = param1.readInteger();
         this.var_816 = param1.readBoolean();
         this.var_1263 = param1.readBoolean();
         this.var_415 = param1.readString();
         this.var_1245 = param1.readInteger();
         this.var_1261 = param1.readString();
         this.var_1264 = param1.readString();
         this.var_1262 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_616;
      }
      
      public function get realName() : String
      {
         return var_1262;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1261;
      }
      
      public function get categoryId() : int
      {
         return var_1245;
      }
      
      public function get online() : Boolean
      {
         return var_816;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1263;
      }
      
      public function get lastAccess() : String
      {
         return var_1264;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
   }
}
