package de.designwerk09.view
{
	
	
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.model.KontaktVO;
	import de.designwerk09.view.components.submenu.WorkNaviText;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;	

	import caurina.transitions.Tweener;
	
	
	public class KontaktMediator extends Mediator implements IMediator 
	{
		
		
		
		
		
		
		public static const NAME:String = "KontaktMediator";
		
		private var _uberUnsVO:KontaktVO
		private var description:WorkNaviText
		
		public function KontaktMediator( viewComponent:Object )
    	{
    		trace("Startup KontaktMediator")
      		super( NAME, viewComponent );
    	}
		


		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.MAINMENU_CHANGED,
					  ApplicationFacade.KONTAKT_DATALOADED,
					  ApplicationFacade.STAGE_RESIZE,
					  ApplicationFacade.RIGHTBOX_CHANGED
					];
		}
		
		
		
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.MAINMENU_CHANGED:
					var aktMenu:int = note.getBody() as int;
					changeMenuPoint(aktMenu);
				//	changeSubMenuPoint(-1)
				break;				
				
				case ApplicationFacade.KONTAKT_DATALOADED:
					_uberUnsVO = note.getBody() as KontaktVO;
					addDescription();
				break;

				case ApplicationFacade.STAGE_RESIZE:
					var posi:Object = note.getBody() as Object;
					if (posi != null){resize(posi)}
				break;
				
			}
		}
		







		private function addDescription():void
		{
			var _description:String = _uberUnsVO.description;
			description = new WorkNaviText(_description,"LucidaSans", 10);
			description.visible = false;
			stage.addChild(description)
		}





		private function changeMenuPoint(aktMenu:int):void{
			if (aktMenu == 2){
			
			
				sendNotification(ApplicationFacade.CHANGE_RIGHTBOX, _uberUnsVO.startscreen);
				
				
				
				Tweener.addTween(description, {alpha:1, time:.5, delay:.2, transition:"easeoutquad", onStart:function():void
																									{ 
																										description.visible = true;
																										description.alpha = 0;
																									}
																									
																								});
				
			}else{
				
				Tweener.addTween(description, {alpha:0, time:.2, delay:0, transition:"easeoutquad", onComplete:function():void
																									{ 
																										description.visible = false;
																									}
																									
																								});

			}
		}















		private function resize(posis:Object):void{
			if (description){
				description.x = posis.x + 20;
				description.y = posis.y + 208;
			}
		}
		
		
		
		

        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }	
		






	}
}