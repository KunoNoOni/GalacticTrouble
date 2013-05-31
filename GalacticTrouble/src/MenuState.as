package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here
		private var bGround:FlxSprite = new FlxSprite();
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			Registry.introActive = false;
			
			bGround.loadGraphic(Registry.BG,false,false,1024,768,false);
			add(bGround);
			
			FlxG.play(Registry.alarm,.5);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height*0.5-350, 1024, "ALERT! ALERT! ALERT! INCOMING HOSTILES! DESTROY ALL INCOMING HOSTILES!");
			logo.setFormat(null,72,0x000000, "center");
			add(logo);
			
			var logo2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height*0.5-353, 1024, "ALERT! ALERT! ALERT! INCOMING HOSTILES! DESTROY ALL INCOMING HOSTILES!");
			logo2.setFormat(null,72,0xFFC800, "center");
			add(logo2);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height-70, 1024, "PRESS [x] TO BEGIN DEBRIEFING");
			instruct.setFormat(null,40,0x000000, "center");
			add(instruct);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height-73, 1024, "PRESS [x] TO BEGIN DEBRIEFING");
			instruct2.setFormat(null,40,0xFFC800, "center");
			add(instruct2);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new InstructionState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}