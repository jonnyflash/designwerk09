package de.designwerk09.view.components.events
{
	import flash.events.Event;

	public class ImageEvent extends Event
	{
		public static const IMAGE_LOADED:String = "image_loaded";
		
		
		
		public function ImageEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}