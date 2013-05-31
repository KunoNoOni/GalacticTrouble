package  
{
	import flash.utils.getTimer;
	
	import org.flixel.*;
	
	public class UFOBulletManager extends FlxGroup
	{
		/*private var lastReleased:int;
		private var releaseRate:int=300;*/
		
		public function UFOBulletManager() 
		{
			super();
			
			for (var i:int = 0; i < 40; i++)
			{
				add(new ufoBullet);
			}
			//add(Registry.eBulletGroup);
		}
		
		public function release(bx:Number,by:Number):void
		{
			var b:ufoBullet = ufoBullet(getFirstAvailable());
			if (b)
			{
				b.launch(bx,by);
			}
		}
		
		override public function update():void
		{
			super.update();
			
			/*if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				trace("Get ready!");
				release();
			}*/
		}
	}
}