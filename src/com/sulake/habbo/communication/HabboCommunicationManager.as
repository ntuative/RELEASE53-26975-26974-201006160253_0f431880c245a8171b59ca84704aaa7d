package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_82:int = 0;
      
      private var var_35:String = "";
      
      private var var_1287:Timer;
      
      private var var_269:Array;
      
      private var var_1935:Boolean = false;
      
      private var var_81:String = "";
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1072:IMessageConfiguration;
      
      private const const_1741:int = 2;
      
      private var var_358:int = -1;
      
      private var var_309:ICoreCommunicationManager;
      
      private var var_867:int = 1;
      
      private var var_1936:Boolean = false;
      
      private var var_1934:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1072 = new HabboMessages();
         var_269 = [];
         var_1287 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,unloading);
      }
      
      public function get port() : int
      {
         if(var_358 < 0 || var_358 >= var_269.length)
         {
            return 0;
         }
         return var_269[var_358];
      }
      
      private function unloading(param1:Event) : void
      {
         if(_connection)
         {
            _connection.send(new DisconnectMessageComposer());
            _connection.dispose();
            _connection = null;
         }
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_269[var_358]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_867 + " attempts");
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",Core.const_162);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_269 = [];
            var_35 = _habboConfiguration.getKey("connection.info.host",null);
            if(var_35 == null)
            {
               Core.crash("connection.info.host was not defined",Core.const_322);
               return;
            }
            _loc2_ = _habboConfiguration.getKey("connection.info.port",null);
            if(_loc2_ == null)
            {
               Core.crash("connection.info.port was not defined",Core.const_322);
               return;
            }
            if(_habboConfiguration.keyExists("local.environment"))
            {
               var_35 = _habboConfiguration.getKey("connection.info.host.local");
               _loc2_ = _habboConfiguration.getKey("connection.info.port.local");
            }
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_269.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_35);
            Logger.log("Connection Host: " + var_35);
            Logger.log("Connection Ports: " + var_269);
            Logger.log("Habbo Connection Info:" + _connection);
            var_1936 = true;
            if(var_1934)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1436,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1189,param1 + " " + param2);
         if(false)
         {
            var_81 += ",R:" + param1;
         }
         else
         {
            var_81 = "R:" + param1;
         }
         if(false)
         {
            var_81 = var_81.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_81);
      }
      
      private function nextPort() : void
      {
         if(false)
         {
            return;
         }
         ++var_358;
         if(var_358 >= var_269.length)
         {
            ++var_867;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_867);
            if(var_867 > const_1741)
            {
               if(var_1935)
               {
                  return;
               }
               var_1935 = true;
               Core.error("Connection failed to host " + var_35 + " ports " + var_269,true,Core.const_322);
               return;
            }
            var_358 = 0;
         }
         _connection.timeout = var_867 * 10000;
         _connection.init(var_35,var_269[var_358]);
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1287.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_82;
      }
      
      override public function dispose() : void
      {
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(var_309)
         {
            var_309.release(new IIDCoreCommunicationManager());
            var_309 = null;
         }
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_252:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_322);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_322);
                  return;
               }
               var_1934 = true;
               if(var_1936)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         var_309.addConnectionMessageEvent(HabboConnectionType.const_252,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1395,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1326,String(param2));
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1388,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1211,param1 + " " + param2);
         if(false)
         {
            var_81 += ",S:" + param1;
         }
         else
         {
            var_81 = "S:" + param1;
         }
         if(false)
         {
            var_81 = var_81.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_81);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_269[var_358]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_82 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_309 = param2 as ICoreCommunicationManager;
            var_309.connectionStateListener = this;
            var_309.registerProtocolType(HabboProtocolType.const_999,WedgieProtocol);
            _connection = var_309.createConnection(HabboConnectionType.const_252,ConnectionType.const_938);
            _loc3_ = var_309.getProtocolInstanceOfType(HabboProtocolType.const_999);
            _connection.registerMessageClasses(var_1072);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function tryNextPort() : void
      {
         var_1287.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1287.start();
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!var_309 ? var_309.queueConnection(HabboConnectionType.const_252,param1) : null;
      }
   }
}
