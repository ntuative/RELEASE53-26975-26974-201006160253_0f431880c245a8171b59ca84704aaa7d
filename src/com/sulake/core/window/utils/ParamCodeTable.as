package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_128;
         param1["bound_to_parent_rect"] = const_91;
         param1["child_window"] = const_1020;
         param1["embedded_controller"] = const_346;
         param1["resize_to_accommodate_children"] = const_68;
         param1["input_event_processor"] = const_51;
         param1["internal_event_handling"] = const_653;
         param1["mouse_dragging_target"] = const_233;
         param1["mouse_dragging_trigger"] = const_337;
         param1["mouse_scaling_target"] = const_274;
         param1["mouse_scaling_trigger"] = const_400;
         param1["horizontal_mouse_scaling_trigger"] = const_214;
         param1["vertical_mouse_scaling_trigger"] = const_237;
         param1["observe_parent_input_events"] = const_862;
         param1["optimize_region_to_layout_size"] = const_401;
         param1["parent_window"] = const_881;
         param1["relative_horizontal_scale_center"] = const_178;
         param1["relative_horizontal_scale_fixed"] = const_118;
         param1["relative_horizontal_scale_move"] = const_321;
         param1["relative_horizontal_scale_strech"] = const_268;
         param1["relative_scale_center"] = const_1013;
         param1["relative_scale_fixed"] = const_649;
         param1["relative_scale_move"] = const_1006;
         param1["relative_scale_strech"] = const_1002;
         param1["relative_vertical_scale_center"] = const_187;
         param1["relative_vertical_scale_fixed"] = const_137;
         param1["relative_vertical_scale_move"] = const_327;
         param1["relative_vertical_scale_strech"] = const_259;
         param1["on_resize_align_left"] = const_766;
         param1["on_resize_align_right"] = const_389;
         param1["on_resize_align_center"] = const_437;
         param1["on_resize_align_top"] = const_757;
         param1["on_resize_align_bottom"] = const_424;
         param1["on_resize_align_middle"] = const_433;
         param1["on_accommodate_align_left"] = const_941;
         param1["on_accommodate_align_right"] = const_406;
         param1["on_accommodate_align_center"] = const_734;
         param1["on_accommodate_align_top"] = const_988;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_656;
         param1["route_input_events_to_parent"] = const_398;
         param1["use_parent_graphic_context"] = const_35;
         param1["draggable_with_mouse"] = const_898;
         param1["scalable_with_mouse"] = const_940;
         param1["reflect_horizontal_resize_to_parent"] = const_383;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_296;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
