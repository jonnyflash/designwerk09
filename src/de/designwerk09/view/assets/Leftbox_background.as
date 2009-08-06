package de.designwerk09.view.assets
{
	import caurina.transitions.Tweener;
	import flash.display.Sprite;
	
	public class Leftbox_background extends Sprite
	{
		public function Leftbox_background()
		{
			
			var square:Sprite = new Sprite();
			
			square.graphics.beginFill(0x82B515);
			square.graphics.drawRect(0, 0, 390, 600);
			
			square.width = 1
			square.x = 390
			
			square.height = 1;
			square.y = 300;

			Tweener.addTween(square, {height:600, time:.4, y:0, transition:"easeoutquad"});
			Tweener.addTween(square, {width:390, time:.4, x:0, delay:.4, transition:"easeoutquad"});
			
			addChild(square)
		}

	}
}