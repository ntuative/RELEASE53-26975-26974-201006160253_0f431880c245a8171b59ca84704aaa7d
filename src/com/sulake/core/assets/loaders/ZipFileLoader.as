package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_112:URLStream;
      
      protected var _type:String;
      
      protected var var_684:String;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_684 = param2 == null ? "" : param2.url;
         _type = param1;
         var_112 = new URLStream();
         var_112.addEventListener(Event.COMPLETE,loadEventHandler);
         var_112.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_112.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_112.addEventListener(Event.OPEN,loadEventHandler);
         var_112.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_112.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_112.bytesAvailable;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_112.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_112.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_112.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_112.removeEventListener(Event.OPEN,loadEventHandler);
            var_112.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_112.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_112.close();
            var_112 = null;
            _type = null;
            var_684 = null;
         }
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_684 = param1.url;
         var_112.load(param1);
      }
      
      public function get url() : String
      {
         return var_684;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_112.bytesAvailable;
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get content() : Object
      {
         return var_112;
      }
   }
}
