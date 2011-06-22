package com.digitas.client.project.controllers
{
	import com.digitas.client.project.model.SettingsModel;
	import com.digitas.client.project.model.vo.SettingsVO;
	import com.digitas.client.project.signals.SettingsXMLLoaded;
	import org.robotlegs.mvcs.SignalCommand;
	
	
	public class StoreSettingsXMLCommand extends SignalCommand
	{
		[Inject]
		public var settingsModel:SettingsModel;
		[Inject]
		public var settings:SettingsVO;
		
			
		
		override public function execute():void{
			trace("store xml settings command");
			settingsModel.settings = settings;
		}
	}
}