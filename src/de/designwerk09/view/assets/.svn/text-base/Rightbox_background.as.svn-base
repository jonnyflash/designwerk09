package de.designwerk09.view.assets
{
	import flash.display.Sprite;
	import caurina.transitions.Tweener;
	
	
		
	public class Rightbox_background extends Sprite
	{
	
	
	
		public function Rightbox_background()
		{
			
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0x141414);
			square.graphics.drawRect(0, 0, 390, 600);
			
			square.width = 1
			square.x = 0
			
			square.height = 1;
			square.y = 300;
			
			Tweener.addTween(square, {height:600, time:.4, y:0, transition:"easeoutquad"});
			Tweener.addTween(square, {width:390, time:.4, x:0, delay:.4, transition:"easeoutquad"});
			
			addChild(square)						
			
		}

	
	
	
	
	}
}