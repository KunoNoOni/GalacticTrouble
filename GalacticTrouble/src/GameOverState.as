package
{
	import org.flixel.*;
		
	public class GameOverState extends FlxState
	{
		//Variables got here
		private var bGround:FlxSprite = new FlxSprite();
		private var Hero:Player;
		
		public function GameOverState()
		{
			super();
		}
		
		override public function create():void
		{
			Registry.init();
			Registry.GameOver = false;
			Registry.playAgain = true;

			bGround.loadGraphic(Registry.BG,false,false,1024,768,false);
			add(bGround);
			
			Hero = new Player(7,11);
			Hero.solid = false;
			Hero.visible = false;
			add(Hero);
			
			add(Registry.asteroids);
			add(Registry.spinners);
			add(Registry.ufos);
			add(Registry.enemyBullets);
			add(Registry.pulses);
			
			Registry.asteroidVelocity = 200;
			AsteroidManager.releaseRate = 1000;
			Registry.spinnerVelocity = 200;
			SpinnerManager.releaseRate = 5000;
			Registry.pulseVelocity = 200;
			PulseManager.releaseRate = 4000;
			UFOManager.releaseRate = 5000;
			
			//FlxG.playMusic(Registry.winGameMusic);
		
			var endText:FlxText = new FlxText(FlxG.width*0.5-510,FlxG.height*0.5-380, 1024, "With no more ships to defend the planet all is lost! The civilization" +
				" on the planet will be crushed by the flurry of meteors, spinners and UFO attacks. Hopefully some can get away to create a new home on a different" +
				" planet...");
			endText.setFormat(null,30,0x000000, "center");
			add(endText);
			
			var endText2:FlxText = new FlxText(FlxG.width*0.5-513,FlxG.height*0.5-383, 1024, "With no more ships to defend the planet all is lost! The civilization" +
				" on the planet will be crushed by the flurry of meteors, spinners and UFO attacks. Hopefully some can get away to create a new home on a different" +
				" planet...");
			endText2.setFormat(null,30,0x00FFFF, "center");
			add(endText2);
			
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height-50, 1024, "PRESS [X] TO PLAY AGAIN");
			instruct.setFormat(null,40,0x000000, "center");
			add(instruct);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height-53, 1024, "PRESS [X] TO PLAY AGAIN");
			instruct2.setFormat(null,40,0x00FFFF, "center");
			add(instruct2);
			
			FlxG.playMusic(Registry.endgameMusic,.8);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new TitleState());

			super.update();
		}
	}
}