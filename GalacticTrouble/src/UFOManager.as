package  
{
	import org.flixel.*;
	import flash.utils.getTimer;

	public class UFOManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function UFOManager() 
		{
			super();
			
			for (var i:int = 0; i < 25; i++)
			{
				add(new Ufo);
			}
			
			//add(Registry.eBulletGroup);
		}
		
		public function release():void
		{
			var ufo:Ufo = Ufo(getFirstAvailable());
			if (ufo)
			{
				ufo.launch();
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