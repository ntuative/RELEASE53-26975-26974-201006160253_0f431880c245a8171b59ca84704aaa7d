package com.sulake.habbo.room
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent;
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.RoomObjectRoomActionEvent;
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.utils.LegacyWallGeometry;
   import com.sulake.habbo.room.utils.RoomCamera;
   import com.sulake.habbo.room.utils.RoomData;
   import com.sulake.habbo.room.utils.RoomInstanceData;
   import com.sulake.habbo.room.utils.SelectedRoomObjectData;
   import com.sulake.habbo.room.utils.TileHeightMap;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDRoomManager;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.iid.IIDRoomRendererFactory;
   import com.sulake.iid.IIDSessionDataManager;
   import com.sulake.room.IRoomInstance;
   import com.sulake.room.IRoomManager;
   import com.sulake.room.IRoomManagerListener;
   import com.sulake.room.IRoomObjectFactory;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.renderer.IRoomRenderer;
   import com.sulake.room.renderer.IRoomRendererFactory;
   import com.sulake.room.renderer.IRoomRenderingCanvas;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.NumberBank;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomEngine extends Component implements IRoomEngine, IRoomManagerListener, IRoomCreator, IRoomEngineServices, IUpdateReceiver
   {
      
      private static const const_515:String = "room";
      
      private static const const_774:int = -2;
      
      private static const const_514:String = "temporary_room";
      
      private static const const_298:String = "object_icon_sprite";
      
      private static const const_773:int = -3;
      
      private static const const_772:String = "overlay";
      
      private static const OBJECT_TYPE_SELECTION_ARROW:String = "selection_arrow";
      
      private static const const_1065:String = "tile_cursor";
      
      private static const const_299:int = -1;
       
      
      private var var_468:IRoomObjectVisualizationFactory = null;
      
      private var var_481:Boolean = false;
      
      private var var_12:RoomContentLoader = null;
      
      private var var_304:Map = null;
      
      private var _connection:IConnection = null;
      
      private var var_278:IAdManager = null;
      
      private var var_589:NumberBank;
      
      private var var_41:IRoomManager = null;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1505:int = 0;
      
      private var var_1506:int = 0;
      
      private var var_1220:int = -1;
      
      private var var_381:ISessionDataManager = null;
      
      private var var_305:Map = null;
      
      private var var_26:IRoomObjectFactory = null;
      
      private var var_66:RoomObjectEventHandler = null;
      
      private var var_698:RoomMessageHandler = null;
      
      private var var_699:IRoomRendererFactory = null;
      
      private var var_1752:Boolean = false;
      
      private var var_115:int = 0;
      
      private var var_1024:Map;
      
      private var _communication:IHabboCommunicationManager = null;
      
      private var var_114:int = 0;
      
      public function RoomEngine(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         var_305 = new Map();
         var_589 = new NumberBank(1000);
         var_1024 = new Map();
         var_304 = new Map();
         var_66 = new RoomObjectEventHandler(this);
         var_698 = new RoomMessageHandler(this);
         var_12 = new RoomContentLoader();
         queueInterface(new IIDRoomObjectFactory(),onObjectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),onVisualizationFactoryReady);
         queueInterface(new IIDRoomManager(),onRoomManagerReady);
         queueInterface(new IIDRoomRendererFactory(),onRendererFactoryReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
         queueInterface(new IIDHabboAdManager(),onAdManagerReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         initialize();
         registerUpdateReceiver(this,1);
      }
      
      public function getTileHeightMap(param1:int, param2:int) : TileHeightMap
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.tileHeightMap;
         }
         return null;
      }
      
      public function get activeRoomId() : int
      {
         return var_114;
      }
      
      public function deleteRoomObject(param1:int, param2:int) : Boolean
      {
         if(var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_32)
            {
               return var_66.deleteWallItem(var_114,var_115,param1);
            }
         }
         return false;
      }
      
      private function getRoomCanvas(param1:int, param2:int, param3:int) : IRoomRenderingCanvas
      {
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = var_41.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:IRoomRenderer = _loc5_.getRenderer() as IRoomRenderer;
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getCanvas(param3);
      }
      
      private function updateRoomCameras(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = NaN;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:* = NaN;
         var _loc23_:* = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:* = null;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = NaN;
         var _loc30_:* = NaN;
         var _loc31_:* = NaN;
         var _loc32_:* = NaN;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:Boolean = false;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:Boolean = false;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:* = NaN;
         var _loc42_:* = NaN;
         var _loc43_:* = NaN;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:* = null;
         var _loc49_:* = null;
         var _loc2_:int = 0;
         for(; _loc2_ < var_305.length; _loc2_++)
         {
            _loc3_ = var_305.getWithIndex(_loc2_) as RoomInstanceData;
            _loc4_ = null;
            _loc5_ = 0;
            _loc6_ = 0;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.roomCamera;
               _loc5_ = _loc3_.roomId;
               _loc6_ = _loc3_.roomCategory;
            }
            if(_loc4_ != null)
            {
               _loc7_ = 1;
               _loc8_ = getRoomCanvasGeometry(_loc5_,_loc6_,_loc7_) as RoomGeometry;
               if(_loc8_ != null)
               {
                  _loc9_ = _loc4_.targetId;
                  _loc10_ = _loc4_.targetCategory;
                  _loc11_ = getRoomObject(_loc5_,_loc6_,_loc9_,_loc10_);
                  if(_loc11_ != null)
                  {
                     _loc12_ = new Vector3d();
                     _loc12_.assign(_loc11_.getLocation());
                     _loc12_.x = Math.round(_loc12_.x);
                     _loc12_.y = Math.round(_loc12_.y);
                     _loc13_ = Number(Math.floor(_loc12_.z) + 1);
                     _loc14_ = getRoomCanvasRectangle(_loc5_,_loc6_,_loc7_);
                     if(_loc14_ != null)
                     {
                        _loc15_ = getRoom(_loc5_,_loc6_);
                        if(_loc15_ != null)
                        {
                           _loc16_ = _loc15_.getNumber(RoomVariableEnum.const_533) - 0.5;
                           _loc17_ = _loc15_.getNumber(RoomVariableEnum.const_620) - 0.5;
                           _loc18_ = _loc15_.getNumber(RoomVariableEnum.const_763) + 0.5;
                           _loc19_ = _loc15_.getNumber(RoomVariableEnum.const_605) + 0.5;
                           _loc20_ = Math.round((_loc16_ + _loc18_) / 2);
                           _loc21_ = Math.round((_loc17_ + _loc19_) / 2);
                           _loc22_ = 2;
                           _loc23_ = new Point(_loc12_.x - _loc20_,_loc12_.y - _loc21_);
                           _loc24_ = _loc8_.scale / Math.sqrt(2);
                           _loc25_ = _loc24_ / 2;
                           _loc26_ = new Matrix();
                           _loc26_.rotate(-(_loc8_.direction.x + 90) / 180 * 0);
                           _loc23_ = _loc26_.transformPoint(_loc23_);
                           _loc23_.y *= _loc25_ / _loc24_;
                           _loc27_ = _loc14_.width / 2 / _loc24_ - 1;
                           _loc28_ = _loc14_.height / 2 / _loc25_ - 1;
                           _loc29_ = 0;
                           _loc30_ = 0;
                           _loc31_ = 0;
                           _loc32_ = 0;
                           _loc33_ = _loc8_.getScreenPoint(new Vector3d(_loc20_,_loc21_,_loc22_));
                           _loc33_.x += Math.round(_loc14_.width / 2);
                           _loc33_.y += Math.round(_loc14_.height / 2);
                           _loc34_ = getActiveRoomBoundingRectangle(_loc7_);
                           if(_loc34_ != null)
                           {
                              if(!(_loc34_.width > 1 && _loc34_.height > 1))
                              {
                                 _loc8_.adjustLocation(new Vector3d(-30,-30),25);
                              }
                              _loc29_ = Number((_loc34_.left - _loc33_.x - _loc8_.scale * 0.25) / _loc24_);
                              _loc31_ = Number((_loc34_.right - _loc33_.x + _loc8_.scale * 0.25) / _loc24_);
                              _loc30_ = Number((_loc34_.top - _loc33_.y - _loc8_.scale * 0.5) / _loc25_);
                              _loc32_ = Number((_loc34_.bottom - _loc33_.y + _loc8_.scale * 0.5) / _loc25_);
                              _loc35_ = false;
                              _loc36_ = false;
                              _loc37_ = false;
                              _loc38_ = false;
                              _loc39_ = Math.round((_loc31_ - _loc29_) * _loc24_);
                              if(_loc39_ < _loc14_.width)
                              {
                                 _loc13_ = 2;
                                 _loc23_.x = (_loc31_ + _loc29_) / 2;
                                 _loc37_ = true;
                              }
                              else
                              {
                                 if(_loc23_.x > _loc31_ - _loc27_)
                                 {
                                    _loc23_.x = _loc31_ - _loc27_;
                                    _loc35_ = true;
                                 }
                                 if(_loc23_.x < _loc29_ + _loc27_)
                                 {
                                    _loc23_.x = _loc29_ + _loc27_;
                                    _loc35_ = true;
                                 }
                              }
                              _loc40_ = Math.round((_loc32_ - _loc30_) * _loc25_);
                              if(_loc40_ < _loc14_.height)
                              {
                                 _loc13_ = 2;
                                 _loc23_.y = (_loc32_ + _loc30_) / 2;
                                 _loc38_ = true;
                              }
                              else
                              {
                                 if(_loc23_.y > _loc32_ - _loc28_)
                                 {
                                    _loc23_.y = _loc32_ - _loc28_;
                                    _loc36_ = true;
                                 }
                                 if(_loc23_.y < _loc30_ + _loc28_)
                                 {
                                    _loc23_.y = _loc30_ + _loc28_;
                                    _loc36_ = true;
                                 }
                                 _loc23_.y /= _loc25_ / _loc24_;
                              }
                              _loc26_.invert();
                              _loc23_ = _loc26_.transformPoint(_loc23_);
                              _loc23_.x += _loc20_;
                              _loc23_.y += _loc21_;
                              _loc41_ = 0.35;
                              _loc42_ = 0.1;
                              _loc43_ = 0.2;
                              _loc44_ = 10;
                              _loc45_ = 10;
                              _loc46_ = Math.round(_loc14_.width);
                              _loc47_ = Math.round(_loc14_.height);
                              if(_loc4_.limitedLocationX && _loc4_.screenWd == _loc46_ && _loc4_.screenHt == _loc47_)
                              {
                                 _loc43_ = 0;
                              }
                              if(_loc4_.limitedLocationY && _loc4_.screenWd == _loc46_ && _loc4_.screenHt == _loc47_)
                              {
                                 _loc41_ = 0;
                                 _loc42_ = 0;
                              }
                              _loc14_.right *= 1 - _loc43_ * 2;
                              _loc14_.bottom *= 1 - (_loc41_ + _loc42_);
                              if(_loc14_.right < _loc44_)
                              {
                                 _loc14_.right = _loc44_;
                              }
                              if(_loc14_.bottom < _loc45_)
                              {
                                 _loc14_.bottom = _loc45_;
                              }
                              if(_loc41_ + _loc42_ > 0)
                              {
                                 _loc14_.offset(-_loc14_.width / 2,-_loc14_.height * (_loc42_ / (_loc41_ + _loc42_)));
                              }
                              else
                              {
                                 _loc14_.offset(-_loc14_.width / 2,-_loc14_.height / 2);
                              }
                              _loc48_ = getLegacyGeometry(_loc5_,_loc6_);
                              _loc49_ = getTileHeightMap(_loc5_,_loc6_);
                              if(_loc48_ != null && _loc49_ != null)
                              {
                                 if(!_loc49_.isRoomTile(_loc12_.x,_loc12_.y))
                                 {
                                 }
                              }
                              _loc33_ = _loc8_.getScreenPoint(_loc12_);
                              if(_loc33_ != null)
                              {
                                 _loc12_.z = _loc13_;
                                 _loc12_.x = Math.round(_loc23_.x * 2) / 2;
                                 _loc12_.y = Math.round(_loc23_.y * 2) / 2;
                                 _loc4_.initializeLocation(_loc12_);
                                 if((_loc33_.x < _loc14_.left || _loc33_.x > _loc14_.right) && !_loc37_ || (_loc33_.y < _loc14_.top || _loc33_.y > _loc14_.bottom) && !_loc38_ || _loc37_ && !_loc4_.centeredLocX || _loc38_ && !_loc4_.centeredLocY || (_loc4_.roomWd != _loc34_.width || _loc4_.roomHt != _loc34_.height))
                                 {
                                    _loc4_.limitedLocationX = _loc35_;
                                    _loc4_.limitedLocationY = _loc36_;
                                    _loc4_.target = _loc12_;
                                 }
                                 else
                                 {
                                    if(!_loc35_)
                                    {
                                       _loc4_.limitedLocationX = false;
                                    }
                                    if(!_loc36_)
                                    {
                                       _loc4_.limitedLocationY = false;
                                    }
                                 }
                                 _loc4_.update(param1);
                                 _loc8_.adjustLocation(_loc4_.location,25);
                                 _loc4_.centeredLocX = _loc37_;
                                 _loc4_.centeredLocY = _loc38_;
                                 _loc4_.screenWd = _loc46_;
                                 _loc4_.screenHt = _loc47_;
                                 _loc4_.roomWd = _loc34_.width;
                                 _loc4_.roomHt = _loc34_.height;
                              }
                              continue;
                              return;
                           }
                           _loc8_.adjustLocation(new Vector3d(0,0),25);
                           return;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function objectInitialized(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc4_:int = getRoomId(param1);
         var _loc5_:int = getRoomCategory(param1);
         if(param3 == RoomObjectCategoryEnum.const_32)
         {
            updateObjectRoomWindow(_loc4_,_loc5_,param2);
         }
         var _loc6_:IRoomObjectController = getRoomObject(_loc4_,_loc5_,param2,param3) as IRoomObjectController;
         if(_loc6_ != null && _loc6_.getModel() != null && _loc6_.getEventHandler() != null)
         {
            _loc7_ = _loc6_.getModel().getString(RoomObjectVariableEnum.const_111);
            if(_loc7_ != null)
            {
               _loc8_ = _loc6_.getState(0);
               _loc9_ = new RoomObjectDataUpdateMessage(_loc8_,_loc7_);
               _loc6_.getEventHandler().processUpdateMessage(_loc9_);
            }
         }
      }
      
      public function getRoomObjectBoundingRectangle(param1:int, param2:int, param3:int, param4:int, param5:int) : Rectangle
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc6_:IRoomGeometry = getRoomCanvasGeometry(param1,param2,param5);
         if(_loc6_ != null)
         {
            _loc7_ = getRoomObject(param1,param2,param3,param4);
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.getVisualization();
               if(_loc8_ != null)
               {
                  _loc9_ = _loc8_.boundingRectangle;
                  _loc10_ = _loc6_.getScreenPoint(_loc7_.getLocation());
                  if(_loc10_ != null)
                  {
                     _loc9_.offset(_loc10_.x,_loc10_.y);
                     _loc11_ = getRoomCanvasRectangle(param1,param2,param5);
                     if(_loc11_ != null)
                     {
                        _loc9_.offset(_loc11_.width / 2,_loc11_.height / 2);
                        return _loc9_;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function selectRoomObject(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(var_66 == null)
         {
            return;
         }
         var_66.setSelectedObject(param1,param2,param3,param4);
      }
      
      public function modifyRoomObjectData(param1:int, param2:int, param3:String) : Boolean
      {
         if(var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_32)
            {
               return var_66.modifyWallItemData(var_114,var_115,param1,param3);
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         removeUpdateReceiver(this);
         if(var_26 != null)
         {
            var_26.release(new IIDRoomObjectFactory());
            var_26 = null;
         }
         if(var_468 != null)
         {
            var_468.release(new IIDRoomObjectVisualizationFactory());
            var_468 = null;
         }
         if(var_41 != null)
         {
            var_41.release(new IIDRoomManager());
            var_41 = null;
         }
         if(var_699 != null)
         {
            var_699.release(new IIDRoomRendererFactory());
            var_699 = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_habboConfiguration != null)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         if(var_278)
         {
            var_278.release(new IIDHabboAdManager());
            var_278 = null;
         }
         _connection = null;
         if(var_589 != null)
         {
            var_589.dispose();
            var_589 = null;
         }
         if(var_1024 != null)
         {
            var_1024.dispose();
         }
         if(var_66 != null)
         {
            var_66.dispose();
            var_66 = null;
         }
         if(var_698 != null)
         {
            var_698.dispose();
            var_698 = null;
         }
         if(var_12 != null)
         {
            var_12.dispose();
            var_12 = null;
         }
         if(var_304 != null)
         {
            var_304.dispose();
            var_304 = null;
         }
         if(var_305 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_305.length)
            {
               _loc2_ = var_305.getWithIndex(_loc1_) as RoomInstanceData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_305.dispose();
            var_305 = null;
         }
         super.dispose();
      }
      
      public function setPlacedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.placedObject = param3;
         }
      }
      
      private function getObject(param1:String, param2:int, param3:int) : IRoomObjectController
      {
         var _loc4_:IRoomInstance = var_41.getRoom(param1);
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:* = null;
         return _loc4_.getObject(param2,param3) as IRoomObjectController;
      }
      
      public function createRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : DisplayObject
      {
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc7_:String = getRoomIdentifier(param1,param2);
         var _loc8_:IRoomInstance = var_41.getRoom(_loc7_);
         if(_loc8_ == null)
         {
            return null;
         }
         var _loc9_:IRoomRenderer = _loc8_.getRenderer() as IRoomRenderer;
         if(_loc9_ == null)
         {
            _loc9_ = var_699.createRenderer();
         }
         if(_loc9_ == null)
         {
            return null;
         }
         _loc9_.roomObjectVariableAccurateZ = RoomObjectVariableEnum.const_1041;
         _loc8_.setRenderer(_loc9_);
         var _loc10_:IRoomRenderingCanvas = _loc9_.createCanvas(param3,param4,param5,param6);
         if(_loc10_ == null)
         {
            return null;
         }
         _loc10_.mouseListener = var_66;
         if(_loc10_.geometry != null)
         {
            _loc12_ = getWorldType(param1,param2);
            if(isPublicRoomWorldType(_loc12_))
            {
               if(var_12 != null)
               {
                  if(var_12.getPublicRoomWorldSize(_loc12_) != 64)
                  {
                     _loc10_.geometry.performZoomOut();
                  }
               }
            }
            _loc10_.geometry.z_scale = _loc8_.getNumber(RoomVariableEnum.const_655);
         }
         if(_loc10_.geometry != null)
         {
            _loc13_ = _loc8_.getNumber(RoomObjectVariableEnum.const_687);
            _loc14_ = _loc8_.getNumber(RoomObjectVariableEnum.const_609);
            _loc15_ = _loc8_.getNumber(RoomObjectVariableEnum.const_1037);
            _loc16_ = _loc8_.getNumber(RoomObjectVariableEnum.const_918);
            _loc17_ = new Vector3d(_loc13_,_loc14_,_loc15_);
            _loc18_ = null;
            if(_loc16_ == 90)
            {
               _loc18_ = new Vector3d(-1000,0,0);
            }
            if(_loc16_ == 180)
            {
               _loc18_ = new Vector3d(0,-1000,0);
            }
            _loc10_.geometry.setDisplacement(_loc17_,_loc18_);
         }
         var _loc11_:Sprite = _loc10_.displayObject as Sprite;
         if(_loc11_ != null)
         {
            _loc19_ = new Sprite();
            _loc19_.name = const_772;
            _loc19_.mouseEnabled = false;
            _loc11_.addChild(_loc19_);
         }
         return _loc11_;
      }
      
      private function getRoomObjectAdURL(param1:String) : String
      {
         if(var_12 != null)
         {
            return var_12.getRoomObjectAdURL(param1);
         }
         return "";
      }
      
      public function updateObjectRoomWindow(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:String = "undefined_" + param3;
         var _loc6_:* = null;
         var _loc7_:IRoomObjectController = getObjectWallItem(param1,param2,param3);
         if(_loc7_ != null)
         {
            if(_loc7_.getModel() != null)
            {
               if(_loc7_.getModel().getNumber(RoomObjectVariableEnum.const_917) > 0)
               {
                  _loc9_ = _loc7_.getModel().getString(RoomObjectVariableEnum.const_970);
                  _loc10_ = _loc7_.getLocation();
                  if(param4)
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_483,_loc5_,_loc9_,_loc10_);
                  }
                  else
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_617,_loc5_);
                  }
               }
            }
         }
         else
         {
            _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_617,_loc5_);
         }
         var _loc8_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc8_ != null && _loc8_.getEventHandler() != null && _loc6_ != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc6_);
         }
      }
      
      public function loadRoomResources(param1:String) : Array
      {
         if(var_12 != null)
         {
            return var_12.loadLegacyContent(param1,_events);
         }
         return new Array();
      }
      
      private function disposeObject(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:IRoomInstance = var_41.getRoom(param1);
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.disposeObject(param2,param3))
         {
            if(events != null)
            {
               events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_565,var_114,var_115,param2,param3));
            }
         }
      }
      
      private function getRoomId(param1:String) : int
      {
         return 1;
      }
      
      public function modifyRoomObject(param1:int, param2:int, param3:String) : Boolean
      {
         if(var_66 != null)
         {
            return var_66.modifyRoomObject(var_114,var_115,param1,param2,param3);
         }
         return false;
      }
      
      public function getLegacyGeometry(param1:int, param2:int) : LegacyWallGeometry
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.legacyGeometry;
         }
         return null;
      }
      
      public function get roomManager() : IRoomManager
      {
         return var_41;
      }
      
      private function getOverlayIconSprite(param1:Sprite, param2:String) : Sprite
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  return _loc4_;
               }
            }
            _loc3_--;
         }
         return null;
      }
      
      public function updateObjectRoom(param1:int, param2:int, param3:String = null, param4:String = null, param5:String = null) : Boolean
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc6_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc6_ == null)
         {
            _loc8_ = getRoomIdentifier(param1,param2);
            _loc9_ = var_304.getValue(_loc8_);
            if(_loc9_ == null)
            {
               _loc9_ = new RoomData(param1,param2,null);
               var_304.add(_loc8_,_loc9_);
            }
            if(param3 != null)
            {
               _loc9_.floorType = param3;
            }
            if(param4 != null)
            {
               _loc9_.wallType = param4;
            }
            if(param5 != null)
            {
               _loc9_.landscapeType = param5;
            }
            return true;
         }
         if(_loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         if(param3 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_573,param3);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         if(param4 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_736,param4);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         if(param5 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_555,param5);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         return true;
      }
      
      public function setTileHeightMap(param1:int, param2:int, param3:TileHeightMap) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.tileHeightMap = param3;
         }
      }
      
      public function modifyRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         var _loc6_:IRoomRenderingCanvas = getRoomCanvas(param1,param2,param3);
         if(_loc6_ == null)
         {
            return false;
         }
         _loc6_.initialize(param4,param5);
         return true;
      }
      
      private function onRoomManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_41 = param2 as IRoomManager;
         if(var_41 != null)
         {
            var_41.addObjectUpdateCategory(RoomObjectCategoryEnum.const_34);
            var_41.addObjectUpdateCategory(RoomObjectCategoryEnum.const_32);
            var_41.addObjectUpdateCategory(RoomObjectCategoryEnum.const_38);
            var_41.addObjectUpdateCategory(RoomObjectCategoryEnum.const_285);
            var_41.addObjectUpdateCategory(RoomObjectCategoryEnum.const_69);
            var_41.setContentLoader(var_12);
         }
         initializeRoomManager();
      }
      
      private function roomObjectEventHandler(param1:RoomObjectEvent) : void
      {
         if(var_66 != null)
         {
            var_66.handleRoomObjectEvent(param1,var_114,var_115);
         }
      }
      
      public function disposeObjectWallItem(param1:int, param2:int, param3:int) : void
      {
         disposeObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_32);
         updateObjectRoomWindow(param1,param2,param3,false);
      }
      
      private function createObjectWallItem(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return createObject(getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      public function getSelectedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.selectedObject;
         }
         return null;
      }
      
      private function addOverlayIconSprite(param1:Sprite, param2:String, param3:BitmapData) : Sprite
      {
         if(param1 == null || param3 == null)
         {
            return null;
         }
         var _loc4_:Sprite = getOverlayIconSprite(param1,param2);
         if(_loc4_ != null)
         {
            return null;
         }
         _loc4_ = new Sprite();
         _loc4_.name = param2;
         _loc4_.mouseEnabled = false;
         var _loc5_:Bitmap = new Bitmap(param3);
         _loc4_.addChild(_loc5_);
         param1.addChild(_loc4_);
         return _loc4_;
      }
      
      public function setSelectedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.selectedObject = param3;
            if(param3 != null)
            {
               _loc4_.placedObject = null;
            }
         }
      }
      
      public function getRoomImage(param1:String, param2:String, param3:String, param4:int, param5:IGetImageListener, param6:String = null) : ImageResult
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         var _loc7_:String = const_515;
         var _loc8_:String = param1 + "\n" + param2 + "\n" + param3;
         return getGenericRoomObjectImage(_loc7_,_loc8_,new Vector3d(),param4,param5,param6);
      }
      
      public function getWallItemIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return getWallItemImage(param1,new Vector3d(),1,param2,param3);
      }
      
      private function getFurnitureType(param1:int) : String
      {
         if(var_12 != null)
         {
            return var_12.getActiveObjectType(param1);
         }
         return "";
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_381 = param2 as ISessionDataManager;
         var_12.sessionDataManager = var_381;
      }
      
      public function addObjectFurniture(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN, param10:int = -1) : Boolean
      {
         var _loc11_:String = getFurnitureType(param4);
         var _loc12_:int = getFurnitureColorIndex(param4);
         var _loc13_:String = getRoomObjectAdURL(_loc11_);
         if(_loc11_ == null)
         {
            _loc11_ = "";
         }
         var _loc14_:IRoomObjectController = createObjectFurniture(param1,param2,param3,_loc11_);
         if(_loc14_ == null)
         {
            return false;
         }
         if(_loc14_ != null && _loc14_.getModelController() != null)
         {
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_239,_loc12_,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_323,param4,true);
            _loc14_.getModelController().setString(RoomObjectVariableEnum.const_330,_loc13_,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_847,1,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_891,param10);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_835,getTimer());
         }
         if(!updateObjectFurniture(param1,param2,param3,param5,param6,param7,param8,param9))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_288,param1,param2,param3,RoomObjectCategoryEnum.const_34));
         }
         var _loc15_:ISelectedRoomObjectData = getPlacedObjectData(param1,param2);
         if(_loc15_ && Math.abs(_loc15_.id) == param3 && _loc15_.category == RoomObjectCategoryEnum.const_34)
         {
            selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_34);
         }
         return true;
      }
      
      public function initializeRoom(param1:int, param2:int, param3:XML) : void
      {
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:* = null;
         var _loc6_:String = "111";
         var _loc7_:String = "201";
         var _loc8_:String = "1";
         if(!var_481)
         {
            _loc5_ = var_304.remove(_loc4_);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.floorType;
               _loc7_ = _loc5_.wallType;
               _loc8_ = _loc5_.landscapeType;
            }
            _loc5_ = new RoomData(param1,param2,param3);
            _loc5_.floorType = _loc6_;
            _loc5_.wallType = _loc7_;
            _loc5_.landscapeType = _loc8_;
            var_304.add(_loc4_,_loc5_);
            Logger.log("Room Engine not initilized yet, can not create room. Room data stored for later initialization.");
            return;
         }
         if(param3 == null)
         {
            Logger.log("Room property messages received before floor height map, will initialize when floor height map received.");
            return;
         }
         _loc5_ = var_304.remove(_loc4_);
         if(_loc5_ != null)
         {
            if(_loc5_.floorType != null && _loc5_.floorType.length > 0)
            {
               _loc6_ = _loc5_.floorType;
            }
            if(_loc5_.wallType != null && _loc5_.wallType.length > 0)
            {
               _loc7_ = _loc5_.wallType;
            }
            if(_loc5_.landscapeType != null && _loc5_.landscapeType.length > 0)
            {
               _loc8_ = _loc5_.landscapeType;
            }
         }
         var _loc9_:IRoomInstance = createRoom(_loc4_,param3,_loc6_,_loc7_,_loc8_,getWorldType(param1,param2));
         if(_loc9_ == null)
         {
            return;
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_638,param1,param2));
      }
      
      private function initializeRoomManager() : void
      {
         if(var_26 == null || var_468 == null || var_41 == null || var_699 == null || _communication == null || _habboConfiguration == null || !var_1752)
         {
            return;
         }
         var_41.initialize(<nothing/>,this);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _habboConfiguration = param2 as IHabboConfigurationManager;
         (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onHabboConfigurationInit);
      }
      
      public function getObjectRoom(param1:int, param2:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),const_299,RoomObjectCategoryEnum.const_69);
      }
      
      public function addObjectFurnitureByName(param1:int, param2:int, param3:int, param4:String, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN) : Boolean
      {
         var _loc13_:* = null;
         var _loc10_:String = getWorldType(param1,param2);
         if(isPublicRoomWorldType(_loc10_) && var_12 != null)
         {
            _loc13_ = var_12.getPublicRoomContentType(_loc10_) + "_";
            param4 = _loc13_ + param4;
         }
         var _loc11_:IRoomObjectController = createObjectFurniture(param1,param2,param3,param4);
         if(_loc11_ == null)
         {
            return false;
         }
         if(!updateObjectFurniture(param1,param2,param3,param5,param6,param7,param8,param9))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_288,param1,param2,param3,RoomObjectCategoryEnum.const_34));
         }
         var _loc12_:ISelectedRoomObjectData = getPlacedObjectData(param1,param2);
         if(_loc12_ && Math.abs(_loc12_.id) == param3 && _loc12_.category == RoomObjectCategoryEnum.const_34)
         {
            selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_34);
         }
         return true;
      }
      
      public function updateObjectRoomColor(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc6_ == null || _loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         _loc7_ = new RoomObjectRoomColorUpdateMessage(RoomObjectRoomColorUpdateMessage.const_1416,param3,param4,param5);
         _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         events.dispatchEvent(new RoomEngineRoomColorEvent(param1,param2,param3,param4,param5));
         return true;
      }
      
      public function updateObjectWallItemData(param1:int, param2:int, param3:int, param4:String) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectWallItem(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         var _loc6_:RoomObjectItemDataUpdateMessage = new RoomObjectItemDataUpdateMessage(param4);
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         }
         return true;
      }
      
      public function update(param1:uint) : void
      {
         if(var_41 != null)
         {
            var_41.update(param1);
         }
         updateRoomCameras(param1);
         var _loc2_:IRoomInstance = var_41.getRoom(getRoomIdentifier(var_114,var_115));
         if(_loc2_ != null && _loc2_.getRenderer() != null)
         {
            _loc2_.getRenderer().update(param1);
         }
      }
      
      public function getSelectionArrow(param1:int, param2:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),const_773,RoomObjectCategoryEnum.const_285);
      }
      
      public function setObjectMoverIconSpriteVisible(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:IRoomRenderingCanvas = getRoomCanvas(var_114,var_115,var_1220);
         if(_loc2_ != null)
         {
            _loc3_ = getOverlaySprite(_loc2_);
            _loc4_ = getOverlayIconSprite(_loc3_,const_298);
            if(_loc4_ != null)
            {
               _loc4_.visible = param1;
            }
         }
      }
      
      private function createObjectFurniture(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return createObject(getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      public function removeObjectMoverIconSprite() : void
      {
         var _loc2_:* = null;
         var _loc1_:IRoomRenderingCanvas = getRoomCanvas(var_114,var_115,var_1220);
         if(_loc1_ != null)
         {
            _loc2_ = getOverlaySprite(_loc1_);
            removeOverlayIconSprite(_loc2_,const_298);
         }
      }
      
      public function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function onVisualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_468 = param2 as IRoomObjectVisualizationFactory;
         if(var_12 != null)
         {
            var_12.visualizationFactory = var_468;
         }
         initializeRoomManager();
      }
      
      private function initializeObjectEvents() : void
      {
         if(var_26 != null)
         {
            if(false)
            {
               var_26.events.addEventListener(RoomObjectMouseEvent.const_219,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectMouseEvent.const_498,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectMouseEvent.const_441,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectStateChangeEvent.const_168,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectStateChangeEvent.const_575,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_119,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_116,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.ROOM_OBJECT_WIDGET_REQUEST_STICKIE,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_138,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_127,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_133,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_136,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_96,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectWidgetRequestEvent.const_134,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_429,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_416,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_501,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.ROOM_OBJECT_STICKIE,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_417,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_439,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_415,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_458,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.const_477,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectFurnitureActionEvent.ROOM_OBJECT_JUKEBOX_DISPOSE,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectDimmerStateUpdateEvent.const_63,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectMoveEvent.const_460,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectMoveEvent.const_459,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomAdEvent.const_269,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomAdEvent.const_390,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomAdEvent.const_312,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomAdEvent.const_336,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomActionEvent.const_512,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomActionEvent.const_915,roomObjectEventHandler);
               var_26.events.addEventListener(RoomObjectRoomActionEvent.const_409,roomObjectEventHandler);
               var_26.events.addEventListener(AvatarWalkWarpingWarningEvent.const_414,warningEventHandler);
            }
         }
      }
      
      private function removeOverlayIconSprite(param1:Sprite, param2:String) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  param1.removeChildAt(_loc3_);
                  _loc5_ = _loc4_.getChildAt(0) as Bitmap;
                  if(_loc5_ != null && _loc5_.bitmapData != null)
                  {
                     _loc5_.bitmapData.dispose();
                     _loc5_.bitmapData = null;
                  }
                  return true;
               }
            }
            _loc3_--;
         }
         return false;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function updateObjectUserState(param1:int, param2:int, param3:int, param4:RoomObjectUpdateStateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectUser(param1,param2,param3);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         _loc5_.getEventHandler().processUpdateMessage(param4);
         return true;
      }
      
      private function getWallItemColorIndex(param1:int) : int
      {
         if(var_12 != null)
         {
            return var_12.getWallItemColorIndex(param1);
         }
         return 0;
      }
      
      public function setActiveRoom(param1:int, param2:int) : void
      {
         var_114 = param1;
         var_115 = param2;
      }
      
      public function getRoomObjectCount(param1:int, param2:int, param3:int) : int
      {
         if(!var_481)
         {
            return 0;
         }
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = var_41.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return 0;
         }
         return _loc5_.getObjectCount(param3);
      }
      
      private function warningEventHandler(param1:Event) : void
      {
         events.dispatchEvent(param1);
      }
      
      public function getRoomObjectCategory(param1:String) : int
      {
         if(var_12 != null)
         {
            return var_12.getObjectCategory(param1);
         }
         return RoomObjectCategoryEnum.const_236;
      }
      
      public function initializeRoomObjectInsert(param1:int, param2:int, param3:int, param4:String = null) : Boolean
      {
         var _loc5_:IRoomInstance = getRoom(var_114,var_115);
         if(_loc5_ == null || _loc5_.getNumber(RoomVariableEnum.const_581) != 0)
         {
            return false;
         }
         if(var_66 != null)
         {
            return var_66.initializeRoomObjectInsert(var_114,var_115,param1,param2,param3,param4);
         }
         return false;
      }
      
      public function getPlacedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.placedObject;
         }
         return null;
      }
      
      public function get activeRoomCategory() : int
      {
         return var_115;
      }
      
      public function roomManagerInitialized(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1)
         {
            var_481 = true;
            events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_701,0,0));
            _loc2_ = 0;
            while(_loc2_ < var_304.length)
            {
               _loc3_ = var_304.getWithIndex(_loc2_) as RoomData;
               if(_loc3_ != null)
               {
                  initializeRoom(_loc3_.roomId,_loc3_.roomCategory,_loc3_.data);
               }
               _loc2_++;
            }
         }
      }
      
      public function setOwnUserId(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:RoomCamera = getRoomCamera(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.targetId = param3;
            _loc4_.targetCategory = RoomObjectCategoryEnum.const_38;
         }
      }
      
      public function addObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:Number, param7:int, param8:String = null) : Boolean
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(getObjectUser(param1,param2,param3) != null)
         {
            return false;
         }
         var _loc9_:String = getUserType(param7);
         var _loc10_:IRoomObjectController = createObjectUser(param1,param2,param3,_loc9_);
         if(_loc10_ == null)
         {
            return false;
         }
         if(_loc10_ != null && _loc10_.getEventHandler() != null)
         {
            _loc11_ = new RoomObjectUpdateMessage(param4,param5);
            _loc10_.getEventHandler().processUpdateMessage(_loc11_);
            if(param8 != null)
            {
               _loc12_ = new RoomObjectAvatarFigureUpdateMessage(param8);
               _loc10_.getEventHandler().processUpdateMessage(_loc12_);
            }
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_288,param1,param2,param3,RoomObjectCategoryEnum.const_38));
         }
         return true;
      }
      
      public function disposeObjectUser(param1:int, param2:int, param3:int) : void
      {
         disposeObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_38);
      }
      
      public function updateObjectRoomVisibilities(param1:int, param2:int, param3:Boolean, param4:Boolean = true) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         var _loc6_:* = null;
         _loc6_ = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.const_979,param3);
         _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         _loc6_ = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.const_832,param4);
         _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         return true;
      }
      
      public function isRoomObjectContentAvailable(param1:String) : Boolean
      {
         return var_41.isContentAvailable(param1);
      }
      
      public function getWorldType(param1:int, param2:int) : String
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.worldType;
         }
         return null;
      }
      
      public function updateObjectFurnitureLocation(param1:int, param2:int, param3:int, param4:RoomObjectUpdateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectFurniture(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(param4);
         }
         return true;
      }
      
      private function getObjectFurniture(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_34);
      }
      
      private function getUserType(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "user";
            case 2:
               return "pet";
            case 3:
               return "bot";
            default:
               return null;
         }
      }
      
      public function getRoomObjectImage(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:int, param7:IGetImageListener, param8:uint = 0) : ImageResult
      {
         var _loc11_:* = null;
         var _loc14_:* = null;
         var _loc9_:* = null;
         var _loc10_:String = "";
         var _loc12_:String = getRoomIdentifier(param1,param2);
         var _loc13_:IRoomInstance = var_41.getRoom(_loc12_);
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_.getObject(param3,param4);
            if(_loc14_ != null && _loc14_.getModel() != null)
            {
               _loc9_ = _loc14_.getType();
               switch(param4)
               {
                  case RoomObjectCategoryEnum.const_34:
                  case RoomObjectCategoryEnum.const_32:
                     _loc10_ = String(_loc14_.getModel().getNumber(RoomObjectVariableEnum.const_239));
                     _loc11_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_446);
                     break;
                  case RoomObjectCategoryEnum.const_38:
                     _loc10_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_179);
               }
            }
         }
         return getGenericRoomObjectImage(_loc9_,_loc10_,param5,param6,param7,null,param8,_loc11_);
      }
      
      private function getWallItemType(param1:int, param2:String = null) : String
      {
         if(var_12 != null)
         {
            return var_12.getWallItemType(param1,param2);
         }
         return "";
      }
      
      public function get isInitialized() : Boolean
      {
         return var_481;
      }
      
      private function getObjectWallItem(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_32);
      }
      
      public function updateObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:IVector3d = null, param7:Number = NaN) : Boolean
      {
         var _loc8_:IRoomObjectController = getObjectUser(param1,param2,param3);
         if(_loc8_ == null || _loc8_.getEventHandler() == null || _loc8_.getModel() == null)
         {
            return false;
         }
         if(param4 == null)
         {
            param4 = _loc8_.getLocation();
         }
         if(param6 == null)
         {
            param6 = _loc8_.getDirection();
         }
         if(isNaN(param7))
         {
            param7 = _loc8_.getModel().getNumber(RoomObjectVariableEnum.const_358);
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectAvatarUpdateMessage(param4,param5,param6,param7);
         _loc8_.getEventHandler().processUpdateMessage(_loc9_);
         return true;
      }
      
      public function disposeObjectFurniture(param1:int, param2:int, param3:int) : void
      {
         disposeObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_34);
      }
      
      private function onContentLoaderReady(param1:Event) : void
      {
         if(param1 != null && param1.type == RoomContentLoader.const_745)
         {
            var_1752 = true;
            initializeRoomManager();
         }
      }
      
      public function getRoom(param1:int, param2:int) : IRoomInstance
      {
         if(!var_481)
         {
            return null;
         }
         var _loc3_:String = getRoomIdentifier(param1,param2);
         return var_41.getRoom(_loc3_);
      }
      
      public function addObjectWallItem(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String) : Boolean
      {
         var _loc9_:String = getWallItemType(param4,param8);
         var _loc10_:int = getWallItemColorIndex(param4);
         var _loc11_:String = getRoomObjectAdURL(_loc9_);
         if(_loc9_ == null)
         {
            _loc9_ = "";
         }
         var _loc12_:IRoomObjectController = createObjectWallItem(param1,param2,param3,_loc9_);
         if(_loc12_ == null)
         {
            return false;
         }
         if(_loc12_ != null && _loc12_.getModelController() != null)
         {
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_239,_loc10_,false);
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_323,param4,true);
            _loc12_.getModelController().setString(RoomObjectVariableEnum.const_330,_loc11_,true);
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_1041,1,true);
         }
         if(!updateObjectWallItem(param1,param2,param3,param5,param6,param7,param8))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_288,param1,param2,param3,RoomObjectCategoryEnum.const_32));
         }
         var _loc13_:ISelectedRoomObjectData = getPlacedObjectData(param1,param2);
         if(_loc13_ && _loc13_.id == param3 && _loc13_.category == RoomObjectCategoryEnum.const_32)
         {
            selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_32);
         }
         return true;
      }
      
      public function insertContentLibrary(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         return var_12.insertObjectContent(param1,param2,param3);
      }
      
      private function getRoomCanvasRectangle(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc4_:IRoomRenderingCanvas = getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return new Rectangle(0,0,_loc4_.width,_loc4_.height);
      }
      
      public function updateObjectFurniture(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String, param8:Number = NaN) : Boolean
      {
         var _loc9_:IRoomObjectController = getObjectFurniture(param1,param2,param3);
         if(_loc9_ == null)
         {
            return false;
         }
         var _loc10_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc11_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7,param8);
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().processUpdateMessage(_loc10_);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         return true;
      }
      
      private function getRoomCategory(param1:String) : int
      {
         return 1;
      }
      
      private function createObject(param1:String, param2:int, param3:String, param4:int) : IRoomObjectController
      {
         var _loc5_:IRoomInstance = var_41.getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:* = null;
         return _loc5_.createRoomObject(param2,param3,param4) as IRoomObjectController;
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_278 = param2 as IAdManager;
         var_278.events.addEventListener(AdEvent.const_489,showRoomAd);
      }
      
      private function getOverlaySprite(param1:IRoomRenderingCanvas) : Sprite
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Sprite = param1.displayObject as Sprite;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getChildByName(const_772) as Sprite;
      }
      
      public function selectAvatar(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(var_66 != null)
         {
            var_66.setSelectedAvatar(param1,param2,param3,param4);
         }
      }
      
      public function updateObjectWallItem(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String) : Boolean
      {
         var _loc8_:IRoomObjectController = getObjectWallItem(param1,param2,param3);
         if(_loc8_ == null)
         {
            return false;
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc10_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7);
         if(_loc8_ != null && _loc8_.getEventHandler() != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc9_);
            _loc8_.getEventHandler().processUpdateMessage(_loc10_);
         }
         updateObjectRoomWindow(param1,param2,param3);
         return true;
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
            if(var_698 != null)
            {
               var_698.connection = param1;
            }
         }
      }
      
      private function getFurnitureColorIndex(param1:int) : int
      {
         if(var_12 != null)
         {
            return var_12.getActiveObjectColorIndex(param1);
         }
         return 0;
      }
      
      public function getFurnitureImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:String = null, param6:uint = 0) : ImageResult
      {
         var _loc7_:* = null;
         var _loc8_:String = "";
         if(var_12 != null)
         {
            _loc7_ = var_12.getActiveObjectType(param1);
            _loc8_ = String(var_12.getActiveObjectColorIndex(param1));
         }
         return getGenericRoomObjectImage(_loc7_,_loc8_,param2,param3,param4,null,param6,param5);
      }
      
      private function initialize() : void
      {
      }
      
      public function getSelectedAvatarId() : int
      {
         if(var_66 != null)
         {
            return var_66.getSelectedAvatarId();
         }
         return -1;
      }
      
      public function getRoomNumberValue(param1:int, param2:int, param3:String) : Number
      {
         var _loc4_:IRoomInstance = getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getNumber(param3);
         }
         return NaN;
      }
      
      public function disposeRoom(param1:int, param2:int) : void
      {
         var _loc3_:String = getRoomIdentifier(param1,param2);
         var_41.disposeRoom(_loc3_);
         var _loc4_:RoomInstanceData = var_305.remove(_loc3_);
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_570,param1,param2));
      }
      
      private function onRendererFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_699 = param2 as IRoomRendererFactory;
         initializeRoomManager();
      }
      
      private function getObjectUser(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_38);
      }
      
      public function getRoomCanvasGeometry(param1:int, param2:int, param3:int) : IRoomGeometry
      {
         var _loc4_:IRoomRenderingCanvas = getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.geometry;
      }
      
      public function getRoomObjectWithIndex(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!var_481)
         {
            return null;
         }
         var _loc5_:String = getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = var_41.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObjectWithIndex(param3,param4);
      }
      
      public function getGenericRoomObjectImage(param1:String, param2:String, param3:IVector3d, param4:int, param5:IGetImageListener, param6:String = null, param7:uint = 0, param8:String = null) : ImageResult
      {
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc9_:ImageResult = new ImageResult();
         _loc9_.id = -1;
         if(!var_481 || param1 == null)
         {
            return _loc9_;
         }
         var _loc10_:IRoomInstance = var_41.getRoom(const_514);
         if(_loc10_ == null)
         {
            _loc10_ = var_41.createRoom(const_514,null);
            if(_loc10_ == null)
            {
               return _loc9_;
            }
         }
         var _loc11_:int = var_589.reserveNumber();
         var _loc12_:int = getRoomObjectCategory(param1);
         if(_loc11_ < 0)
         {
            return _loc9_;
         }
         _loc11_ += 1;
         var _loc13_:IRoomObjectController = _loc10_.createRoomObject(_loc11_,param1,_loc12_) as IRoomObjectController;
         if(_loc13_ == null || _loc13_.getModelController() == null || _loc13_.getEventHandler() == null)
         {
            return _loc9_;
         }
         switch(_loc12_)
         {
            case RoomObjectCategoryEnum.const_34:
            case RoomObjectCategoryEnum.const_32:
               _loc13_.getModelController().setNumber(RoomObjectVariableEnum.const_239,int(param2));
               _loc13_.getModelController().setString(RoomObjectVariableEnum.const_446,param8);
               break;
            case RoomObjectCategoryEnum.const_38:
               _loc13_.getModelController().setString(RoomObjectVariableEnum.const_179,param2);
               break;
            case RoomObjectCategoryEnum.const_69:
               if(param2 != null)
               {
                  _loc17_ = param2.split("\n");
                  if(_loc17_.length >= 3)
                  {
                     _loc18_ = _loc17_[0];
                     _loc19_ = _loc17_[1];
                     _loc20_ = _loc17_[2];
                     _loc21_ = new RoomPlaneParser();
                     _loc21_.addPlane(RoomPlaneData.const_167,new Vector3d(0,0,0),new Vector3d(10,0,0),new Vector3d(0,10,0));
                     _loc21_.addPlane(RoomPlaneData.const_150,new Vector3d(0,0,0),new Vector3d(0,10,0),new Vector3d(0,0,10));
                     _loc21_.addPlane(RoomPlaneData.const_150,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
                     _loc21_.addPlane(RoomPlaneData.const_255,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
                     _loc22_ = _loc21_.getXML();
                     _loc13_.getEventHandler().initialize(_loc22_);
                     _loc13_.getModelController().setString(RoomObjectVariableEnum.const_708,_loc18_);
                     _loc13_.getModelController().setString(RoomObjectVariableEnum.const_632,_loc19_);
                     _loc13_.getModelController().setString(RoomObjectVariableEnum.const_557,_loc20_);
                     if(param6 != null)
                     {
                        _loc23_ = null;
                        _loc24_ = "undefined_" + _loc11_;
                        _loc23_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_483,_loc24_,param6,new Vector3d(2,0,1.75));
                        _loc13_.getEventHandler().processUpdateMessage(_loc23_);
                     }
                  }
               }
         }
         _loc13_.setDirection(param3);
         var _loc14_:* = null;
         _loc14_ = _loc13_.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc14_ == null)
         {
            _loc10_.disposeObject(_loc11_,_loc12_);
            return _loc9_;
         }
         var _loc15_:RoomGeometry = new RoomGeometry(param4,new Vector3d(-135,30,0),new Vector3d(11,11,5));
         _loc14_.update(_loc15_);
         var _loc16_:BitmapData = _loc14_.getImage(param7);
         _loc9_.data = _loc16_;
         _loc9_.id = _loc11_;
         if(!isRoomObjectContentAvailable(param1) && param5 != null)
         {
            var_1024.add(String(_loc11_),param5);
            _loc13_.getModelController().setNumber(RoomObjectVariableEnum.const_1019,param4,true);
         }
         else
         {
            _loc10_.disposeObject(_loc11_,_loc12_);
            var_589.freeNumber(_loc11_ - 1);
            _loc9_.id = 0;
         }
         _loc15_.dispose();
         return _loc9_;
      }
      
      public function getWallItemImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:String = null, param6:uint = 0) : ImageResult
      {
         var _loc7_:* = null;
         var _loc8_:String = "";
         if(var_12 != null)
         {
            _loc7_ = var_12.getWallItemType(param1,param5);
            _loc8_ = String(var_12.getWallItemColorIndex(param1));
         }
         return getGenericRoomObjectImage(_loc7_,_loc8_,param2,param3,param4);
      }
      
      public function getTileCursor(param1:int, param2:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),const_774,RoomObjectCategoryEnum.const_285);
      }
      
      public function setWorldType(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.worldType = param3;
         }
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _communication = param2 as IHabboCommunicationManager;
         if(_communication != null)
         {
            _connection = _communication.getHabboMainConnection(onConnectionReady);
            if(_connection != null)
            {
               onConnectionReady(_connection);
            }
         }
         initializeRoomManager();
      }
      
      public function handleRoomCanvasMouseEvent(param1:int, param2:int, param3:int, param4:String, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc9_:IRoomRenderingCanvas = getRoomCanvas(var_114,var_115,param1);
         if(_loc9_ != null)
         {
            var_1220 = param1;
            var_1505 = param2;
            var_1506 = param3;
            _loc10_ = getOverlaySprite(_loc9_);
            _loc11_ = getOverlayIconSprite(_loc10_,const_298);
            if(_loc11_ != null)
            {
               _loc12_ = _loc11_.getRect(_loc11_);
               _loc11_.x = var_1505 - _loc12_.width / 2;
               _loc11_.y = var_1506 - _loc12_.height / 2;
            }
            if(!_loc9_.handleMouseEvent(param2,param3,param4,param5,param6,param7,param8))
            {
               _loc13_ = "";
               if(param4 == MouseEvent.CLICK)
               {
                  if(events != null)
                  {
                     events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_496,var_114,var_115,-1,RoomObjectCategoryEnum.const_236));
                  }
                  _loc13_ = "null";
               }
               else if(param4 == MouseEvent.MOUSE_MOVE)
               {
                  _loc13_ = "null";
               }
               else if(param4 == MouseEvent.MOUSE_DOWN)
               {
                  _loc13_ = "null";
               }
               if(var_66 != null)
               {
                  _loc14_ = new RoomObjectMouseEvent(_loc13_,const_299,const_515);
                  var_66.handleRoomObjectEvent(_loc14_,var_114,var_115);
               }
            }
         }
      }
      
      public function isPublicRoom(param1:int, param2:int) : Boolean
      {
         return isPublicRoomWorldType(getWorldType(param1,param2));
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(var_12 != null)
         {
            var_12.setRoomObjectAlias(param1,param2);
         }
      }
      
      public function setObjectMoverIconSprite(param1:int, param2:int, param3:Boolean, param4:String = null) : void
      {
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc6_:* = null;
         if(param3)
         {
            _loc6_ = getRoomObjectImage(var_114,var_115,param1,param2,new Vector3d(),1,null);
         }
         else if(var_12 != null)
         {
            _loc8_ = null;
            _loc9_ = 0;
            if(param2 == RoomObjectCategoryEnum.const_34)
            {
               _loc8_ = var_12.getActiveObjectType(param1);
               _loc9_ = var_12.getActiveObjectColorIndex(param1);
            }
            else if(param2 == RoomObjectCategoryEnum.const_32)
            {
               _loc8_ = var_12.getWallItemType(param1,param4);
               _loc9_ = var_12.getWallItemColorIndex(param1);
            }
            if(param2 == RoomObjectCategoryEnum.const_38)
            {
               _loc6_ = getGenericRoomObjectImage(getUserType(param1),param4,new Vector3d(180),1,null);
            }
            else
            {
               _loc6_ = getGenericRoomObjectImage(_loc8_,String(_loc9_),new Vector3d(),1,null,null,0,param4);
            }
         }
         if(_loc6_ == null || _loc6_.data == null)
         {
            return;
         }
         var _loc7_:IRoomRenderingCanvas = getRoomCanvas(var_114,var_115,var_1220);
         if(_loc7_ != null)
         {
            _loc10_ = getOverlaySprite(_loc7_);
            removeOverlayIconSprite(_loc10_,const_298);
            _loc11_ = addOverlayIconSprite(_loc10_,const_298,_loc6_.data);
            if(_loc11_ != null)
            {
               _loc11_.x = var_1505 - _loc6_.data.width / 2;
               _loc11_.y = var_1506 - _loc6_.data.height / 2;
            }
         }
      }
      
      private function showRoomAd(param1:AdEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_12 != null)
         {
            _loc2_ = getWorldType(param1.roomId,param1.roomCategory);
            var_12.addGraphicAsset(var_12.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_350,param1.image,true);
            var_12.addGraphicAsset(var_12.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_965,param1.adWarningL,true);
            var_12.addGraphicAsset(var_12.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_865,param1.adWarningR,true);
            _loc3_ = getObjectRoom(param1.roomId,param1.roomCategory);
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = null;
            _loc4_ = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.const_857,RoomObjectVariableEnum.const_350,param1.clickUrl);
            _loc3_.getEventHandler().processUpdateMessage(_loc4_);
         }
      }
      
      private function getRoomInstanceData(param1:int, param2:int) : RoomInstanceData
      {
         var _loc3_:String = getRoomIdentifier(param1,param2);
         var _loc4_:RoomInstanceData = var_305.getValue(_loc3_) as RoomInstanceData;
         if(_loc4_ == null)
         {
            _loc4_ = new RoomInstanceData(param1,param2);
            var_305.add(_loc3_,_loc4_);
         }
         return _loc4_;
      }
      
      private function createObjectUser(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return createObject(getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      public function getRoomStringValue(param1:int, param2:int, param3:String) : String
      {
         var _loc4_:IRoomInstance = getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getString(param3);
         }
         return null;
      }
      
      public function getFurnitureIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return getFurnitureImage(param1,new Vector3d(),1,param2,param3);
      }
      
      private function getRoomCamera(param1:int, param2:int) : RoomCamera
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.roomCamera;
         }
         return null;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(var_12 != null)
         {
            return var_12.isPublicRoomWorldType(param1);
         }
         return false;
      }
      
      private function onObjectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_26 = param2 as IRoomObjectFactory;
         initializeObjectEvents();
         initializeRoomManager();
      }
      
      private function onHabboConfigurationInit(param1:Event) : void
      {
         if(var_12 != null)
         {
            _events.addEventListener(RoomContentLoader.const_745,onContentLoaderReady);
            var_12.initialize(_events,_habboConfiguration);
         }
         initializeRoomManager();
      }
      
      public function cancelRoomObjectInsert() : void
      {
         if(var_66 != null)
         {
            var_66.cancelRoomObjectInsert(var_114,var_115);
         }
      }
      
      public function contentLoaded(param1:String, param2:Boolean = false) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc3_:IRoomInstance = var_41.getRoom(const_514);
         if(_loc3_ == null)
         {
            return;
         }
         if(var_12 == null)
         {
            return;
         }
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:int = var_12.getObjectCategory(param1);
         var _loc7_:int = _loc3_.getObjectCount(_loc6_);
         var _loc8_:int = _loc7_ - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = _loc3_.getObjectWithIndex(_loc8_,_loc6_);
            if(_loc9_ != null && _loc9_.getModel() != null && _loc9_.getType() == param1)
            {
               _loc10_ = _loc9_.getId();
               _loc11_ = null;
               _loc12_ = null;
               _loc12_ = _loc9_.getVisualization() as IRoomObjectSpriteVisualization;
               if(_loc12_ != null)
               {
                  _loc14_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_1019);
                  if(_loc4_ != null && _loc5_ != _loc14_)
                  {
                     _loc4_.dispose();
                     _loc4_ = null;
                  }
                  if(_loc4_ == null)
                  {
                     _loc5_ = Number(_loc14_);
                     _loc4_ = new RoomGeometry(_loc14_,new Vector3d(-135,30,0),new Vector3d(11,11,5));
                  }
                  _loc12_.update(_loc4_);
                  _loc11_ = _loc12_.image;
               }
               _loc3_.disposeObject(_loc10_,_loc6_);
               var_589.freeNumber(_loc10_ - 1);
               _loc13_ = var_1024.remove(String(_loc10_)) as IGetImageListener;
               if(_loc13_ != null && _loc11_ != null)
               {
                  _loc13_.imageReady(_loc10_,_loc11_);
               }
               else if(_loc11_ != null)
               {
                  _loc11_.dispose();
               }
            }
            _loc8_--;
         }
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
      }
      
      public function getActiveRoomBoundingRectangle(param1:int) : Rectangle
      {
         return getRoomObjectBoundingRectangle(var_114,var_115,const_299,RoomObjectCategoryEnum.const_69,param1);
      }
      
      private function createRoom(param1:String, param2:XML, param3:String, param4:String, param5:String, param6:String) : IRoomInstance
      {
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         if(!var_481)
         {
            return null;
         }
         var _loc7_:IRoomInstance = var_41.createRoom(param1,param2);
         if(_loc7_ == null)
         {
            return null;
         }
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = 1;
         if(isPublicRoomWorldType(param6))
         {
            _loc12_ = var_12.getPublicRoomContentType(param6);
            _loc9_ = _loc7_.createRoomObject(const_299,_loc12_,_loc8_) as IRoomObjectController;
            _loc9_.getModelController().setString(RoomObjectVariableEnum.const_849,param6,true);
            _loc7_.setNumber(RoomVariableEnum.const_581,1,true);
            _loc13_ = parseInt(_habboConfiguration.getKey("ads.billboard.displayDelayMillis","1000"));
            _loc9_.getModelController().setNumber(RoomVariableEnum.const_947,_loc13_,true);
            if(var_12 != null)
            {
               _loc10_ = Number(var_12.getPublicRoomWorldHeightScale(param6));
            }
         }
         else
         {
            _loc9_ = _loc7_.createRoomObject(const_299,const_515,_loc8_) as IRoomObjectController;
            _loc7_.setNumber(RoomVariableEnum.const_581,0,true);
         }
         _loc7_.setNumber(RoomVariableEnum.const_655,_loc10_,true);
         if(param2 != null)
         {
            _loc14_ = 0;
            if(param2.dimensions.length() == 1)
            {
               _loc15_ = param2.dimensions[0];
               _loc16_ = Number(_loc15_.@minX);
               _loc17_ = Number(_loc15_.@maxX);
               _loc18_ = Number(_loc15_.@minY);
               _loc19_ = Number(_loc15_.@maxY);
               _loc7_.setNumber(RoomVariableEnum.const_533,_loc16_);
               _loc7_.setNumber(RoomVariableEnum.const_763,_loc17_);
               _loc7_.setNumber(RoomVariableEnum.const_620,_loc18_);
               _loc7_.setNumber(RoomVariableEnum.const_605,_loc19_);
               _loc14_ += _loc16_ * 423 + _loc17_ * 671 + _loc18_ * 913 + _loc19_ * 7509;
               if(_loc9_ != null && _loc9_.getModelController() != null)
               {
                  _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_946,_loc14_,true);
               }
            }
         }
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().initialize(param2);
         }
         var _loc11_:* = null;
         if(param3 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_573,param3);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param4 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_736,param4);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param5 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_555,param5);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param2 != null)
         {
            if(param2.doors.door.length() > 0)
            {
               _loc20_ = param2.doors.door;
               _loc21_ = ["x","y","z","dir"];
               _loc22_ = null;
               _loc23_ = 0;
               while(_loc23_ < _loc20_.length())
               {
                  _loc24_ = _loc20_[_loc23_];
                  if(XMLValidator.checkRequiredAttributes(_loc24_,_loc21_))
                  {
                     _loc25_ = Number(_loc24_.@x);
                     _loc26_ = Number(_loc24_.@y);
                     _loc27_ = Number(_loc24_.@z);
                     _loc28_ = Number(_loc24_.@dir);
                     _loc29_ = "null";
                     _loc30_ = "door_" + _loc23_;
                     _loc31_ = new Vector3d(_loc25_,_loc26_,_loc27_);
                     _loc22_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_483,_loc30_,_loc29_,_loc31_,RoomObjectRoomMaskUpdateMessage.const_202);
                     _loc9_.getEventHandler().processUpdateMessage(_loc22_);
                     if(_loc28_ == 90 || _loc28_ == 180)
                     {
                        if(_loc28_ == 90)
                        {
                           _loc7_.setNumber(RoomObjectVariableEnum.const_687,_loc25_ - 0.5,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_609,_loc26_,true);
                        }
                        if(_loc28_ == 180)
                        {
                           _loc7_.setNumber(RoomObjectVariableEnum.const_687,_loc25_,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_609,_loc26_ - 0.5,true);
                        }
                        _loc7_.setNumber(RoomObjectVariableEnum.const_1037,_loc27_,true);
                        _loc7_.setNumber(RoomObjectVariableEnum.const_918,_loc28_,true);
                     }
                  }
                  _loc23_++;
               }
            }
         }
         _loc7_.createRoomObject(const_774,const_1065,RoomObjectCategoryEnum.const_285);
         _loc7_.createRoomObject(const_773,OBJECT_TYPE_SELECTION_ARROW,RoomObjectCategoryEnum.const_285);
         return _loc7_;
      }
      
      public function getRoomObject(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!var_481)
         {
            return null;
         }
         var _loc5_:String = getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = var_41.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObject(param3,param4);
      }
   }
}
