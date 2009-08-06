package de.designwerk09.controller
{
	
	import de.designwerk09.model.*;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;	
	
	
	public class KontaktCommand extends SimpleCommand implements ICommand
	{
		
		
		
		
		override public function execute(notification:INotification):void {
			var menuStatus:KontaktProxy = facade.retrieveProxy(KontaktProxy.NAME) as KontaktProxy;
			var status:String = notification.getBody() as String;
			if (menuStatus.status != status){
				menuStatus.menustatus =  status;
			}
			
		}
		

		
		
		

	}
}