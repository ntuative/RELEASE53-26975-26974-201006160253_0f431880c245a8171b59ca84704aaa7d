package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1637:int = 5;
      
      public static const const_1577:int = 113;
      
      public static const const_1530:int = 29;
      
      public static const const_1561:int = 0;
      
      public static const const_1546:int = 102;
      
      public static const const_1593:int = 25;
      
      public static const const_1640:int = 20;
      
      public static const const_1540:int = 116;
      
      public static const const_1515:int = 114;
      
      public static const const_1500:int = 101;
      
      public static const const_1696:int = 108;
      
      public static const const_1582:int = 112;
      
      public static const const_1564:int = 100;
      
      public static const const_1600:int = 24;
      
      public static const const_1254:int = 10;
      
      public static const const_1623:int = 111;
      
      public static const const_1543:int = 23;
      
      public static const const_1521:int = 26;
      
      public static const const_1284:int = 2;
      
      public static const const_1633:int = 22;
      
      public static const const_1705:int = 17;
      
      public static const const_1488:int = 18;
      
      public static const const_1668:int = 3;
      
      public static const const_1605:int = 109;
      
      public static const const_1394:int = 1;
      
      public static const const_1697:int = 103;
      
      public static const const_1628:int = 11;
      
      public static const const_1520:int = 28;
      
      public static const const_1647:int = 104;
      
      public static const const_1710:int = 13;
      
      public static const const_1572:int = 107;
      
      public static const const_1583:int = 27;
      
      public static const const_1712:int = 118;
      
      public static const const_1658:int = 115;
      
      public static const const_1656:int = 16;
      
      public static const const_1554:int = 19;
      
      public static const const_1499:int = 4;
      
      public static const const_1527:int = 105;
      
      public static const const_1492:int = 117;
      
      public static const const_1627:int = 119;
      
      public static const const_1681:int = 106;
      
      public static const const_1574:int = 12;
      
      public static const const_1493:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_7 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1394:
            case const_1254:
               return "banned";
            case const_1284:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
