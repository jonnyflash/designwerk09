package de.designwerk09.model
{
	import de.designwerk09.ApplicationFacade;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	
	
	
	public class MainMenuStatusProxy extends Proxy implements IProxy 
	{
		
		
		
		public static const NAME:String = 'MainMenuStatusProxy';
		
		private var lastKeyPressed:int = -1;
		

		public function MainMenuStatusProxy(data:Object = null)
		{
			super(NAME, data); // pass the cannonical name to the superclass
		}
		
        public function get status():int {
			 return lastKeyPressed
        }	
		
		
        public function set menustatus(id:int):void {
            if (lastKeyPressed != id) {
                lastKeyPressed = id;
                sendNotification(ApplicationFacade.MAINMENU_CHANGED, id);
            }
        }

		
		
		

	}
}