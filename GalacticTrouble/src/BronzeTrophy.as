package
{
	import org.flixel.*;
	
	public class BronzeTrophy extends FlxSprite
	{
		//Variables got here
		
		public function BronzeTrophy()
		{
			super(0,0);
			loadGraphic(Registry.bTrophy,false,false,39,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}