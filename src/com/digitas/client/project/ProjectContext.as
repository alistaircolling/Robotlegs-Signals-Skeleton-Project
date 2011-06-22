package 
com.digitas.client.project{
	import com.digitas.client.project.controllers.ButtonClickedCommand;
	import com.digitas.client.project.controllers.LoadSettingsXMLCommand;
	import com.digitas.client.project.controllers.ServiceSetCommand;
	import com.digitas.client.project.controllers.StoreSettingsXMLCommand;
	import com.digitas.client.project.model.ExampleModel;
	import com.digitas.client.project.model.SettingsModel;
	import com.digitas.client.project.services.XMLService;
	import com.digitas.client.project.signals.ButtonClicked;
	import com.digitas.client.project.signals.LoadXML;
	import com.digitas.client.project.signals.SettingsUpdated;
	import com.digitas.client.project.signals.SettingsXMLLoaded;
	import com.digitas.client.project.signals.TextSetOnModel;
	import com.digitas.client.project.view.components.ExampleComponent;
	import com.digitas.client.project.view.mediators.ExampleMediator;
	import com.digitas.client.project.view.mediators.ProjectMediator;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.mvcs.SignalContext;
	
	
	
	
	
	
	
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