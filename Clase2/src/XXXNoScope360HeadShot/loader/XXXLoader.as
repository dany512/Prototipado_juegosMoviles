package XXXNoScope360HeadShot.loader 
{
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	/**
	 * ...
	 * @author ISIL
	 */
	public class XXXLoader 
	{
		static private var loader:Loader;
		static private var _onComplete:Function;
		
		//public function XXXLoader(url:String,on_complete:Function) 
		//{			
			
		//}
		
		static public function load(url:String, on_complete:Function=null):void 
		{
			loader = new Loader();
			_onComplete = on_complete;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			var urlRequest:URLRequest = new URLRequest(url);
			loader.load(urlRequest);
		}
		
		static private function onComplete(e:Event):void 
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			if (_onComplete != null)
			{
				_onComplete();
			}
		}
		
		static public function getAsset(name:String):Class
		{
			var clip:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
			return clip;
		}
		
		
	}

}