package enemy;


import flixel.group.FlxGroup;
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
	}	
	
	private function initEnemies() :Void
	{
		enemies = new Array();
		
		for (i in 0 ... Reg.maxWave)
		{
			
		}
	}
	
	override public function update() :Void
	{
		super.update();
	}

}