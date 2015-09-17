package enemy;


import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.input.keyboard.FlxKeyboard;
import flixel.input.keyboard.FlxKey;
/**
 * @author null
 * null
 * null
 */
class EnemyFactory extends FlxGroup
{
	
	@:isVar public var enemies(default, default) : Array<BaseEnemy> = new Array();
	public function new() 
	{
		super();
		initEnemies();
	}	
	
	private function initEnemies() :Void
	{
		enemies = new Array();
		
		for (i in 0 ... Reg.maxWave)
		{
			var e : BaseEnemy = new BaseEnemy(FlxG.width  * 1.2 + i * 128, FlxG.height / 2);
			add(e);
		}
	}
	
	override public function update() :Void
	{
		super.update();
		
		if (FlxG.keys.justReleased.Z) 
		{
			
			enemies[0].checkHit(FlxKey.Z);
		}
		
		
		if (FlxG.keys.justReleased.X) 
		{
			enemies[0].checkHit(FlxKey.X);
		
		} 
		

		if(enemies[0].alive == false)
		{
			enemies.remove(enemies[0]);
		}
	}

}