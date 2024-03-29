package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.furniture.DoorNotInstalledMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.furniture.DoorOtherEndDeletedMessageEvent;
   import com.sulake.habbo.communication.messages.parser.room.furniture.DoorNotInstalledMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.furniture.DoorOtherEndDeletedMessageParser;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   
   public class TeleportErrorHandler extends BaseHandler
   {
       
      
      public function TeleportErrorHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new DoorOtherEndDeletedMessageEvent(onDoorOtherEndDeletedMessage));
         param1.addMessageEvent(new DoorNotInstalledMessageEvent(onDoorNotInstalledMessage));
      }
      
      private function onDoorNotInstalledMessage(param1:IMessageEvent) : void
      {
         var _loc2_:DoorNotInstalledMessageParser = (param1 as DoorNotInstalledMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_xxxRoomId,var_37);
         if(_loc3_ == null)
         {
            return;
         }
         if(listener && false)
         {
            listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(RoomSessionErrorMessageEvent.const_998,_loc3_));
         }
      }
      
      private function onDoorOtherEndDeletedMessage(param1:IMessageEvent) : void
      {
         var _loc2_:DoorOtherEndDeletedMessageParser = (param1 as DoorOtherEndDeletedMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_xxxRoomId,var_37);
         if(_loc3_ == null)
         {
            return;
         }
         if(listener && false)
         {
            listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(RoomSessionErrorMessageEvent.const_863,_loc3_));
         }
      }
   }
}
