/*
 Copyright (c) 2008 AllFlashWebsite.com
 All rights reserved.
 
 Some code compiled from forum:
 http://forums.puremvc.org/index.php?PHPSESSID=a0b1441c9f879cef0256b86ddc30fe29&topic=286.msg1104#msg1104

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @ignore
 */
 
package de.designwerk09.model
{
	import de.swfaddress.*;
	
	import flash.external.ExternalInterface;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
    public class SWFAddressProxy extends Proxy implements IProxy
    {
        public static const NAME:String = 'SWFAddressProxy';
		
        public function SWFAddressProxy( )
        {
            super( NAME, Number(0) );
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, onAddressChange);
        }
		
		public function requestURI(uri:String):void
		{
			if (ExternalInterface.available) {
				SWFAddress.setValue(uri);
			} else {
				setTargetURI( SWFAddressUtil.segmentURI(uri) );
			}
		}
		
		public function setTitle(title:String):void
		{
			SWFAddress.setTitle(title);
		}
		
		private function onAddressChange(e:SWFAddressEvent):void
		{
			//trace("onAddressChange " + e.value);
			setTargetURI( SWFAddressUtil.segmentURI(e.value) );
		}
		
		private function setTargetURI(uriSegments:Array):void
		{
			//trace("setTargetURI " + uriSegments);
			sendNotification("$" + uriSegments[0], uriSegments, "Array");
		}
     }
}