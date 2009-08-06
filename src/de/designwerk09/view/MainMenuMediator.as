package de.designwerk09.view
{
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.view.components.events.NaviEvent;
	import de.designwerk09.view.components.mainmenu.MainMenu;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import caurina.transitions.Tweener;
	
	public class MainMenuMediator extends Mediator implements IMediator  
	{
		
		
		public static const NAME:String = "MainMenuMediator";
		
		private var mainmenu:MainMenu = new MainMenu();
		
		
		public function MainMenuMediator( viewComponent:Object )
		{
      		super( NAME, viewComponent );
		}




		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.SHOW_START,
					  ApplicationFacade.MAINMENU_CHANGED,
					  ApplicationFacade.STAGE_RESIZE
					];
		}
		
		
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {

				case ApplicationFacade.SHOW_START:
					init();
					break;
				
				case ApplicationFacade.STAGE_RESIZE:
					var posi:Object = note.getBody() as Object;
					if (posi != null){resize(posi)};
					break;
					
				case ApplicationFacade.MAINMENU_CHANGED:
					var aktMenu:int = note.getBody() as int;
					changeMenuPoint(aktMenu);	
					break;
				
			}
		}
		
		
		
		
		private function init():void
		{
			stage.addChild(mainmenu)
			mainmenu.addEventListener(NaviEvent.NAVI_PRESSED, click)
			
			Tweener.addTween(this, {delay:2, onComplete:function():void{ 
						sendNotification(ApplicationFacade.RIGHTBOX_CHANGED,"images/startbilder/startbild_home.png");	
			}});

			
		}



		private function resize(posis:Object):void{
			mainmenu.x = posis.x + 20;
			mainmenu.y = posis.y + 45;
		}

		private function click(e:NaviEvent):void{
			//sendNotification(ApplicationFacade.ADDRESS_CHANGE, "eeee");
			sendNotification(ApplicationFacade.CHANGE_MAINMENU, e.id);
		}

		private function changeMenuPoint(aktMenu:int):void{
			mainmenu.aktMenuPoint = aktMenu;
		}





        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }	
        
        
        

	}
}