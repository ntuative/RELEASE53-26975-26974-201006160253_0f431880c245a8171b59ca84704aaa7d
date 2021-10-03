package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_415:String;
      
      private var var_2428:String;
      
      private var var_2429:int;
      
      private var var_2427:int;
      
      private var var_653:String;
      
      private var var_1262:String;
      
      private var _name:String;
      
      private var var_522:int;
      
      private var var_922:int;
      
      private var var_2430:int;
      
      private var _respectTotal:int;
      
      private var var_2431:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2427;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1262;
      }
      
      public function get customData() : String
      {
         return this.var_2428;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_522;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2429;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2431;
      }
      
      public function get figure() : String
      {
         return this.var_415;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_653;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_415 = param1.readString();
         this.var_653 = param1.readString();
         this.var_2428 = param1.readString();
         this.var_1262 = param1.readString();
         this.var_2430 = param1.readInteger();
         this.var_2431 = param1.readString();
         this.var_2429 = param1.readInteger();
         this.var_2427 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_922 = param1.readInteger();
         this.var_522 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2430;
      }
      
      public function get respectLeft() : int
      {
         return this.var_922;
      }
   }
}
