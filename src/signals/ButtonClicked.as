package signals
{
	import org.osflash.signals.Signal;
	
	public class ButtonClicked extends Signal
	{
		public function ButtonClicked()
		{
			super(String);
		}
	}
}