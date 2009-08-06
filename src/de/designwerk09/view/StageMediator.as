package de.designwerk09.view
{
	
	import de.designwerk09.ApplicationFacade;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	
	
	
	public class StageMediator extends Mediator implements IMediator {
		
		
		public static const NAME:String = "StageMediator";
		


		public function StageMediator( viewComponent:Object )
    	{
    		trace("Startup Stage")
      		super( NAME, viewComponent );
    	}


		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.XML_DATA_LOADED
					];
		}




		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.XML_DATA_LOADED:
					trace("case ApplicationFacade.XML_DATA_LOADED:")
					initializeView()
				break;


			}
		}






		private function initializeView():void
		{
			// registiere die Mediatoren
			facade.registerMediator( new LeftboxMediator( stage ) );
			facade.registerMediator( new RightboxMediator( stage ) );

			facade.registerMediator( new UberUnsMediator( stage ) );			
			facade.registerMediator( new KontaktMediator( stage ) );

			facade.registerMediator( new MainMenuMediator( stage ) );
			facade.registerMediator( new SubMenuMediator( stage ) );
			facade.registerMediator( new SubNumberNaviMediator( stage ) );
			facade.registerMediator( new WorkNaviMediator( stage ) );
			
			// und sende ein SHOW_START Notification
			sendNotification(ApplicationFacade.SHOW_START);		


		}






        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }
		





	}
}