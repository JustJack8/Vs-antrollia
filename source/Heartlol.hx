import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxVelocity;
import flixel.util.FlxColor;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import PlayState;
import flixel.group.FlxGroup.FlxTypedGroup;


class Heartlol extends FlxSprite {
	private var target:FlxObject; 

	public function new(x:Float, y:Float, target:FlxObject)
		{
			super(x, y);
	
			this.target = target;

			loadGraphic(Paths.image('bullets/hert'));
			FlxVelocity.accelerateTowardsPoint(this, target.getMidpoint(), 360,390);
		}

  override function update(elapsed:Float)
    {
      angle += 1;
      super.update(elapsed);
    }
}