package
{
	import org.flixel.*;
	
	public class ufoBullet extends FlxSprite
	{
		private var ufo:Ufo;
		
		public function ufoBullet()
		{
			super();
			loadGraphic(Registry.bullet,false,false,3,8);
			exists = false;
		}
		
		override public function update():void
		{
			super.update();
			
			if(y > FlxG.height)
			{
				exists = false;
			}
		}
		
		public function launch(dx:Number,dy:Number):void
		{
			x = dx+31; 
			y = dy+54;
			velocity.y = 400;
			exists = true;
		}
	}
}