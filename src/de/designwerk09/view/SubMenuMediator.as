package de.designwerk09.view
{
	import caurina.transitions.Tweener;
	
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.model.SubMenuVO;
	import de.designwerk09.model.XMLDataProxy;
	import de.designwerk09.view.components.events.NaviEvent;
	import de.designwerk09.view.components.submenu.SubMenu;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	
	
	public class SubMenuMediator extends Mediator implements IMediator
	{
		
		public static const NAME:String = "SubMenuMediator";
		private var submenu:SubMenu;
		private var _data:Object;
		private var submenuvo:SubMenuVO;
		private var _aktsubMenu:int;
		private var _beispieleStartscreen:String
		
		
		public function SubMenuMediator( viewComponent:Object )
    	{
    		trace("Startup SubMenuMediator")
      		super( NAME, viewComponent );
    	}
		
		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.SHOW_START,
					  ApplicationFacade.BEISPIELE_STARTSCREEN,
					  ApplicationFacade.MAINMENU_CHANGED,
					  ApplicationFacade.CHANGE_SUBMENU,
					  ApplicationFacade.STAGE_RESIZE
					];
		}
		
		


		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				
				
				
				case ApplicationFacade.SHOW_START:
					initializeView()
				break;
				
				case ApplicationFacade.BEISPIELE_STARTSCREEN:
					var beispieless:String = note.getBody() as String;
					_beispieleStartscreen = beispieless
				break;				
				
				
				case ApplicationFacade.MAINMENU_CHANGED:
					var aktMenu:int = note.getBody() as int;
					changeMenuPoint(aktMenu);
					changeSubMenuPoint(-1)
				break;
				
				case ApplicationFacade.CHANGE_SUBMENU:
					var aktSubMenu:int = note.getBody() as int;
					_aktsubMenu = aktSubMenu;
					changeSubMenuPoint(aktSubMenu);
				break;
						
				case ApplicationFacade.STAGE_RESIZE:
					var posi:Object = note.getBody() as Object;
					if (posi != null){resize(posi)};
				break;
					
			}
		}
		
		
		
		
		
		private function initializeView():void
		{
			var _xMLDataProxy:XMLDataProxy = facade.retrieveProxy( XMLDataProxy.NAME ) as XMLDataProxy;
			_data = _xMLDataProxy.getData();
			submenu = new SubMenu(_data);

			stage.addChild(submenu)
			submenu.alpha = 0;
			submenu.addEventListener(NaviEvent.NAVI_PRESSED, click)
		}
		
		
		
		private function resize(posis:Object):void{
			if (submenu){
				submenu.x = posis.x + 20;
				submenu.y = posis.y + 208;	
			}

		}
		
		
		private function changeMenuPoint(aktMenu:int):void{
			if (aktMenu == 1){
				Tweener.addTween(submenu, {alpha:1, time:.5, delay:.2, transition:"easeoutquad"});
				submenuvo = _data[_aktsubMenu];
				
				sendNotification(ApplicationFacade.CHANGE_RIGHTBOX, _beispieleStartscreen);
				
			}else{
				Tweener.addTween(submenu, {alpha:0, time:.2, delay:0, transition:"easeoutquad"});	
			}
		}
		
		
		
		
		private function click(e:NaviEvent):void{
			sendNotification(ApplicationFacade.CHANGE_SUBMENU, e.id);
		}
		
		
		
		private function changeSubMenuPoint(aktSubMenu:int):void{
			trace("changeSubMenuPoint: "+aktSubMenu)
			submenu.aktSubPoint = aktSubMenu;
			if (aktSubMenu > -1){
				submenuvo = _data[_aktsubMenu];
				sendNotification(ApplicationFacade.CHANGE_RIGHTBOX, submenuvo.startscreen);
			}
		}


        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }
        
        
        
        
        	
		

	}
}