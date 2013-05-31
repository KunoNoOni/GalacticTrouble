package
{
	import org.flixel.*;
	
	public class AsteroidSmall extends FlxSprite
	{
		private var landed:Boolean = false;
		public function AsteroidSmall(X:Number,Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.asteroidSmall,false,false,32,32,false);
		}
		
		override public function update():void
		{
			super.update();
	
			if (y > (FlxG.height+32))
			{
				exists = false;
				landed = true;
				hasLanded();
			}
		}
		
		private function hasLanded():void
		{
			if(landed && !Registry.GameOver)
			{
				if(Registry.score <= 999)
				{
					Registry.score -= 10;
				}
				else if((Registry.score >= 1000) && (Registry.score <= 4999))				
				{
					Registry.score -= 20;
				}
				else if((Registry.score >=5000) && (Registry.score <= 19000))
				{
					Registry.score -= 30;
				}
				else if((Registry.score >=20000) && (Registry.score <= 50000))
				{
					Registry.score -= 40;
				}
				else if(Registry.score > 50000)
				{
					Registry.score -= 50;
				}
				landed = false;
			}
		}
	}
}