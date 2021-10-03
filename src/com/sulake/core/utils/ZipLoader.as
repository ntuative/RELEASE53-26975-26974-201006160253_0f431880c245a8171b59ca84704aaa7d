package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import deng.fzip.FZipErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_523:uint = 0;
      
      private var var_95:FZip;
      
      private var var_1352:Array;
      
      private var var_2093:uint = 0;
      
      private var var_924:int = 0;
      
      private var _bytesTotal:uint = 0;
      
      public function ZipLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
         var_1352 = new Array();
      }
      
      override protected function removeEventListeners() : void
      {
         if(var_95)
         {
            var_95.removeEventListener(Event.COMPLETE,onComplete);
            var_95.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            var_95.removeEventListener(ProgressEvent.PROGRESS,onProgress);
            var_95.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
            var_95.removeEventListener(FZipErrorEvent.const_124,onParseError);
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         debug("Load event IO ERROR for file \"undefined\"");
         if(!handleHttpStatus(var_153))
         {
            var_191 = getTimer();
            failure("IO Error, load operation failed for file \"undefined\" (" + var_523 + "/" + _bytesTotal + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_523;
      }
      
      private function onParseError(param1:FZipErrorEvent) : void
      {
         debug("Load event parse error for file \"undefined\"");
         if(!handleHttpStatus(var_153))
         {
            var_191 = getTimer();
            failure("Parse Error, load operation failed for file \"undefined\" (" + var_523 + "/" + _bytesTotal + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override protected function loadEventHandler(param1:Event) : void
      {
      }
      
      override public function get bytesTotal() : uint
      {
         return _bytesTotal;
      }
      
      public function get resources() : Array
      {
         return var_1352;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var name:String = null;
         var event:Event = param1;
         try
         {
            name = getQualifiedClassName(var_14.content);
            var_1352.push(var_14.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_924;
            if(var_1352.length == var_2093)
            {
               var_14.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_14.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               removeEventListeners();
               var_583 = true;
               var_191 = getTimer();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,_bytesTotal,var_523,elapsedTime));
            }
            else
            {
               var_14.loadBytes(var_95.getFileAt(var_924).content);
            }
         }
         catch(e:Error)
         {
            failure("Crashed on ZipLoader.onLoaderComplete: \"undefined\" (" + var_523 + "/" + _bytesTotal + " bytes): " + e.message);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         _bytesTotal = param1.bytesTotal;
         var_523 = param1.bytesLoaded;
         debug("Load event PROGRESS for file \"undefined\"");
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,_bytesTotal,var_523,elapsedTime));
      }
      
      override public function load(param1:URLRequest, param2:int = 5) : void
      {
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         var_40 = param1;
         _name = parseNameFromUrl(var_40.url);
         var_302 = param2;
         if(var_95)
         {
            var_95.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_95 = new FZip();
         var_95.addEventListener(Event.COMPLETE,onComplete);
         var_95.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_95.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_95.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         var_95.addEventListener(FZipErrorEvent.const_124,onParseError);
         if(!var_475)
         {
            var_829 = getTimer();
            var_95.load(var_40);
         }
      }
      
      override protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(var_302 > 0)
            {
               if(var_95)
               {
                  var_95.close();
               }
               addRequestCounterToUrlRequest(var_40,const_966 - var_302);
               if(var_1194)
               {
                  var_40.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  var_40.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  var_1194 = false;
               }
               var_95.load(var_40);
               --var_302;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_40.url + "\" (" + var_523 + "/" + _bytesTotal + " bytes)");
            removeEventListeners();
         }
         return false;
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_924 = 0;
         var_2093 = var_95.getFileCount();
         debug("Load event COMPLETE for file \"undefined\"");
         removeEventListeners();
         try
         {
            if(var_14)
            {
               var_14.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_14.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_14.loadBytes(var_95.getFileAt(var_924).content);
            }
         }
         catch(e:Error)
         {
            debug("Failed to extract files from library \"undefined\"");
            if(!handleHttpStatus(var_153))
            {
               failure("Crashed on ZipLoader.onComplete: \"undefined\" (" + var_523 + "/" + _bytesTotal + " bytes): " + e.message);
            }
         }
      }
      
      private function onHTTPStatus(param1:HTTPStatusEvent) : void
      {
         var_153 = param1.status;
         debug("Load event STATUS " + var_153 + " for file \"" + var_40.url + "\"");
      }
      
      override public function resume() : void
      {
         if(var_475 && !_disposed)
         {
            var_475 = false;
            if(!var_583 && var_40)
            {
               var_95.load(var_40);
            }
         }
      }
   }
}
