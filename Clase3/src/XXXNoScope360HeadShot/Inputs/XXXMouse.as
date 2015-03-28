package XXXNoScope360HeadShot.Inputs 
{
	import flash.display.Sprite;
	import flash.display.Stage
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Dany
	 */
	public class XXXMouse 
	{
		static public var mc:Sprite;
		
		static public function init(stage:Stage, config:Dictionary=null):void
		{
			stage.addEventListener(MouseEvent.CLICK, click);
			if (config!=null)
			{
				if (config['activate_down'])
				{
					stage.addEventListener(MouseEvent.MOUSE_DOWN, down);
					stage.addEventListener(MouseEvent.MOUSE_UP, up);
				}
				
			}
			
		}
		
		static public function clear():void {
			mc = null;
		}
		
		static private function click(e:MouseEvent):void 
		{
			mc = e.target as Sprite;
		}
		
		static private function down(e:MouseEvent):void 
		{
			
		}
		
		static private function up(e:MouseEvent):void 
		{
			
		}
		
	}

}