package GameObjects 
{
	import xxx.objects.Entity;
	import xxx.start.XXXStarling;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Ball extends Entity 
	{
		
		public function Ball() 
		{
			super();
			textures = XXXStarling.assetManager.getTextures("basketball");
			centerPivot = true;
		}
		
	}

}