package 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
	import XXXNoScope360HeadShot.loader.XXXLoader;
	import XXXNoScope360HeadShot.Objects.GameObject;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Enemy extends GameObject 
	{
		private var rand:Number;
		private var limitX:Number;
		private var limitY:Number;
		private var velocityY:Number;
		
		public function Enemy() 
		{
			AssetClass = XXXLoader.getAsset("yoshi") as Class;
			rand = Math.random();
			super.init();
			velocityY = 4;
		}
		override public function init():void
		{
			limitX = stage.stageWidth - width;
			limitY = stage.stageHeight - height;
			x = Math.random() * limitX;
			y = Math.random() * limitY;
		}
		override public function update():void
		{
			if (rand > 0.5) {
				trace(velocity);
				x += velocity;
				y -= velocityY;
			}
			else
			{
				x -= velocity;
				y += velocityY;
				
			}
			if (y >= limitY )
			{
				y = limitY;
				velocityY *= -1;
			}
			if (y < 0)
			{
				y = 0;
				velocityY *= -1;
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
		
	}

}