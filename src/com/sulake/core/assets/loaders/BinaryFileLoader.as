package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_14:URLLoader;
      
      protected var _type:String;
      
      protected var var_684:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_684 = param2 == null ? "" : param2.url;
         _type = param1;
         var_14 = new URLLoader();
         var_14.addEventListener(Event.COMPLETE,loadEventHandler);
         var_14.addEventListener(Event.UNLOAD,loadEventHandler);
         var_14.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_14.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_14.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_14.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_14 ? 0 : uint(0);
      }
      
      public function load(param1:URLRequest) : void
      {
         var_684 = param1.url;
         var_393 = 0;
         var_14.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_14.load(param1);
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_14.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_14.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_14.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_14.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_14.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_14.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_14.close();
            }
            catch(e:Error)
            {
            }
            var_14 = null;
            _type = null;
            var_684 = null;
         }
      }
      
      public function get url() : String
      {
         return var_684;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_14 ? 0 : uint(0);
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get content() : Object
      {
         return !!var_14 ? var_14.data : null;
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_393 < var_2482)
            {
               try
               {
                  var_14.close();
               }
               catch(e:Error)
               {
               }
               var_14.load(new URLRequest(var_684 + (var_684.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_393));
               return true;
            }
         }
         return false;
      }
   }
}
