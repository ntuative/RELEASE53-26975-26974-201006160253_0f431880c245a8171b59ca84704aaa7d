package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.animation.AnimationAction;
   import flash.utils.Dictionary;
   
   public class AnimationData implements IStructureData
   {
       
      
      private var var_235:Dictionary;
      
      public function AnimationData()
      {
         super();
         var_235 = new Dictionary();
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.action)
         {
            var_235[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
      
      public function getAction(param1:IActionDefinition) : AnimationAction
      {
         return var_235[param1.assetPartDefinition];
      }
      
      public function appendXML(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.action)
         {
            var_235[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
   }
}
