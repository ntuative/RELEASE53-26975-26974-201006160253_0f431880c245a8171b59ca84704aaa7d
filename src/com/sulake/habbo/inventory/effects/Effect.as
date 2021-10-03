package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2087:Date;
      
      private var var_1350:Boolean = false;
      
      private var _type:int;
      
      private var var_392:BitmapData;
      
      private var var_280:Boolean = false;
      
      private var var_1361:int;
      
      private var var_632:int = 1;
      
      private var var_1096:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_392;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_632;
         if(var_632 < 0)
         {
            var_632 = 0;
         }
         var_1096 = var_1361;
         var_280 = false;
         var_1350 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1096 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_280;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_392 = param1;
      }
      
      public function get duration() : int
      {
         return var_1361;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1350;
      }
      
      public function get effectsInInventory() : int
      {
         return var_632;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_392;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_280)
         {
            var_2087 = new Date();
         }
         var_280 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_632 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_280)
         {
            _loc1_ = var_1096 - (new Date().valueOf() - var_2087.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1096;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1350 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1361 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
