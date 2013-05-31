package
{
	import org.flixel.*;
	
	public class Spinner extends FlxSprite
	{
		public function Spinner()
		{
			super();
			loadGraphic(Registry.spinner,false,false,64,64,false);
			addAnimation("spin",[0,1,2,3],5,true);
			exists = false;
		}
		
		public function launch():void
		{
			x = (FlxG.random()*640)+64;
			y = -64;
			velocity.y = Registry.spinnerVelocity;
			exists = true;
		}
		
		public function intro():void
		{
			x = 128;
			y = 240;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			this.play("spin");
			
			/*if(!Registry.introActive)
			{
				FlxG.play(Registry.spinnerSound,0.5);	
			}*/
			
			if (y > FlxG.height+64)
			{
				exists = false;
				Registry.playerDead = true;
			}
		}
	}
}