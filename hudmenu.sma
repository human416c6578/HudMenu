#include <amxmodx>
#include <nvault>
#include <string>

#include <speedometer>
#include <timer>
#include <strafe_stats>
#include <timer_medals>


new g_iVault;

public plugin_init()
{
    register_clcmd("say /hud", "hud_menu");
}

public plugin_natives()
{
	register_library("hud");

	register_native("open_hud_menu", "native_open_hud_menu");

	g_iVault = nvault_open("hud_settings");
}

public native_open_hud_menu(id, NumParams){
	new id = get_param(1);
	hud_menu(id);
}

public plugin_end()
{
	nvault_close(g_iVault);
}

public client_putinserver(id)
{
	set_task(1.0, "LoadSettings", id);
}

public hud_menu(id)
{
	new menu = menu_create( "\yHud Menu!:", "hud_menu_handler" );
	new item[64];

	format(item, charsmax(item), "\wSpeed %s", get_bool_speed(id)?"\y[ON]":"\r[OFF]");
	menu_additem( menu, item);
	format(item, charsmax(item), "\wFps %s", get_bool_fps(id)?"\y[ON]":"\r[OFF]");
	menu_additem( menu, item);
	format(item, charsmax(item), "\wKeys %s", get_bool_keys(id)?"\y[ON]":"\r[OFF]");
	menu_additem( menu, item);
	format(item, charsmax(item), "\wTimer %s", get_bool_timer(id)?"\y[ON]":"\r[OFF]");
	menu_additem( menu, item);
	format(item, charsmax(item), "\wMedals %s", get_bool_medals(id)?"\y[ON]":"\r[OFF]");
	menu_additem( menu, item);
	format(item, charsmax(item), "\wStats %s", get_bool_stats(id)?"\y[ON]":"\r[OFF]");
	menu_additem( menu, item);

	//Set a property on the menu
	menu_setprop( menu, MPROP_EXIT, MEXIT_ALL );

	//Lets display the menu
	menu_display( id, menu, 0 );
}

public hud_menu_handler(id, menu, item)
{
	switch( item )
	{
		case 0:
		{
			toggle_speed(id);
		}
		case 1:
		{
			toggle_fps(id);
		}
		case 2:
		{
			toggle_keys(id);
		}
		case 3:
		{
			toggle_timer(id);
		}
		case 4:
		{
			toggle_medals(id);
		}
		case 5:
		{
			toggle_stats(id);
		}
		case MENU_EXIT:
		{
		   	menu_destroy( menu );
			return PLUGIN_HANDLED;
		}
	}
	SaveSettings(id);

	menu_destroy( menu );
	hud_menu(id);
	return PLUGIN_HANDLED;
}

public SaveSettings(id)
{
	new key[32], value[32];
	get_user_name(id, key, charsmax(key));
	format(value, charsmax(value), "%d#%d#%d#%d#%d#%d", get_bool_speed(id), get_bool_fps(id), get_bool_keys(id), get_bool_timer(id), get_bool_medals(id), get_bool_stats(id));
	nvault_set(g_iVault, key, value);
}

public LoadSettings(id)
{
	new key[32], value[32], timestamp;
	get_user_name(id, key, charsmax(key));

	if(!nvault_lookup(g_iVault, key, value, charsmax(value), timestamp)) return;

	new values[6][2];
	explode_string(value, "#", values, charsmax(values), 1);

	if(!str_to_num(values[0]))
		toggle_speed(id);
	if(!str_to_num(values[1]))
		toggle_fps(id);
	if(str_to_num(values[2]))
		toggle_keys(id);
	if(!str_to_num(values[3]))
		toggle_timer(id);
	if(!str_to_num(values[4]))
		toggle_medals(id);
	if(str_to_num(values[5]))
		toggle_stats(id);
}