package xxx.Manager 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.events.NavigationEvent;
	import xxx.views.XXXView;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class ScreenManager extends Sprite 
	{
		protected var current:XXXView;
		protected var old:XXXView;
		public function ScreenManager() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
		}
		public function start():void 
		{
		}
		public function onChangeView(e:NavigationEvent):void 
		{
			
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			removeEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
			destroy();
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}