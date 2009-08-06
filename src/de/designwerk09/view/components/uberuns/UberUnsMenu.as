package de.designwerk09.view.components.uberuns
{
	
	import de.designwerk09.model.UberUnsVO;
	import de.designwerk09.view.components.buttons.TextButton;
	
	import flash.display.Sprite;
		
	
	public class UberUnsMenu extends Sprite
	{
		
		
		private var _data:UberUnsVO;		
		private var _persons:XMLList;
		
		private var personsContainer:Array = new Array()
		
		public function UberUnsMenu(data:UberUnsVO)
		{
			_data = data;
			_persons = _data.person;
			init();
		}



		private function init():void{

			for (var i:int=0; i<_persons.length(); i++){
				var txt:String = _persons[i].description
				var tb:TextButton = new TextButton(txt, txt, "LucidaSans", 10, i);
				tb.y = i*20
				personsContainer[i] = tb
				addChild(personsContainer[i])
			}
		}

		public function set aktSubPoint(aktMenu:int):void{
			for (var i:int=0; i<_persons.length(); i++){
				var tb:TextButton = personsContainer[i]
				if(i == aktMenu){
					tb.aktiv = true
				}else{
					tb.aktiv = false
				}
				
			}
		}


	}
}