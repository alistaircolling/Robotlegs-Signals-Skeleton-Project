package 
{
	import controllers.ButtonClickedCommand;
	import controllers.LoadSettingsXMLCommand;
	import controllers.ServiceSetCommand;
	import controllers.StoreSettingsXMLCommand;
	
	import flash.display.DisplayObjectContainer;
	
	import model.ExampleModel;
	import model.SettingsModel;
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.mvcs.SignalContext;
	
	import services.XMLService;
	
	import signals.ButtonClicked;
	import signals.LoadXML;
	import signals.SettingsUpdated;
	import signals.SettingsXMLLoaded;
	import signals.TextSetOnModel;
	
	import view.components.ExampleComponent;
	import view.mediators.ExampleMediator;
	import view.mediators.ProjectMediator;
	
	public class ProjectContext extends SignalContext
	{
		
		public function ProjectContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
		
			//map models
			injector.mapSingleton(SettingsModel);
			injector.mapSingleton(ExampleModel);
			
			//map signal singletons
			injector.mapSingleton(SettingsUpdated);
			injector.mapSingleton(ButtonClicked);
			injector.mapSingleton(TextSetOnModel);
			
			//map services
			injector.mapSingleton(XMLService);
			
			//map signals   -maps signals to commands
			signalCommandMap.mapSignalClass(LoadXML, LoadSettingsXMLCommand);
			signalCommandMap.mapSignalClass(SettingsXMLLoaded, StoreSettingsXMLCommand);
			signalCommandMap.mapSignalClass(SettingsUpdated, ServiceSetCommand);
			signalCommandMap.mapSignalClass(ButtonClicked, ButtonClickedCommand);
			
			
			//map mediators
			mediatorMap.mapView(RobotLegsSkeleton, ProjectMediator);
			mediatorMap.mapView(ExampleComponent, ExampleMediator);
			
			
			
		}
	}
}