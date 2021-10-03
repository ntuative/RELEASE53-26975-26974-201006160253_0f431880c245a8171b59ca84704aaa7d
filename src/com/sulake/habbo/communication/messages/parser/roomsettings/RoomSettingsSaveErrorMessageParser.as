package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1542:int = 9;
      
      public static const const_1643:int = 4;
      
      public static const const_1702:int = 1;
      
      public static const const_1274:int = 10;
      
      public static const const_1581:int = 2;
      
      public static const const_1425:int = 7;
      
      public static const const_1423:int = 11;
      
      public static const const_1641:int = 3;
      
      public static const const_1325:int = 8;
      
      public static const const_1403:int = 5;
      
      public static const const_1518:int = 6;
      
      public static const const_1298:int = 12;
       
      
      private var var_1782:String;
      
      private var _roomId:int;
      
      private var var_1210:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1782;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1210 = param1.readInteger();
         var_1782 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1210;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
