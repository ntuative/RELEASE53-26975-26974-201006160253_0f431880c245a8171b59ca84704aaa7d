package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_14:Sound;
      
      protected var _type:String;
      
      protected var var_684:String;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_684 = param2 == null ? "" : param2.url;
         _type = param1;
         var_14 = new Sound(null,null);
         var_14.addEventListener(Event.ID3,loadEventHandler);
         var_14.addEventListener(Event.OPEN,loadEventHandler);
         var_14.addEventListener(Event.COMPLETE,loadEventHandler);
         var_14.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_14.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_14 ? 0 : uint(0);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_14.removeEventListener(Event.ID3,loadEventHandler);
            var_14.removeEventListener(Event.OPEN,loadEventHandler);
            var_14.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_14.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_14.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_14 = null;
            _type = null;
            var_684 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_684 = param1.url;
         var_14.load(param1,null);
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
         return var_14;
      }
   }
}
