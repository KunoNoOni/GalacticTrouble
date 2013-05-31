package
{
	import org.flixel.*;
	
	[SWF(width="1024", height="768", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class GalacticTrouble extends FlxGame
	{
		public function GalacticTrouble()
		{
			super(1024,768,TitleState,1);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}