package de.designwerk09.view.components.buttons
{
	import de.designwerk09.view.assets.AssetManager;
	import de.designwerk09.view.components.events.NaviEvent;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	public class TextButton extends Sprite
	{
		
		private var label:TextField = new TextField()
		private var format:TextFormat = new TextFormat()
		private var fonts:AssetManager = new AssetManager()	

		private var clickbtn:Sprite = new Sprite()

		private var _txt:String;
		private var _name:String;
		private var _font:String;
		private var _size:int;
		private var _id:int;

		private var _onoff:Boolean;

		public function TextButton(txt:String, name:String, font:String, size:int, id:int)
		{
			
			_txt = txt;
			_name = name;
			_font = font;
			_size = size;
			_id = id;
			
			inittxt();
			initbtn();
			
			additems()
			

		}


		private function inittxt():void{
            format.font = _font;
            format.color = 0xffffff;
            format.size = _size;
            format.underline = false;

           	label.autoSize = TextFieldAutoSize.LEFT;
            label.background = false;
            label.border = false;
            label.tabEnabled = false;
            label.selectable = false;
         	label.embedFonts = true;
         	label.width = 500;		
			label.antiAliasType = AntiAliasType.ADVANCED;
			label.mouseEnabled = false
			label.htmlText  = _txt;
		//	label.alpha = .5;
         	label.setTextFormat(format);
		}






		private function initbtn():void{
			clickbtn.graphics.beginFill(0x000000, 0);
			clickbtn.graphics.drawRect(0,0,label.textWidth+5, _size);
			clickbtn.y = 4
			clickbtn.addEventListener(MouseEvent.CLICK,click);
			clickbtn.addEventListener(MouseEvent.MOUSE_OVER,over);
			clickbtn.addEventListener(MouseEvent.MOUSE_OUT,out);
		}


		private function additems():void{
			addChild(label)
			addChild(clickbtn)
		}


		private function click(e:MouseEvent):void{
			dispatchEvent( new NaviEvent(NaviEvent.NAVI_PRESSED, _id));  		
		}

		private function over(e:MouseEvent):void{
			if (!_onoff){
				format.color = 0x000000;
				label.setTextFormat(format);
			}
		}

		private function out(e:MouseEvent):void{
			if (!_onoff){
				format.color = 0xffffff;
				label.setTextFormat(format);
			}
		}
		

		public function get id():int{
			return _id;
		}


		public function set aktiv(onoff:Boolean):void{
			_onoff = onoff
			
			switch (_onoff) {
				case true:
				format.color = 0x000000;
					break;
				case false:
				format.color = 0xffffff;
					break;
			}	
			
			label.setTextFormat(format);
		}



	
		
	}
}