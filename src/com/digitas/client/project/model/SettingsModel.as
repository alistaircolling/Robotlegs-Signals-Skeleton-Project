package com.digitas.client.project.model
{
	import com.digitas.client.project.model.vo.SettingsVO;
	import com.digitas.client.project.signals.SettingsUpdated;
	import org.robotlegs.mvcs.Actor;
	
	
	
	
	public class SettingsModel extends Actor
	{
		[Inject]
		public var serviceSet:SettingsUpdated;
		[Inject]
		private var _settings:SettingsVO;
		
		private var _exampleSetting:String;
		
		
		public function set settings(__value:SettingsVO):void
		{
			_settings = __value;
			
			_exampleSetting = _settings.exampleValue;
			
			//dispatch the signals that informs model has been updated 
			serviceSet.dispatch(_settings);
			
		}
		
	
		public function get settings():SettingsVO
		{
			return _settings;
		}

		

	}
}