package  
{
	import flash.utils.getTimer;
	
	import org.flixel.*;

	public class PulseManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function PulseManager() 
		{
			super();
			
			for (var i:int = 0; i < 25; i++)
			{
				add(new Pulse);
			}
		}
		
		public function release():void
		{
			var p:Pulse = Pulse(getFirstAvailable());
			if (p)
			{
				p.launch();
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