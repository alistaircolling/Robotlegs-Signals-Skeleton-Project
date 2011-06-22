package com.digitas.client.project.services{
	
	
	
	import com.digitas.client.project.model.vo.SettingsVO;
	import com.digitas.client.project.signals.SettingsXMLLoaded;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.http.HTTPService;
	import org.robotlegs.mvcs.Actor;
	
	
	

	public class XMLService extends Actor implements IXMLService {
		[Inject]
		public var settingsLoaded:SettingsXMLLoaded;
		
		private var _xmlFile:String;
		
		
		public function loadXML(__xml:String):void{
			_xmlFile = __xml;
			var service:HTTPService = new HTTPService();
			var responder:Responder = new Responder(handleServiceResult, handleServiceFault);
			var token:AsyncToken;
			service.resultFormat = "e4x";
			service.url = _xmlFile;
			token = service.send();
			token.addResponder(responder);
		}
		
		
		private function handleServiceResult(event:Object):void{
			trace("xml received");
			var __xml:XML = event.result as XML;
			var __settings:SettingsVO = new SettingsVO(__xml);
			settingsLoaded.dispatch(__settings);
		}
		
		private function handleServiceFault(event:Object):void{
			trace("xml error in loading");
		}
		
	
	}
}