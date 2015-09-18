package player;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
/**
 * ...
 * @author Gerardo Heidel
 */
class Player extends FlxSpriteGroup
{
	
	
	public function new(X:Float=0, Y:Float=0, MaxSize:Int=0) 
	{
		super(X, Y, MaxSize);
		var s : FlxSprite = new FlxSprite(x, y);
		s.loadGraphic(AssetPaths.x_laser__png);
		add(s);
	}
	
	private function init() : Void
	{
		
	}
	
	override public function update() :Void
	{
		super.update();
		var endX :Float = 0;
		/*if (Reg.xLaserPos > 0)
		{
			FlxG.log.add("FIRE X LASER");
			var laser :CheapLaser = new CheapLaser(x, y, Reg.xLaserPos, 0, AssetPaths.x_laser__png);
			add(laser);
			Reg.xLaserPos = 0;
		}
		
		if (Reg.zLaserPos > 0)
		{
			FlxG.log.add("FIRE X LASER");
			var laser :CheapLaser = new CheapLaser(x, y, Reg.zLaserPos, 0, AssetPaths.z_laser__png);
			add(laser);
			Reg.zLaserPos = 0;
		}*/
	}
	
}