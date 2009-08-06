package de.designwerk09.view
{
	
	
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.model.UberUnsVO;
	import de.designwerk09.view.assets.AssetManager;
	import de.designwerk09.view.components.events.NaviEvent;
	import de.designwerk09.view.components.submenu.WorkNaviText;
	import de.designwerk09.view.components.uberuns.UberUnsMenu;
	
	import flash.display.Stage;
	import flash.text.*;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;	
	
	import caurina.transitions.Tweener;
	
	public class UberUnsMediator extends Mediator implements IMediator 
	{
		
		
		
		
		
		
		public static const NAME:String = "UberUnsMediator";
		private var _uberUnsVO:UberUnsVO;
		private var description:WorkNaviText;
		
		private var label:TextField = new TextField()
		private var format:TextFormat = new TextFormat()
		private var fonts:AssetManager = new AssetManager()	
		private	var uberuns:UberUnsMenu;
		private var _aktPerson:int
		
		public function UberUnsMediator( viewComponent:Object )
    	{
    		trace("Startup UberUnsMediator")
      		super( NAME, viewComponent );
    	}
		


		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.UBERUNS_DATALOADED,
					  ApplicationFacade.STAGE_RESIZE,
					  ApplicationFacade.MAINMENU_CHANGED,
					  ApplicationFacade.CHANGE_UBERUNS
					];
		}
		
		
		
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.UBERUNS_DATALOADED:
					_uberUnsVO = note.getBody() as UberUnsVO;
					init();
				break;

				case ApplicationFacade.MAINMENU_CHANGED:
					var aktMenu:int = note.getBody() as int;
					changeMenuPoint(aktMenu);
				break;

				case ApplicationFacade.STAGE_RESIZE:
					var posi:Object = note.getBody() as Object;
					if (posi != null){resize(posi)}
				break;

				case ApplicationFacade.CHANGE_UBERUNS:
					var aktPerson:int = note.getBody() as int;
					_aktPerson = aktPerson;
					changeAktPerson()
				break;

			}
		}
		




		private function init():void
		{
			trace("UberUnsMediator")
			addDescription()
			addPerson()
		}



		private function addDescription():void
		{
			var _description:String = _uberUnsVO.description;

			description = new WorkNaviText(_description,"LucidaSans", 10);
			description.visible = false;	
			stage.addChild(description)
		}





		private function addPerson():void
		{
			uberuns = new UberUnsMenu(_uberUnsVO);
			uberuns.visible = false;		
			stage.addChild(uberuns)
		}







		private function resize(posis:Object):void{
			if (description&& uberuns){
				
				description.x = posis.x + 20;
				description.y = posis.y + 208;
				
				uberuns.x = posis.x + 20;
				uberuns.y = posis.y + 320;
			}
		}
		
		
		
		
		private function changeMenuPoint(aktMenu:int):void{
			if (aktMenu == 0){
			
			
				sendNotification(ApplicationFacade.CHANGE_RIGHTBOX, _uberUnsVO.startscreen);
				
				
				Tweener.addTween(description, {alpha:1, time:.5, delay:.2, transition:"easeoutquad", onStart:function():void
																									{ 
																										description.visible = true;
																										description.alpha = 0;
																									}
																									
																								});
																								
				Tweener.addTween(uberuns, {alpha:1, time:.5, delay:.4, transition:"easeoutquad", onStart:function():void
																									{ 
																										uberuns.visible = true;
																										uberuns.alpha = 0;
																									}
																									
																								});
																								
				uberuns.addEventListener(NaviEvent.NAVI_PRESSED, click)	
				
			}else{
				
				Tweener.addTween(description, {alpha:0, time:.2, delay:0, transition:"easeoutquad", onComplete:function():void
																									{ 
																										description.visible = false;
																									}
																									
																								});
																								
				Tweener.addTween(uberuns, {alpha:0, time:.2, delay:0, transition:"easeoutquad", 	onComplete:function():void
																									{ 
																										uberuns.visible = false;
																										uberuns.aktSubPoint = -1;
																									}
																									
																								});				


			}
		}

		
				
		private function click(e:NaviEvent):void{
			sendNotification(ApplicationFacade.CHANGE_UBERUNS, e.id);
			var imgurl:String = _uberUnsVO.person.img[e.id].@url;
			sendNotification(ApplicationFacade.CHANGE_RIGHTBOX, imgurl);			
		}
		
		
		private function changeAktPerson():void{
			uberuns.aktSubPoint = _aktPerson;
		}
		
		
		
		
		
		

        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }	
		




	}
}