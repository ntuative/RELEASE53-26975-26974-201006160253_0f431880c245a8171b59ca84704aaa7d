package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1100:int = 31;
      
      private static const const_1074:int = 32;
      
      private static const const_797:int = 10;
      
      private static const const_522:int = 20;
       
      
      private var var_614:Boolean = false;
      
      private var var_242:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_242 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_614)
            {
               var_614 = true;
               var_242 = new Array();
               var_242.push(const_1100);
               var_242.push(const_1074);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_797)
         {
            if(var_614)
            {
               var_614 = false;
               var_242 = new Array();
               var_242.push(const_797 + param1);
               var_242.push(const_522 + param1);
               var_242.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_242.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
