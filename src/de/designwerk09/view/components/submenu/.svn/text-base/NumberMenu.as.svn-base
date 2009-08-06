package de.designwerk09.view.components.submenu
{
	import de.designwerk09.view.components.buttons.NumberButton;
	
	import flash.display.Sprite;
	import flash.xml.*;
	
	public class NumberMenu extends Sprite
	{
	
	
	
	
		private var _work:XMLList;
		private var _workLength:int;
		private var _numbernaviContainer:Array = new Array()
		private var numberNavi:NumberButton;
	
		public function NumberMenu(work:XMLList)
		{
			_work = work
			_workLength = _work.length()
			init();
		}


		private function init():void
		{
			for (var i:int=0; i<_workLength; i++){
				numberNavi = new NumberButton(i+1, (i+1).toString(),"LucidaSans", 10, i);
				numberNavi.x = 20*i
			 	_numbernaviContainer[i] = numberNavi
			 	addChild(numberNavi);
			}
			alphaThis()
		}



		private function alphaThis():void
		{
			if(_workLength <= 1){
				var numberNavi:NumberButton = _numbernaviContainer[0]
				numberNavi.visible = false
			}
			
		}
		
		

		public function set aktSubPoint(aktMenu:int):void{
			for (var i:int=0; i<_workLength; i++){
				var numberNavi:NumberButton = _numbernaviContainer[i]
				if(i == aktMenu){
					numberNavi.aktiv = true
				}else{
					numberNavi.aktiv = false
				}
				
			}
		}
		


	}
}