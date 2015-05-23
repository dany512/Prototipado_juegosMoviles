package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import xxx.start.XXXStarling;
	import Views.manageView;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/back.png");
			assets.push("assets/basketball.png");
			XXXStarling.init(stage, Views.manageView, assets, goGame);
		}
		
		private function goGame(game:Object):void 
		{
			game.init();
		}
		
	}
	
}