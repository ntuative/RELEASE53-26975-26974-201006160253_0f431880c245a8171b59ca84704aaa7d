package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.Palette;
   import com.sulake.habbo.avatar.structure.figure.SetType;
   import flash.utils.Dictionary;
   
   public class FigureData implements IStructureData, IFigureData
   {
       
      
      private var var_540:Dictionary;
      
      private var _palettes:Dictionary;
      
      public function FigureData()
      {
         super();
         _palettes = new Dictionary();
         var_540 = new Dictionary();
      }
      
      public function dispose() : void
      {
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            _palettes[String(_loc2_.@id)] = new Palette(_loc2_);
         }
         for each(_loc3_ in param1.sets.settype)
         {
            var_540[String(_loc3_.@type)] = new SetType(_loc3_);
         }
         return true;
      }
      
      public function getPalette(param1:int) : IPalette
      {
         return _palettes[String(param1)];
      }
      
      public function injectXML(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1.sets.settype)
         {
            _loc3_ = var_540[String(_loc2_.@type)];
            if(_loc3_ != null)
            {
               _loc3_.cleanUp(_loc2_);
            }
            else
            {
               var_540[String(_loc2_.@type)] = new SetType(_loc2_);
            }
         }
         appendXML(param1);
      }
      
      public function getDefaultPartSet(param1:String, param2:String) : IFigurePartSet
      {
         var _loc3_:SetType = var_540[param1] as SetType;
         if(_loc3_)
         {
            return _loc3_.getDefaultPartSet(param2);
         }
         return null;
      }
      
      public function getSetType(param1:String) : ISetType
      {
         return var_540[param1];
      }
      
      public function appendXML(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            _loc4_ = _palettes[String(_loc2_.@id)];
            if(_loc4_ == null)
            {
               _palettes[String(_loc2_.@id)] = new Palette(_loc2_);
            }
            else
            {
               _loc4_.append(_loc2_);
            }
         }
         for each(_loc3_ in param1.sets.settype)
         {
            _loc5_ = var_540[String(_loc3_.@type)];
            if(_loc5_ == null)
            {
               var_540[String(_loc3_.@type)] = new SetType(_loc3_);
            }
            else
            {
               _loc5_.append(_loc3_);
            }
         }
         return false;
      }
      
      public function getMandatorySetTypeIds() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for each(_loc2_ in var_540)
         {
            if(_loc2_ && _loc2_.isMandatory)
            {
               _loc1_.push(_loc2_.type);
            }
         }
         return _loc1_;
      }
   }
}
