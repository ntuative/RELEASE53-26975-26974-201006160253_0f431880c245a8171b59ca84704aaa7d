package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_589;
         param1["bitmap"] = const_569;
         param1["border"] = const_661;
         param1["border_notify"] = const_1314;
         param1["button"] = const_432;
         param1["button_thick"] = const_540;
         param1["button_icon"] = const_1245;
         param1["button_group_left"] = const_692;
         param1["button_group_center"] = const_529;
         param1["button_group_right"] = const_733;
         param1["canvas"] = const_556;
         param1["checkbox"] = const_541;
         param1["closebutton"] = const_882;
         param1["container"] = const_347;
         param1["container_button"] = const_725;
         param1["display_object_wrapper"] = const_578;
         param1["dropmenu"] = const_425;
         param1["dropmenu_item"] = const_505;
         param1["frame"] = const_345;
         param1["frame_notify"] = const_1357;
         param1["header"] = const_700;
         param1["icon"] = const_1029;
         param1["itemgrid"] = const_926;
         param1["itemgrid_horizontal"] = const_436;
         param1["itemgrid_vertical"] = const_693;
         param1["itemlist"] = const_829;
         param1["itemlist_horizontal"] = const_326;
         param1["itemlist_vertical"] = const_361;
         param1["maximizebox"] = const_1350;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1429;
         param1["submenu"] = const_929;
         param1["minimizebox"] = const_1354;
         param1["notify"] = const_1364;
         param1["null"] = const_726;
         param1["password"] = const_748;
         param1["radiobutton"] = const_739;
         param1["region"] = const_377;
         param1["restorebox"] = const_1390;
         param1["scaler"] = const_545;
         param1["scaler_horizontal"] = const_1288;
         param1["scaler_vertical"] = const_1262;
         param1["scrollbar_horizontal"] = const_405;
         param1["scrollbar_vertical"] = const_716;
         param1["scrollbar_slider_button_up"] = const_968;
         param1["scrollbar_slider_button_down"] = const_893;
         param1["scrollbar_slider_button_left"] = const_830;
         param1["scrollbar_slider_button_right"] = const_908;
         param1["scrollbar_slider_bar_horizontal"] = const_871;
         param1["scrollbar_slider_bar_vertical"] = const_906;
         param1["scrollbar_slider_track_horizontal"] = const_1052;
         param1["scrollbar_slider_track_vertical"] = const_953;
         param1["scrollable_itemlist"] = const_1250;
         param1["scrollable_itemlist_vertical"] = const_426;
         param1["scrollable_itemlist_horizontal"] = const_1010;
         param1["selector"] = const_537;
         param1["selector_list"] = const_588;
         param1["submenu"] = const_929;
         param1["tab_button"] = const_608;
         param1["tab_container_button"] = const_957;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_840;
         param1["tab_selector"] = const_684;
         param1["text"] = const_641;
         param1["input"] = const_751;
         param1["toolbar"] = const_1276;
         param1["tooltip"] = const_332;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
