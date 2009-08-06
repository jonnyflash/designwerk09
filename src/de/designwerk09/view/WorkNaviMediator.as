package de.designwerk09.view
{
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.model.SubMenuVO;
	import de.designwerk09.model.XMLDataProxy;
	import de.designwerk09.view.components.events.NaviEvent;
	import de.designwerk09.view.components.submenu.NumberMenu;
	import de.designwerk09.view.components.submenu.WorkNaviText;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import caurina.transitions.Tweener;
	
	
	public class WorkNaviMediator extends Mediator implements IMediator
	{
		
		public static const NAME:String = "WorkNaviMediator";
		
		private var _data:Object;
		
		private var numberMenu:NumberMenu;
		private var worktxt:WorkNaviText;
		
		private var _aktMainMenu:int;
		private var _aktSubMenu:int;
		private var _aktSubNumberMenu:int;
		private var _aktWorkNavi:int;
		private var vo:SubMenuVO;
		
		public function WorkNaviMediator( viewComponent:Object )
    	{
    		trace("Startup WorkNaviMediator")
      		super( NAME, viewComponent );
    	}

		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.SHOW_START,
					  ApplicationFacade.MAINMENU_CHANGED,
					  ApplicationFacade.CHANGE_SUBMENU,
					  ApplicationFacade.CHANGE_SUBNUMBERNAVI,
					  ApplicationFacade.CHANGE_WORKNAVI,
					  ApplicationFacade.STAGE_RESIZE
					];
		}




		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.SHOW_START:
					initializeView()
				break;

				case ApplicationFacade.MAINMENU_CHANGED:
					var aktMainMenu:int = note.getBody() as int;
					_aktMainMenu = aktMainMenu
					changeMainMenuPoint();
				break;

				case ApplicationFacade.CHANGE_SUBMENU:
					var aktSubMenu:int = note.getBody() as int;
					_aktSubMenu = aktSubMenu;
					changeSubMenuPoint()
				break;

				case ApplicationFacade.CHANGE_SUBNUMBERNAVI:
					var aktSubNumberMenu:int = note.getBody() as int;
					_aktSubNumberMenu = aktSubNumberMenu;
					createNavi();
					changeSubNumberNaviPoint()
				break;
				
				case ApplicationFacade.CHANGE_WORKNAVI:
					var aktWorkNavi:int = note.getBody() as int;
					_aktWorkNavi = aktWorkNavi;
					changeWorkNaviPoint()
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
			createNavi()
		}
		
		
		
		
		private function createNavi():void{
			if(numberMenu && worktxt){
				stage.removeChild(numberMenu);
				stage.removeChild(worktxt);
			}

			vo = _data[_aktSubMenu];
			numberMenu = new NumberMenu(vo.work.content[_aktSubNumberMenu].img);
			numberMenu.addEventListener(NaviEvent.NAVI_PRESSED, click)			
			numberMenu.alpha = 0; 	
			stage.addChild(numberMenu);
			
			var _worktxt:String = vo.work.description[_aktSubNumberMenu]
			worktxt = new WorkNaviText(_worktxt,"LucidaSans", 10);
			worktxt.alpha = 0;
			stage.addChild(worktxt)

		}
		
		
		
		
		
		private function click(e:NaviEvent):void{
			sendNotification(ApplicationFacade.CHANGE_WORKNAVI, e.id);
		}
		



		private function changeMainMenuPoint():void{
			if(numberMenu){
				numberMenu.alpha = 0;
				worktxt.alpha = 0;
			}
		}
		
		
		private function changeSubMenuPoint():void{
				numberMenu.visible = false;
				worktxt.visible = false;
		}
		
		
		
		private function changeSubNumberNaviPoint():void{

				if (_aktSubNumberMenu > -1){
					
				sendNotification(ApplicationFacade.CHANGE_WORKNAVI, 0);	
				
				Tweener.addTween(numberMenu, {alpha:1, time:.5, delay:.4, transition:"easeoutquad", onStart:function():void
																									{ 
																										numberMenu.visible = true;
																										numberMenu.alpha = 0;
																									}
																									
																								});
																								
				Tweener.addTween(worktxt, {alpha:1, time:.5, delay:.2, transition:"easeoutquad", onStart:function():void
																									{ 
																										worktxt.visible = true;
																										worktxt.alpha = 0;
																									}
																									
																								});

				
				}else{
				Tweener.addTween(numberMenu, {alpha:0, time:.2, delay:0, transition:"easeoutquad", onComplete:function():void
																									{ 
																										numberMenu.visible = false;
																									}
																									
																								});
																								
				Tweener.addTween(worktxt, {alpha:0, time:.2, delay:0, transition:"easeoutquad", 	onComplete:function():void
																									{ 
																										worktxt.visible = false;
																									}
																									
																								});	

				}
		}
	
	
	

	
	
	
	
		
		
		private function changeWorkNaviPoint():void{
		//	trace("-----------------akt position-------------------")
		//	trace("_aktMainMenu: "+_aktMainMenu)
		//	trace("_aktSubMenu: "+_aktSubMenu)
		//	trace("_aktSubNumberMenu: "+_aktSubNumberMenu)
		//	trace("_aktWorkNavi: "+_aktWorkNavi)
		//	trace("imgurl: "+vo.work.content[_aktSubNumberMenu].img[_aktWorkNavi].@url)
			
			numberMenu.aktSubPoint = _aktWorkNavi;
			var imgurl:String = vo.work.content[_aktSubNumberMenu].img[_aktWorkNavi].@url;
			sendNotification(ApplicationFacade.CHANGE_RIGHTBOX, imgurl);
			
		}





		private function resize(posis:Object):void{
			if (numberMenu && worktxt){
				worktxt.x = posis.x + 20;
				worktxt.y = posis.y + 530 - Math.round(worktxt.height);
				numberMenu.x = posis.x + 20;
				numberMenu.y = posis.y + 540;	
			}

		}



		
		
		
		

        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }



	}
}