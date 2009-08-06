package de.designwerk09.view
{
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.model.SubMenuVO;
	import de.designwerk09.model.XMLDataProxy;
	import de.designwerk09.view.components.events.NaviEvent;
	import de.designwerk09.view.components.submenu.NumberMenu;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.text.TextField;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	
	
	
	
	public class SubNumberNaviMediator extends Mediator implements IMediator
	{
		
		public static const NAME:String = "SubNumberNaviMediator";
		private var subNumberNavi:NumberMenu;
		private var _aktSubMenu:int;
		private var _work:XMLList;
		private var _workLength:int;
		private var _numbernaviContainer:Array = new Array()
		private var _numbernaviXPosiContainer:Array = new Array()
		private	var navis:Sprite = new Sprite()
		
		public function SubNumberNaviMediator( viewComponent:Object )
    	{
    		trace("Startup SubMenuMediator")
      		super( NAME, viewComponent );
    	}
		
		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.SHOW_START,
					  ApplicationFacade.MAINMENU_CHANGED,
					  ApplicationFacade.CHANGE_SUBMENU,
					  ApplicationFacade.CHANGE_SUBNUMBERNAVI,
					  ApplicationFacade.STAGE_RESIZE
					];
		}
		
		


		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.SHOW_START:
					initializeView()
				break;
				
				case ApplicationFacade.MAINMENU_CHANGED:
					var aktMenu:int = note.getBody() as int;
					changeMenuPoint(aktMenu);
				break;
				
				case ApplicationFacade.CHANGE_SUBMENU:
					var aktSubMenu:int = note.getBody() as int;
					_aktSubMenu = aktSubMenu;
					changeSubMenuPoint(aktSubMenu);
				break;

				case ApplicationFacade.CHANGE_SUBNUMBERNAVI:
					var aktSubNumberMenu:int = note.getBody() as int;
					changeSubNumberNaviPoint(aktSubNumberMenu);
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
			var _data:Object = _xMLDataProxy.getData();

			
			for (var i:int=0; i<5; i++){
				var vo:SubMenuVO = _data[i];
				subNumberNavi = new NumberMenu(vo.work);			 	
			 	subNumberNavi.y = 18*i

			 	subNumberNavi.x = 90;
			 	subNumberNavi.alpha = 0;
			 	_numbernaviContainer[i] = subNumberNavi;
			 	navis.addChild(subNumberNavi);

				stage.addChild(navis);
			}
			navis.alpha = 0;
		}
		
		
		
		private function resize(posis:Object):void{
			if (navis){
				navis.x = posis.x + 30;
				navis.y = posis.y + 208;	
			}

		}
		
		
		private function changeMenuPoint(aktMenu:int):void{
			if (aktMenu == 1){
				navis.alpha = 1
			}else{
				navis.alpha = 0;
				changeSubMenuPoint(-1);
				changeSubNumberNaviPoint(-1)			
			}
		}
		
		
		
		
		private function click(e:NaviEvent):void{
			sendNotification(ApplicationFacade.CHANGE_SUBNUMBERNAVI, e.id);
		}
		
		
		
		private function changeSubMenuPoint(aktSubMenu:int):void{
			for (var i:int=0; i<5; i++){
				var numberMenu:NumberMenu = _numbernaviContainer[i]				
				if(i == aktSubMenu){
					numberMenu.alpha = 1;
					numberMenu.addEventListener(NaviEvent.NAVI_PRESSED, click)
				}else{
					numberMenu.alpha = 0;
					numberMenu.removeEventListener(NaviEvent.NAVI_PRESSED, click)
					numberMenu.aktSubPoint = -1;
				}
			}
		}

			
			
			
			
	
		
		private function changeSubNumberNaviPoint(aktSubNumberMenu:int):void{
			var numberMenu:NumberMenu = _numbernaviContainer[_aktSubMenu]	
			numberMenu.aktSubPoint = aktSubNumberMenu;
		}










        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }
        
        
        
        
        	
		

	}
}