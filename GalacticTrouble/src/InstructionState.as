package
{
	import org.flixel.*;
		
	public class InstructionState extends FlxState
	{
		//Variables got here
		private var Hero:Player;
		private var bGround:FlxSprite = new FlxSprite();
		private var aBig:AsteroidLarge;
		private var aSmall:AsteroidSmall;
		private var spin:Spinner;
		private var pulse:Pulse;
		private var ufo:Ufo;
		
		public function InstructionState()
		{
			super();
		}
		
		override public function create():void
		{
			
			Registry.introActive = true;
			
			bGround.loadGraphic(Registry.BG,false,false,1024,768,false);
			add(bGround);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height*0.5-380, 1024, "Hostiles");
			logo.setFormat(null,40,0x000000, "center");
			add(logo);
			
			var logo2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height*0.5-383, 1024, "Hostiles");
			logo2.setFormat(null,40,0xC80000, "center");
			add(logo2);
			
			var aB:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height*0.5-280, 1024, "A large rock from outer space. Worth 10-50pts");
			aB.setFormat(null,20,0x000000, "center");
			add(aB);
			
			var aB2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height*0.5-283, 1024, "A large rock from outer space. Worth 10-50pts");
			aB2.setFormat(null,20,0xFFFFFF, "center");
			add(aB2);
			
			aBig = new AsteroidLarge();
			add(aBig);
			aBig.intro();
			
			var aS:FlxText = new FlxText(FlxG.width*0.5-460,FlxG.height*0.5-200, 1024, "A small rock created from destroying a large rock.\n Worth 20-100pts");
			aS.setFormat(null,20,0x000000, "center");
			add(aS);

			var aS2:FlxText = new FlxText(FlxG.width*0.5-463,FlxG.height*0.5-203, 1024, "A small rock created from destroying a large rock.\n Worth 20-100pts");
			aS2.setFormat(null,20,0xFFFFFF, "center");
			add(aS2);
			
			aSmall = new AsteroidSmall(144,180);
			add(aSmall);
			
			var S:FlxText = new FlxText(FlxG.width*0.5-460,FlxG.height*0.5-130, 1024, "An evil alien device. If it gets past you, the blast will\n destroy your ship. Worth 40-200pts");
			S.setFormat(null,20,0x000000, "center");
			add(S);
			
			var S2:FlxText = new FlxText(FlxG.width*0.5-463,FlxG.height*0.5-133, 1024, "An evil alien device. If it gets past you, the blast will\n destroy your ship. Worth 40-200pts");
			S2.setFormat(null,20,0xFFFFFF, "center");
			add(S2);
			
			spin = new Spinner();
			add(spin);
			spin.intro();
			
			var P:FlxText = new FlxText(FlxG.width*0.5-450,FlxG.height*0.5-50, 1024, "This rocket will home in on your position and destroy\n your ship. Worth 80-400pts");
			P.setFormat(null,20,0x000000, "center");
			add(P);
			
			var P2:FlxText = new FlxText(FlxG.width*0.5-453,FlxG.height*0.5-53, 1024, "This rocket will home in on your position and destroy\n your ship. Worth 80-400pts");
			P2.setFormat(null,20,0xFFFFFF, "center");
			add(P2);
			
			pulse = new Pulse();
			add(pulse);
			pulse.intro();
			
			var U:FlxText = new FlxText(FlxG.width*0.5-513,FlxG.height*0.5+50, 1024, "An Alien ship bent on destroying the planet\n starting with you. Worth 100-500pts");
			U.setFormat(null,20,0x000000, "center");
			add(U);
			
			var U2:FlxText = new FlxText(FlxG.width*0.5-516,FlxG.height*0.5+47, 1024, "An Alien ship bent on destroying the planet\n starting with you. Worth 100-500pts");
			U2.setFormat(null,20,0xFFFFFF, "center");
			add(U2);
			
			ufo = new Ufo();
			add(ufo);
			ufo.intro();
			
			var logo3:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height-250, 1024, "Your Ship");
			logo3.setFormat(null,40,0x000000, "center");
			add(logo3);
			
			var logo4:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height-253, 1024, "Your Ship");
			logo4.setFormat(null,40,0xC80000, "center");
			add(logo4);
			
			var H:FlxText = new FlxText(FlxG.width*0.5-460,FlxG.height*0.5+212, 1024, "The craft you will use to hopefully repel this attack.");
			H.setFormat(null,20,0x000000, "center");
			add(H);
			
			var H2:FlxText = new FlxText(FlxG.width*0.5-463,FlxG.height*0.5+209, 1024, "The craft you will use to hopefully repel this attack.");
			H2.setFormat(null,20,0xFFFFFF, "center");
			add(H2);
			
			Hero = new Player(2,9);
			add(Hero);			
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-500,FlxG.height-70, 1024, "PRESS [x] TO BEGIN MISSION");
			instruct.setFormat(null,40,0x000000, "center");
			add(instruct);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-503,FlxG.height-73, 1024, "PRESS [x] TO BEGIN MISSION");
			instruct2.setFormat(null,40,0xC80000, "center");
			add(instruct2);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}