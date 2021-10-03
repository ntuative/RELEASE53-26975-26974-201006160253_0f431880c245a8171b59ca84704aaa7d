package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_625:int = 6;
      
      public static const const_227:int = 5;
      
      public static const const_673:int = 2;
      
      public static const const_304:int = 9;
      
      public static const const_316:int = 4;
      
      public static const const_297:int = 2;
      
      public static const const_596:int = 4;
      
      public static const const_205:int = 8;
      
      public static const const_711:int = 7;
      
      public static const const_251:int = 3;
      
      public static const const_344:int = 1;
      
      public static const const_218:int = 5;
      
      public static const const_504:int = 12;
      
      public static const const_356:int = 1;
      
      public static const const_643:int = 11;
      
      public static const const_639:int = 3;
      
      public static const const_1622:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_429:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_429 = new Array();
         var_429.push(new Tab(_navigator,const_344,const_504,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_407));
         var_429.push(new Tab(_navigator,const_297,const_356,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_407));
         var_429.push(new Tab(_navigator,const_316,const_643,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_955));
         var_429.push(new Tab(_navigator,const_251,const_227,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_407));
         var_429.push(new Tab(_navigator,const_218,const_205,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_750));
         setSelectedTab(const_344);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_429)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_429)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_429)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_316;
      }
      
      public function get tabs() : Array
      {
         return var_429;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
