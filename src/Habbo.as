package
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageQuality;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.StatusEvent;
   import flash.external.ExternalInterface;
   import flash.net.LocalConnection;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   
   public class Habbo extends MovieClip
   {
      
      public static const const_17:String = "client.init.swf.loaded";
      
      public static const const_11:String = "client.init.volter.retry";
      
      public static const const_3:String = "fileLoadingBar";
      
      public static const const_19:String = "error_desc";
      
      public static const const_2:String = "byteLoadingBar";
      
      public static const const_21:String = "client.init.volter.fail";
      
      private static var _crashURL:String = "";
      
      public static const const_8:String = "byteBarSprite";
      
      public static const const_23:String = "crash_time";
      
      private static const const_5:String = "client.starting";
      
      public static const const_6:String = "background";
      
      public static const const_28:String = "client.init.core.init";
      
      public static const const_7:String = "client.init.swf.error";
      
      public static const const_9:int = 9;
      
      public static const const_22:String = "error_ctx";
      
      private static var _crashed:Boolean = false;
      
      public static const const_29:String = "client.init.core.fail";
      
      public static const const_18:String = "error_cat";
      
      private static const const_27:Number = 0.71;
      
      public static const FILE_BAR_SPRITE:String = "fileBarSprite";
      
      public static const const_1:String = "textField";
      
      public static const const_4:String = "habboLogo";
      
      protected static var PROCESSLOG_ENABLED:Boolean = false;
      
      private static const const_24:String = "HABBO_LOCAL_CONNECTION";
      
      public static const const_14:String = "client.init.start";
      
      public static const const_20:int = 11;
      
      public static const const_16:String = "debug";
      
      private static const const_25:Number = 0.29;
      
      public static const const_15:String = "avg_update";
      
      public static const const_13:String = "client.init.volter.loaded";
      
      private static const const_26:String = "testLocalConnection";
      
      public static const const_12:String = "error_data";
      
      public static const const_10:String = "flash_version";
       
      
      private var _disposed:Boolean = false;
      
      private var var_3:int;
      
      private var var_1:DisplayObjectContainer;
      
      private var var_2:Boolean = false;
      
      private var habboLogoClass:Class;
      
      private var var_5:Bitmap;
      
      private var var_6:LocalConnection;
      
      private var var_4:int = 0;
      
      public function Habbo()
      {
         habboLogoClass = Habbo_habboLogoClass;
         super();
         stop();
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.quality = StageQuality.LOW;
         stage.align = StageAlign.TOP_LEFT;
         Habbo.PROCESSLOG_ENABLED = stage.loaderInfo.parameters["processlog.enabled"] == "1";
         trackLoginStep(const_14);
         var _loc1_:String = stage.loaderInfo.parameters["url_prefix"];
         if(_loc1_ != null)
         {
            _crashURL = _loc1_ + "/flash_client_error";
         }
         root.loaderInfo.addEventListener(ProgressEvent.PROGRESS,onPreLoadingProgress);
         root.loaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,onPreLoadingStatus);
         root.loaderInfo.addEventListener(Event.COMPLETE,onPreLoadingCompleted);
         root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onPreLoadingFailed);
         var_1 = createLoadingScreen();
         addChild(var_1);
         loadVolter();
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         var_3 = getTimer();
      }
      
      public static function reportCrash(param1:String, param2:int, param3:Error) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(!Habbo._crashed)
         {
            Habbo._crashed = true;
            _loc4_ = Habbo._crashURL;
            _loc5_ = new URLRequest(_loc4_);
            _loc6_ = new URLVariables();
            _loc6_[const_23] = new Date().getTime().toString();
            _loc7_ = "";
            _loc6_[const_22] = _loc7_;
            _loc6_[const_10] = Capabilities.version;
            _loc6_[const_15] = 0;
            _loc6_[const_19] = param1;
            _loc6_[const_18] = String(param2);
            if(param3 != null)
            {
               _loc6_[const_12] = String(param3.getStackTrace());
            }
            _loc6_[const_16] = "Memory usage: " + Math.round(0 / (1024 * 1024)) + " MB";
            _loc5_.data = _loc6_;
            _loc5_.method = URLRequestMethod.POST;
            navigateToURL(_loc5_,"_self");
         }
      }
      
      private static function positionLoadingScreenDisplayElements(param1:DisplayObjectContainer) : void
      {
         var _loc2_:Stage = param1.stage;
         var _loc3_:Sprite = param1.getChildByName(const_6) as Sprite;
         if(_loc3_)
         {
            _loc3_.x = 0;
            _loc3_.y = 0;
            _loc3_.graphics.clear();
            _loc3_.graphics.beginFill(4278190080);
            _loc3_.graphics.drawRect(0,0,!!_loc2_ ? Number(_loc2_.stageWidth) : Number(param1.width),!!_loc2_ ? Number(_loc2_.stageHeight) : Number(param1.height));
         }
         var _loc4_:Bitmap = param1.getChildByName(const_4) as Bitmap;
         if(_loc4_)
         {
            _loc4_.x = 117;
            _loc4_.y = 57;
         }
         positionLoadingScreenTextField(param1);
         var _loc5_:Sprite = param1.getChildByName(const_3) as Sprite;
         if(_loc5_)
         {
            _loc5_.x = 89;
            _loc5_.y = 149;
         }
         var _loc6_:Sprite = param1.getChildByName(const_2) as Sprite;
         if(_loc6_)
         {
            _loc6_.x = 89;
            _loc6_.y = 179;
         }
      }
      
      private static function positionLoadingScreenTextField(param1:DisplayObjectContainer) : void
      {
         var _loc3_:* = null;
         var _loc2_:TextField = param1.getChildByName(const_1) as TextField;
         if(_loc2_)
         {
            _loc2_.x = 191 - _loc2_.width / 2;
            _loc3_ = param1.getChildByName(const_4) as Bitmap;
            if(_loc3_)
            {
               _loc2_.y = _loc3_.y + _loc3_.height + 28 - 10;
            }
         }
      }
      
      public static function trackLoginStep(param1:String) : void
      {
         if(Habbo.PROCESSLOG_ENABLED)
         {
            Logger.log("* HabboMain Login Step: " + param1);
            if(false)
            {
               ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
            }
            else
            {
               Logger.log("HabboMain: ExternalInterface is not available, tracking is disabled");
            }
         }
      }
      
      public function onFadingAnimationComplete(param1:Event) : void
      {
         dispose();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         stage.addEventListener(Event.RESIZE,onResize);
         positionLoadingScreenDisplayElements(var_1);
      }
      
      private function onPreLoadingCompleted(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            finalizePreloading();
         }
         catch(error:Error)
         {
            trackLoginStep(const_7);
            reportCrash("Failed to finalize main swf preloading: " + error.message,const_9,error);
         }
      }
      
      public function createLoadingScreen() : DisplayObjectContainer
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Sprite = new Sprite();
         _loc2_.name = const_6;
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(4278190080);
         _loc2_.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
         _loc1_.addChild(_loc2_);
         var _loc3_:Bitmap = new habboLogoClass() as Bitmap;
         _loc3_.name = const_4;
         _loc1_.addChild(_loc3_);
         var _loc4_:TextField = new TextField();
         _loc4_.name = const_1;
         if(stage.loaderInfo.parameters[const_5] != null)
         {
            _loc4_.text = stage.loaderInfo.parameters[const_5];
         }
         else
         {
            _loc4_.text = const_5;
         }
         _loc4_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.addChild(_loc4_);
         updateFont(_loc4_,"Verdana");
         _loc5_ = new Sprite();
         _loc5_.name = const_3;
         _loc5_.graphics.lineStyle(1,16777215);
         _loc5_.graphics.beginFill(2500143);
         _loc5_.graphics.drawRect(1,0,199,0);
         _loc5_.graphics.drawRect(200,1,0,19);
         _loc5_.graphics.drawRect(1,20,199,0);
         _loc5_.graphics.drawRect(0,1,0,19);
         _loc5_.graphics.endFill();
         _loc1_.addChild(_loc5_);
         _loc6_ = new Sprite();
         _loc6_.name = FILE_BAR_SPRITE;
         _loc5_.addChild(_loc6_);
         _loc5_ = new Sprite();
         _loc5_.name = const_2;
         _loc5_.graphics.lineStyle(1,16777215);
         _loc5_.graphics.beginFill(2500143);
         _loc5_.graphics.drawRect(1,0,199,0);
         _loc5_.graphics.drawRect(200,1,0,19);
         _loc5_.graphics.drawRect(1,20,199,0);
         _loc5_.graphics.drawRect(0,1,0,19);
         _loc5_.graphics.endFill();
         _loc1_.addChild(_loc5_);
         _loc6_ = new Sprite();
         _loc6_.name = const_8;
         _loc5_.addChild(_loc6_);
         _loc5_.visible = false;
         updateLoadingBar(_loc1_,0);
         positionLoadingScreenDisplayElements(_loc1_);
         return _loc1_;
      }
      
      private function checkPreLoadingStatus() : void
      {
         if(!var_2)
         {
            if(root.loaderInfo.bytesLoaded == root.loaderInfo.bytesTotal)
            {
               onPreLoadingCompleted(null);
            }
         }
      }
      
      private function onVolterLoadingFailedAgain(param1:IOErrorEvent) : void
      {
         trackLoginStep(const_21);
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         if(_loc2_)
         {
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,onVolterLoadingFailedAgain);
            _loc2_.removeEventListener(Event.COMPLETE,onVolterLoadingCompleted);
         }
         Habbo.reportCrash("Failed to download Volter.swf!",const_20,new Error(param1.text));
      }
      
      private function onLocalConnectionStatus(param1:StatusEvent) : void
      {
         trace("Local connection status: " + param1.code);
      }
      
      private function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         root.removeEventListener(Event.RESIZE,onResize);
         if(!_disposed)
         {
            _disposed = true;
            if(var_1)
            {
               disposeLoadingScreen(var_1);
               removeChild(var_1);
               var_1 = null;
            }
            if(parent)
            {
               parent.removeChild(this);
            }
         }
      }
      
      private function onMainRemoved(param1:Event) : void
      {
         dispose();
      }
      
      private function onPreLoadingProgress(param1:Event) : void
      {
         if(var_1)
         {
            updateLoadingBar(var_1,root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal);
         }
      }
      
      private function updateLoadingBar(param1:DisplayObjectContainer, param2:Number) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc7_:Sprite = param1.getChildByName(const_3) as Sprite;
         var _loc8_:Sprite = _loc7_.getChildByName(FILE_BAR_SPRITE) as Sprite;
         var _loc9_:Sprite = param1.getChildByName(const_2) as Sprite;
         var _loc10_:Sprite = _loc9_.getChildByName(const_8) as Sprite;
         _loc8_.x = 1 + 1;
         _loc8_.y = 1 + 1;
         _loc8_.graphics.clear();
         _loc11_ = 16;
         _loc12_ = 0;
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
         _loc12_ = 196 * param2;
         _loc10_.graphics.beginFill(12241619);
         _loc10_.graphics.drawRect(0,0,_loc12_,_loc11_ / 2);
         _loc10_.graphics.endFill();
         _loc10_.graphics.beginFill(9216429);
         _loc10_.graphics.drawRect(0,_loc11_ / 2,_loc12_,_loc11_ / 2 + 1);
         _loc10_.graphics.endFill();
      }
      
      private function onVolterLoadingFailed(param1:IOErrorEvent) : void
      {
         trackLoginStep(const_11);
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         if(_loc2_)
         {
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,onVolterLoadingFailed);
            _loc2_.removeEventListener(Event.COMPLETE,onVolterLoadingCompleted);
         }
         loadVolter(true);
      }
      
      public function disposeLoadingScreen(param1:DisplayObjectContainer) : void
      {
         var _loc2_:* = null;
         _loc2_ = param1.getChildByName(const_6);
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
         }
         _loc2_ = param1.getChildByName(const_1);
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
         }
         _loc2_ = param1.getChildByName(const_4);
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
         }
         _loc2_ = param1.getChildByName(const_3);
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
         }
         _loc2_ = param1.getChildByName(const_2);
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
         }
      }
      
      private function onPreLoadingStatus(param1:HTTPStatusEvent) : void
      {
         var_4 = param1.status;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         parent.setChildIndex(this,-1);
      }
      
      private function onPreLoadingFailed(param1:IOErrorEvent) : void
      {
         trackLoginStep(const_7);
         reportCrash("Failed to finalize main swf preloading: " + param1.text + " / HTTP status: " + var_4,const_9,null);
      }
      
      private function finalizePreloading() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_2)
         {
            var_2 = true;
            trackLoginStep(const_17);
            root.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,onPreLoadingProgress);
            root.loaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onPreLoadingStatus);
            root.loaderInfo.removeEventListener(Event.COMPLETE,onPreLoadingCompleted);
            root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onPreLoadingFailed);
            nextFrame();
            _loc1_ = Class(getDefinitionByName("HabboMain"));
            if(_loc1_)
            {
               _loc2_ = new _loc1_(var_1) as DisplayObject;
               if(_loc2_)
               {
                  _loc2_.addEventListener(Event.REMOVED,onMainRemoved);
                  addChild(_loc2_);
               }
            }
         }
      }
      
      private function updateFont(param1:TextField, param2:String, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(param1)
         {
            _loc4_ = new TextFormat();
            _loc4_.font = param2;
            _loc4_.color = 16777215;
            _loc4_.size = 9;
            param1.defaultTextFormat = _loc4_;
            param1.embedFonts = param3;
            param1.text = param1.text;
         }
      }
      
      private function onResize(param1:Event) : void
      {
         if(param1.type == Event.RESIZE)
         {
            if(var_1)
            {
               positionLoadingScreenDisplayElements(var_1);
            }
         }
      }
      
      private function loadVolter(param1:Boolean = false) : void
      {
         var _loc2_:String = "Volter.swf";
         var _loc3_:Loader = new Loader();
         if(param1)
         {
            _loc2_ = _loc2_ + "?" + new Date().getTime();
            _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onVolterLoadingFailedAgain);
         }
         else
         {
            _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onVolterLoadingFailed);
         }
         var _loc4_:LoaderContext = new LoaderContext();
         _loc4_.applicationDomain = ApplicationDomain.currentDomain;
         _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,onVolterLoadingCompleted);
         _loc3_.load(new URLRequest(_loc2_),_loc4_);
      }
      
      private function onVolterLoadingCompleted(param1:Event) : void
      {
         trackLoginStep(const_13);
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         if(_loc2_)
         {
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,onVolterLoadingFailed);
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,onVolterLoadingFailedAgain);
            _loc2_.removeEventListener(Event.COMPLETE,onVolterLoadingCompleted);
         }
         if(var_1)
         {
            updateFont(var_1.getChildByName(const_1) as TextField,"Volter",true);
            positionLoadingScreenTextField(var_1);
         }
         checkPreLoadingStatus();
      }
      
      public function testLocalConnection(param1:int) : void
      {
         var identifier:int = param1;
         trace("Local connection message received: " + identifier);
         try
         {
            if(identifier != var_3)
            {
               dispose();
            }
         }
         catch(e:Error)
         {
         }
      }
   }
}
