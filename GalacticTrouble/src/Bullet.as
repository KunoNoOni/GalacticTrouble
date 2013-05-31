package
{
	import org.flixel.*;
	
	public class Bullet extends FlxSprite
	{
		private var ufo:Ufo;
		
		public function Bullet(X:Number=0, Y:Number=0)
		{
			super(X*3,Y*8);
			loadGraphic(Registry.bullet,false,false,3,8);
		}
		
		override public function update():void
		{
			super.update();
			
			if(y < 65)
			{
				kill();
			}
		}

	}
}