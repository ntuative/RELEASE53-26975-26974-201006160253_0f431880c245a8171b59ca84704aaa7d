package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class InfoStandPetView
   {
       
      
      private var var_594:int;
      
      private const const_1728:uint = 6710886;
      
      private var _window:IItemListWindow;
      
      private const const_1733:String = "level";
      
      private var var_105:IItemListWindow;
      
      private const const_1731:String = "energy";
      
      private var var_1247:Map;
      
      private const const_1726:String = "nutrition";
      
      private var var_63:IItemListWindow;
      
      private const const_1732:uint = 3355443;
      
      private var var_228:IBorderWindow;
      
      private const const_1727:int = 158;
      
      private const const_1725:int = 16;
      
      private var _widget:InfostandWidget;
      
      private var var_172:PetCommandTool;
      
      private const const_1729:uint = 11184810;
      
      private const const_1730:String = "experience";
      
      public function InfoStandPetView(param1:InfostandWidget, param2:String)
      {
         super();
         _widget = param1;
         createWindow(param2);
         var_1247 = new Map();
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("pet_view") as XmlAsset;
         _window = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_228 = _window.getListItemByName("info_border") as IBorderWindow;
         if(var_228 != null)
         {
            var_105 = var_228.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         _widget.mainContainer.addChild(_window);
         var _loc3_:IWindow = var_228.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClose);
         }
         var_63 = _window.getListItemByName("button_list") as IItemListWindow;
         if(var_63 == null)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < var_63.numListItems)
         {
            _loc9_ = var_63.getListItemAt(_loc4_) as IRegionWindow;
            if(_loc9_ != null)
            {
               _loc5_ = _loc9_.getChildAt(0);
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
            }
            _loc4_++;
         }
         var _loc6_:IBitmapWrapperWindow = var_228.findChildByName("petrespect_icon") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc10_ = _widget.assets.getAssetByName("icon_petrespect") as BitmapDataAsset;
            _loc11_ = _loc10_.content as BitmapData;
            _loc6_.bitmap = _loc11_.clone();
         }
         var _loc7_:* = [];
         var_63.groupListItemsWithTag("CMD_BUTTON",_loc7_,true);
         for each(_loc8_ in _loc7_)
         {
            if(_loc8_.parent)
            {
               _loc8_.parent.width = _loc8_.width;
            }
            _loc8_.addEventListener(WindowEvent.const_47,onButtonResized);
         }
      }
      
      private function updateStateElement(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:* = null;
         if(var_105 == null)
         {
            return;
         }
         var _loc4_:IWindowContainer = var_105.getListItemByName("status_container") as IWindowContainer;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:ITextWindow = _loc4_.findChildByName("status_" + param1 + "_value_text") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.text = param2 + "/" + param3;
         }
         var _loc6_:IBitmapWrapperWindow = _loc4_.findChildByName("status_" + param1 + "_bitmap") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc7_ = createPercentageBar(param2,param3);
            if(_loc7_ != null)
            {
               _loc6_.bitmap = _loc7_;
               _loc6_.width = _loc7_.width;
               _loc6_.height = _loc7_.height;
               _loc6_.invalidate();
            }
         }
         updateWindow();
      }
      
      public function getCurrentPetId() : int
      {
         return var_594;
      }
      
      private function set ageText(param1:int) : void
      {
         if(var_105 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = var_105.getListItemByName("age_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _widget.localizations.registerParameter("pet.age","age",param1.toString());
         updateWindow();
      }
      
      private function updateWindow() : void
      {
         if(var_105 == null || var_228 == null || var_63 == null)
         {
            return;
         }
         var_63.width = var_63.scrollableRegion.width;
         var_63.visible = false;
         var_105.height = var_105.scrollableRegion.height;
         var_228.height = NaN;
         _window.width = Math.max(var_228.width,var_63.width);
         _window.height = _window.scrollableRegion.height;
         if(false)
         {
            var_228.x = 0 - 0;
            var_63.x = 0;
         }
         else
         {
            var_63.x = 0 - 0;
            var_228.x = 0;
         }
         _widget.refreshContainer();
      }
      
      public function dispose() : void
      {
         _widget = null;
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
         if(var_172)
         {
            var_172.dispose();
         }
         var_172 = null;
      }
      
      private function openTrainView() : void
      {
         if(var_172 == null)
         {
            var_172 = new PetCommandTool(_widget);
         }
         var _loc1_:InfoStandPetData = var_1247.getValue(var_594) as InfoStandPetData;
         if(_loc1_ != null)
         {
            var_172.showWindow(true);
            var_172.showCommandToolForPet(_loc1_.id,_loc1_.name,_loc1_.image);
         }
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(var_63 == null)
         {
            return;
         }
         var _loc3_:IWindow = var_63.getListItemByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            var_63.arrangeListItems();
         }
      }
      
      private function set name(param1:String) : void
      {
         if(var_105 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = var_105.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      private function set image(param1:BitmapData) : void
      {
         if(var_105 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = var_105.getListItemByName("image_container") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _loc2_.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,param1.height,true,0);
         var _loc5_:Point = new Point(0,0);
         _loc5_.x = (_loc3_.width - param1.width) / 2;
         _loc4_.copyPixels(param1,param1.rect,_loc5_);
         _loc3_.height = param1.height;
         _loc3_.bitmap = _loc4_;
         _loc3_.invalidate();
         updateWindow();
      }
      
      private function set raceText(param1:String) : void
      {
         if(var_105 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = var_105.getListItemByName("race_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         updateWindow();
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         if(param2 < 10)
         {
            _loc3_ = "00" + param2;
         }
         else if(param2 < 100)
         {
            _loc3_ = "0" + param2;
         }
         return "pet.race." + param1 + "." + _loc3_;
      }
      
      private function set ownerName(param1:String) : void
      {
         _widget.localizations.registerParameter("infostand.text.petowner","name",param1);
         updateWindow();
      }
      
      public function update(param1:InfoStandPetData) : void
      {
         name = param1.name;
         image = param1.image;
         ownerName = param1.ownerName;
         raceText = _widget.localizations.getKey(getRaceLocalizationKey(param1.type,param1.race));
         petRespect = param1.petRespect;
         ageText = param1.age;
         updateStateElement(const_1733,param1.level,param1.levelMax);
         updateStateElement(const_1730,param1.experience,param1.experienceMax);
         updateStateElement(const_1731,param1.energy,param1.energyMax);
         updateStateElement(const_1726,param1.nutrition,param1.nutritionMax);
         showButton("pick",param1.isOwnPet);
         showButton("train",param1.isOwnPet);
         showButton("kick",param1.canOwnerBeKicked);
         updateRespectButton();
         updateWindow();
         var_594 = param1.id;
         var_1247.remove(param1.id);
         var_1247.add(param1.id,param1);
         if(var_172 && var_172.isVisible() && param1.isOwnPet)
         {
            var_172.showCommandToolForPet(param1.id,param1.name,param1.image);
         }
      }
      
      private function set petRespect(param1:int) : void
      {
         _widget.localizations.registerParameter("infostand.text.petrespect","count",param1.toString());
         if(var_105 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = var_105.getListItemByName("petrespect_container") as IWindowContainer;
         var _loc3_:ITextWindow = _loc2_.findChildByName("petrespect_text") as ITextWindow;
         var _loc4_:IBitmapWrapperWindow = _loc2_.findChildByName("petrespect_icon") as IBitmapWrapperWindow;
         _loc4_.x = _loc3_.x + _loc3_.width + 2;
         updateWindow();
      }
      
      private function updateRespectButton() : void
      {
         if(var_63 == null)
         {
            return;
         }
         var _loc1_:IRegionWindow = var_63.getListItemByName("petrespect") as IRegionWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindow = _loc1_.findChildByName("btn_petrespect") as IButtonWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _widget.userData.petRespectLeft;
         _widget.localizations.registerParameter("infostand.button.petrespect","count",_loc3_.toString());
         _loc1_.visible = _loc3_ > 0;
         var_63.arrangeListItems();
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         _widget.close();
      }
      
      public function updateEnabledTrainingCommands(param1:int, param2:Array) : void
      {
         if(var_172 == null)
         {
            return;
         }
         var_172.setEnabledCommands(param1,param2);
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:IWindow = param1.target as IWindow;
         switch(_loc4_.name)
         {
            case "btn_pick":
               _loc3_ = "null";
               if(var_172 && var_172.getPetId() == var_594)
               {
                  var_172.showWindow(false);
               }
               break;
            case "btn_train":
               openTrainView();
               break;
            case "btn_petrespect":
               --_widget.userData.petRespectLeft;
               updateRespectButton();
               _loc3_ = "null";
               break;
            case "btn_kick":
               _loc2_ = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_382,_widget.petData.ownerId);
               _widget.messageListener.processWidgetMessage(_loc2_);
               return;
         }
         if(_loc3_ != null)
         {
            _loc5_ = _widget.petData.id;
            _loc2_ = new RoomWidgetUserActionMessage(_loc3_,_loc5_);
            _widget.messageListener.processWidgetMessage(_loc2_);
         }
         updateWindow();
      }
      
      public function get window() : IItemListWindow
      {
         return _window;
      }
      
      private function createPercentageBar(param1:int, param2:int) : BitmapData
      {
         param2 = Math.max(param2,1);
         param1 = Math.max(param1,0);
         if(param1 > param2)
         {
            param1 = param2;
         }
         var _loc3_:Number = param1 / param2;
         var _loc5_:BitmapData = new BitmapData(const_1727,const_1725,false);
         _loc5_.fillRect(new Rectangle(0,0,_loc5_.width,_loc5_.height),const_1729);
         var _loc6_:Rectangle = new Rectangle(1,1,_loc5_.width - 2,_loc5_.height - 2);
         _loc5_.fillRect(_loc6_,const_1732);
         var _loc7_:Rectangle = new Rectangle(1,1,_loc5_.width - 2,_loc5_.height - 2);
         _loc7_.width = _loc3_ * _loc7_.width;
         _loc5_.fillRect(_loc7_,const_1728);
         return _loc5_;
      }
      
      protected function onButtonResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window.parent;
         if(_loc2_ && _loc2_.tags.indexOf("CMD_BUTTON_REGION") > -1)
         {
            _loc2_.width = param1.window.width;
         }
      }
   }
}
