package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_159:Array;
      
      private var var_36:Boolean = false;
      
      private var var_1579:int = 0;
      
      private var var_1577:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_509:Map;
      
      private var var_2005:int = 0;
      
      private var var_1580:int = 0;
      
      private var var_146:IHabboConfigurationManager;
      
      private var var_1324:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1578:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_36)
         {
            return;
         }
         if(getTimer() - var_1579 > var_1577)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1579 = getTimer();
         var_509.add(var_1324,var_1579);
         _connection.send(new LatencyPingRequestMessageComposer(var_1324));
         ++var_1324;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_146 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1577 = int(var_146.getKey("latencytest.interval"));
         var_1578 = int(var_146.getKey("latencytest.report.index"));
         var_2005 = int(var_146.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1577 < 1)
         {
            return;
         }
         var_509 = new Map();
         var_159 = new Array();
         var_36 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_509 == null || var_159 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_509.getValue(_loc2_.requestId);
         var_509.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_159.push(_loc4_);
         if(var_159.length == var_1578 && var_1578 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_159.length)
            {
               _loc5_ += var_159[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_159.length)
            {
               if(var_159[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_159[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_159 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1580) > var_2005 || var_1580 == 0)
            {
               var_1580 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_159.length);
               _connection.send(_loc11_);
            }
            var_159 = [];
         }
      }
      
      public function dispose() : void
      {
         var_36 = false;
         var_146 = null;
         _communication = null;
         _connection = null;
         if(var_509 != null)
         {
            var_509.dispose();
            var_509 = null;
         }
         var_159 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_146 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
