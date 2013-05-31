package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var bGround:FlxSprite = new FlxSprite();
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			Registry.playerDead = false;
			Registry.score = 0;
			Registry.lives = 5;
			
			bGround.loadGraphic(Registry.BG,false,false,1024,768,false);
			add(bGround);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height*0.5-350, 1024, "Galactic Trouble");
			logo.setFormat(null,72,0x000000, "center");
			add(logo);
			
			var logo2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height*0.5-353, 1024, "Galactic Trouble");
			logo2.setFormat(null,72,0xC80000, "center");
			add(logo2);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height-70, 1024, "PRESS [x] TO CONTINUE");
			instruct.setFormat(null,60,0x000000, "center");
			add(instruct);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height-73, 1024, "PRESS [x] TO CONTINUE");
			instruct2.setFormat(null,60,0xC80000, "center");
			add(instruct2);
			
			FlxG.playMusic(Registry.titleMusic1,1);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}