package
{
	import org.flixel.*;
	
	public class PlatniumTrophy extends FlxSprite
	{
		//Variables got here
		
		public function PlatniumTrophy()
		{
			super(0,0);
			loadGraphic(Registry.pTrophy,false,false,39,48,false);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}