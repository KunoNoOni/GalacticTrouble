package
{
	import org.flixel.*;
	
	public class Ufo extends FlxSprite
	{
		/*private var eBullet:Array;
		private var bulletID:int = 0;
		private var bullet:FlxSprite;*/
		private var threshold:Number = 1;
		private var counter:Number = 0;	
		
		public function Ufo()
		{
			super();
			loadGraphic(Registry.UFO,false,false,64,64,false);
			//trace(eBullet.length);
			/*if(eBullet.length > 0)
			{
				eBullet.length = 0;
			}*/
			//initEnemyBullets();
			exists = false;
		}
		
		public function intro():void
		{
			x = 128;
			y = 430;
			exists = true;
		}
		
		public function launch():void
		{
			x = -64; 
			y = 100;
			velocity.x = 150;
			exists = true;
		}
		
		override public function update():void
		{
			counter += FlxG.elapsed;
			
			if(counter >= threshold && !Registry.introActive)
			{
				counter = 0;
				FlxG.play(Registry.ufoFire,0.5);
				Registry.enemyBullets.release(this.x,this.y);
				/*bullet = eBullet[bulletID];
				bullet.reset(x + 32,y + 54);
				bullet.velocity.y = 400;
				bulletID++;
				if(bulletID == 20)
				{
					bulletID = 0;
				}	*/
			}
			
			if (x > FlxG.width+64)
			{
				exists = false;
			}
			
			super.update();
		}
		
		/*private function initEnemyBullets():void
		{
			for(var v:int = 0;v<20;v++)
			{
				bullet = new Bullet(-60,-60);
				Registry.eBulletGroup.add(bullet);
			}
			
			eBullet = Registry.eBulletGroup.members;
		}*/
	}
}