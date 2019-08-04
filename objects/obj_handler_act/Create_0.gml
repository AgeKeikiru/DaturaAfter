/// @description Insert description here
// You can write your code in this editor
persistent = true;
visible = false;

scr_trace(object_get_name(object_index) + " " + " created");

cdBase = cdAdd;
enBase = enCost;
basePwr = pwr;
baseName = name;
basePrice = price;

if(xAct){
	cdCurr = cdMax;
}

ds_list_add(sa_inflict,
	0,
	0,
	0,
	0,
	0,
	0
);

ds_list_add(sa_chance,
	0,
	0,
	0,
	0,
	0,
	0
);