package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_272:String = "WE_CHILD_RESIZED";
      
      public static const const_1230:String = "WE_CLOSE";
      
      public static const const_1376:String = "WE_DESTROY";
      
      public static const const_140:String = "WE_CHANGE";
      
      public static const const_1216:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1659:String = "WE_PARENT_RESIZE";
      
      public static const const_94:String = "WE_UPDATE";
      
      public static const const_1410:String = "WE_MAXIMIZE";
      
      public static const const_447:String = "WE_DESTROYED";
      
      public static const const_1051:String = "WE_UNSELECT";
      
      public static const const_1283:String = "WE_MAXIMIZED";
      
      public static const const_1502:String = "WE_UNLOCKED";
      
      public static const const_471:String = "WE_CHILD_REMOVED";
      
      public static const const_183:String = "WE_OK";
      
      public static const const_47:String = "WE_RESIZED";
      
      public static const const_1242:String = "WE_ACTIVATE";
      
      public static const const_267:String = "WE_ENABLED";
      
      public static const const_402:String = "WE_CHILD_RELOCATED";
      
      public static const const_1400:String = "WE_CREATE";
      
      public static const const_744:String = "WE_SELECT";
      
      public static const const_170:String = "";
      
      public static const const_1507:String = "WE_LOCKED";
      
      public static const const_1501:String = "WE_PARENT_RELOCATE";
      
      public static const const_1608:String = "WE_CHILD_REMOVE";
      
      public static const const_1580:String = "WE_CHILD_RELOCATE";
      
      public static const const_1552:String = "WE_LOCK";
      
      public static const const_244:String = "WE_FOCUSED";
      
      public static const const_704:String = "WE_UNSELECTED";
      
      public static const const_962:String = "WE_DEACTIVATED";
      
      public static const const_1213:String = "WE_MINIMIZED";
      
      public static const const_1519:String = "WE_ARRANGED";
      
      public static const const_1645:String = "WE_UNLOCK";
      
      public static const const_1487:String = "WE_ATTACH";
      
      public static const const_1289:String = "WE_OPEN";
      
      public static const const_1342:String = "WE_RESTORE";
      
      public static const const_1698:String = "WE_PARENT_RELOCATED";
      
      public static const const_1368:String = "WE_RELOCATE";
      
      public static const const_1693:String = "WE_CHILD_RESIZE";
      
      public static const const_1496:String = "WE_ARRANGE";
      
      public static const const_1197:String = "WE_OPENED";
      
      public static const const_1399:String = "WE_CLOSED";
      
      public static const const_1677:String = "WE_DETACHED";
      
      public static const const_1504:String = "WE_UPDATED";
      
      public static const const_1356:String = "WE_UNFOCUSED";
      
      public static const const_493:String = "WE_RELOCATED";
      
      public static const const_1292:String = "WE_DEACTIVATE";
      
      public static const const_225:String = "WE_DISABLED";
      
      public static const const_618:String = "WE_CANCEL";
      
      public static const const_753:String = "WE_ENABLE";
      
      public static const const_1322:String = "WE_ACTIVATED";
      
      public static const const_1236:String = "WE_FOCUS";
      
      public static const const_1692:String = "WE_DETACH";
      
      public static const const_1353:String = "WE_RESTORED";
      
      public static const const_1294:String = "WE_UNFOCUS";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_1391:String = "WE_PARENT_RESIZED";
      
      public static const const_1224:String = "WE_CREATED";
      
      public static const const_1691:String = "WE_ATTACHED";
      
      public static const const_1198:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1710:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1476:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1710 = param3;
         var_1476 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1476;
      }
      
      public function get related() : IWindow
      {
         return var_1710;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1476 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
