# DMS_HC_Support
Enabled the dms locality manager to swap AI to a HC.

# Setup a HC:
Part A: Set up Headless Client
1. Edit your server's config using a text editor
 Typically, the config is located in /@ExileServer/config.cfg

2. Add the following lines somehwere in this file.
localClient[]={127.0.0.1};
headlessClients[] = {"127.0.0.1"};

# mission.sqm 

Add a hc slot to your mission.sqm 

Something like this: 
```
		class Item57
	    {
	        dataType="Logic";
	        class PositionInfo
	        {
	        	position[] = {};
	        };
	        name="Headless_Client";
	        isPlayable=1;
	        description="Headless Client";
	        id=159;
	        type="HeadlessClient_F";   // <--  Keep this as is. Or, you have to change the locality manager to search for a different HC name
	        text="HC_HAL";
	        player="PLAY CDG";
	        init="this enableSimulation false; this allowDamage false";
	        side="LOGIC";
	        leader=1;
	        skill=0.60000002;
		};
```
