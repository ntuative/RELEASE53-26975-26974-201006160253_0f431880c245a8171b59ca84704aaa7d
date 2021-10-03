package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_728:String = "Rectangle";
      
      public static const const_62:String = "Boolean";
      
      public static const const_720:String = "Number";
      
      public static const const_67:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_550:String = "Point";
      
      public static const const_1007:String = "Array";
      
      public static const const_923:String = "uint";
      
      public static const const_476:String = "hex";
      
      public static const const_1004:String = "Map";
       
      
      private var var_626:String;
      
      private var var_176:Object;
      
      private var var_2456:Boolean;
      
      private var _type:String;
      
      private var var_2046:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_626 = param1;
         var_176 = param2;
         _type = param3;
         var_2046 = param4;
         var_2456 = param3 == const_1004 || param3 == const_1007 || param3 == const_550 || param3 == const_728;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_476:
               return "0x" + uint(var_176).toString(16);
            case const_62:
               return Boolean(var_176) == true ? "true" : "false";
            case const_550:
               return "Point(" + Point(var_176).x + ", " + Point(var_176).y + ")";
            case const_728:
               return "Rectangle(" + Rectangle(var_176).x + ", " + Rectangle(var_176).y + ", " + Rectangle(var_176).width + ", " + Rectangle(var_176).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_1004:
               _loc3_ = var_176 as Map;
               _loc1_ = "<var key=\"" + var_626 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_1007:
               _loc4_ = var_176 as Array;
               _loc1_ = "<var key=\"" + var_626 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_550:
               _loc5_ = var_176 as Point;
               _loc1_ = "<var key=\"" + var_626 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_67 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_67 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_728:
               _loc6_ = var_176 as Rectangle;
               _loc1_ = "<var key=\"" + var_626 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_67 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_67 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_67 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_67 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_476:
               _loc1_ = "<var key=\"" + var_626 + "\" value=\"" + "0x" + uint(var_176).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_626 + "\" value=\"" + var_176 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_176;
      }
      
      public function get valid() : Boolean
      {
         return var_2046;
      }
      
      public function get key() : String
      {
         return var_626;
      }
   }
}
