package de.designwerk09.view.components.contentView
{
	
	import caurina.transitions.Tweener;
	
	import de.designwerk09.view.components.events.ImageEvent;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	
	public class ImageView extends Sprite
	{
		
		private var _url:String;
		
		private var _loader:Loader
		private var _urlRequest:URLRequest;

		private var firstImage:Bitmap;
		private var secondImage:Bitmap;
		
	//	private var _c1:Sprite

		public function ImageView()
		{
		//	addChild(_c1)
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);	
            _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

		}
		
		private function updateImage():void
		{

			_urlRequest = new URLRequest(_url);
			
			_loader.load(_urlRequest);
		}
		
		
		
        private function duplicateImage(original:Bitmap):Bitmap {
            var image:Bitmap = new Bitmap(original.bitmapData.clone());
            return image;
        }
		
		
		
		
		private function imageLoaded(event:Event):void{

            var loader:Loader = Loader(event.target.loader);
            
            // erstes Image
            firstImage = Bitmap(loader.content);
			firstImage.alpha = 0;

           	Tweener.addTween(firstImage, {alpha:1, time:.5, transition:"easeoutquad", onComplete:function():void{pushImage()}});
			
			dispatchEvent( new ImageEvent(ImageEvent.IMAGE_LOADED)); 	
			addChild(firstImage)			
		}
		
		
		
		
        private function pushImage():void {
        	
       		if (secondImage != null){
				removeChild(secondImage)
			}
				// zweites Image       
				firstImage.visible = false
																				
				secondImage = duplicateImage(firstImage);
				addChild(secondImage)
        }	
		
		
		
		
		
        private function ioErrorHandler(event:IOErrorEvent):void {
            trace("Unable to load image: " + _url);
        }








		
		public function set image(url:String):void{
			_url = url;
			updateImage()
		}
		
		
		
		

	}
}