package com.alfo
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	[Bindable]
	public class XMLPrefs
	{
		
		/** Only one instance of the model locator **/
		
		private static var instance:XMLPrefs = new XMLPrefs();
		
		/** Bindable Data **/
		
		public var timeOut:Number;
		public var totalQuestions:Number;
		public var modalPause:Number;
		public var splashPause:Number;
		public var penalty:Number;
		public var baseURL:String;
		public var localURL:String;
		public var ApplicationType:String;
		public var mode:String;
		public var location_id:String;
		public var game_id:String;
		
		private var prefsXML:XML;
		
		public function XMLPrefs()
		{
			trace("XMLPREFS instantiated");
			if(instance)
			{
				throw new Error ("We cannot create a new instance. Please use XMLPrefs.getInstance()");
			} else {
				var file:File = File.applicationDirectory.resolvePath("assets/xml/preferences.xml");
				var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
				prefsXML = XML(fileStream.readUTFBytes(fileStream.bytesAvailable));
				timeOut=Number(prefsXML.timeout);
				totalQuestions=Number(prefsXML.totalquestions);
				penalty=Number(prefsXML.penalty);
				modalPause=Number(prefsXML.modalpause);
				splashPause=Number(prefsXML.splashpause);
				baseURL=prefsXML.baseurl;
				localURL=prefsXML.localURL;
				mode=prefsXML.mode;
				game_id=prefsXML.game_id;
				location_id=prefsXML.location_id;
				ApplicationType = prefsXML.applicationtype;
				trace("timeout:"+timeOut);
				trace("totalquestions:"+totalQuestions);
				trace("penalty"+penalty);
				trace("modalpause"+modalPause);
				trace("baseURL"+baseURL);
			}
		}
		public function isAuto():Boolean
		{
			return mode=="auto";
		}
		public static function getInstance():XMLPrefs
		{
			return instance;
		}
	}
}