package enemy;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKeyboard;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
/**
 * ...
 * @author Gerardo Heidel
 */
class BaseEnemy extends FlxSpriteGroup
{
	
	@:isVar public var comboRequirement(default, default) : Array<Int> = new Array();
	@:isVar public var baseView(default, default) : FlxSprite;
	@:isVar public var keys (default, default) : Array<FlxSprite> = new Array();
	public function new(X:Float=0, Y:Float=0, MaxSize:Int = 0) 
	{
		super(X, Y, MaxSize);
		init();
	}
	
	override public function update() :Void
	{
		super.update();
	
		
		if (FlxG.keys.justReleased.Z) 
		{
			FlxG.log.add("wtf: cOMBOrEQ: " + comboRequirement[0] + " KEYCODE: " + FlxKey.Z + " COMBO LENGTH: " + comboRequirement.length);
			if (comboRequirement[0] == FlxKey.Z)
			{
				 comboRequirement.remove(comboRequirement[0]);
				
				remove(keys[0]);
				keys.remove(keys[0]);
				FlxG.log.add("KILLING BADDIE");
			}
		}
		
		if (FlxG.keys.justReleased.X) 
		{
			FlxG.log.add("wtf: cOMBOrEQ: " + comboRequirement[0] + " KEYCODE: " + FlxKey.Z + " COMBO LENGTH: " + comboRequirement.length);
			
			if (comboRequirement[0] == FlxKey.X)
			{
				comboRequirement.remove(comboRequirement[0]);
				
				remove(keys[0]);
				keys.remove(keys[0]);
				FlxG.log.add("KILLING BADDIE");
			}
		}
		
		health = comboRequirement.length;
		if (health == 0)
		{
			kill();
		}
	}
	
	override public function kill() :Void
	{
		remove(baseView);
	}
	
	
	public function init() :Void
	{
		generateCombination();
			
		for (i in 0 ... comboRequirement.length)
		{
			var key : FlxSprite = new FlxSprite(48 * i, 50, comboRequirement[i] == FlxKey.X ? AssetPaths.x__png : AssetPaths.z__png);
			add(key);
			key.velocity.x = -30;
			keys.push(key);
		}
		
		baseView = new FlxSprite(0, 0, AssetPaths.sBat_strip4__png);
		add(baseView);
		baseView.loadGraphic(AssetPaths.sBat_strip4__png, true, 32, 32);
		baseView.animation.add("idle", [0, 1, 2, 3]);
		baseView.animation.play("idle");
		baseView.scale.set(3, 3);
		health = comboRequirement.length;
		
		velocity.x = -30;
		baseView.velocity.x = -30;
	}
	
	private function generateCombination() :Void
	{
		for (i in 0 ... Reg.level + 2)
		{
			var r : Float = Math.random() * 1;
			if (r < 0.4)
			{
				comboRequirement.push(FlxKey.Z);
			}
			else
			{
				comboRequirement.push(FlxKey.X);
			}
		}
	}
	
}