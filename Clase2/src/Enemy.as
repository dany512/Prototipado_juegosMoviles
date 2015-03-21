package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Enemy extends Sprite 
	{
		private var skin:Sprite;
		public function Enemy() 
		{
			super();
				addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class= XXXLoader.getAsset("yoshi");
			skin = new c();
			addChild(skin);
		}
		
	}

}