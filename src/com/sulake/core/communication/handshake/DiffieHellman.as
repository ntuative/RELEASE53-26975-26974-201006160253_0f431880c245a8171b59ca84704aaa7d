package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1271:BigInteger;
      
      private var var_650:BigInteger;
      
      private var var_1543:BigInteger;
      
      private var var_1542:BigInteger;
      
      private var var_1897:BigInteger;
      
      private var var_1896:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1271 = param1;
         var_1543 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1897.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1542 = new BigInteger();
         var_1542.fromRadix(param1,param2);
         var_1897 = var_1542.modPow(var_650,var_1271);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1896.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1271.toString() + ",generator: " + var_1543.toString() + ",secret: " + param1);
         var_650 = new BigInteger();
         var_650.fromRadix(param1,param2);
         var_1896 = var_1543.modPow(var_650,var_1271);
         return true;
      }
   }
}
