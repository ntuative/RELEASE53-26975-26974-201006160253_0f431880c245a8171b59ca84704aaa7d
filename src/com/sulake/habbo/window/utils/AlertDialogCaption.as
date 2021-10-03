package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_355:Boolean;
      
      private var var_206:String;
      
      private var var_1320:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_206 = param1;
         var_1320 = param2;
         var_355 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1320;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_355 = param1;
      }
      
      public function get text() : String
      {
         return var_206;
      }
      
      public function get visible() : Boolean
      {
         return var_355;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1320 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_206 = param1;
      }
   }
}
