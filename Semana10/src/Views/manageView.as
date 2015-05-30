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
		override public function start():void 
		{
			current = new Game();
			addChild(current);
		}
		
	}

}