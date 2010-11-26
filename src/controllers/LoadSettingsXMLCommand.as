package controllers
{
	
	
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoadSettingsXMLCommand extends SignalCommand
	{
		[Inject]
		public var service:XMLService;
		
		private static const _XML_URL:String = "xml/settings.xml";
		
		override public function execute():void{
			trace("asd");
			service.loadXML(_XML_URL);
			
		}
	}
}