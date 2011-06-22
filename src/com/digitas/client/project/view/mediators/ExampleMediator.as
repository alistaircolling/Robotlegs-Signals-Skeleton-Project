package com.digitas.client.project.view.mediators
{
	import com.digitas.client.project.signals.ButtonClicked;
	import com.digitas.client.project.signals.TextSetOnModel;
	import com.digitas.client.project.view.components.ExampleComponent;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;
	
	
	
	
	public class ExampleMediator extends Mediator
	{
		[Inject]
		public var exampleViewComponent:ExampleComponent;
		[Inject]
		public var buttonClicked:ButtonClicked;
		[Inject]
		public var textSetOnModel:TextSetOnModel;
		
		
		override public function onRegister():void{
			trace("Project Mediator registered");
			//register listeners 
			addListeners();
		}
		
		private function addListeners():void{
			
			exampleViewComponent.btn.addEventListener(MouseEvent.CLICK, buttonClickedListener);
			
			//add listener for signal
			textSetOnModel.add(onModelChanged);
		}
		
		//be sure to pass the corect data type of the signal
		public function onModelChanged(__s:String):void{
			
			(viewComponent as ExampleComponent).textA.text = __s;
			
		}
		
		private function buttonClickedListener(__m:MouseEvent):void{ 
			
			//get data from this box
			
			var __s:String = (viewComponent as ExampleComponent).textA.text 	
			
			//send signal
			buttonClicked.dispatch(__s);
			
		}
	}
}