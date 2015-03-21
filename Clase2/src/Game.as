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
			hero.x = hero.width / 2;
			hero.y = hero.height / 2;
			enemy = new Enemy();
			addChild(enemy);
			enemy.x = stage.stageWidth - enemy.width / 2;
			enemy.y = enemy.height / 2;
			XXXKeyboard.init(stage);
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
		}
		
		
		
	}

}