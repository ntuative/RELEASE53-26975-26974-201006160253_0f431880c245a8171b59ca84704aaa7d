package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1068:int = 1;
      
      private static const const_1074:int = 3;
      
      private static const const_1070:int = 2;
      
      private static const const_1069:int = 15;
       
      
      private var var_839:int;
      
      private var var_242:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_242 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1070)
         {
            var_242 = new Array();
            var_242.push(const_1068);
            var_839 = const_1069;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_839 > 0)
         {
            --var_839;
         }
         if(var_839 == 0)
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
