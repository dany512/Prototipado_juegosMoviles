package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.Inputs.XXXKeyboard;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	import XXXNoScope360HeadShot.Objects.GameObject;
	/**
	 * ...
	 * @author Dany
	 */
	public class Hero extends GameObject
	{
		private var rand:Number;
		private var limitX:Number;
		private var limitY:Number;
		public function Hero() 
		{
			
			
			rand = Math.random();
			AssetClass = XXXLoader.getAsset("hero") as Class;
			super.init();
			
			
		}
		override public function update():void
		{
			if ( rand >= 0.5)
			{
				x += velocity;
			}
			else
			{
				x -= velocity;
			}
			if (x >= limitX )
			{
				x = limitX;
				velocity *= -1;
			}
			if (x < 0)
			{
				x = 0;
				velocity *= -1;
			}
		}
		override public function init():void
		{
			limitX = stage.stageWidth - width;
			limitY = stage.stageHeight - height;
			x = Math.random() * limitX;
			y = Math.random() * limitY;
		}
		
	}

}