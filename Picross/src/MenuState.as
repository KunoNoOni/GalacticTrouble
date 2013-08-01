package
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		//Variables got here
		private var myPics:FlxSprite;
		private var index:int = 0;
		private var readyToPlay:Boolean=false;
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{		
			displayInstructions();
		}
		
		override public function update():void
		{	
			if(index == 5)
			{
				readyToPlay = true;
			}
			
			if(FlxG.keys.justReleased("X") && readyToPlay)
			{
				FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5
			}
			
			if(FlxG.keys.justReleased("X") && !readyToPlay)
			{
				if(index >5)
				{
					index = 5;
				}
				else
				{
					index++;
					myPics.kill();
					displayInstructions();
				}
			}
			
			super.update();
		}
		
		private function displayInstructions():void
		{
			myPics = new FlxSprite();
			myPics.loadGraphic(Registry.instructions[index],false,false,120,120);
			add(myPics);
		}
	}
}