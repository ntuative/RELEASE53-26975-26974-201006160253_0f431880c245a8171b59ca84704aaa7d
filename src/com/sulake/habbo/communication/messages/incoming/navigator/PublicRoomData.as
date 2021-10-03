package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1986:int;
      
      private var var_2050:String;
      
      private var var_1983:int;
      
      private var _disposed:Boolean;
      
      private var var_2049:int;
      
      private var var_2048:String;
      
      private var var_1467:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2048 = param1.readString();
         var_1986 = param1.readInteger();
         var_1983 = param1.readInteger();
         var_2050 = param1.readString();
         var_2049 = param1.readInteger();
         var_1467 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2049;
      }
      
      public function get worldId() : int
      {
         return var_1983;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_2048;
      }
      
      public function get unitPort() : int
      {
         return var_1986;
      }
      
      public function get castLibs() : String
      {
         return var_2050;
      }
      
      public function get nodeId() : int
      {
         return var_1467;
      }
   }
}
