package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1155:int = 100;
      
      private static const const_1154:int = 200;
      
      private static const const_1156:int = 180;
      
      public static const const_878:int = 1;
      
      public static const const_393:int = 2;
      
      private static const const_1153:int = 250;
      
      private static const const_816:int = 5;
       
      
      private var var_664:BitmapData;
      
      private var var_329:Timer;
      
      private var var_9:IWindowContainer;
      
      private var var_794:BitmapData;
      
      private var var_330:Timer;
      
      private var var_74:IWindowContainer;
      
      private var var_1675:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_330 = new Timer(const_1153,1);
         var_329 = new Timer(const_1155,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_74 = param1;
         var_74.visible = false;
         _assets = param2;
         var_330.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_329.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_794 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_664 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_74.visible = false;
         var_329.reset();
         var_330.reset();
         if(var_9 != null)
         {
            var_9.removeChild(var_74);
         }
      }
      
      public function hideDelayed() : void
      {
         var_329.reset();
         var_330.reset();
         var_329.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_330 != null)
         {
            var_330.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_330.stop();
            var_330 = null;
         }
         if(var_329 != null)
         {
            var_329.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_329.stop();
            var_329 = null;
         }
         _assets = null;
         var_74 = null;
         var_9 = null;
         var_664 = null;
         var_794 = null;
      }
      
      public function showDelayed() : void
      {
         var_329.reset();
         var_330.reset();
         var_330.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_74 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_9 != null)
         {
            var_9.removeChild(var_74);
         }
         var_9 = param1;
         var_1675 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_74.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_74.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1156,param3.width),Math.min(const_1154,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_74.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_74 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_74.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_878:
               _loc2_.bitmap = var_794.clone();
               _loc2_.width = var_794.width;
               _loc2_.height = var_794.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_393:
               _loc2_.bitmap = var_664.clone();
               _loc2_.width = var_664.width;
               _loc2_.height = var_664.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_329.reset();
         var_330.reset();
         if(var_9 == null)
         {
            return;
         }
         var_74.visible = true;
         var_9.addChild(var_74);
         refreshArrow(var_1675);
         switch(var_1675)
         {
            case const_878:
               var_74.x = 0 - const_816;
               break;
            case const_393:
               var_74.x = var_9.width + const_816;
         }
         var_74.y = (0 - 0) / 2;
      }
   }
}
