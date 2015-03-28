package XXXNoScope360HeadShot.Objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class GameObject extends Sprite 
	{
		protected var skin:Sprite;
		protected var velocity:Number;
		protected var AssetClass:Class;
		public function GameObject() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
			
		}
		
		public function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			create();
			init();
			
		}
		
		public function init():void 
		{
			velocity = 4;
		}
		public function create():void 
		{
			
			skin = new AssetClass();
			addChild(skin);
		}
		
		public function update():void {
			
			x += velocity;
			
		}
		
		public function destroy():void
		{
			if (skin != null)
			{
				removeChild(skin);
			}
		}
		
	}

}