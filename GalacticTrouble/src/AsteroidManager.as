package  
{
	import org.flixel.*;
	import flash.utils.getTimer;

	public class AsteroidManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function AsteroidManager() 
		{
			super();
			
			for (var i:int = 0; i < 25; i++)
			{
				add(new AsteroidLarge);
			}
		}
		
		public function release():void
		{
			var aLarge:AsteroidLarge = AsteroidLarge(getFirstAvailable());
			if (aLarge)
			{
				aLarge.launch();
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
		}
	}
}