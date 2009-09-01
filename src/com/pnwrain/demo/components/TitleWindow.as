package com.pnwrain.demo.components
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import spark.components.Button;
	import spark.components.Panel;

	[Event(name="close")]
	
	public class TitleWindow extends spark.components.Panel
	{
		[SkinPart]
		public var closeButton:Button;
		
		public function TitleWindow()
		{
			super();
		}
		
		override protected function partAdded(name:String, part:Object):void
		{
			super.partAdded(name, part);
			
			if ( name == "closeButton")
			{
				(part as UIComponent).addEventListener(MouseEvent.CLICK, onCloseClick);
			}
		}
		override protected function partRemoved(name:String, part:Object):void
		{
			super.partRemoved(name,part);
			
			if ( name == "closeButtom")
			{
				(part as UIComponent).removeEventListener(MouseEvent.CLICK, onCloseClick);
			}
		}
		
		protected function onCloseClick(event:MouseEvent):void
		{
			var e:Event = new Event("close");
			dispatchEvent(e);
		}
	}
}