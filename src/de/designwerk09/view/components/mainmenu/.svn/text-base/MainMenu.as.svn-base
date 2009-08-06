package de.designwerk09.view.components.mainmenu
{
	
	import de.designwerk09.view.components.buttons.MainMenuTextButton;
		import caurina.transitions.Tweener;
	import flash.display.Sprite;
	
	
	public class MainMenu extends Sprite
	{
		
		
		
		
		private var _aktMenu:int;
		
		private var uber_uns:MainMenuTextButton = new MainMenuTextButton("ÜBER UNS", "uber_uns","DINBlack", 24, 0);
		private var beispiele:MainMenuTextButton = new MainMenuTextButton("ARBEITEN", "beispiele","DINBlack", 24, 1);
		private var kontakt:MainMenuTextButton = new MainMenuTextButton("KONTAKT", "kontakt","DINBlack", 24, 2);
		
		public function MainMenu()
		{
			init();
		}





		private function init():void{
			
			addChild(uber_uns)
			uber_uns.alpha = 0;
			Tweener.addTween(uber_uns, {alpha:1, time:.5, delay:1.1, transition:"easeoutquad"});
			
			beispiele.y = 24;
			addChild(beispiele)
			beispiele.alpha = 0
			Tweener.addTween(beispiele, {alpha:1, time:.5, delay:1.2, transition:"easeoutquad"});
			
			
			kontakt.y = 48;
			addChild(kontakt)
			kontakt.alpha = 0;
			Tweener.addTween(kontakt, {alpha:1, time:.5, delay:1.3, transition:"easeoutquad"});
			
		}




		public function set aktMenuPoint(aktMenu:int):void{
			_aktMenu = aktMenu;
			changeMenu()
		}



		public function changeMenu():void
		{
			switch (_aktMenu) {
				case 0:
					uber_uns.aktiv = true
					beispiele.aktiv = false
					kontakt.aktiv = false
					trace("ÜBER UNS")
					break;
				case 1:
					uber_uns.aktiv = false
					beispiele.aktiv = true
					kontakt.aktiv = false
					trace("BEISPIELE")
					break;
				case 2:
					uber_uns.aktiv = false
					beispiele.aktiv = false
					kontakt.aktiv = true
					trace("KONTAKT")
					break;
			}			
		}




	}
}