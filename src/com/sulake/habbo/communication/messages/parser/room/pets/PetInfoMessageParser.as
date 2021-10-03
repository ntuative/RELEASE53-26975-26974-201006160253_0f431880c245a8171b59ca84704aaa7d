package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1796:int;
      
      private var var_415:String;
      
      private var var_1794:int;
      
      private var var_1918:int;
      
      private var var_1735:int;
      
      private var var_2280:int;
      
      private var _nutrition:int;
      
      private var var_1368:int;
      
      private var var_2279:int;
      
      private var var_2277:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1789:int;
      
      private var var_2278:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1794;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2280;
      }
      
      public function flush() : Boolean
      {
         var_1368 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2279;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2277;
      }
      
      public function get maxNutrition() : int
      {
         return var_2278;
      }
      
      public function get figure() : String
      {
         return var_415;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1918;
      }
      
      public function get petId() : int
      {
         return var_1368;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1368 = param1.readInteger();
         _name = param1.readString();
         var_1794 = param1.readInteger();
         var_2279 = param1.readInteger();
         var_1735 = param1.readInteger();
         var_2277 = param1.readInteger();
         _energy = param1.readInteger();
         var_2280 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2278 = param1.readInteger();
         var_415 = param1.readString();
         var_1918 = param1.readInteger();
         var_1789 = param1.readInteger();
         var_1796 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1735;
      }
      
      public function get ownerId() : int
      {
         return var_1789;
      }
      
      public function get age() : int
      {
         return var_1796;
      }
   }
}
