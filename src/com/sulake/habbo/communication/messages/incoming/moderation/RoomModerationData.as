package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_113:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1713:int;
      
      private var var_440:int;
      
      private var var_725:RoomData;
      
      private var var_1789:int;
      
      private var _ownerName:String;
      
      private var var_2033:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_440 = param1.readInteger();
         var_1713 = param1.readInteger();
         var_2033 = param1.readBoolean();
         var_1789 = param1.readInteger();
         _ownerName = param1.readString();
         var_113 = new RoomData(param1);
         var_725 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1713;
      }
      
      public function get event() : RoomData
      {
         return var_725;
      }
      
      public function get room() : RoomData
      {
         return var_113;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_113 != null)
         {
            var_113.dispose();
            var_113 = null;
         }
         if(var_725 != null)
         {
            var_725.dispose();
            var_725 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_440;
      }
      
      public function get ownerId() : int
      {
         return var_1789;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2033;
      }
   }
}
