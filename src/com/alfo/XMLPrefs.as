package com.alfo
{
	import com.utils.Console;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import model.Settings;

	[Bindable]
	public class XMLPrefs extends Sprite
	{
		public var prefsFile:File; // The preferences prefsFile
		 
		/** Only one instance of the model locator **/
		
		private static var instance:XMLPrefs = new XMLPrefs();
		public static var PREFERENCES_READY:String = "PREFERENCES_READY";
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
		public var urnLength:int;
		public var standalone:Boolean = false;
		public var isReady:Boolean = false;
		private var prefsXML:XML;
		private var stream:FileStream;
		private var isConfig:Boolean = false;
		
		
		public function XMLPrefs()
		{
			trace("XMLPREFS instantiated");
			if(instance)
			{
				throw new Error ("We cannot create a new instance. Please use XMLPrefs.getInstance()");
			} else {
				stream = new FileStream();
				prefsFile = File.documentsDirectory;
				prefsFile = prefsFile.resolvePath("SkyTestQuiz/preferences.xml");
				if (prefsFile.exists) {
					trace("preference file exists");
					stream.open(prefsFile, FileMode.READ);
					processXMLData();
				}
				else //Otherwise make a file and save it
				{
					var tempFile:File = File.applicationDirectory;
					tempFile = tempFile.resolvePath("assets/xml/preferences.xml"); 
					try {
						tempFile.copyTo(prefsFile,true);
					} catch (error:Error)
					{
						trace("error saving xml for the first time:"+error.message);
					} 
					stream.open(prefsFile, FileMode.READ);
					processXMLData();
				}
				
			}
		}
		public function processXMLData():void
		{
			
			prefsXML = XML(stream.readUTFBytes(stream.bytesAvailable));
			stream.close();
			setValues( prefsXML )
			dispatchEvent( new Event( "PREFERENCES_READY" ) );
		}
		public function setValues( prefsXML:XML ):void
		{
			timeOut=Number(prefsXML.timeout);
			totalQuestions=Number(prefsXML.totalquestions);
			penalty=Number(prefsXML.penalty);
			modalPause=Number(prefsXML.modalpause);
			splashPause=Number(prefsXML.splashpause);
			baseURL=prefsXML.baseurl;
			localURL=prefsXML.localurl;
			mode=prefsXML.mode;
			game_id=prefsXML.game_id;
			location_id=prefsXML.location_id;
			urnLength=int(prefsXML.urnLength);
			ApplicationType = prefsXML.applicationtype;
			standalone = prefsXML.standalone;
			Console.log( prefsXML, this);
			Console.log( "localURL : "+localURL, this); 
			trace("timeout:"+timeOut);
			trace("totalquestions:"+totalQuestions);
			trace("penalty"+penalty);
			trace("modalpause"+modalPause);
			trace("baseURL"+baseURL);
			isReady = true;
			
		}
		public function saveApplicationVariables(values:Object):void
		{
			Console.log("Saving prefereces", this);
			if (prefsFile.exists) {
				prefsXML.baseurl 			= values.baseURL;
				prefsXML.urnLength 			= values.urnLength;
				prefsXML.applicationtype 	= values.applicationtype;
				prefsXML.localurl	 		= values.localURL;
				prefsXML.location_id 		= values.location_id;
				prefsXML.timeout 			= values.timeout;
				prefsXML.totalquestions 	= values.totalquestions;
				prefsXML.modalpause 		= values.modalpause;
				prefsXML.game_id 			= values.game_id;
				prefsXML.location_id 		= values.location_id;
				prefsXML.mode 				= values.mode;
//				prefsXML.standalone 		= values.standalone;
				setValues( prefsXML )
				writeXMLData();
				
				//var xml = XML(stream.readUTFBytes(fileStream.bytesAvailable));
				/*
				prefsXML.applicationType = type;
				var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
				outputString += prefsXML.toXMLString();
				outputString = outputString.replace(/\n/g, File.lineEnding);
				
				fileStream.writeUTFBytes(outputString);
				fileStream.close();
				*/
			}
			else
			{
				Console.log("No preference file", this);
			}
		}
		public function writeXMLData():void 
		{
			Console.log("Saving preference data as xml:", this);
			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
			outputString += prefsXML.toXMLString();
			outputString = outputString.replace(/\n/g, File.lineEnding);
			Console.log("*********"+outputString+"***********", this);
			try
			{
				var f:File = new File( prefsFile.nativePath );
				stream = new FileStream();
				stream.open(f, FileMode.WRITE);
				stream.writeUTFBytes(outputString);
				stream.close();
				Console.log("Saved successfully!", this);
			} catch (error:Error)
			{
				Console.log("error saving xml:"+error.message, this);
			} 
			
		}
		public function set configScreen( _isConfig:Boolean):void 
		{
			isConfig = _isConfig;
		}
		public function get configScreen():Boolean 
		{
			return isConfig;	
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