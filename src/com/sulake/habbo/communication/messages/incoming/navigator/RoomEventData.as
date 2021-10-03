package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2335:String;
      
      private var var_440:int;
      
      private var var_2356:String;
      
      private var var_2355:String;
      
      private var var_2357:int;
      
      private var var_2358:String;
      
      private var var_2354:int;
      
      private var var_682:Array;
      
      private var var_1134:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_682 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1134 = false;
            return;
         }
         this.var_1134 = true;
         var_2357 = int(_loc2_);
         var_2356 = param1.readString();
         var_440 = int(param1.readString());
         var_2354 = param1.readInteger();
         var_2335 = param1.readString();
         var_2355 = param1.readString();
         var_2358 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_682.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2354;
      }
      
      public function get eventName() : String
      {
         return var_2335;
      }
      
      public function get eventDescription() : String
      {
         return var_2355;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2356;
      }
      
      public function get tags() : Array
      {
         return var_682;
      }
      
      public function get creationTime() : String
      {
         return var_2358;
      }
      
      public function get exists() : Boolean
      {
         return var_1134;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2357;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_682 = null;
      }
      
      public function get flatId() : int
      {
         return var_440;
      }
   }
}
