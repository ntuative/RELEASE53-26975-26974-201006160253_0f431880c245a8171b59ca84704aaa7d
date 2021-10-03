package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_379:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_438:int = 0;
      
      public static const const_978:int = 2;
      
      public static const const_943:int = 1;
      
      public static const const_640:Boolean = false;
      
      public static const const_738:String = "";
      
      public static const const_449:int = 0;
      
      public static const const_404:int = 0;
      
      public static const const_450:int = 0;
       
      
      private var var_1779:int = 0;
      
      private var var_1777:String = "";
      
      private var var_1521:int = 0;
      
      private var var_1778:int = 0;
      
      private var var_1776:Number = 0;
      
      private var var_1780:int = 255;
      
      private var var_1775:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1779;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1521 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1776;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1778 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1779 = param1;
      }
      
      public function get tag() : String
      {
         return var_1777;
      }
      
      public function get alpha() : int
      {
         return var_1780;
      }
      
      public function get ink() : int
      {
         return var_1521;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1776 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1778;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1775 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1775;
      }
      
      public function set tag(param1:String) : void
      {
         var_1777 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1780 = param1;
      }
   }
}
