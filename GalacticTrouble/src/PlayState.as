package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var Hero:Player;
		private var eUFO:Ufo;
		private var bGround:FlxSprite = new FlxSprite();
		private var hud:hudGfx;
		private var b:Bullet;
		private var bulletGroup:FlxGroup = new FlxGroup();
		private var t:FlxTimer = new FlxTimer();
		private var timerSet:Boolean = false;
		private var emitter:FlxEmitter;
		private var aSmall:AsteroidSmall;
		private var aSmall2:AsteroidSmall;
		private var aSmallGroup:FlxGroup = new FlxGroup();
		private var scoreText:FlxText;
		private var livesText:FlxText;
		private var achievement:Achievements;
		private var soundPlayed:Boolean = false;
		
		
				
		override public function create():void
		{	
			Registry.init();
			Registry.GameOver = false;
			Registry.playAgain = false;
			Registry.introActive = false;
			Registry.scoreUpdateOnDeath = false;
			bGround.loadGraphic(Registry.BG,false,false,1024,768,false);
			add(bGround);
			Hero = new Player(7,11);
			Hero.solid = true;
			add(Hero);
			initPlayerBullets();
			add(Registry.asteroids);
			add(Registry.spinners);
			add(Registry.ufos);
			add(Registry.enemyBullets);
			add(Registry.pulses);
			hud = new hudGfx();
			add(hud);
			
			achievement = new Achievements;
			add(achievement);
			achievement.visible = false;
			
			initHudText();
			
			Registry.asteroidVelocity = Registry.asteroidInitalVelocity;
			AsteroidManager.releaseRate = 2000;
			Registry.spinnerVelocity = Registry.spinnerInitialVelocity;
			SpinnerManager.releaseRate = 10000;
			Registry.pulseVelocity = Registry.pulseInitialVelocity;
			PulseManager.releaseRate = 8000;
			UFOManager.releaseRate = 60000;
			
			FlxG.playMusic(Registry.gameMusic4,1);
		}	
		
		override public function update():void
		{
			if(Registry.inMenu)
			{
				achievement.update();
				return;
			}
			
			if(Registry.lives < 0)
			{
				Registry.GameOver = true;
				FlxG.switchState(new GameOverState());
			}
			
			if(Registry.playerDead)
			{
				delay(2);
				if(!timerSet)
				{
					resetGame();
				}
			}
			
			Registry.playerX = Hero.x;
			
			scoreText.text = ""+Registry.score;
			
			increaseDifficulty();
			getExtraLife(); 
			
			FlxG.overlap(Hero, Registry.asteroids,killPlayer);
			FlxG.overlap(Hero, Registry.spinners,killPlayer);
			FlxG.overlap(Hero, Registry.enemyBullets,killPlayer);
			FlxG.overlap(Hero, Registry.pulses,killPlayer);
			FlxG.overlap(Hero, aSmallGroup,killPlayer);
			
			FlxG.overlap(bulletGroup,Registry.asteroids,killAsteroid);
			FlxG.overlap(bulletGroup,Registry.spinners,killSpinner);
			FlxG.overlap(bulletGroup,Registry.ufos,killUfo);
			FlxG.overlap(bulletGroup,Registry.pulses,killPulse);
			FlxG.overlap(bulletGroup,aSmallGroup,killAsteroidSmall);
			
			super.update();
			
			if(FlxG.keys.justPressed("TAB"))
			{
				achievement.kill();
				achievement = new Achievements;
				add(achievement);
				Registry.inMenu = true;
			}
		}
		
		private function killPlayer(p:FlxSprite,e:FlxSprite):void
		{
			if(!Registry.scoreUpdateOnDeath)
			{
				if(Registry.score <= 999)
				{
					Registry.score -= 100;
				}
				else if((Registry.score >= 1000) && (Registry.score <= 4999))				
				{
					Registry.score -= 200;
				}
				else if((Registry.score >=5000) && (Registry.score <= 19000))
				{
					Registry.score -= 300;
				}
				else if((Registry.score >=20000) && (Registry.score <= 50000))
				{
					Registry.score -= 400;
				}
				else if(Registry.score > 50000)
				{
					Registry.score -= 500;
				}
			}
			
			if(Registry.score < 0)
			{
				Registry.score = 0;
				scoreText.text = ""+Registry.score;
			}
			else
			{
				scoreText.text = ""+Registry.score;
			}
			
			Registry.playerDead = true;
			if(!soundPlayed)
			{
				soundPlayed = true;
				FlxG.play(Registry.shipExplosion,0.5);
			}
			Registry.scoreUpdateOnDeath = true;
			livesText.text = ""+Registry.lives;
		}
		
		private function killAsteroid(b:FlxSprite,e:FlxSprite):void
		{
			FlxG.play(Registry.rockExplosion,0.5);
			b.kill();
			e.kill();
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(Registry.bits,30,0,true);
			add(emitter);
			emitter.start(true,1);
			aSmall = new AsteroidSmall((FlxG.random()*100)+e.x,(FlxG.random()*100)+e.y);
			aSmall.velocity.y = e.velocity.y;
			aSmall2 = new AsteroidSmall((FlxG.random()*100)+e.x,(FlxG.random()*100)+e.y);
			aSmall2.velocity.y = e.velocity.y;
			aSmallGroup.add(aSmall);
			aSmallGroup.add(aSmall2);
			add(aSmallGroup);
		
			if(Registry.score <= 999)
			{
				Registry.score += 10;
			}
			else if(Registry.score >= 1000 && Registry.score <= 4999)				
			{
				Registry.score += 20;
			}
			else if(Registry.score >=5000 && Registry.score <= 19000)
			{
				Registry.score += 30;
			}
			else if(Registry.score >=20000 && Registry.score <= 50000)
			{
				Registry.score += 40;
			}
			else if(Registry.score > 50000)
			{
				Registry.score += 50;
			}
			
			scoreText.text = ""+Registry.score;
			Registry.largeAstCount +=1;
		
		}
		
		private function killAsteroidSmall(b:FlxSprite,e:FlxSprite):void
		{
			FlxG.play(Registry.rockExplosion,0.5);
			b.kill();
			e.kill();
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(Registry.bits,5,0,true);
			add(emitter);
			emitter.start(true,1);
			
			if(Registry.score <= 999)
			{
				Registry.score += 20;
			}
			else if(Registry.score >= 1000 && Registry.score <= 4999)				
			{
				Registry.score += 40;
			}
			else if(Registry.score >=5000 && Registry.score <= 19000)
			{
				Registry.score += 60;
			}
			else if(Registry.score >=20000 && Registry.score <= 50000)
			{
				Registry.score += 80;
			}
			else if(Registry.score > 50000)
			{
				Registry.score += 100;
			}
			
			scoreText.text = ""+Registry.score;
			Registry.smallAstCount +=1;
		}
		
		private function killSpinner(b:FlxSprite,e:FlxSprite):void
		{
			FlxG.play(Registry.spinnerExplosion,0.5);
			b.kill();
			e.kill();
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(Registry.sbits,10,0,true);
			add(emitter);
			emitter.start(true,1);
			
			if(Registry.score <= 999)
			{
				Registry.score += 40;
			}
			else if(Registry.score >= 1000 && Registry.score <= 4999)				
			{
				Registry.score += 80;
			}
			else if(Registry.score >=5000 && Registry.score <= 19000)
			{
				Registry.score += 120;
			}
			else if(Registry.score >=20000 && Registry.score <= 50000)
			{
				Registry.score += 160;
			}
			else if(Registry.score > 50000)
			{
				Registry.score += 200;
			}
			
			scoreText.text = ""+Registry.score;
			Registry.spinCount +=1;
		}
		
		private function killUfo(b:FlxSprite,e:FlxSprite):void
		{
			FlxG.play(Registry.ufoExplosion,0.5);
			b.kill();
			e.kill(); 
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(Registry.ubits,10,0,true);
			add(emitter);
			emitter.start(true,1);
			
			if(Registry.score <= 999)
			{
				Registry.score += 100;
			}
			else if(Registry.score >= 1000 && Registry.score <= 4999)				
			{
				Registry.score += 200;
			}
			else if(Registry.score >=5000 && Registry.score <= 19000)
			{
				Registry.score += 300;
			}
			else if(Registry.score >=20000 && Registry.score <= 50000)
			{
				Registry.score += 400;
			}
			else if(Registry.score > 50000)
			{
				Registry.score += 500;
			}
			
			scoreText.text = ""+Registry.score;
			Registry.ufoCount +=1;
		}
		
		private function killPulse(b:FlxSprite,e:FlxSprite):void
		{
			FlxG.play(Registry.pulseExplosion,0.5);
			b.kill();
			e.kill(); 
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(Registry.pbits,10,0,true);
			add(emitter);
			emitter.start(true,1);
			
			if(Registry.score <= 999)
			{
				Registry.score += 80;
			}
			else if(Registry.score >= 1000 && Registry.score <= 4999)				
			{
				Registry.score += 160;
			}
			else if(Registry.score >=5000 && Registry.score <= 19000)
			{
				Registry.score += 240;
			}
			else if(Registry.score >=20000 && Registry.score <= 50000)
			{
				Registry.score += 320;
			}
			else if(Registry.score > 50000)
			{
				Registry.score += 400;
			}
			
			scoreText.text = ""+Registry.score;
			Registry.pulseCount +=1;
		}
		
		
		private function resetGame():void
		{
			bulletGroup.clear();
			Registry.playerDead = false;
			FlxG.resetState();
		}
		
		
		private function delay(howlong:int):void
		{	
			if(!timerSet)
			{
				t.start(howlong);
			}
			timerSet = true;
			if(t.finished)
			{
				t.stop();
				timerSet = false;
			}			
		}
		
		private function initPlayerBullets():void
		{
			for(var v:int = 0;v<20;v++)
			{
				b = new Bullet(-20,-20);
				bulletGroup.add(b);
			}
			
			Hero.bulletArray = bulletGroup.members;
			add(bulletGroup);
		}
		
		private function initHudText():void
		{
			scoreText = new FlxText(20,8,444,""+Registry.score);
			scoreText.setFormat(null,40,0xFF0000,"left");
			add(scoreText);		
			livesText = new FlxText(955,8,62,""+Registry.lives);
			livesText.setFormat(null,40,0xFF0000,"center");
			add(livesText);
		}
		
		private function getExtraLife():void
		{
			if(Registry.score >= Registry.nextExtraLife)
			{
				FlxG.play(Registry.extraLife1,0.5);
				Registry.lives += 1;
				Registry.nextExtraLife += 20000;
			}
		}
		
		private function increaseDifficulty():void
		{	
			if(Registry.score >= Registry.nextDifficultyIncrease)
			{
				Registry.asteroidVelocity += 10;
				Registry.asteroidInitalVelocity += 10;
				Registry.spinnerVelocity += 10;
				Registry.spinnerInitialVelocity += 10;
				Registry.pulseVelocity += 10;
				Registry.pulseInitialVelocity += 10;
				Registry.nextDifficultyIncrease += 20000
			}
		}
	}
}
