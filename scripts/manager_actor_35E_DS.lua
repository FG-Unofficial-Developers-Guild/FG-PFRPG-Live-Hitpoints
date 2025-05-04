--
-- Please see the LICENSE.md file included with this distribution for attribution and copyright information.
--
-- luacheck: ignore
-- bmos' list of changes to simplify maintenance:
-- Changed EffectManager35E.getEffectsBonus to EffectManager35EDS.getEffectsBonus

-- stylua: ignore
function getAbilityEffectsBonus(rActor, sAbility)
	if not rActor or not sAbility then
		return 0, 0;
	end

	local sAbilityEffect = DataCommon.ability_ltos[sAbility];
	if not sAbilityEffect then
		return 0, 0;
	end

	local nEffectMod, nAbilityEffects = EffectManager35EDS.getEffectsBonus(rActor, sAbilityEffect, true);

	if sAbility == "dexterity" then
		if EffectManager35E.hasEffectCondition(rActor, "Entangled") then
			nEffectMod = nEffectMod - 4;
			nAbilityEffects = nAbilityEffects + 1;
		end
		if DataCommon.isPFRPG() and EffectManager35E.hasEffectCondition(rActor, "Grappled") then
			nEffectMod = nEffectMod - 4;
			nAbilityEffects = nAbilityEffects + 1;
		end
	end
	if sAbility == "dexterity" or sAbility == "strength" then
		if EffectManager35E.hasEffectCondition(rActor, "Exhausted") then
			nEffectMod = nEffectMod - 6;
			nAbilityEffects = nAbilityEffects + 1;
		elseif EffectManager35E.hasEffectCondition(rActor, "Fatigued") then
			nEffectMod = nEffectMod - 2;
			nAbilityEffects = nAbilityEffects + 1;
		end
	end

	local nEffectBonusMod = 0;
	if nEffectMod > 0 then
		nEffectBonusMod = math.floor(nEffectMod / 2);
	else
		nEffectBonusMod = math.ceil(nEffectMod / 2);
	end

	local nAbilityMod = 0;
	local nAbilityScore = ActorManager35E.getAbilityScore(rActor, sAbility);
	if nAbilityScore > 0 and not DataCommon.isPFRPG() then
		local nAbilityDamage = ActorManager35E.getAbilityDamage(rActor, sAbility);

		local nCurrentBonus = math.floor((nAbilityScore - nAbilityDamage - 10) / 2);
		local nAffectedBonus = math.floor((nAbilityScore - nAbilityDamage + nEffectMod - 10) / 2);

		nAbilityMod = nAffectedBonus - nCurrentBonus;
	else
		nAbilityMod = nEffectBonusMod;
	end

	return nAbilityMod, nAbilityEffects;
end