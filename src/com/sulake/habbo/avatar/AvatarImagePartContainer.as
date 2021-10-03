package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1821:int;
      
      private var var_1823:String;
      
      private var var_1623:IActionDefinition;
      
      private var var_1826:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1822:String;
      
      private var var_1824:String;
      
      private var var_1825:Boolean;
      
      private var var_1820:ColorTransform;
      
      private var var_1827:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1823 = param1;
         var_1822 = param2;
         var_1821 = param3;
         _color = param4;
         _frames = param5;
         var_1623 = param6;
         var_1825 = param7;
         var_1827 = param8;
         var_1824 = param9;
         var_1826 = param10;
         var_1820 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1825;
      }
      
      public function get partType() : String
      {
         return var_1822;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1827;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1826;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1821;
      }
      
      public function get flippedPartType() : String
      {
         return var_1824;
      }
      
      public function get bodyPartId() : String
      {
         return var_1823;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1623;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1820;
      }
   }
}
