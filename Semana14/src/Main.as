package
{
	import citrus.core.starling.StarlingCitrusEngine;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Main extends StarlingCitrusEngine 
	{
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			state = new Game();
		}
		
	}
	
}