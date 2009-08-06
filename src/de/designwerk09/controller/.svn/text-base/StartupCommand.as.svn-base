package de.designwerk09.controller
{
	
	import de.designwerk09.model.*;
	import de.designwerk09.view.StageMediator;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	
	
	public class StartupCommand extends SimpleCommand implements ICommand
	
	{
		
		override public function execute(notification:INotification):void {

			trace("StartupCommand")
			facade.registerProxy(new XMLDataProxy());
			
			//facade.registerProxy(new SWFAddressProxy());	
			
			facade.registerProxy(new MainMenuStatusProxy());	
			facade.registerProxy(new SubMenuStatusProxy());
			facade.registerProxy(new SubMenuNumberStatusProxy());
			facade.registerProxy(new WorkNaviProxy());	
			facade.registerProxy(new RightboxProxy());	
			
			facade.registerProxy(new UberUnsStatusProxy());	

			facade.registerProxy(new KontaktProxy());	
			
			var stage:Stage = notification.getBody() as Stage;
			facade.registerMediator( new StageMediator(stage));
			
			facade.registerProxy(new ResizeProxy(stage));
			
		}




	}
	
}