package
{
	import org.flixel.*;

	public class Registry
	{
		public static var puzzleNames:Array = new Array;
		public static var puzzleSolutions:Array = new Array;
		public static var puzzles:Array = new Array;
		public static var finishedPuzzles:Array = new Array;
		public static var instructions:Array = new Array;
		
		//10x10 stuff
		[Embed(source = '../Sprites/title.png')] static public var Title:Class;
		[Embed(source = '../Sprites/instructions1.png')] static public var Instructions1:Class;
		[Embed(source = '../Sprites/instructions2.png')] static public var Instructions2:Class;
		[Embed(source = '../Sprites/instructions3.png')] static public var Instructions3:Class;
		[Embed(source = '../Sprites/instructions4.png')] static public var Instructions4:Class;
		[Embed(source = '../Sprites/instructions5.png')] static public var Instructions5:Class;
		[Embed(source = '../Sprites/instructions6.png')] static public var Instructions6:Class;
		[Embed(source = '../Sprites/10x10grid.png')] static public var SGrid:Class;
		[Embed(source = '../Sprites/10x10Face.png')] static public var Face:Class;
		[Embed(source = '../Sprites/10x10BaseballPlayer.png')] static public var BaseballPlayer:Class;
		[Embed(source = '../Sprites/10x10Dog.png')] static public var Dog:Class;
		[Embed(source = '../Sprites/10x10Cat.png')] static public var Cat:Class;
		[Embed(source = '../Sprites/10x10Cherries.png')] static public var Cherries:Class;
		[Embed(source = '../Sprites/10x10Beaker.png')] static public var Beaker:Class;
		[Embed(source = '../Sprites/10x10Heart.png')] static public var Heart:Class;
		[Embed(source = '../Sprites/10x10Diamond.png')] static public var Diamond:Class;
		[Embed(source = '../Sprites/10x10Spade.png')] static public var Spade:Class;
		[Embed(source = '../Sprites/10x10Club.png')] static public var Club:Class;
		[Embed(source = '../Sprites/panelFace.png')] static public var panelFace:Class;
		[Embed(source = '../Sprites/panelBaseballPlayer.png')] static public var panelBaseballPlayer:Class;
		[Embed(source = '../Sprites/panelDog.png')] static public var panelDog:Class;
		[Embed(source = '../Sprites/panelCat.png')] static public var panelCat:Class;
		[Embed(source = '../Sprites/panelCherries.png')] static public var panelCherries:Class;
		[Embed(source = '../Sprites/panelBeaker.png')] static public var panelBeaker:Class;
		[Embed(source = '../Sprites/panelHeart.png')] static public var panelHeart:Class;
		[Embed(source = '../Sprites/panelDiamond.png')] static public var panelDiamond:Class;
		[Embed(source = '../Sprites/panelSpade.png')] static public var panelSpade:Class;
		[Embed(source = '../Sprites/panelClub.png')] static public var panelClub:Class;
		[Embed(source = '../Sprites/panelSolved.png')] static public var panelSolved:Class;
		[Embed(source = '../Sprites/fp10x10Face.png')] static public var fpFace:Class;
		[Embed(source = '../Sprites/fp10x10BaseballPlayer.png')] static public var fpBaseballPlayer:Class;
		[Embed(source = '../Sprites/fp10x10Dog.png')] static public var fpDog:Class;
		[Embed(source = '../Sprites/fp10x10Cat.png')] static public var fpCat:Class;
		[Embed(source = '../Sprites/fp10x10Cherries.png')] static public var fpCherries:Class;
		[Embed(source = '../Sprites/fp10x10Beaker.png')] static public var fpBeaker:Class;
		[Embed(source = '../Sprites/fp10x10Heart.png')] static public var fpHeart:Class;
		[Embed(source = '../Sprites/fp10x10Diamond.png')] static public var fpDiamond:Class;
		[Embed(source = '../Sprites/fp10x10Spade.png')] static public var fpSpade:Class;
		[Embed(source = '../Sprites/fp10x10Club.png')] static public var fpClub:Class;
		
		//the other stuff
		[Embed(source = '../Sprites/grayBlock.png')] static public var GrayBlock:Class;
		[Embed(source = '../Sprites/whiteBlock.png')] static public var WhiteBlock:Class;
		[Embed(source = '../Sprites/pen.png')] static public var Pen:Class;
		
		instructions = [Registry.Instructions1,Registry.Instructions2,Registry.Instructions3,Registry.Instructions4,Registry.Instructions5,Registry.Instructions6];
		
		finishedPuzzles = [Registry.fpFace,Registry.fpBaseballPlayer,Registry.fpDog,Registry.fpCat,Registry.fpCherries,Registry.fpBeaker,Registry.fpHeart,Registry.fpDiamond,Registry.fpSpade,Registry.fpClub]
		
		puzzles = [Registry.Face,Registry.BaseballPlayer,Registry.Dog,Registry.Cat,Registry.Cherries,Registry.Beaker,Registry.Heart,Registry.Diamond,Registry.Spade,Registry.Club];
		
		puzzleNames = [Registry.panelFace,Registry.panelBaseballPlayer,Registry.panelDog,Registry.panelCat,Registry.panelCherries,Registry.panelBeaker,Registry.panelHeart,Registry.panelDiamond,Registry.panelSpade,Registry.panelClub];
		
		puzzleSolutions = [[0,0,0,0,0,0,0,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,1,1,1,1,1,1,0,0],
						   [0,1,1,0,1,1,0,1,1,0],
						   [0,1,1,0,1,1,0,1,1,0],
						   [0,1,1,1,1,1,1,1,1,0],
						   [0,1,0,1,1,1,1,0,1,0],
						   [0,0,1,0,0,0,0,1,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,0,0,0,0,0,0,0],
						   [0,0,0,0,0,1,1,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,0,0,1,1,0,0,1],
						   [0,0,1,1,1,0,1,1,1,0],
						   [0,1,1,0,1,1,1,0,0,0],
						   [0,1,1,0,1,1,0,0,0,0],
						   [0,0,0,1,1,1,0,0,0,0],
						   [0,0,1,1,0,1,1,0,0,0],
						   [0,0,1,0,0,0,1,1,1,0],
						   [0,1,1,0,0,0,0,0,1,0],
						   [0,0,0,1,0,0,0,0,0,0],
						   [0,1,1,1,0,0,0,0,1,1],
						   [0,1,0,1,0,0,0,0,1,0],
						   [1,1,1,1,1,1,1,1,1,0],
						   [1,1,1,1,1,1,1,1,1,0],
						   [0,0,0,1,1,1,1,1,1,0],
						   [0,0,0,1,1,1,1,1,0,0],
						   [0,0,0,1,0,0,0,1,0,0],
						   [0,0,0,1,0,0,0,1,0,0],
						   [0,0,1,1,0,0,1,1,0,0],
						   [0,0,0,0,0,0,0,0,0,0],
						   [1,0,1,0,0,0,0,0,0,0],
						   [1,1,1,0,0,0,0,0,0,1],
						   [1,1,1,0,0,0,0,0,1,1],
						   [1,1,1,1,1,1,1,1,1,0],
						   [1,1,1,1,1,1,1,1,0,0],
						   [1,1,1,1,1,1,1,1,1,0],
						   [1,0,1,0,0,0,1,0,1,1],
						   [1,0,1,0,0,1,1,0,0,1],
						   [0,0,0,0,0,0,0,0,0,0],
						   [0,0,0,0,0,1,0,0,0,0],
						   [0,0,0,0,1,0,1,0,0,0],
						   [0,0,0,1,0,0,0,1,0,0],
						   [0,0,1,0,0,0,1,1,1,0],
						   [0,1,1,1,0,1,1,0,1,1],
						   [1,1,0,1,1,1,0,1,1,1],
						   [1,0,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,0,1,1,1,0],
						   [0,1,1,1,0,0,0,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,1,1,1,1,1,1,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,1,0,0,1,0,0,0],
						   [0,0,1,0,0,0,0,1,0,0],
						   [0,0,1,0,0,0,0,1,0,0],
						   [0,1,1,1,1,1,1,1,1,0],
						   [0,1,1,1,1,1,1,1,1,0],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [0,0,1,0,0,0,0,1,0,0],
						   [0,1,1,1,0,0,1,1,1,0],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [0,1,1,1,1,1,1,1,1,0],
						   [0,0,1,1,1,1,1,1,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,1,1,1,1,1,1,0,0],
						   [0,1,1,1,1,1,1,1,1,0],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [0,1,1,1,1,1,1,1,1,0],
						   [0,0,1,1,1,1,1,1,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,1,1,1,1,1,1,0,0],
						   [0,1,1,1,1,1,1,1,1,0],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,0,0,1,1,0,0,1,1],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0],
						   [0,1,1,0,1,1,0,1,1,0],
						   [1,1,1,1,1,1,1,1,1,1],
						   [1,1,1,1,1,1,1,1,1,1],
						   [0,1,1,0,1,1,0,1,1,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,0,1,1,0,0,0,0],
						   [0,0,0,1,1,1,1,0,0,0]];

		
		public function Registry()
		{
		}
	}
}