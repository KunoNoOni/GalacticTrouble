package
{
	import org.flixel.*;

	public class Registry
	{
		public static var playerDead:Boolean = false;
		public static var asteroidVelocity:Number;
		public static var asteroidInitalVelocity:Number = 50;
		public static var asteroids:AsteroidManager;
		public static var spinnerVelocity:Number;
		public static var spinnerInitialVelocity:Number = 50;
		public static var spinners:SpinnerManager;
		public static var pulseVelocity:Number;
		public static var pulseInitialVelocity:Number = 50;
		public static var pulses:PulseManager;
		public static var enemyBullets:UFOBulletManager;
		public static var ufos:UFOManager;
		public static var GameOver:Boolean = true;
		public static var lives:Number;
		public static var score:int= 0;
		public static var playerX:Number;
		public static var scoreUpdateOnDeath:Boolean;
		public static var introActive:Boolean= false;
		public static var nextExtraLife:int=20000;
		public static var nextDifficultyIncrease:int=10000;
		public static var inMenu:Boolean = false;
		public static var playAgain:Boolean = false;
		
		//Achievements
		public static var largeAstCount:int = 0;
		public static var smallAstCount:int = 0;
		public static var spinCount:int = 0;
		public static var pulseCount:int = 0;
		public static var ufoCount:int = 0;
		public static var Large100:Boolean = false;
		public static var Large500:Boolean = false;
		public static var Large1000:Boolean = false;
		public static var Small100:Boolean = false;
		public static var Small500:Boolean = false;
		public static var Small1000:Boolean = false;
		public static var Spin100:Boolean = false;
		public static var Spin500:Boolean = false;
		public static var Spin1000:Boolean = false;
		public static var Pulse100:Boolean = false;
		public static var Pulse500:Boolean = false;
		public static var Pulse1000:Boolean = false;
		public static var UFO100:Boolean = false;
		public static var UFO500:Boolean = false;
		public static var UFO1000:Boolean = false;
		public static var Score50000:Boolean = false;
		public static var Score100000:Boolean = false;
		public static var Score250000:Boolean = false;
		

		
		//Sprites
		[Embed(source = 'Sprites/hero.png')] static public var hero:Class;
		[Embed(source = 'Sprites/background.png')] static public var BG:Class;
		[Embed(source = 'Sprites/hud.png')] static public var HUD:Class;
		[Embed(source = 'Sprites/bullet.png')] static public var bullet:Class;
		[Embed(source = 'Sprites/asteroid.png')] static public var asteroidLarge:Class;
		[Embed(source = 'Sprites/asteroidSmall.png')] static public var asteroidSmall:Class;
		[Embed(source = 'Sprites/spinner.png')] static public var spinner:Class;
		[Embed(source = 'Sprites/ufo.png')] static public var UFO:Class;
		[Embed(source = 'Sprites/pulse.png')] static public var pulse:Class;
		[Embed(source = 'Sprites/bits.png')] static public var bits:Class;
		[Embed(source = 'Sprites/sbits.png')] static public var sbits:Class;
		[Embed(source = 'Sprites/ubits.png')] static public var ubits:Class;
		[Embed(source = 'Sprites/pbits.png')] static public var pbits:Class;
		[Embed(source = 'Sprites/bronzeTrophy.png')] static public var bTrophy:Class;
		[Embed(source = 'Sprites/goldTrophy.png')] static public var gTrophy:Class;
		[Embed(source = 'Sprites/platniumTrophy.png')] static public var pTrophy:Class;
		[Embed(source = 'Sprites/Achievements.png')] static public var achievements:Class;
			
		//CSV Example
		//[Embed(source = 'Maps/mapCSV_Group1_set1P1.csv', mimeType = 'application/octet-stream')] static public var set1P1:Class;
		
		//Sounds
		[Embed(source = 'sounds/ExtraLife.mp3')] static public var extraLife1:Class;
		[Embed(source = 'sounds/Achievement.mp3')] static public var achieve:Class;
		[Embed(source = 'sounds/Pulse.mp3')] static public var pulseSound:Class;
		[Embed(source = 'sounds/Pulse2.mp3')] static public var pulseSound2:Class;
		[Embed(source = 'sounds/PulseExplosion.mp3')] static public var pulseExplosion:Class;
		[Embed(source = 'sounds/RockExplosion.mp3')] static public var rockExplosion:Class;
		[Embed(source = 'sounds/ShipExplosion.mp3')] static public var shipExplosion:Class;
		[Embed(source = 'sounds/ShipFire.mp3')] static public var shipFire:Class;
		[Embed(source = 'sounds/Spinner.mp3')] static public var spinnerSound:Class;
		[Embed(source = 'sounds/SpinnerExplosion.mp3')] static public var spinnerExplosion:Class;
		[Embed(source = 'sounds/UfoExplosion.mp3')] static public var ufoExplosion:Class;
		[Embed(source = 'sounds/UfoFire.mp3')] static public var ufoFire:Class;
		[Embed(source = 'sounds/ALARM2.mp3')] static public var alarm:Class;
		
		//Music
		[Embed(source = 'sounds/DST-Collidescope.mp3')] static public var titleMusic1:Class;
		[Embed(source = 'sounds/DST-DoomNGloom.mp3')] static public var endgameMusic:Class;
		[Embed(source = 'sounds/DST-Psykick.mp3')] static public var gameMusic4:Class;

		public function Registry()
		{
		}
		
		public static function init():void
		{
			asteroids = new AsteroidManager;
			spinners = new SpinnerManager;
			ufos = new UFOManager;
			enemyBullets = new UFOBulletManager;
			pulses = new PulseManager;
						
			if(GameOver)
			{
				lives = 5;	
			}
			
			if(playAgain)
			{
				largeAstCount = 0;
				smallAstCount = 0;
				spinCount = 0;
				pulseCount = 0;
				ufoCount = 0;
				Large100 = false;
				Large500 = false;
				Large1000 = false;
				Small100 = false;
				Small500 = false;
				Small1000 = false;
				Spin100 = false;
				Spin500 = false;
				Spin1000 = false;
				Pulse100 = false;
				Pulse500 = false;
				Pulse1000 = false;
				UFO100 = false;
				UFO500 = false;
				UFO1000 = false;
				Score50000 = false;
				Score100000 = false;
				Score250000 = false;
			}
		}
		
		
	}
}