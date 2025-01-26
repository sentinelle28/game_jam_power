extends Node


var positive_upgrade:Dictionary = {
"recover health":CurrentHealthUpgrade.new(),
"nothing":UpgradeStrategyPattern.new(),
"bigger bullet":BulletSizeUpgrade.new(),
"your bullet pierce":BulletPierceUpgrade.new()}

var negative_upgrade:Dictionary = {
"lose max health":NegativeMaxHealthUpgrade.new(),
"nothing":UpgradeStrategyPattern.new(),
"go slower":NegativeSpeedUpgrade.new(),
"shoot slower":NegativeShootTimer.new()}

var mega_upgrade:Array[MegaUpgrage] = [MegaDefenseUpgrade.new(),
MegaHealthRecoveryUpgrade.new(),MegaShootingCoolDown.new()]


func get_random_megas()->Array[MegaUpgrage]:
	var temp:Array[int] = []
	for i:int in range(len(mega_upgrade)):
		temp.append(i)
	var to_send:Array[MegaUpgrage] = []
	for i:int in range(3):
		var alea:int = temp.pick_random()
		to_send.append(mega_upgrade[alea].duplicate())
		temp.erase(alea)
	return to_send

func get_random_positive_upgrade()->String:
	return positive_upgrade.keys().pick_random()
	
func get_positive_upgrade(name_of_the_upgrade:String)->UpgradeStrategyPattern:
	return positive_upgrade[name_of_the_upgrade]

func get_random_negative_upgrade()->String:
	return negative_upgrade.keys().pick_random()
	
func get_negative_upgrade(name_of_the_upgrade:String)->UpgradeStrategyPattern:
	return negative_upgrade[name_of_the_upgrade]
