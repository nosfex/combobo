package;
import enemy.EnemyFactory;

import enemy.BaseEnemy;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import player.Player;
import player.CheapLaser;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var laserZ:CheapLaser;
	var laserX:CheapLaser;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		var p :Player = new Player(0, FlxG.height * .5);
		add(p);
		var ef : EnemyFactory = new EnemyFactory();
		add(ef);
		
		laserX = new CheapLaser(0, FlxG.height *.5, Reg.xLaserPos, 0, AssetPaths.x_laser__png);
		add(laserX);
		
		laserZ = new CheapLaser(0, FlxG.height *.5, Reg.zLaserPos, 0, AssetPaths.z_laser__png);
		add(laserZ);
	
		Reg.xLimit = FlxG.width * .5;
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		if (Reg.xLaserPos > 0)
		{
			FlxG.log.add("FIRE X LASER");
			laserX.endX = Reg.xLaserPos;
			laserX.alpha = 1;
			Reg.xLaserPos = 0;
			
		}
		
		if (Reg.zLaserPos > 0)
		{
			FlxG.log.add("FIRE Z LASER");
			laserZ.endX = Reg.zLaserPos;
			laserZ.alpha = 1;
			Reg.zLaserPos = 0;
		}
	}	
}