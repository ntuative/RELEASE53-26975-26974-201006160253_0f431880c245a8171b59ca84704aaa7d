package com.sulake.core
{
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.ICore;
   import flash.display.DisplayObjectContainer;
   
   public final class Core
   {
      
      public static const const_322:int = 30;
      
      public static const const_630:int = 4;
      
      private static var _instance:ICore;
      
      public static const const_20:int = 11;
      
      public static const const_1218:int = 6;
      
      public static const const_919:uint = 1;
      
      public static const const_1437:int = 99;
      
      public static const const_1534:int = 7;
      
      public static const const_162:int = 1;
      
      public static const const_1327:uint = 2;
      
      public static const const_1435:uint = 7;
      
      public static const const_9:int = 9;
      
      public static const CORE_SETUP_DEBUG:uint = 7;
      
      public static const const_837:int = 10;
      
      public static const const_1191:int = 5;
      
      public static const const_1312:int = 2;
      
      public static const const_1331:int = 20;
      
      public static const const_1352:uint = 0;
      
      public static const const_1309:int = 3;
       
      
      public function Core()
      {
         super();
      }
      
      public static function crash(param1:String, param2:int, param3:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,true,param2,param3);
         }
      }
      
      public static function get instance() : ICore
      {
         return _instance;
      }
      
      public static function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,param2,param3,param4);
         }
      }
      
      public static function get version() : String
      {
         return "0.0.2";
      }
      
      public static function dispose() : void
      {
         if(_instance != null)
         {
            _instance.dispose();
            _instance = null;
         }
      }
      
      public static function instantiate(param1:DisplayObjectContainer, param2:uint) : ICore
      {
         if(_instance == null)
         {
            _instance = new CoreComponent(param1,param2);
         }
         return _instance;
      }
      
      public static function warning(param1:String) : void
      {
         if(_instance)
         {
            _instance.warning(param1);
         }
      }
   }
}
