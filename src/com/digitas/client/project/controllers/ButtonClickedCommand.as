package com.digitas.client.project.controllers
{
	import com.digitas.client.project.model.ExampleModel;
	import org.robotlegs.mvcs.Command;
	
	
	public class ButtonClickedCommand extends Command
	{
		[Inject]
		public var exampleModel:ExampleModel;
		
		[Inject]
		public var data:String;
		
		
		override public function execute():void{
			
			trace("button clicked");
			exampleModel.data = data; //set data on the model
			
		}
		
		
	}
}