package de.designwerk09.view.components.submenu
{
	
	import de.designwerk09.model.SubMenuVO;
	import de.designwerk09.view.components.buttons.TextButton;
	
	import flash.display.Sprite;
	
	
	public class SubMenu extends Sprite
	{
		
		
		private var _data:Object;
		
		private var submenuContainer:Array = new Array()
		
		public function SubMenu(data:Object)
		{
			_data = data;
			init();
		}





		private function init():void{
			for (var i:int=0; i<5; i++){
				var vo:SubMenuVO = _data[i];
				var submenu:TextButton = new TextButton(vo.title, vo.id.toString(),"LucidaSans", 10, i);
				submenu.y = 18*i
			 	submenuContainer[i] = submenu
			 	addChild(submenu);
			}
		}




		public function set aktSubPoint(aktMenu:int):void{
			for (var i:int=0; i<5; i++){
				var _submenu:TextButton = submenuContainer[i]
				if (i == aktMenu){
					_submenu.aktiv = true
				}else{
					_submenu.aktiv = false
				}
			}
		}





	}
}