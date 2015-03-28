package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.Inputs.XXXKeyboard;
	/**
	 * ...
	 * @author Dany
	 */
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var enemy:Enemy;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			hero = new Hero();
			addChild(hero);
			enemy = new Enemy();
			addChild(enemy);
			//XXXKeyboard.init(stage);
			//
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
			enemy.update();
		}
		
		
		
	}

}