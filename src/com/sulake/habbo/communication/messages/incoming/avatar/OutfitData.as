package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2155:String;
      
      private var var_616:String;
      
      private var var_1574:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1574 = param1.readInteger();
         var_2155 = param1.readString();
         var_616 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_616;
      }
      
      public function get figureString() : String
      {
         return var_2155;
      }
      
      public function get slotId() : int
      {
         return var_1574;
      }
   }
}
