package de.designwerk09.model
{
	import de.designwerk09.ApplicationFacade;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	
	
	
	public class RightboxProxy extends Proxy implements IProxy 
	{
		
		
		
		public static const NAME:String = 'RightboxProxy';
		
		private var lastKeyPressed:String;
		

		public function RightboxProxy(data:Object = null)
		{
			super(NAME, data); // pass the cannonical name to the superclass
		}
		
        public function get status():String {
			 return lastKeyPressed
        }	
		
		
        public function set menustatus(name:String):void {
            if (lastKeyPressed != name) {
                lastKeyPressed = name;
                sendNotification(ApplicationFacade.RIGHTBOX_CHANGED, name);
            }
        }

		
		
		

	}
}