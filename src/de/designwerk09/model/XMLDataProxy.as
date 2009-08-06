package de.designwerk09.model
{
	import de.designwerk09.ApplicationFacade;
	
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	import flash.xml.*;


	public class XMLDataProxy extends Proxy implements IProxy {
	{
		
		public static const NAME:String = "XMLDataProxy";		

		private var podcastURL:String = "content.xml"
		public var podcastXML:XML;
		private var podcastRequest:URLRequest;
		private var podcastLoader:URLLoader;
		
		private var _xml:XML;
		
		
		
		public function XMLDataProxy(data:Object = null)
		{
			trace("StartupProxy")
			super(NAME, data);
			
			setupLoader();
			configureListeners();
			
		}

		

		
		private function setupLoader():void
		{
			podcastLoader = new URLLoader();
            podcastRequest = new URLRequest(podcastURL);
            
            try {
                podcastLoader.load(podcastRequest);
            } catch (error:Error) {
                trace("Unable to load requested document.");
            }

			
		}
		
		
		private function configureListeners():void
		{
			podcastLoader.addEventListener(Event.COMPLETE, completeHandler);
            podcastLoader.addEventListener(Event.OPEN, openHandler);
            podcastLoader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            podcastLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            podcastLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            podcastLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}
		
		
		
		
		

        private function openHandler(event:Event):void {
         //  trace("openHandler: " + event);
           sendNotification(ApplicationFacade.OPEN, event);
        }

        private function progressHandler(event:ProgressEvent):void {
         //  trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
           sendNotification(ApplicationFacade.PROGRESS, event);
        }

        private function securityErrorHandler(event:SecurityErrorEvent):void {
         //   trace("securityErrorHandler: " + event);
            sendNotification(ApplicationFacade.SECURITY, event);
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void {
         //  trace("httpStatusHandler: " + event);
         sendNotification(ApplicationFacade.HTTPSTATUS, event);
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
        //	trace("ioErrorHandler: " + event);
            sendNotification(ApplicationFacade.IOERROR, event);
        }



		private function completeHandler(event:Event):void 
		{			
			_xml = new XML( event.target.data );
			_xml.ignoreWhitespace = true;
			
			loadBeispielData()
			loadUberunsData()
			kontaktData()
			beispieleStartScreens()
		}
			
			
			
			
			
			
			private function loadBeispielData():void
			{
				var beispiele:Array = new Array();
				
				for ( var i:uint=0; i<_xml..beispiele.item.length(); i++ ){
					var id:int = i;
					var title:String = _xml..beispiele.item[i].title.text();
					var startscreen:String = _xml..beispiele.item[i].startscreen.@url;
					var work:XMLList = _xml..beispiele.item[i].work;
					var subMenuItems:SubMenuVO = new SubMenuVO(id,title,startscreen,work)
					beispiele.push( subMenuItems );
				}
				data = beispiele;
				sendNotification( ApplicationFacade.XML_DATA_LOADED, data);	
			}
			



			private function loadUberunsData():void
			{
				var description:String = _xml..uberuns.description.text();
				var startscreen:String = _xml..uberuns.startscreen.@url;
				var person:XMLList = _xml..uberuns.person;

				var uberuns:UberUnsVO = new UberUnsVO(description,startscreen,person)
				
				sendNotification( ApplicationFacade.UBERUNS_DATALOADED, uberuns);
			}





			private function kontaktData():void
			{
				var description:String = _xml..kontakt.description.text();
				var startscreen:String = _xml..kontakt.startscreen.@url;

				var konatktvo:KontaktVO = new KontaktVO(description, startscreen)
				
				sendNotification( ApplicationFacade.KONTAKT_DATALOADED, konatktvo);
			}		
			
			
			private function beispieleStartScreens():void
			{
				var beispieleSS:String = _xml..beispiele.startscreen.@url;;
				sendNotification( ApplicationFacade.BEISPIELE_STARTSCREEN, beispieleSS);
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}
	}
}