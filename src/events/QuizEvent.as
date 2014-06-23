package events
{
	import flash.events.Event;
	
	public class QuizEvent extends Event
	{
		
		public var score:Number;
		
		public static const CORRECT_ANSWER:String="correct";
		public static const WRONG_ANSWER:String="wrong";
		public static const QUIZ_COMPLETE:String="complete";
		public static const QUIZ_SAVE:String="save";
		
		public function QuizEvent(type:String,score:Number=0)
		{
			super(type);
			this.score=score;
		}
	}
}