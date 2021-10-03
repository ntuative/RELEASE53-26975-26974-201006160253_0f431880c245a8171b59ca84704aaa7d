package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2448:Boolean;
      
      private var var_2451:int;
      
      private var var_2450:Boolean;
      
      private var var_1693:String;
      
      private var var_1262:String;
      
      private var var_2169:int;
      
      private var var_2345:String;
      
      private var var_2449:String;
      
      private var var_2344:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2169 = param1.readInteger();
         this.var_1693 = param1.readString();
         this.var_2345 = param1.readString();
         this.var_2448 = param1.readBoolean();
         this.var_2450 = param1.readBoolean();
         param1.readString();
         this.var_2451 = param1.readInteger();
         this.var_2344 = param1.readString();
         this.var_2449 = param1.readString();
         this.var_1262 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1262;
      }
      
      public function get avatarName() : String
      {
         return this.var_1693;
      }
      
      public function get avatarId() : int
      {
         return this.var_2169;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2448;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2449;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2344;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2450;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2345;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2451;
      }
   }
}
