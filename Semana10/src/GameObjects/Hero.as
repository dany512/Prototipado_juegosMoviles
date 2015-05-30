package GameObjects 
{
	import nape.dynamics.InteractionGroup;
	import nape.geom.Vec2;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import xxx.input.XXXKeyboard;
	import xxx.Physics.PhysicsEntity;
	import xxx.start.XXXStarling;
	import xxx.time.XXXTime;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Hero extends PhysicsEntity 
	{
		private var elapsed:Number;
		public var onCreateBullet:Function;
		
		public function Hero(_space:Space, _v2Position:Vec2=null) 
		{
			super(_space, _v2Position);
			textures = XXXStarling.assetManager.getTextureAtlas("assets").getTextures("mc_Player_Stand00");
			bodyType = BodyType.DYNAMIC;
			centerPivot = true;
			elapsed = 0;
		}
		override public function init():void 
		{
			super.init();
			body.shapes.add(new Polygon(Polygon.box(50, 50)));
			body.group = new InteractionGroup(true);
			addToSpace();
		}
		override public function update():void 
		{
			super.update();
			if (XXXKeyboard.rightPress)
			{
				scaleX = 1;
				body.position.x +=10;
			}
			if (XXXKeyboard.leftPress)
			{
				scaleX = -1;
				body.position.x -=10;
			}
			elapsed += XXXTime.dt;
			if (XXXKeyboard.upPress)
			{
				if (elapsed >= 0.3)
				{
					onCreateBullet(body.position.x, body.position.y);
					elapsed = 0;
				}
			}
		}
		
	}

}