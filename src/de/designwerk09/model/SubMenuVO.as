package de.designwerk09.model
{
	

	
	

	public class SubMenuVO
	{
		
		private var _id:uint;
		private var _title:String;
		private var _startscreen:String;
		private var _work:XMLList;
		
		
		public function SubMenuVO(id:uint, title:String, startscreen:String, work:XMLList):void
		{
			
			_id = id;
			_title = title;
			_startscreen = startscreen;
			_work = work;

		}

		public function get id():uint
		{
			return _id;
		}
		
		public function get title():String
		{
			return _title;
		}		
		public function get startscreen():String
		{
			return _startscreen;
		}
		
		public function get work():XMLList
		{
			return _work;
		}	

	}
}