package com.utils
{

	
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.external.ExternalInterface;

	public class Console
	{
		private static var simpleSprite:Sprite;
		
		
		static public function log(s:*, obj:*) :void
		{
			if (simpleSprite==null)
			{	
				simpleSprite = new Sprite();
				
			}
			trace((obj==null ? simpleSprite : "["+obj.toString().split(".")[obj.toString().split(".").length-1]+"] ")+s);
			if (ExternalInterface.available)
				ExternalInterface.call("console.log", (obj==null ? simpleSprite : "["+obj.toString().split(".")[obj.toString().split(".").length-1]+"] ")+s.toString());

			//MonsterDebugger.trace(obj==null ? simpleSprite : obj, "["+obj.toString().split(".")[obj.toString().split(".").length-1]+"] "+s.toString());
		
			}
	}
}