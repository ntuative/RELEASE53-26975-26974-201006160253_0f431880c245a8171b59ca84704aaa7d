package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.avatar.enum.AvatarEditorEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.generic.BodyModel;
   import com.sulake.habbo.avatar.head.HeadModel;
   import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
   import com.sulake.habbo.avatar.legs.LegsModel;
   import com.sulake.habbo.avatar.promo.ClubPromoModel;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.torso.TorsoModel;
   import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboAvatarEditor extends Component implements IHabboAvatarEditor
   {
      
      private static const const_1160:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      private static const const_1161:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
       
      
      private var _view:AvatarEditorView;
      
      private var var_978:AvatarEditorHandler;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_250:IWindowContainer;
      
      private var var_648:ISessionDataManager;
      
      private var var_660:IAvatarRenderManager;
      
      private var var_93:Map;
      
      private var var_1160:int = 0;
      
      private var var_169:Boolean = false;
      
      private var var_555:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private const const_1159:int = 2;
      
      private var _catalog:IHabboCatalog;
      
      private var var_11:IHabboInventory;
      
      private var var_616:String;
      
      private var var_1678:Boolean;
      
      private var var_1159:IHabboAvatarEditorDataSaver = null;
      
      private var var_1679:Boolean = false;
      
      private var var_146:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_803:IFigureData;
      
      private var var_461:Map;
      
      public function HabboAvatarEditor(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_616 = FigureData.const_73;
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
      }
      
      public function getFigureSetType(param1:String) : ISetType
      {
         if(var_803 == null)
         {
            return null;
         }
         return var_803.getSetType(param1);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      public function useClubClothing() : void
      {
         if(var_93 == null)
         {
            return;
         }
         if(var_1678)
         {
            return;
         }
         var_1678 = true;
         update();
      }
      
      public function close() : void
      {
         if(var_250 != null)
         {
            var_250.visible = false;
         }
         else
         {
            this.events.dispatchEvent(new AvatarEditorClosedEvent());
         }
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_146 = param2 as IHabboConfigurationManager;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return var_648;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_93)
         {
            _loc1_.reset();
         }
         for each(_loc2_ in var_461)
         {
            _loc2_.reset();
         }
         if(_view)
         {
            _view.update();
         }
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_169)
         {
            var_555 = new Dictionary();
            var_555["null"] = new FigureData(this);
            var_555["null"] = new FigureData(this);
            _loc1_ = var_555["null"];
            _loc2_ = var_555["null"];
            _loc1_.loadAvatarData(const_1160,FigureData.const_73);
            _loc2_.loadAvatarData(const_1161,FigureData.FEMALE);
            var_93 = new Map();
            var_461 = new Map();
            var_93.add(AvatarEditorFigureCategory.const_681,new BodyModel(this));
            var_93.add(AvatarEditorFigureCategory.const_45,new HeadModel(this));
            var_93.add(AvatarEditorFigureCategory.const_209,new TorsoModel(this));
            var_93.add(AvatarEditorFigureCategory.const_572,new LegsModel(this));
            var_93.add(AvatarEditorFigureCategory.HOTLOOKS,new HotLooksModel(this));
            var_461.add(AvatarEditorSideCategory.const_102,new WardrobeModel(this));
            var_461.add(AvatarEditorSideCategory.const_397,new ClubPromoModel(this));
            var_169 = true;
         }
      }
      
      public function set gender(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_616 == param1)
         {
            return;
         }
         var_616 = param1;
         for each(_loc2_ in var_93)
         {
            _loc2_.reset();
         }
         if(_view != null)
         {
            _view.update();
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_648 = param2 as ISessionDataManager;
      }
      
      private function orderByClub(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc3_:Number = param1.partSet == null ? -1 : Number(Number(param1.partSet.clubLevel));
         var _loc4_:Number = param2.partSet == null ? -1 : Number(Number(param2.partSet.clubLevel));
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _localization;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function hasInvalidClubItems() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc1_:Boolean = false;
         for each(_loc2_ in var_93)
         {
            _loc3_ = _loc2_.hasClubItemsOverLevel(clubMemberLevel);
            if(_loc3_)
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_146 != null)
         {
            var_146.release(new IIDHabboConfigurationManager());
            var_146 = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_660 != null)
         {
            var_660.release(new IIDAvatarRenderManager());
            var_660 = null;
         }
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(var_11 != null)
         {
            var_11.release(new IIDHabboInventory());
            var_11 = null;
         }
         if(var_93 != null)
         {
            for each(_loc1_ in var_93)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_93 = null;
         }
         if(var_461 != null)
         {
            for each(_loc2_ in var_461)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
            var_461 = null;
         }
         if(var_250 != null)
         {
            var_250.dispose();
            var_250 = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(var_978 != null)
         {
            var_978.dispose();
            var_978 = null;
         }
         var_803 = null;
         var_555 = null;
         var_1159 = null;
         super.dispose();
      }
      
      public function saveCurrentSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_1159 != null)
         {
            _loc1_ = figureData.getFigureString();
            _loc2_ = "null";
            var_1159.saveFigure(_loc1_,_loc2_);
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function getDefaultColour(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ISetType = getFigureSetType(param1);
         if(_loc2_ != null)
         {
            _loc3_ = getPalette(_loc2_.paletteID);
            for each(_loc4_ in _loc3_.colors)
            {
               if(_loc4_.isSelectable && var_1160 >= _loc4_.clubLevel)
               {
                  return _loc4_.id;
               }
            }
         }
         return -1;
      }
      
      public function get figureData() : FigureData
      {
         return var_555[var_616];
      }
      
      public function generateDataContent(param1:IAvatarEditorCategoryModel, param2:String) : CategoryData
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:Boolean = false;
         var _loc14_:* = null;
         var _loc15_:* = false;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:Boolean = false;
         var _loc22_:* = null;
         if(!param1)
         {
            return null;
         }
         if(!param2)
         {
            return null;
         }
         var _loc3_:* = [];
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < const_1159)
         {
            _loc4_.push(new Array());
            _loc5_++;
         }
         var _loc9_:Boolean = false;
         _loc8_ = getFigureSetType(param2);
         if(!_loc8_)
         {
            return null;
         }
         switch(param2)
         {
            case FigureData.const_148:
            case FigureData.const_186:
            case FigureData.const_191:
            case FigureData.const_173:
            case FigureData.const_169:
            case FigureData.const_189:
            case FigureData.CHEST_ACCESSORIES:
            case FigureData.const_174:
            case FigureData.const_172:
            case FigureData.const_181:
               _loc9_ = true;
         }
         if(_loc8_ != null)
         {
            _loc10_ = getPalette(_loc8_.paletteID);
            if(!_loc10_)
            {
               return null;
            }
            _loc11_ = figureData.getColourIds(param2);
            if(!_loc11_)
            {
               _loc11_ = new Array();
            }
            _loc12_ = new Array(_loc11_.length);
            _loc13_ = isClubTryoutAllowed() && var_1678;
            for each(_loc14_ in _loc10_.colors)
            {
               if(_loc14_.isSelectable && (_loc13_ || var_1160 >= _loc14_.clubLevel))
               {
                  _loc16_ = 0;
                  while(_loc16_ < const_1159)
                  {
                     _loc17_ = new AvatarEditorGridColorItem(AvatarEditorView.var_1705.clone() as IWindowContainer,param1,_loc14_);
                     _loc4_[_loc16_].push(_loc17_);
                     _loc16_++;
                  }
                  if(param2 != FigureData.FACE)
                  {
                     _loc18_ = 0;
                     while(_loc18_ < _loc11_.length)
                     {
                        if(_loc14_.id == _loc11_[_loc18_])
                        {
                           _loc12_[_loc18_] = _loc14_;
                        }
                        _loc18_++;
                     }
                  }
               }
            }
            if(_loc9_)
            {
               _loc19_ = _assets.getAssetByName("removeSelection") as BitmapDataAsset;
               if(_loc19_)
               {
                  _loc20_ = (_loc19_.content as BitmapData).clone();
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1469.clone() as IWindowContainer,param1,null,null,false);
                  _loc7_.iconImage = _loc20_;
                  _loc3_.push(_loc7_);
               }
            }
            _loc15_ = param2 != FigureData.FACE;
            for each(_loc6_ in _loc8_.partSets)
            {
               _loc21_ = false;
               if(_loc6_.gender == FigureData.const_1188)
               {
                  _loc21_ = true;
               }
               else if(_loc6_.gender == gender)
               {
                  _loc21_ = true;
               }
               if(_loc6_.isSelectable && _loc21_ && (_loc13_ || var_1160 >= _loc6_.clubLevel))
               {
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1469.clone() as IWindowContainer,param1,_loc6_,_loc12_,_loc15_);
                  _loc3_.push(_loc7_);
               }
            }
         }
         _loc3_.sort(orderByClub);
         _loc5_ = 0;
         while(_loc5_ < const_1159)
         {
            _loc22_ = _loc4_[_loc5_] as Array;
            _loc22_.sort(orderPaletteByClub);
            _loc5_++;
         }
         return new CategoryData(_loc3_,_loc4_);
      }
      
      public function get wardrobe() : WardrobeModel
      {
         if(!var_169)
         {
            init();
         }
         return var_461.getValue(AvatarEditorSideCategory.const_102);
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _communication = param2 as IHabboCommunicationManager;
         var_978 = new AvatarEditorHandler(this,_communication);
      }
      
      public function getPalette(param1:int) : IPalette
      {
         if(var_803 == null)
         {
            return null;
         }
         return var_803.getPalette(param1);
      }
      
      public function get gender() : String
      {
         return var_616;
      }
      
      public function get handler() : AvatarEditorHandler
      {
         return var_978;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function isWardrobeAllowed() : Boolean
      {
         return !var_1679;
      }
      
      public function isClubTryoutAllowed() : Boolean
      {
         var _loc1_:String = configuration.getKey("avatareditor.allowclubtryout");
         return _loc1_ == "1" && !var_1679;
      }
      
      public function toggleAvatarEditorPage(param1:String) : void
      {
         _view.toggleCategoryView(param1,false);
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return var_660;
      }
      
      public function getSideContentWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:ISideContentModel = var_461.getValue(param1) as ISideContentModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function openEditor(param1:IWindowContainer = null, param2:IHabboAvatarEditorDataSaver = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         if(!var_169)
         {
            init();
         }
         var_1679 = param4;
         if(_view != null)
         {
            if(!_view.validateAvailableCategories(param3))
            {
               _view.dispose();
               _view = null;
            }
         }
         if(_view == null)
         {
            _view = new AvatarEditorView(this,_windowManager,_catalog,param3,!param4);
         }
         if(param1 != null)
         {
            param1.addChild(_view.window);
         }
         else
         {
            if(var_250 == null)
            {
               var_250 = _windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_56,HabboWindowStyle.const_42,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               var_250.addChild(_view.window);
               var_250.center();
               var_250.visible = false;
            }
            var_250.visible = true;
         }
         _view.show();
         if(param3 != null && param3.length > 0)
         {
            toggleAvatarEditorPage(param3[0]);
         }
         else
         {
            toggleAvatarEditorPage(AvatarEditorFigureCategory.const_681);
         }
         var_1159 = param2;
         return true;
      }
      
      private function onAvatarRendererReady(param1:Event = null) : void
      {
         var_803 = var_660.getFigureData(AvatarType.const_80);
         this.events.dispatchEvent(new Event(AvatarEditorEvent.AVATAR_EDITOR_READY));
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_660 = param2 as IAvatarRenderManager;
         (var_660 as Component).events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY,onAvatarRendererReady);
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IAvatarEditorCategoryModel = var_93.getValue(param1) as IAvatarEditorCategoryModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_11 = param2 as IHabboInventory;
      }
      
      public function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void
      {
         var _loc5_:* = null;
         switch(param2)
         {
            case FigureData.const_73:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         var_1160 = param3;
         var _loc4_:FigureData = var_555[param2];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.loadAvatarData(param1,param2);
         if(param2 != this.gender)
         {
            this.gender = param2;
         }
         if(var_93)
         {
            for each(_loc5_ in var_93)
            {
               _loc5_.reset();
            }
         }
         if(_view != null)
         {
            _view.update();
         }
      }
      
      public function get windowContext() : IWindowContainer
      {
         return var_250;
      }
      
      public function stripClubItems() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_93)
         {
            _loc1_.stripClubItemsOverLevel(clubMemberLevel);
         }
      }
      
      public function get clubMemberLevel() : int
      {
         return var_1160;
      }
      
      private function orderPaletteByClub(param1:AvatarEditorGridColorItem, param2:AvatarEditorGridColorItem) : Number
      {
         var _loc3_:Number = param1.partColor == null ? -1 : Number(param1.partColor.clubLevel as Number);
         var _loc4_:Number = param2.partColor == null ? -1 : Number(param2.partColor.clubLevel as Number);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partColor.index < param2.partColor.index)
         {
            return -1;
         }
         if(param1.partColor.index > param2.partColor.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_146;
      }
   }
}
