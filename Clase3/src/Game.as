package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.Inputs.XXXKeyboard;
	import XXXNoScope360HeadShot.Inputs.XXXMouse;
	/**
	 * ...
	 * @author Dany
	 */
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var enemy:Enemy;
		private var combos:Number;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var bg:sprite = new Sprite();
			bg.graphics.beginFill(0xFFFFFF, 0)
			bg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			bg.graphics.endFill();
			addChild(bg);
			hero = new Hero();
			addChild(hero);
			enemy = new Enemy();
			addChild(enemy);
			XXXKeyboard.init(stage);
			XXXMouse.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			if (XXXMouse.mc != null)
			{
				if (XXXMouse.mc.parent is Hero)
				{
					combos++;
				}
				else
				{
					combos = 0;
				}
			}
			XXXMouse.clear();
			trace(combos);
			hero.update();
			enemy.update();
		}
	}
		
		
		
	

}