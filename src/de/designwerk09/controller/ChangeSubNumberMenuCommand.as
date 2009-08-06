package de.designwerk09.controller
{
	
	import de.designwerk09.model.*;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;	
	
	
	public class ChangeSubNumberMenuCommand extends SimpleCommand implements ICommand
	{
		
		
		
		
		override public function execute(notification:INotification):void {
			var menuStatus:SubMenuNumberStatusProxy = facade.retrieveProxy(SubMenuNumberStatusProxy.NAME) as SubMenuNumberStatusProxy;
			var status:int = notification.getBody() as int;
			if (menuStatus.status != status){
				menuStatus.menustatus =  status;
			}
			trace("ChangeSubNumberMenuCommand: "+status)
			
		}
		

		
		
		

	}
}