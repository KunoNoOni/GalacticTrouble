package  
{
	import flash.utils.getTimer;
	
	import org.flixel.*;

	public class SpinnerManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function SpinnerManager() 
		{
			super();
			
			for (var i:int = 0; i < 25; i++)
			{
				add(new Spinner);
			}
		}
		
		public function release():void
		{
			var spin:Spinner = Spinner(getFirstAvailable());
			if (spin)
			{
				spin.launch();
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