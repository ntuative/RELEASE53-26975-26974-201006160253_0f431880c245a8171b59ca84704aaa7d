package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1146:Array;
      
      private var var_2227:Boolean;
      
      private var var_1145:Array;
      
      private var var_2224:Boolean;
      
      private var var_2226:Boolean;
      
      private var var_2223:Boolean;
      
      private var var_156:Array;
      
      private var var_2230:Boolean;
      
      private var var_2229:Boolean;
      
      private var var_970:Array;
      
      private var var_2228:Boolean;
      
      private var var_2225:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_156 = [];
         var_1145 = [];
         var_1146 = [];
         var_970 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_156.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1145.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_970.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2230 = param1.readBoolean();
         var_2223 = param1.readBoolean();
         var_2224 = param1.readBoolean();
         var_2226 = param1.readBoolean();
         var_2225 = param1.readBoolean();
         var_2229 = param1.readBoolean();
         var_2227 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1146.push(param1.readString());
            _loc4_++;
         }
         var_2228 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_2225;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1145;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2224;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2227;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2230;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1145 = null;
         var_1146 = null;
         var_156 = null;
         for each(_loc1_ in var_970)
         {
            _loc1_.dispose();
         }
         var_970 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1146;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2229;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2226;
      }
      
      public function get offenceCategories() : Array
      {
         return var_970;
      }
      
      public function get issues() : Array
      {
         return var_156;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2228;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2223;
      }
   }
}
