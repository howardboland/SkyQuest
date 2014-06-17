package  {
	
	import mx.flash.UIMovieClip
	
	
	public class Contatore extends UIMovieClip {
		public var totalTime:Number=200;
		public var frameFraction:Number;
		
		public function Contatore() {
			trace(roller.totalFrames);
			roller.stop();
		}
		public function grande() {
			scaleX=2;
		}
		public function piccolo() {
			scaleX=0.5;
		}
		public function set timeLimit(limit:Number) {
			totalTime=limit;
			frameFraction=roller.totalFrames/limit;
			
		}
		public function set timo(ora:Number):void {
			tempo.tempo.text=secondsToMinutesSeconds(ora);
			roller.gotoAndStop(int(ora*frameFraction));
		}
		function secondsToMinutesSeconds(secs:Number):String {
			var s:Number = secs % 60;
			var m:Number = Math.floor((secs % 3600 ) /60);
			var h:Number = Math.floor(secs / (60*60));
			
			var minutestring:String = m<10 ? "0"+String(m)+":" : String(m)+":";
			var secstring:String = s<10 ? "0"+String(s) : String(s);
			return minutestring+secstring;
		}
	}
	
}
