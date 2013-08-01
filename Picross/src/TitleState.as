package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var myTitle:FlxSprite = new FlxSprite();
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{		
			myTitle.loadGraphic(Registry.Title,false,false,120,120);
			add(myTitle);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
			{
				FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
			}
			super.update();
		}
	}
}