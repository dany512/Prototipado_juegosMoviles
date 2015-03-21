package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.Inputs.XXXKeyboard;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	/**
	 * ...
	 * @author Dany
	 */
	public class Hero extends Sprite
	{
		private var skin:Sprite;
		private var vel:Number;
		public function Hero() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class= XXXLoader.getAsset("hero");
			skin = new c();
			addChild(skin);
			vel = 1;
		}
		public function update():void
		{
			if (XXXKeyboard.left_down)
			{
				skin.x -= vel;
				skin.scaleX = -1;
			}
			if (XXXKeyboard.right_down)
			{
				skin.x += vel;
				skin.scaleX = 1;
			}
			
		}
	}

}