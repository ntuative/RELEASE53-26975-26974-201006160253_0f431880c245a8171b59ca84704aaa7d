package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowDisposeEvent extends WindowEvent
   {
      
      public static const const_536:String = "WINDOW_DISPOSE_EVENT";
       
      
      public function WindowDisposeEvent(param1:IWindow)
      {
         super(const_536,param1,null,false,false);
      }
   }
}
