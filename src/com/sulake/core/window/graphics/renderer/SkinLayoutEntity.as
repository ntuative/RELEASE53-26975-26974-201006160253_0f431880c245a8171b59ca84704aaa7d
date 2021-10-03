package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_271:uint = 1;
      
      public static const const_443:uint = 0;
      
      public static const const_1021:uint = 8;
      
      public static const const_256:uint = 4;
      
      public static const const_410:uint = 2;
       
      
      private var var_436:uint;
      
      private var var_2003:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2002:uint;
      
      private var var_102:Rectangle;
      
      private var var_682:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_102 = param3;
         _color = param4;
         var_436 = param5;
         var_2003 = param6;
         var_2002 = param7;
         var_682 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2003;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_436;
      }
      
      public function get scaleV() : uint
      {
         return var_2002;
      }
      
      public function get tags() : Array
      {
         return var_682;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_102 = null;
         var_682 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_102;
      }
   }
}
