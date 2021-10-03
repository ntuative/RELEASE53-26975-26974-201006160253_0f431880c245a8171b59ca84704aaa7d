package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_343:Timer;
      
      protected var var_1017:String;
      
      protected var var_1016:uint;
      
      protected var var_1196:Point;
      
      protected var var_259:IToolTipWindow;
      
      protected var var_1195:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1196 = new Point();
         var_1195 = new Point(20,20);
         var_1016 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_343 != null)
         {
            var_343.stop();
            var_343.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_343 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1196);
            if(var_259 != null && true)
            {
               var_259.x = param1 + var_1195.x;
               var_259.y = param2 + var_1195.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_343 != null)
         {
            var_343.reset();
         }
         if(_window && true)
         {
            if(var_259 == null || false)
            {
               var_259 = _window.context.create("undefined::ToolTip",var_1017,WindowType.const_332,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_259.x = _loc2_.x + var_1196.x + var_1195.x;
            var_259.y = _loc2_.y + var_1196.y + var_1195.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_1017 = IInteractiveWindow(param1).toolTipCaption;
               var_1016 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_1017 = param1.caption;
               var_1016 = 500;
            }
            _mouse.x = var_122.mouseX;
            _mouse.y = var_122.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1196);
            if(var_1017 != null && var_1017 != "")
            {
               if(var_343 == null)
               {
                  var_343 = new Timer(var_1016,1);
                  var_343.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_343.reset();
               var_343.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_259 != null && true)
         {
            var_259.destroy();
            var_259 = null;
         }
      }
   }
}
