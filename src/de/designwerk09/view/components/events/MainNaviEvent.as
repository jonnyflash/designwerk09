package de.designwerk09.view.components.events
{
	import flash.events.Event;

	public class MainNaviEvent extends Event
	{
		public static const MAINNAVI_PRESSED:String = "mainnavi_pressed";
		
		
		public var name:String;
		
		public function MainNaviEvent(type:String, name:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.name = name;
		}
		
	}
}