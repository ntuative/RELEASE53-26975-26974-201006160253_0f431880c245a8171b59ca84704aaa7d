package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.IWindow;
   import flash.display.IBitmapDrawable;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class SkinRenderer implements ISkinRenderer
   {
       
      
      protected var _layoutsByState:Dictionary;
      
      protected var var_341:Dictionary;
      
      protected var var_340:Dictionary;
      
      protected var var_471:Dictionary;
      
      public function SkinRenderer(param1:Array)
      {
         super();
         var_341 = new Dictionary();
         var_340 = new Dictionary();
         var_471 = new Dictionary();
         _layoutsByState = new Dictionary();
      }
      
      public function getLayoutByName(param1:String) : ISkinLayout
      {
         return var_471[param1];
      }
      
      public function addLayout(param1:ISkinLayout) : ISkinLayout
      {
         var_471[param1.name] = param1;
         return param1;
      }
      
      public function draw(param1:IWindow, param2:IBitmapDrawable, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
      }
      
      public function isStateDrawable(param1:uint) : Boolean
      {
         return false;
      }
      
      public function removeLayout(param1:ISkinLayout) : ISkinLayout
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         param1 = var_341[param1.name];
         if(param1 != null)
         {
            for(_loc2_ in _layoutsByState)
            {
               _loc3_ = uint(_loc2_ as uint);
               if(_layoutsByState[_loc3_] == param1)
               {
                  removeLayoutFromRenderState(_loc3_);
               }
            }
            delete var_471[param1.name];
         }
         return param1;
      }
      
      public function getTemplateByName(param1:String) : ISkinTemplate
      {
         return var_341[param1];
      }
      
      public function removeTemplateFromRenderState(param1:uint) : void
      {
         delete var_340[param1];
      }
      
      public function hasLayoutForState(param1:uint) : Boolean
      {
         return false;
      }
      
      public function removeTemplate(param1:ISkinTemplate) : ISkinTemplate
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         param1 = var_341[param1.name];
         if(param1 != null)
         {
            for(_loc2_ in var_340)
            {
               _loc3_ = uint(_loc2_ as uint);
               if(var_340[_loc3_] == param1)
               {
                  removeTemplateFromRenderState(_loc3_);
               }
            }
            delete var_341[param1.name];
         }
         return param1;
      }
      
      public function removeLayoutFromRenderState(param1:uint) : void
      {
         delete _layoutsByState[param1];
      }
      
      public function registerLayoutForRenderState(param1:uint, param2:String) : void
      {
         var _loc3_:ISkinLayout = var_471[param2];
         if(_loc3_ == null)
         {
            throw new Error("Layout \"" + param2 + "\" not found in renderer!");
         }
         _layoutsByState[param1] = _loc3_;
      }
      
      public function hasTemplateForState(param1:uint) : Boolean
      {
         return false;
      }
      
      public function registerTemplateForRenderState(param1:uint, param2:String) : void
      {
         var _loc3_:ISkinTemplate = var_341[param2];
         if(_loc3_ == null)
         {
            throw new Error("Template \"" + param2 + "\" not found in renderer!");
         }
         var_340[param1] = _loc3_;
      }
      
      public function getTemplateByState(param1:uint) : ISkinTemplate
      {
         return var_340[param1];
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in var_471)
         {
            ISkinLayout(var_471[_loc1_]).dispose();
            delete var_471[_loc1_];
         }
         var_471 = null;
         _layoutsByState = null;
         for(_loc1_ in var_341)
         {
            ISkinTemplate(var_341[_loc1_]).dispose();
            delete var_341[_loc1_];
         }
         var_341 = null;
         var_340 = null;
      }
      
      public function getLayoutByState(param1:uint) : ISkinLayout
      {
         return _layoutsByState[param1];
      }
      
      public function addTemplate(param1:ISkinTemplate) : ISkinTemplate
      {
         var_341[param1.name] = param1;
         return param1;
      }
   }
}
