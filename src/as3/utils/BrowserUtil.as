 package as3.utils
{
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	
	public class BrowserUtil
	{
		/**
		 * 仿AS2的getURL。
		 * 指定url的如果以"*"结尾，则新开窗口。优先级高于method
		 * @param	url
     * @param  method
		 */
		public static function getURL( url:String, method:String = "_self" ):void
		{
			if ( '*' == url.substr( -1, 1) )
				navigateToURL( new URLRequest(url.substr(0, -1)), '_blank');
			else
				navigateToURL( new URLRequest(url), method );
		}
		
		/**
		 * 封装了ExternalInterface.call。只在浏览器中有效。
		 * 如果不是浏览器，则无视。
		 * 如果浏览器不支持封装了ExternalInterface，尝试使用getURL("javascript:xxxx")。
		 * 
		 * @param	method
		 * @param	...rest
		 * @return
		 */
		public static function js( method:String, ...rest ):Object
		{
			if( SystemUtil.isBrowser )
			{
				if(ExternalInterface.available){
					return ExternalInterface.call.apply(null, [method].concat(rest));
				}else{
					getURL("javascript:"+method+"(" + rest.join(',') + ");void 0;");
					return null;
				}
			}
			return null;
		}
		
		/**
		 * track by Google Analytics 
		 * @param	code	tracking code
		 * @return
		 */
		public static function trackByGA( code:String ):Boolean
		{
			return js('function(id){'
			+'if(typeof(urchinTracker)!="undefined"){urchinTracker(id); return true;}'
			+'if(typeof(pageTracker)!="undefined"'
			+'&& typeof(pageTracker._trackPageview)!="undefined"){pageTracker._trackPageview(id); return true;}'
			+'return false;'
			+'}', code);
		}
		public static function ShareTo(sns:String,txt:String="",pic:String="",link:String=""):void
		{
			switch(sns)
			{
				case "sina":
				{
					getURL("http://v.t.sina.com.cn/share/share.php?title="+txt+"&pic="+pic+"&url="+link,"_blank");
					break;
				}
				case "renren":
				{
					getURL("http://share.renren.com/share/buttonshare.do?title="+txt+"&images="+pic+"&link="+link,"_blank");
					break;
				}	
				case "kaixin":
				{
					getURL("http://www.kaixin001.com/repaste/share.php?rcontent="+txt+"&rpic="+pic+"&rurl="+link,"_blank");
					break;
				}
				case "qzone":
				{
					getURL("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title="+txt+"&pics="+pic+"&url="+link,"_blank");
					break;
				}
				default:
				{
					break;
				}
			}
		}
		/**
		 * alert
		 * @param	msg
		 */
		public static function alert( msg:String ):void
		{
			js('alert', msg);
		}
	}
}
