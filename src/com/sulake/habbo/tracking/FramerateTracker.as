package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1208:int;
      
      private var var_346:Number;
      
      private var var_1590:int;
      
      private var var_899:int;
      
      private var var_2020:int;
      
      private var var_2021:Boolean;
      
      private var _reportIntervalMillis:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++var_899;
         var _loc3_:int = getTimer();
         if(var_899 == 1)
         {
            var_346 = param1;
            var_1208 = _loc3_;
         }
         else
         {
            _loc4_ = Number(var_899);
            var_346 = var_346 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(var_2021 && _loc3_ - var_1208 >= _reportIntervalMillis && var_1590 < var_2020)
         {
            _loc5_ = 1000 / var_346;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++var_1590;
            var_1208 = _loc3_;
            var_899 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         _reportIntervalMillis = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         var_2020 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         var_2021 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
