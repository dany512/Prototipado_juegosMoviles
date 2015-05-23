package Views 
{
	import xxx.Manager.ScreenManager;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class manageView extends ScreenManager 
	{
		
		public function manageView() 
		{
			super();
			
		}
		override public function init():void 
		{
			current = new Game();
			addChild(current);
		}
		
	}

}