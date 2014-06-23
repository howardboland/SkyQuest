package events
{
	import flash.events.Event;
	
	
	
	public class NavEvent extends Event
	{
		
		public var page:String;
		
		public static const NAVIGATION:String="navigation";
		public static const SHOWTERMS:String="terms";
		
		public function NavEvent(type:String, page:String)
		{
			
			super(type);
			this.page=page;
			trace("dispatching");
		}
	}
}