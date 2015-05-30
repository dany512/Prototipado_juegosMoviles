package GameObjects 
{
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.space.Space;
	import xxx.objects.Entity;
	import xxx.Physics.PhysicsEntity;
	import xxx.start.XXXStarling;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Ball extends PhysicsEntity 
	{
		
		public function Ball(_space:Space, _v2position:Vec2 = null) 
		{
			super(_space,_v2position);
			textures = XXXStarling.assetManager.getTextures("basketball");
			centerPivot = true;
			bodyType = BodyType.DYNAMIC;
		}
		override public function init():void 
		{
			super.init();
			body.shapes.add(new Circle(50, null, new Material(20)));
			addToSpace();
			body.velocity.y = -500;
		}
		
	}

}