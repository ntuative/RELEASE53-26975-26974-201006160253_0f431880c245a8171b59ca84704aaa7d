package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1489:GarbageMonitor = null;
      
      private var var_1208:int = 0;
      
      private var var_1385:Boolean = false;
      
      private var var_1726:String = "";
      
      private var var_1490:String = "";
      
      private var var_346:Number = 0;
      
      private var var_1205:int = 10;
      
      private var var_2423:Array;
      
      private var var_689:int = 0;
      
      private var var_1206:int = 60;
      
      private var var_1019:int = 0;
      
      private var var_1020:int = 0;
      
      private var var_2165:String = "";
      
      private var var_1725:Number = 0;
      
      private var var_1204:int = 1000;
      
      private var var_1727:Boolean = true;
      
      private var var_1723:Number = 0.15;
      
      private var var_146:IHabboConfigurationManager = null;
      
      private var var_1724:String = "";
      
      private var var_1207:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2423 = [];
         super();
         var_1490 = Capabilities.version;
         var_1726 = Capabilities.os;
         var_1385 = Capabilities.isDebugger;
         var_1724 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1489 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1208 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1489.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1489.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_346;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1206 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1490;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1020;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1204)
         {
            ++var_1019;
            _loc3_ = true;
         }
         else
         {
            ++var_689;
            if(var_689 <= 1)
            {
               var_346 = param1;
            }
            else
            {
               _loc4_ = Number(var_689);
               var_346 = var_346 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1208 > var_1206 * 1000 && var_1207 < var_1205)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_346);
            _loc5_ = true;
            if(var_1727 && var_1207 > 0)
            {
               _loc6_ = differenceInPercents(var_1725,var_346);
               if(_loc6_ < var_1723)
               {
                  _loc5_ = false;
               }
            }
            var_1208 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1725 = var_346;
               if(sendReport())
               {
                  ++var_1207;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1205 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1204 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1724,var_1490,var_1726,var_2165,var_1385,_loc4_,_loc3_,var_1020,var_346,var_1019);
            _connection.send(_loc1_);
            var_1020 = 0;
            var_346 = 0;
            var_689 = 0;
            var_1019 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_146 = param1;
         var_1206 = int(var_146.getKey("performancetest.interval","60"));
         var_1204 = int(var_146.getKey("performancetest.slowupdatelimit","1000"));
         var_1205 = int(var_146.getKey("performancetest.reportlimit","10"));
         var_1723 = Number(var_146.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1727 = Boolean(int(var_146.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
