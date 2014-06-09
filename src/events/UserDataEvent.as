package events
{
	import flash.events.Event;
	
	public class UserDataEvent extends Event
	{
		
		public var result:String;
		
		public static const SUBMIT_REGISTRATION:String="registration";
		public static const SERVER_ERROR:String="servererror";
		
		public function UserDataEvent(type:String, result:String)
		{
			
			super(type);
			this.result=result;
		}
	}
}