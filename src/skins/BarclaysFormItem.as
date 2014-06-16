package skins
{
	
	import com.utils.Console;
	
	import spark.skins.spark.FormItemSkin;
	
	
	
	public class BarclaysFormItem extends FormItemSkin
	{
		
		public function BarclaysFormItem()
		{
			super();
			labelDisplay.clearStyle("color");
			labelDisplay.clearStyle("fontWeight");
			labelDisplay.clearStyle("paddingTop");
			labelDisplay.styleName = "formItemLabelStyles";
		}
		override protected function updateDisplayList(w:Number, h:Number):void {
			super.updateDisplayList(w, h);
			
			// vertically align (top by default)
			var verticalAlign:String = getStyle("verticalAlign");
			Console.log("updateDisplayList "+verticalAlign, this);
			if (verticalAlign == "middle") {   
				labelDisplay.y = Math.max(0, (h - labelDisplay.height) / 2);
			} else if (verticalAlign == "bottom") {
				var padBottom:Number = getStyle("paddingBottom");
				labelDisplay.y = Math.max(0, h - labelDisplay.height - padBottom);
			}
		}  
				
	}
}