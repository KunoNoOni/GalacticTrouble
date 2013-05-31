package
{
	import org.flixel.*;
	
	public class GoldTrophy extends FlxSprite
	{
		//Variables got here
		
		public function GoldTrophy()
		{
			super(0,0);
			loadGraphic(Registry.gTrophy,false,false,39,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}