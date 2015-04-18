package Views 
{
	import Events.NavigationEvents;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Menu extends Sprite 
	{
		
		public function Menu() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var bg:Image = new Image(Global.assetManager.getTexture("background"));
			addChild(bg);
			var startBtn:Button = new Button(Global.assetManager.getTexture("start_button"));
			addChild(startBtn);
			startBtn.name = "Start";
			startBtn.alignPivot();
			startBtn.x = stage.stageWidth / 2;
			startBtn.y = stage.stageHeight / 2;
			var stopBtn:Button = new Button(Global.assetManager.getTexture("stop_button"));
			addChild(stopBtn);
			stopBtn.name = "intro";
			stopBtn.alignPivot();
			stopBtn.x = stage.stageWidth / 2;
			stopBtn.y = startBtn.y + stopBtn.height;
			stage.addEventListener(Event.TRIGGERED, onTriggered);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			stage.removeEventListener(Event.TRIGGERED, onTriggered);
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		private function onTriggered(e:Event):void 
		{
			var btn:Button = e.target as Button;
			if (btn.name == 'Start')
			{
				dispatchEvent(new NavigationEvents(NavigationEvents.CHANGE_VIEW,Game));
			}
			if (btn.name == 'intro') {
				trace("click_intro");
			}
		}
		
	}

}