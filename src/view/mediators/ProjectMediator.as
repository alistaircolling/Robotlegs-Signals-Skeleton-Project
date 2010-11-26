package view.mediators
{
	import flash.events.MouseEvent;
	
	import mx.core.Application;
	
	import org.robotlegs.mvcs.Mediator;
	
	import signals.ButtonClicked;
	import signals.TextSetOnModel;
	
	public class ProjectMediator extends Mediator
	{
		[Inject]
		public var mainViewComponent:RobotLegsSkeleton;
		[Inject]
		public var buttonClicked:ButtonClicked;
		[Inject]
		public var textSetOnModel:TextSetOnModel;
		
		
		override public function onRegister():void{
			trace("Project Mediator registered");
			//register listeners 
			addListeners();
		}
		
		private function addListeners():void {
			
			mainViewComponent.btn.addEventListener(MouseEvent.CLICK, buttonClickedListener);
			
			//add listener for signal
			textSetOnModel.add(onModelChanged);
			
		}

		
		//be sure to pass the corect data type of 
		public function onModelChanged(__s:String):void{
			
			mainViewComponent.tIn.text = __s;//update the view
			
		}
		
		
		private function buttonClickedListener(__m:MouseEvent):void { 
			
			//retrieve text entered
			var __enteredText:String = mainViewComponent.tIn.text;
			
			//send signal
			buttonClicked.dispatch(__enteredText);
			
		}
		
	}
}