package de.designwerk09
{	
	import de.designwerk09.controller.*;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
    
	public class ApplicationFacade extends Facade implements IFacade {


		public static const STARTUP:String = "startup";
		public static const XML_DATA_LOADED:String = "xmlloaded"
		public static const SHOW_START:String = "show_start";
		
		public static const STAGE_RESIZE:String = "stage_resize"
		
		public static const BEISPIELE_STARTSCREEN:String = "beispiele_startscreen"		

		public static const CHANGE_MAINMENU:String = "change_mainmenu"
		public static const MAINMENU_CHANGED:String = "mainmenu_changed"
		
		public static const CHANGE_SUBMENU:String = "change_submenu"
		public static const SUBMENU_CHANGED:String = "submenu_changed"

		public static const CHANGE_SUBNUMBERNAVI:String = "change_subnumbernavi"
		public static const SUBNUMBERNAVI_CHANGED:String = "subnumbernavi_changed"

		public static const CHANGE_WORKNAVI:String = "change_worknavi"
		public static const WORKNAVI_CHANGED:String = "worknavi_changed"

		public static const CHANGE_RIGHTBOX:String = "change_rightbox"
		public static const RIGHTBOX_CHANGED:String = "rightbox_changed"

		public static const UBERUNS_DATALOADED:String = "uberuns_dataloaded"
		public static const CHANGE_UBERUNS:String = "change_uberuns"
		public static const UBERUNS_CHANGED:String = "uberuns_changed"

		public static const KONTAKT_DATALOADED:String = "kontakt_dataloaded"
		public static const CHANGE_KONTAKT:String = "change_kontakt"
		public static const KONTAKT_CHANGED:String = "kontakt_changed"

		public static const OPEN:String = "open"
		public static const PROGRESS:String = "progress"
		public static const SECURITY:String = "securityError"
		public static const HTTPSTATUS:String = "httpStatus"
		public static const IOERROR:String = "ioError"
		
		
		public static const ADDRESS_CHANGE:String = "address_change"
		
		
		
		public static function getInstance():ApplicationFacade {
			if (instance == null) instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		

        // Broadcast the STARTUP Notification
        public function startup(app:Object):void {
            notifyObservers(new Notification(STARTUP, app));
        }



		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
			
			registerCommand(CHANGE_MAINMENU, ChangeMainMenuCommand);
			registerCommand(CHANGE_SUBMENU, ChangeSubMenuCommand);
			registerCommand(CHANGE_SUBNUMBERNAVI, ChangeSubNumberMenuCommand);
			registerCommand(CHANGE_WORKNAVI, WorkNaviCommand);
			registerCommand(CHANGE_RIGHTBOX, RightboxCommand);
			
			registerCommand(CHANGE_UBERUNS, UberUnsCommand);
			
			registerCommand(CHANGE_KONTAKT, KontaktCommand);		
		}
		
		
		
		
		
		

	}
}







