/*
	DMS_fnc_AILocalityManager
	Created by Defent and eraser1

	https://github.com/Defent/DMS_Exile/wiki/DMS_fnc_AILocalityManager

	Offloads AI groups to a nearby client in order to improve server performance.
*/

{
 if (((count (units _x))>1) && {!(_x getVariable ["DMS_LockLocality",false])} && {!(DMS_ai_offload_Only_DMS_AI && {!(_x getVariable ["DMS_SpawnedGroup",false])})}) then
 {
  private _leader = leader _x;
  private _group = _x;
  if !(isPlayer _leader) then
  {
   if (((side _group) isEqualTo independent) && {(count (units _group)) isEqualTo 1}) exitWith {};
   private _groupOwner = groupOwner _group;
   private _ownerObj = objNull;
   private _isLocal = local _group;
   if !(_isLocal) then   
   {
		{
			if (_groupOwner isEqualTo (owner _x)) exitWith
			{
				_ownerObj = _x;
			};
		} forEach (entities "HeadlessClient_F");   
	};
   if ((isNull _ownerObj) && {!([_group,_leader] call DMS_fnc_SetAILocality)} && {!_isLocal}) then
	{    
		_group setGroupOwner 2;
	};
  };
 };
} forEach allGroups;
