package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1179:String = "WN_CREATED";
      
      public static const const_980:String = "WN_DISABLE";
      
      public static const const_838:String = "WN_DEACTIVATED";
      
      public static const const_958:String = "WN_OPENED";
      
      public static const const_989:String = "WN_CLOSED";
      
      public static const const_1022:String = "WN_DESTROY";
      
      public static const const_1621:String = "WN_ARRANGED";
      
      public static const const_453:String = "WN_PARENT_RESIZED";
      
      public static const const_903:String = "WN_ENABLE";
      
      public static const const_1032:String = "WN_RELOCATE";
      
      public static const const_852:String = "WN_FOCUS";
      
      public static const const_981:String = "WN_PARENT_RELOCATED";
      
      public static const const_484:String = "WN_PARAM_UPDATED";
      
      public static const const_709:String = "WN_PARENT_ACTIVATED";
      
      public static const const_175:String = "WN_RESIZED";
      
      public static const const_1053:String = "WN_CLOSE";
      
      public static const const_845:String = "WN_PARENT_REMOVED";
      
      public static const const_286:String = "WN_CHILD_RELOCATED";
      
      public static const const_599:String = "WN_ENABLED";
      
      public static const const_264:String = "WN_CHILD_RESIZED";
      
      public static const const_950:String = "WN_MINIMIZED";
      
      public static const const_642:String = "WN_DISABLED";
      
      public static const const_226:String = "WN_CHILD_ACTIVATED";
      
      public static const const_495:String = "WN_STATE_UPDATED";
      
      public static const const_597:String = "WN_UNSELECTED";
      
      public static const const_473:String = "WN_STYLE_UPDATED";
      
      public static const const_1539:String = "WN_UPDATE";
      
      public static const const_467:String = "WN_PARENT_ADDED";
      
      public static const const_674:String = "WN_RESIZE";
      
      public static const const_530:String = "WN_CHILD_REMOVED";
      
      public static const const_1569:String = "";
      
      public static const const_1054:String = "WN_RESTORED";
      
      public static const const_343:String = "WN_SELECTED";
      
      public static const const_935:String = "WN_MINIMIZE";
      
      public static const const_954:String = "WN_FOCUSED";
      
      public static const const_1402:String = "WN_LOCK";
      
      public static const const_310:String = "WN_CHILD_ADDED";
      
      public static const const_907:String = "WN_UNFOCUSED";
      
      public static const const_469:String = "WN_RELOCATED";
      
      public static const const_873:String = "WN_DEACTIVATE";
      
      public static const const_1237:String = "WN_CRETAE";
      
      public static const const_936:String = "WN_RESTORE";
      
      public static const const_320:String = "WN_ACTVATED";
      
      public static const const_1392:String = "WN_LOCKED";
      
      public static const const_482:String = "WN_SELECT";
      
      public static const const_1008:String = "WN_MAXIMIZE";
      
      public static const const_1003:String = "WN_OPEN";
      
      public static const const_721:String = "WN_UNSELECT";
      
      public static const const_1708:String = "WN_ARRANGE";
      
      public static const const_1398:String = "WN_UNLOCKED";
      
      public static const const_1615:String = "WN_UPDATED";
      
      public static const const_1017:String = "WN_ACTIVATE";
      
      public static const const_1263:String = "WN_UNLOCK";
      
      public static const const_902:String = "WN_MAXIMIZED";
      
      public static const const_841:String = "WN_DESTROYED";
      
      public static const const_887:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1710,cancelable);
      }
   }
}
