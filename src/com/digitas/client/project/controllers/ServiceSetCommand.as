package com.digitas.client.project.controllers
{
	import com.digitas.client.project.model.vo.SettingsVO;
	import com.digitas.client.project.signals.SettingsUpdated;
	import org.robotlegs.mvcs.SignalCommand;
	
	
	public class ServiceSetCommand extends SignalCommand
	{
		[Inject]
		public var settings:SettingsVO;
		
		override public function execute():void{
			//chain in the next command- generate display etc.
			
		}
		
		
	}
}