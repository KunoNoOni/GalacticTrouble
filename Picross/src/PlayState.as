package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		//Variables go here
		private var board:FlxSprite;
		private var puzzleIndex:int=0;
		private var puzzleNameIndex:int=0;
		private var puzzleSolutionIndex:int=0;
		private var numbers:FlxSprite;
		private var panel:FlxSprite;
		private var panel2:FlxSprite;
		private var block:FlxSprite;
		private var puzzlePics:FlxSprite;
		private var panelShowing:Boolean = false;
		private var panel2Showing:Boolean = false;
		private var puzzleComplete:Boolean = false;
		private var mouseRow:int;
		private var mouseCol:int;
		private var grid:Array = new Array;
				
		override public function create():void
		{	
			//change background color to WHITE
			FlxG.bgColor = 0xFF000000;

			//init the gameboard and display the correct one
			board = new FlxSprite();
			board.loadGraphic(Registry.SGrid,false,false,136,136);
			add(board);

			//load the mouse cursor
			FlxG.mouse.show(Registry.Pen,3);
			
			//initialize the array which will hold the players picture
			grid = [[0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0],
				    [0,0,0,0,0,0,0,0,0,0]];
			
			//now we load the gameboard with the first puzzle
			loadPuzzle();
			
		}	
		
		override public function update():void
		{
			mouseRow = FlxU.floor(FlxG.mouse.screenX/8);
			mouseCol = FlxU.floor(FlxG.mouse.screenY/8);

			if(FlxG.keys.justReleased("Q"))
			{
				printPuzzle();
			}
			
			
			if(FlxG.mouse.screenX > 40 && FlxG.mouse.screenY> 40 && FlxG.mouse.justReleased() && !panelShowing && !panel2Showing)
			{
				if(grid[mouseCol-5][mouseRow-5] == 0)
				{
					FlxG.mouse.reset();
					//trace("Gray block placed at "+(mouseRow-5)+","+(mouseCol-5));
					grid[mouseCol-5][mouseRow-5] = 1;
					block = new FlxSprite();
					block.loadGraphic(Registry.GrayBlock,false,false,8,8);
					block.x = mouseRow*8;
					block.y = mouseCol*8;
					add(block);
					checkPuzzle();
				}
				else
				{
					FlxG.mouse.reset();
					//trace("White block placed at "+(mouseRow-5)+","+(mouseCol-5));
					grid[mouseCol-5][mouseRow-5] = 0;
					block = new FlxSprite();
					block.loadGraphic(Registry.WhiteBlock,false,false,8,8);
					block.x = mouseRow*8;
					block.y = mouseCol*8;
					add(block);
					checkPuzzle();
				}
			}
			
			if(panelShowing && FlxG.mouse.justReleased())
			{
				FlxG.mouse.reset();
				panelShowing = false;
				panel.kill();
			}
			
			if(panel2Showing && FlxG.mouse.justReleased())
			{
				FlxG.mouse.reset();
				panel2Showing = false;
				panel2.kill();
				puzzlePics.kill();
				if(puzzleIndex == 9 && puzzleNameIndex == 9 && puzzleSolutionIndex == 90)
				{
					puzzleIndex = 0;
					puzzleNameIndex = 0;
					puzzleSolutionIndex = 0;
				}
				else
				{
					puzzleIndex++;
					puzzleNameIndex++;
					puzzleSolutionIndex+=10;
				}
				clearGrid();
			}
			
			if(puzzleComplete)
			{
				puzzleComplete = false;
				panel2 = new FlxSprite();
				panel2.loadGraphic(Registry.panelSolved,false,false,90,34);
				panel2.x = 24;
				panel2.y = 56;
				add(panel2);
				puzzlePics = new FlxSprite();
				puzzlePics.loadGraphic(Registry.finishedPuzzles[puzzleIndex],false,false,40,40);
				add(puzzlePics);
				panel2Showing = true;
				
			}
			
			super.update();
			
		}
		
		private function loadPuzzle():void
		{
			//load the numbers for the puzzle
			numbers = new FlxSprite();
			numbers.loadGraphic(Registry.puzzles[puzzleIndex],false,false,211,211);
			add(numbers);
			
			//load the name of the puzzle
			panel = new FlxSprite();
			panel.loadGraphic(Registry.puzzleNames[puzzleNameIndex],false,false,90,34);
			panel.x = 24;
			panel.y = 56;
			add(panel);
			panelShowing = true;
		}
		
		private function printPuzzle():void
		{
			var row:int;
			var col:int;
			
			for(row=0;row<10;row++)
			{
				for(col=0;col<10;col++)
				{
					if(Registry.puzzleSolutions[col+puzzleSolutionIndex][row] == 1)
					{	
						block = new FlxSprite();
						block.loadGraphic(Registry.GrayBlock,false,false,8,8);
						block.x = (row+5)*8;
						block.y = (col+5)*8;
						add(block);
					}
				}
			}
		}
		
		private function clearGrid():void
		{
			var row:int;
			var col:int;
			
			//Clearing the grid for a new puzzle
			for(row=0;row<10;row++)
			{
				for(col=0;col<10;col++)
				{
					grid[col][row] = 0;
				}
			}
			loadPuzzle();
		}
		
		private function checkPuzzle():void
		{
			var countTrue:int = 0;
			var totalCount:int = 0;
			
			//Get the total number of non blank spot in puzzle
			for(var row:int=0;row<10;row++)
			{
				for(var col:int=0;col<10;col++)
				{
					if(Registry.puzzleSolutions[col+puzzleSolutionIndex][row] == 1)
					{
						totalCount++;
					}
				}
			}
			//trace("The puzzle "+Registry.puzzleNames[puzzleNameIndex]+" has a total count of "+totalCount);
			//Check to see if the player has recreated the picture correctly
			for(row=0;row<10;row++)
			{
				for(col=0;col<10;col++)
				{
					if(grid[col][row] == 1 && Registry.puzzleSolutions[col+puzzleSolutionIndex][row] == 1)
					{
						//trace("grid["+col+"]["+row+"] = " +grid[col][row]+" Registry.puzzleSolutions["+(col+puzzleSolutionIndex)+"]["+row+"] = "+Registry.puzzleSolutions[col+puzzleSolutionIndex][row]);
						countTrue++;
					}
				}
			}
			//trace("Total Count True = "+countTrue+" Total Count = "+totalCount);
			if(countTrue == totalCount)
			{
				puzzleComplete = true;
			}
		}
	}
}
