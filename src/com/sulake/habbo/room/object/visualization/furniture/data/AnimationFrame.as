package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_613:int = -1;
      
      public static const const_853:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1772:int = -1;
      
      private var var_83:int = 0;
      
      private var var_1231:int = 1;
      
      private var var_838:int = 1;
      
      private var var_1770:Boolean = false;
      
      private var var_1771:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_83 = param2;
         _y = param3;
         var_1770 = param5;
         if(param4 < 0)
         {
            param4 = const_613;
         }
         var_838 = param4;
         var_1231 = param4;
         if(param6 >= 0)
         {
            var_1772 = param6;
            var_1771 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_838 > 0 && param1 > var_838)
         {
            param1 = var_838;
         }
         var_1231 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_838;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1771;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_838 < 0)
         {
            return const_613;
         }
         return var_1231;
      }
      
      public function get activeSequence() : int
      {
         return var_1772;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1770;
      }
      
      public function get x() : int
      {
         return var_83;
      }
   }
}
