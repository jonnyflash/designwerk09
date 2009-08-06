package de.designwerk09.model
{
  import de.designwerk09.ApplicationFacade;
  import flash.display.Stage;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import org.puremvc.as3.interfaces.IProxy;
  import org.puremvc.as3.patterns.proxy.Proxy;




  public class ResizeProxy extends Proxy implements IProxy{
  	
  	public static const NAME:String = "ResizeProxy";
  	
    private var _stage:Stage;
   	private var posi:Object = new Object();
    
    public function ResizeProxy(newStage:Stage){
      super(NAME);
      _stage = newStage;
      _stage.addEventListener(Event.RESIZE, _onStageResize, false, 0, true);
      _stage.addEventListener(Event.ADDED, _onStageResize, false, 0, true);
    }
 
    public function get stageWidth():Number {
      return _stage.stageWidth;
    }
 
    public function get stageHeight():Number {
      return _stage.stageHeight;
    }
 
    private function _onStageResize(event:Event):void {
   	
 		posi.x = Math.round(_stage.stageWidth/2 - 390);
		posi.y = Math.round(_stage.stageHeight/2 - 600/2);
		facade.sendNotification(ApplicationFacade.STAGE_RESIZE, posi);
    }
    
    
    
    
    
    
    
  }
}