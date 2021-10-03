package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_1480:Boolean;
      
      protected var var_2411:Boolean;
      
      protected var var_1483:Boolean;
      
      protected var var_811:String;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2410:String;
      
      protected var var_2412:Boolean;
      
      protected var var_1479:Boolean;
      
      protected var var_1481:Boolean;
      
      protected var var_1482:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return var_2411;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return var_1479;
      }
      
      public function flush() : Boolean
      {
         var_1482 = false;
         var_1481 = false;
         var_811 = "";
         var_1479 = false;
         var_1480 = false;
         var_1483 = false;
         _confPartnerIntegration = false;
         var_2412 = false;
         var_2410 = "";
         var_2411 = false;
         return true;
      }
      
      public function get tracking_header() : String
      {
         return var_2410;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return var_1480;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return var_2412;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return var_1483;
      }
      
      public function get voucher() : Boolean
      {
         return var_1481;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return _confPartnerIntegration;
      }
      
      public function get coppa() : Boolean
      {
         return var_1482;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  var_1482 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  var_1481 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  var_1479 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  var_1480 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  var_1483 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get date() : String
      {
         return var_811;
      }
   }
}
