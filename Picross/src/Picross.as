package
{
	import org.flixel.*;
	
	[SWF(width="360", height="360", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class Picross extends FlxGame
	{
		public function Picross()
		{
			super(360,360,TitleState,3);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}