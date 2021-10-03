package com.sulake.habbo.communication.messages.outgoing.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SetActivatedBadgesComposer implements IMessageComposer
   {
       
      
      private var var_1029:Array;
      
      private const const_1455:int = 5;
      
      public function SetActivatedBadgesComposer()
      {
         super();
         var_1029 = new Array();
      }
      
      public function addActivatedBadge(param1:String) : void
      {
         if(var_1029.length >= const_1455)
         {
            return;
         }
         var_1029.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 1;
         while(_loc2_ <= const_1455)
         {
            if(_loc2_ <= var_1029.length)
            {
               _loc1_.push(_loc2_);
               _loc1_.push(var_1029[_loc2_ - 1]);
            }
            else
            {
               _loc1_.push(_loc2_);
               _loc1_.push("");
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
      }
   }
}
