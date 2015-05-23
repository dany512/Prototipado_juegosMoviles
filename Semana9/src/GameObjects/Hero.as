package GameObjects 
{
	import flash.utils.setTimeout;
	import xxx.input.XXXKeyboard;
	import xxx.Math.Vector2D;
	import xxx.objects.Entity;
	import xxx.start.XXXStarling;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Hero extends Entity 
	{
		static private const STATE_APPEAR:int = 0;
		static private const STATE_WALK:int = 1;
		static private const STATE_STAND:int = 2;
		static private const STATE_DISAPEAR:int = 3;
		static private const STATE_JUMP:int = 4;
		private var state:int;
		private var isJumping:Boolean;
		private var jumpPower:Number;
		private var gravitiy:Number = 10;
		public function Hero() 
		{
			super();
			textures = XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_Appear000");
			centerPivot = true;
			state = STATE_APPEAR;
		}
		override public function init():void 
		{
			currentState = 'appear';
			addState('appear', XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_Appear000"));
			addState('walk', XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_Walk00"));
			addState('stand', XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_Stand00"));
			addState('disapear', XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_Disappear000"));
			addState('jump_up', XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_JumpUp0000"));
			addState('jump_down', XXXStarling.assetManager.getTextureAtlas("states").getTextures("mc_Ball_JumpDown0000"));
			position = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			
			super.init();
		}
		
		override public function update():void 
		{
			switch (state) 
			{
				case STATE_STAND:
					changeState('stand');
					if (XXXKeyboard.leftPress || XXXKeyboard.rightPress)
					{
						state = STATE_WALK;
					}
					if (XXXKeyboard.upPress)
					{
						if (!isJumping)
						{
							state = STATE_JUMP;
							isJumping = true;
							jumpPower = 30;
						}
					}
				break;
				case STATE_WALK:
					acceleration.x = 0;
					move();
					changeState('walk');
					if (!XXXKeyboard.leftPress || !XXXKeyboard.rightPress)
					{
						state = STATE_STAND;
					}
					if (XXXKeyboard.upPress)
					{
						if (!isJumping)
						{
							state = STATE_JUMP;
							isJumping = true;
							jumpPower = 30;
						}
					}
				break;
				case STATE_JUMP:
					changeState('jump_up')
				break;
				default:
			}
			move();
			super.update();
		}
		
		private function move():void 
		{
			if (XXXKeyboard.leftPress)
			{
				acceleration.x -= 2;
			}
			if (XXXKeyboard.rightPress)
			{
				acceleration.x += 2;
			}
			var floor:int = stage.stageHeight / 2;
			
			if (isJumping)
			{
				
				position.y -= jumpPower;
				jumpPower -= gravitiy;
				if (position.y >= floor) {
					state = STATE_WALK;
					position.y = floor;
					isJumping = false;
				}
				
				
			}
			
			_position = Vector2D.add(position, acceleration);
		}
		override public function onCompleteAnimation():void 
		{
			switch (state) 
			{
				case STATE_APPEAR:
					state = STATE_STAND;
				break;
				default:
			}
		}
	}

}