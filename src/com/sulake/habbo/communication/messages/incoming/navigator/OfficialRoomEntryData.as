package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1291:int = 4;
      
      public static const const_590:int = 3;
      
      public static const const_535:int = 2;
      
      public static const const_991:int = 1;
       
      
      private var var_1943:String;
      
      private var _disposed:Boolean;
      
      private var var_1713:int;
      
      private var var_1939:Boolean;
      
      private var var_928:String;
      
      private var var_871:PublicRoomData;
      
      private var var_1941:int;
      
      private var _index:int;
      
      private var var_1942:String;
      
      private var _type:int;
      
      private var var_1777:String;
      
      private var var_870:GuestRoomData;
      
      private var var_1940:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1943 = param1.readString();
         var_1940 = param1.readString();
         var_1939 = param1.readInteger() == 1;
         var_1942 = param1.readString();
         var_928 = param1.readString();
         var_1941 = param1.readInteger();
         var_1713 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_991)
         {
            var_1777 = param1.readString();
         }
         else if(_type == const_590)
         {
            var_871 = new PublicRoomData(param1);
         }
         else if(_type == const_535)
         {
            var_870 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1941;
      }
      
      public function get popupCaption() : String
      {
         return var_1943;
      }
      
      public function get userCount() : int
      {
         return var_1713;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1939;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_991)
         {
            return 0;
         }
         if(this.type == const_535)
         {
            return this.var_870.maxUserCount;
         }
         if(this.type == const_590)
         {
            return this.var_871.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1940;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_870 != null)
         {
            this.var_870.dispose();
            this.var_870 = null;
         }
         if(this.var_871 != null)
         {
            this.var_871.dispose();
            this.var_871 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_870;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1942;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_871;
      }
      
      public function get picRef() : String
      {
         return var_928;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1777;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
