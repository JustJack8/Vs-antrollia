package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import flixel.addons.display.FlxBackdrop;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class Trophy extends MusicBeatState
{

	var gay:Int = 0;

	var backdrops:FlxBackdrop = new FlxBackdrop(Paths.image('test2'), 0.2, 0.2, true, true);
	var backdrops2:FlxBackdrop = new FlxBackdrop(Paths.image('test3'), -0.2, -0.2, true, true);
	var camFollow:FlxObject;
	var placeholder:Bool = false;
	var canmove:Bool = true;

	var menuItems:FlxTypedGroup<FlxSprite>;

	var death:FlxSprite;
	var blood:FlxSprite;
	var bloodfc:FlxSprite;
	var cbt:FlxSprite;
	var cbtfc:FlxSprite;
	var chungus:FlxSprite;
	var explosion:FlxSprite;
	var explosionfc:FlxSprite;
	var hdwgh:FlxSprite;
	var jevil:FlxSprite;
	var kade:FlxSprite;
	var life:FlxSprite;
	var miss:FlxSprite;
	var nodeath:FlxSprite;
	var reconnected:FlxSprite;
	var reconnectedfc:FlxSprite;

	override function create()
	{
		clean();
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In Trophy Menu", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('Vs_antrollia_menu_1'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 0, 0);
		add(camFollow);

		//add(backdrops);
		backdrops.scrollFactor.set(0, 0.07);
		backdrops.angle = 45;

		add(backdrops2);
		backdrops2.scrollFactor.set(0, 0.07);
		backdrops2.angle = 45;
		FlxG.camera.follow(camFollow, null, 0 * (0 / FlxG.save.data.fpsCap));

		if (FlxG.save.data.reconnected && FlxG.save.data.cbt && FlxG.save.data.explosion && FlxG.save.data.blood && FlxG.save.data.jevil && 
			FlxG.save.data.kade && FlxG.save.data.hdwgh && FlxG.save.data.chungus && FlxG.save.data.totalmiss == 1000 && 
			FlxG.save.data.death == 100 && FlxG.save.data.reconnectedfc && FlxG.save.data.cbtfc && FlxG.save.data.explosionfc && FlxG.save.data.bloodfc && FlxG.save.data.life == false)
			{
				FlxG.save.data.life = true;
				trophygot();
			}

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		if (FlxG.save.data.reconnected)
		reconnected = new FlxSprite().loadGraphic(Paths.image('achivements/reconnected'));
		else
		reconnected = new FlxSprite().loadGraphic(Paths.image('achivements/reconnectedgray'));	
		reconnected.screenCenter();
		reconnected.y += 0;
		menuItems.add(reconnected);

		if (FlxG.save.data.explosion)
		explosion = new FlxSprite().loadGraphic(Paths.image('achivements/explosion'));
		else
		explosion = new FlxSprite().loadGraphic(Paths.image('achivements/explosiongray'));	
		explosion.screenCenter();
		explosion.y += 432;
		menuItems.add(explosion);

		if (FlxG.save.data.cbt)
		cbt = new FlxSprite().loadGraphic(Paths.image('achivements/cbt'));
		else
		cbt = new FlxSprite().loadGraphic(Paths.image('achivements/cbtgray'));	
		cbt.screenCenter();
		cbt.y += explosion.y + 432 - 216;
		menuItems.add(cbt);

		if (FlxG.save.data.blood)
		blood = new FlxSprite().loadGraphic(Paths.image('achivements/blood'));
		else
		blood = new FlxSprite().loadGraphic(Paths.image('achivements/bloodgray'));	
		blood.screenCenter();
		blood.y += cbt.y + 432 - 216;
		menuItems.add(blood);

		if (FlxG.save.data.jevil)
		jevil = new FlxSprite().loadGraphic(Paths.image('achivements/jevill'));
		else
		jevil = new FlxSprite().loadGraphic(Paths.image('achivements/jevillgray'));	
		jevil.screenCenter();
		jevil.y += blood.y + 432 - 216;
		menuItems.add(jevil);

		if (FlxG.save.data.kade)
		kade = new FlxSprite().loadGraphic(Paths.image('achivements/kade'));
		else
		kade = new FlxSprite().loadGraphic(Paths.image('achivements/kadegray'));	
		kade.screenCenter();
		kade.y += jevil.y + 432 - 216;
		menuItems.add(kade);

		if (FlxG.save.data.hdwgh)
		hdwgh = new FlxSprite().loadGraphic(Paths.image('achivements/hdwgh'));
		else
		hdwgh = new FlxSprite().loadGraphic(Paths.image('achivements/hdwghgray'));	
		hdwgh.screenCenter();
		hdwgh.y += kade.y + 432 - 216;
		menuItems.add(hdwgh);

		if (FlxG.save.data.chungus)
		chungus = new FlxSprite().loadGraphic(Paths.image('achivements/chungus'));
		else
		chungus = new FlxSprite().loadGraphic(Paths.image('achivements/chungusgray'));	
		chungus.screenCenter();
		chungus.y += hdwgh.y + 432 - 216;
		menuItems.add(chungus);

		if (FlxG.save.data.life)
		life = new FlxSprite().loadGraphic(Paths.image('achivements/life'));
		else
		life = new FlxSprite().loadGraphic(Paths.image('achivements/lifegray'));	
		life.screenCenter();
		life.y += chungus.y + 432 - 216;
		menuItems.add(life);

		if (FlxG.save.data.totalmiss == 1000)
		miss = new FlxSprite().loadGraphic(Paths.image('achivements/miss'));
		else
		miss = new FlxSprite().loadGraphic(Paths.image('achivements/missgray'));	
		miss.screenCenter();
		miss.y += life.y + 432 - 216;
		menuItems.add(miss);

		if (FlxG.save.data.death == 100)
		death = new FlxSprite().loadGraphic(Paths.image('achivements/100'));
		else
		death = new FlxSprite().loadGraphic(Paths.image('achivements/100gray'));	
		death.screenCenter();
		death.y += miss.y + 432 - 216;
		menuItems.add(death);

		if (FlxG.save.data.nodeath)
		nodeath = new FlxSprite().loadGraphic(Paths.image('achivements/nodeath'));
		else
		nodeath = new FlxSprite().loadGraphic(Paths.image('achivements/nodeathgray'));	
		nodeath.screenCenter();
		nodeath.y += death.y + 432 - 216;
		menuItems.add(nodeath);

		if (FlxG.save.data.reconnectedfc)
		reconnectedfc = new FlxSprite().loadGraphic(Paths.image('achivements/reconnectedfc'));
		else
		reconnectedfc = new FlxSprite().loadGraphic(Paths.image('achivements/reconnectedfcgray'));	
		reconnectedfc.screenCenter();
		reconnectedfc.y += nodeath.y + 432 - 216;
		menuItems.add(reconnectedfc);

		if (FlxG.save.data.explosionfc)
		explosionfc = new FlxSprite().loadGraphic(Paths.image('achivements/explosionfc'));
		else
		explosionfc = new FlxSprite().loadGraphic(Paths.image('achivements/explosionfcgray'));	
		explosionfc.screenCenter();
		explosionfc.y += reconnectedfc.y + 432 - 216;
		menuItems.add(explosionfc);

		if (FlxG.save.data.cbtfc)
		cbtfc = new FlxSprite().loadGraphic(Paths.image('achivements/cbtfc'));
		else
		cbtfc = new FlxSprite().loadGraphic(Paths.image('achivements/cbtfcgray'));	
		cbtfc.screenCenter();
		cbtfc.y += explosionfc.y + 432 - 216;
		menuItems.add(cbtfc);

		if (FlxG.save.data.bloodfc)
		bloodfc = new FlxSprite().loadGraphic(Paths.image('achivements/bloodfc'));
		else
		bloodfc = new FlxSprite().loadGraphic(Paths.image('achivements/bloodfcgray'));	
		bloodfc.screenCenter();
		bloodfc.y += cbtfc.y + 432 - 216;
		menuItems.add(bloodfc);

		super.create();
	}
	override function update(elapsed:Float)
	{
		if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		backdrops.x -= 1 / (120 / 60);

		backdrops2.x += 1 / (120 / 60);
		backdrops2.y += 1 / (120 / 60);

		if (FlxG.keys.justPressed.DOWN && gay != 15 && canmove)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				canmove = false;
				gay++;
				menuItems.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y - 432},1,{ease: FlxEase.backOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		if (FlxG.keys.justPressed.UP && gay != 0 && canmove)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				canmove = false;
				gay--;
				menuItems.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y + 432},1,{ease: FlxEase.backOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		super.update(elapsed);
	}
	

	function trophygot() {
		var got:FlxSprite = new FlxSprite(-600,10).loadGraphic(Paths.image('unlocked'));
		add(got);
		FlxTween.tween(got,{x: 10},1);
		FlxG.sound.play(Paths.sound('levelup'));
		new FlxTimer().start(1.5, function(tmr:FlxTimer)
			{
				FlxTween.tween(got,{x: -600},1);
			});
	}
}
