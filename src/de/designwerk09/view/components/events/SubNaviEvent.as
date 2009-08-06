package de.designwerk09.view.components.events
{
	import flash.events.Event;

	public class SubNaviEvent extends Event
	{
		public static const SUBNAVI_PRESSED:String = "subnavi_pressed";
		
		
		public var name:String;
		
		public function SubNaviEvent(type:String, name:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.name = name;
		}
		
	}
}