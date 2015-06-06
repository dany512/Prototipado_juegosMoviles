package Views 
{
	import GameObjects.Floor;
	import GameObjects.Hero;
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.callbacks.PreCallback;
	import nape.callbacks.PreFlag;
	import nape.callbacks.PreListener;
	import nape.dynamics.CollisionArbiter;
	import nape.dynamics.InteractionGroup;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXKeyboard;
	import xxx.physics.PhysicsWorld;
	import xxx.start.XXXStarling;
	import xxx.time.XXXTime;

	
	/**
	 * ...
	 * @author Luis
	 */
	public class World extends PhysicsWorld 
	{
		private var hero:Hero;
		private var floor:Floor;
		private var elapsed:Number;
		private var wallGroup:CbType;
		private var heroGroup:CbType;
		private var oneWayPlatform:CbType;
		private var interaction:InteractionListener;
		private var preListener:PreListener;
		private var speed:Number = 5;
		
		public function World() 
		{
			super(true);
			gravity = new Vec2(0, 500);
		}
		
		override public function init():void {
			texture = XXXStarling.assetManager.getTexture("back");
			super.init();
			hero = new Hero(space, new Vec2(stage.stageWidth / 2, stage.stageHeight-50));
			addChild(hero);
			XXXKeyboard.init(stage);
			XXXTime.init();
			floor = new Floor(space);
			addChild(floor);
			wallGroup = new CbType();
			heroGroup = new CbType();
			oneWayPlatform = new CbType();
			floor.addCollisionType(wallGroup);
			hero.addCollisionType(heroGroup);
			interaction = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, wallGroup, heroGroup, checkGround);
			space.listeners.add(interaction);
			var platform:Body = new Body(BodyType.KINEMATIC, new Vec2(0, 0));
			platform.shapes.add(new Polygon(Polygon.rect(150, stage.stageHeight - 100, 150, 50)));
			space.bodies.add(platform);
			platform.userData.name = 'platform';
			platform.cbTypes.add(oneWayPlatform);
			
			var platform1:Body = new Body(BodyType.KINEMATIC, new Vec2(0, 0));
			platform1.shapes.add(new Polygon(Polygon.rect(150, stage.stageHeight - 250, 150, 50)));
			space.bodies.add(platform1);
			platform1.userData.name = 'platform';
			platform1.cbTypes.add(oneWayPlatform);
			
			var platform2:Body = new Body(BodyType.KINEMATIC, new Vec2(0, 0));
			platform2.shapes.add(new Polygon(Polygon.rect(370, stage.stageHeight - 300, 150, 50)));
			space.bodies.add(platform2);
			platform2.userData.name = 'platform';
			platform2.cbTypes.add(oneWayPlatform);
			
			var platform3:Body = new Body(BodyType.KINEMATIC, new Vec2(0, 0));
			platform3.shapes.add(new Polygon(Polygon.rect(450, stage.stageHeight - 450, 150, 50)));
			space.bodies.add(platform3);
			platform3.userData.name = 'platform';
			platform3.cbTypes.add(oneWayPlatform);
			
			preListener = new PreListener(InteractionType.COLLISION, oneWayPlatform, heroGroup, checkOneWay);
			space.listeners.add(preListener);
		}
		
		private function checkOneWay(cb:PreCallback):PreFlag 
		{
			var collisionArbiter:CollisionArbiter = cb.arbiter.collisionArbiter;
			
			if (collisionArbiter.normal.y != cb.swapped)
			{
				return PreFlag.IGNORE;
			}
			else
			{
				hero.isJumping = false;
				return PreFlag.ACCEPT;
			}
		}
		
		private function checkGround(e:InteractionCallback):void 
		{
			hero.isJumping = false;
		}
		
		
		
		
		
		override public function loop(e:Event ):void {
			XXXTime.update();
			super.loop(e);
			hero.update();
			for (var i:int = 0; i < space.bodies.length; i++) 
			{
				var obj:Body = space.bodies.at(i);
				if (obj.userData.name == 'platform')
				{
					if (obj.position.x >= stage.stageWidth-150)
					{
						speed = -5;
					}
					if (obj.position.x <=-150)
					{
						speed = 5;
					}obj.position.x += speed
				}
			}
		}
		
	}

}