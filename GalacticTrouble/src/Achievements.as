package
{
	import org.flixel.*;
	
	public class Achievements extends FlxGroup
	{
		//Variables got here
		private var bt:BronzeTrophy;
		private var btGroup:FlxGroup = new FlxGroup;
		private var gt:GoldTrophy;
		private var gtGroup:FlxGroup = new FlxGroup;
		private var pt:PlatniumTrophy;
		private var ptGroup:FlxGroup = new FlxGroup;
		private var menu:FlxSprite = new FlxSprite;
		private var large:Number = 0;
		private var small:Number = 2;
		private var spinner:Number = 4;
		private var pulse:Number = 6;
		private var ufo:Number = 8;
		private var score:Number = 10;
		private var bPos:Array = new Array(250,226,295,226,344,226,392,226,435,226,274,430);
		private var gPos:Array = new Array(250,279,295,279,344,279,392,279,435,279,274,479);
		private var pPos:Array = new Array(250,333,295,333,344,333,392,333,435,333,274,528);
		
		
		
		public function Achievements()
		{
			super();
			menu.loadGraphic(Registry.achievements,false,false,640,480,false);
			menu.x = 192;
			menu.y = 144;
			this.add(menu);
			initGroups();
		}
		
		override public function update():void
		{
			
			
			super.update();
			
			if(FlxG.keys.justPressed("ESCAPE"))
			{
				this.visible = false;
				Registry.inMenu = false;
			}
			
			checkBronze();
			checkGold();
			checkPlatnium();
			
		}
		
		private function initGroups():void
		{
			//bronze group first
			for(var i:int=0;i<12;i++)
			{
				bt = new BronzeTrophy();
				bt.x = bPos[i];
				bt.y = bPos[i+1];
				btGroup.add(bt);
				add(btGroup);
				i++
				//btGroup.setAll("visible",false);
			}
			
			//gold group next
			for(var j:int=0;j<12;j++)
			{
				gt = new GoldTrophy();
				gt.x = gPos[j];
				gt.y = gPos[j+1];
				gtGroup.add(gt);
				add(gtGroup);
				j++
				//gtGroup.setAll("visible",false);
			}
			
			//platnium group last
			for(var k:int=0;k<12;k++)
			{
				pt = new PlatniumTrophy();
				pt.x = pPos[k];
				pt.y = pPos[k+1];
				ptGroup.add(pt);
				add(ptGroup);
				k++
				//ptGroup.setAll("visible",false);
			}
			
			//set initial visibility of the trophies to false, unless they are already shown.
			if(!Registry.Large100)
			{
				btGroup.members[0].visible = false;
			}
			if(!Registry.Large500)
			{
				gtGroup.members[0].visible = false;
			}
			if(!Registry.Large1000)
			{
				ptGroup.members[0].visible = false;
			}
			if(!Registry.Small100)
			{
				btGroup.members[1].visible = false;
			}
			if(!Registry.Small500)
			{
				gtGroup.members[1].visible = false;
			}
			if(!Registry.Small1000)
			{
				ptGroup.members[1].visible = false;
			}
			if(!Registry.Spin100)
			{
				btGroup.members[2].visible = false;
			}
			if(!Registry.Spin500)
			{
				gtGroup.members[2].visible = false;
			}
			if(!Registry.Spin1000)
			{
				ptGroup.members[2].visible = false;
			}
			if(!Registry.Pulse100)
			{
				btGroup.members[3].visible = false;
			}
			if(!Registry.Pulse500)
			{
				gtGroup.members[3].visible = false;
			}
			if(!Registry.Pulse1000)
			{
				ptGroup.members[3].visible = false;
			}
			if(!Registry.UFO100)
			{
				btGroup.members[4].visible = false;
			}
			if(!Registry.UFO500)
			{
				gtGroup.members[4].visible = false;
			}
			if(!Registry.UFO1000)
			{
				ptGroup.members[4].visible = false;
			}
			if(!Registry.Score50000)
			{
				btGroup.members[5].visible = false;
			}
			if(!Registry.Score100000)
			{
				gtGroup.members[5].visible = false;
			}
			if(!Registry.Score250000)
			{
				ptGroup.members[5].visible = false;
			}
		}
		
		private function checkBronze():void
		{	
			//these checks are for while playing the game
			if(!Registry.Large100)
			{
				if(Registry.largeAstCount >= 100)
				{
					Registry.Large100 = true;
					FlxG.play(Registry.achieve,.8);
					btGroup.members[0].visible = true;
				}
			}
			
			if(!Registry.Small100)
			{
				if(Registry.smallAstCount >= 100)
				{
					Registry.Small100 = true;
					FlxG.play(Registry.achieve,.8);
					btGroup.members[1].visible = true;
				}
			}
			
			if(!Registry.Spin100)
			{
				if(Registry.spinCount >= 100)
				{
					Registry.Spin100 = true;
					FlxG.play(Registry.achieve,.8);
					btGroup.members[2].visible = true;
				}
			}
			
			if(!Registry.Pulse100)
			{
				if(Registry.pulseCount >= 100)
				{
					Registry.Pulse100 = true;
					FlxG.play(Registry.achieve,.8);
					btGroup.members[3].visible = true;
				}
			}
			
			if(!Registry.UFO100)
			{
				if(Registry.ufoCount >= 100)
				{
					Registry.UFO100 = true;
					FlxG.play(Registry.achieve,.8);
					btGroup.members[4].visible = true;
				}
			}
			
			if(!Registry.Score50000)
			{
				if(Registry.score >= 50000)
				{
					Registry.Score50000 = true;
					FlxG.play(Registry.achieve,.8);
					btGroup.members[5].visible = true;
				}
			}
		}
		
		private function checkGold():void
		{
			//these checks are for while playing the game
			if(!Registry.Large500)
			{
				if(Registry.largeAstCount >= 500)
				{
					Registry.Large500 = true;
					FlxG.play(Registry.achieve,.8);
					gtGroup.members[0].visible = true;
				}
			}
			
			if(!Registry.Small500)
			{
				if(Registry.smallAstCount >= 500)
				{
					Registry.Small500 = true;
					FlxG.play(Registry.achieve,.8);
					gtGroup.members[1].visible = true;
				}
			}
			
			if(!Registry.Spin500)
			{
				if(Registry.spinCount >= 500)
				{
					Registry.Spin500 = true;
					FlxG.play(Registry.achieve,.8);
					gtGroup.members[2].visible = true;
				}
			}
			
			if(!Registry.Pulse500)
			{
				if(Registry.pulseCount >= 500)
				{
					Registry.Pulse500 = true;
					FlxG.play(Registry.achieve,.8);
					gtGroup.members[3].visible = true;
				}
			}
			
			if(!Registry.UFO500)
			{
				if(Registry.ufoCount >= 500)
				{
					Registry.UFO500 = true;
					FlxG.play(Registry.achieve,.8);
					gtGroup.members[4].visible = true;
				}
			}
			
			if(!Registry.Score100000)
			{
				if(Registry.score >= 100000)
				{
					Registry.Score100000 = true;
					FlxG.play(Registry.achieve,.8);
					gtGroup.members[5].visible = true;
				}
			}
		}
		
		private function checkPlatnium():void
		{
			//these checks are for while playing the game
			if(!Registry.Large1000)
			{
				if(Registry.largeAstCount >= 1000)
				{
					Registry.Large1000 = true;
					FlxG.play(Registry.achieve,.8);
					ptGroup.members[0].visible = true;
				}
			}
			
			if(!Registry.Small1000)
			{
				if(Registry.smallAstCount >= 1000)
				{
					Registry.Small1000 = true;
					FlxG.play(Registry.achieve,.8);
					ptGroup.members[1].visible = true;
				}
			}
			
			if(!Registry.Spin1000)
			{
				if(Registry.spinCount >= 1000)
				{
					Registry.Spin1000 = true;
					FlxG.play(Registry.achieve,.8);
					ptGroup.members[2].visible = true;
				}
			}
			
			if(!Registry.Pulse1000)
			{
				if(Registry.pulseCount >= 1000)
				{
					Registry.Pulse1000 = true;
					FlxG.play(Registry.achieve,.8);
					ptGroup.members[3].visible = true;
				}
			}
			
			if(!Registry.UFO1000)
			{
				if(Registry.ufoCount >= 1000)
				{
					Registry.UFO1000 = true;
					FlxG.play(Registry.achieve,.8);
					ptGroup.members[4].visible = true;
				}
			}
			
			if(!Registry.Score250000)
			{
				if(Registry.score >= 250000)
				{
					Registry.Score250000 = true;
					FlxG.play(Registry.achieve,.8);
					ptGroup.members[5].visible = true;
				}
			}
		}
	}
}