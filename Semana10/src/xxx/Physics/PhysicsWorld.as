package xxx.Physics 
{
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;
	import xxx.views.XXXView;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class PhysicsWorld extends XXXView 
	{
		protected var space:Space;
		protected var debug:Boolean;
		private var bmdebug:BitmapDebug;
		protected var gravity:Vec2;
		protected var frameRate:int = 60;
		public function PhysicsWorld() 
		{
			super();
			bmdebug = new BitmapDebug(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
			Starling.current.nativeOverlay.addChild(bmdebug.display)
		}
		override public function init():void 
		{
			super.init();
			space = new Space(gravity);
			stage.addEventListener(EnterFrameEvent.ENTER_FRAME, loop);
		}
		
		private function loop(e:EnterFrameEvent):void 
		{
			space.step(1 / frameRate);
			if (debug)
			{
				bmdebug.clear();
				bmdebug.draw(space);
				bmdebug.flush();
			}
		}
		override public function destroy():void 
		{
			super.destroy();
			stage.removeEventListener(EnterFrameEvent.ENTER_FRAME, loop);
			for (var i:int = 0; i < sapce.bodies.length; i++) 
			{
				space.bodies.remove(space.bodies[i]);
			}
		}
	}

}