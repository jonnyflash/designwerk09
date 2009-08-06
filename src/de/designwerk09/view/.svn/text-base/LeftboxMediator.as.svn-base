package de.designwerk09.view
{
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.view.assets.DWlogo;
	import de.designwerk09.view.assets.Leftbox_background;
	import de.designwerk09.view.components.events.MainNaviEvent;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import caurina.transitions.Tweener;
	
	public class LeftboxMediator extends Mediator implements IMediator 
	{
		
		
		private var left_bg:Leftbox_background = new Leftbox_background()
		private var logo:DWlogo = new DWlogo()
		
		
		public static const NAME:String = "LeftboxMediator";
		
		
		
		
		public function LeftboxMediator( viewComponent:Object )
    	{
    		trace("Startup LeftboxMediator")
      		super( NAME, viewComponent );
    	}
		
		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.SHOW_START,
					  ApplicationFacade.STAGE_RESIZE
					];
		}
		
		
		
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.SHOW_START:
					init();
				case ApplicationFacade.STAGE_RESIZE:
					var posi:Object = note.getBody() as Object;
					if (posi != null){resize(posi)}
				break;
				
			}
		}
		
		
		
		private function init():void
		{
			logo.x = 20;
			logo.y = 20;
			left_bg.addChild(logo);
			logo.alpha = 0;
			Tweener.addTween(logo, {alpha:1, time:.5, delay:.8, transition:"easeoutquad"});
			       
			stage.addChild(left_bg);
		//	left_bg.addEventListener(Event.ADDED_TO_STAGE, posi)
		}
		
		

		
		private function resize(posis:Object):void{
			left_bg.x = posis.x;
			left_bg.y = posis.y;
		}
		
  		private function onNavButtonPressed( e:MainNaviEvent ):void
 		{
 			sendNotification(ApplicationFacade.CHANGE_MAINMENU, e.name);
 		}
 		
 		
 		
 		
 		
 		
 		
 		
 		
        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }

	}
}