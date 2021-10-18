package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;

class GameOverdr extends MusicBeatSubstate
{
	var camFollow:FlxObject;

	var stageSuffix:String = "";

	var gg:FlxSprite;

	var lol:FlxTypeText;

	var textlmao:String = '';

	var bf:FlxSprite;

	public function new(x:Float, y:Float)
	{
		super();

		Conductor.songPosition = 0;

		Conductor.changeBPM(100);

		var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('balls_lo', 'shared');
		bf = new FlxSprite(x - 363, y - 84);
		bf.frames = tex;
		bf.updateHitbox();
		bf.animation.addByPrefix('lmfao', 'dusty when they when they', 24, false);
		bf.flipX = true;

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;
	}

	override function create() {

		gg = new FlxSprite().loadGraphic(Paths.image('gameover'));
		gg.antialiasing = false;
		gg.alpha = 0;
		gg.scale.set(1.3,1.3);
		gg.screenCenter();
		add(gg);

		add(bf);
		bf.animation.play('lmfao');
		
		switch(Random.int(1, 7)) {
			case 1:
				textlmao = 'i can do anything BITCH';
			case 2:
				textlmao = 'get FUCKED blue balls!';
			case 3:
				textlmao = 'give us your balls';
			case 4:
				textlmao = 'dodge using the keys BLUEBALLS';
			case 5:
				textlmao = 'spamtom that, spamtom this, stfu jevillia better';
			case 6:
				textlmao = 'Trolling Trolling!';
			case 7:
				textlmao = 'Bye byeeeeeee';
		}

		lol = new FlxTypeText(0, 0, Std.int(FlxG.width), "* " + textlmao, 32);
		lol.screenCenter();
		lol.updateHitbox();
		lol.x += 250;
		lol.y += 100;
		lol.setFormat(Paths.font("COMIC.TTF"), 45);
		lol.color = FlxColor.WHITE;
		lol.sounds = [FlxG.sound.load(Paths.sound('antrollia_dialouge_sound_incase_we_dont_have_real_voices'), 0.7)];
		add(lol);

		super.create();
	}

	var startVibin:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.BACK)
		{
			FlxG.sound.music.stop();

			if (PlayState.isStoryMode)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());
			PlayState.loadRep = false;
		}

		if (bf.animation.curAnim.name == 'lmfao' && bf.animation.curAnim.curFrame == 9)
		{
			FlxG.sound.play(Paths.sound('break1'));
		}

		if (bf.animation.curAnim.name == 'lmfao' && bf.animation.curAnim.curFrame == 36)
		{
			FlxG.sound.play(Paths.sound('break2'));
		}

		if (bf.animation.curAnim.name == 'lmfao' && bf.animation.curAnim.curFrame == 74)
		{
			bf.alpha = 0;
			FlxTween.tween(gg,{alpha: 1},3,{ease: FlxEase.expoInOut});
			FlxG.sound.playMusic(Paths.music('homo'));
			new FlxTimer().start(2.5, function(tmr:FlxTimer)
				{
					lol.start(0.06, true);
					startVibin = true;
				},1);
			
		}

		if (startVibin)
			{
				if (controls.ACCEPT)
					{
						endBullshit();
					}
			}

	}

	override function beatHit()
	{
		super.beatHit();

		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			PlayState.startTime = 0;
			isEnding = true;
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music('gay'));
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			});
		}
	}
}
