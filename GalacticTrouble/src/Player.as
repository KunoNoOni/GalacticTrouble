package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var bulletArray:Array;
		private var bulletID:int = 0;
		private var bullet:FlxSprite;
		private var threshold:Number = 0.3;
		private var counter:Number = 0;		
		
		public function Player(X:Number=0, Y:Number=0)
		{
			super(X*64,Y*64);
			loadGraphic(Registry.hero,true,false,64,64);
			addAnimation("ready",[0],15);
			addAnimation("dead",[1,2,3,4,5],10);
			
		}
		
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
			counter += FlxG.elapsed;
			//trace("timer: "+counter+" FlxG.elapsed: "+FlxG.elapsed+" threshold: "+threshold);
			
			
			if(FlxG.keys.LEFT && this.x>0)
			{
				velocity.x = -256;
			}
			
			if(FlxG.keys.RIGHT && this.x <960)
			{
				velocity.x = 256;
			}
			
			if(FlxG.keys.pressed("SPACE"))
			{

				if(counter >= threshold)
				{
					counter = 0;
					FlxG.play(Registry.shipFire,0.5);
					bullet = bulletArray[bulletID];
					bullet.reset(x + 31,y + 10);
					bullet.velocity.y = -400;
					bulletID++;
					if(bulletID == 20)
					{
						bulletID = 0;
					}	
				}
			}
			
			if(Registry.playerDead)
			{
				this.play("dead");
				if(this.frame == 5)
				{
					this.kill();
					Registry.lives -= 1;
				}
			}
			else 
			{
				this.play("ready");
			}
			
			super.update();
		}
	}
}