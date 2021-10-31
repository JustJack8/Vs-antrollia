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
import Random;
import flixel.text.FlxText;

class GameOverSubstate extends MusicBeatSubstate
{
	var bf:Boyfriend;
	var camFollow:FlxObject;

	var stageSuffix:String = "";
	var sus:String = "";
	var numba:Int = 0;
	var isallowed:Bool = true;
	var e:Bool = true;
	var deaths:FlxText;

	public function new(x:Float, y:Float)
	{
		var daStage = PlayState.Stage.curStage;
		var daBf:String = '';
		switch (PlayState.boyfriend.curCharacter)
		{
			case 'bf-pixel':
				stageSuffix = '-pixel';
				daBf = 'bf-pixel-dead';
			default:
				daBf = 'bf';
		}

		super();

		Conductor.songPosition = 0;

		FlxG.save.data.death ++;

		if (FlxG.save.data.death == 100)
			{
				numba = 1;
			}
		else if (FlxG.random.bool(10))
			{
				switch(Random.int(1, 4)) {
					case 1:
						numba =2;
					case 2:
						numba =3;
					case 3:
						numba =10;
					case 4:
						numba =69;
					}
			}

		bf = new Boyfriend(x, y, daBf);
		add(bf);


		camFollow = new FlxObject(bf.getGraphicMidpoint().x + 200, bf.getGraphicMidpoint().y, 1, 1);
		add(camFollow);

		FlxG.sound.play(Paths.sound('fnf_loss_sfx' + stageSuffix));

		
		Conductor.changeBPM(100);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		bf.playAnim('firstDeath');

		switch (numba)
		{
			case 10:
				stageSuffix = 'tdm';
		}

		deaths = new FlxText(20, 20, Std.int(FlxG.width * 0.6), 'total deaths:' + FlxG.save.data.death, 20);
		deaths.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		deaths.alpha = 0;
		deaths.x = bf.x - 400;
		deaths.y = bf.y - 40;
		add(deaths);
	}

	var startVibin:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT && isallowed)
		{
			endBullshit();
		}

		if(FlxG.save.data.InstantRespawn)
		{
			LoadingState.loadAndSwitchState(new PlayState());
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();

			if (PlayState.isStoryMode)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());
			PlayState.loadRep = false;
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 12)
		{
			FlxG.camera.follow(camFollow, LOCKON, 0.01);
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			FlxTween.tween(deaths,{alpha: 1},2.5,{ease: FlxEase.expoInOut});

			FlxTween.tween(FlxG.camera, {zoom: 1.4}, 2.5, {
				ease: FlxEase.quadInOut});

			if (numba == 0)
				FlxG.sound.play(Paths.soundRandom('DeathQuote', 1, 28), 1);
			switch (numba)
			{
				case 1:
					FlxG.sound.play(Paths.sound('eastereggs/amazing'));
					Conductor.songPosition = FlxG.sound.music.time;
					FlxG.sound.music.volume = 0;
					isallowed = false;
					new FlxTimer().start(12, function(tmr:FlxTimer)
						{
							isallowed = true;
							Conductor.songPosition = FlxG.sound.music.time;
						},1);
				case 2:
					FlxG.sound.play(Paths.sound('eastereggs/TABILOL'));
					isallowed = false;
					Conductor.songPosition = FlxG.sound.music.time;
					FlxG.sound.music.volume = 0;
					new FlxTimer().start(12, function(tmr:FlxTimer)
						{
							isallowed = true;
							Conductor.songPosition = FlxG.sound.music.time;
						},1);
				case 3:
					FlxG.sound.play(Paths.sound('eastereggs/BEST_LINE'));
					isallowed = false;
					Conductor.songPosition = FlxG.sound.music.time;
					FlxG.sound.music.volume = 0;
					new FlxTimer().start(68.5, function(tmr:FlxTimer)
						{
							isallowed = true;
							Conductor.songPosition = FlxG.sound.music.time;
						},1);
				case 10:
					stageSuffix = 'tdm';
					FlxG.sound.play(Paths.sound('eastereggs/gfmod'));
			}

			if (numba == 69)
				FlxG.sound.playMusic(Paths.music('sus'));
			else
				FlxG.sound.playMusic(Paths.music('gameOver' + stageSuffix));
			startVibin = true;
			if (e)
				{
					bf.playAnim('deathLoop', true);
					e = false;
				}
				
		}

		if (!isallowed)
			{
				FlxG.sound.music.volume = 0;
			}
			else
				{
					FlxG.sound.music.volume = 0.7;
				}

		Conductor.songPosition = FlxG.sound.music.time;
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
			bf.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			if (numba == 69)
				FlxG.sound.play(Paths.music('susend'));
			else
				FlxG.sound.play(Paths.music('gameOverEnd'));
			
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
