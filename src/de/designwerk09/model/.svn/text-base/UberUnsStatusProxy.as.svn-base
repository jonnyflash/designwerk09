package de.designwerk09.model
{
	import de.designwerk09.ApplicationFacade;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	
	
	
	public class UberUnsStatusProxy extends Proxy implements IProxy 
	{
		
		
		
		public static const NAME:String = 'UberUnsStatusProxy';
		
		private var lastKeyPressed:int;
		

		public function UberUnsStatusProxy(data:Object = null)
		{
			super(NAME, data); // pass the cannonical name to the superclass
		}
		
        public function get status():int {
			 return lastKeyPressed
        }	
		
		
        public function set menustatus(name:int):void {
            if (lastKeyPressed != name) {
                lastKeyPressed = name;
                sendNotification(ApplicationFacade.UBERUNS_CHANGED, name);
            }
        }

		
		
		

	}
}