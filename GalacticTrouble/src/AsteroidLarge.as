package
{
	import adobe.utils.XMLUI;
	
	import org.flixel.*;
	
	public class AsteroidLarge extends FlxSprite
	{
		private var landed:Boolean = false;
		
		public function AsteroidLarge()
		{
			super();
			loadGraphic(Registry.asteroidLarge,false,false,64,64,false);
			exists = false;
		}
		
		public function launch():void
		{
			x = (FlxG.random()*640)+64;
			y = -64;
			velocity.y = Registry.asteroidVelocity;
			exists = true;
		}
		
		public function intro():void
		{
			x = 128;
			y = 80;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
						
			if (y > FlxG.height+64)
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
					Registry.score -= 5;
				}
				else if((Registry.score >= 1000) && (Registry.score <= 4999))				
				{
					Registry.score -= 10;
				}
				else if((Registry.score >=5000) && (Registry.score <= 19000))
				{
					Registry.score -= 15;
				}
				else if((Registry.score >=20000) && (Registry.score <= 50000))
				{
					Registry.score -= 20;
				}
				else if(Registry.score > 50000)
				{
					Registry.score -= 25;
				}
				landed = false;
			}
		}
	}
}