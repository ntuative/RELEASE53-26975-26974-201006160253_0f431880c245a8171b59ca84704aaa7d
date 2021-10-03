package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2478:uint;
      
      private var var_997:IWindowToolTipAgentService;
      
      private var var_1001:IWindowMouseScalingService;
      
      private var var_250:IWindowContext;
      
      private var var_999:IWindowFocusManagerService;
      
      private var var_998:IWindowMouseListenerService;
      
      private var var_1000:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2478 = 0;
         var_122 = param2;
         var_250 = param1;
         var_1000 = new WindowMouseDragger(param2);
         var_1001 = new WindowMouseScaler(param2);
         var_998 = new WindowMouseListener(param2);
         var_999 = new FocusManager(param2);
         var_997 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_1001;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_999;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_997;
      }
      
      public function dispose() : void
      {
         if(var_1000 != null)
         {
            var_1000.dispose();
            var_1000 = null;
         }
         if(var_1001 != null)
         {
            var_1001.dispose();
            var_1001 = null;
         }
         if(var_998 != null)
         {
            var_998.dispose();
            var_998 = null;
         }
         if(var_999 != null)
         {
            var_999.dispose();
            var_999 = null;
         }
         if(var_997 != null)
         {
            var_997.dispose();
            var_997 = null;
         }
         var_250 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_998;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_1000;
      }
   }
}
