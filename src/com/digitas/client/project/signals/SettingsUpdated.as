package com.digitas.client.project.signals
{
	import com.digitas.client.project.model.vo.SettingsVO;
	import org.osflash.signals.Signal;
	
	
	public class SettingsUpdated extends Signal
	{
		public function SettingsUpdated():void{
			super(SettingsVO);	
		}
		
	}
}