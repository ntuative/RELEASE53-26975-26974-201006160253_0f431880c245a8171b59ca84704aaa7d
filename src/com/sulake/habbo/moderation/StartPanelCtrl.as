package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.parser.navigator.PublicSpaceCastLibsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   
   public class StartPanelCtrl implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1272:Boolean;
      
      private var _main:ModerationManager;
      
      private var _userId:int;
      
      private var var_52:IFrameWindow;
      
      private var _roomId:int;
      
      public function StartPanelCtrl(param1:ModerationManager)
      {
         super();
         _main = param1;
      }
      
      public function userSelected(param1:int, param2:String) : void
      {
         if(var_52 == null)
         {
            return;
         }
         _userId = param1;
         var _loc3_:IButtonWindow = IButtonWindow(var_52.findChildByName("userinfo_but"));
         _loc3_.enable();
         _loc3_.caption = "User info: " + param2;
      }
      
      private function onUserinfoButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _main.windowTracker.show(new UserInfoFrameCtrl(_main,_userId),var_52,false,false,true);
      }
      
      public function publicSpaceEntered(param1:PublicSpaceCastLibsMessageParser) : void
      {
         if(var_52 == null || param1 == null)
         {
            return;
         }
         var_52.findChildByName("room_tool_but").disable();
         enableChatlogButton();
         var_1272 = false;
         _roomId = param1.nodeId;
      }
      
      private function onChatlogButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _main.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(!!var_1272 ? 0 : 1,_roomId),_main,WindowTracker.const_544,_roomId),var_52,false,false,true);
      }
      
      public function guestRoomEntered(param1:RoomEntryInfoMessageParser) : void
      {
         if(var_52 == null || param1 == null)
         {
            return;
         }
         var_52.findChildByName("room_tool_but").enable();
         enableChatlogButton();
         var_1272 = true;
         _roomId = param1.guestRoomId;
      }
      
      private function onTicketQueueButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _main.issueManager.init();
      }
      
      private function onRoomToolButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _main.windowTracker.show(new RoomToolCtrl(_main,_roomId),var_52,false,false,true);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _main = null;
            if(var_52)
            {
               var_52.dispose();
               var_52 = null;
            }
         }
      }
      
      public function roomExited() : void
      {
         if(var_52 == null)
         {
            return;
         }
         var_52.findChildByName("room_tool_but").disable();
         var_52.findChildByName("chatlog_but").disable();
      }
      
      private function enableChatlogButton() : void
      {
         if(_main.initMsg.chatlogsPermission)
         {
            var_52.findChildByName("chatlog_but").enable();
         }
      }
      
      public function show() : void
      {
         if(var_52 == null)
         {
            var_52 = IFrameWindow(_main.getXmlWindow("start_panel"));
            var_52.findChildByName("room_tool_but").procedure = onRoomToolButton;
            var_52.findChildByName("chatlog_but").procedure = onChatlogButton;
            var_52.findChildByName("ticket_queue_but").procedure = onTicketQueueButton;
            var_52.findChildByName("userinfo_but").procedure = onUserinfoButton;
            var_52.findChildByName("userinfo_but").disable();
            var_52.findChildByName("room_tool_but").disable();
            var_52.findChildByName("chatlog_but").disable();
            _main.disableButton(_main.initMsg.cfhPermission,var_52,"ticket_queue_but");
            _main.disableButton(_main.initMsg.chatlogsPermission,var_52,"chatlog_but");
         }
         var_52.visible = true;
      }
   }
}
