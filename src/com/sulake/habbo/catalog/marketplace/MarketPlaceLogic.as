package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceConfigurationMessageComposer;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOffersParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCancelOfferResultParser;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class MarketPlaceLogic implements IMarketPlace
   {
       
      
      public const const_1752:int = 3;
      
      public const const_1514:int = 2;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_2235:int = 0;
      
      private var _visualization:IMarketPlaceVisualization;
      
      private var var_1965:int;
      
      private var _windowManager:IHabboWindowManager;
      
      public const const_1613:int = 1;
      
      private var var_214:Map;
      
      private var var_1878:String = "";
      
      private var var_1966:int = -1;
      
      private var var_2236:MarketplaceItemStats;
      
      private var var_2237:int = -1;
      
      private var _catalog:IHabboCatalog;
      
      private var var_165:Map;
      
      private var var_1967:int;
      
      private var var_1736:int;
      
      private var var_2238:int = 0;
      
      private var var_203:MarketplaceConfirmationDialog;
      
      public function MarketPlaceLogic(param1:IHabboCatalog, param2:IHabboWindowManager, param3:IRoomEngine)
      {
         super();
         _catalog = param1;
         _windowManager = param2;
         _roomEngine = param3;
         getConfiguration();
      }
      
      public function buyOffer(param1:int) : void
      {
         if(!var_165 || !_catalog || !_catalog.getPurse())
         {
            return;
         }
         var _loc2_:MarketPlaceOfferData = var_165.getValue(param1) as MarketPlaceOfferData;
         if(!_loc2_)
         {
            return;
         }
         if(_catalog.getPurse().credits < _loc2_.price)
         {
            _catalog.showNotEnoughCreditsAlert("${catalog.alert.notenough.credits.description}");
            return;
         }
         showConfirmation(const_1613,_loc2_);
      }
      
      public function requestOffers(param1:int, param2:int, param3:String, param4:int) : void
      {
         var_2238 = param1;
         var_2235 = param2;
         var_1878 = param3;
         var_2237 = param4;
         if(_catalog)
         {
            _catalog.getPublicMarketPlaceOffers(param1,param2,param3,param4);
         }
      }
      
      public function requestOwnItems() : void
      {
         _catalog.getOwnMarketPlaceOffers();
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1966;
      }
      
      public function latestOwnOffers() : Map
      {
         return var_214;
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         return _catalog.localization;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function dispose() : void
      {
         _catalog = null;
         _windowManager = null;
         var _loc1_:* = null;
         if(var_165)
         {
            for each(_loc1_ in var_165)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            var_165.dispose();
            var_165 = null;
         }
         if(var_214)
         {
            for each(_loc1_ in var_214)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            var_214.dispose();
            var_214 = null;
         }
      }
      
      public function set averagePricePeriod(param1:int) : void
      {
         var_1966 = param1;
      }
      
      public function set itemStats(param1:MarketplaceItemStats) : void
      {
         if(param1.furniCategoryId != var_1967 || param1.furniTypeId != var_1965)
         {
            return;
         }
         var_2236 = param1;
         if(_visualization)
         {
            _visualization.updateStats();
         }
      }
      
      public function requestOffersByName(param1:String) : void
      {
         _catalog.getPublicMarketPlaceOffers(-1,-1,param1,-1);
      }
      
      public function onCancelResult(param1:IMessageEvent) : void
      {
         var item:MarketPlaceOfferData = null;
         var event:IMessageEvent = param1;
         var cancelEvent:MarketplaceCancelOfferResultEvent = event as MarketplaceCancelOfferResultEvent;
         var parser:MarketplaceCancelOfferResultParser = cancelEvent.getParser() as MarketplaceCancelOfferResultParser;
         if(parser.result == 1)
         {
            item = var_214.remove(parser.offerId);
            if(item != null)
            {
               item.dispose();
            }
            _visualization.listUpdatedNotify();
         }
         else if(parser.result == 0)
         {
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.marketplace.operation_failed.topic}","{{catalog.marketplace.cancel_failed}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      private function getConfiguration() : void
      {
         if(!_catalog || true)
         {
            return;
         }
         _catalog.connection.send(new GetMarketplaceConfigurationMessageComposer());
      }
      
      public function registerVisualization(param1:IMarketPlaceVisualization = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         _visualization = param1;
      }
      
      public function onBuyResult(param1:IMessageEvent) : void
      {
         var item:MarketPlaceOfferData = null;
         var updateItem:MarketPlaceOfferData = null;
         var event:IMessageEvent = param1;
         var buyEvent:MarketplaceBuyOfferResultEvent = event as MarketplaceBuyOfferResultEvent;
         var parser:MarketplaceBuyOfferResultParser = buyEvent.getParser() as MarketplaceBuyOfferResultParser;
         if(parser.result == 1)
         {
            refreshOffers();
         }
         else if(parser.result == 2)
         {
            item = var_165.remove(parser.requestedOfferId);
            if(item != null)
            {
               item.dispose();
            }
            _visualization.listUpdatedNotify();
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.marketplace.not_available_title}","${catalog.marketplace.not_available_header}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
         else if(parser.result == 3)
         {
            updateItem = var_165.getValue(parser.requestedOfferId) as MarketPlaceOfferData;
            if(updateItem)
            {
               updateItem.offerId = parser.offerId;
               updateItem.price = parser.newPrice;
               --updateItem.offerCount;
               var_165.add(parser.offerId,updateItem);
            }
            var_165.remove(parser.requestedOfferId);
            showConfirmation(const_1514,updateItem);
            _visualization.listUpdatedNotify();
         }
         else if(parser.result == 4)
         {
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.alert.notenough.title}","${catalog.alert.notenough.credits.description}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      public function redeemSoldOffers() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = var_214.getKeys();
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = var_214.getValue(_loc2_);
            if(_loc3_.status == MarketPlaceOfferState.const_456)
            {
               var_214.remove(_loc2_);
               _loc3_.dispose();
            }
         }
         _catalog.redeemSoldMarketPlaceOffers();
         _visualization.listUpdatedNotify();
      }
      
      public function onOwnOffers(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:MarketPlaceOwnOffersEvent = param1 as MarketPlaceOwnOffersEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketPlaceOwnOffersParser = _loc2_.getParser() as MarketPlaceOwnOffersParser;
         if(_loc3_ == null)
         {
            return;
         }
         if(var_214)
         {
            for each(_loc5_ in var_214)
            {
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
            }
            var_214.dispose();
         }
         var_1736 = _loc3_.creditsWaiting;
         var_214 = new Map();
         for each(_loc4_ in _loc3_.offers)
         {
            _loc6_ = new MarketPlaceOfferData(_loc4_.offerId,_loc4_.furniId,_loc4_.furniType,_loc4_.stuffData,_loc4_.price,_loc4_.status,_loc4_.averagePrice);
            _loc6_.timeLeftMinutes = _loc4_.timeLeftMinutes;
            var_214.add(_loc4_.offerId,_loc6_);
         }
         if(_visualization == null)
         {
            return;
         }
         _visualization.listUpdatedNotify();
      }
      
      public function requestOffersByPrice(param1:int) : void
      {
         _catalog.getPublicMarketPlaceOffers(param1,-1,"",-1);
      }
      
      private function showConfirmation(param1:int, param2:MarketPlaceOfferData) : void
      {
         if(!var_203)
         {
            var_203 = new MarketplaceConfirmationDialog(this,_catalog,_roomEngine);
         }
         var_203.showConfirmation(param1,param2);
      }
      
      public function onOffers(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:MarketPlaceOffersEvent = param1 as MarketPlaceOffersEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketPlaceOffersParser = _loc2_.getParser() as MarketPlaceOffersParser;
         if(_loc3_ == null)
         {
            return;
         }
         if(var_165)
         {
            for each(_loc5_ in var_165)
            {
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
            }
            var_165.dispose();
         }
         var_165 = new Map();
         for each(_loc4_ in _loc3_.offers)
         {
            _loc6_ = new MarketPlaceOfferData(_loc4_.offerId,_loc4_.furniId,_loc4_.furniType,_loc4_.stuffData,_loc4_.price,_loc4_.status,_loc4_.averagePrice,_loc4_.offerCount);
            _loc6_.timeLeftMinutes = _loc4_.timeLeftMinutes;
            var_165.add(_loc4_.offerId,_loc6_);
         }
         if(_visualization == null)
         {
            return;
         }
         _visualization.listUpdatedNotify();
      }
      
      public function get itemStats() : MarketplaceItemStats
      {
         return var_2236;
      }
      
      public function refreshOffers() : void
      {
         requestOffers(var_2238,var_2235,var_1878,var_2237);
      }
      
      public function get creditsWaiting() : int
      {
         return var_1736;
      }
      
      public function redeemExpiredOffer(param1:int) : void
      {
         _catalog.redeemExpiredMarketPlaceOffer(param1);
      }
      
      public function requestItemStats(param1:int, param2:int) : void
      {
         if(_catalog)
         {
            var_1965 = param2;
            var_1967 = param1;
            _catalog.getMarketplaceItemStats(param1,param2);
         }
      }
      
      public function latestOffers() : Map
      {
         return var_165;
      }
   }
}
