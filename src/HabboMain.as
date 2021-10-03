package
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICore;
   import com.sulake.core.runtime.events.LibraryProgressEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   
   public class HabboMain extends Sprite
   {
      
      private static const const_25:Number = 0.29;
      
      private static const const_27:Number = 0.71;
       
      
      private var var_1200:Boolean = false;
      
      private var var_1:DisplayObjectContainer;
      
      private var var_1199:HabboTracking;
      
      private var var_28:ICore;
      
      public function HabboMain(param1:DisplayObjectContainer)
      {
         super();
         var_1 = param1;
         var_1.addEventListener(Event.COMPLETE,onCompleteEvent);
         var_1.addEventListener(ProgressEvent.PROGRESS,onProgressEvent);
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         Logger.log("Core version: undefined");
      }
      
      private function updateLoadingBar(param1:DisplayObjectContainer, param2:Number) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc7_:Sprite = param1.getChildByName(Habbo.const_3) as Sprite;
         var _loc8_:Sprite = _loc7_.getChildByName(Habbo.FILE_BAR_SPRITE) as Sprite;
         var _loc9_:Sprite = param1.getChildByName(Habbo.const_2) as Sprite;
         var _loc10_:Sprite = _loc9_.getChildByName(Habbo.const_8) as Sprite;
         var _loc13_:int = var_28.getNumberOfFilesPending() + var_28.getNumberOfFilesLoaded();
         var _loc14_:Number = 1 - const_27 + var_28.getNumberOfFilesLoaded() / _loc13_ * const_27;
         _loc8_.x = 1 + 1;
         _loc8_.y = 1 + 1;
         _loc8_.graphics.clear();
         _loc11_ = 16;
         _loc12_ = 196 * _loc14_;
         _loc8_.graphics.beginFill(12241619);
         _loc8_.graphics.drawRect(0,0,_loc12_,_loc11_ / 2);
         _loc8_.graphics.endFill();
         _loc8_.graphics.beginFill(9216429);
         _loc8_.graphics.drawRect(0,_loc11_ / 2,_loc12_,_loc11_ / 2 + 1);
         _loc8_.graphics.endFill();
         _loc10_.x = 1 + 1;
         _loc10_.y = 1 + 1;
         _loc10_.graphics.clear();
         _loc11_ = 16;
         _loc12_ = 196;
         _loc10_.graphics.beginFill(12241619);
         _loc10_.graphics.drawRect(0,0,_loc12_ * param2,_loc11_ / 2);
         _loc10_.graphics.endFill();
         _loc10_.graphics.beginFill(9216429);
         _loc10_.graphics.drawRect(0,_loc11_ / 2,_loc12_ * param2,_loc11_ / 2 + 1);
         _loc10_.graphics.endFill();
      }
      
      public function unloading() : void
      {
         if(var_28 && true)
         {
            var_28.events.dispatchEvent(new Event(Event.UNLOAD));
         }
      }
      
      private function prepareCore() : void
      {
         Habbo.trackLoginStep(Habbo.const_28);
         var_28 = Core.instantiate(stage,0);
         var_28.events.addEventListener(Component.COMPONENT_EVENT_ERROR,onCoreError);
         var_28.prepareComponent(CoreCommunicationFrameworkLib);
         var_28.prepareComponent(HabboRoomObjectLogicLib);
         var_28.prepareComponent(HabboRoomObjectVisualizationLib);
         var_28.prepareComponent(RoomManagerLib);
         var_28.prepareComponent(RoomSpriteRendererLib);
         var_28.prepareComponent(HabboRoomSessionManagerLib);
         var_28.prepareComponent(HabboAvatarRenderLib);
         var_28.prepareComponent(HabboRoomWidgetLib);
         var_28.prepareComponent(HabboSessionDataManagerLib);
         var_28.prepareComponent(HabboTrackingLib);
         var_28.prepareComponent(HabboConfigurationCom);
         var_28.prepareComponent(HabboLocalizationCom);
         var_28.prepareComponent(HabboWindowManagerCom);
         var_28.prepareComponent(HabboCommunicationCom);
         var_28.prepareComponent(HabboCommunicationDemoCom);
         var_28.prepareComponent(HabboNavigatorCom);
         var_28.prepareComponent(HabboFriendListCom);
         var_28.prepareComponent(HabboMessengerCom);
         var_28.prepareComponent(HabboInventoryCom);
         var_28.prepareComponent(HabboToolbarCom);
         var_28.prepareComponent(HabboCatalogCom);
         var_28.prepareComponent(HabboRoomEngineCom);
         var_28.prepareComponent(HabboRoomUICom);
         var_28.prepareComponent(HabboAvatarEditorCom);
         var_28.prepareComponent(HabboNotificationsCom);
         var_28.prepareComponent(HabboHelpCom);
         var_28.prepareComponent(HabboAdManagerCom);
         var_28.prepareComponent(HabboModerationCom);
         Logger.log("Trying to embed Flash 9 version");
         var_28.prepareComponent(HabboSoundManagerCom);
         var_1199 = HabboTracking.getInstance();
         var _loc1_:AssetLoaderStruct = var_28.assets.loadAssetFromFile("config.xml",new URLRequest("config_habbo.xml"));
         if(_loc1_.assetLoader.ready)
         {
            setupCoreConfigFromLoader(_loc1_);
         }
         else
         {
            _loc1_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,configLoadedHandler);
            _loc1_.addEventListener(AssetLoaderEvent.const_48,configLoadedHandler);
         }
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_48,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE)
         {
            setupCoreConfigFromLoader(_loc2_);
         }
         else
         {
            Habbo.reportCrash("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",Core.const_162,null);
         }
      }
      
      private function onProgressEvent(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_1)
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
            updateLoadingBar(var_1,_loc2_);
            _loc3_ = var_1.getChildByName("background") as Sprite;
            if(_loc3_)
            {
               _loc3_.alpha = Math.min(1 - _loc2_,_loc3_.alpha);
            }
            if(param1 is LibraryProgressEvent)
            {
               _loc4_ = param1 as LibraryProgressEvent;
               if(_loc4_.fileName == "hh_human_fx.swf" || _loc4_.fileName == "hh_human_body.swf")
               {
                  if(var_1199 && true)
                  {
                     var_1199.track("libraryLoaded",_loc4_.fileName,_loc4_.elapsedTime);
                  }
               }
            }
         }
      }
      
      private function initializeCore() : void
      {
         try
         {
            var_28.initialize();
            if(false)
            {
               ExternalInterface.addCallback("unloading",unloading);
            }
         }
         catch(error:Error)
         {
            Habbo.trackLoginStep(Habbo.const_29);
            Core.crash("Failed to initialize the core: " + error.message,Core.const_837,error);
         }
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         var event:Event = param1;
         try
         {
            prepareCore();
         }
         catch(error:Error)
         {
            Habbo.trackLoginStep(Habbo.const_29);
            Habbo.reportCrash("Failed to prepare the core: " + error.message,Core.const_837,error);
            Core.dispose();
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:* = null;
         if(var_1)
         {
            _loc2_ = var_1.getChildByName("background") as Sprite;
            if(_loc2_)
            {
               _loc2_.alpha -= 0.01;
               if(_loc2_.alpha <= 0)
               {
               }
            }
            if(var_1200)
            {
               if(true)
               {
                  dispose();
                  var_1200 = false;
               }
               else
               {
                  var_1.alpha = -0.1;
               }
            }
         }
      }
      
      public function onCoreError(param1:Event) : void
      {
         Habbo.trackLoginStep(Habbo.const_29);
      }
      
      private function onCompleteEvent(param1:Event) : void
      {
         updateLoadingBar(var_1,1);
         initializeCore();
         var_1200 = true;
      }
      
      private function setupCoreConfigFromLoader(param1:AssetLoaderStruct) : void
      {
         var _loc2_:XmlAsset = var_28.assets.getAssetByName(param1.assetName) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            Habbo.reportCrash("Download external configuration document is null!",Core.const_162,null);
         }
         if(var_28)
         {
            var_28.readConfigDocument(XML(_loc2_.content),var_1);
         }
         else
         {
            Habbo.reportCrash("Core vanished while downloading config document!",Core.const_162,null);
         }
      }
      
      private function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         if(var_1)
         {
            var_1.removeEventListener(Event.COMPLETE,onCompleteEvent);
            var_1.removeEventListener(ProgressEvent.PROGRESS,onProgressEvent);
            var_1 = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}
