package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_815:IWindowContainer;
      
      private var var_1172:ITextWindow;
      
      private var var_188:RoomSettingsCtrl;
      
      private var var_1444:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_217:Timer;
      
      private var var_2337:IWindowContainer;
      
      private var var_1440:ITextWindow;
      
      private var var_388:IWindowContainer;
      
      private var var_2336:ITextWindow;
      
      private var var_985:IWindowContainer;
      
      private var var_216:UserDefinedRoomEventsCtrl;
      
      private var var_1689:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_795:ITextWindow;
      
      private var var_1688:IWindowContainer;
      
      private var var_1445:IWindowContainer;
      
      private var var_982:ITextWindow;
      
      private var var_1173:ITextFieldWindow;
      
      private var var_296:IWindowContainer;
      
      private var var_984:ITextWindow;
      
      private var var_1691:IButtonWindow;
      
      private var var_1171:ITextWindow;
      
      private var var_2476:int;
      
      private var var_1441:IContainerButtonWindow;
      
      private var var_983:IWindowContainer;
      
      private var var_1439:ITextWindow;
      
      private var var_1443:IContainerButtonWindow;
      
      private var var_1690:ITextWindow;
      
      private var var_925:TagRenderer;
      
      private var var_1692:IButtonWindow;
      
      private var var_2335:ITextWindow;
      
      private var var_337:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_814:ITextWindow;
      
      private var var_254:RoomThumbnailCtrl;
      
      private var var_1442:IContainerButtonWindow;
      
      private var var_2338:IWindowContainer;
      
      private var var_297:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_337 = new RoomEventViewCtrl(_navigator);
         var_188 = new RoomSettingsCtrl(_navigator,this,true);
         var_254 = new RoomThumbnailCtrl(_navigator);
         var_216 = new UserDefinedRoomEventsCtrl(_navigator);
         var_925 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_188);
         var_217 = new Timer(6000,1);
         var_217.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_188.active = true;
         this.var_337.active = false;
         this.var_254.active = false;
         this.var_216.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1689.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1692.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1688.visible = Util.hasVisibleChildren(var_1688);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_795.text = param1.roomName;
         var_795.height = NaN;
         _ownerName.text = param1.ownerName;
         var_982.text = param1.description;
         var_925.refreshTags(var_388,param1.tags);
         var_982.visible = false;
         if(param1.description != "")
         {
            var_982.height = NaN;
            var_982.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_388,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_388,"thumb_down",_loc3_,onThumbDown,0);
         var_2336.visible = _loc3_;
         var_984.visible = !_loc3_;
         var_1690.visible = !_loc3_;
         var_1690.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_388,"home",param2,null,0);
         _navigator.refreshButton(var_388,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_388,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_795.y,0);
         var_388.visible = true;
         var_388.height = Util.getLowestPoint(var_388);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function startUserDefinedRoomEventsEdit() : void
      {
         this.var_217.reset();
         this.var_188.active = false;
         this.var_337.active = false;
         this.var_254.active = false;
         this.var_216.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_217)
         {
            var_217.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_217.reset();
            var_217 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_511,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1691.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1444.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1442.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1441.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1443.visible = _navigator.data.canEditRoomSettings && param1;
         var_1445.visible = Util.hasVisibleChildren(var_1445);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_217.reset();
         this.var_337.active = false;
         this.var_188.active = false;
         this.var_254.active = false;
         this.var_216.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_217.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_217.reset();
         this.var_337.active = false;
         this.var_188.active = false;
         this.var_254.active = false;
         this.var_216.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_511,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_296);
         var_296.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_188.refresh(var_296);
         this.var_254.refresh(var_296);
         this.var_216.refresh(var_296);
         Util.moveChildrenToColumn(var_296,["room_details","room_buttons"],0,2);
         var_296.height = Util.getLowestPoint(var_296);
         var_296.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1173.setSelection(0,var_1173.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_297);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_337.refresh(var_297);
         if(Util.hasVisibleChildren(var_297) && !(this.var_254.active || this.var_216.active))
         {
            Util.moveChildrenToColumn(var_297,["event_details","event_buttons"],0,2);
            var_297.height = Util.getLowestPoint(var_297);
            var_297.visible = true;
         }
         else
         {
            var_297.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_217.reset();
         this.var_337.active = true;
         this.var_188.active = false;
         this.var_254.active = false;
         this.var_216.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_217.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1172.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1172.height = NaN;
         var_1440.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1440.height = NaN;
         Util.moveChildrenToColumn(var_815,["public_space_name","public_space_desc"],var_1172.y,0);
         var_815.visible = true;
         var_815.height = Math.max(86,Util.getLowestPoint(var_815));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_216;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true && true)
         {
            var_983.visible = true;
            var_1173.text = this.getEmbedData();
         }
         else
         {
            var_983.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_217.reset();
         this.var_188.load(param1);
         this.var_188.active = true;
         this.var_337.active = false;
         this.var_254.active = false;
         this.var_216.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_217.reset();
         this.var_188.active = false;
         this.var_337.active = false;
         this.var_254.active = true;
         this.var_216.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_75,false);
         _window.setParamFlag(HabboWindowParam.const_1271,true);
         _window.visible = false;
         var_296 = IWindowContainer(find("room_info"));
         var_388 = IWindowContainer(find("room_details"));
         var_815 = IWindowContainer(find("public_space_details"));
         var_2338 = IWindowContainer(find("owner_name_cont"));
         var_2337 = IWindowContainer(find("rating_cont"));
         var_1445 = IWindowContainer(find("room_buttons"));
         var_795 = ITextWindow(find("room_name"));
         var_1172 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_982 = ITextWindow(find("room_desc"));
         var_1440 = ITextWindow(find("public_space_desc"));
         var_1171 = ITextWindow(find("owner_caption"));
         var_984 = ITextWindow(find("rating_caption"));
         var_2336 = ITextWindow(find("rate_caption"));
         var_1690 = ITextWindow(find("rating_txt"));
         var_297 = IWindowContainer(find("event_info"));
         var_985 = IWindowContainer(find("event_details"));
         var_1688 = IWindowContainer(find("event_buttons"));
         var_2335 = ITextWindow(find("event_name"));
         var_814 = ITextWindow(find("event_desc"));
         var_1444 = IContainerButtonWindow(find("add_favourite_button"));
         var_1442 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1441 = IContainerButtonWindow(find("make_home_button"));
         var_1443 = IContainerButtonWindow(find("unmake_home_button"));
         var_1691 = IButtonWindow(find("room_settings_button"));
         var_1689 = IButtonWindow(find("create_event_button"));
         var_1692 = IButtonWindow(find("edit_event_button"));
         var_983 = IWindowContainer(find("embed_info"));
         var_1439 = ITextWindow(find("embed_info_txt"));
         var_1173 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1444,onAddFavouriteClick);
         Util.setProcDirectly(var_1442,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1691,onRoomSettingsClick);
         Util.setProcDirectly(var_1441,onMakeHomeClick);
         Util.setProcDirectly(var_1443,onUnmakeHomeClick);
         Util.setProcDirectly(var_1689,onEventSettingsClick);
         Util.setProcDirectly(var_1692,onEventSettingsClick);
         Util.setProcDirectly(var_1173,onEmbedSrcClick);
         _navigator.refreshButton(var_1444,"favourite",true,null,0);
         _navigator.refreshButton(var_1442,"favourite",true,null,0);
         _navigator.refreshButton(var_1441,"home",true,null,0);
         _navigator.refreshButton(var_1443,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_296,onHover);
         Util.setProcDirectly(var_297,onHover);
         var_1171.width = var_1171.textWidth;
         Util.moveChildrenToRow(var_2338,["owner_caption","owner_name"],var_1171.x,var_1171.y,3);
         var_984.width = var_984.textWidth;
         Util.moveChildrenToRow(var_2337,["rating_caption","rating_txt"],var_984.x,var_984.y,3);
         var_1439.height = NaN;
         Util.moveChildrenToColumn(var_983,["embed_info_txt","embed_src_txt"],var_1439.y,2);
         var_983.height = Util.getLowestPoint(var_983) + 5;
         var_2476 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2335.text = param1.eventName;
         var_814.text = param1.eventDescription;
         var_925.refreshTags(var_985,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_814.visible = false;
         if(param1.eventDescription != "")
         {
            var_814.height = NaN;
            var_814.y = Util.getLowestPoint(var_985) + 2;
            var_814.visible = true;
         }
         var_985.visible = true;
         var_985.height = Util.getLowestPoint(var_985);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_886,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
