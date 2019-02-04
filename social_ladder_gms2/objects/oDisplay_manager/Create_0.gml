/// @description  Display manager

///Properties
ideal_width=0; //Doesn't matter because we are going to calculate this.
ideal_height=768; 

//Aspect ratio
aspect_ratio = display_get_width()/display_get_height();

//Calculate new ideal width or height
ideal_width = round(ideal_height*aspect_ratio); //ideal_height=round(ideal_width/aspect_ratio);


ideal_width = round(ideal_width);
ideal_height = round(ideal_height);

//Check to make sure our ideal width and height isn't an odd number
if(ideal_width & 1)
  ideal_width++;
      
if(ideal_height & 1)
  ideal_height++;

surface_resize(application_surface, ideal_width, ideal_height);
display_set_gui_size(ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);

camera_set_view_size(view_camera[0],ideal_width,ideal_height);


global.ideal_width = ideal_width;
global.ideal_height = ideal_height;



room_goto_next();