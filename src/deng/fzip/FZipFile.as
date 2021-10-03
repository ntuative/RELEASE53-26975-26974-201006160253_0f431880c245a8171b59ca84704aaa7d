package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.events.EventDispatcher;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_654:int = 8;
      
      public static const const_1657:int = 10;
      
      public static const const_1215:int = 6;
      
      private static var var_1168:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1214:int = 0;
      
      public static const const_1601:int = 1;
      
      public static const const_1595:int = 2;
      
      public static const const_1568:int = 3;
      
      public static const const_1556:int = 4;
      
      public static const const_1620:int = 5;
      
      public static const const_1683:int = 9;
      
      public static const const_1548:int = 7;
       
      
      private var var_186:uint = 0;
      
      private var var_1167:uint = 0;
      
      private var var_811:Date;
      
      private var var_2320:int = -1;
      
      private var var_97:Function;
      
      private var var_559:Boolean = false;
      
      private var _eventDispatcher:EventDispatcher;
      
      private var var_2473:int = -1;
      
      private var var_1436:uint = 0;
      
      private var var_2321:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_980:uint;
      
      private var var_20:ByteArray;
      
      private var var_810:uint;
      
      private var var_1685:Boolean = false;
      
      private var var_2474:int = -1;
      
      private var var_1683:String = "2.0";
      
      private var var_187:Boolean = false;
      
      private var var_2322:Boolean = false;
      
      private var var_387:String;
      
      private var var_670:uint = 0;
      
      private var var_1437:int = 0;
      
      private var var_463:String = "";
      
      private var var_809:int = 8;
      
      private var var_1684:Boolean = false;
      
      public function FZipFile(param1:EventDispatcher, param2:String = "utf-8")
      {
         var_97 = parseFileHead;
         super();
         var_387 = param2;
         _eventDispatcher = param1;
         _extraFields = new Dictionary();
         var_20 = new ByteArray();
         var_20.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_670;
      }
      
      public function set filename(param1:String) : void
      {
         var_463 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_187 && false)
         {
            var_20.position = 0;
            if(var_1168)
            {
               var_20.uncompress.apply(var_20,["deflate"]);
            }
            else
            {
               var_20.uncompress();
            }
            var_20.position = 0;
            var_187 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_463;
      }
      
      public function get date() : Date
      {
         return var_811;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && var_97(param1))
         {
         }
         return var_97 === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1684)
         {
            var_97 = parseFileIdle;
            _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_124,"Data descriptors are not supported."));
            return false;
         }
         if(var_186 == 0)
         {
            var_97 = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_186)
            {
               return false;
            }
            parseContent(param1);
            var_97 = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1683;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_187)
         {
            uncompress();
         }
         var_20.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_20.readUTFBytes(var_20.bytesAvailable);
         }
         else
         {
            _loc3_ = var_20.readMultiByte(var_20.bytesAvailable,param2);
         }
         var_20.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_809 === const_654 && !var_1685)
         {
            if(var_1168)
            {
               param1.readBytes(var_20,0,var_186);
            }
            else
            {
               if(!var_559)
               {
                  _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_124,"Adler32 checksum not found."));
                  return;
               }
               var_20.writeByte(120);
               _loc2_ = uint(~var_2320 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_20.writeByte(_loc2_);
               param1.readBytes(var_20,2,var_186);
               var_20.position = var_20.length;
               var_20.writeUnsignedInt(var_980);
            }
            var_187 = true;
         }
         else
         {
            if(var_809 != const_1214)
            {
               _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_124,"Compression method " + var_809 + " is not supported."));
               return;
            }
            param1.readBytes(var_20,0,var_186);
            var_187 = false;
         }
         var_20.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1167 + var_1436 > 0)
            {
               var_97 = parseFileHeadExt;
            }
            else
            {
               var_97 = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_20.length = 0;
         var_20.position = 0;
         var_187 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_20.writeUTFBytes(param1);
            }
            else
            {
               var_20.writeMultiByte(param1,param2);
            }
            var_810 = ChecksumUtil.CRC32(var_20);
            var_559 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_811 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1437 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1437 << 8 | 20);
         param1.writeShort(var_387 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_654);
         var _loc5_:Date = var_811 != null ? var_811 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_810);
         param1.writeUnsignedInt(var_186);
         param1.writeUnsignedInt(var_670);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_387 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_463);
         }
         else
         {
            _loc8_.writeMultiByte(var_463,var_387);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_559)
            {
               _loc16_ = var_187;
               if(_loc16_)
               {
                  uncompress();
               }
               var_980 = ChecksumUtil.Adler32(var_20,0,var_20.length);
               var_559 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_980);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_387 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2321);
            }
            else
            {
               _loc8_.writeMultiByte(var_2321,var_387);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_186 > 0)
         {
            if(var_1168)
            {
               _loc13_ = 0;
               param1.writeBytes(var_20,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_20,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_186;
      }
      
      protected function compress() : void
      {
         if(!var_187)
         {
            if(false)
            {
               var_20.position = 0;
               var_670 = var_20.length;
               if(var_1168)
               {
                  var_20.compress.apply(var_20,["deflate"]);
                  var_186 = var_20.length;
               }
               else
               {
                  var_20.compress();
                  var_186 = -6;
               }
               var_20.position = 0;
               var_187 = true;
            }
            else
            {
               var_186 = 0;
               var_670 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1167 + var_1436)
         {
            parseHeadExt(param1);
            var_97 = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_387 == "utf-8")
         {
            var_463 = param1.readUTFBytes(var_1167);
         }
         else
         {
            var_463 = param1.readMultiByte(var_1167,var_387);
         }
         var _loc2_:uint = var_1436;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_124,"Parse error in file " + var_463 + ": Extra field data size too big."));
               return;
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_980 = param1.readUnsignedInt();
               var_559 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1437 = _loc2_ >> 8;
         var_1683 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_809 = param1.readUnsignedShort();
         var_1685 = (_loc3_ & 1) !== 0;
         var_1684 = (_loc3_ & 8) !== 0;
         var_2322 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_387 = "utf-8";
         }
         if(var_809 === const_1215)
         {
            var_2474 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2473 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_809 === const_654)
         {
            var_2320 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_811 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_810 = param1.readUnsignedInt();
         var_186 = param1.readUnsignedInt();
         var_670 = param1.readUnsignedInt();
         var_1167 = param1.readUnsignedShort();
         var_1436 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_20,0,param1.length);
            var_810 = ChecksumUtil.CRC32(var_20);
            var_559 = false;
         }
         else
         {
            var_20.length = 0;
            var_20.position = 0;
            var_187 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_463 + "\n  date:" + var_811 + "\n  sizeCompressed:" + var_186 + "\n  sizeUncompressed:" + var_670 + "\n  versionHost:" + var_1437 + "\n  versionNumber:" + var_1683 + "\n  compressionMethod:" + var_809 + "\n  encrypted:" + var_1685 + "\n  hasDataDescriptor:" + var_1684 + "\n  hasCompressedPatchedData:" + var_2322 + "\n  filenameEncoding:" + var_387 + "\n  crc32:" + var_810.toString(16) + "\n  adler32:" + var_980.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_187)
         {
            uncompress();
         }
         return var_20;
      }
   }
}
