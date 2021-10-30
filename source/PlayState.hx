package;


import LuaClass.LuaCamera;
import LuaClass.LuaCharacter;
import lime.media.openal.AL;
import LuaClass.LuaNote;
import flixel.group.FlxSpriteGroup;
import Song.Event;
import openfl.media.Sound;
import flixel.util.FlxGradient;
import openfl.utils.Timer;
import flixel.effects.particles.FlxEmitter;
import sys.io.Process;
#if sys
import sys.io.File;
import smTools.SMFile;
#end
import openfl.ui.KeyLocation;
import flixel.math.FlxVelocity;
import flixel.util.FlxColor;
import openfl.events.Event;
import haxe.EnumTools;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import Replay.Ana;
import Replay.Analysis;
import Random;
#if cpp
import webm.WebmPlayer;
#end
import flixel.input.keyboard.FlxKey;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.helpers.FlxRangeBounds;
import haxe.Exception;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;
import lime.app.Application;
import lime.media.AudioContext;
import lime.media.AudioManager;
import openfl.Lib;
import Section.SwagSection;
import flixel.effects.FlxFlicker;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;

import openfl.filters.BitmapFilter;
import openfl.filters.BlurFilter;
import openfl.filters.ColorMatrixFilter;
#if windows
import Discord.DiscordClient;
#end
#if cpp
import Sys;
import sys.FileSystem;
#end

using StringTools;


class PlayState extends MusicBeatState
{
	public static var instance:PlayState = null;
	public static var aaaaaaaaaaaaaa:Bool = true;

	public static var dia:Bool = true;
	var wiggleEffect:WiggleEffect;

	var seentnt:Bool = false;
	var swagNote:Note;

	public static var SONG:SwagSong;
	public static var isStoryMode:Bool = false;
	public static var storyWeek:Int = 0;
	public static var storyPlaylist:Array<String> = [];
	public static var storyDifficulty:Int = 1;
	public static var weekSong:Int = 0;
	public static var weekScore:Int = 0;
	public static var shits:Int = 0;
	public static var bads:Int = 0;
	public static var goods:Int = 0;
	public static var sicks:Int = 0;

	var xnumber:Int = 0;
	var isx:Bool = false;
	var chromnumber:Float = 0;
	var cantshake:Bool = false;

	var funnynumber:Int = 3;

	private var paused:Bool = false;

	public static var streaming:Bool = false;

	var speed:Float = 1.7;

	var tnttime:Bool = false;
	var checkant:Bool = false;
	var checkbfanim:Bool = false;
	var taps:Int = 0;

	var notetrail:FlxTrail;
	var dadtrail:FlxTrail;
	var trailval:Int = 0;

	public static var storydeaths:Int = 0;

	var ball:Balls;

	var emitterregen:FlxEmitter;
	var emitterpoison:FlxEmitter;
	var emitterinvis:FlxEmitter;
	var emitterstronk:FlxEmitter;
	var emitterweak:FlxEmitter;
	var emitterblind:FlxEmitter;
	var emitterspeed:FlxEmitter;
	var emitterluck:FlxEmitter;

	var regenicon:FlxSprite;
	var poisonicon:FlxSprite;
	var invisicon:FlxSprite;
	var stronkicon:FlxSprite;
	var weakicon:FlxSprite;
	var blindicon:FlxSprite;
	var speedicon:FlxSprite;
	var luckicon:FlxSprite;

	var anttnt:FlxSprite;
	var bfsheild:FlxSprite;
	var boom:FlxSprite;

	private var noteluckyAnim:Bool = false;
	var doof2 = null;

	public static var songPosBG:FlxSprite;

	public var visibleCombos:Array<FlxSprite> = [];

	public var visibleNotes:Array<Note> = [];

	public static var songPosBar:FlxBar;

	public static var rep:Replay;
	public static var loadRep:Bool = false;
	public static var inResults:Bool = false;

	var b:FlxSprite;
	var boobs:FlxSprite;
	var w:FlxSprite;
	var aa:FlxSprite;
	var redthing:FlxSprite;
	var btnt:FlxSprite;
	var btnt2:FlxSprite;

	public static var noteBools:Array<Bool> = [false, false, false, false];

	var songLength:Float = 0;
	var poison:Float = 0;
	var weak:Float = 0;
	var luck:Int = 10;
	var healthincrease:Float = 0.00;
	var regenincrease:Float = 0.00;
	var kadeEngineWatermark:FlxText;

	var hp:FlxText;

	var gaytext:FlxText;

	#if cpp
	// Discord RPC variables
	var storyDifficultyText:String = "";
	var iconRPC:String = "";
	var detailsText:String = "";
	var detailsPausedText:String = "";
	#end

	private var vocals:FlxSound;

	var spadetimer:FlxTimer;
	var scythetimer:FlxTimer;
	var bombtimer:FlxTimer;
	var cumtimer:FlxTimer;

	public static var isSM:Bool = false;
	#if sys
	public static var sm:SMFile;
	public static var pathToSm:String;
	#end

	public var originalX:Float;

	public static var dad:Character;
	public static var gf:Character;
	public static var boyfriend:Boyfriend;

	public var notes:FlxTypedGroup<Note>;

	private var unspawnNotes:Array<Note> = [];

	public var strumLine:FlxSprite;

	var ex1Boppers:FlxSprite;
	var ex2Boppers:FlxSprite;
	var ex3Boppers:FlxSprite;
	var ex4Boppers:FlxSprite;
	var ex5Boppers:FlxSprite;
	var ex6Boppers:FlxSprite;

	var cbt1Boppers:FlxSprite;
	var cbt2Boppers:FlxSprite;
	var cbt3Boppers:FlxSprite;
	var cbt4Boppers:FlxSprite;
	var cbt5Boppers:FlxSprite;
	var cbt6Boppers:FlxSprite;

	private var curSection:Int = 0;

	private var camFollow:FlxObject;

	private static var prevCamFollow:FlxObject;

	public static var strumLineNotes:FlxTypedGroup<StaticArrow> = null;
	public static var playerStrums:FlxTypedGroup<StaticArrow> = null;
	public static var cpuStrums:FlxTypedGroup<StaticArrow> = null;

	

	private var camZooming:Bool = false;
	private var curSong:String = "";

	private var gfSpeed:Int = 1;

	public var health:Float = 1; // making public because sethealth doesnt work without it

	public var healthdr:Float = 100;

	private var combo:Int = 0;

	public static var misses:Int = 0;
	public static var campaignMisses:Int = 0;
	public static var campaignSicks:Int = 0;
	public static var campaignGoods:Int = 0;
	public static var campaignBads:Int = 0;
	public static var campaignShits:Int = 0;
	public static var campaigndeaths:Int = 0;

	public var accuracy:Float = 0.00;

	private var accuracyDefault:Float = 0.00;
	private var totalNotesHit:Float = 0;
	private var totalNotesHitDefault:Float = 0;
	private var totalPlayed:Int = 0;
	private var ss:Bool = false;

	var dodown:Bool = false;
	var doup:Bool = false;

	var fakemode:Bool = false;

	var realfakemode:Bool = false;

	var canhurt:Bool = false;

	var candie:Bool = true;

	var getem:Bool = false;
	var made:Bool = false;

	var haseffect = true;
	var sad:FlxSprite;

	private var healthBarBG:FlxSprite;
	private var healthBar:FlxBar;
	private var songPositionBar:Float = 0;

	private var hpbardr:FlxBar;

	var aaa:Float;

	private var generatedMusic:Bool = false;
	private var startingSong:Bool = false;

	public var iconP1:HealthIcon; // making these public again because i may be stupid
	public var iconP2:HealthIcon; // what could go wrong?
	public var camHUD:FlxCamera;
	public var camdr:FlxCamera;
	public var aaasss:FlxCamera;
	public var camSustains:FlxCamera;
	public var camNotes:FlxCamera;

	var drbar:FlxSprite;

	private var camGame:FlxCamera;
	public var cannotDie = false;

	public static var offsetTesting:Bool = false;

	public var isSMFile:Bool = false;

	var notesHitArray:Array<Date> = [];
	var currentFrames:Int = 0;
	var idleToBeat:Bool = false; // change if bf and dad would idle to the beat of the song
	var idleBeat:Int = 2; // how frequently bf and dad would play their idle animation(1 - every beat, 2 - every 2 beats and so on)

	public var dialogue:Array<String> = ['dad:blah blah blah', 'bf:coolswag'];
	public var dialogue2:Array<String> = ['dad:blah blah blah', 'bf:coolswag'];

	public static var trainSound:FlxSound;

	var songName:FlxText;
	var hptxt:FlxText;

	public var currentSection:SwagSection;

	var fc:Bool = true;

	var canarrow:Bool = false;

	var wiggleShit:WiggleEffect = new WiggleEffect();

	var talking:Bool = true;

	public var songScore:Int = 0;

	var songScoreDef:Int = 0;
	var scoreTxt:FlxText;
	var replayTxt:FlxText;

	public static var campaignScore:Int = 0;

	public static var daPixelZoom:Float = 6;

	public static var theFunne:Bool = true;

	var funneEffect:FlxSprite;
	var inCutscene:Bool = false;
	var usedTimeTravel:Bool = false;

	public var randomVar = false;

	public static var Stage:Stage;

	public static var repPresses:Int = 0;
	public static var repReleases:Int = 0;

	public static var timeCurrently:Float = 0;
	public static var timeCurrentlyR:Float = 0;

	// Will fire once to prevent debug spam messages and broken animations
	private var triggeredAlready:Bool = false;

	// Will decide if she's even allowed to headbang at all depending on the song
	private var allowedToHeadbang:Bool = false;

	// Per song additive offset
	public static var songOffset:Float = 0;

	// BotPlay text
	private var botPlayState:FlxText;
	// Replay shit
	private var saveNotes:Array<Dynamic> = [];
	private var saveJudge:Array<String> = [];
	private var replayAna:Analysis = new Analysis(); // replay analysis

	public static var highestCombo:Int = 0;

	public var executeModchart = false;

	var blackblind:FlxSprite;

	var redeffect:FlxSprite;
	var redeffect2:FlxSprite;

	var blade:FlxSprite;
	var blade2:FlxSprite;

	var bladef:FlxSprite;
	var blade2f:FlxSprite;

	// Animation common suffixes
	private var dataSuffix:Array<String> = ['LEFT', 'DOWN', 'UP', 'RIGHT'];
	private var dataColor:Array<String> = ['purple', 'blue', 'green', 'red'];

	public static var startTime = 0.0;

	// API stuff

	public function addObject(object:FlxBasic)
	{
		add(object);
	}

	public function removeObject(object:FlxBasic)
	{
		remove(object);
	}

	var songLowercase = StringTools.replace(PlayState.SONG.song, " ", "-").toLowerCase();

	var box:FlxSprite;
	var bigbox:FlxSprite;
	var boxblack:FlxSprite;

	var cum:FlxTypedGroup<Heartbullet>;
	var heartbull:FlxTypedGroup<Heartlol>;

	var spadebomb:FlxTypedGroup<Spadebomb>;
	var spadebullet:FlxTypedGroup<Spadebullet>;

	var scythebomb:FlxTypedGroup<Scythebomb>;
	var scythebullet:FlxTypedGroup<Scythebullet>;

	var tntthing:FlxTypedGroup<TNT>;
	var tntthing2:FlxTypedGroup<TNTfall>;

	var arrowattack:FlxTypedGroup<Arrowattack>;

	var scythelight:FlxTypedGroup<Scythelight>;
	var slight:FlxTypedGroup<Light>;

	var filtershit:Array<BitmapFilter> = [];
	var waveSprite:FlxEffectSprite;
	var waveEffect:FlxWaveEffect;

	override public function create()
	{
		FlxG.mouse.visible = false;
		instance = this;

		if (FlxG.save.data.fpsCap > 290)
			(cast(Lib.current.getChildAt(0), Main)).setFPSCap(800);

		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		sicks = 0;
		bads = 0;
		shits = 0;
		goods = 0;
		storydeaths = 0;
		
		misses = 0;

		highestCombo = 0;
		repPresses = 0;
		repReleases = 0;
		inResults = false;

		PlayStateChangeables.useDownscroll = FlxG.save.data.downscroll;
		PlayStateChangeables.safeFrames = FlxG.save.data.frames;
		PlayStateChangeables.scrollSpeed = FlxG.save.data.scrollSpeed;
		PlayStateChangeables.botPlay = FlxG.save.data.botplay;
		PlayStateChangeables.Optimize = FlxG.save.data.optimize;
		PlayStateChangeables.zoom = FlxG.save.data.zoom;

		// pre lowercasing the song name (create)

		
		switch (songLowercase)
		{
			case 'dad-battle':
				songLowercase = 'dadbattle';
			case 'philly-nice':
				songLowercase = 'philly';
		}

		if (songLowercase == 'exptrollgation')
			{
				FlxG.save.data.seenjevil = true;
				SONG.noteStyle = 'pixel';
				PlayStateChangeables.Optimize = false;
			}

		PlayStateChangeables.Optimize = false;
			

		removedVideo = false;

		#if cpp
		executeModchart = FileSystem.exists(Paths.lua(songLowercase + "/modchart"));
		if (isSM)
			executeModchart = FileSystem.exists(pathToSm + "/modchart.lua");
		if (executeModchart)
			PlayStateChangeables.Optimize = false;
		#end
		#if !cpp
		executeModchart = false; // FORCE disable for non cpp targets
		#end

		trace('Mod chart: ' + executeModchart + " - " + Paths.lua(songLowercase + "/modchart"));



		#if windows
		// Making difficulty text for Discord Rich Presence.
		storyDifficultyText = CoolUtil.difficultyFromInt(storyDifficulty);

		iconRPC = SONG.player2;

		// To avoid having duplicate images in Discord assets
		switch (iconRPC)
		{
			case 'senpai-angry':
				iconRPC = 'senpai';
			case 'monster-christmas':
				iconRPC = 'monster';
			case 'mom-car':
				iconRPC = 'mom';
		}

		// String that contains the mode defined here so it isn't necessary to call changePresence for each mode
		if (isStoryMode)
		{
			detailsText = "Story Mode: Week " + storyWeek;
		}
		else
		{
			detailsText = "Freeplay";
		}

		// String for when the game is paused
		detailsPausedText = "Paused - " + detailsText;

		// Updating Discord Rich Presence.
		DiscordClient.changePresence(detailsText
			+ " "
			+ SONG.song
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"\nAcc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC);
		#end

		// var gameCam:FlxCamera = FlxG.camera;

		FlxG.game.setFilters(filtershit);
		
		FlxG.game.filtersEnabled = false;

		camGame = new FlxCamera();
		camHUD = new FlxCamera();
		camdr = new FlxCamera();
		aaasss = new FlxCamera();
		camHUD.bgColor.alpha = 0;
		camdr.bgColor.alpha = 0;
		aaasss.bgColor.alpha = 0;
		camSustains = new FlxCamera();
		camSustains.bgColor.alpha = 0;
		camNotes = new FlxCamera();
		camNotes.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camHUD);
		FlxG.cameras.add(camSustains);
		FlxG.cameras.add(camNotes);
		FlxG.cameras.add(camdr);
		FlxG.cameras.add(aaasss);

		camGame.setFilters(filtershit);
		camdr.setFilters(filtershit);
		camHUD.setFilters(filtershit);
		camGame.filtersEnabled = true;
		camdr.filtersEnabled = true;
		camHUD.filtersEnabled = true;

		filtershit.push(coolcromaeffect);

		camHUD.zoom = PlayStateChangeables.zoom;
		wiggleShit.effectType = WiggleEffectType.DREAMY;
		wiggleShit.waveAmplitude = 0.01;
		wiggleShit.waveFrequency = 60;
		wiggleShit.waveSpeed = 0.8;

		FlxCamera.defaultCameras = [camGame];

		persistentUpdate = true;
		persistentDraw = true;

		if (SONG == null)
			SONG = Song.loadFromJson('tutorial', 'tutorial');

		Conductor.mapBPMChanges(SONG);
		Conductor.changeBPM(SONG.bpm);


		Conductor.bpm = SONG.bpm;

		if (SONG.eventObjects == null)
			{
				SONG.eventObjects = [new Song.Event("Init BPM",0,SONG.bpm,"BPM Change")];
			}

		TimingStruct.clearTimings();

		var currentIndex = 0;
		for (i in SONG.eventObjects)
		{
			if (i.type == "BPM Change")
			{
                var beat:Float = i.position;

                var endBeat:Float = Math.POSITIVE_INFINITY;

				var bpm = i.value;

                TimingStruct.addTiming(beat,bpm,endBeat, 0); // offset in this case = start time since we don't have a offset
				
                if (currentIndex != 0)
                {
                    var data = TimingStruct.AllTimings[currentIndex - 1];
                    data.endBeat = beat;
                    data.length = (data.endBeat - data.startBeat) / (data.bpm / 60);
					TimingStruct.AllTimings[currentIndex].startTime = data.startTime + data.length;
                }

				currentIndex++;
			}
		}


		recalculateAllSectionTimes();
	


		trace('INFORMATION ABOUT WHAT U PLAYIN WIT:\nFRAMES: ' + PlayStateChangeables.safeFrames + '\nZONE: ' + Conductor.safeZoneOffset + '\nTS: '
			+ Conductor.timeScale + '\nBotPlay : ' + PlayStateChangeables.botPlay);

		switch(songLowercase)
		{
			//if the song has dialogue, so we don't accidentally try to load a nonexistant file and crash the game
			case 'reconnected':
					dialogue = CoolUtil.coolTextFile(Paths.txt('data/$songLowercase/dialouge'));
				if (streaming)
					dialogue = CoolUtil.coolTextFile(Paths.txt('data/$songLowercase/lol'));
			case 'cbt' | 'explosive':
				dialogue = CoolUtil.coolTextFile(Paths.txt('data/$songLowercase/dialouge'));
			case 'blood-shed':
				dialogue2 = CoolUtil.coolTextFile(Paths.txt('data/$songLowercase/dialougeend'));
		}

		// defaults if no stage was found in chart
		var stageCheck:String = 'stage';

		if (SONG.stage == null)
		{
			switch (storyWeek)
			{
				case 2:
					stageCheck = 'halloween';
				case 3:
					stageCheck = 'philly';
				case 4:
					stageCheck = 'limo';
				case 5:
					if (songLowercase == 'winter-horrorland')
					{
						stageCheck = 'mallEvil';
					}
					else
					{
						stageCheck = 'mall';
					}
				case 6:
					if (songLowercase == 'thorns')
					{
						stageCheck = 'schoolEvil';
					}
					else
					{
						stageCheck = 'school';
					}
					// i should check if its stage (but this is when none is found in chart anyway)
			}
		}
		else
		{
			stageCheck = SONG.stage;
		}


		// defaults if no gf was found in chart
		var gfCheck:String = 'gf';

		if (SONG.gfVersion == null)
		{
			switch (storyWeek)
			{
				case 4:
					gfCheck = 'gf-car';
				case 5:
					gfCheck = 'gf-christmas';
				case 6:
					gfCheck = 'gf-pixel';
			}
		}
		else
		{
			gfCheck = SONG.gfVersion;
		}

		if (songLowercase != 'blood-shed')
			{
				if (FlxG.random.bool(50))
					{
						gf = new Character(380, 30, 'gf2');
					}
				else
					{
						gf = new Character(380, 30, 'gf2.5');
					}
			}

			if (songLowercase == 'blood-shed')
			gf = new Character(380, 30, 'gf3');

			if (songLowercase == 'exptrollgation')
				gf = new Character(380, 30, 'gf-pixel');



		if (gf.frames == null)
		{
			#if debug
			FlxG.log.warn(["Couldn't load gf: " + gfCheck + ". Loading default gf"]);
			#end
			gf = new Character(770, 450, 'gf');
		}

		boyfriend = new Boyfriend(770, 450, SONG.player1);
		

		if (curSong.toLowerCase() != 'tutorial-remix')
			{
				boyfriend.y += 10;
			}

		if (boyfriend.frames == null)
		{
			#if debug
			FlxG.log.warn(["Couldn't load boyfriend: " + SONG.player1 + ". Loading default boyfriend"]);
			#end
			boyfriend = new Boyfriend(770, 450, 'bf');
		}

		if (SONG.song != 'Tutorial-remix' && songLowercase != 'exptrollgation' && songLowercase != 'blood-shed')
			dad = new Character(30, 100, "antrollia");

		if (songLowercase == 'exptrollgation')
			dad = new Character(30, 100, "jevillia");

		if (SONG.song == 'Tutorial-remix')
			dad = new Character(100, 100, "gf");

		if (songLowercase == 'blood-shed')
			dad = new Character(-50, 200, "antcrazy");

		if (dad.frames == null)
		{
			#if debug
			FlxG.log.warn(["Couldn't load opponent: " + SONG.player2 + ". Loading default opponent"]);
			#end
			dad = new Character(100, 100, 'dad');
		}

		ball = new Balls(boyfriend.x,boyfriend.y);
		ball.cameras = [camdr];
		ball.screenCenter();
		ball.x -= 405;
		ball.y += 220;


		if (!PlayStateChangeables.Optimize)
			{

				switch (songLowercase)
				{
					case 'exptrollgation':
						Stage = new Stage('jevilbg');
					case 'blood-shed':
						dadtrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
						add(dadtrail);
						Stage = new Stage('sidehell');
					default:
						Stage = new Stage('sidewalk');
				}
				if (SONG.song == 'Tutorial-remix')
					{
						Stage = new Stage(SONG.stage);
					}
				for (i in Stage.toAdd)
				{
					add(i);
				}
				switch (songLowercase)
				{
					case 'blood-shed':
						redthing = new FlxSprite(-640, -300).loadGraphic(Paths.image('sidewalk/bg2'));
						redthing.antialiasing = true;
						redthing.active = false;
						redthing.scale.set(1.1, 1.1);
						add(redthing);
				}
				for (index => array in Stage.layInFront)
				{

					switch (index)
					{
						case 0:
							add(gf);
							for (bg in array)
								add(bg);
						case 1:
							for (bg in array)
								add(bg);
						case 2:
							if (SONG.song != 'cbt')
								{
									for (i in 0 ... 3)
										{
											emitterregen = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterregen.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterregen.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterregen.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterregen.launchMode = FlxEmitterMode.CIRCLE;
											emitterregen.alpha.set(0, 0, 0, 0);
											emitterregen.lifespan.set(4);
											emitterregen.velocity.set(400,-400,-600,600,500,-500);
											add(emitterregen);
											emitterregen.color.set(0xFFff0000);
											emitterregen.speed.set(20,25);
											emitterregen.angularVelocity.set(20,-20);
											emitterregen.start(false, 0.05, 100000);
		
											emitterpoison = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterpoison.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterpoison.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterpoison.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterpoison.launchMode = FlxEmitterMode.CIRCLE;
											emitterpoison.alpha.set(0, 0, 0, 0);
											emitterpoison.lifespan.set(4);
											emitterpoison.velocity.set(400,-400,-600,600,500,-500);
											add(emitterpoison);
											emitterpoison.color.set(0xFF00ff16);
											emitterpoison.speed.set(20,25);
											emitterpoison.angularVelocity.set(20,-20);
											emitterpoison.start(false, 0.05, 100000);
		
											emitterinvis = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterinvis.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterinvis.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterinvis.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterinvis.launchMode = FlxEmitterMode.CIRCLE;
											emitterinvis.alpha.set(0, 0, 0, 0);
											emitterinvis.lifespan.set(4);
											emitterinvis.velocity.set(400,-400,-600,600,500,-500);
											add(emitterinvis);
											emitterinvis.color.set(0xFF8ac3c8);
											emitterinvis.speed.set(20,25);
											emitterinvis.angularVelocity.set(20,-20);
											emitterinvis.start(false, 0.05, 100000);
		
											emitterspeed = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterspeed.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterspeed.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterspeed.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterspeed.launchMode = FlxEmitterMode.CIRCLE;
											emitterspeed.alpha.set(0, 0, 0, 0);
											emitterspeed.lifespan.set(4);
											emitterspeed.velocity.set(400,-400,-600,600,500,-500);
											add(emitterspeed);
											emitterspeed.color.set(0xFFffe0ff);
											emitterspeed.speed.set(20,25);
											emitterspeed.angularVelocity.set(20,-20);
											emitterspeed.start(false, 0.05, 100000);
		
											emitterstronk = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterstronk.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterstronk.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterstronk.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterstronk.launchMode = FlxEmitterMode.CIRCLE;
											emitterstronk.alpha.set(0, 0, 0, 0);
											emitterstronk.lifespan.set(4);
											emitterstronk.velocity.set(400,-400,-600,600,500,-500);
											add(emitterstronk);
											emitterstronk.color.set(0xFF4e0313);
											emitterstronk.speed.set(20,25);
											emitterstronk.angularVelocity.set(20,-20);
											emitterstronk.start(false, 0.05, 100000);
		
											emitterweak = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterweak.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterweak.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterweak.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterweak.launchMode = FlxEmitterMode.CIRCLE;
											emitterweak.alpha.set(0, 0, 0, 0);
											emitterweak.lifespan.set(4);
											emitterweak.velocity.set(400,-400,-600,600,500,-500);
											add(emitterweak);
											emitterweak.color.set(0xFF0a042f);
											emitterweak.speed.set(20,25);
											emitterweak.angularVelocity.set(20,-20);
											emitterweak.start(false, 0.05, 100000);
		
											emitterblind = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterblind.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterblind.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterblind.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterblind.launchMode = FlxEmitterMode.CIRCLE;
											emitterblind.alpha.set(0, 0, 0, 0);
											emitterblind.lifespan.set(4);
											emitterblind.velocity.set(400,-400,-600,600,500,-500);
											add(emitterblind);
											emitterblind.color.set(0xFF6f7b3b);
											emitterblind.speed.set(20,25);
											emitterblind.angularVelocity.set(20,-20);
											emitterblind.start(false, 0.05, 100000);

											emitterluck = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
											emitterluck.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
											emitterluck.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
											emitterluck.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
											emitterluck.launchMode = FlxEmitterMode.CIRCLE;
											emitterluck.alpha.set(0, 0, 0, 0);
											emitterluck.lifespan.set(4);
											emitterluck.velocity.set(400,-400,-600,600,500,-500);
											add(emitterluck);
											emitterluck.color.set(0xFF092f04);
											emitterluck.speed.set(20,25);
											emitterluck.angularVelocity.set(20,-20);
											emitterluck.start(false, 0.05, 100000);
										}
									if (SONG.song == 'Tutorial-remix')
										{
											add(dad);
											add(boyfriend);
										}
										else
											{
												add(boyfriend);
												add(dad);

												var lol = Paths.getSparrowAtlas('BOYFRIEND','shared',true);
												bfsheild = new FlxSprite(boyfriend.x, boyfriend.y);
												bfsheild.frames = lol;
												bfsheild.animation.addByPrefix('def', 'BF DOWN SHIELD', 24, false);
												bfsheild.animation.addByPrefix('damn', 'BF DOWN SHIELD', 24, false);
												bfsheild.animation.addByPrefix('atk', 'bfa pre attack', 24, false);
												bfsheild.alpha = 0;
												bfsheild.offset.set(-28, -45);
												bfsheild.animation.play('damn');
												add(bfsheild);
						
												var uh = Paths.getSparrowAtlas('Antrollia','shared',true);
												anttnt = new FlxSprite(dad.x, dad.y);
												anttnt.frames = uh;
												anttnt.animation.addByPrefix('tnt', 'antrollia tnt', 27, false);
												anttnt.alpha = 0;
												anttnt.animation.play('tnt');
												anttnt.offset.set(108, -61);
												add(anttnt);
											}
								}
							
							for (bg in array)
								add(bg);
					}
				}
			}

			if (SONG.song == 'explosive')
				{
					gaytext = new FlxText(FlxG.width / 2 - 235, 50, 0, "SPAM SPACE", 20);
					gaytext.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
					add(gaytext);
					gaytext.alpha = 0;
					ex1Boppers = new FlxSprite(-540, -50);
					ex1Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Less Left Background');
					ex1Boppers.animation.addByPrefix('idle', 'Crowd Less People LEFT Background', 24, false);
					ex1Boppers.antialiasing = FlxG.save.data.antialiasing;
					ex1Boppers.updateHitbox();
					add(ex1Boppers);
		
					ex2Boppers = new FlxSprite(1070, 220);
					ex2Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Less Right Background');
					ex2Boppers.animation.addByPrefix('idle', 'Crowd Less People RIGHT Background', 24, false);
					ex2Boppers.antialiasing = FlxG.save.data.antialiasing;
					ex2Boppers.updateHitbox();
					add(ex2Boppers);
		
					ex4Boppers = new FlxSprite(1300, 260);
					ex4Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Less Right Main Ground');
					ex4Boppers.animation.addByPrefix('idle', 'Crowd Less People RIGHT Main Ground', 24, false);
					ex4Boppers.antialiasing = FlxG.save.data.antialiasing;
					ex4Boppers.updateHitbox();
					add(ex4Boppers);
		
					ex5Boppers = new FlxSprite(-860, 360);
					ex5Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Less Left Main Ground');
					ex5Boppers.animation.addByPrefix('idle', 'Crowd Less People LEFT Main Ground', 24, false);
					ex5Boppers.antialiasing = FlxG.save.data.antialiasing;
					ex5Boppers.updateHitbox();
					add(ex5Boppers);
		
					ex3Boppers = new FlxSprite(-690, 510);
					ex3Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Less Left Forground');
					ex3Boppers.animation.addByPrefix('idle', 'Crowd Less People LEFT Forground', 24, false);
					ex3Boppers.antialiasing = FlxG.save.data.antialiasing;
					ex3Boppers.updateHitbox();
					ex3Boppers.scale.set(0.9,0.9);
					add(ex3Boppers);
		
					ex6Boppers = new FlxSprite(1230, 540);
					ex6Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Less Right Forground');
					ex6Boppers.animation.addByPrefix('idle', 'Crowd Less People RIGHT Forground', 24, false);
					ex6Boppers.antialiasing = FlxG.save.data.antialiasing;
					ex6Boppers.updateHitbox();
					add(ex6Boppers);
				}

				if (SONG.song == 'cbt')
					{
						cbt1Boppers = new FlxSprite(-540, -60);
						cbt1Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Left Background');
						cbt1Boppers.animation.addByPrefix('idle', 'Crowd LEFT Background', 24, false);
						cbt1Boppers.antialiasing = FlxG.save.data.antialiasing;
						cbt1Boppers.updateHitbox();
						add(cbt1Boppers);
			
						cbt2Boppers = new FlxSprite(880, 40);
						cbt2Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Right Background');
						cbt2Boppers.animation.addByPrefix('idle', 'Crowd RIGHT Background', 24, false);
						cbt2Boppers.antialiasing = FlxG.save.data.antialiasing;
						cbt2Boppers.updateHitbox();
						add(cbt2Boppers);

						for (i in 0 ... 3)
							{
								emitterregen = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterregen.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterregen.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterregen.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterregen.launchMode = FlxEmitterMode.CIRCLE;
								emitterregen.alpha.set(0, 0, 0, 0);
								emitterregen.lifespan.set(4);
								emitterregen.velocity.set(400,-400,-600,600,500,-500);
								add(emitterregen);
								emitterregen.color.set(0xFFff0000);
								emitterregen.speed.set(20,25);
								emitterregen.angularVelocity.set(20,-20);
								emitterregen.start(false, 0.05, 100000);

								emitterpoison = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterpoison.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterpoison.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterpoison.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterpoison.launchMode = FlxEmitterMode.CIRCLE;
								emitterpoison.alpha.set(0, 0, 0, 0);
								emitterpoison.lifespan.set(4);
								emitterpoison.velocity.set(400,-400,-600,600,500,-500);
								add(emitterpoison);
								emitterpoison.color.set(0xFF00ff16);
								emitterpoison.speed.set(20,25);
								emitterpoison.angularVelocity.set(20,-20);
								emitterpoison.start(false, 0.05, 100000);

								emitterinvis = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterinvis.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterinvis.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterinvis.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterinvis.launchMode = FlxEmitterMode.CIRCLE;
								emitterinvis.alpha.set(0, 0, 0, 0);
								emitterinvis.lifespan.set(4);
								emitterinvis.velocity.set(400,-400,-600,600,500,-500);
								add(emitterinvis);
								emitterinvis.color.set(0xFF8ac3c8);
								emitterinvis.speed.set(20,25);
								emitterinvis.angularVelocity.set(20,-20);
								emitterinvis.start(false, 0.05, 100000);

								emitterspeed = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterspeed.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterspeed.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterspeed.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterspeed.launchMode = FlxEmitterMode.CIRCLE;
								emitterspeed.alpha.set(0, 0, 0, 0);
								emitterspeed.lifespan.set(4);
								emitterspeed.velocity.set(400,-400,-600,600,500,-500);
								add(emitterspeed);
								emitterspeed.color.set(0xFFffe0ff);
								emitterspeed.speed.set(20,25);
								emitterspeed.angularVelocity.set(20,-20);
								emitterspeed.start(false, 0.05, 100000);

								emitterstronk = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterstronk.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterstronk.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterstronk.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterstronk.launchMode = FlxEmitterMode.CIRCLE;
								emitterstronk.alpha.set(0, 0, 0, 0);
								emitterstronk.lifespan.set(4);
								emitterstronk.velocity.set(400,-400,-600,600,500,-500);
								add(emitterstronk);
								emitterstronk.color.set(0xFF4e0313);
								emitterstronk.speed.set(20,25);
								emitterstronk.angularVelocity.set(20,-20);
								emitterstronk.start(false, 0.05, 100000);

								emitterweak = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterweak.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterweak.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterweak.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterweak.launchMode = FlxEmitterMode.CIRCLE;
								emitterweak.alpha.set(0, 0, 0, 0);
								emitterweak.lifespan.set(4);
								emitterweak.velocity.set(400,-400,-600,600,500,-500);
								add(emitterweak);
								emitterweak.color.set(0xFF0a042f);
								emitterweak.speed.set(20,25);
								emitterweak.angularVelocity.set(20,-20);
								emitterweak.start(false, 0.05, 100000);

								emitterblind = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterblind.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterblind.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterblind.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterblind.launchMode = FlxEmitterMode.CIRCLE;
								emitterblind.alpha.set(0, 0, 0, 0);
								emitterblind.lifespan.set(4);
								emitterblind.velocity.set(400,-400,-600,600,500,-500);
								add(emitterblind);
								emitterblind.color.set(0xFF6f7b3b);
								emitterblind.speed.set(20,25);
								emitterblind.angularVelocity.set(20,-20);
								emitterblind.start(false, 0.05, 100000);

								emitterluck = new FlxEmitter(boyfriend.x + 230, boyfriend.y + 210);
								emitterluck.loadParticles(Paths.image('Particlestuff' + i, 'shared'), 500, 16, true);
								emitterluck.scale.set(2, 2, 2, 2, 2, 2, 1.5, 1.5);
								emitterluck.drag.set(-35, 35, 40, -40, -45, 45, 45, -45);
								emitterluck.launchMode = FlxEmitterMode.CIRCLE;
								emitterluck.alpha.set(0, 0, 0, 0);
								emitterluck.lifespan.set(4);
								emitterluck.velocity.set(400,-400,-600,600,500,-500);
								add(emitterluck);
								emitterluck.color.set(0xFF092f04);
								emitterluck.speed.set(20,25);
								emitterluck.angularVelocity.set(20,-20);
								emitterluck.start(false, 0.05, 100000);
							}
						add(boyfriend);
						add(dad);

						var lol = Paths.getSparrowAtlas('BOYFRIEND','shared',true);
						bfsheild = new FlxSprite(boyfriend.x, boyfriend.y);
						bfsheild.frames = lol;
						bfsheild.animation.addByPrefix('def', 'BF DOWN SHIELD', 24, false);
						bfsheild.animation.addByPrefix('damn', 'BF DOWN SHIELD', 24, false);
						bfsheild.animation.addByPrefix('atk', 'bfa pre attack', 17, false);
						bfsheild.alpha = 0;
						bfsheild.animation.play('damn');
						bfsheild.offset.set(-28, -45);
						add(bfsheild);

						var uh = Paths.getSparrowAtlas('Antrollia','shared',true);
						anttnt = new FlxSprite(dad.x, dad.y);
						anttnt.frames = uh;
						anttnt.animation.addByPrefix('tnt', 'antrollia tnt', 24, false);
						anttnt.alpha = 0;
						anttnt.animation.play('tnt');
						anttnt.offset.set(108, -61);
						add(anttnt);
			
						cbt4Boppers = new FlxSprite(1200, 260);
						cbt4Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Right Mainground');
						cbt4Boppers.animation.addByPrefix('idle', 'Crowd RIGHT Mainground', 24, false);
						cbt4Boppers.antialiasing = FlxG.save.data.antialiasing;
						cbt4Boppers.updateHitbox();
						add(cbt4Boppers);
			
						cbt5Boppers = new FlxSprite(-860, 360);
						cbt5Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Left Main Ground');
						cbt5Boppers.animation.addByPrefix('idle', 'Crowd LEFT Main Ground', 24, false);
						cbt5Boppers.antialiasing = FlxG.save.data.antialiasing;
						cbt5Boppers.updateHitbox();
						add(cbt5Boppers);
			
						cbt3Boppers = new FlxSprite(-780, 580);
						cbt3Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Left Forground');
						cbt3Boppers.animation.addByPrefix('idle', 'Crowd LEFT Forground', 24, false);
						cbt3Boppers.antialiasing = FlxG.save.data.antialiasing;
						cbt3Boppers.updateHitbox();
						cbt3Boppers.scale.set(0.9,0.9);
						add(cbt3Boppers);
			
						cbt6Boppers = new FlxSprite(1180, 540);
						cbt6Boppers.frames = Paths.getSparrowAtlas('sidewalk/Crowd Right Forground');
						cbt6Boppers.animation.addByPrefix('idle', 'Crowd RIGHT Forground', 24, false);
						cbt6Boppers.antialiasing = FlxG.save.data.antialiasing;
						cbt6Boppers.updateHitbox();
						add(cbt6Boppers);
					}


		var da:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('explosion', 'shared');
		boom = new FlxSprite(10, 10);
		boom.frames = da;
		boom.updateHitbox();
		boom.animation.addByPrefix('ka', 'explosion', 24, false);
		boom.animation.play('ka');
		boom.alpha = 0;
		add(boom);

		var camPos:FlxPoint = new FlxPoint(dad.getGraphicMidpoint().x, dad.getGraphicMidpoint().y);

		switch (dad.curCharacter)
		{
			case 'gf':
				dad.setPosition(gf.x, gf.y);
				dad.y += 10;
				gf.visible = false;
				if (isStoryMode)
				{
					camPos.x += 600;
					tweenCamIn();
				}

			case "spooky":
				dad.y += 200;
			case "monster":
				dad.y += 100;
			case 'monster-christmas':
				dad.y += 130;
			case 'dad':
				camPos.x += 400;
			case 'pico':
				camPos.x += 600;
				dad.y += 300;
			case 'parents-christmas':
				dad.x -= 500;
			case 'senpai':
				dad.x += 150;
				dad.y += 360;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'senpai-angry':
				dad.x += 150;
				dad.y += 360;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'spirit':
				if (FlxG.save.data.distractions)
				{
					// trailArea.scrollFactor.set();
					if (!PlayStateChangeables.Optimize)
					{
						var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
						// evilTrail.changeValuesEnabled(false, false, false, false);
						// evilTrail.changeGraphic()
						add(evilTrail);
					}
					// evilTrail.scrollFactor.set(1.1, 1.1);
				}

				dad.x -= 150;
				dad.y += 100;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
		}


		// REPOSITIONING PER STAGE
		switch (Stage.curStage)
		{
			case 'limo':
				boyfriend.y -= 220;
				boyfriend.x += 260;
				if (FlxG.save.data.distractions)
				{
					resetFastCar();
				}
			case 'jevilbg':
				gf.x = -84;
				gf.y = 72;

				boyfriend.x = -116;
				boyfriend.y = 267;

				dad.x += 760;
				dad.y += 150;

				gf.y += 20;
				boyfriend.y += 20;
				gf.x -= 70;
				boyfriend.x -= 70;

			case 'mall':
				boyfriend.x += 200;

			case 'mallEvil':
				boyfriend.x += 320;
				dad.y -= 80;
			case 'school':
				boyfriend.x += 200;
				boyfriend.y += 220;
				gf.x += 180;
				gf.y += 300;
			case 'schoolEvil':
				boyfriend.x += 200;
				boyfriend.y += 220;
				gf.x += 180;
				gf.y += 300;
		}

		if (loadRep)
		{
			FlxG.watch.addQuick('rep rpesses', repPresses);
			FlxG.watch.addQuick('rep releases', repReleases);
			// FlxG.watch.addQuick('Queued',inputsQueued);

			PlayStateChangeables.useDownscroll = rep.replay.isDownscroll;
			PlayStateChangeables.safeFrames = rep.replay.sf;
			PlayStateChangeables.botPlay = true;
		}

		trace('uh ' + PlayStateChangeables.safeFrames);

		trace("SF CALC: " + Math.floor((PlayStateChangeables.safeFrames / 60) * 1000));

		var doof = null;
		if (isStoryMode)
			{
				
				doof = new DialogueBox(false, dialogue);
				doof.scrollFactor.set();
				doof.finishThing = startCountdown;

				doof2 = new DialogueBox(false, dialogue2);
				doof2.scrollFactor.set();
				doof2.finishThing = endSong;
			}
		

		Conductor.songPosition = -5000;

		strumLine = new FlxSprite(0, 50).makeGraphic(FlxG.width, 10);
		strumLine.scrollFactor.set();

		if (PlayStateChangeables.useDownscroll)
			strumLine.y = FlxG.height - 165;

		strumLineNotes = new FlxTypedGroup<StaticArrow>();
		add(strumLineNotes);

		playerStrums = new FlxTypedGroup<StaticArrow>();
		cpuStrums = new FlxTypedGroup<StaticArrow>();

		generateStaticArrows(0);
		generateStaticArrows(1);

		// startCountdown();

		if (SONG.song == null)
			trace('song is null???');
		else
			trace('song looks gucci');

		generateSong(SONG.song);

		#if cpp
		// pre lowercasing the song name (startCountdown)
		var songLowercase = StringTools.replace(PlayState.SONG.song, " ", "-").toLowerCase();
		switch (songLowercase)
		{
			case 'dad-battle':
				songLowercase = 'dadbattle';
			case 'philly-nice':
				songLowercase = 'philly';
		}
		if (executeModchart)
		{
			luaModchart = ModchartState.createModchartState(isStoryMode);
			luaModchart.executeState('start', [songLowercase]);
		}
		#end

		if (executeModchart)
			{
				new LuaCamera(camGame,"camGame").Register(ModchartState.lua);
				new LuaCamera(camHUD,"camHUD").Register(ModchartState.lua);
				new LuaCamera(camSustains,"camSustains").Register(ModchartState.lua);
				new LuaCamera(camSustains,"camNotes").Register(ModchartState.lua);
				new LuaCharacter(dad,"dad").Register(ModchartState.lua);
				new LuaCharacter(gf,"gf").Register(ModchartState.lua);
				new LuaCharacter(boyfriend,"boyfriend").Register(ModchartState.lua);
			}
		var index = 0;

		if (startTime != 0)
			{
				var toBeRemoved = [];
				for(i in 0...notes.members.length)
				{
					var dunceNote:Note = notes.members[i];
	
					if (dunceNote.strumTime - startTime <= 0)
						toBeRemoved.push(dunceNote);
					else 
					{
						if (PlayStateChangeables.useDownscroll && !doup || dodown)
						{
							if (dunceNote.mustPress)
								dunceNote.y = (playerStrums.members[Math.floor(Math.abs(dunceNote.noteData))].y
									* (startTime - dunceNote.strumTime) * FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
										2)) - dunceNote.noteYOff;
							else
								dunceNote.y = (strumLineNotes.members[Math.floor(Math.abs(dunceNote.noteData))].y
									* (startTime - dunceNote.strumTime) * FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
										2)) - dunceNote.noteYOff;
						}
						else
						{
							if (dunceNote.mustPress)
								dunceNote.y = (playerStrums.members[Math.floor(Math.abs(dunceNote.noteData))].y
									* (startTime - dunceNote.strumTime) * FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
										2)) + dunceNote.noteYOff;
							else
								dunceNote.y = (strumLineNotes.members[Math.floor(Math.abs(dunceNote.noteData))].y
									* (startTime - dunceNote.strumTime) * FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
										2)) + dunceNote.noteYOff;
						}
					}
				}
	
				for(i in toBeRemoved)
					notes.members.remove(i);
			}

		trace('generated');

		// add(strumLine);

		camFollow = new FlxObject(0, 0, 1, 1);

		camFollow.setPosition(camPos.x, camPos.y);

		if (prevCamFollow != null)
		{
			camFollow = prevCamFollow;
			prevCamFollow = null;
		}

		if (SONG.song != 'Tutorial-remix')
			{
				camFollow.x += 300;
			}

		if (songLowercase == 'blood-shed'){
			camFollow.x += 300;
			camFollow.y -= 150;
		}

		if (isStoryMode && dia)
			{
				switch (StringTools.replace(curSong, " ", "-").toLowerCase())
				{
					case 'explosive':
						camFollow.x -= 280;
					case 'cbt':
						camFollow.x -= 280;
						camFollow.y += 50;
					case 'blood-shed':
						camFollow.x -= 200;
						camFollow.y -= 100;
				}
			}

		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, 0.04 * (30 / (cast(Lib.current.getChildAt(0), Main)).getFPS()));
		// FlxG.camera.setScrollBounds(0, FlxG.width, 0, FlxG.height);
		FlxG.camera.zoom = Stage.camZoom;
		FlxG.camera.focusOn(camFollow.getPosition());

		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height);

		FlxG.fixedTimestep = false;

		if (FlxG.save.data.songPosition) // I dont wanna talk about this code :(
		{
			songPosBG = new FlxSprite(0, 10).loadGraphic(Paths.image('healthBar'));
			if (PlayStateChangeables.useDownscroll)
				songPosBG.y = FlxG.height * 0.9 + 45;
			songPosBG.screenCenter(X);
			songPosBG.scrollFactor.set();
			add(songPosBG);

			songPosBar = new FlxBar(songPosBG.x + 4, songPosBG.y + 4, LEFT_TO_RIGHT, Std.int(songPosBG.width - 8), Std.int(songPosBG.height - 8), this,
				'songPositionBar', 0, songLength);
			songPosBar.scrollFactor.set();
			songPosBar.createFilledBar(FlxColor.GRAY, FlxColor.LIME);
			add(songPosBar);

			var songName = new FlxText(songPosBG.x + (songPosBG.width / 2) - (SONG.song.length * 5), songPosBG.y, 0, SONG.song, 16);
			if (PlayStateChangeables.useDownscroll)
				songName.y -= 3;
			songName.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			songName.scrollFactor.set();
			add(songName);
			songName.cameras = [camHUD];
		}

		healthBarBG = new FlxSprite(0, FlxG.height * 0.9).loadGraphic(Paths.image('redbar'));
		if (PlayStateChangeables.useDownscroll)
			healthBarBG.y = 50;
		healthBarBG.screenCenter(X);
		healthBarBG.scrollFactor.set();
		add(healthBarBG);

		healthBar = new FlxBar(healthBarBG.x + 4, healthBarBG.y + 4, RIGHT_TO_LEFT, Std.int(healthBarBG.width), Std.int(healthBarBG.height), this,
			'health', 0, 2);
		healthBar.scrollFactor.set();
		if (SONG.song != 'Tutorial-remix')
			{
				healthBar.createFilledBar(0xFFCC3333, 0xFF0097C4);
			}
			else 
				healthBar.createFilledBar(0xFFFF0000, 0xFF0097C4);
		healthBar.createImageEmptyBar(Paths.image('redbar'), FlxColor.WHITE);
		healthBar.createImageFilledBar(Paths.image('bluebar'), FlxColor.WHITE);
		add(healthBar);
		healthBarBG.x = healthBar.x;
		healthBarBG.y = healthBar.y;
		if (songLowercase == 'exptrollgation')
			{
				healthBar.flipX = true;
			}

		// Add Kade Engine watermark
		if (songLowercase == 'exptrollgation')
			{
				kadeEngineWatermark = new FlxText(4, healthBarBG.y
					+ 50, 0,
					SONG.song
					+ " - "
					+ 'chaos'
					+ (Main.watermarks ? " | CUSTOM KE " + MainMenuState.kadeEngineVer : ""), 16);
			}
			else
				{
					kadeEngineWatermark = new FlxText(4, healthBarBG.y
						+ 50, 0,
						SONG.song
						+ " - "
						+ 'troll'
						+ (Main.watermarks ? " | CUSTOM KE " + MainMenuState.kadeEngineVer : ""), 16);
				}
		kadeEngineWatermark.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		kadeEngineWatermark.scrollFactor.set();
		add(kadeEngineWatermark);

		if (PlayStateChangeables.useDownscroll)
			kadeEngineWatermark.y = FlxG.height * 0.9 + 45;

		scoreTxt = new FlxText(FlxG.width / 2 - 235, healthBarBG.y + 50, 0, "", 20);

		scoreTxt.screenCenter(X);

		originalX = scoreTxt.x;

		scoreTxt.scrollFactor.set();

		scoreTxt.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

		add(scoreTxt);

		replayTxt = new FlxText(healthBarBG.x + healthBarBG.width / 2 - 75, healthBarBG.y + (PlayStateChangeables.useDownscroll ? 100 : -100), 0, "REPLAY",
			20);
		replayTxt.setFormat(Paths.font("vcr.ttf"), 42, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		replayTxt.borderSize = 4;
		replayTxt.borderQuality = 2;
		replayTxt.scrollFactor.set();
		if (loadRep)
		{
			add(replayTxt);
		}
		// Literally copy-paste of the above, fu
		botPlayState = new FlxText(healthBarBG.x + healthBarBG.width / 2 - 75, healthBarBG.y + (PlayStateChangeables.useDownscroll ? 100 : -100), 0,
			"BOTPLAY", 20);
		botPlayState.setFormat(Paths.font("vcr.ttf"), 42, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		botPlayState.scrollFactor.set();
		botPlayState.borderSize = 4;
		botPlayState.borderQuality = 2;
		if (PlayStateChangeables.botPlay && !loadRep)
			add(botPlayState);

		iconP1 = new HealthIcon(boyfriend.curCharacter, true);
		iconP1.y = healthBar.y - (iconP1.height / 2);
		add(iconP1);

		iconP2 = new HealthIcon(dad.curCharacter, false);
		iconP2.y = healthBar.y - (iconP2.height / 2);
		add(iconP2);

		strumLineNotes.cameras = [camHUD];
		notes.cameras = [camHUD];
		healthBar.cameras = [camHUD];
		healthBarBG.cameras = [camHUD];
		iconP1.cameras = [camHUD];
		iconP2.cameras = [camHUD];
		scoreTxt.cameras = [camHUD];
		if (isStoryMode)
			{
				doof.cameras = [camHUD];
				doof2.cameras = [aaasss];
			}
			
		if (FlxG.save.data.songPosition)
		{
			songPosBG.cameras = [camHUD];
			songPosBar.cameras = [camHUD];
		}
		kadeEngineWatermark.cameras = [camHUD];
		if (loadRep)
			replayTxt.cameras = [camHUD];

		// if (SONG.song == 'South')
		// FlxG.camera.alpha = 0.7;
		// UI_camera.zoom = 1;

		// cameras = [FlxG.cameras.list[1]];
		startingSong = true;

		trace('starting');

		if (isStoryMode)
		{
			switch (StringTools.replace(curSong, " ", "-").toLowerCase())
			{
				case "winter-horrorland":
					var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
					add(blackScreen);
					blackScreen.scrollFactor.set();
					camHUD.visible = false;

					new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						remove(blackScreen);
						FlxG.sound.play(Paths.sound('Lights_Turn_On'));
						camFollow.y = -2050;
						camFollow.x += 200;
						FlxG.camera.focusOn(camFollow.getPosition());
						FlxG.camera.zoom = 1.5;

						new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							camHUD.visible = true;
							remove(blackScreen);
							FlxTween.tween(FlxG.camera, {zoom: Stage.camZoom}, 2.5, {
								ease: FlxEase.quadInOut,
								onComplete: function(twn:FlxTween)
								{
									startCountdown();
								}
							});
						});
					});
				case 'senpai':
					schoolIntro(doof);
				case 'reconnected' | 'cbt' | 'explosive':
					if (dia)
						{
							schoolIntro(doof);
							dia = false;
						}
						else
							{
								new FlxTimer().start(1, function(timer) {
									startCountdown();
								});
							}
					
				case 'blood-shed':
					if (aaaaaaaaaaaaaa) {
						FlxTransitionableState.skipNextTransIn = false;
						FlxTransitionableState.skipNextTransOut = false;
						if (streaming)
							{
								var video:VideoHandlerMP4 = new VideoHandlerMP4();
								video.playMP4(Paths.video('LMAO'));
								video.finishCallback = function()
								{
									LoadingState.loadAndSwitchState(new PlayState());
								}
							}
							else
								{
									var video:VideoHandlerMP4 = new VideoHandlerMP4();
									video.playMP4(Paths.video('cutscene'));
									video.finishCallback = function()
									{
										LoadingState.loadAndSwitchState(new PlayState());
									}
								}
						aaaaaaaaaaaaaa = false;
					} else {
						camHUD.visible = true;
						camGame.visible = true;
						startCountdown();
					}
				default:
					new FlxTimer().start(1, function(timer) {
						startCountdown();
					});
			}
		}
		else
		{
			new FlxTimer().start(1, function(timer) {
				startCountdown();
			});
		}

		if (!loadRep)
			rep = new Replay("na");

		FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, handleInput);
		FlxG.stage.addEventListener(KeyboardEvent.KEY_UP, releaseInput);


		weakicon = new FlxSprite(1250,80).loadGraphic(Paths.image('effecticons/Weakness'));
		weakicon.updateHitbox();
		weakicon.antialiasing = false;
		weakicon.scale.set(4.5,4.5);
		weakicon.alpha = 0;
		add(weakicon);

		stronkicon = new FlxSprite(1250,160).loadGraphic(Paths.image('effecticons/Strength'));
		stronkicon.updateHitbox();
		stronkicon.antialiasing = false;
		stronkicon.scale.set(4.5,4.5);
		stronkicon.alpha = 0;
		add(stronkicon);

		speedicon = new FlxSprite(1250,250).loadGraphic(Paths.image('effecticons/Speed'));
		speedicon.updateHitbox();
		speedicon.antialiasing = false;
		speedicon.scale.set(4.5,4.5);
		speedicon.alpha = 0;
		add(speedicon);

		invisicon = new FlxSprite(1250,340).loadGraphic(Paths.image('effecticons/Invisability'));
		invisicon.updateHitbox();
		invisicon.antialiasing = false;
		invisicon.scale.set(4.5,4.5);
		invisicon.alpha = 0;
		add(invisicon);

		blindicon = new FlxSprite(1250,430).loadGraphic(Paths.image('effecticons/Blind'));
		blindicon.updateHitbox();
		blindicon.antialiasing = false;
		blindicon.scale.set(4.5,4.5);
		blindicon.alpha = 0;
		add(blindicon);

		poisonicon = new FlxSprite(1250,520).loadGraphic(Paths.image('effecticons/Posion'));
		poisonicon.updateHitbox();
		poisonicon.antialiasing = false;
		poisonicon.scale.set(4.5,4.5);
		poisonicon.alpha = 0;
		add(poisonicon);

		regenicon = new FlxSprite(1250,610).loadGraphic(Paths.image('effecticons/Regeneration'));
		regenicon.updateHitbox();
		regenicon.antialiasing = false;
		regenicon.scale.set(4.5,4.5);
		regenicon.alpha = 0;
		add(regenicon);

		luckicon = new FlxSprite(1250,700).loadGraphic(Paths.image('effecticons/Luck'));
		luckicon.updateHitbox();
		luckicon.antialiasing = false;
		luckicon.scale.set(4.5,4.5);
		luckicon.alpha = 0;
		add(luckicon);

		poisonicon.cameras = [camHUD];
		regenicon.cameras = [camHUD];
		blindicon.cameras = [camHUD];
		invisicon.cameras = [camHUD];
		speedicon.cameras = [camHUD];
		stronkicon.cameras = [camHUD];
		weakicon.cameras = [camHUD];
		luckicon.cameras = [camHUD];

		if (songLowercase == 'blood-shed'){
			redeffect = new FlxSprite().loadGraphic(Paths.image('red'));
			redeffect.screenCenter();
			redeffect.cameras = [camdr];
			add(redeffect);
			for (i in 0...6)
				{
					var emitter:FlxEmitter = new FlxEmitter(-1000, 1500);
					emitter.launchMode = FlxEmitterMode.SQUARE;
					emitter.velocity.set(-50, -150, 50, -750, -100, 0, 100, -100);
					emitter.scale.set(0.75, 0.75, 3, 3, 0.75, 0.75, 1.5, 1.5);
					emitter.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
					emitter.width = 3500;
					emitter.alpha.set(1, 1, 0, 0);
					emitter.lifespan.set(3, 5);
					emitter.cameras = [camdr];
					emitter.loadParticles(Paths.image('Particleshit' + i, 'shared'), 500, 16, true);
					emitter.start(false, FlxG.random.float(0.1, 0.2), 100000);
					add(emitter);
				}
		}

		sad = new FlxSprite().loadGraphic(Paths.image('her', 'shared'));
		sad.cameras = [camHUD];
		sad.screenCenter();
		sad.alpha = 0;
		sad.scale.set(0.2,0.2);
		sad.x += 300;
		add(sad);

		super.create();
	}

	function schoolIntro(?dialogueBox:DialogueBox):Void
	{
		FlxG.sound.music.volume = 0;
		vocals.volume = 0;
		boobs = new FlxSprite().loadGraphic(Paths.image('bbb'));
		boobs.antialiasing = false;
		boobs.scale.set(3,3);
		boobs.alpha = 0;
		boobs.cameras = [aaasss];
		add(boobs);
		add(dialogueBox);
	}

	function schoolOutro(?dialogueBox:DialogueBox):Void
		{
			FlxG.sound.music.volume = 0;
			vocals.volume = 0;
			boobs = new FlxSprite().loadGraphic(Paths.image('bbb'));
			boobs.antialiasing = false;
			boobs.scale.set(3,3);
			boobs.alpha = 1;
			boobs.cameras = [camHUD];
			add(boobs);
			add(dialogueBox);
		}

	var startTimer:FlxTimer;
	var stronktimer:FlxTimer;
	var regentimer:FlxTimer;
	var blindtimer:FlxTimer;
	var levtimer:FlxTimer;
	var lev2timer:FlxTimer;
	var lev3timer:FlxTimer;
	var poisontimer:FlxTimer;
	var weaktimer:FlxTimer;
	var lucktimer:FlxTimer;
	var speedtimer:FlxTimer;
	var invistimer:FlxTimer;
	var perfectMode:Bool = false;
	var luaWiggles:Array<WiggleEffect> = [];

	#if cpp
	public static var luaModchart:ModchartState = null;
	#end

	function startCountdown():Void
	{
		if (boobs != null)
			boobs.alpha = 0;
		inCutscene = false;

		appearStaticArrows();
 
		talking = false;
		startedCountdown = true;
		Conductor.songPosition = 0;
		Conductor.songPosition -= Conductor.crochet * 5;

		var swagCounter:Int = 0;

		startTimer = new FlxTimer().start(Conductor.crochet / 1000, function(tmr:FlxTimer)
		{
			dad.dance();
			gf.dance();
			boyfriend.playAnim('idle');

			var introAssets:Map<String, Array<String>> = new Map<String, Array<String>>();
			introAssets.set('default', ['ready', "set", "go"]);
			introAssets.set('pixel', ['weeb/pixelUI/ready-pixel', 'weeb/pixelUI/set-pixel', 'weeb/pixelUI/date-pixel']);

			var introAlts:Array<String> = introAssets.get('default');
			var altSuffix:String = "";
			var week6Bullshit:String = null;

			if (SONG.noteStyle == 'pixel')
			{
				introAlts = introAssets.get('pixel');
				altSuffix = '-pixel';
				week6Bullshit = 'shared';
			}

			switch (swagCounter)

			{
				case 0:
					FlxG.sound.play(Paths.sound('intro3' + altSuffix), 0.6);
				case 1:
					var ready:FlxSprite = new FlxSprite().loadGraphic(Paths.image(introAlts[0], week6Bullshit));
					ready.scrollFactor.set();
					ready.updateHitbox();

					if (SONG.noteStyle == 'pixel')
						ready.setGraphicSize(Std.int(ready.width * daPixelZoom));

					ready.screenCenter();
					add(ready);
					FlxTween.tween(ready, {y: ready.y += 100, alpha: 0}, Conductor.crochet / 1000, {
						ease: FlxEase.cubeInOut,
						onComplete: function(twn:FlxTween)
						{
							ready.destroy();
						}
					});
					FlxG.sound.play(Paths.sound('intro2' + altSuffix), 0.6);
				case 2:
					var set:FlxSprite = new FlxSprite().loadGraphic(Paths.image(introAlts[1], week6Bullshit));
					set.scrollFactor.set();

					if (SONG.noteStyle == 'pixel')
						set.setGraphicSize(Std.int(set.width * daPixelZoom));

					set.screenCenter();
					add(set);
					FlxTween.tween(set, {y: set.y += 100, alpha: 0}, Conductor.crochet / 1000, {
						ease: FlxEase.cubeInOut,
						onComplete: function(twn:FlxTween)
						{
							set.destroy();
						}
					});
					FlxG.sound.play(Paths.sound('intro1' + altSuffix), 0.6);
				case 3:
					var go:FlxSprite = new FlxSprite().loadGraphic(Paths.image(introAlts[2], week6Bullshit));
					go.scrollFactor.set();

					if (SONG.noteStyle == 'pixel')
						go.setGraphicSize(Std.int(go.width * daPixelZoom));

					go.updateHitbox();

					go.screenCenter();
					add(go);
					FlxTween.tween(go, {y: go.y += 100, alpha: 0}, Conductor.crochet / 1000, {
						ease: FlxEase.cubeInOut,
						onComplete: function(twn:FlxTween)
						{
							a();
							doredthing();
							go.destroy();
						}
					});
					FlxG.sound.play(Paths.sound('introGo' + altSuffix), 0.6);
				case 4:
					FlxG.sound.music.volume = 1;
					vocals.volume = 1;
					haseffect = false;
					canPause = true;
			}

			swagCounter += 1;
		}, 5);
	}
	
	var previousFrameTime:Int = 0;
	var lastReportedPlayheadPosition:Int = 0;
	var songTime:Float = 0;

	private function getKey(charCode:Int):String
	{
		for (key => value in FlxKey.fromStringMap)
		{
			if (charCode == value)
				return key;
		}
		return null;
	}

	var keys = [false, false, false, false];

	private function releaseInput(evt:KeyboardEvent):Void // handles releases
	{
		@:privateAccess
		var key = FlxKey.toStringMap.get(evt.keyCode);

		var binds:Array<String> = [
			FlxG.save.data.leftBind,
			FlxG.save.data.downBind,
			FlxG.save.data.upBind,
			FlxG.save.data.rightBind
		];

		var data = -1;

		switch (evt.keyCode) // arrow keys
		{
			case 37:
				data = 0;
			case 40:
				data = 1;
			case 38:
				data = 2;
			case 39:
				data = 3;
		}

		for (i in 0...binds.length) // binds
		{
			if (binds[i].toLowerCase() == key.toLowerCase())
				data = i;
		}

		if (data == -1)
			return;

		keys[data] = false;
	}

	public var closestNotes:Array<Note> = [];
	

	private function handleInput(evt:KeyboardEvent):Void
	{ // this actually handles press inputs

		if (PlayStateChangeables.botPlay || loadRep || paused)
			return;

		// first convert it from openfl to a flixel key code
		// then use FlxKey to get the key's name based off of the FlxKey dictionary
		// this makes it work for special characters

		@:privateAccess
		var key = FlxKey.toStringMap.get(evt.keyCode);

		var binds:Array<String> = [
			FlxG.save.data.leftBind,
			FlxG.save.data.downBind,
			FlxG.save.data.upBind,
			FlxG.save.data.rightBind
		];

		var data = -1;

		switch (evt.keyCode) // arrow keys
		{
			case 37:
				data = 0;
			case 40:
				data = 1;
			case 38:
				data = 2;
			case 39:
				data = 3;
		}

		for (i in 0...binds.length) // binds
		{
			if (binds[i].toLowerCase() == key.toLowerCase())
				data = i;
		}
		if (data == -1)
		{
			return;
		}
		if (keys[data])
		{
			return;
		}

		keys[data] = true;

		var ana = new Ana(Conductor.songPosition, null, false, "miss", data);

		var dataNotes = [];
		for(i in closestNotes)
			if (i.noteData == data)
				dataNotes.push(i);


		if (dataNotes.length != 0)
		{
			trace('GAY');
			var coolNote = null;

			for (i in dataNotes)
				if (!i.isSustainNote)
				{
					coolNote = i;
					break;
				}

			if (coolNote == null) // Note is null, which means it's probably a sustain note. Update will handle this (HOPEFULLY???)
			{
				return;
			}

			if (dataNotes.length > 1) // stacked notes or really close ones
			{
				for (i in 0...dataNotes.length)
				{
					if (i == 0) // skip the first note
						continue;

					var note = dataNotes[i];

					if (!note.isSustainNote && (note.strumTime - coolNote.strumTime ) < 2)
					{
						trace('found a stacked/really close note ' + (note.strumTime  - coolNote.strumTime ));
						// just fuckin remove it since it's a stacked note and shouldn't be there
						note.kill();
						notes.remove(note, true);
						note.destroy();
					}
				}
			}

			goodNoteHit(coolNote);
			var noteDiff:Float = -(coolNote.strumTime - Conductor.songPosition);
			ana.hit = true;
			ana.hitJudge = Ratings.judgeNote(coolNote);
			ana.nearestNote = [coolNote.strumTime, coolNote.noteData, coolNote.sustainLength];
		}
		else if (!FlxG.save.data.ghost && songStarted && swagNote.luckyAnim == false)
		{
			trace('CMON');
			if (!fakemode)
				noteMiss(data, null);
			ana.hit = false;
			ana.hitJudge = "shit";
			ana.nearestNote = [];
			health -= 0.20;
		}
	}

	var songStarted = false;

	public var doAnything = false;

	function startSong():Void
	{
		startingSong = false;
		songStarted = true;
		previousFrameTime = FlxG.game.ticks;
		lastReportedPlayheadPosition = 0;

		FlxG.sound.music.play();
		vocals.play();


		// Song check real quick
		switch (curSong)
		{
			case 'Bopeebo' | 'Philly Nice' | 'Blammed' | 'Cocoa' | 'Eggnog':
				allowedToHeadbang = true;
			default:
				allowedToHeadbang = false;
		}

		if (useVideo)
			GlobalVideo.get().resume();

		if (executeModchart)
			luaModchart.executeState("songStart",[null]);

		#if windows
		// Updating Discord Rich Presence (with Time Left)
		DiscordClient.changePresence(detailsText
			+ " "
			+ SONG.song
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"\nAcc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC);
		#end

		FlxG.sound.music.time = startTime;
		if (vocals != null)
			vocals.time = startTime;
		Conductor.songPosition = startTime;
		startTime = 0;

		

		/*@:privateAccess
		{
			var aux = AL.createAux();
			var fx = AL.createEffect();
			AL.effectf(fx,AL.PITCH,songMultiplier);
			AL.auxi(aux, AL.EFFECTSLOT_EFFECT, fx);
			var instSource = FlxG.sound.music._channel.__source;

			var backend:lime._internal.backend.native.NativeAudioSource = instSource.__backend;

			AL.source3i(backend.handle, AL.AUXILIARY_SEND_FILTER, aux, 1, AL.FILTER_NULL);
			if (vocals != null)
			{
				var vocalSource = vocals._channel.__source;

				backend = vocalSource.__backend;
				AL.source3i(backend.handle, AL.AUXILIARY_SEND_FILTER, aux, 1, AL.FILTER_NULL);
			}

			trace("pitched to " + songMultiplier);
		}*/

		#if cpp
		@:privateAccess
		{
			lime.media.openal.AL.sourcef(FlxG.sound.music._channel.__source.__backend.handle, lime.media.openal.AL.PITCH, 1);
			if (vocals.playing)
				lime.media.openal.AL.sourcef(vocals._channel.__source.__backend.handle, lime.media.openal.AL.PITCH, 1);

		}
		#end

		for(i in 0...unspawnNotes.length)
			if (unspawnNotes[i].strumTime < startTime)
				unspawnNotes.remove(unspawnNotes[i]);
	}

	var debugNum:Int = 0;

	public function generateSong(dataPath:String):Void
	{
		// FlxG.log.add(ChartParser.parse());

		var songData = SONG;
		Conductor.changeBPM(songData.bpm);

		curSong = songData.song;

		#if sys
		if (SONG.needsVoices && !isSM)
			vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
		else
			vocals = new FlxSound();
		#else
		if (SONG.needsVoices)
			vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
		else
			vocals = new FlxSound();
		#end

		trace('loaded vocals');

		FlxG.sound.list.add(vocals);

		if (!paused)
		{
			#if sys
			if (!isStoryMode && isSM)
			{
				trace("Loading " + pathToSm + "/" + sm.header.MUSIC);
				var bytes = File.getBytes(pathToSm + "/" + sm.header.MUSIC);
				var sound = new Sound();
				sound.loadCompressedDataFromByteArray(bytes.getData(), bytes.length);
				FlxG.sound.playMusic(sound);
			}
			else
				
				FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 1, false);
			#else
			FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 1, false);
			#end
		}

		FlxG.sound.music.onComplete = checkfortrophy;
		FlxG.sound.music.pause();

		if (SONG.needsVoices)
			FlxG.sound.cache(Paths.voices(PlayState.SONG.song));
		if (!PlayState.isSM)
			FlxG.sound.cache(Paths.inst(PlayState.SONG.song));


		
		// Song duration in a float, useful for the time left feature
		songLength = FlxG.sound.music.length / 1000;

		Conductor.crochet = ((60 / (SONG.bpm) * 1000));
		Conductor.stepCrochet = Conductor.crochet / 4;

		if (FlxG.save.data.songPosition)
		{
			remove(songPosBG);
			remove(songPosBar);
			remove(songName);

			songPosBG = new FlxSprite(0, 10).loadGraphic(Paths.image('healthBar'));
			if (PlayStateChangeables.useDownscroll)
				songPosBG.y = FlxG.height * 0.9 + 45;
			songPosBG.screenCenter(X);
			songPosBG.scrollFactor.set();
			add(songPosBG);

			songPosBar = new FlxBar(songPosBG.x
				+ 4, songPosBG.y
				+ 4, LEFT_TO_RIGHT, Std.int(songPosBG.width - 8), Std.int(songPosBG.height - 8), this,
				'songPositionBar', 0, 100);
			songPosBar.numDivisions = 1000;
			songPosBar.scrollFactor.set();
			songPosBar.createFilledBar(FlxColor.GRAY, FlxColor.LIME);
			add(songPosBar);

			var songName = new FlxText(songPosBG.x + (songPosBG.width / 2) - (SONG.song.length * 5), songPosBG.y, 0, SONG.song, 16);
			if (PlayStateChangeables.useDownscroll)
				songName.y -= 3;
			songName.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			songName.scrollFactor.set();
			add(songName);

			songPosBG.cameras = [camHUD];
			songPosBar.cameras = [camHUD];
			songName.cameras = [camHUD];
		}


		notes = new FlxTypedGroup<Note>();
		add(notes);

		var noteData:Array<SwagSection>;

		// NEW SHIT
		noteData = songData.notes;

		var playerCounter:Int = 0;

		// Per song offset check
		#if cpp
		// pre lowercasing the song name (generateSong)
		var songLowercase = StringTools.replace(PlayState.SONG.song, " ", "-").toLowerCase();
		switch (songLowercase)
		{
			case 'dad-battle':
				songLowercase = 'dadbattle';
			case 'philly-nice':
				songLowercase = 'philly';
		}

		var songPath = 'assets/data/' + songLowercase + '/';
		
		#if sys
		if (isSM && !isStoryMode)
			songPath = pathToSm;
		#end

		for (file in sys.FileSystem.readDirectory(songPath))
		{
			var path = haxe.io.Path.join([songPath, file]);
			if (!sys.FileSystem.isDirectory(path))
			{
				if (path.endsWith('.offset'))
				{
					trace('Found offset file: ' + path);
					songOffset = Std.parseFloat(file.substring(0, file.indexOf('.off')));
					break;
				}
				else
				{
					trace('Offset file not found. Creating one @: ' + songPath);
					sys.io.File.saveContent(songPath + songOffset + '.offset', '');
				}
			}
		}
		#end
		var daBeats:Int = 0; // Not exactly representative of 'daBeats' lol, just how much it has looped


		for (section in noteData)
		{
			var coolSection:Int = Std.int(section.lengthInSteps / 4);

			for (songNotes in section.sectionNotes)
			{
				var daStrumTime:Float = songNotes[0] - FlxG.save.data.offset - songOffset;
				if (daStrumTime < 0)
					daStrumTime = 0;
				var daNoteData:Int = Std.int(songNotes[1] % 4);

				var gottaHitNote:Bool = true;

				if (songNotes[1] > 3 && section.mustHitSection)
					gottaHitNote = false;
				else if (songNotes[1] < 4 && !section.mustHitSection)
					gottaHitNote = false;
				

				var oldNote:Note;
				if (unspawnNotes.length > 0)
					oldNote = unspawnNotes[Std.int(unspawnNotes.length - 1)];
				else
					oldNote = null;

				if (Std.isOfType(songNotes[6], Bool) && gottaHitNote)
					noteluckyAnim = true;
				else
					noteluckyAnim = false;


				

				if (gottaHitNote) {
					swagNote = new Note(daStrumTime, daNoteData, oldNote,false,false,false,songNotes[4], boyfriend.noteSkin, noteluckyAnim);
				} else {
					swagNote = new Note(daStrumTime, daNoteData, oldNote,false,false,false,songNotes[4], dad.noteSkin, noteluckyAnim);
				}

				if (!gottaHitNote && PlayStateChangeables.Optimize)
					continue;

				swagNote.sustainLength = TimingStruct.getTimeFromBeat((TimingStruct.getBeatFromTime(songNotes[2])));
				swagNote.scrollFactor.set(0, 0);

				var susLength:Float = swagNote.sustainLength;

				susLength = susLength / Conductor.stepCrochet;
				unspawnNotes.push(swagNote);

				swagNote.isAlt = songNotes[3];
				swagNote.luckyAnim = false;

				if (Std.isOfType(songNotes[6], Bool))
					{
						swagNote.luckyAnim = true;
					}
					else
					{
						swagNote.luckyAnim = false;
					}

				if (susLength > 0)
					swagNote.isParent = true;

				var type = 0;

				for (susNote in 0...Math.floor(susLength))
				{
					oldNote = unspawnNotes[Std.int(unspawnNotes.length - 1)];

					var sustainNote:Note;
					if (gottaHitNote) {
						sustainNote = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true, boyfriend.noteSkin);
					} else {
						sustainNote = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true, dad.noteSkin);
					}
					sustainNote.scrollFactor.set();
					unspawnNotes.push(sustainNote);
					sustainNote.isAlt = songNotes[3];

					sustainNote.mustPress = gottaHitNote;

					if (sustainNote.mustPress)
					{
						sustainNote.x += FlxG.width / 2; // general offset
					}

					sustainNote.parent = swagNote;
					swagNote.children.push(sustainNote);
					sustainNote.spotInLine = type;
					type++;
				}

				swagNote.mustPress = gottaHitNote;

				if (swagNote.mustPress)
				{
					swagNote.x += FlxG.width / 2; // general offset
				}
			}
			daBeats += 1;
		}

		// trace(unspawnNotes.length);
		// playerCounter += 1;

		unspawnNotes.sort(sortByShit);

		generatedMusic = true;
	}

	
	function sortByShit(Obj1:Note, Obj2:Note):Int
	{
		return FlxSort.byValues(FlxSort.ASCENDING, Obj1.strumTime, Obj2.strumTime);
	}

	private function generateStaticArrows(player:Int):Void
	{
		for (i in 0...4)
		{
			// FlxG.log.add(i);
			var babyArrow:StaticArrow = new StaticArrow(0, strumLine.y);

			// defaults if no noteStyle was found in chart
			var noteTypeCheck:String = 'normal';

			if (PlayStateChangeables.Optimize && player == 0)
				continue;

			if (SONG.noteStyle == null)
			{
				switch (storyWeek)
				{
					case 6:
						noteTypeCheck = 'pixel';
				}
			}
			else
			{
				noteTypeCheck = SONG.noteStyle;
			}

			switch (noteTypeCheck)
			{
				case 'pixel':
					if (SONG.stage == 'jevilbg')
						{
							babyArrow.loadGraphic(Paths.image('weeb/pixelUI/jevil-pixels', 'shared'), true, 17, 17);
						}
						else
							{
								babyArrow.loadGraphic(Paths.image('weeb/pixelUI/arrows-pixels', 'shared'), true, 17, 17);
							}
					babyArrow.animation.add('green', [6]);
					babyArrow.animation.add('red', [7]);
					babyArrow.animation.add('blue', [5]);
					babyArrow.animation.add('purplel', [4]);

					babyArrow.setGraphicSize(Std.int(babyArrow.width * daPixelZoom));
					babyArrow.updateHitbox();
					babyArrow.antialiasing = false;

					babyArrow.x += Note.swagWidth * i;
					babyArrow.animation.add('static', [i]);
					babyArrow.animation.add('pressed', [4 + i, 8 + i], 12, false);
					babyArrow.animation.add('confirm', [12 + i, 16 + i], 24, false);

					for (j in 0...4)
					{
						babyArrow.animation.add('dirCon' + j, [12 + j, 16 + j], 24, false);
					}

				default:
					if (player == 0)
						babyArrow.frames = Paths.getSparrowAtlas('notetypes/' + dad.noteSkin);
					if (player == 1)
						babyArrow.frames = Paths.getSparrowAtlas('notetypes/' + boyfriend.noteSkin);
					for (j in 0...4)
					{
						babyArrow.animation.addByPrefix(dataColor[j], 'arrow' + dataSuffix[j]);	
						babyArrow.animation.addByPrefix('dirCon' + j, dataSuffix[j].toLowerCase() + ' confirm', 24, false);
					}

					var lowerDir:String = dataSuffix[i].toLowerCase();

					babyArrow.animation.addByPrefix('static', 'arrow' + dataSuffix[i]);
					babyArrow.animation.addByPrefix('pressed', lowerDir + ' press', 24, false);
					babyArrow.animation.addByPrefix('confirm', lowerDir + ' confirm', 24, false);

					babyArrow.x += Note.swagWidth * i;

					babyArrow.antialiasing = FlxG.save.data.antialiasing;
					babyArrow.setGraphicSize(Std.int(babyArrow.width * 0.7));
			}

			babyArrow.updateHitbox();
			babyArrow.scrollFactor.set();

			babyArrow.alpha = 0;
			if (!isStoryMode)
			{
				babyArrow.y -= 10;
				//babyArrow.alpha = 0;
				FlxTween.tween(babyArrow, {y: babyArrow.y + 10, alpha: 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * i)});
			}

			babyArrow.ID = i;

			switch (player)
			{
				case 0:
					cpuStrums.add(babyArrow);
				case 1:
					playerStrums.add(babyArrow);
			}

			babyArrow.playAnim('static');
			babyArrow.x += 50;
			babyArrow.x += ((FlxG.width / 2) * player);

			if (PlayStateChangeables.Optimize)
				babyArrow.x -= 275;

			cpuStrums.forEach(function(spr:FlxSprite)
			{
				spr.centerOffsets(); // CPU arrows start out slightly off-center
			});

			strumLineNotes.add(babyArrow);

			if (songLowercase == 'exptrollgation')
				{
					cpuStrums.forEach(function(spr:FlxSprite)
						{
							FlxTween.tween(spr,{x: spr.x +700},0.001,{ease: FlxEase.expoInOut});
						});

					playerStrums.forEach(function(spr:FlxSprite)
						{

							FlxTween.tween(spr,{x: spr.x - 600},0.001,{ease: FlxEase.expoInOut});
						});
				}
				else
					{
						cpuStrums.forEach(function(spr:FlxSprite)
							{
								FlxTween.tween(spr,{x: spr.x +50},0.001,{ease: FlxEase.expoInOut});
							});
	
						playerStrums.forEach(function(spr:FlxSprite)
							{
								FlxTween.tween(spr,{x: spr.x + 50},0.001,{ease: FlxEase.expoInOut});
							});
					}
		}

		//blackblind = new FlxSprite(-1000,-1000).loadGraphic(Paths.image('bbb'));
		//blackblind.scale.set(5,5);
		//blackblind.cameras = [camdr];
		//blackblind.alpha = 0;
		//add(blackblind);
	}

	private function appearStaticArrows():Void
	{
		strumLineNotes.forEach(function(babyArrow:FlxSprite)
		{
			if (isStoryMode)
				babyArrow.alpha = 1;
		});
	}

	function tweenCamIn():Void
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.3}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.elasticInOut});
	}

	override function openSubState(SubState:FlxSubState)
	{
		if (paused)
		{
			if (FlxG.sound.music != null)
			{
				FlxG.sound.music.pause();
				vocals.pause();
			}

			#if windows
			DiscordClient.changePresence("PAUSED on "
				+ SONG.song
				+ " ("
				+ storyDifficultyText
				+ ") "
				+ Ratings.GenerateLetterRank(accuracy),
				"\nAcc: "
				+ HelperFunctions.truncateFloat(accuracy, 2)
				+ "% | Score: "
				+ songScore
				+ " | Misses: "
				+ misses, iconRPC);
			#end
			if (!startTimer.finished)
				startTimer.active = false;
		}

		super.openSubState(SubState);
	}

	override function closeSubState()
	{
		if (paused)
		{
			if (FlxG.sound.music != null && !startingSong)
			{
				resyncVocals();
			}

			paused = false;

			#if windows
			if (startTimer.finished)
			{
				DiscordClient.changePresence(detailsText
					+ " "
					+ SONG.song
					+ " ("
					+ storyDifficultyText
					+ ") "
					+ Ratings.GenerateLetterRank(accuracy),
					"\nAcc: "
					+ HelperFunctions.truncateFloat(accuracy, 2)
					+ "% | Score: "
					+ songScore
					+ " | Misses: "
					+ misses, iconRPC, true,
					songLength
					- Conductor.songPosition);
			}
			else
			{
				DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ") " + Ratings.GenerateLetterRank(accuracy), iconRPC);
			}
			#end
		}

		super.closeSubState();
	}

	function resyncVocals():Void
	{
		vocals.pause();

		FlxG.sound.music.play();
		Conductor.songPosition = FlxG.sound.music.time;
		vocals.time = FlxG.sound.music.time;
		vocals.play();

		@:privateAccess
		{
			lime.media.openal.AL.sourcef(FlxG.sound.music._channel.__source.__backend.handle, lime.media.openal.AL.PITCH, 1);
			if (vocals.playing)
				lime.media.openal.AL.sourcef(vocals._channel.__source.__backend.handle, lime.media.openal.AL.PITCH, 1);

		}

		#if windows
		DiscordClient.changePresence(detailsText
			+ " "
			+ SONG.song
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"\nAcc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC);
		#end
	}

	
	var startedCountdown:Bool = false;
	var canPause:Bool = false;
	var nps:Int = 0;
	var maxNPS:Int = 0;

	public static var songRate = 1.5;

	public var stopUpdate = false;
	public var removedVideo = false;

	public var currentBPM = 0;

	public var updateFrame = 0;

	public var pastScrollChanges:Array<Song.Event> = [];


	var currentLuaIndex = 0;

	override public function update(elapsed:Float)
	{
		wiggleShit.update(Conductor.crochet);
		#if !debug
		perfectMode = false;
		#end

		setChrome(chromnumber);
		if (unspawnNotes[0] != null)
			{
	
				if (unspawnNotes[0].strumTime - Conductor.songPosition < 14000)
				{
					var dunceNote:Note = unspawnNotes[0];
					notes.add(dunceNote);

					if (executeModchart)
					{
						new LuaNote(dunceNote,currentLuaIndex);			
						dunceNote.luaID = currentLuaIndex;
					}		
					
					if (executeModchart)
					{
						if (!dunceNote.isSustainNote)
							dunceNote.cameras = [camNotes];
						else
							dunceNote.cameras = [camSustains];
					}
					else
					{
						dunceNote.cameras = [camHUD];
					}
	
					var index:Int = unspawnNotes.indexOf(dunceNote);
					unspawnNotes.splice(index, 1);
					currentLuaIndex++;
				}
			}


		#if cpp
		if (FlxG.sound.music.playing)
			@:privateAccess
			{
				lime.media.openal.AL.sourcef(FlxG.sound.music._channel.__source.__backend.handle, lime.media.openal.AL.PITCH,1);
				if (vocals.playing)
					lime.media.openal.AL.sourcef(vocals._channel.__source.__backend.handle, lime.media.openal.AL.PITCH, 1);

			}
		#end

		if (generatedMusic)
			{
				if (songStarted && !endingSong)
				{
					// Song ends abruptly on slow rate even with second condition being deleted, 
					// and if it's deleted on songs like cocoa then it would end without finishing instrumental fully,
					// so no reason to delete it at all
					if (notes.length == 0 && FlxG.sound.music.length - Conductor.songPosition <= 100)
					{
						checkfortrophy();
					}
				}
			}


			if (updateFrame == 4)
				{
					TimingStruct.clearTimings();
		
						var currentIndex = 0;
						for (i in SONG.eventObjects)
						{
							if (i.type == "BPM Change")
							{
								var beat:Float = i.position;
		
								var endBeat:Float = Math.POSITIVE_INFINITY;
		
								var bpm = i.value;

								TimingStruct.addTiming(beat,bpm,endBeat, 0); // offset in this case = start time since we don't have a offset
								
								if (currentIndex != 0)
								{
									var data = TimingStruct.AllTimings[currentIndex - 1];
									data.endBeat = beat;
									data.length = (data.endBeat - data.startBeat) / (data.bpm / 60);
									var step = ((60 / data.bpm) * 1000) / 4;
									TimingStruct.AllTimings[currentIndex].startStep = Math.floor(((data.endBeat / (data.bpm / 60)) * 1000) / step);
									TimingStruct.AllTimings[currentIndex].startTime = data.startTime + data.length;
								}
		
								currentIndex++;
							}
						}
		
						updateFrame++;
				}
				else if (updateFrame != 5)
					updateFrame++;
		

		if (FlxG.sound.music.playing)
		{

				var timingSeg = TimingStruct.getTimingAtBeat(curDecimalBeat);
		
				if (timingSeg != null)
				{
		
					var timingSegBpm = timingSeg.bpm;
		
					if (timingSegBpm != Conductor.bpm)
					{
						trace("BPM CHANGE to " + timingSegBpm);
						Conductor.changeBPM(timingSegBpm, false);
						Conductor.crochet = ((60 / (timingSegBpm) * 1000));
						Conductor.stepCrochet = Conductor.crochet / 4;
					}
		
				}

			var newScroll = 1.0;

			for(i in SONG.eventObjects)
			{
				switch(i.type)
				{
				}
			}

			if (newScroll != 0)
				PlayStateChangeables.scrollSpeed *= newScroll;
		}
	
		if (PlayStateChangeables.botPlay && FlxG.keys.justPressed.ONE)
			camHUD.visible = !camHUD.visible;

		if (useVideo && GlobalVideo.get() != null && !stopUpdate)
		{
			if (GlobalVideo.get().ended && !removedVideo)
			{
				remove(videoSprite);
				FlxG.stage.window.onFocusOut.remove(focusOut);
				FlxG.stage.window.onFocusIn.remove(focusIn);
				removedVideo = true;
			}
		}

		#if cpp
		if (executeModchart && luaModchart != null && songStarted)
		{
			luaModchart.setVar('songPos', Conductor.songPosition);
			luaModchart.setVar('hudZoom', camHUD.zoom);
			luaModchart.setVar('curBeat', HelperFunctions.truncateFloat(curDecimalBeat,3));
			luaModchart.setVar('cameraZoom', FlxG.camera.zoom);
			
			luaModchart.executeState('update', [elapsed]);

			for (key => value in luaModchart.luaWiggles) 
			{
				trace('wiggle le gaming');
				value.update(elapsed);
			}

			PlayStateChangeables.useDownscroll = luaModchart.getVar("downscroll","bool");

			/*for (i in 0...strumLineNotes.length) {
				var member = strumLineNotes.members[i];
				member.x = luaModchart.getVar("strum" + i + "X", "float");
				member.y = luaModchart.getVar("strum" + i + "Y", "float");
				member.angle = luaModchart.getVar("strum" + i + "Angle", "float");
			}*/

			FlxG.camera.angle = luaModchart.getVar('cameraAngle', 'float');
			camHUD.angle = luaModchart.getVar('camHudAngle', 'float');

			if (luaModchart.getVar("showOnlyStrums", 'bool'))
			{
				healthBarBG.visible = false;
				kadeEngineWatermark.visible = false;
				healthBar.visible = false;
				iconP1.visible = false;
				iconP2.visible = false;
				scoreTxt.visible = false;
			}
			else
			{
				healthBarBG.visible = true;
				kadeEngineWatermark.visible = true;
				healthBar.visible = true;
				iconP1.visible = true;
				iconP2.visible = true;
				scoreTxt.visible = true;
			}

			var p1 = luaModchart.getVar("strumLine1Visible", 'bool');
			var p2 = luaModchart.getVar("strumLine2Visible", 'bool');

			for (i in 0...4)
			{
				strumLineNotes.members[i].visible = p1;
				if (i <= playerStrums.length)
					playerStrums.members[i].visible = p2;
			}

			camNotes.zoom = camHUD.zoom;
			camNotes.x = camHUD.x;
			camNotes.y = camHUD.y;
			camNotes.angle = camHUD.angle;
			camSustains.zoom = camHUD.zoom;
			camSustains.x = camHUD.x;
			camSustains.y = camHUD.y;
			camSustains.angle = camHUD.angle;
		}
		#end

		// reverse iterate to remove oldest notes first and not invalidate the iteration
		// stop iteration as soon as a note is not removed
		// all notes should be kept in the correct order and this is optimal, safe to do every frame/update
		{
			var balls = notesHitArray.length - 1;
			while (balls >= 0)
			{
				var cock:Date = notesHitArray[balls];
				if (cock != null && cock.getTime() + 1000 < Date.now().getTime())
					notesHitArray.remove(cock);
				else
					balls = 0;
				balls--;
			}
			nps = notesHitArray.length;
			if (nps > maxNPS)
				maxNPS = nps;
		}

		if (FlxG.keys.justPressed.NINE)
				iconP1.swapOldIcon();

		switch (Stage.curStage)
		{
			case 'philly':
				if (trainMoving && !PlayStateChangeables.Optimize)
				{
					trainFrameTiming += elapsed;

					if (trainFrameTiming >= 1 / 24)
					{
						updateTrainPos();
						trainFrameTiming = 0;
					}
				}
				// phillyCityLights.members[curLight].alpha -= (Conductor.crochet / 1000) * FlxG.elapsed;
		}


		var lengthInPx = scoreTxt.textField.length * scoreTxt.frameHeight; // bad way but does more or less a better job

		if (!fakemode)
		scoreTxt.x = (originalX - (lengthInPx / 2)) + 335;

		if (controls.PAUSE && startedCountdown && canPause && !cannotDie && !haseffect && !fakemode)
		{
			persistentUpdate = false;
			persistentDraw = true;
			paused = true;

			// 1 / 1000 chance for Gitaroo Man easter egg
			if (FlxG.random.bool(0.1))
			{
				trace('GITAROO MAN EASTER EGG');
				FlxG.switchState(new GitarooPause());
				clean();
			}
			else
				openSubState(new PauseSubState(boyfriend.getScreenPosition().x, boyfriend.getScreenPosition().y));
		}

		if (FlxG.keys.justPressed.SPACE && tnttime)
			{
				checktaps();
				taps ++;
			}

		if (FlxG.keys.justPressed.SEVEN && songStarted)
		{
			if (useVideo)
			{
				GlobalVideo.get().stop();
				remove(videoSprite);
				#if sys
				FlxG.stage.window.onFocusOut.remove(focusOut);
				FlxG.stage.window.onFocusIn.remove(focusIn);
				#end
				removedVideo = true;
			}
			cannotDie = true;

			FlxG.switchState(new ChartingState());
			clean();
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleInput);
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_UP, releaseInput);
			#if cpp
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}

		// FlxG.watch.addQuick('VOL', vocals.amplitudeLeft);
		// FlxG.watch.addQuick('VOLRight', vocals.amplitudeRight);

		iconP1.setGraphicSize(Std.int(FlxMath.lerp(150, iconP1.width, 0.50)));
		iconP2.setGraphicSize(Std.int(FlxMath.lerp(150, iconP2.width, 0.50)));

		iconP1.updateHitbox();
		iconP2.updateHitbox();

		var iconOffset:Int = 26;

		if (songLowercase == 'exptrollgation')
			{
				iconP1.flipX = true;
				iconP2.flipX = true;
				iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 100, 0, 100, 0) * 0.01) - iconOffset);
				iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 100, 0, 100, 0) * 0.01)) - (iconP2.width - iconOffset);
			}
			else
				{
					iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01) - iconOffset);
					iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01)) - (iconP2.width - iconOffset);
				}


		if (health > 2)
			health = 2;
		if (healthBar.percent < 20)
			iconP1.animation.curAnim.curFrame = 1;
		else
			iconP1.animation.curAnim.curFrame = 0;

		if (healthBar.percent > 80)
			iconP2.animation.curAnim.curFrame = 1;
		else
			iconP2.animation.curAnim.curFrame = 0;

		/* if (FlxG.keys.justPressed.NINE)
			FlxG.switchState(new Charting()); */

		#if debug
		health += 2;
		if (FlxG.keys.justPressed.SIX)
		{
			if (useVideo)
			{
				GlobalVideo.get().stop();
				remove(videoSprite);
				FlxG.stage.window.onFocusOut.remove(focusOut);
				FlxG.stage.window.onFocusIn.remove(focusIn);
				removedVideo = true;
			}

			FlxG.switchState(new AnimationDebug(dad.curCharacter));
			clean();
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleInput);
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_UP, releaseInput);
			#if cpp
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}

		if (FlxG.keys.justPressed.EIGHT && songStarted)
		{
			paused = true;
			if (useVideo)
			{
				GlobalVideo.get().stop();
				remove(videoSprite);
				FlxG.stage.window.onFocusOut.remove(focusOut);
				FlxG.stage.window.onFocusIn.remove(focusIn);
				removedVideo = true;
			}
			new FlxTimer().start(0.3, function(tmr:FlxTimer)
			{
				for (bg in Stage.toAdd)
				{
					remove(bg);
				}
				for (array in Stage.layInFront)
				{
					for (bg in array)
						remove(bg);
				}
				remove(boyfriend);
				remove(dad);
				remove(gf);
			});
			FlxG.switchState(new StagePositioningDebug(SONG.stage, gf.curCharacter, boyfriend.curCharacter, dad.curCharacter));
			clean();
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleInput);
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_UP, releaseInput);
			#if cpp
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}

		if (FlxG.keys.justPressed.ZERO)
		{
			FlxG.switchState(new AnimationDebug(boyfriend.curCharacter));
			clean();
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleInput);
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_UP, releaseInput);
			#if cpp
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}

		if(FlxG.keys.justPressed.Z)
			{
				trace(FlxG.save.data.ghost);
				
				trophygot();
			}
			
		if(FlxG.keys.justPressed.ONE)
			checkfortrophy();

		if(FlxG.keys.justPressed.TWO && songStarted) { //Go 10 seconds into the future, credit: Shadow Mario#9396
			if (!usedTimeTravel && Conductor.songPosition + 10000 < FlxG.sound.music.length) 
			{
				usedTimeTravel = true;
				FlxG.sound.music.pause();
				vocals.pause();
				Conductor.songPosition += 10000;
				notes.forEachAlive(function(daNote:Note)
				{
					if(daNote.strumTime - 500 < Conductor.songPosition) {
						daNote.active = false;
						daNote.visible = false;

					
						daNote.kill();
						notes.remove(daNote, true);
						daNote.destroy();
					}
				});

				FlxG.sound.music.time = Conductor.songPosition;
				FlxG.sound.music.play();


				vocals.time = Conductor.songPosition;
				vocals.play();
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						usedTimeTravel = false;
					});
			}
		}
		#end


		if (startingSong)
		{
			if (startedCountdown)
			{
				Conductor.songPosition += FlxG.elapsed * 1000;
				if (Conductor.songPosition >= 0)
					startSong();
			}
		}
		else
		{
			// Conductor.songPosition = FlxG.sound.music.time;
			Conductor.songPosition = FlxG.sound.music.time;
			/*@:privateAccess
				{
					FlxG.sound.music._channel.
			}*/
			songPositionBar = (Conductor.songPosition - songLength) / 1000;

			currentSection = getSectionByTime(Conductor.songPosition);

			if (!paused)
			{
				songTime += FlxG.game.ticks - previousFrameTime;
				previousFrameTime = FlxG.game.ticks;

				// Interpolation type beat
				if (Conductor.lastSongPos != Conductor.songPosition)
				{
					songTime = (songTime + Conductor.songPosition) / 2;
					Conductor.lastSongPos = Conductor.songPosition;
					// Conductor.songPosition += FlxG.elapsed * 1000;
					// trace('MISSED FRAME');
				}
			}

			// Conductor.lastSongPos = FlxG.sound.music.time;
		}

		if (generatedMusic && currentSection != null)
		{

			closestNotes = [];

			notes.forEachAlive(function(daNote:Note)
			{
				if (daNote.canBeHit && daNote.mustPress && !daNote.wasGoodHit)
					closestNotes.push(daNote);
			}); // Collect notes that can be hit

			closestNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));

			// Make sure Girlfriend cheers only for certain songs
			if (allowedToHeadbang)
			{
				// Don't animate GF if something else is already animating her (eg. train passing)
				if (gf.animation.curAnim.name == 'danceLeft'
					|| gf.animation.curAnim.name == 'danceRight'
					|| gf.animation.curAnim.name == 'idle')
				{
					// Per song treatment since some songs will only have the 'Hey' at certain times
					switch (curSong)
					{
						case 'Philly Nice':
							{
								// General duration of the song
								if (curBeat < 250)
								{
									// Beats to skip or to stop GF from cheering
									if (curBeat != 184 && curBeat != 216)
									{
										if (curBeat % 16 == 8)
										{
											// Just a garantee that it'll trigger just once
											if (!triggeredAlready)
											{
												gf.playAnim('cheer');
												triggeredAlready = true;
											}
										}
										else
											triggeredAlready = false;
									}
								}
							}
						case 'Bopeebo':
							{
								// Where it starts || where it ends
								if (curBeat > 5 && curBeat < 130)
								{
									if (curBeat % 8 == 7)
									{
										if (!triggeredAlready)
										{
											gf.playAnim('cheer');
											triggeredAlready = true;
										}
									}
									else
										triggeredAlready = false;
								}
							}
						case 'Blammed':
							{
								if (curBeat > 30 && curBeat < 190)
								{
									if (curBeat < 90 || curBeat > 128)
									{
										if (curBeat % 4 == 2)
										{
											if (!triggeredAlready)
											{
												gf.playAnim('cheer');
												triggeredAlready = true;
											}
										}
										else
											triggeredAlready = false;
									}
								}
							}
						case 'Cocoa':
							{
								if (curBeat < 170)
								{
									if (curBeat < 65 || curBeat > 130 && curBeat < 145)
									{
										if (curBeat % 16 == 15)
										{
											if (!triggeredAlready)
											{
												gf.playAnim('cheer');
												triggeredAlready = true;
											}
										}
										else
											triggeredAlready = false;
									}
								}
							}
						case 'Eggnog':
							{
								if (curBeat > 10 && curBeat != 111 && curBeat < 220)
								{
									if (curBeat % 8 == 7)
									{
										if (!triggeredAlready)
										{
											gf.playAnim('cheer');
											triggeredAlready = true;
										}
									}
									else
										triggeredAlready = false;
								}
							}
					}
				}
			}

			#if cpp
			if (luaModchart != null)
				luaModchart.setVar("mustHit", currentSection.mustHitSection);
			#end

			if (songLowercase != 'exptrollgation')
				{
					if (camFollow.x != dad.getMidpoint().x + 150 && !currentSection.mustHitSection)
						{
							var offsetX = 0;
							var offsetY = 0;
							#if cpp
							if (luaModchart != null)
							{
								offsetX = luaModchart.getVar("followXOffset", "float");
								offsetY = luaModchart.getVar("followYOffset", "float");
							}
							#end
							if (songLowercase != 'exptrollgation')
								camFollow.setPosition(dad.getMidpoint().x + 150 + offsetX, dad.getMidpoint().y - 100 + offsetY);
									
							
							#if cpp
							if (luaModchart != null)
								luaModchart.executeState('playerTwoTurn', []);
							#end
							// camFollow.setPosition(lucky.getMidpoint().x - 120, lucky.getMidpoint().y + 210);
			
			
							switch (Stage.curStage)
							{
								case 'sidewalk':
									camFollow.y = dad.getMidpoint().y + 10;
									camFollow.x = dad.getMidpoint().x + 260;
								case 'sidehell' :
									camFollow.y = dad.getMidpoint().y + 10;
									camFollow.x = dad.getMidpoint().x + 260;
							}
			
							switch (dad.curCharacter)
							{
								case 'antcrazy':
									camFollow.y += dad.getMidpoint().y - 780;
									camFollow.x += dad.getMidpoint().x + 120;
							}
						}
			
						if (currentSection.mustHitSection && camFollow.x != boyfriend.getMidpoint().x - 100)
						{
							var offsetX = 0;
							var offsetY = 0;
							#if cpp
							if (luaModchart != null)
							{
								offsetX = luaModchart.getVar("followXOffset", "float");
								offsetY = luaModchart.getVar("followYOffset", "float");
							}
							#end
							if (songLowercase != 'exptrollgation')
									camFollow.setPosition(boyfriend.getMidpoint().x - 100 + offsetX, boyfriend.getMidpoint().y - 100 + offsetY);
									
							
			
							#if cpp
							if (luaModchart != null)
								luaModchart.executeState('playerOneTurn', []);
							#end
			
							switch (Stage.curStage)
							{
								case 'limo':
									camFollow.x = boyfriend.getMidpoint().x - 300;
								case 'mall':
									camFollow.y = boyfriend.getMidpoint().y - 200;
								case 'school':
									camFollow.x = boyfriend.getMidpoint().x - 200;
									camFollow.y = boyfriend.getMidpoint().y - 200;
								case 'sidewalk':
									camFollow.x = boyfriend.getMidpoint().x - 300;
									camFollow.y = boyfriend.getMidpoint().y - 250;
								case 'sidehell':
									camFollow.x = boyfriend.getMidpoint().x - 300;
									camFollow.y = boyfriend.getMidpoint().y - 250;
							}
						}
				}
				else
					{
						if (!currentSection.mustHitSection)
							{
								var offsetX = 0;
								var offsetY = 0;
								#if cpp
								if (luaModchart != null)
								{
									offsetX = luaModchart.getVar("followXOffset", "float");
									offsetY = luaModchart.getVar("followYOffset", "float");
								}
								#end
								if (songLowercase != 'exptrollgation')
									camFollow.setPosition(dad.getMidpoint().x + 150 + offsetX, dad.getMidpoint().y - 100 + offsetY);
										
								
								#if cpp
								if (luaModchart != null)
									luaModchart.executeState('playerTwoTurn', []);
								#end
								// camFollow.setPosition(lucky.getMidpoint().x - 120, lucky.getMidpoint().y + 210);
				
				
								switch (Stage.curStage)
								{
									case 'sidewalk':
										camFollow.y = dad.getMidpoint().y + 10;
										camFollow.x = dad.getMidpoint().x + 260;
									case 'sidehell' :
										camFollow.y = dad.getMidpoint().y + 10;
										camFollow.x = dad.getMidpoint().x + 260;
								}
				
								switch (dad.curCharacter)
								{
									case 'antcrazy':
										camFollow.y += dad.getMidpoint().y - 780;
										camFollow.x += dad.getMidpoint().x + 120;
								}
							}
				
							if (currentSection.mustHitSection)
							{
								var offsetX = 0;
								var offsetY = 0;
								#if cpp
								if (luaModchart != null)
								{
									offsetX = luaModchart.getVar("followXOffset", "float");
									offsetY = luaModchart.getVar("followYOffset", "float");
								}
								#end
								if (songLowercase != 'exptrollgation')
										camFollow.setPosition(boyfriend.getMidpoint().x - 100 + offsetX, boyfriend.getMidpoint().y - 100 + offsetY);
										
								
				
								#if cpp
								if (luaModchart != null)
									luaModchart.executeState('playerOneTurn', []);
								#end
				
								switch (Stage.curStage)
								{
									case 'limo':
										camFollow.x = boyfriend.getMidpoint().x - 300;
									case 'mall':
										camFollow.y = boyfriend.getMidpoint().y - 200;
									case 'school':
										camFollow.x = boyfriend.getMidpoint().x - 200;
										camFollow.y = boyfriend.getMidpoint().y - 200;
									case 'sidewalk':
										camFollow.x = boyfriend.getMidpoint().x - 300;
										camFollow.y = boyfriend.getMidpoint().y - 250;
									case 'sidehell':
										camFollow.x = boyfriend.getMidpoint().x - 300;
										camFollow.y = boyfriend.getMidpoint().y - 250;
								}
							}
					}

		}

		if (camZooming && Conductor.bpm < 320)
		{

			if (Conductor.bpm > 320) // if we don't do this it'll be really annoying
			{
				camZooming = false;
			}

			if (FlxG.save.data.zoom < 0.8)
				FlxG.save.data.zoom = 0.8;
	
			if (FlxG.save.data.zoom > 1.2)
				FlxG.save.data.zoom = 1.2;

			if (!executeModchart)
			{
				FlxG.camera.zoom = FlxMath.lerp(Stage.camZoom, FlxG.camera.zoom, 0.95);
				camHUD.zoom = FlxMath.lerp(FlxG.save.data.zoom, camHUD.zoom, 0.95);

				camNotes.zoom = camHUD.zoom;
				camSustains.zoom = camHUD.zoom;
			}
			else
			{
				FlxG.camera.zoom = FlxMath.lerp(Stage.camZoom, FlxG.camera.zoom, 0.95);
				camHUD.zoom = FlxMath.lerp(1, camHUD.zoom, 0.95);

				camNotes.zoom = camHUD.zoom;
				camSustains.zoom = camHUD.zoom;
			}
		}

		FlxG.watch.addQuick("curBPM", Conductor.bpm);
		FlxG.watch.addQuick("beatShit", curBeat);
		FlxG.watch.addQuick("stepShit", curStep);

		if (curSong == 'Fresh')
		{
			switch (curBeat)
			{
				case 16:
					camZooming = true;
					gfSpeed = 2;
				case 48:
					gfSpeed = 1;
				case 80:
					gfSpeed = 2;
				case 112:
					gfSpeed = 1;
				case 163:
					// FlxG.sound.music.stop();
					// FlxG.switchState(new TitleState());
			}
		}

		if (curSong == 'Bopeebo')
		{
			switch (curBeat)
			{
				case 128, 129, 130:
					vocals.volume = 0;
					// FlxG.sound.music.stop();
					// FlxG.switchState(new PlayState());
			}
		}

		if (health <= 0 && !cannotDie && candie)
		{
			if (!usedTimeTravel) 
			{

				if (spadetimer != null)
					spadetimer.active = false;
				if (scythetimer != null)
					scythetimer.active = false;
				if (bombtimer != null)
					bombtimer.active = false;
				if (cumtimer != null)
					cumtimer.active = false;

				boyfriend.stunned = true;

				persistentUpdate = false;
				persistentDraw = false;
				paused = true;

				storydeaths ++;

				vocals.stop();
				FlxG.sound.music.stop();

				if (FlxG.save.data.InstantRespawn)
				{
					FlxG.switchState(new PlayState());
				}
				else 
				{
					if (songLowercase == 'exptrollgation')
						{
							openSubState(new GameOverdr(ball.getMidpoint().x, ball.getMidpoint().y));
						}
						else
							{
								openSubState(new GameOverSubstate(boyfriend.getScreenPosition().x, boyfriend.getScreenPosition().y));
							}
						
					
				}

				#if windows
				// Game Over doesn't get his own variable because it's only used here
				DiscordClient.changePresence("GAME OVER -- "
					+ SONG.song
					+ " ("
					+ storyDifficultyText
					+ ") "
					+ Ratings.GenerateLetterRank(accuracy),
					"\nAcc: "
					+ HelperFunctions.truncateFloat(accuracy, 2)
					+ "% | Score: "
					+ songScore
					+ " | Misses: "
					+ misses, iconRPC);
				#end
			}
			else
				health = 1;
		}

		if (healthdr <= 0)
			{
				if (!usedTimeTravel) 
				{

					if (spadetimer != null)
						spadetimer.active = false;
					if (scythetimer != null)
						scythetimer.active = false;
					if (bombtimer != null)
						bombtimer.active = false;
					if (cumtimer != null)
						cumtimer.active = false;

					boyfriend.stunned = true;
	
					persistentUpdate = false;
					persistentDraw = false;
					paused = true;
	
					storydeaths ++;
	
					vocals.stop();
					FlxG.sound.music.stop();
	
					if (FlxG.save.data.InstantRespawn)
					{
						FlxG.switchState(new PlayState());
					}
					else 
					{
						openSubState(new GameOverdr(ball.getMidpoint().x, ball.getMidpoint().y));
					}
	
					#if windows
					// Game Over doesn't get his own variable because it's only used here
					DiscordClient.changePresence("GAME OVER -- "
						+ SONG.song
						+ " ("
						+ storyDifficultyText
						+ ") "
						+ Ratings.GenerateLetterRank(accuracy),
						"\nAcc: "
						+ HelperFunctions.truncateFloat(accuracy, 2)
						+ "% | Score: "
						+ songScore
						+ " | Misses: "
						+ misses, iconRPC);
					#end
				}
				else
					health = 1;
			}
		if (!inCutscene && FlxG.save.data.resetButton && startTimer != null)
		{
			if (FlxG.keys.justPressed.R)
			{

				if (spadetimer != null)
					spadetimer.active = false;
				if (scythetimer != null)
					scythetimer.active = false;
				if (bombtimer != null)
					bombtimer.active = false;
				if (cumtimer != null)
					cumtimer.active = false;

				boyfriend.stunned = true;

				persistentUpdate = false;
				persistentDraw = false;
				paused = true;

				vocals.stop();
				FlxG.sound.music.stop();
			 
                if (FlxG.save.data.InstantRespawn)
				{
					FlxG.switchState(new PlayState());
				}
				else 
				{
					if (songLowercase == 'exptrollgation')
						{
							openSubState(new GameOverdr(ball.getMidpoint().x, ball.getMidpoint().y));
						}
						else
							{
								openSubState(new GameOverSubstate(boyfriend.getScreenPosition().x, boyfriend.getScreenPosition().y));
							}
				}

				#if windows
				// Game Over doesn't get his own variable because it's only used here
				DiscordClient.changePresence("GAME OVER -- "
					+ SONG.song
					+ " ("
					+ storyDifficultyText
					+ ") "
					+ Ratings.GenerateLetterRank(accuracy),
					"\nAcc: "
					+ HelperFunctions.truncateFloat(accuracy, 2)
					+ "% | Score: "
					+ songScore
					+ " | Misses: "
					+ misses, iconRPC);
				#end
			}
		}


		if (generatedMusic)
		{
			sad.alpha = FlxMath.lerp(sad.alpha, 0, 0.02);
			if (sad.alpha < 0.1)
				sad.alpha = 0;

			var holdArray:Array<Bool> = [controls.LEFT, controls.DOWN, controls.UP, controls.RIGHT];

			notes.forEachAlive(function(daNote:Note)
			{
				// instead of doing stupid y > FlxG.height
				// we be men and actually calculate the time :)

				if (!daNote.modifiedByLua)
				{
					if (PlayStateChangeables.useDownscroll && !doup || dodown)
					{
						
						if (daNote.mustPress)
						{
							daNote.y = (playerStrums.members[Math.floor(Math.abs(daNote.noteData))].y
								+ 0.45 * ((Conductor.songPosition - daNote.strumTime)) * 
								(FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
									2) )) 
								- daNote.noteYOff;
						}
						else
							daNote.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
								+ 0.45 * ((Conductor.songPosition - daNote.strumTime)) * (FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
									2))) - daNote.noteYOff;
						if (daNote.isSustainNote)
						{
							// Remember = minus makes notes go up, plus makes them go down
							if (daNote.animation.curAnim.name.endsWith('end') && daNote.prevNote != null)
								daNote.y += daNote.prevNote.height;

							// If not in botplay, only clip sustain notes when properly hit, botplay gets to clip it everytime
							if (!PlayStateChangeables.botPlay || !fakemode)
							{
								if ((!daNote.mustPress || daNote.wasGoodHit || daNote.prevNote.wasGoodHit || holdArray[Math.floor(Math.abs(daNote.noteData))])
									&& daNote.y - daNote.offset.y * daNote.scale.y + daNote.height >= (strumLine.y + Note.swagWidth / 2))
								{
									// Clip to strumline
									var swagRect = new FlxRect(0, 0, daNote.frameWidth * 2, daNote.frameHeight * 2);
									swagRect.height = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
										+ Note.swagWidth / 2
										- daNote.y) / daNote.scale.y;
									swagRect.y = daNote.frameHeight - swagRect.height;

									daNote.clipRect = swagRect;
								}
							}
							else
							{
								if (daNote.luckyAnim != true)
									{
										var swagRect = new FlxRect(0, 0, daNote.frameWidth * 2, daNote.frameHeight * 2);
										swagRect.height = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
											+ Note.swagWidth / 2
											- daNote.y) / daNote.scale.y;
										swagRect.y = daNote.frameHeight - swagRect.height;
		
										daNote.clipRect = swagRect;
									}
							}
						}
					}
					else
					{
						if (daNote.mustPress)
							daNote.y = (playerStrums.members[Math.floor(Math.abs(daNote.noteData))].y
								- 0.45 * ((Conductor.songPosition - daNote.strumTime)) * (FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
									2))) + daNote.noteYOff;
						else
							daNote.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
								- 0.45 * ((Conductor.songPosition - daNote.strumTime)) * (FlxMath.roundDecimal(PlayStateChangeables.scrollSpeed == 1 ? SONG.speed : PlayStateChangeables.scrollSpeed,
									2))) + daNote.noteYOff;
						if (daNote.isSustainNote)
						{

							if (!PlayStateChangeables.botPlay || !fakemode)
							{
								if ((!daNote.mustPress || daNote.wasGoodHit || daNote.prevNote.wasGoodHit || holdArray[Math.floor(Math.abs(daNote.noteData))])
									&& daNote.y + daNote.offset.y * daNote.scale.y <= (strumLine.y + Note.swagWidth / 2))
								{
									// Clip to strumline
									var swagRect = new FlxRect(0, 0, daNote.width / daNote.scale.x, daNote.height / daNote.scale.y);
									swagRect.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
										+ Note.swagWidth / 2
										- daNote.y) / daNote.scale.y;
									swagRect.height -= swagRect.y;

									daNote.clipRect = swagRect;
								}
							}
							else
							{
								if (daNote.luckyAnim != true)
									{
										var swagRect = new FlxRect(0, 0, daNote.width / daNote.scale.x, daNote.height / daNote.scale.y);
										swagRect.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
											+ Note.swagWidth / 2
											- daNote.y) / daNote.scale.y;
										swagRect.height -= swagRect.y;
		
										daNote.clipRect = swagRect;
									}
							}
						}
					}
				}

				if (!daNote.mustPress && daNote.wasGoodHit)
				{
					if (SONG.song != 'Tutorial')
						camZooming = true;

					var altAnim:String = "";

					if (currentSection != null)
					{
						if (currentSection.CPUAltAnim)
							altAnim = '-alt';
					}
					
					if (daNote.isAlt)
					{
						altAnim = '-alt';
						trace("YOO WTF THIS IS AN ALT NOTE????");
					}

					// Accessing the animation name directly to play it
					if (!daNote.isParent && daNote.parent != null)
					{
						if (daNote.spotInLine != daNote.parent.children.length - 1)
						{
							var singData:Int = Std.int(Math.abs(daNote.noteData));
							dad.playAnim('sing' + dataSuffix[singData] + altAnim, true);

								cpuStrums.forEach(function(spr:StaticArrow)
								{
									pressArrow(spr, spr.ID, daNote);
									
									if (spr.animation.curAnim.name == 'confirm' && SONG.noteStyle == 'pixel')
										{
											spr.centerOffsets();
										}
									
								});
							#if cpp
							if (luaModchart != null)
								luaModchart.executeState('playerTwoSing', [Math.abs(daNote.noteData), Conductor.songPosition]);
							#end

							dad.holdTimer = 0;

							if (SONG.needsVoices)
								vocals.volume = 1;
						}
					}
					else
					{
						var singData:Int = Std.int(Math.abs(daNote.noteData));
							dad.playAnim('sing' + dataSuffix[singData] + altAnim, true);

								cpuStrums.forEach(function(spr:StaticArrow)
								{
									pressArrow(spr, spr.ID, daNote);
									
									if (spr.animation.curAnim.name == 'confirm' && SONG.noteStyle == 'pixel')
									{
										spr.centerOffsets();
									}
										
									
								});

							#if cpp
							if (luaModchart != null)
								luaModchart.executeState('playerTwoSing', [Math.abs(daNote.noteData), Conductor.songPosition]);
							#end

							dad.holdTimer = 0;

							if (SONG.needsVoices)
								vocals.volume = 1;
					}
					daNote.active = false;

					daNote.kill();
					notes.remove(daNote, true);
					daNote.destroy();

					if (songLowercase == 'blood-shed' && health > 0.1){
						health -= 0.012;
					}

					if (songLowercase == 'blood-shed'){
						if (curStep >= 1694 && curStep < 1714)
							{
								cantshake= true;
							}
							else
								{
									cantshake= false;
								}
						if (!cantshake)
							{
								camGame.shake(0.0002, 0.01);
								camHUD.shake(0.002, 0.01);
							}
						chromnumber = 0.009;
						FlxTween.tween(this, {chromnumber: 0}, 0.05);
					}
				}

				if (daNote.mustPress && !daNote.modifiedByLua)
				{
					daNote.visible = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].visible;
					daNote.x = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].x;
					if (!daNote.isSustainNote)
						daNote.modAngle = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].modAngle;
					if (daNote.sustainActive)
					{
						if (executeModchart)
							daNote.alpha = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].alpha;
					}
					daNote.modAngle = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].modAngle;
				}
				else if (!daNote.wasGoodHit && !daNote.modifiedByLua)
				{
					daNote.visible = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].visible;
					daNote.x = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].x;
					if (!daNote.isSustainNote)
						daNote.modAngle = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].modAngle;
					if (daNote.sustainActive)
					{
						if (executeModchart)
							daNote.alpha = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].alpha;
					}
					daNote.modAngle = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].modAngle;
				}

				if (daNote.isSustainNote)
				{
					daNote.x += daNote.width / 2 + 20;
					if (SONG.noteStyle == 'pixel')
						daNote.x -= 11;
				}

				// trace(daNote.y);
				// WIP interpolation shit? Need to fix the pause issue
				// daNote.y = (strumLine.y - (songTime - daNote.strumTime) * (0.45 * PlayState.SONG.speed));

				if (daNote.isSustainNote && daNote.wasGoodHit && Conductor.songPosition >= daNote.strumTime)
				{
					daNote.kill();
					notes.remove(daNote, true);
					daNote.destroy();
				}
				else if ((daNote.mustPress && !PlayStateChangeables.useDownscroll || daNote.mustPress 
					&& PlayStateChangeables.useDownscroll && !doup || dodown)
					&& daNote.mustPress && daNote.strumTime - Conductor.songPosition < -(166 * Conductor.timeScale) && songStarted)
				{
					if (daNote.isSustainNote && daNote.wasGoodHit)
						{
							daNote.kill();
							notes.remove(daNote, true);
						}
						else
						{
							if (loadRep && daNote.isSustainNote)
							{
								// im tired and lazy this sucks I know i'm dumb
								if (findByTime(daNote.strumTime) != null)
									totalNotesHit += 1;
								else
								{
									if (daNote.luckyAnim != true)
									vocals.volume = 0;
									if (theFunne && !daNote.isSustainNote && daNote.luckyAnim == false)
									{
										if (!fakemode)
											noteMiss(daNote.noteData, daNote);
									}
									if (daNote.isParent && daNote.luckyAnim != true)
									{
										health -= 0.15; // give a health punishment for failing a LN
										for (i in daNote.children)
										{
											i.alpha = 0.3;
											i.sustainActive = false;
										}
									}
									else
									{
										if (!daNote.wasGoodHit
											&& daNote.isSustainNote
											&& daNote.sustainActive
											&& daNote.spotInLine != daNote.parent.children.length)
										{
											for (i in daNote.parent.children)
											{
												i.alpha = 0.3;
												i.sustainActive = false;
											}
											if (daNote.parent.wasGoodHit)
												misses++;
											updateAccuracy();
										}
										else if (!daNote.wasGoodHit
											&& !daNote.isSustainNote  && daNote.luckyAnim != true)
										{
											health -= 0.15;
										}
									}
								}
							}
							else
							{
								if (daNote.luckyAnim != true)
								vocals.volume = 0;
								if (theFunne && !daNote.isSustainNote)
								{
									if (PlayStateChangeables.botPlay || fakemode)
									{
										daNote.rating = "bad";
										goodNoteHit(daNote);
									}
									else
									{
										if (!fakemode && daNote.luckyAnim == false)
											noteMiss(daNote.noteData, daNote);
									}
										
										
								}

								if (daNote.isParent && daNote.visible  && daNote.luckyAnim != true)
								{
									health -= 0.15; // give a health punishment for failing a LN
									for (i in daNote.children)
									{
										i.alpha = 0.3;
										i.sustainActive = false;
									}
								}
								else
								{
									if (!daNote.wasGoodHit
										&& daNote.isSustainNote
										&& daNote.sustainActive
										&& daNote.spotInLine != daNote.parent.children.length)
									{
										//health -= 0.05; // give a health punishment for failing a LN
										for (i in daNote.parent.children)
										{
											i.alpha = 0.3;
											i.sustainActive = false;
										}
										if (daNote.parent.wasGoodHit)
											misses++;
										updateAccuracy();
									}
									else if (!daNote.wasGoodHit
										&& !daNote.isSustainNote  && daNote.luckyAnim != true)
									{
										health -= 0.15;
									}
								}
							}
						}

						daNote.visible = false;
						daNote.kill();
						notes.remove(daNote, true);
					}
			});
		}

			cpuStrums.forEach(function(spr:StaticArrow)
			{
				if (spr.animation.finished)
				{
					spr.playAnim('static');
					spr.centerOffsets();
				}
			});
			if (PlayStateChangeables.botPlay && fakemode)
			{
				playerStrums.forEach(function(spr:StaticArrow)
					{
						if (spr.animation.finished)
						{
							spr.playAnim('static');
							//spr.centerOffsets();
						}
					});
			}

		if (!inCutscene && songStarted)
			keyShit();


		if (health > 0.1)
			{
				if (poison * elapsed > health)
				{
					health = 0.01;
				}
				else
				{
					health -= poison * elapsed; 
					health += regenincrease * elapsed; 
				}
			}

		if (luckicon.alpha == 1||speedicon.alpha == 1||blindicon.alpha == 1||weakicon.alpha == 1||stronkicon.alpha == 1||invisicon.alpha == 1||poisonicon.alpha == 1||regenicon.alpha == 1|| doup || dodown)
			haseffect = true;
		else
			haseffect = false;

		if (luckicon.alpha == 1&&speedicon.alpha == 1&&blindicon.alpha == 1&&weakicon.alpha == 1&&stronkicon.alpha == 1&&invisicon.alpha == 1&&poisonicon.alpha == 1&&regenicon.alpha == 1 && FlxG.save.data.hdwgh == false)
			{
				FlxG.save.data.hdwgh = true;
				trophygot();
			}

		if (fakemode)
			{
				moveball();
				hp.text = healthdr + " / 100";

				if (realfakemode)
					{
						if (ball.animation.curAnim.name == 'can i put my')
							{
								canhurt = true;
							}
							else
								{
									canhurt = false;
								}
						heartbull.forEachAlive(function(spr:FlxSprite)
							{
								spr.updateHitbox();
								if (FlxCollision.pixelPerfectCheck(spr, ball))
									{
										hurta();
									}
							});
						spadebullet.forEachAlive(function(spr:FlxSprite)
							{
								spr.updateHitbox();
								if (FlxCollision.pixelPerfectCheck(spr, ball))
									{
										hurta();
									}
							});
						scythebullet.forEachAlive(function(spr:FlxSprite)
							{
								spr.updateHitbox();
								if (FlxCollision.pixelPerfectCheck(spr, ball))
									{
										hurta();
									}
							});
						scythelight.forEachAlive(function(spr:FlxSprite)
							{
								if (FlxG.pixelPerfectOverlap(ball, spr))
									{
										hurta();
										trace('hit by scythelight');
									}
							});
						slight.forEachAlive(function(spr:FlxSprite)
							{
								if (FlxG.pixelPerfectOverlap(ball, spr))
									{
										trace('hit by light');
										hurta();
									}
							});
						if (canarrow)
							{
								arrowattack.forEachAlive(function(spr:FlxSprite)
									{
										if (FlxCollision.pixelPerfectCheck(spr, ball))
											{
												hurta();
											}
									});
							}
					}
				if(FlxG.keys.justPressed.X)
					xnumber++;

				if (xnumber == 2)
					xnumber = 0;

				if (xnumber ==1)
					isx = true;
				else
					isx = false;
			}

		if (songLowercase == 'blood-shed')
			dad.y += Math.sin(curStep / 2.3) * 1.4;

		if (songLowercase == 'exptrollgation')
			dad.y -= Math.sin(curStep / 2.1) * 0.4;

		if (made)
			{
				blade2.x = blade.x;
				blade2.y = blade.y;
				blade2.angle = blade.angle;

				blade2f.x = bladef.x;
				blade2f.y = bladef.y;
				blade2f.angle = bladef.angle;
			}

		if (SONG.song == 'explosive')
			{
				if (seentnt)
					gaytext.alpha = 0;
			}
			
		super.update(elapsed);

		aaa += 0.01;

		if (fakemode)
			{
				if (getem)
					{
						blade.angle += 3;
						bladef.angle -= 3;
						if (FlxCollision.pixelPerfectCheck(blade, ball))
							{
								hurta();
							}
					}
			}
	}

	public function getSectionByTime(ms:Float):SwagSection
		{
	
			for (i in SONG.notes)
			{
				var start = TimingStruct.getTimeFromBeat((TimingStruct.getBeatFromTime(i.startTime)));
				var end = TimingStruct.getTimeFromBeat((TimingStruct.getBeatFromTime(i.endTime)));


				if (ms >= start && ms < end)
				{
					return i;
				}
			}
	
	
			return null;
		}

		function recalculateAllSectionTimes()
			{
		
					trace("RECALCULATING SECTION TIMES");
		
					for (i in 0...SONG.notes.length) // loops through sections
					{
						var section = SONG.notes[i];
		
						var currentBeat = 4 * i;
		
						var currentSeg = TimingStruct.getTimingAtBeat(currentBeat);
		
						if (currentSeg == null)
							return;
		
						var start:Float = (currentBeat - currentSeg.startBeat) / ((currentSeg.bpm) / 60);
		
						section.startTime = (currentSeg.startTime + start) * 1000;
		
						if (i != 0)
							SONG.notes[i - 1].endTime = section.startTime;
						section.endTime = Math.POSITIVE_INFINITY;
					}
			}
		
	function checkfortrophy() {

		FlxG.sound.music.volume = 0;
		vocals.volume = 0;
		canPause = false;

		switch (songLowercase)
		{
			case 'reconnected':
				if (FlxG.save.data.reconnected == false)
					{
						FlxG.save.data.reconnected = true;
						trophygot();
					}
				if (FlxG.save.data.reconnectedfc == false && misses == 0)
					{
						FlxG.save.data.reconnectedfc = true;
						trophygot();
					}
			case 'explosive':
				if (FlxG.save.data.explosion == false)
					{
						FlxG.save.data.explosion = true;
						trophygot();
					}
				if (FlxG.save.data.explosionfc == false && misses == 0)
					{
						FlxG.save.data.explosionfc = true;
						trophygot();
					}
			case 'cbt':
				if (FlxG.save.data.cbt == false)
					{
						FlxG.save.data.cbt = true;
						trophygot();
					}
				if (FlxG.save.data.cbtfc == false && misses == 0)
					{
						FlxG.save.data.cbtfc = true;
						trophygot();
					}
				new FlxTimer().start(0.0001, function(timer) {
					dad.playAnim('bruh', true);
				});
			case 'blood-shed':
				if (FlxG.save.data.blood == false)
					{
						FlxG.save.data.blood = true;
						trophygot();
					}
				if (FlxG.save.data.bloodfc == false && misses == 0)
					{
						FlxG.save.data.bloodfc = true;
						trophygot();
					}
			case 'exptrollgation':
				if (FlxG.save.data.jevil == false && misses ==0 && healthdr == 100)
					{
						FlxG.save.data.jevil = true;
						trophygot();
					}
		}

		if (!FlxG.save.data.ghost && FlxG.save.data.kade == false)
			{
				FlxG.save.data.kade = true;
				trophygot();
			}

		FlxG.save.data.totalmiss += misses;
		if (FlxG.save.data.totalmiss == 1000)
			trophygot();

		new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				if (isStoryMode)
					{
						switch (curSong.toLowerCase())
						{
							case 'blood-shed':
								schoolOutro(doof2);
							default:
								endSong();
						}
					}
					else
						{
							switch (curSong.toLowerCase())
							{
								default:
									endSong();
							}
						}
			});
	}

	function endSong():Void
	{
		endingSong = true;
		FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleInput);
		FlxG.stage.removeEventListener(KeyboardEvent.KEY_UP, releaseInput);
		if (useVideo)
		{
			GlobalVideo.get().stop();
			FlxG.stage.window.onFocusOut.remove(focusOut);
			FlxG.stage.window.onFocusIn.remove(focusIn);
			PlayState.instance.remove(PlayState.instance.videoSprite);
		}

		if (!loadRep)
			rep.SaveReplay(saveNotes, saveJudge, replayAna);
		else
		{
			PlayStateChangeables.botPlay = false;
			PlayStateChangeables.scrollSpeed = 1;
			PlayStateChangeables.useDownscroll = false;
		}

		if (FlxG.save.data.fpsCap > 290)
			(cast(Lib.current.getChildAt(0), Main)).setFPSCap(290);

		#if cpp
		if (luaModchart != null)
		{
			luaModchart.die();
			luaModchart = null;
		}
		#end

		canPause = false;
		FlxG.sound.music.volume = 0;
		vocals.volume = 0;
		FlxG.sound.music.pause();
		vocals.pause();
		if (SONG.validScore)
		{
			// adjusting the highscore song name to be compatible
			// would read original scores if we didn't change packages
			var songHighscore = StringTools.replace(PlayState.SONG.song, " ", "-");
			switch (songHighscore)
			{
				case 'Dad-Battle':
					songHighscore = 'Dadbattle';
				case 'Philly-Nice':
					songHighscore = 'Philly';
			}

			#if !switch
			Highscore.saveScore(songHighscore, Math.round(songScore), storyDifficulty);
			Highscore.saveCombo(songHighscore, Ratings.GenerateLetterRank(accuracy), storyDifficulty);
			#end
		}

		if (offsetTesting)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			offsetTesting = false;
			LoadingState.loadAndSwitchState(new OptionsMenu());
			clean();
			FlxG.save.data.offset = offsetTest;
		}
		else
		{
			if (isStoryMode)
			{
				campaignScore += Math.round(songScore);
				campaignMisses += misses;
				campaignSicks += sicks;
				campaignGoods += goods;
				campaigndeaths += storydeaths;
				campaignBads += bads;
				campaignShits += shits;

				

				if (songLowercase == "blood-shed" || songLowercase == 'tutorial-remix')
				{
					transIn = FlxTransitionableState.defaultTransIn;
					transOut = FlxTransitionableState.defaultTransOut;

					paused = true;

					FlxG.sound.music.stop();
					vocals.stop();
					FlxG.sound.playMusic(Paths.music('freakyMenu'));

					if (campaigndeaths == 0 && FlxG.save.data.nodeath == false && curSong.toLowerCase() != 'tutorial-remix')
						{
							FlxG.save.data.nodeath = true;
						}
						
					if (FlxG.save.data.scoreScreen)
					{
						openSubState(new ResultsScreen());
						new FlxTimer().start(1, function(tmr:FlxTimer)
							{
								inResults = true;
							});
					}
					else
					{
						FlxG.sound.playMusic(Paths.music('freakyMenu'));
						Conductor.changeBPM(102);
						FlxG.switchState(new StoryMenuState());
						clean();
					}

					#if cpp
					if (luaModchart != null)
					{
						luaModchart.die();
						luaModchart = null;
					}
					#end

					if (SONG.validScore)
					{
						NGio.unlockMedal(60961);
						Highscore.saveWeekScore(storyWeek, campaignScore, storyDifficulty);
					}

					StoryMenuState.unlockNextWeek(storyWeek);
				}
				else
				{
					storyPlaylist.remove(storyPlaylist[0]);
					var songFormat = StringTools.replace(PlayState.storyPlaylist[0], " ", "-");
					switch (songFormat)
					{
						case 'Dad-Battle':
							songFormat = 'Dadbattle';
						case 'Philly-Nice':
							songFormat = 'Philly';
					}

					var poop:String = Highscore.formatSong(songFormat, storyDifficulty);
					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					prevCamFollow = camFollow;

					PlayState.SONG = Song.conversionChecks(Song.loadFromJson(poop, PlayState.storyPlaylist[0]));
					FlxG.sound.music.stop();
					dia = true;

					LoadingState.loadAndSwitchState(new PlayState());
					clean();
				}
			}
			else
			{
				trace('WENT BACK TO FREEPLAY??');

				paused = true;

				FlxG.sound.music.stop();
				vocals.stop();

				if (FlxG.save.data.scoreScreen) 
				{
					openSubState(new ResultsScreen());
					new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							inResults = true;
						});
				}
				else
				{
					FlxG.switchState(new FreeplayState());
					clean();
				}
			}
		}
	}

	var endingSong:Bool = false;

	var hits:Array<Float> = [];
	var offsetTest:Float = 0;

	public function getRatesScore(rate:Float, score:Float):Float
	{
		var rateX:Float = 1;
		var lastScore:Float = score;
		var pr =  rate - 0.05;
		if (pr < 1.00)
			pr = 1;
		
		while(rateX <= pr)
		{
			if (rateX > pr)
				break;
			lastScore = score + ((lastScore * rateX) * 0.022);
			rateX += 0.05;
		}

		var actualScore = Math.round(score + (Math.floor((lastScore * pr)) * 0.022));

		return actualScore;
	}


	var timeShown = 0;
	var currentTimingShown:FlxText = null;

	function trophygot() {
		var got:FlxSprite = new FlxSprite(-600,10).loadGraphic(Paths.image('unlocked'));
		got.cameras = [camHUD];
		add(got);
		FlxTween.tween(got,{x: 10},1,{ease: FlxEase.expoInOut});
		FlxG.sound.play(Paths.sound('levelup'));
		new FlxTimer().start(1.5, function(tmr:FlxTimer)
			{
				FlxTween.tween(got,{x: -600},1,{ease: FlxEase.expoInOut});
			});
	}

	private function popUpScore(daNote:Note):Void
	{
		var noteDiff:Float = -(daNote.strumTime - Conductor.songPosition);
		var wife:Float = EtternaFunctions.wife3(-noteDiff, Conductor.timeScale);
		// boyfriend.playAnim('hey');
		vocals.volume = 1;
		var placement:String = Std.string(combo);

		var coolText:FlxText = new FlxText(0, 0, 0, placement, 32);
		coolText.screenCenter();
		coolText.x = FlxG.width * 0.55;
		coolText.y -= 350;
		coolText.cameras = [camHUD];
		//

		var rating:FlxSprite = new FlxSprite();
		var score:Float = 350;

		if (FlxG.save.data.accuracyMod == 1)
			totalNotesHit += wife;

		var daRating = daNote.rating;

		switch (daRating)
		{
			case 'shit':
				score = -300;
				combo = 0;
				misses++;
				health -= 0.05;
				ss = false;
				shits++;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit -= 1;
			case 'bad':
				daRating = 'bad';
				score = 0;
				health += healthincrease + 0.01 - weak;
				ss = false;
				bads++;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 0.50;
			case 'good':
				daRating = 'good';
				score = 200;
				ss = false;
				health += healthincrease + 0.02 - weak;
				goods++;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 0.75;
			case 'sick':
				if (health < 2)
					health += healthincrease + 0.04 - weak;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 1;
				sicks++;
		}

			score = getRatesScore(1, score);


		// trace('Wife accuracy loss: ' + wife + ' | Rating: ' + daRating + ' | Score: ' + score + ' | Weight: ' + (1 - wife));

		if (daRating != 'shit' || daRating != 'bad')
		{
			songScore += Math.round(score);

			/* if (combo > 60)
					daRating = 'sick';
				else if (combo > 12)
					daRating = 'good'
				else if (combo > 4)
					daRating = 'bad';
			 */

			var pixelShitPart1:String = "";
			var pixelShitPart2:String = '';
			var pixelShitPart3:String = null;

			if (SONG.noteStyle == 'pixel')
			{
				pixelShitPart1 = 'weeb/pixelUI/';
				pixelShitPart2 = '-pixel';
				pixelShitPart3 = 'shared';
			}

			var breakanim:FlxSprite = new FlxSprite(daNote.x, playerStrums.members[daNote.noteData].y);
			if (daNote.luckyAnim == true)
			{
				var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('Lucky_note', 'shared');
				breakanim.frames = tex;
				breakanim.animation.addByPrefix('break 0', 'Note Hit Left', 24, false);
				breakanim.animation.addByPrefix('break 1', 'Note Hit Down', 24, false);
				breakanim.animation.addByPrefix('break 2', 'Note Hit Up', 24, false);
				breakanim.animation.addByPrefix('break 3', 'Note Hit Right', 24, false);
				if (daNote.luckyAnim == true)
				{
					add(breakanim);
					breakanim.cameras = [camHUD];
					breakanim.animation.play('break ' + daNote.noteData);
					breakanim.scale.set(0.79,0.79);
					breakanim.y -= 50;
					breakanim.x -= 50;
					breakanim.animation.finishCallback = function(name) breakanim.kill();
				}
			}

			rating.loadGraphic(Paths.image(pixelShitPart1 + daRating + pixelShitPart2, pixelShitPart3));
			rating.scale.set(0.7,0.7);
			rating.screenCenter();
			rating.y -= 50;
			rating.x = coolText.x - 125;

			if (FlxG.save.data.changedHit)
			{
				rating.x = FlxG.save.data.changedHitX;
				rating.y = FlxG.save.data.changedHitY;
			}
			rating.acceleration.y = 550;
			rating.velocity.y -= FlxG.random.int(140, 175);
			rating.velocity.x -= FlxG.random.int(0, 10);

			var msTiming = HelperFunctions.truncateFloat(noteDiff, 3);
			if (PlayStateChangeables.botPlay && !loadRep || fakemode)
				msTiming = 0;


			if (loadRep)
				msTiming = HelperFunctions.truncateFloat(findByTime(daNote.strumTime)[3], 3);

			if (currentTimingShown != null)
				remove(currentTimingShown);

			currentTimingShown = new FlxText(0, 0, 0, "0ms");
			timeShown = 0;
			switch (daRating)
			{
				case 'shit' | 'bad':
					currentTimingShown.color = FlxColor.RED;
				case 'good':
					currentTimingShown.color = FlxColor.GREEN;
				case 'sick':
					currentTimingShown.color = FlxColor.CYAN;
			}
			currentTimingShown.borderStyle = OUTLINE;
			currentTimingShown.borderSize = 1;
			currentTimingShown.borderColor = FlxColor.BLACK;
			currentTimingShown.text = msTiming + "ms";
			currentTimingShown.size = 20;
			if (fakemode)
				currentTimingShown.x -= 10000;

			if (msTiming >= 0.03 && offsetTesting)
			{
				// Remove Outliers
				hits.shift();
				hits.shift();
				hits.shift();
				hits.pop();
				hits.pop();
				hits.pop();
				hits.push(msTiming);

				var total = 0.0;

				for (i in hits)
					total += i;

				offsetTest = HelperFunctions.truncateFloat(total / hits.length, 2);
			}

			if (currentTimingShown.alpha != 1)
				currentTimingShown.alpha = 1;

			if (!PlayStateChangeables.botPlay || loadRep || !fakemode)
				add(currentTimingShown);

			var comboSpr:FlxSprite = new FlxSprite().loadGraphic(Paths.image(pixelShitPart1 + 'combo' + pixelShitPart2, pixelShitPart3));
			comboSpr.screenCenter();
			comboSpr.x = rating.x;
			comboSpr.y = rating.y + 100;
			comboSpr.acceleration.y = 600;
			comboSpr.velocity.y -= 150;

			if (!fakemode)
			currentTimingShown.screenCenter();
			if (!fakemode)
			currentTimingShown.x = comboSpr.x + 100;
			currentTimingShown.y = rating.y + 100;
			currentTimingShown.acceleration.y = 600;
			currentTimingShown.velocity.y -= 150;

			comboSpr.velocity.x += FlxG.random.int(1, 10);
			currentTimingShown.velocity.x += comboSpr.velocity.x;
			if (!PlayStateChangeables.botPlay || loadRep || !fakemode)
				add(rating);

			if (SONG.noteStyle != 'pixel')
			{
				rating.setGraphicSize(Std.int(rating.width * 0.45));
				rating.antialiasing = FlxG.save.data.antialiasing;
				comboSpr.setGraphicSize(Std.int(comboSpr.width * 0.45));
				comboSpr.antialiasing = FlxG.save.data.antialiasing;
			}
			else
			{
				rating.setGraphicSize(Std.int(rating.width * daPixelZoom * 0.45));
				comboSpr.setGraphicSize(Std.int(comboSpr.width * daPixelZoom * 0.45));
			}
			currentTimingShown.setGraphicSize(Std.int(currentTimingShown.width * 0.45));

			currentTimingShown.updateHitbox();
			comboSpr.updateHitbox();
			rating.updateHitbox();

			currentTimingShown.cameras = [camHUD];
			comboSpr.cameras = [camHUD];
			rating.cameras = [camHUD];

			var seperatedScore:Array<Int> = [];

			var comboSplit:Array<String> = (combo + "").split('');

			if (combo > highestCombo)
				highestCombo = combo;

			// make sure we have 3 digits to display (looks weird otherwise lol)
			if (comboSplit.length == 1)
			{
				seperatedScore.push(0);
				seperatedScore.push(0);
			}
			else if (comboSplit.length == 2)
				seperatedScore.push(0);

			for (i in 0...comboSplit.length)
			{
				var str:String = comboSplit[i];
				seperatedScore.push(Std.parseInt(str));
			}

			var daLoop:Int = 0;
			for (i in seperatedScore)
			{
				var numScore:FlxSprite = new FlxSprite().loadGraphic(Paths.image(pixelShitPart1 + 'num' + Std.int(i) + pixelShitPart2, pixelShitPart3));
				numScore.screenCenter();
				numScore.x = rating.x + (17 * daLoop) - 50;
				numScore.x += 15;
				numScore.y = rating.y + 70;
				numScore.cameras = [camHUD];

				if (SONG.noteStyle != 'pixel')
				{
					numScore.antialiasing = FlxG.save.data.antialiasing;
					numScore.setGraphicSize(Std.int(numScore.width * 0.5 * 0.45));
				}
				else
				{
					numScore.setGraphicSize(Std.int(numScore.width * daPixelZoom * 0.45));
				}
				numScore.updateHitbox();

				numScore.acceleration.y = FlxG.random.int(200, 300);
				numScore.velocity.y -= FlxG.random.int(140, 160);
				numScore.velocity.x = FlxG.random.float(-5, 5);

				add(numScore);

				visibleCombos.push(numScore);

				FlxTween.tween(numScore, {alpha: 0}, 0.2, {
					onComplete: function(tween:FlxTween)
					{
						visibleCombos.remove(numScore);
						numScore.destroy();
					},
					onUpdate: function (tween:FlxTween)
					{
						if (!visibleCombos.contains(numScore))
						{
							tween.cancel();
							numScore.destroy();
						}
					},
					startDelay: Conductor.crochet * 0.002
				});

				if (visibleCombos.length > seperatedScore.length + 20)
				{
					for(i in 0...seperatedScore.length - 1)
					{
						visibleCombos.remove(visibleCombos[visibleCombos.length - 1]);
					}
				}

				daLoop++;

				if (fakemode)
					{
						numScore.x -= 100000;
					}
			}
			/* 
				trace(combo);
				trace(seperatedScore);
			 */

			coolText.text = Std.string(seperatedScore);
			// add(coolText);

			FlxTween.tween(rating, {alpha: 0}, 0.2, {
				startDelay: Conductor.crochet * 0.001,
				onUpdate: function(tween:FlxTween)
				{
					if (currentTimingShown != null)
						currentTimingShown.alpha -= 0.02;
					timeShown++;
				}
			});

			FlxTween.tween(comboSpr, {alpha: 0}, 0.2, {
				onComplete: function(tween:FlxTween)
				{
					coolText.destroy();
					comboSpr.destroy();
					if (currentTimingShown != null && timeShown >= 20)
					{
						remove(currentTimingShown);
						currentTimingShown = null;
					}
					rating.destroy();
				},
				startDelay: Conductor.crochet * 0.001
			});

			curSection += 1;

			if (fakemode)
				{
					rating.x = -100000;
					comboSpr.x = -100000;
					coolText.x = -100000;
				}
		}
	}

	public function NearlyEquals(value1:Float, value2:Float, unimportantDifference:Float = 10):Bool
	{
		return Math.abs(FlxMath.roundDecimal(value1, 1) - FlxMath.roundDecimal(value2, 1)) < unimportantDifference;
	}

	var upHold:Bool = false;
	var downHold:Bool = false;
	var rightHold:Bool = false;
	var leftHold:Bool = false;

	// THIS FUNCTION JUST FUCKS WIT HELD NOTES AND BOTPLAY/REPLAY (also gamepad shit)

	private function keyShit():Void // I've invested in emma stocks
	{
		// control arrays, order L D R U
		var holdArray:Array<Bool> = [controls.LEFT, controls.DOWN, controls.UP, controls.RIGHT];
		var pressArray:Array<Bool> = [controls.LEFT_P, controls.DOWN_P, controls.UP_P, controls.RIGHT_P];
		var releaseArray:Array<Bool> = [controls.LEFT_R, controls.DOWN_R, controls.UP_R, controls.RIGHT_R];
		var keynameArray:Array<String> = ['left', 'down', 'up', 'right'];
		#if cpp
		if (luaModchart != null)
		{
			for (i in 0...pressArray.length) {
				if (pressArray[i] == true) {
				luaModchart.executeState('keyPressed', [keynameArray[i]]);
				}
			};
			
			for (i in 0...releaseArray.length) {
				if (releaseArray[i] == true) {
				luaModchart.executeState('keyReleased', [keynameArray[i]]);
				}
			};
			
		};
		#end

		// Prevent player input if botplay is on
		if (PlayStateChangeables.botPlay)
		{
			holdArray = [false, false, false, false];
			pressArray = [false, false, false, false];
			releaseArray = [false, false, false, false];
		}

		var anas:Array<Ana> = [null, null, null, null];

		for (i in 0...pressArray.length)
			if (pressArray[i])
				anas[i] = new Ana(Conductor.songPosition, null, false, "miss", i);

		// HOLDS, check for sustain notes
		if (holdArray.contains(true) && /*!boyfriend.stunned && */ generatedMusic && !fakemode)
		{
			notes.forEachAlive(function(daNote:Note)
			{
				if (daNote.isSustainNote && daNote.canBeHit && daNote.mustPress && holdArray[daNote.noteData] && daNote.sustainActive && !fakemode)
				{
					goodNoteHit(daNote);
				}
			});
		}

		if ((KeyBinds.gamepad && !FlxG.keys.justPressed.ANY))
		{
			// PRESSES, check for note hits
			if (pressArray.contains(true) && generatedMusic && !fakemode)
			{
				boyfriend.holdTimer = 0;

				var possibleNotes:Array<Note> = []; // notes that can be hit
				var directionList:Array<Int> = []; // directions that can be hit
				var dumbNotes:Array<Note> = []; // notes to kill later
				var directionsAccounted:Array<Bool> = [false, false, false, false]; // we don't want to do judgments for more than one presses

				notes.forEachAlive(function(daNote:Note)
				{
					if (daNote.canBeHit && daNote.mustPress && !daNote.wasGoodHit && !directionsAccounted[daNote.noteData])
					{
						if (directionList.contains(daNote.noteData))
						{
							directionsAccounted[daNote.noteData] = true;
							for (coolNote in possibleNotes)
							{
								if (coolNote.noteData == daNote.noteData && Math.abs(daNote.strumTime - coolNote.strumTime) < 10)
								{ // if it's the same note twice at < 10ms distance, just delete it
									// EXCEPT u cant delete it in this loop cuz it fucks with the collection lol
									dumbNotes.push(daNote);
									break;
								}
								else if (coolNote.noteData == daNote.noteData && daNote.strumTime < coolNote.strumTime)
								{ // if daNote is earlier than existing note (coolNote), replace
									possibleNotes.remove(coolNote);
									possibleNotes.push(daNote);
									break;
								}
							}
						}
						else
						{
							directionsAccounted[daNote.noteData] = true;
							possibleNotes.push(daNote);
							directionList.push(daNote.noteData);
						}
					}
				});

				for (note in dumbNotes)
				{
					FlxG.log.add("killing dumb ass note at " + note.strumTime);
					note.kill();
					notes.remove(note, true);
					note.destroy();
				}

				possibleNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));

				var hit = [false,false,false,false];

				if (perfectMode)
					goodNoteHit(possibleNotes[0]);
				else if (possibleNotes.length > 0)
				{
					if (!FlxG.save.data.ghost)
					{
						for (shit in 0...pressArray.length)
						{ // if a direction is hit that shouldn't be
							if (pressArray[shit] && !directionList.contains(shit))
								{
									if (!fakemode && swagNote.luckyAnim == false)
										noteMiss(shit, null);
								}
								
						}
					}
					for (coolNote in possibleNotes)
					{
						if (pressArray[coolNote.noteData] && !hit[coolNote.noteData] && !fakemode)
						{
							if (mashViolations != 0)
								mashViolations--;
							hit[coolNote.noteData] = true;
							scoreTxt.color = FlxColor.WHITE;
							var noteDiff:Float = -(coolNote.strumTime - Conductor.songPosition);
							anas[coolNote.noteData].hit = true;
							anas[coolNote.noteData].hitJudge = Ratings.judgeNote(coolNote);
							anas[coolNote.noteData].nearestNote = [coolNote.strumTime, coolNote.noteData, coolNote.sustainLength];
							goodNoteHit(coolNote);
						}
					}
				};
				
				if (boyfriend.holdTimer > Conductor.stepCrochet * 4 * 0.001 && (!holdArray.contains(true) || PlayStateChangeables.botPlay) || fakemode)
				{
					if (boyfriend.animation.curAnim.name.startsWith('sing') && !boyfriend.animation.curAnim.name.endsWith('miss') && (boyfriend.animation.curAnim.curFrame >= 10 || boyfriend.animation.curAnim.finished))
						boyfriend.playAnim('idle');
				}
				else if (!FlxG.save.data.ghost)
				{
					for (shit in 0...pressArray.length)
						if (pressArray[shit] && !fakemode && swagNote.luckyAnim == false)
							noteMiss(shit, null);
				}
			}

			if (!loadRep)
				for (i in anas)
					if (i != null)
						replayAna.anaArray.push(i); // put em all there
		}
		if (PlayStateChangeables.botPlay || fakemode)
		notes.forEachAlive(function(daNote:Note)
		{
			var diff = -(daNote.strumTime - Conductor.songPosition);

			daNote.rating = Ratings.judgeNote(daNote);
			if (daNote.mustPress && daNote.rating == "sick" || (diff > 0 && daNote.mustPress))
			{
				// Force good note hit regardless if it's too late to hit it or not as a fail safe
					if (loadRep)
					{
						// trace('ReplayNote ' + tmpRepNote.strumtime + ' | ' + tmpRepNote.direction);
						var n = findByTime(daNote.strumTime);
						trace(n);
						if (n != null)
						{
							goodNoteHit(daNote);
							boyfriend.holdTimer = 0;
								playerStrums.forEach(function(spr:StaticArrow)
								{
									pressArrow(spr, spr.ID, daNote);
									/*
									if (spr.animation.curAnim.name == 'confirm' && SONG.noteStyle != 'pixel')
									{
										spr.centerOffsets();
										spr.offset.x -= 13;
										spr.offset.y -= 13;
									}
									else
										spr.centerOffsets();
								*/
								});
						}
					}
					else
					{
						goodNoteHit(daNote);
						boyfriend.holdTimer = 0;
								playerStrums.forEach(function(spr:StaticArrow)
								{
									pressArrow(spr, spr.ID, daNote);
									/*
									if (spr.animation.curAnim.name == 'confirm' && SONG.noteStyle != 'pixel')
									{
										spr.centerOffsets();
										spr.offset.x -= 13;
										spr.offset.y -= 13;
									}
									else
										spr.centerOffsets();
								*/
								});
					}
			}
		});

		if (boyfriend.holdTimer > Conductor.stepCrochet * 4 * 0.001 && (!holdArray.contains(true) || PlayStateChangeables.botPlay) || fakemode)
		{
			if (boyfriend.animation.curAnim.name.startsWith('sing') && !boyfriend.animation.curAnim.name.endsWith('miss') && (boyfriend.animation.curAnim.curFrame >= 10 || boyfriend.animation.curAnim.finished))
				boyfriend.playAnim('idle');
		}

		if (!PlayStateChangeables.botPlay)
		{
			playerStrums.forEach(function(spr:StaticArrow)
			{
				if (keys[spr.ID] && spr.animation.curAnim.name != 'confirm' && spr.animation.curAnim.name != 'pressed' && !spr.animation.curAnim.name.startsWith('dirCon'))
					{
						if (!fakemode)
							spr.playAnim('pressed', false);
					}
				if (!keys[spr.ID])
					spr.playAnim('static', false);
			});
		}
	}

	public function findByTime(time:Float):Array<Dynamic>
	{
		for (i in rep.replay.songNotes)
		{
			// trace('checking ' + Math.round(i[0]) + ' against ' + Math.round(time));
			if (i[0] == time)
				return i;
		}
		return null;
	}

	public function findByTimeIndex(time:Float):Int
	{
		for (i in 0...rep.replay.songNotes.length)
		{
			// trace('checking ' + Math.round(i[0]) + ' against ' + Math.round(time));
			if (rep.replay.songNotes[i][0] == time)
				return i;
		}
		return -1;
	}

	public var fuckingVolume:Float = 1;
	public var useVideo = false;
	

	public static var webmHandler:WebmHandler;

	public var playingDathing = false;

	public var videoSprite:FlxSprite;

	public function focusOut()
	{
		if (paused)
			return;
		persistentUpdate = false;
		persistentDraw = true;
		paused = true;

		if (FlxG.sound.music != null)
		{
			FlxG.sound.music.pause();
			vocals.pause();
		}

		openSubState(new PauseSubState(boyfriend.getScreenPosition().x, boyfriend.getScreenPosition().y));
	}

	public function focusIn()
	{
		// nada
	}

	public function backgroundVideo(source:String) // for background videos
	{
		#if cpp
		useVideo = true;

		FlxG.stage.window.onFocusOut.add(focusOut);
		FlxG.stage.window.onFocusIn.add(focusIn);

		var ourSource:String = "assets/videos/daWeirdVid/dontDelete.webm";
		//WebmPlayer.SKIP_STEP_LIMIT = 90;
		var str1:String = "WEBM SHIT";
		webmHandler = new WebmHandler();
		webmHandler.source(ourSource);
		webmHandler.makePlayer();
		webmHandler.webm.name = str1;

		GlobalVideo.setWebm(webmHandler);

		GlobalVideo.get().source(source);
		GlobalVideo.get().clearPause();
		if (GlobalVideo.isWebm)
		{
			GlobalVideo.get().updatePlayer();
		}
		GlobalVideo.get().show();

		if (GlobalVideo.isWebm)
		{
			GlobalVideo.get().restart();
		}
		else
		{
			GlobalVideo.get().play();
		}

		var data = webmHandler.webm.bitmapData;

		videoSprite = new FlxSprite(-470, -30).loadGraphic(data);

		videoSprite.setGraphicSize(Std.int(videoSprite.width * 1.2));

		remove(gf);
		remove(boyfriend);
		remove(dad);
		add(videoSprite);
		add(gf);
		add(boyfriend);
		add(dad);

		trace('poggers');

		if (!songStarted)
			webmHandler.pause();
		else
			webmHandler.resume();
		#end
	}

	function noteMiss(direction:Int = 1, daNote:Note):Void
	{
		trace('aaaaaaaaaaaaaaaaaaaa');
		if (!boyfriend.stunned)
		{
			//health -= 0.2;
			if (combo > 5 && gf.animOffsets.exists('sad'))
			{
				gf.playAnim('sad');
			}
			combo = 0;
			misses++;

			if (daNote != null)
			{
				if (!loadRep)
				{
					saveNotes.push([
						daNote.strumTime,
						0,
						direction,
						-(166 * Math.floor((PlayState.rep.replay.sf / 60) * 1000) / 166)
					]);
					saveJudge.push("miss");
				}
			}
			else if (!loadRep)
			{
				saveNotes.push([
					Conductor.songPosition,
					0,
					direction,
					-(166 * Math.floor((PlayState.rep.replay.sf / 60) * 1000) / 166)
				]);
				saveJudge.push("miss");
			}

			// var noteDiff:Float = Math.abs(daNote.strumTime - Conductor.songPosition);
			// var wife:Float = EtternaFunctions.wife3(noteDiff, FlxG.save.data.etternaMode ? 1 : 1.7);

			if (FlxG.save.data.accuracyMod == 1)
				totalNotesHit -= 1;

			if (daNote != null)
			{
				if (!daNote.isSustainNote)
					songScore -= 10;
			}
			else
				songScore -= 10;
			
			if(FlxG.save.data.missSounds && candie)
				{
					FlxG.sound.play(Paths.soundRandom('missnote', 1, 3), FlxG.random.float(0.1, 0.2));
					// FlxG.sound.play(Paths.sound('missnote1'), 1, false);
					// FlxG.log.add('played imss note');
				}


			// Hole switch statement replaced with a single line :)
			boyfriend.playAnim('sing' + dataSuffix[direction] + 'miss', true);

			#if cpp
			if (luaModchart != null)
				luaModchart.executeState('playerOneMiss', [direction, Conductor.songPosition]);
			#end

			updateAccuracy();
		}
	}

	/*function badNoteCheck()
			{
				// just double pasting this shit cuz fuk u
				// REDO THIS SYSTEM!
				var upP = controls.UP_P;
				var rightP = controls.RIGHT_P;
				var downP = controls.DOWN_P;
				var leftP = controls.LEFT_P;

				if (leftP)
				updateAccuracy();
			}
	 */
	function updateAccuracy()
	{
		totalPlayed += 1;
		accuracy = Math.max(0, totalNotesHit / totalPlayed * 100);
		accuracyDefault = Math.max(0, totalNotesHitDefault / totalPlayed * 100);
		
		scoreTxt.text = Ratings.CalculateRanking(songScore, songScoreDef, nps, maxNPS, accuracy);
	}

	function getKeyPresses(note:Note):Int
	{
		var possibleNotes:Array<Note> = []; // copypasted but you already know that

		notes.forEachAlive(function(daNote:Note)
		{
			if (daNote.canBeHit && daNote.mustPress)
			{
				possibleNotes.push(daNote);
				possibleNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));
			}
		});
		if (possibleNotes.length == 1)
			return possibleNotes.length + 1;
		return possibleNotes.length;
	}

	var mashing:Int = 0;
	var mashViolations:Int = 0;

	var etternaModeScore:Int = 0;

	function noteCheck(controlArray:Array<Bool>, note:Note):Void // sorry lol
	{
		var noteDiff:Float = -(note.strumTime - Conductor.songPosition);

		note.rating = Ratings.judgeNote(note);

		/* if (loadRep)
			{
				if (controlArray[note.noteData])
					goodNoteHit(note, false);
				else if (rep.replay.keyPresses.length > repPresses && !controlArray[note.noteData])
				{
					if (NearlyEquals(note.strumTime,rep.replay.keyPresses[repPresses].time, 4))
					{
						goodNoteHit(note, false);
					}
				}
		}*/

		if (controlArray[note.noteData] && !fakemode)
		{
			goodNoteHit(note, (mashing > getKeyPresses(note)));

			/*if (mashing > getKeyPresses(note) && mashViolations <= 2)
				{
					mashViolations++;

					goodNoteHit(note, (mashing > getKeyPresses(note)));
				}
				else if (mashViolations > 2)
				{
					// this is bad but fuck you
					playerStrums.members[0].animation.play('static');
					playerStrums.members[1].animation.play('static');
					playerStrums.members[2].animation.play('static');
					playerStrums.members[3].animation.play('static');
					health -= 0.4;
					trace('mash ' + mashing);
					if (mashing != 0)
						mashing = 0;
				}
				else
					goodNoteHit(note, false); */
		}
	}

	function goodNoteHit(note:Note, resetMashViolation = true):Void
	{
		if (mashing != 0)
			mashing = 0;

		var noteDiff:Float = -(note.strumTime - Conductor.songPosition );


		if (loadRep)
		{
			noteDiff = findByTime(note.strumTime)[3];
			note.rating = rep.replay.songJudgements[findByTimeIndex(note.strumTime)];
		}
		else
			note.rating = Ratings.judgeNote(note);

		if (note.rating == "miss")
			return;

		// add newest note to front of notesHitArray
		// the oldest notes are at the end and are removed first
		if (!note.isSustainNote)
			notesHitArray.unshift(Date.now());

		if (!resetMashViolation && mashViolations >= 1)
			mashViolations--;

		if (mashViolations < 0)
			mashViolations = 0;

		if (note.luckyAnim == true)
			{
				if (FlxG.random.bool(luck))
					{
						if (FlxG.random.bool(70))
							{
								trace('goodefffunc');
								goodeffect();
							}
							else
								{
									luckincrease();
									trace('luckefffunc');
								}
					}
					else
						{
							badeffect();
							trace('badefffunc');
						}
			}

		if (!note.wasGoodHit)
		{
			if (!note.isSustainNote && note.luckyAnim != true)
			{
				popUpScore(note);
				combo += 1;
			}


			var altAnim:String = "";
			if (note.isAlt)
				{
					altAnim = '-alt';
					trace("Alt note on BF");
				}

			if (note.luckyAnim != true)
			boyfriend.playAnim('sing' + dataSuffix[note.noteData] + altAnim, true);

			#if cpp
			if (luaModchart != null)
				luaModchart.executeState('playerOneSing', [note.noteData, Conductor.songPosition]);
			#end

			if (!loadRep && note.mustPress)
			{
				var array = [note.strumTime, note.sustainLength, note.noteData, noteDiff];
				if (note.isSustainNote)
					array[1] = -1;
				saveNotes.push(array);
				saveJudge.push(note.rating);
			}

			if (!PlayStateChangeables.botPlay || fakemode)
			{
				playerStrums.forEach(function(spr:StaticArrow)
				{
					pressArrow(spr, spr.ID, note);
				});
			}

			if (!note.isSustainNote)
			{
				note.kill();
				notes.remove(note, true);
				note.destroy();
			}
			else
			{
				note.wasGoodHit = true;
			}
			if (!note.isSustainNote)
				updateAccuracy();
		}
	}

	function goodeffect() {
		switch(Random.int(1, 3)) {
            case 1://regen
			trace('regen');
			if (regenicon.alpha == 1)
				goodeffect();
			else{
			    emitterregen.alpha.set(1, 1, 1, 0.5);
                regenincrease += 0.075;
				regenicon.alpha =1;
				regentimer = new FlxTimer().start(17.5, function(tmr:FlxTimer)
					{
						emitterregen.alpha.set(0, 0, 0, 0);
						regenincrease -= 0.075;
						regenicon.alpha =0;
					},1);
			}

            case 2://stronk
			trace('stronk');
			if (stronkicon.alpha == 1)
				goodeffect();
			else
				{
					emitterstronk.alpha.set(1, 1, 1, 0.5);
					stronkicon.alpha =1;
					healthincrease += 0.05;
					stronktimer = new FlxTimer().start(17.5, function(tmr:FlxTimer)
						{
							healthincrease -= 0.05;
							emitterstronk.alpha.set(0, 0, 0, 0);
							stronkicon.alpha =0;
						},1);
				}
			case 3:
				trace('helth');
				health += 0.5;
        }
	}

	function badeffect() {
		switch(Random.int(1, 6)) {
            case 1://blind
			trace('blind');
			if (blindicon.alpha == 1)
				badeffect();
			else{
				emitterblind.alpha.set(1, 1, 1, 0.5);
				blindicon.alpha =1;
				playerStrums.forEach(function(spr:StaticArrow)
					{
						spr.shader = wiggleShit.shader;
					});
				
				blindtimer = new FlxTimer().start(8, function(tmr:FlxTimer)
					{
						emitterblind.alpha.set(0, 0, 0, 0);
						blindicon.alpha =0;
						playerStrums.forEach(function(spr:StaticArrow)
							{
								spr.shader = null;
							});
						
					},1);
			}
            case 2://posion
			trace('poison');
			if (poisonicon.alpha == 1)
				badeffect();
			else{
				poison += 0.09;
				emitterpoison.alpha.set(1, 1, 1, 0.5);
				poisonicon.alpha =1;
				poisontimer = new FlxTimer().start(15, function(tmr:FlxTimer)
					{
						emitterpoison.alpha.set(0, 0, 0, 0);
						poisonicon.alpha =0;
						poison -= 0.09;
					},1);
			}
            case 3://speed
			
			if (speedicon.alpha == 1)
			{
				trace('speed');
			}
			else
			{
				emitterspeed.alpha.set(1, 1, 1, 0.5);
				if (speedicon.alpha != 1)
					SONG.speed += 1;
				new FlxTimer().start(0.02, function(tmr:FlxTimer)
					{
						speedicon.alpha = 1;
					},1);
				speedtimer = new FlxTimer().start(15, function(tmr:FlxTimer)
					{
						emitterspeed.alpha.set(0, 0, 0, 0);
						speedicon.alpha =0;
						if (speedicon.alpha == 0)
							SONG.speed -= 1;
					},1);
			}
            case 4://weak
			trace('weak');
			if (weakicon.alpha == 1)
				badeffect();
			else{
				weak += 0.005;
				emitterweak.alpha.set(1, 1, 1, 0.5);
				weakicon.alpha =1;
				weaktimer = new FlxTimer().start(15, function(tmr:FlxTimer)
					{
						emitterweak.alpha.set(0, 0, 0, 0);
						weakicon.alpha =0;
						weak -= 0.005;
					},1);
			}

            case 5://invis
			trace('invis');
			if (invisicon.alpha == 1)
				badeffect();
			else{
				playerStrums.forEach(function(spr:StaticArrow)
					{
						FlxTween.tween(spr,{alpha: 0.1},1,{ease: FlxEase.expoInOut});
					});
					emitterinvis.alpha.set(1, 1, 1, 0.5);
					invisicon.alpha =1;
					invistimer = new FlxTimer().start(15, function(tmr:FlxTimer)
						{
							emitterinvis.alpha.set(0, 0, 0, 0);
							invisicon.alpha =0;
							playerStrums.forEach(function(spr:StaticArrow)
								{
									FlxTween.tween(spr,{alpha: 1},1,{ease: FlxEase.expoInOut});
								});
						},1);
			}

			case 6://levitation
			trace('levitation');
			if (!PlayStateChangeables.useDownscroll)
				{
					if (dodown)
						{
							badeffect();//already did this,reroll
						}
						else
							{
								dodown = true;
								playerStrums.forEach(function(spr:StaticArrow)
									{
										spr.y = spr.y + 500;
									});
								cpuStrums.forEach(function(spr:StaticArrow)
									{
										spr.y = spr.y + 500;
									});
								levtimer = new FlxTimer().start(20, function(tmr:FlxTimer)
									{
										dodown = false;
										playerStrums.forEach(function(spr:StaticArrow)
											{
												spr.y = spr.y - 500;
											});
										cpuStrums.forEach(function(spr:StaticArrow)
											{
												spr.y = spr.y - 500;
											});
									},1);
							}
				}
				else
					if (doup)
						{
							badeffect();//already did this,reroll
						}
						else
							{
								doup = true;
								playerStrums.forEach(function(spr:StaticArrow)
									{
										spr.y = spr.y - 500;
									});
								cpuStrums.forEach(function(spr:StaticArrow)
									{
										spr.y = spr.y - 500;
									});
								lev2timer = new FlxTimer().start(19.9, function(tmr:FlxTimer)
									{
										candie = false;
									},1);
								levtimer = new FlxTimer().start(20, function(tmr:FlxTimer)
									{
										doup = false;
										playerStrums.forEach(function(spr:StaticArrow)
											{
												spr.y = spr.y + 500;
											});
										cpuStrums.forEach(function(spr:StaticArrow)
											{
												spr.y = spr.y + 500;
											});
									},1);
								lev3timer = new FlxTimer().start(20.1, function(tmr:FlxTimer)
									{
										candie = true;
									},1);
							}



        }
		
	}

	function luckincrease() {
		trace('luck');
		if (luckicon.alpha == 1)
			goodeffect();
		else
			{
				luck += 10;
				emitterluck.alpha.set(1, 1, 1, 0.5);
				luckicon.alpha =1;
				lucktimer = new FlxTimer().start(20, function(tmr:FlxTimer)
					{
						luck -= 10;
						emitterluck.alpha.set(0, 0, 0, 0);
						luckicon.alpha =0;
					},1);
			}

		
	}

	function pressArrow(spr:StaticArrow, idCheck:Int, daNote:Note)
	{
		if (Math.abs(daNote.noteData) == idCheck)
		{
			if (!FlxG.save.data.stepMania)
			{
				spr.playAnim('confirm', true);
			}
			else
			{
				spr.playAnim('dirCon' + daNote.originColor, true);
				spr.localAngle = daNote.originAngle;
			}
		}
	}
	var fastCarCanDrive:Bool = true;

	function resetFastCar():Void
	{
		if (FlxG.save.data.distractions)
		{
			var fastCar = Stage.swagBacks['fastCar'];
			fastCar.x = -12600;
			fastCar.y = FlxG.random.int(140, 250);
			fastCar.velocity.x = 0;
			fastCarCanDrive = true;
		}
	}

	function fastCarDrive()
	{
		if (FlxG.save.data.distractions)
		{
			FlxG.sound.play(Paths.soundRandom('carPass', 0, 1), 0.7);

			Stage.swagBacks['fastCar'].velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
			fastCarCanDrive = false;
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				resetFastCar();
			});
		}
	}

	var trainMoving:Bool = false;
	var trainFrameTiming:Float = 0;

	var trainCars:Int = 8;
	var trainFinishing:Bool = false;
	var trainCooldown:Int = 0;

	function trainStart():Void
	{
		if (FlxG.save.data.distractions)
		{
			trainMoving = true;
			if (!trainSound.playing)
				trainSound.play(true);
		}
	}

	var startedMoving:Bool = false;

	function updateTrainPos():Void
	{
		if (FlxG.save.data.distractions)
		{
			if (trainSound.time >= 4700)
			{
				startedMoving = true;
				gf.playAnim('hairBlow');
			}

			if (startedMoving)
			{
				var phillyTrain = Stage.swagBacks['phillyTrain'];
				phillyTrain.x -= 400;

				if (phillyTrain.x < -2000 && !trainFinishing)
				{
					phillyTrain.x = -1150;
					trainCars -= 1;

					if (trainCars <= 0)
						trainFinishing = true;
				}

				if (phillyTrain.x < -4000 && trainFinishing)
					trainReset();
			}
		}
	}

	function trainReset():Void
	{
		if (FlxG.save.data.distractions)
		{
			gf.playAnim('hairFall');
			Stage.swagBacks['phillyTrain'].x = FlxG.width + 200;
			trainMoving = false;
			// trainSound.stop();
			// trainSound.time = 0;
			trainCars = 8;
			trainFinishing = false;
			startedMoving = false;
		}
	}

	function lightningStrikeShit():Void
	{
		FlxG.sound.play(Paths.soundRandom('thunder_', 1, 2));
		Stage.swagBacks['halloweenBG'].animation.play('lightning');

		lightningStrikeBeat = curBeat;
		lightningOffset = FlxG.random.int(8, 24);

		boyfriend.playAnim('scared', true);
		gf.playAnim('scared', true);
	}

	var danced:Bool = false;

	function lASTFUCKINGFUNCTION() {
		spadetimer = new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				if (FlxG.random.bool(50))
					{
						funnynumber = 2;
					}
					else
						{
							funnynumber = 2;
						}

				for (_ in 0...funnynumber)
					{
						if (FlxG.random.bool(50))
							spadebomb.add(new Spadebomb(Random.int(60, 380), 750));
						else
							spadebomb.add(new Spadebomb(Random.int(950, 1230), 750));
					}


				spadebomb.forEach(function(spr:FlxSprite)
					{
						new FlxTimer().start(Random.float(0.7,2), function(timer) {
							spr.kill();
							spadebomb.forEachDead(function(spr:FlxSprite)
								{
										spr.revive();
										if (spr.y > 0)
											{
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'a'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'b'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'c'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'd'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'e'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'f'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'g'));
												spadebullet.add(new Spadebullet(spr.x, spr.y, 'h'));
											}
										new FlxTimer().start(0.001, function(tmr:FlxTimer)
											{
												spr.x -= 1000000000000;
												spr.y -= 10000;//minus so it doesnt appear later in the fight lmao
											});
								});
						},1);
					});
			},9);
			cumtimer = new FlxTimer().start(1.5, function(tmr:FlxTimer)
				{
					for (_ in 0...1)
						{
							cum.add(new Heartbullet(Random.int(950, 1230), -200));
						}
					cum.forEach(function(spr:FlxSprite)
						{
							new FlxTimer().start(Random.float(2,3.3), function(timer) {
								spr.kill();
								cum.forEachDead(function(spr:FlxSprite)
									{
											spr.revive();
											if (spr.y > 0)
												{
													heartbull.add(new Heartlol(spr.x - 20, spr.y, ball));
												}
											
											new FlxTimer().start(0.001, function(tmr:FlxTimer)
												{
													spr.x -= 10000;
													spr.y -= 10000; //dumb way to make it not repeat for the dead ones multiple times but if it works it works
												},1);
									});
							},1);
						});
				},12);
			scythetimer = new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					for (_ in 0...1)
						{
							if (FlxG.random.bool(50))
								{
									if (FlxG.random.bool(50))
										{
											scythebomb.add(new Scythebomb(1310, 180,'right'));
										}
										else
											{
												scythebomb.add(new Scythebomb(-30, 180,'left'));
											}
								}
							else
								{
									if (FlxG.random.bool(50))
										{
											scythebomb.add(new Scythebomb(1310, 540,'right'));
										}
										else
											{
												scythebomb.add(new Scythebomb(-30, 540,'left'));
											}
								}
						}
					scythebomb.forEach(function(spr:FlxSprite)
						{
							new FlxTimer().start(0.5, function(timer) {
								spr.kill();
								scythebomb.forEachDead(function(spr:FlxSprite)
									{
											spr.revive();
											if (spr.y > 0)
												{
													scythebullet.add(new Scythebullet(spr.x, spr.y, ball));
												}
											
											new FlxTimer().start(0.001, function(tmr:FlxTimer)
												{
													spr.y -= 10000;
												},1);
									});
							},1);
						});
				},9);
	}

	override function stepHit()
	{
		super.stepHit();
		if (FlxG.sound.music.time > Conductor.songPosition + 20 || FlxG.sound.music.time < Conductor.songPosition - 20)
		{
			resyncVocals();
		}

		for (step in Stage.slowBacks.keys())
		{
			if (step == curStep)
			{
				if (Stage.hideLastBG)
				{
					for (bg in Stage.swagBacks)
					{
						if (!Stage.slowBacks[step].contains(bg))
							FlxTween.tween(bg, {alpha: 0}, Stage.tweenDuration);
					}
					for (bg in Stage.slowBacks[step])
					{
						FlxTween.tween(bg, {alpha: 1}, Stage.tweenDuration);
					}
				}
				else
				{
					for (bg in Stage.slowBacks[step])
						bg.visible = !bg.visible;
				}
			}
		}

		#if cpp
		if (executeModchart && luaModchart != null)
		{
			luaModchart.setVar('curStep', curStep);
			luaModchart.executeState('stepHit', [curStep]);
		}
		#end

		if (songLowercase == 'blood-shed' && curStep == 1696)
			{
				tntthing2 = new FlxTypedGroup<TNTfall>();
				add(tntthing2);
				tnttime = true;
				tntthing2.add(new TNTfall(500, -600));
				FlxG.sound.play(Paths.sound('fuse'));
				new FlxTimer().start(3, function(tmr:FlxTimer)
					{
						checkbf();
					},1);
				camHUD.shake(0.05,1); 
				camGame.shake(0.01,1); 
			}
		if (songLowercase == 'explosive')
			{
				if (curStep == 75|| curStep == 239|| curStep == 767 || curStep == 1120 || curStep == 2140)
					tnt();
			}
		if (songLowercase == 'exptrollgation' && curStep == 695)
			{
				getfake();
			}
		if (songLowercase == 'exptrollgation' && curStep == 1535)
			{
				FlxTween.tween(camdr,{alpha: 0},5,{ease: FlxEase.expoInOut});
				FlxTween.tween(b,{alpha: 0},5,{ease: FlxEase.expoInOut});
				new FlxTimer().start(0.0001, function(tmr:FlxTimer)
					{
						canhurt = false;
					},0);
			}

		if (songLowercase == 'exptrollgation' && curStep == 1398)
			{
				btnt = new FlxSprite().loadGraphic(Paths.image('bullets/btnt'));
				btnt.antialiasing = false;
				btnt.cameras = [camdr];
				add(btnt);
				btnt.x += 187;
				btnt.y += 248;
				btnt.y += 720;
				FlxTween.tween(btnt,{y: btnt.y - 720},2,{ease: FlxEase.expoInOut});

				btnt2 = new FlxSprite().loadGraphic(Paths.image('bullets/btnt'));
				btnt2.antialiasing = false;
				btnt2.cameras = [camdr];
				add(btnt2);
				btnt2.x += 909;
				btnt2.y += 248;
				btnt2.y += 720;
				FlxTween.tween(btnt2,{y: btnt2.y - 720},2,{ease: FlxEase.expoInOut});
				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						FlxTween.angle(btnt, -360, 360, 3, {ease: FlxEase.expoInOut});
						FlxTween.angle(btnt2, -360, 360, 3, {ease: FlxEase.expoInOut});
					},1);

				new FlxTimer().start(0.001, function(tmr:FlxTimer)
					{
						if (FlxCollision.pixelPerfectCheck(btnt, ball))
							{
								if (btnt.alpha ==1)
									hurta();
							}
						if (FlxCollision.pixelPerfectCheck(btnt2, ball))
							{
								if (btnt2.alpha ==1)
									hurta();
							}
					},0);
			}

		if (songLowercase == 'exptrollgation' && curStep >= 1404 && curStep <= 1407)
			{
				chromnumber += 0.0025;
			}
		if (songLowercase == 'exptrollgation' && curStep == 1408)
			{
				FlxG.camera.flash(FlxColor.WHITE, 1);
				chromnumber = 0.0;
				btnt.alpha = 0;
				btnt2.alpha = 0;
				lASTFUCKINGFUNCTION();
			}

		if (songLowercase == 'exptrollgation' && curStep >= 1071)
			{
				FlxTween.tween(blade,{y: blade.y - 750},1,{ease: null, onComplete: function(flxTween:FlxTween) 
					{ 
					}});
				FlxTween.tween(bladef,{y: bladef.y - 750},1,{ease: null, onComplete: function(flxTween:FlxTween) 
					{ 
					}});
			}

		if (songLowercase == 'exptrollgation' && curStep == 1081)
			{
				FlxTween.tween(drbar,{alpha: 0},1,{ease: FlxEase.expoInOut});
				FlxTween.tween(hpbardr,{alpha: 0},1,{ease: FlxEase.expoInOut});
				FlxTween.tween(hp,{alpha: 0},1,{ease: FlxEase.expoInOut});
				FlxTween.tween(box,{y: box.y - 500},1,{ease: FlxEase.expoInOut});
				FlxTween.tween(boxblack,{y: boxblack.y - 500},1,{ease: FlxEase.expoInOut});
				FlxTween.angle(box, -360, 360, 1, {ease: FlxEase.expoInOut});
				FlxTween.angle(boxblack, -360, 360, 1, {ease: FlxEase.expoInOut});
				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
					},1);
			}

		if (songLowercase == 'exptrollgation' && curStep == 1086)
			{
				FlxTween.tween(b,{alpha: 0.8},0.5,{ease: FlxEase.expoInOut});
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						arrowattack = new FlxTypedGroup<Arrowattack>();
						add(arrowattack);
						arrowattack.cameras = [camdr];
						canarrow = true;
					},1);
			}

		if (songLowercase == 'exptrollgation' && curStep >= 1081 && curStep < 1086 && dad.animation.curAnim.name != 'cya')
			{
				dad.playAnim('cya', true);
			}

		if (songLowercase == 'explosive' && curStep == 96 && dad.animation.curAnim.name != 'awman')
			{
				dad.playAnim('awman', true);
			}

		if (songLowercase == 'cbt')
			{
				if (curStep == 91 || curStep == 634 || curStep == 1914)
					{
						sad.alpha = 1;
					}
				if (curStep == 45 && dad.animation.curAnim.name != 'balls')
					{
						dad.playAnim('balls', true);
					}

				if (curStep == 90  && dad.animation.curAnim.name != 'trolled')
					{
						dad.playAnim('trolled', true);
					}

				if (curStep == 636  && dad.animation.curAnim.name != 'trolled')
					{
						dad.playAnim('trolled', true);
					}

				if (curStep == 821  && dad.animation.curAnim.name != 'keepup')
					{
						dad.playAnim('keepup', true);
					}

				if (curStep == 1048  && dad.animation.curAnim.name != 'whitty')
					{
						dad.playAnim('whitty', true);
					}

				if (curStep == 1115  && dad.animation.curAnim.name != 'ugh')
					{
						dad.playAnim('ugh', true);
					}

				if (curStep == 1334 && dad.animation.curAnim.name != 'keepitup')
					{
						dad.playAnim('keepitup', true);
					}

				if (curStep == 1915 && dad.animation.curAnim.name != 'trolled')
					{
						dad.playAnim('trolled', true);
					}
				if (curStep == 2110)
					{
						bfsheild.alpha = 1;
						boyfriend.alpha =0;
						bfsheild.offset.set(287, 269);
						bfsheild.animation.play('atk');

						new FlxTimer().start(0.0001, function(tmr:FlxTimer)
							{
								if (bfsheild.animation.curAnim.name == 'atk' && bfsheild.animation.curAnim.finished)
									{
										boyfriend.alpha =1;
										bfsheild.alpha = 0;
									}
							},10000000);

					}

				if (curStep == 2111 && dad.animation.curAnim.name != 'owfuck')
					{
						dad.playAnim('owfuck', true);
					}

				if (curStep >= 2124 && curStep < 4000 && dad.animation.curAnim.name != 'bruh')
					{
						dad.playAnim('bruh', true);
					}
			}

	}

	function getfake() {

		fakemode = true;

		FlxTween.tween(iconP1,{x: iconP1.x + 1000},1.5,{ease: FlxEase.expoInOut});
		FlxTween.tween(iconP2,{x: iconP2.x + 1000},1.5,{ease: FlxEase.expoInOut});
		FlxTween.tween(healthBar,{x: healthBar.x + 1000},1.5,{ease: FlxEase.expoInOut});
		FlxTween.tween(healthBarBG,{x: healthBarBG.x + 1000},1.5,{ease: FlxEase.expoInOut});
		FlxTween.tween(scoreTxt,{x: scoreTxt.x + 1000},1.5,{ease: FlxEase.expoInOut});
		kadeEngineWatermark.alpha = 0;

		b = new FlxSprite().loadGraphic(Paths.image('bbb'));
		b.antialiasing = false;
		b.scale.set(3,3);
		b.alpha = 1;
		b.cameras = [camHUD];
		add(b);

		box = new FlxSprite().loadGraphic(Paths.image('box'));
		box.antialiasing = FlxG.save.data.antialiasing;
		box.screenCenter();
		box.y += 500;
		box.cameras = [camdr];
		

		boxblack = new FlxSprite(300,50).loadGraphic(Paths.image('boxblack'));
		boxblack.antialiasing = FlxG.save.data.antialiasing;
		boxblack.scale.set(1.7,1.7);
		boxblack.screenCenter();
		boxblack.y += 500;
		boxblack.cameras = [camdr];

		var trail = new FlxTrail(box, null, 24, 1, 0.4, 0.02);
		trail.cameras = [camdr];
		
		add(boxblack);
		add(trail);
		add(box);
		add(ball);

		bigbox = new FlxSprite().loadGraphic(Paths.image('bigbox'));
		bigbox.antialiasing = FlxG.save.data.antialiasing;
		bigbox.screenCenter();
		bigbox.cameras = [camdr];
		add(bigbox);

		FlxFlicker.flicker(ball, 1, 0.1, true);
		FlxTween.tween(ball,{x: ball.x + 405,y: ball.y - 220},1,{ease: FlxEase.expoInOut});
		FlxTween.tween(box,{y: box.y - 500},1,{ease: FlxEase.expoInOut});
		FlxTween.tween(boxblack,{y: boxblack.y - 500},1,{ease: FlxEase.expoInOut});
		FlxTween.angle(box, -360, 360, 1, {ease: FlxEase.expoInOut});


		drbar = new FlxSprite(140,605).loadGraphic(Paths.image('drbar'));
		drbar.antialiasing = false;
		drbar.scale.set(2,2.2);
		drbar.alpha = 0.9;
		drbar.cameras = [camdr];
		drbar.y += 200;
		add(drbar);

		hpbardr = new FlxBar(290, 610, LEFT_TO_RIGHT, 150, 15, this,
		'healthdr', 0, 100);
		hpbardr.cameras = [camdr];
		hpbardr.y += 200;
		hpbardr.createFilledBar(0xFF800000, 0xFF00ffff);
		add(hpbardr);

		hp = new FlxText(315, 573, Std.int(FlxG.width * 0.6), healthdr + " / 100", 20);
		hp.cameras = [camdr];
		hp.setFormat(Paths.font("deltarune-hp-font.ttf"), 20);
		hp.y += 200;
		add(hp);

		new FlxTimer().start(1, function(timer) {
			FlxTween.tween(b,{alpha: 0.5},0.5,{ease: FlxEase.expoInOut});
			FlxTween.tween(drbar,{y: drbar.y - 200},0.9,{ease: FlxEase.expoInOut});
			FlxTween.tween(hp,{y: hp.y - 200},0.9,{ease: FlxEase.expoInOut});
			FlxTween.tween(hpbardr,{y: hpbardr.y - 200},0.9,{ease: FlxEase.expoInOut});
			remove(boxblack);
			add(boxblack);
			remove(box);
			add(box);
			bulletTime();
		},1);
	}

	function bulletTime() {

		cum = new FlxTypedGroup<Heartbullet>();
		add(cum);
		cum.cameras = [camdr];

		heartbull = new FlxTypedGroup<Heartlol>();
		add(heartbull);
		heartbull.cameras = [camdr];

		spadebomb = new FlxTypedGroup<Spadebomb>();
		add(spadebomb);
		spadebomb.cameras = [camdr];

		spadebullet = new FlxTypedGroup<Spadebullet>();
		add(spadebullet);
		spadebullet.cameras = [camdr];

		scythebomb = new FlxTypedGroup<Scythebomb>();
		add(scythebomb);
		scythebomb.cameras = [camdr];

		scythebullet = new FlxTypedGroup<Scythebullet>();
		add(scythebullet);
		scythebullet.cameras = [camdr];

		scythelight = new FlxTypedGroup<Scythelight>();
		add(scythelight);
		scythelight.cameras = [camdr];

		slight = new FlxTypedGroup<Light>();
		add(slight);
		slight.cameras = [camdr];

		for (_ in 0...2)
		{
			cum.add(new Heartbullet(Random.int(60, 380), -200));
		}
		for (_ in 0...2)
			{
				cum.add(new Heartbullet(Random.int(950, 1230), -200));
			}
		cum.forEach(function(spr:FlxSprite)
			{
				new FlxTimer().start(Random.float(2,3.3), function(timer) {
					spr.kill();
					cum.forEachDead(function(spr:FlxSprite)
						{
								spr.revive();
								if (spr.y > 0)
									{
										heartbull.add(new Heartlol(spr.x - 20, spr.y, ball));
									}
								
								new FlxTimer().start(0.001, function(tmr:FlxTimer)
									{
										spr.x -= 10000;
										spr.y -= 10000; //dumb way to make it not repeat for the dead ones multiple times but if it works it works
									},1);
								realfakemode = true;
						});
				},1);
			});

		new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				spadetimer = new FlxTimer().start(1.5, function(tmr:FlxTimer)
					{
						if (FlxG.random.bool(50))
							{
								funnynumber = 3;
							}
							else
								{
									funnynumber = 4;
								}

						for (_ in 0...funnynumber)
							{
								if (FlxG.random.bool(50))
									spadebomb.add(new Spadebomb(Random.int(60, 380), 750));
								else
									spadebomb.add(new Spadebomb(Random.int(950, 1230), 750));
							}


						spadebomb.forEach(function(spr:FlxSprite)
							{
								new FlxTimer().start(Random.float(0.7,2), function(timer) {
									spr.kill();
									spadebomb.forEachDead(function(spr:FlxSprite)
										{
												spr.revive();
												if (spr.y > 0)
													{
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'a'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'b'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'c'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'd'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'e'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'f'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'g'));
														spadebullet.add(new Spadebullet(spr.x, spr.y, 'h'));
													}
												new FlxTimer().start(0.001, function(tmr:FlxTimer)
													{
														spr.x -= 1000000000000;
														spr.y -= 10000;//minus so it doesnt appear later in the fight lmao
													});
												realfakemode = true;
										});
								},1);
							});
					},10);
					new FlxTimer().start(17, function(tmr:FlxTimer)
						{
							scythetime();
						},1);
			},1);
	}

	function scythetime() {
		scythetimer = new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				for (_ in 0...3)
					{
						if (FlxG.random.bool(50))
							{
								if (FlxG.random.bool(50))
									{
										scythebomb.add(new Scythebomb(1310, 180,'right'));
									}
									else
										{
											scythebomb.add(new Scythebomb(-30, 180,'left'));
										}
							}
						else
							{
								if (FlxG.random.bool(50))
									{
										scythebomb.add(new Scythebomb(1310, 540,'right'));
									}
									else
										{
											scythebomb.add(new Scythebomb(-30, 540,'left'));
										}
							}
					}
				scythebomb.forEach(function(spr:FlxSprite)
					{
						new FlxTimer().start(0.5, function(timer) {
							spr.kill();
							scythebomb.forEachDead(function(spr:FlxSprite)
								{
										spr.revive();
										if (spr.y > 0)
											{
												scythebullet.add(new Scythebullet(spr.x, spr.y, ball));
											}
										
										new FlxTimer().start(0.001, function(tmr:FlxTimer)
											{
												spr.y -= 10000;
											},1);
								});
						},1);
					});
			},15);

		new FlxTimer().start(15.5, function(tmr:FlxTimer)
			{
				bigscythe();
			},1);
		
	}

	function bigscythe() {
		blade = new FlxSprite().loadGraphic(Paths.image('bullets/whynot'));
		blade.screenCenter();
		blade.x -= 380;
		blade.y += 510;
		blade.cameras = [camdr];
		blade.flipX = true;
		add(blade);

		blade2 = new FlxSprite().loadGraphic(Paths.image('bullets/lmao'));
		blade2.screenCenter();
		blade2.x -= 380;
		blade2.y += 510;
		blade2.flipX = true;
		blade2.cameras = [camdr];
		add(blade2);

		bladef = new FlxSprite().loadGraphic(Paths.image('bullets/whynot'));
		bladef.screenCenter();
		bladef.x += 380;
		bladef.y += 510;
		bladef.cameras = [camdr];
		bladef.flipX = false;
		add(bladef);

		blade2f = new FlxSprite().loadGraphic(Paths.image('bullets/lmao'));
		blade2f.screenCenter();
		blade2f.x += 380;
		blade2f.y += 510;
		blade2f.flipX = false;
		blade2f.cameras = [camdr];
		add(blade2f);

		var trail = new FlxTrail(blade, null, 15, 4, 0.1, 0.02);
		add(trail);

		var trail2 = new FlxTrail(blade2, null, 15, 4, 0.1, 0.02);
		add(trail2);

		var trailf = new FlxTrail(bladef, null, 15, 4, 0.1, 0.02);
		add(trailf);

		var trail2f = new FlxTrail(blade2f, null, 15, 4, 0.1, 0.02);
		add(trail2f);

		trail2.cameras = [camdr];
		trail.cameras = [camdr];
		trail2f.cameras = [camdr];
		trailf.cameras = [camdr];

		trail.color = FlxColor.RED;

		made = true;

		FlxTween.angle(blade, -360, 360, 2, {ease: FlxEase.backOut});
		FlxTween.tween(blade,{y: blade.y - 510},2,{ease: FlxEase.backOut});

		FlxTween.angle(bladef, -360, 360, 2, {ease: FlxEase.backOut});
		FlxTween.tween(bladef,{y: bladef.y - 510},2,{ease: FlxEase.backOut, onComplete: function(flxTween:FlxTween) 
			{ 
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						FlxTween.tween(blade2,{alpha: 0.4}, 1);
						FlxTween.tween(blade2f,{alpha: 0.4}, 1);
						FlxTween.tween(bladef,{alpha: 0.4}, 1);
					},1);
				new FlxTimer().start(1.5, function(tmr:FlxTimer)
					{
						getem = true;
						movescythe();
					},1);
			}});
	}

	function movescythe() {
		FlxTween.tween(blade,{x: blade.x + 750},1.9,{ease: null, onComplete: function(flxTween:FlxTween) 
			{ 
				FlxTween.tween(blade,{x: blade.x - 750},1.9,{ease: null, onComplete: function(flxTween:FlxTween) 
					{ 
						movescythe();
					}});
			}});
		FlxTween.tween(bladef,{x: bladef.x - 750},1.9,{ease: null, onComplete: function(flxTween:FlxTween) 
			{ 
				FlxTween.tween(bladef,{x: bladef.x + 750},1.9,{ease: null, onComplete: function(flxTween:FlxTween) 
					{ 
					}});
			}});
	}

	public function hurta() {
		if (canhurt)
			{
				FlxG.sound.play(Paths.sound('hurt'));
				healthdr -= 15;
				ball.animation.play('ouch');
				FlxFlicker.flicker(ball, 1.8, 0.1, true);
				new FlxTimer().start(1.8, function(tmr:FlxTimer)
					{
						ball.animation.play('can i put my');
					},1);
				boyfriend.playAnim('hit', true);
			}
	}

	function tnt() {
		canPause = false;
		dad.alpha = 0;
		anttnt.alpha = 1;
		anttnt.animation.play('tnt');
		tnttime = true;
		checkant = true;
		tntthing = new FlxTypedGroup<TNT>();
		add(tntthing);

		if (checkant)
			{
				new FlxTimer().start(0.41, function(tmr:FlxTimer)
					{
								trace('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
								tntthing.add(new TNT(dad.x - 75, dad.y));
								FlxG.sound.play(Paths.sound('fuse'));
								new FlxTimer().start(3.5, function(tmr:FlxTimer)
									{
										checkbf();
									},1);

								gaytext.alpha = 1;
								FlxFlicker.flicker(gaytext, 3, 0.15, false);
								new FlxTimer().start(0.02, function(tmr:FlxTimer)
									{
										tntthing.forEachAlive(function(spr:FlxSprite)
											{
												gaytext.x = spr.x;
												gaytext.y = spr.y - 100;
											});
									},0);
					},1);
				new FlxTimer().start(0.02, function(tmr:FlxTimer)
					{
						if (anttnt.animation.curAnim.name == 'tnt' && anttnt.animation.curAnim.finished)
							{
								checkant = false;
								anttnt.alpha = 0;
								dad.alpha =1;
							}
					},0);
			}
	}

	function checktaps() {
		if (taps >= 3)
			{
				tnttime = false;
				taps = 0;
				boyfriend.alpha = 0;
				bfsheild.alpha = 1;
				bfsheild.animation.play('def');
			}
	}

	function checkbf() {
		canPause = true;
		

			if (songLowercase == 'blood-shed'){
				tntthing2.forEachDead(function(spr:FlxSprite)
					{
						boom.x = spr.x - 110;
						boom.y = spr.y - 50;
					});
			}
			else
				{
					tntthing.forEachDead(function(spr:FlxSprite)
						{
							boom.x = spr.x - 110;
							boom.y = spr.y - 50;
						});
				}
		boom.alpha = 1;
		boom.animation.play('ka');
		FlxG.sound.play(Paths.soundRandom('explode', 1, 4), 1);
		if (bfsheild.animation.curAnim.name == 'def' && bfsheild.animation.curAnim.finished)
			{
				boyfriend.alpha = 1;
				bfsheild.alpha = 0;
				bfsheild.animation.play('damn');
				seentnt = true;
				if (songLowercase != 'blood-shed')
					gaytext.alpha = 0;
				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						boom.alpha = 0;
					},1);
			}
			else {
				health -= 2;
			}
				
	}


	function moveball() {
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (isx)
			{
				if (up || down || left || right)
					{
						if (up)
						{
							ball.y -= speed / 2;
							if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
								{
									ball.y += speed / 2;
								}
						}
						if (down)
						{
							ball.y += speed / 2;
							if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
								{
									ball.y -= speed / 2;
								}
						}
						if (left)
						{
							ball.x -= speed / 2;
							if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
								{
									ball.x += speed / 2;
								}
						}
						if (right)
						{
							ball.x += speed / 2;
							if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
								{
									ball.x -= speed / 2;
								}
						}
					}
			}
			else
				{
					if (up || down || left || right)
						{
							if (up)
							{
								ball.y -= speed;
								if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
									{
										ball.y += speed;
									}
							}
							if (down)
							{
								ball.y += speed;
								if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
									{
										ball.y -= speed;
									}
							}
							if (left)
							{
								ball.x -= speed;
								if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
									{
										ball.x += speed;
									}
							}
							if (right)
							{
								ball.x += speed;
								if (FlxCollision.pixelPerfectCheck(box, ball) || FlxCollision.pixelPerfectCheck(bigbox, ball))
									{
										ball.x -= speed;
									}
							}
						}
				}

	}

	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;
		
	
	function a() {
		if (songLowercase == 'blood-shed'){
			FlxTween.tween(redeffect,{alpha: 0.6},0.5106,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
				{ 
					FlxTween.tween(redeffect,{alpha: 1},0.5106,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
						{ 
							a();
						}});
				}});
		}
	}

	function doredthing() {
		if (songLowercase == 'blood-shed'){
			FlxTween.tween(redthing,{alpha: 0.6},0.2553,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
				{ 
					FlxTween.tween(redthing,{alpha: 1},0.2553,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
						{ 
							doredthing();
						}});
				}});
		}
	}

	function drbombtime() {
			scythetimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					for (_ in 0...1)
						{
							if (FlxG.random.bool(50))
								{
									if (FlxG.random.bool(50))
										{
											scythebomb.add(new Scythebomb(1310, 180,'right'));
										}
										else
											{
												scythebomb.add(new Scythebomb(-30, 180,'left'));
											}
								}
							else
								{
									if (FlxG.random.bool(50))
										{
											scythebomb.add(new Scythebomb(1310, 540,'right'));
										}
										else
											{
												scythebomb.add(new Scythebomb(-30, 540,'left'));
											}
								}
						}
					scythebomb.forEach(function(spr:FlxSprite)
						{
							new FlxTimer().start(0.5, function(timer) {
								spr.kill();
								scythebomb.forEachDead(function(spr:FlxSprite)
									{
											spr.revive();
											if (spr.y > 0)
												{
													scythebullet.add(new Scythebullet(spr.x, spr.y, ball));
												}
											
											new FlxTimer().start(0.001, function(tmr:FlxTimer)
												{
													spr.y -= 10000;
												},1);
									});
							},1);
						});
				},15);
				bombtimer = new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						for (_ in 0...1)
							{
								switch(Random.int(1, 10)) {
									case 1:
										scythelight.add(new Scythelight('one'));
									case 2:
										scythelight.add(new Scythelight('two'));
									case 3:
										scythelight.add(new Scythelight('three'));
									case 4:
										scythelight.add(new Scythelight('four'));
									case 5:
										scythelight.add(new Scythelight('five'));
									case 6:
										scythelight.add(new Scythelight('six'));
									case 7:
										scythelight.add(new Scythelight('seven'));
									case 8:
										scythelight.add(new Scythelight('eight'));
									case 9:
										scythelight.add(new Scythelight('nine'));
									case 10:
										scythelight.add(new Scythelight('ten'));
								}
							}
							scythelight.forEach(function(spr:FlxSprite)
								{
									new FlxTimer().start(1, function(timer) {
										spr.kill();
										scythelight.forEachDead(function(spr:FlxSprite)
											{
													spr.revive();
													if (spr.y > 0)
														{
															slight.add(new Light(spr.x, spr.y - 800));
														}
													
													new FlxTimer().start(0.001, function(tmr:FlxTimer)
														{
															spr.y -= 20000;
														},1);
											});
									},1);
								});
					},18);
			
	}
	override function beatHit()
	{
		super.beatHit();

		if (canarrow)
			{
				if (curBeat % 4 == 0 && curBeat < 302)
					{
						if (FlxG.random.bool(50))
							{
								arrowattack.add(new Arrowattack(-200, 0, 'left'));
							}
						else
							{
								arrowattack.add(new Arrowattack(200, 0, 'right'));
							}
					}
			}		

		if (songLowercase == 'exptrollgation' && curBeat == 272)
			{
				speed = 3.5;
			}
		if (songLowercase == 'exptrollgation' && curBeat == 317)
			{
				b = new FlxSprite().loadGraphic(Paths.image('bbb'));
				b.antialiasing = false;
				b.scale.set(3,3);
				b.alpha = 0;
				b.cameras = [camHUD];
				add(b);
				FlxTween.tween(b,{alpha: 0.5},0.5,{ease: FlxEase.expoInOut});
				ball.screenCenter();
				ball.y += 720;
				FlxTween.tween(ball,{y: ball.y - 720},1.5,{ease: FlxEase.expoInOut});
				FlxTween.angle(ball, -360, 360, 1.5, {ease: FlxEase.expoInOut});
				new FlxTimer().start(1.5, function(tmr:FlxTimer)
					{
						hptxt = new FlxText(ball.x + 30, ball.y - 30, Std.int(FlxG.width * 0.6), "+30", 20);
						hptxt.cameras = [camdr];
						hptxt.setFormat(Paths.font("deltarune-hp-font.ttf"), 20);
						add(hptxt);
						hptxt.acceleration.y = 550;
						hptxt.velocity.y += FlxG.random.int(140, 175);
						hptxt.velocity.x += FlxG.random.int(0, 10);
						hptxt.color = FlxColor.GREEN;
						FlxTween.tween(hptxt,{alpha: 0},1,{ease: FlxEase.expoInOut});
						healthdr += 30;
						new FlxTimer().start(0.5, function(tmr:FlxTimer)
							{
								drbombtime();
							},1);
					},1);
			}

		if (songLowercase == 'exptrollgation' && curBeat >= 272 && curBeat < 302)
			{
				if (curBeat % 1 == 0 || curBeat % 2.75 == 0 || curBeat % 3.25 == 0 || curBeat % 4.5 == 0)
					{
						for (_ in 0...1)
							{
								switch(Random.int(1, 10)) {
									case 1:
										scythelight.add(new Scythelight('one'));
									case 2:
										scythelight.add(new Scythelight('two'));
									case 3:
										scythelight.add(new Scythelight('three'));
									case 4:
										scythelight.add(new Scythelight('four'));
									case 5:
										scythelight.add(new Scythelight('five'));
									case 6:
										scythelight.add(new Scythelight('six'));
									case 7:
										scythelight.add(new Scythelight('seven'));
									case 8:
										scythelight.add(new Scythelight('eight'));
									case 9:
										scythelight.add(new Scythelight('nine'));
									case 10:
										scythelight.add(new Scythelight('ten'));
								}
							}
							scythelight.forEach(function(spr:FlxSprite)
								{
									new FlxTimer().start(1, function(timer) {
										spr.kill();
										scythelight.forEachDead(function(spr:FlxSprite)
											{
													spr.revive();
													if (spr.y > 0)
														{
															slight.add(new Light(spr.x, spr.y - 800));
														}
													
													new FlxTimer().start(0.001, function(tmr:FlxTimer)
														{
															spr.y -= 20000;
														},1);
											});
									},1);
								});
					}
			}

		if (songLowercase == 'exptrollgation' && curBeat == 301)
			{
					scythelight.forEach(function(spr:FlxSprite)
						{
							FlxTween.tween(spr,{alpha: 0},0.7,{ease: FlxEase.expoInOut});
							new FlxTimer().start(0.7, function(tmr:FlxTimer)
								{
									spr.kill();
								},1);
						});
					slight.forEach(function(spr:FlxSprite)
						{
							FlxTween.tween(spr,{alpha: 0},0.7,{ease: FlxEase.expoInOut});
							new FlxTimer().start(0.7, function(tmr:FlxTimer)
								{
									spr.kill();
								},1);
						});
					arrowattack.forEach(function(spr:FlxSprite)
						{
							FlxTween.tween(spr,{alpha: 0},0.7,{ease: FlxEase.expoInOut});
							new FlxTimer().start(0.7, function(tmr:FlxTimer)
								{
									spr.kill();
								},1);
						});
				aa = new FlxSprite(0,-900).loadGraphic(Paths.image('bullets/aaa'));
				aa.antialiasing = false;
				aa.screenCenter(X);
				aa.cameras = [camdr];
				aa.angle = -140;
				add(aa);

				FlxTween.tween(aa,{y: 3000},4.5,{ease: FlxEase.expoInOut});
			}

		if (songLowercase == 'exptrollgation' && curBeat == 303)
			{
				w = new FlxSprite().loadGraphic(Paths.image('www'));
				w.antialiasing = false;
				w.scale.set(3,3);
				w.alpha = 0;
				w.cameras = [camdr];
				add(w);

				canarrow = false;
				FlxTween.tween(w,{alpha: 1},1,{ease: FlxEase.expoInOut});
				new FlxTimer().start(0.89, function(tmr:FlxTimer)
					{
						FlxG.camera.flash(FlxColor.WHITE, 3);
						remove(b);
						remove(w);
						remove(aa);
						ball.x = 10000000000;
						ball.y = 10000000000;
					},1);
			}

		switch (curSong)
		{
			case 'explosive':
				ex1Boppers.animation.play('idle');
				ex3Boppers.animation.play('idle');
				ex2Boppers.animation.play('idle');
				ex4Boppers.animation.play('idle');
				ex5Boppers.animation.play('idle');
				ex6Boppers.animation.play('idle');

			case 'cbt':
				cbt1Boppers.animation.play('idle');
				cbt3Boppers.animation.play('idle');
				cbt2Boppers.animation.play('idle');
				cbt4Boppers.animation.play('idle');
				cbt5Boppers.animation.play('idle');
				cbt6Boppers.animation.play('idle');
		}

		if (generatedMusic)
		{
			notes.sort(FlxSort.byY, (PlayStateChangeables.useDownscroll ? FlxSort.ASCENDING : FlxSort.DESCENDING));
		}

		#if cpp
		if (executeModchart && luaModchart != null)
		{
			luaModchart.executeState('beatHit', [curBeat]);
		}
		#end

		if (curSong == 'Tutorial-remix' && dad.curCharacter == 'gf' && currentSection != null)
		{
			if (currentSection.mustHitSection)
				dad.dance();
			else
			{
				if (curBeat == 73 || curBeat % 4 == 0 || curBeat % 4 == 1)
					dad.playAnim('danceLeft', true);
				else
					dad.playAnim('danceRight', true);
			}
		}

		if (currentSection != null)
		{
			// else
			// Conductor.changeBPM(SONG.bpm);

			// Dad doesnt interupt his own notes
			if ((!dad.animation.curAnim.name.startsWith("sing")) && dad.curCharacter != 'gf')
				if ((curBeat % idleBeat == 0 || !idleToBeat) || dad.curCharacter == "spooky")
					dad.dance(idleToBeat, currentSection.CPUAltAnim);
		}
		// FlxG.log.add('change bpm' + SONG.notes[Std.int(curStep / 16)].changeBPM);
		wiggleShit.update(Conductor.crochet);

		if (FlxG.save.data.camzoom && Conductor.bpm < 340)
		{
			// HARDCODING FOR MILF ZOOMS!
			if (curSong.toLowerCase() == 'milf' && curBeat >= 168 && curBeat < 200 && camZooming && FlxG.camera.zoom < 1.35)
			{
				FlxG.camera.zoom += 0.015;
				camHUD.zoom += 0.03;
			}

			if (camZooming && FlxG.camera.zoom < 1.35 && curBeat % 4 == 0)
			{
				FlxG.camera.zoom += 0.015;
				camHUD.zoom += 0.03;
			}
		}
		if (Conductor.bpm < 340)
		{
			iconP1.setGraphicSize(Std.int(iconP1.width + 30));
			iconP2.setGraphicSize(Std.int(iconP2.width + 30));

			iconP1.updateHitbox();
			iconP2.updateHitbox();
		}
		else
		{
	
			iconP1.setGraphicSize(Std.int(iconP1.width + 4));
			iconP2.setGraphicSize(Std.int(iconP2.width + 4));
	
			iconP1.updateHitbox();
			iconP2.updateHitbox();
		}

		if (!endingSong && currentSection != null)
		{
			if (curBeat % gfSpeed == 0)
			{
				gf.dance();
			}

			if (!boyfriend.animation.curAnim.name.startsWith("sing") && (curBeat % idleBeat == 0 || !idleToBeat))
			{
				boyfriend.playAnim('idle' + ((currentSection.playerAltAnim && boyfriend.animation.getByName('idle-alt') != null) ? '-alt' : ''), idleToBeat);
			}

			/*if (!dad.animation.curAnim.name.startsWith("sing"))
			{
				dad.dance();
			}*/

			if (curBeat % 8 == 7 && curSong == 'Bopeebo')
			{
				boyfriend.playAnim('hey', true);
			}

			if (curBeat % 16 == 15 && SONG.song == 'Tutorial-remix' && dad.curCharacter == 'gf' && curBeat > 16 && curBeat < 48)
			{
				boyfriend.playAnim('hey', true);
				dad.playAnim('cheer', true);
			}

			switch (Stage.curStage)
			{
				case 'school':
					if (FlxG.save.data.distractions && Stage.swagBacks['bgGirls'] != null)
					{
						Stage.swagBacks['bgGirls'].dance();
					}

				case 'mall':
					if (FlxG.save.data.distractions)
					{
						for (bg in Stage.animatedBacks)
							bg.animation.play('idle');
					}

				case 'limo':
					if (FlxG.save.data.distractions)
					{
						Stage.swagGroup['grpLimoDancers'].forEach(function(dancer:BackgroundDancer)
						{
							dancer.dance();
						});

						if (FlxG.random.bool(10) && fastCarCanDrive)
							fastCarDrive();
					}

				case "philly":
					if (FlxG.save.data.distractions)
					{
						if (!trainMoving)
							trainCooldown += 1;

						if (curBeat % 4 == 0)
						{
							var phillyCityLights = Stage.swagGroup['phillyCityLights'];
							phillyCityLights.forEach(function(light:FlxSprite)
							{
								light.visible = false;
							});

							curLight = FlxG.random.int(0, phillyCityLights.length - 1);

							phillyCityLights.members[curLight].visible = true;
							// phillyCityLights.members[curLight].alpha = 1;
						}
					}

					if (curBeat % 8 == 4 && FlxG.random.bool(Conductor.bpm > 320 ? 150 : 30) && !trainMoving && trainCooldown > 8)
					{
						if (FlxG.save.data.distractions)
						{
							trainCooldown = FlxG.random.int(-4, 0);
							trainStart();
						}
					}
			}

			if (Stage.halloweenLevel && FlxG.random.bool(Conductor.bpm > 320 ? 100 : 10) && curBeat > lightningStrikeBeat + lightningOffset)
			{
				if (FlxG.save.data.distractions)
				{
					lightningStrikeShit();
				}
			}
		}
	}

	public var cleanedSong:SwagSong;

	function poggers(?cleanTheSong = false)
		{
			var notes = [];

			if (cleanTheSong)
			{
				cleanedSong = SONG;
		
				for(section in cleanedSong.notes)
				{
					
					var removed = [];
		
					for(note in section.sectionNotes)
					{
						// commit suicide
						var old = note[0];
						if (note[0] < section.startTime)
						{
							notes.push(note);
							removed.push(note);
						}
						if (note[0] > section.endTime)
						{
							notes.push(note);
							removed.push(note);
						}
					}
		
					for(i in removed)
					{
						section.sectionNotes.remove(i);
					}
				}
		
				for(section in cleanedSong.notes)
				{
		
					var saveRemove = [];
		
					for(i in notes)
					{
						if (i[0] >= section.startTime && i[0] < section.endTime)
						{
							saveRemove.push(i);
							section.sectionNotes.push(i);
						}
					}
		
					for(i in saveRemove)
						notes.remove(i);
				}
		


				trace("FUCK YOU BITCH FUCKER CUCK SUCK BITCH " + cleanedSong.notes.length);


				SONG = cleanedSong;
			}
			else
			{
		
				for(section in SONG.notes)
				{
					
					var removed = [];
		
					for(note in section.sectionNotes)
					{
						// commit suicide
						var old = note[0];
						if (note[0] < section.startTime)
						{
							notes.push(note);
							removed.push(note);
						}
						if (note[0] > section.endTime)
						{
							notes.push(note);
							removed.push(note);
						}
					}
		
					for(i in removed)
					{
						section.sectionNotes.remove(i);
					}
				}
		
				for(section in SONG.notes)
				{
		
					var saveRemove = [];
		
					for(i in notes)
					{
						if (i[0] >= section.startTime && i[0] < section.endTime)
						{
							saveRemove.push(i);
							section.sectionNotes.push(i);
						}
					}
		
					for(i in saveRemove)
						notes.remove(i);
				}
		


				trace("FUCK YOU BITCH FUCKER CUCK SUCK BITCH " + cleanedSong.notes.length);


				SONG = cleanedSong;
			}
		}

	var curLight:Int = 0;
}

class Spadebomb extends FlxSprite
{

	public function new(x:Float, y:Float)
	{
		super(x, y);

		var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('bullets/Bombs', 'shared');
		frames = tex;
		animation.addByPrefix('boom', 'Bomb Spade',24);
		animation.play('boom');
		scale.set(3,3);
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		y -= Random.float(2, 4);
	}
}


class Spadebullet extends FlxSprite {

	public var gay:String = 'a';

	public function new(x:Float, y:Float,?homosexual:String = "a")
		{
			super(x, y);

			loadGraphic(Paths.image('bullets/spade'));
			scale.set(1.25,1.25);

			gay = homosexual;

			switch (gay)
			{
				case 'a':
					FlxG.sound.play(Paths.sound('bomb'));
			}
		}

  override function update(elapsed:Float)
    {
      super.update(elapsed);

	  switch (gay)
	  {
		  case 'a':
			  x += 4;
			  angle = 0;
		  case 'b':
			  x += 4;
			  y += 4;
			  angle = 45;
		  case 'c':
			  y += 4;
			  angle = 90;
		  case 'd':
			  y += 4;
			  x += -4;
			  angle = 135;
		  case 'e':
			  x += -4;
			  angle = 180;
		  case 'f':
			  x += -4;
			  y += -4;
			  angle = 225;
		  case 'g':
			  y += -4;
			  angle = 270;
		  case 'h':
			  x += 4;
			  y += -4;
			  angle = 315;
	  }
    }
}

class Scythebomb extends FlxSprite
{

	public var gay:String = 'right';

	public function new(x:Float, y:Float,?homosexual:String = "right")
	{
		super(x, y);

		gay = homosexual;

		var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('bullets/bullets2', 'shared');
		frames = tex;
		animation.addByPrefix('boom', 'bullets2 scythe',24);
		animation.play('boom');
		scale.set(3,3);
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		switch (gay)
		{
			case 'right':
				x -= 3;
			case 'left':
				x += 3;
		}
	}
}

class Scythebullet extends FlxSprite {

	private var target:FlxObject; 

	public function new(x:Float, y:Float, target:FlxObject)
		{
			super(x, y);

			loadGraphic(Paths.image('bullets/smallspin'));

			this.target = target;
			FlxG.sound.play(Paths.sound('bomb'));

			FlxVelocity.accelerateTowardsPoint(this, target.getMidpoint(), 900,950);
			
		}

  override function update(elapsed:Float)
    {
      super.update(elapsed);

	  angle += 5;
    }
}

class Arrowattack extends FlxSprite
{

	public var gay:String = 'right';

	var go:Bool = false;

	public function new(x:Float, y:Float,?homosexual:String = "right")
	{
		super(x, y);

		gay = homosexual;

		var type:String = "";

		if (FlxG.random.bool(50))
			{
				type = '1';
			}
		else
			{
				type = '2';
			}

		switch(Random.int(1, 4)) {
			case 1:
				loadGraphic(Paths.image('bullets/arrow/red' + type));
			case 2:
				loadGraphic(Paths.image('bullets/arrow/pink' + type));
			case 3:
				loadGraphic(Paths.image('bullets/arrow/green' + type));
			case 4:
				loadGraphic(Paths.image('bullets/arrow/blue' + type));
		}

		switch (gay)
		{
			case 'right':
				x += 102;
				flipX = false;
			case 'left':
				flipX = true;
				x -= 102;
		}
		new FlxTimer().start(0.6, function(tmr:FlxTimer)
			{
				go = true;
				FlxG.sound.play(Paths.sound('snd_arrow'));
			},1);
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (go)
			{
				switch (gay)
				{
					case 'right':
						x -= 8;
					case 'left':
						x += 8;
				}
			}


	}
}

class Scythelight extends FlxSprite {

	public var gay:String = 'one';

	public function new(?homosexual:String = "one")
		{

			super();

			loadGraphic(Paths.image('bullets/NO'));

			gay = homosexual;

			y = -267;

			switch (gay)
			{
				case 'one':
					x = 0;
				case 'two':
					x = 128;
				case 'three':
					x = 256;
				case 'four':
					x = 384;
				case 'five':
					x = 512;
				case 'six':
					x = 640;
				case 'seven':
					x = 768;
				case 'eight':
					x = 896;
				case 'nine':
					x = 1024;
				case 'ten':
					x = 1152;
			}
		}

  override function update(elapsed:Float)
    {
		angle += 10;
		y += 8;
      super.update(elapsed);
    }
}

class Light extends FlxSprite {

	public function new(x:Float, y:Float)
		{
			super(x, y);

			FlxG.sound.play(Paths.sound('snd_scytheburst'));

			loadGraphic(Paths.image('bullets/www'));

			scale.set(1,10);
			FlxTween.tween(this,{"scale.x": 0.001},0.4,{ease: FlxEase.expoInOut});
			new FlxTimer().start(0.41, function(tmr:FlxTimer)
				{
					x += 20000;
					destroy();
				},1);
		}

  override function update(elapsed:Float)
    {
      super.update(elapsed);
    }
}

/*class Drbomb extends FlxSprite
{

	public var gay:String = 'up';

	public function new(x:Float, y:Float,?homosexual:String = "up")
	{
		super(x, y);

		gay = homosexual;

		loadGraphic(Paths.image('bullets/tntdr'));
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		switch (gay)
		{
			case 'up':
				y -= 8.5;
			case 'down':
				y += 8.5;
		}
	}
}

class Drex extends FlxSprite {

	public function new(x:Float, y:Float)
		{
			super(x, y);

			loadGraphic(Paths.image('bullets/circle'));

			FlxG.sound.play(Paths.sound('bomb'));
			FlxTween.tween(this,{"scale.x": 0},0.4,{ease: FlxEase.expoInOut});
			new FlxTimer().start(0.41, function(tmr:FlxTimer)
				{
					x += 20000;
					destroy();
				},1);
			
		}

  override function update(elapsed:Float)
    {
      super.update(elapsed);
    }
}*/


