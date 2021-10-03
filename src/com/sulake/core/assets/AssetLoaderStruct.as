package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_786:IAssetLoader;
      
      private var var_1427:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1427 = param1;
         var_786 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_786;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_786 != null)
            {
               if(true)
               {
                  var_786.dispose();
                  var_786 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1427;
      }
   }
}
