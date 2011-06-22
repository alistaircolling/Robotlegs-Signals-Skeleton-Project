package com.digitas.client.project.controllers
{
	
	
	
	import com.digitas.client.project.services.XMLService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoadSettingsXMLCommand extends SignalCommand
	{
		[Inject]
		public var service:XMLService;
		
		private static const _XML_URL:String = "xml/settings.xml";
		
		override public function execute():void{
			service.loadXML(_XML_URL);
			
		}
	}
}