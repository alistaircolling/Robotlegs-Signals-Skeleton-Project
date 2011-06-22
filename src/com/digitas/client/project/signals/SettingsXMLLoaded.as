package com.digitas.client.project.signals
{
	import com.digitas.client.project.model.vo.SettingsVO;
	import org.osflash.signals.Signal;
	
	
	public class SettingsXMLLoaded extends Signal
	{
		public function SettingsXMLLoaded()
		{
			super(SettingsVO);
		}
	}
}