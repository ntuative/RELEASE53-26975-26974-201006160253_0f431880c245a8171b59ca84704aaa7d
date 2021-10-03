package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1100:int = 31;
      
      private static const const_1074:int = 32;
      
      private static const const_521:int = 30;
      
      private static const const_797:int = 20;
      
      private static const const_522:int = 10;
       
      
      private var var_614:Boolean = false;
      
      private var var_242:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_242 = new Array();
         super();
         super.setAnimation(const_521);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_522)
         {
            if(var_614)
            {
               var_614 = false;
               var_242 = new Array();
               if(_direction == 2)
               {
                  var_242.push(const_797 + 5 - param1);
                  var_242.push(const_522 + 5 - param1);
               }
               else
               {
                  var_242.push(const_797 + param1);
                  var_242.push(const_522 + param1);
               }
               var_242.push(const_521);
               return;
            }
            super.setAnimation(const_521);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
