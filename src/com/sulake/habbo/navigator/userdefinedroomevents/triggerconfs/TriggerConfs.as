package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   public class TriggerConfs
   {
       
      
      private var var_535:Array;
      
      public function TriggerConfs()
      {
         var_535 = new Array();
         super();
         this.var_535.push(new AvatarSaysSomething());
         this.var_535.push(new AvatarEntersStuff());
         this.var_535.push(new AvatarExitsStuff());
         this.var_535.push(new TriggerOnce());
         this.var_535.push(new StuffIsUsed());
         this.var_535.push(new UseStuffAndStateSnapshotMatches());
      }
      
      public function getByCode(param1:int) : TriggerConf
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_535)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get confs() : Array
      {
         return var_535;
      }
   }
}
