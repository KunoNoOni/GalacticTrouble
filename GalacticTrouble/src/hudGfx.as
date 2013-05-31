package
{
	import org.flixel.*;
	
	public class hudGfx extends FlxSprite
	{
		//Variables got here
		
		public function hudGfx()
		{
			super(0,0);
			loadGraphic(Registry.HUD,false,false,1024,64,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}