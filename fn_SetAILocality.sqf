	private _AI = param [0,objNull,[objNull,grpNull]];
	if (isNull _AI) exitWith
	{
		diag_log format ["DMS ERROR :: Calling DMS_SetAILocality with null parameter; _this: %1",_this];
	};
	private _AIType = typeName _AI;
	private _pos = if (_AIType isEqualTo "OBJECT") then {_AI} else {param [1,"",[objNull,[]],[2,3]]};
	if (_pos isEqualTo "") exitWith
	{
		diag_log format ["DMS ERROR :: Calling DMS_SetAILocality with invalid position; this: %1",_this];
	};
	private _client = objNull;
	{
		_client = _x;

	} forEach (entities "HeadlessClient_F");
	if (!isNull _client) then
	{
		private _swapped = if (_AIType isEqualTo "OBJECT") then {_AI setOwner (owner _client)} else {_AI setGroupOwner (owner _client)};
		if (!_swapped) then
		{
			ExileServerOwnershipSwapQueue pushBack [_AI,_client];
		};
		true
	}
	else
	{
		false
	};
