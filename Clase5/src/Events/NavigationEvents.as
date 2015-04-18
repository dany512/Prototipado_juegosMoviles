package Events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class NavigationEvents extends Event 
	{
		public static const CHANGE_VIEW:String = 'changeView';
		public var view:Class;
		public function NavigationEvents(type:String, _view:Class,bubbles:Boolean=true, data:Object=null) 
		{
			super(type, bubbles, data);
			view = _view;
			
		}
		
	}

}