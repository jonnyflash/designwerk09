package de.designwerk09.controller
{
	
	import de.designwerk09.model.*;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;	
	
	
	public class UberUnsCommand extends SimpleCommand implements ICommand
	{
		
		
		
		
		override public function execute(notification:INotification):void {
			var menuStatus:UberUnsStatusProxy = facade.retrieveProxy(UberUnsStatusProxy.NAME) as UberUnsStatusProxy;
			var status:int = notification.getBody() as int;
			if (menuStatus.status != status){
				menuStatus.menustatus =  status;
			}
			
		}
		
		
		
		

	}
}