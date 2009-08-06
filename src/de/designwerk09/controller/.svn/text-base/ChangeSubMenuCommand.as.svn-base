package de.designwerk09.controller
{
	
	import de.designwerk09.model.*;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;	
	
	
	public class ChangeSubMenuCommand extends SimpleCommand implements ICommand
	{
		
		
		
		
		override public function execute(notification:INotification):void {
			
			var subMenu:SubMenuStatusProxy = facade.retrieveProxy(SubMenuStatusProxy.NAME) as SubMenuStatusProxy;
			var subMenustatus:int = notification.getBody() as int;
			if (subMenu.status === subMenustatus){
				trace("ist schon aktiv")
			}else{
				subMenu.menustatus =  subMenustatus;
			}


			
			
		}
		

		
		
		

	}
}