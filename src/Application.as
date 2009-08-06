package {
	import de.designwerk09.ApplicationFacade;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.*;

	[SWF(frameRate="30", backgroundColor="0x777777")]

       // ist schon ganz toll





	public class Application extends Sprite
	{
		
		private var facade:ApplicationFacade = ApplicationFacade.getInstance();
		
		
		
		public function Application()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
     		stage.align = StageAlign.TOP_LEFT;
			
			facade.startup( this.stage );
			trace("OpenSourceCode -> http://ffaerber.googlecode.com/svn/trunk/ffaerber09/")
			trace("coded by Felix Faerber")
			trace("thanks to: pureMVC.org and http://code.google.com/p/tweener/ ")				
		}
	
		
		
	}
}
