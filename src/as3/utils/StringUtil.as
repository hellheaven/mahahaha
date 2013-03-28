package as3.utils
{
	public class StringUtil
	{
		/**
		 * HTML转义, entity to character
		 * @example convert (&amp;) to (") no include brackets
		 * @example convert (&#39;) to (') no include brackets
		 */
		public static function decodeURIComponent( str:String ):String
		{
			var txt:TextField = new TextField;
			txt.htmlText = decodeURIComponent(str);
			return txt.text;
		}
		
		/**
		 * 判断给定字符串是否为空
		 * 
		 * @param	str
		 * @return
		 */
		public static function isWhite( str:String ):Boolean
		{
			var reg:RegExp = /^\s*$/m;
			return reg.test(str);
		}
		/**
		 * 判断给定字符串是否为Email格式
		 * 
		 * @param	str
		 * @return
		 */
		 //是否是数值字符串;  
        public static function isNumber(char:String):Boolean{  
            if(char == null){  
                return false;  
            }  
            return !isNaN(Number(char));  
        } 
         //是否为Double型数据;  
        public static function isDouble(char:String):Boolean{  
            char = trim(char);  
            var pattern:RegExp = /^[-\+]?\d+(\.\d+)?$/;   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
        //Integer;  
        public static function isInteger(char:String):Boolean{  
            if(char == null){  
                return false;  
            }  
            char = trim(char);  
            var pattern:RegExp = /^[-\+]?\d+$/;   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
        //English;  
        public static function isEnglish(char:String):Boolean{  
            if(char == null){  
                return false;  
            }  
            char = trim(char);  
            var pattern:RegExp = /^[A-Za-z]+$/;   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
        //中文;  
        public static function isChinese(char:String):Boolean{  
            if(char == null){  
                return false;  
            }  
            char = trim(char);  
            var pattern:RegExp = /^[\u0391-\uFFE5]+$/;   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
        //双字节  
        public static function isDoubleChar(char:String):Boolean{  
            if(char == null){  
                return false;  
            }  
            char = trim(char);  
            var pattern:RegExp = /^[^\x00-\xff]+$/;   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
          
        //含有中文字符  
        public static function hasChineseChar(char:String):Boolean{  
            if(char == null){  
                return false;  
            }  
            char = trim(char);  
            var pattern:RegExp = /[^\x00-\xff]/;   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
        //注册字符;  
        public static function hasAccountChar(char:String,len:uint=15):Boolean{  
            if(char == null){  
                return false;  
            }  
            if(len < 10){  
                len = 15;  
            }  
            char = trim(char);  
            var pattern:RegExp = new RegExp("^[a-zA-Z0-9][a-zA-Z0-9_-]{0,"+len+"}$", "");   
            var result:Object = pattern.exec(char);  
            if(result == null) {  
                return false;  
            }  
            return true;  
        }  
       //转换字符编码;  
        public static function encodeCharset(char:String,charset:String):String{  
            var bytes:ByteArray = new ByteArray();  
            bytes.writeUTFBytes(char);  
            bytes.position = 0;  
            return bytes.readMultiByte(bytes.length,charset);  
        }  
          
        //添加新字符到指定位置;         
        public static function addAt(char:String, value:String, position:int):String {  
            if (position > char.length) {  
                position = char.length;  
            }  
            var firstPart:String = char.substring(0, position);  
            var secondPart:String = char.substring(position, char.length);  
            return (firstPart + value + secondPart);  
        }  
          
        //替换指定位置字符;  
        public static function replaceAt(char:String, value:String, beginIndex:int, endIndex:int):String {  
            beginIndex = Math.max(beginIndex, 0);             
            endIndex = Math.min(endIndex, char.length);  
            var firstPart:String = char.substr(0, beginIndex);  
            var secondPart:String = char.substr(endIndex, char.length);  
            return (firstPart + value + secondPart);  
        }  
          
        //删除指定位置字符;  
        public static function removeAt(char:String, beginIndex:int, endIndex:int):String {  
            return StringUtil.replaceAt(char, "", beginIndex, endIndex);  
        }  
          
        //修复双换行符;  
        public static function fixNewlines(char:String):String {  
            return char.replace(/\r\n/gm, "\n");  
        }  
		public static function isEmail( str:String ):Boolean
		{
			var reg:RegExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i;
			return reg.test(str);
		}
		/**
		*去除给定字符串的所有换行符
		**/
		public static function trimLine(str:String):String{
			return str.replace(/\n/g,"");
		}
		/**
		 * 去除给定字符串头尾空白
		 * 
		 * @param	str
		 * @return
		 */
		public static function trim( str:String ):String
		{
			return rtrim(ltrim(str));
		}
		
		/**
		 * 去除给定字符头部空白
		 * 
		 * @param	str
		 * @return
		 */
		public static function ltrim( str:String ):String
		{
			var i:int = 0, ii:int = str.length;
			for(; i < ii; ++i)
			{
				if(str.charCodeAt(i) > 32)
				{
					return str.substr(i);
				}
			}
			return '';
		}
		
		/**
		 * 去除给定字符尾部空白
		 * 
		 * @param	str
		 * @return
		 */
		public static function rtrim( str:String ):String
		{
			var i:int = str.length - 1;
			for (; i > -1; --i)
			{
				if (str.charCodeAt(i) > 32)
				{
					return str.substr(0, i+1);
				}
			}
			return '';
		}
		
		/**
		 * 全角(SBC)和半角(DBC)相互转换，只支持ASCII
		 * 全角空格为12288，半角空格为32
		 * 其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
		 */
		
		/**
		 * 将给定字符串中的半角符号转为全角符号
		 * 
		 * @param	str
		 * @param	alsoSpace 空格是否也需要被转换
		 * @return	
		 * @link	http://hardrock.cnblogs.com/archive/2005/09/27/245255.html
		 */
		public static function toSBC(str:String, alsoSpace:Boolean = true):String
		{
			var a:Array = str.split('');
			var i:int = a.length;
			while (--i > -1)
			{
				var c:uint = str.charCodeAt(i);
				if(32 == c && alsoSpace)
					a[i] = String.fromCharCode(12288);
				else if(c>=33 && c<=126)
					a[i] = String.fromCharCode(c + 65248);
			}
			return a.join('');
		}
		
		/**
		 * 将给定字符串中的全角符号转为半角符号
		 * 
		 * 全角(SBC)和半角(DBC)相互转换，只支持ASCII
		 * 全角空格为12288，半角空格为32
		 * 其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
		 * 
		 * @param	str
		 * @param	alsoSpace 空格是否也需要被转换
		 * @return	
		 * @link	http://hardrock.cnblogs.com/archive/2005/09/27/245255.html
		 */
		public static function toDBC(str:String, alsoSpace:Boolean = true):String
		{
			var a:Array = str.split('');
			var i:int = a.length;
			while (--i > -1)
			{
				var c:uint = str.charCodeAt(i);
				if(12288 == c && alsoSpace)
					a[i] = String.fromCharCode(32);
				else if(c>=65281 && c<=65374)
					a[i] = String.fromCharCode(c-65248);
			}
			return a.join('');
		}

	}
}