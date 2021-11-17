#Declaring parameters
active_buttons = 1; # Number of Buttons Used
button_codes = 1; # Button Code (Tag Number)

#refering the PCL file associated with this scenario file
pcl_file = "swat_kids.pcl";

#Duration of Port Code (Tag Number) in milliseconds
pulse_width = 5;                                  

#Send and Register Codes
write_codes = true;     

#Type of Trials Used
response_matching = simple_matching;
scenario_type = trials;

#writing a log file
no_logfile = false;

#Setting Background Color to White
default_background_color = 25, 25, 25;

#Starting Scenario
begin;           

text { caption = "+"; font_size = 20; font_color = 255,255,255; } my_cross; 

bitmap {filename = "box.bmp"; } my_box;

text { caption = "G"; font_size = 65; font_color = 0,255,0; } g_green;
text { caption = "G"; font_size = 65; font_color = 255,0,0; } g_red;
text { caption = "K"; font_size = 65; font_color = 0,255,0; } k_green;
text { caption = "K"; font_size = 65; font_color = 255,0,0; } k_red;
text { caption = "M"; font_size = 65; font_color = 0,255,0; } m_green;
text { caption = "M"; font_size = 65; font_color = 255,0,0; } m_red;
text { caption = "R"; font_size = 65; font_color = 0,255,0; } r_green;
text { caption = "R"; font_size = 65; font_color = 255,0,0; } r_red;  

text { caption = "A"; font_size = 65; font_color = 0,255,0; } a_green;
text { caption = "A"; font_size = 65; font_color = 255,0,0; } a_red;
text { caption = "E"; font_size = 65; font_color = 0,255,0; } e_green;
text { caption = "E"; font_size = 65; font_color = 255,0,0; } e_red;
text { caption = "I"; font_size = 65; font_color = 0,255,0; } i_green;
text { caption = "I"; font_size = 65; font_color = 255,0,0; } i_red;
text { caption = "U"; font_size = 65; font_color = 0,255,0; } u_green;
text { caption = "U"; font_size = 65; font_color = 255,0,0; } u_red;  


text { caption = "2"; font_size = 65; font_color = 0,255,0; } two_green;
text { caption = "2"; font_size = 65; font_color = 255,0,0; } two_red;
text { caption = "4"; font_size = 65; font_color = 0,255,0; } four_green;
text { caption = "4"; font_size = 65; font_color = 255,0,0; } four_red;
text { caption = "6"; font_size = 65; font_color = 0,255,0; } six_green;
text { caption = "6"; font_size = 65; font_color = 255,0,0; } six_red;
text { caption = "8"; font_size = 65; font_color = 0,255,0; } eight_green;
text { caption = "8"; font_size = 65; font_color = 255,0,0; } eight_red;

text { caption = "3"; font_size = 65; font_color = 0,255,0; } three_green;
text { caption = "3"; font_size = 65; font_color = 255,0,0; } three_red;
text { caption = "5"; font_size = 65; font_color = 0,255,0; } five_green;
text { caption = "5"; font_size = 65; font_color = 255,0,0; } five_red;
text { caption = "7"; font_size = 65; font_color = 0,255,0; } seven_green;
text { caption = "7"; font_size = 65; font_color = 255,0,0; } seven_red;
text { caption = "9"; font_size = 65; font_color = 0,255,0; } nine_green;
text { caption = "9"; font_size = 65; font_color = 255,0,0; } nine_red;


#Creating Picture and Sound Objects That Will be Used for loading the stimuli
picture{ text g_red; x = -100; y = 0; text g_green; x = 100; y = 0;
         text my_cross; x = 0; y = 0; }change;   

picture{ text my_cross; x = 0; y = 0; }default;

#Visual Trial
trial
{   stimulus_event
   {
      picture change; #Picture Object Associated with trial
      time = 0; #After Calling Trial How much time to wait to present stimuli 
      duration = 180;
      code = "picture"; # Code sent to logfile
      port_code = 5;   #Code sent to parallel port      
   } vis_se;        
}vis;               