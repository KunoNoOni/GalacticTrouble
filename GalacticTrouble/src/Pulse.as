package
{
	import org.flixel.*;
	
	public class Pulse extends FlxSprite
	{	
		public function Pulse()
		{
			super();
			loadGraphic(Registry.pulse,false,false,16,16,false);
			addAnimation("pulse",[0,1,2,3,4,3,2,1],5,true);
			exists = false;
		}
		
		public function launch():void
		{
			x = (FlxG.random()*640)+64;
			y = -16;
			velocity.y = Registry.spinnerVelocity;
			exists = true;
		}
		
		public function intro():void
		{
			x = 156;
			y = 350;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			this.play("pulse");

			if(!Registry.introActive)
			{
				//FlxG.play(Registry.pulseSound,0.5);
				//FlxG.play(Registry.pulseSound2,0.5);
				this.x = Registry.playerX+30;
				
			}
			
			if (y > FlxG.height+64)
			{
				exists = false;
			}
		}
	}
}