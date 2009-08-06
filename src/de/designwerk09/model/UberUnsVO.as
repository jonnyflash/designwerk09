package de.designwerk09.model
{
	

	
	

	public class UberUnsVO
	{
		
		private var _description:String;
		private var _startscreen:String;
		private var _person:XMLList;
		
		public function UberUnsVO(description:String, startscreen:String, person:XMLList):void
		{
			
			_description = description;
			_startscreen = startscreen;
			_person = person;

		}

		
		public function get description():String
		{
			return _description;
		}		
		public function get startscreen():String
		{
			return _startscreen;
		}
		
		public function get person():XMLList
		{
			return _person;
		}	

	}
}