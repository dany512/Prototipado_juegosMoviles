package 
{
	import citrus.core.State;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Game extends State 
	{
		private var hero:GameHero;
		
		public function Game() 
		{
			super();
		}
		
		override public function initialize():void 
		{
			super.initialize();
			var box2D:Box2D = new Box2D('box2D');
			box2D.visible = true;
			add(box2D);
			initPlatforms();
		}
		
		private function initPlatforms():void 
		{
			var wallLeft:Platform = new Platform('wallLeft', { x:25, y:stage.stageHeight/2, width:50, height:stage.stageHeight});
			add(wallLeft);
			var wallRight:Platform = new Platform('wallRight', { x:stage.stageWidth-25, y:stage.stageHeight/2, width:50, height:stage.stageHeight});
			add(wallRight);
			var Floor:Platform = new Platform('Floor', { x:stage.stageWidth/2, y:stage.stageHeight-25, width:stage.stageWidth, height:50});
			add(Floor);
			hero = new GameHero('hero', { x:50, y:50, width:50, height:50 } );
			add(hero);
			var coin:coinGame = new coinGame('coin', { x:stage.stageWidth / 2 - 80, y:stage.stageHeight - 80, height:40 } );
			add(coin);
			var enemy:Enemy = new Enemy('enemy', { x:300, y:400, width:40, height:40} );
			add(enemy);
			var movingPlatform:MovingPlatform = new MovingPlatform('movingPlatform', { x:300, y:500, width:250, height:50, endX:300, endY:200 } )
			add(movingPlatform);
			movingPlatform.oneWay = true;
		}
		
	}

}