package de.designwerk09.view.assets
{
	import de.designwerk09.view.assets.AssetManager;
	
	import flash.display.Sprite;
	import flash.text.*;
	
	public class DWlogo extends Sprite
	{
		
		private var label:TextField = new TextField()
		private var format:TextFormat = new TextFormat()
		
		private var fonts:AssetManager = new AssetManager()	





		public function DWlogo()
		{
			
         	format = new TextFormat();
            format.font = "DINBlack";
            format.color = 0x000000;
            format.size = 24;
            format.underline = false;

            label = new TextField();
           	label.autoSize = TextFieldAutoSize.LEFT;
            label.background = false;
            label.border = false;
            label.tabEnabled = false;
            label.selectable = false;
         	label.embedFonts = true;
         	label.width = 500;		
			label.antiAliasType = AntiAliasType.ADVANCED;
			label.mouseEnabled = false
			label.htmlText  = "DESIGNWERK"
         	label.setTextFormat(format);
         	
			
			addChild(label)
			
			
		}





	}
}