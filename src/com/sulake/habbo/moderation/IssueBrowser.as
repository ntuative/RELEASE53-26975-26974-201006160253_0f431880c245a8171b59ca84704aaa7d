package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class IssueBrowser
   {
       
      
      private var var_1488:IIssueBrowserView;
      
      private const const_1718:String = "open_issues";
      
      private var _window:IFrameWindow;
      
      private const const_1719:String = "picked_issues";
      
      private var _assets:IAssetLibrary;
      
      private var var_1486:IIssueBrowserView;
      
      private const const_1749:String = "closed_issues";
      
      private var _issueManager:IssueManager;
      
      private const const_1717:String = "my_issues";
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_222:ITabContextWindow;
      
      private var var_1487:PickedIssuesView;
      
      private var var_345:IIssueBrowserView;
      
      public function IssueBrowser(param1:IssueManager, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         _issueManager = param1;
         _windowManager = param2;
         _assets = param3;
      }
      
      private function onAutoPick(param1:WindowMouseEvent) : void
      {
         if(_issueManager != null)
         {
            _issueManager.autoPick();
         }
      }
      
      public function update() : void
      {
         if(_window == null || true)
         {
            return;
         }
         if(var_345 == null)
         {
            return;
         }
         var_345.update();
      }
      
      public function get assets() : IAssetLibrary
      {
         return _assets;
      }
      
      public function createWindow(param1:String) : IWindow
      {
         if(_windowManager == null || _assets == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = _assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return _windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function createMainFrame() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(_window == null)
         {
            _window = createWindow("issue_browser_xml") as IFrameWindow;
            if(_window == null)
            {
               return;
            }
            _loc2_ = _window.desktop;
            _window.x = _loc2_.width / 2 - 0;
            _window.y = _loc2_.height / 2 - 0;
            _loc3_ = _window.findChildByTag("close");
            if(_loc3_ != null)
            {
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClose);
            }
            _loc4_ = _window.findChildByName("auto_pick");
            if(_loc4_ != null)
            {
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onAutoPick);
            }
            var_222 = _window.findChildByName("tab_context") as ITabContextWindow;
            _loc6_ = 0;
            while(_loc6_ < var_222.numTabItems)
            {
               _loc5_ = var_222.getTabItemAt(_loc6_);
               _loc5_.addEventListener(WindowEvent.const_59,onTabSelected);
               _loc6_++;
            }
         }
         var_222 = _window.findChildByName("tab_context") as ITabContextWindow;
         if(var_222 == null || true)
         {
            return;
         }
         var _loc1_:ISelectableWindow = var_222.selector.getSelectableByName("open_issues");
         var_222.selector.setSelected(_loc1_);
      }
      
      public function get issueManager() : IssueManager
      {
         return _issueManager;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         _window.visible = false;
      }
      
      public function isOpen() : Boolean
      {
         return _window != null && false;
      }
      
      private function selectView(param1:String) : void
      {
         var _loc2_:IIssueBrowserView = getView(param1);
         if(var_345 == param1)
         {
            return;
         }
         if(var_345 != null)
         {
            var_345.visible = false;
         }
         var_345 = _loc2_;
         if(var_345 == null)
         {
            return;
         }
         var_345.view.width = var_222.container.width;
         var_345.view.height = var_222.container.height;
         var_345.visible = true;
         var_345.update();
      }
      
      private function getView(param1:String) : IIssueBrowserView
      {
         switch(param1)
         {
            case const_1717:
               if(var_1486 == null)
               {
                  var_1486 = new MyIssuesView(issueManager,this,var_222.container);
               }
               return var_1486;
            case const_1718:
               if(var_1488 == null)
               {
                  var_1488 = new OpenIssuesView(issueManager,this,var_222.container);
               }
               return var_1488;
            case const_1719:
               if(var_1487 == null)
               {
                  var_1487 = new PickedIssuesView(issueManager,this,var_222.container);
               }
               return var_1487;
            default:
               return null;
         }
      }
      
      private function onTabSelected(param1:WindowEvent) : void
      {
         if(param1 == null || param1.window == null)
         {
            return;
         }
         selectView(param1.window.name);
      }
      
      public function show() : void
      {
         if(_window == null)
         {
            createMainFrame();
         }
         _window.visible = true;
         _window.activate();
         update();
      }
   }
}
