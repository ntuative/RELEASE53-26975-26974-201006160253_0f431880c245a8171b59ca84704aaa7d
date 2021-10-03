package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_243:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_243 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_243;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_243 = new RoomSettingsFlatInfo();
         var_243.allowFurniMoving = param1.readInteger() == 1;
         var_243.doorMode = param1.readInteger();
         var_243.id = param1.readInteger();
         var_243.ownerName = param1.readString();
         var_243.type = param1.readString();
         var_243.name = param1.readString();
         var_243.description = param1.readString();
         var_243.showOwnerName = param1.readInteger() == 1;
         var_243.allowTrading = param1.readInteger() == 1;
         var_243.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
