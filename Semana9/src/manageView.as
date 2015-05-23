package 
{
	import GameObjects.Hero;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class manageView extends Sprite 
	{
		private var hero:Hero;
		
		public function manageView() 
		{
			super();
			
		}
		public function start():void
		{
			hero = new Hero();
			addChild(hero);
			XXXKeyboard.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
		}
	}

}