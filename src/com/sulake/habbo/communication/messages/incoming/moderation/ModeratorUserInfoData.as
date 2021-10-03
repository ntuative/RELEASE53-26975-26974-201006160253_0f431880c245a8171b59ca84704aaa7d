package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2112:int;
      
      private var var_2114:int;
      
      private var var_2115:int;
      
      private var _userName:String;
      
      private var var_2111:int;
      
      private var var_2113:int;
      
      private var var_2110:int;
      
      private var _userId:int;
      
      private var var_816:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2113 = param1.readInteger();
         var_2111 = param1.readInteger();
         var_816 = param1.readBoolean();
         var_2115 = param1.readInteger();
         var_2114 = param1.readInteger();
         var_2112 = param1.readInteger();
         var_2110 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2110;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_816;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2111;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2114;
      }
      
      public function get cautionCount() : int
      {
         return var_2112;
      }
      
      public function get cfhCount() : int
      {
         return var_2115;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2113;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
