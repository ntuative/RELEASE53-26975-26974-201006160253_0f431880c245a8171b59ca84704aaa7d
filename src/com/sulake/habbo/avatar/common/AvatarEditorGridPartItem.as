package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.AvatarFigureContainer;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarEditorGridPartItem implements IAvatarImageListener
   {
      
      private static var var_58:Array = [];
      
      {
         var_58.push("li");
         var_58.push("lh");
         var_58.push("ls");
         var_58.push("lc");
         var_58.push("bd");
         var_58.push("sh");
         var_58.push("lg");
         var_58.push("ch");
         var_58.push("ca");
         var_58.push("cc");
         var_58.push("cp");
         var_58.push("wa");
         var_58.push("rh");
         var_58.push("rs");
         var_58.push("rc");
         var_58.push("hd");
         var_58.push("fc");
         var_58.push("ey");
         var_58.push("hr");
         var_58.push("hrb");
         var_58.push("fa");
         var_58.push("ea");
         var_58.push("ha");
         var_58.push("he");
         var_58.push("ri");
      }
      
      private const const_1737:int = 16777215;
      
      private var _isSelected:Boolean = false;
      
      private var var_1621:BitmapData;
      
      private var var_433:Rectangle;
      
      private var _isDisposed:Boolean;
      
      private const const_1738:int = 13421772;
      
      private var _colors:Array;
      
      private var var_1619:Boolean;
      
      private var var_392:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var var_638:IFigurePartSet;
      
      private var var_1620:int = 0;
      
      private var var_432:IAvatarRenderManager;
      
      private const const_249:Array = [2,6,0,4,3,1];
      
      public function AvatarEditorGridPartItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IFigurePartSet, param4:Array, param5:Boolean = true)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _model = param2;
         var_638 = param3;
         _window = param1;
         _colors = param4;
         var_1619 = param5;
         if(param3 == null)
         {
            var_392 = new BitmapData(1,1,true,16777215);
         }
         if(param3 != null)
         {
            _loc7_ = param3.parts;
            for each(_loc6_ in _loc7_)
            {
               var_1620 = Math.max(var_1620,_loc6_.colorLayerIndex);
            }
         }
         var_432 = _model.controller.avatarRenderManager;
         updateThumbVisualization();
      }
      
      private function renderThumb() : BitmapData
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         if(partSet == null)
         {
            return null;
         }
         if(_model == null)
         {
            return null;
         }
         if(var_433 == null)
         {
            if(!analyzePartLayers())
            {
               if(!var_1621)
               {
                  _loc9_ = _model.controller.assets.getAssetByName("avatar_editor_download_icon");
                  var_1621 = _loc9_.content as BitmapData;
               }
               return var_1621;
            }
         }
         if(!var_432)
         {
            return null;
         }
         _loc1_ = new BitmapData(var_433.width,var_433.height,true,16777215);
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Array = partSet.parts.concat().sort(sortByDrawOrder);
         for each(_loc2_ in _loc8_)
         {
            if(_loc7_)
            {
               _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_249[_loc6_] + "_" + FigureData.const_106;
               _loc4_ = var_432.getAssetByName(_loc3_) as BitmapDataAsset;
            }
            else
            {
               _loc6_ = 0;
               while(!_loc7_ && _loc6_ < const_249.length)
               {
                  _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_249[_loc6_] + "_" + FigureData.const_106;
                  _loc4_ = var_432.getAssetByName(_loc3_) as BitmapDataAsset;
                  if(_loc4_ && _loc4_.content)
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            if(_loc4_)
            {
               _loc5_ = (_loc4_.content as BitmapData).clone();
               _loc10_ = -1 * _loc4_.offset.x - 0;
               _loc11_ = -1 * _loc4_.offset.y - 0;
               if(var_1619 && _loc2_.colorLayerIndex > 0)
               {
                  _loc12_ = _colors[_loc2_.colorLayerIndex - 1];
                  if(_loc12_ != null)
                  {
                     _loc5_.colorTransform(_loc5_.rect,_loc12_.colorTransform);
                  }
               }
               _loc1_.copyPixels(_loc5_,_loc5_.rect,new Point(_loc10_,_loc11_),null,null,true);
            }
            else
            {
               Logger.log("Could not find asset: " + _loc3_);
            }
         }
         return _loc1_;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
         updateThumbVisualization();
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_392 = param1;
         updateThumbVisualization();
      }
      
      public function set colors(param1:Array) : void
      {
         _colors = param1;
         updateThumbVisualization();
      }
      
      public function get colorLayerCount() : int
      {
         return var_1620;
      }
      
      private function sortByDrawOrder(param1:IFigurePart, param2:IFigurePart) : Number
      {
         var _loc3_:Number = var_58.indexOf(param1.type);
         var _loc4_:Number = var_58.indexOf(param2.type);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      private function updateThumbVisualization() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!_window || false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc1_)
         {
            if(var_392 != null && !var_1619)
            {
               _loc3_ = var_392;
            }
            else
            {
               _loc3_ = renderThumb();
               if(!_loc3_)
               {
                  return;
               }
            }
            _loc4_ = !!_loc1_.bitmap ? _loc1_.bitmap : new BitmapData(_loc1_.width,_loc1_.height);
            _loc4_.fillRect(_loc4_.rect,16777215);
            _loc5_ = (_loc4_.width - _loc3_.width) / 2;
            _loc6_ = (_loc4_.height - _loc3_.height) / 2;
            _loc4_.copyPixels(_loc3_,_loc3_.rect,new Point(_loc5_,_loc6_),null,null,true);
            _loc1_.bitmap = _loc4_;
         }
         var _loc2_:IIconWindow = _window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc2_)
         {
            if(var_638)
            {
               switch(var_638.clubLevel)
               {
                  case HabboClubLevelEnum.const_50:
                     _loc2_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_60:
                     _loc2_.style = HabboIconType.const_547;
                     break;
                  case HabboClubLevelEnum.const_52:
                     _loc2_.style = HabboIconType.const_676;
               }
            }
            else
            {
               _loc2_.visible = false;
            }
         }
         if(isSelected)
         {
            _window.color = const_1738;
         }
         else
         {
            _window.color = const_1737;
         }
         _window.invalidate();
      }
      
      private function analyzePartLayers() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_model == null)
         {
            var_433 = null;
            return false;
         }
         if(!partSet || true || partSet.parts.length == 0)
         {
            var_433 = null;
            return false;
         }
         if(!var_432)
         {
            return false;
         }
         var _loc1_:AvatarFigureContainer = var_432.createFigureContainer("undefined-undefined");
         Logger.log("QUERYING SET:undefined-undefined");
         if(!var_432.isFigureReady(_loc1_))
         {
            var_432.downloadFigure(_loc1_,this);
            return false;
         }
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Rectangle = new Rectangle();
         for each(_loc2_ in partSet.parts)
         {
            if(_loc7_)
            {
               _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_249[_loc6_] + "_" + FigureData.const_106;
               _loc4_ = var_432.getAssetByName(_loc3_) as BitmapDataAsset;
            }
            else
            {
               _loc6_ = 0;
               while(!_loc7_ && _loc6_ < const_249.length)
               {
                  _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_249[_loc6_] + "_" + FigureData.const_106;
                  _loc4_ = var_432.getAssetByName(_loc3_) as BitmapDataAsset;
                  if(_loc4_ && _loc4_.content)
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            if(_loc4_ && _loc4_.content)
            {
               _loc5_ = _loc4_.content as BitmapData;
               _loc8_ = _loc8_.union(new Rectangle(-1 * _loc4_.offset.x,-1 * _loc4_.offset.y,_loc5_.width,_loc5_.height));
            }
         }
         if(_loc8_ && _loc8_.width > 0)
         {
            var_433 = _loc8_;
            return true;
         }
         return false;
      }
      
      public function get id() : int
      {
         if(var_638 == null)
         {
            return -1;
         }
         return var_638.id;
      }
      
      public function dispose() : void
      {
         _model = null;
         var_638 = null;
         if(_window != null)
         {
            if(true)
            {
               _window.dispose();
            }
         }
         _window = null;
         if(var_392)
         {
            var_392.dispose();
         }
         var_392 = null;
         _isDisposed = true;
      }
      
      public function update() : void
      {
         updateThumbVisualization();
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(!analyzePartLayers())
         {
            return;
         }
         updateThumbVisualization();
      }
      
      public function get partSet() : IFigurePartSet
      {
         return var_638;
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
   }
}
