package de.designwerk09.view.components.events
{
	import flash.events.Event;

	public class NaviEvent extends Event
	{
		public static const NAVI_PRESSED:String = "navi_pressed";
		
		
		public var id:int;
		
		public function NaviEvent(type:String, id:int, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.id = id;
		}
		
	}
}