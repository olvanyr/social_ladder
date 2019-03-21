/// @desc get the current date to make it apear on the slote page
var months = date_get_month(date_current_datetime());
var days = date_get_day(date_current_datetime());
var hours = date_get_hour(date_current_datetime());
var minutes = date_get_minute(date_current_datetime());

switch months
{
	case 1 : months = "janvier";
	break;
	case 2 : months = "fevrier";
	break;
	case 3 : months = "mars";
	break;
	case 4 : months = "avril";
	break;
	case 5 : months = "mais";
	break;
	case 6 : months = "juin";
	break;
	case 7 : months = "juillet";
	break;
	case 8 : months = "aout";
	break;
	case 9 : months = "septembre";
	break;
	case 10 : months = "octobre";
	break;
	case 11 : months = "novembre";
	break;
	case 12 : months = "decembre";
	break;
}
var date = string(days) + " " + string(months) + " " + string(hours) + "h " + string(minutes);
return date;