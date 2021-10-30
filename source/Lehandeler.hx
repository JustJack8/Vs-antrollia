package;

import openfl.filters.ShaderFilter;

class Lehandeler
{
	public static var coolcromaeffect:ShaderFilter = new ShaderFilter(new Coolcromaeffect());
	
	public static function setChrome(chromeOffset:Float):Void
	{
		coolcromaeffect.shader.data.rOffset.value = [chromeOffset];
		coolcromaeffect.shader.data.gOffset.value = [0.0];
		coolcromaeffect.shader.data.bOffset.value = [chromeOffset * -1];
	}
}