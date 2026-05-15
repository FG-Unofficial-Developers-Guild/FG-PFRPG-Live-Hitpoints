[![Build FG-Usable File](https://github.com/FG-Unofficial-Developers-Guild/FG-PFRPG-Live-Hitpoints/actions/workflows/release.yml/badge.svg)](https://github.com/FG-Unofficial-Developers-Guild/FG-PFRPG-Live-Hitpoints/actions/workflows/release.yml)
[![Run Luacheck on Latest Release](https://github.com/FG-Unofficial-Developers-Guild/FG-PFRPG-Live-Hitpoints/actions/workflows/lua.yml/badge.svg)](https://github.com/FG-Unofficial-Developers-Guild/FG-PFRPG-Live-Hitpoints/actions/workflows/lua.yml)

# Live Hitpoints
This extension automates changes to hitpoints based on an ability score.

# Compatibility and Instructions
This extension has been tested with [FantasyGrounds Unity](https://www.fantasygrounds.com/home/FantasyGroundsUnity.php) v5.1.9 (2026-05-07).

It is designed and written for use with the Pathfinder 1st edition ruleset (PFRPG).

# Features
* Tracks ability effects in the combat tracker to affect maximum hitpoints
* Tracks ability mod to affect hitpoints
* Separates hitpoints into compendent parts: Rolled HP for static/'rolled' HP and favored class bonuses, Ability HP for hitpoints calculated from ability scores, Feat HP for hitpoints provided by supported feats, and Misc HP for tracking of anything else.
* Adds effect tag: "MHP: N" to raise max hitpoints (rather than temporary)
* Negative levels now lower hitpoints by 5 per negative level.
* Automates the Toughness and Improved Toughness feats in Pathfinder and the Toughness feat in 3.5E.
