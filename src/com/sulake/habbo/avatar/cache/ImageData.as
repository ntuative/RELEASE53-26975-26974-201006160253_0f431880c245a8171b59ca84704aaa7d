package com.sulake.habbo.avatar.cache
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ImageData
   {
       
      
      private var var_1174:Boolean = false;
      
      private var var_1175:Boolean = false;
      
      private var _bitmap:BitmapData;
      
      private var var_621:Point;
      
      public function ImageData(param1:BitmapData, param2:Point, param3:Boolean, param4:Boolean)
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         super();
         _bitmap = param1;
         var_621 = param2;
         var_1175 = param3;
         var_1174 = param4;
         if(var_1175)
         {
            var_621.x = NaN;
            _loc5_ = new Matrix(-1,0,0,1,_bitmap.width,0);
            _loc6_ = new BitmapData(_bitmap.width,_bitmap.height,true,16777215);
            _loc6_.draw(_bitmap,_loc5_);
            _bitmap.dispose();
            _bitmap = _loc6_;
         }
      }
      
      public function get regpoint() : Point
      {
         return var_621;
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmap;
      }
      
      public function get offsetRect() : Rectangle
      {
         var _loc1_:Rectangle = _bitmap.rect.clone();
         _loc1_.offset(0,0);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         if(_bitmap)
         {
            _bitmap.dispose();
         }
         _bitmap = null;
         var_621 = null;
      }
   }
}
