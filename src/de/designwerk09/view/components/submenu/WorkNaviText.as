package de.designwerk09.view.components.submenu
{
	
	import de.designwerk09.view.assets.AssetManager;
	
	import flash.display.Sprite;
	import flash.events.TextEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.*;


	public class WorkNaviText extends Sprite
	{
		
		private var label:TextField = new TextField()
		private var format:TextFormat = new TextFormat()
		private var fonts:AssetManager = new AssetManager()		
		
		private var _worktxt:String;
		private var _font:String;
		private var _size:int;
		
		private var css:StyleSheet = new StyleSheet(); 
		//private var cssClass:String = "a{color:#ffffff; textDecoration:'underline'}";
        
		public function WorkNaviText(worktxt:String, font:String, size:int)
		{
			
			//css.parseCSS(cssClass)
			
			css.setStyle("a:link",{color:'#CFE1A0'});
			css.setStyle("a:hover",{color:'#FFFFFF'});
			
			_worktxt = worktxt
			_font = font;
			_size = size;
			inittxt()
			additems()
		}
		
		
		
		
		private function inittxt():void{
            format.font = _font;
            format.color = 0x000000;
            format.size = _size;
         // 	format.underline = false;
			
           	label.autoSize = TextFieldAutoSize.LEFT;
            label.background = false;
            label.border = false;
            label.tabEnabled = false;
            label.selectable = false;
         	label.embedFonts = true;
         	label.width = 400;
         //	label.height = 500;		
			label.antiAliasType = AntiAliasType.ADVANCED;
			label.mouseEnabled = true
			label.multiline = true;
		//	label.alpha = .5;
			label.wordWrap = true;
			label.htmlText = _worktxt;
         	label.setTextFormat(format);
			label.styleSheet = css;
			
			label.addEventListener(TextEvent.LINK, clickHandler);
			
		}
		
		
		private function clickHandler(e:TextEvent):void {
			navigateToURL(new URLRequest(e.text),"_blank");
		}
		
		
		private function additems():void{
			addChild(label)
		}
		
		

	}
}