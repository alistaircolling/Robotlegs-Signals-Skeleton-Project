package com.digitas.client.project.events {
	import flash.events.Event;
	
	public class XMLLoadedEvent extends Event
	{
		public var xml:XML;
		public static var LOADED:String = "loaded";
		
		public function XMLLoadedEvent(type:String, xm:XML)
		{
			xml = xm;
			super(type, true, true);
		}
		
		override public function clone():Event{
			return new XMLLoadedEvent(type, xml);	
		}
	}
}