package 
{
	import Events.NavigationEvents;
	import starling.display.Sprite;
	import starling.events.Event;
	import Views.Menu;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class manageView extends Sprite 
	{
		private var current:Sprite;
		
		public function manageView() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		public function start():void 
		{
			current = new Menu();
			addChild(current);
		}
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(NavigationEvents.CHANGE_VIEW, onChangeView);
		}
		
		private function onChangeView(e:NavigationEvents):void 
		{
				removeChild(current);
				var c:Class = e.view;
				current = new c();
				addChild(current);
		}
		
		
		
	}

}