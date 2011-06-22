package com.digitas.client.project.model
{
	import com.digitas.client.project.signals.TextSetOnModel;
	import org.robotlegs.mvcs.Actor;
	
	
	public class ExampleModel extends Actor
	{
		[Inject]
		public var textSetOnModel:TextSetOnModel;
		
		private var _data:String;
		
		public function ExampleModel()
		{
			super();
		}

		public function get data():String
		{
			return _data;
		}

		public function set data(value:String):void
		{
			_data = value;
			//dispatch signal
			textSetOnModel.dispatch(_data);
		}

	}
}