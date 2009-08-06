package de.designwerk09.view
{
	
	
	import de.designwerk09.ApplicationFacade;
	import de.designwerk09.view.assets.Rightbox_background;
	import de.designwerk09.view.components.contentView.ImageView;
	import de.designwerk09.view.components.events.ImageEvent;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;	
	
	
	
	
	public class RightboxMediator extends Mediator implements IMediator 
	{
		
		private var right_bg:Rightbox_background = new Rightbox_background();
		private var imageview:ImageView;
		
		private var _imgurl:String;
		private var imagecontainer:Array = new Array(1)
		
		public static const NAME:String = "RightboxMediator";
		
		
		
		
		
		public function RightboxMediator( viewComponent:Object )
    	{
    		trace("Startup RightboxMediator")
      		super( NAME, viewComponent );
    	}
		


		
		
		override public function listNotificationInterests():Array {
			return [
					  ApplicationFacade.SHOW_START,
					  ApplicationFacade.STAGE_RESIZE,
					  ApplicationFacade.RIGHTBOX_CHANGED
					];
		}
		
		
		
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				
				case ApplicationFacade.SHOW_START:
					init();
				break;

				case ApplicationFacade.RIGHTBOX_CHANGED:
					_imgurl = note.getBody() as String;
					updateImage()
				break;

				case ApplicationFacade.STAGE_RESIZE:
					var posi:Object = note.getBody() as Object;
					if (posi != null){resize(posi)}
				break;
				
			}
		}
		
		
		
		private function init():void
		{
			imageview = new ImageView();	
			imageview.addEventListener(ImageEvent.IMAGE_LOADED, imageloaded)
			stage.addChild(right_bg);
			stage.addChild(imageview)
			
			
		}
		

		private function updateImage():void{
			imageview.image = _imgurl
		}



		private function imageloaded(e:ImageEvent):void{
			trace("imageloaded")
		}




		private function resize(posis:Object):void{
			if (imageview && right_bg){
				imageview.x = posis.x + right_bg.width + 16;
				imageview.y = posis.y;
				
				right_bg.x = posis.x + 390 + 16;
				right_bg.y = posis.y;				
			}
		}
		
		
		
		

        protected function get stage():Stage
        {
            return viewComponent as Stage;
        }	
		
		
		
		
		

	}
}