#instructions are click when Green=Vowel Click when Red = Even
#Participant only does either only V1 or only V2
#The next participant will do the other version. 

#Declaring parameters
active_buttons = 1; # Number of Buttons Used
button_codes = 1; # Button Code (Tag Number)

#refering the PCL file associated with this scenario file
pcl_file = "swat_cys.pcl";

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

#bitmap {filename = "box.bmp"; } my_box;

#Douwe edit#
#because this is v2 we are flipping what is green and what is red. So I switched all the font colors
#0,255,0=green 255,0,0=Red. 
text { caption = "G"; font_size = 65; font_color = 255,0,0; } g_green;
text { caption = "G"; font_size = 65; font_color = 0,255,0; } g_red;
text { caption = "K"; font_size = 65; font_color = 255,0,0; } k_green;
text { caption = "K"; font_size = 65; font_color = 0,255,0; } k_red;
text { caption = "M"; font_size = 65; font_color = 255,0,0; } m_green;
text { caption = "M"; font_size = 65; font_color = 0,255,0; } m_red;
text { caption = "R"; font_size = 65; font_color = 255,0,0; } r_green;
text { caption = "R"; font_size = 65; font_color = 0,255,0; } r_red;  

text { caption = "A"; font_size = 65; font_color = 255,0,0; } a_green;
text { caption = "A"; font_size = 65; font_color = 0,255,0; } a_red;
text { caption = "E"; font_size = 65; font_color = 255,0,0; } e_green;
text { caption = "E"; font_size = 65; font_color = 0,255,0; } e_red;
text { caption = "I"; font_size = 65; font_color = 255,0,0; } i_green;
text { caption = "I"; font_size = 65; font_color = 0,255,0; } i_red;
text { caption = "U"; font_size = 65; font_color = 255,0,0; } u_green;
text { caption = "U"; font_size = 65; font_color = 0,255,0; } u_red;  


text { caption = "2"; font_size = 65; font_color = 255,0,0; } two_green;
text { caption = "2"; font_size = 65; font_color = 0,255,0; } two_red;
text { caption = "4"; font_size = 65; font_color = 255,0,0; } four_green;
text { caption = "4"; font_size = 65; font_color = 0,255,0; } four_red;
text { caption = "6"; font_size = 65; font_color = 255,0,0; } six_green;
text { caption = "6"; font_size = 65; font_color = 0,255,0; } six_red;
text { caption = "8"; font_size = 65; font_color = 255,0,0; } eight_green;
text { caption = "8"; font_size = 65; font_color = 0,255,0; } eight_red;

text { caption = "3"; font_size = 65; font_color = 255,0,0; } three_green;
text { caption = "3"; font_size = 65; font_color = 0,255,0; } three_red;
text { caption = "5"; font_size = 65; font_color = 255,0,0; } five_green;
text { caption = "5"; font_size = 65; font_color = 0,255,0; } five_red;
text { caption = "7"; font_size = 65; font_color = 255,0,0; } seven_green;
text { caption = "7"; font_size = 65; font_color = 0,255,0; } seven_red;
text { caption = "9"; font_size = 65; font_color = 255,0,0; } nine_green;
text { caption = "9"; font_size = 65; font_color = 0,255,0; } nine_red;
#Douwe edit#

#Creating Picture and Sound Objects That Will be Used for loading the stimuli
picture{ text g_red ; x = -100; y = 0; text g_green; x = 100; y = 0; 
         text my_cross; x = 0; y = 0; }change;   

picture{ text my_cross; x = 0; y = 0; }default;
bitmap { filename = "standard_et.jpg"; preload = true; } et_bit;# for the eyetracker

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1;   # left-Ctrl
   picture {
		text {caption ="Please double click to start"; font_size = 30;};
      x=0;y=0;};
}start_trial;

trial{ # the first stim is too quick if there is no delay. This trial puts 2sec between the start and the stim
	trial_duration = 8000; 
	stimulus_event {
	picture {
		text {caption ="If the text is green, click for vowels \n \n If the text is red, click for even numbers"; font_size = 30;};
      x=0;y=0;};
		duration = 6000; #so that there is a fixation cross 2 seconds before the first trial and people can focus
	}pic_event;
	stimulus_event {
		picture default;
		time=6100;		
		duration = 100; #so that there is a fixation cross 2 seconds before the first trial and people can focus
		code = "201 start recording";  
		port_code = 201; 
	}code_event;
}wait_trial;


#douwe edit
trial{ # This is to indentify what participants are responding to
	trial_duration = 250; #2 sec before the first stim
	stimulus_event {
	picture default;
	time=100;
		code = "Green=Vowel Red = Even";  
	port_code = 252; 
	}type_event;
}type_trial;
#douwe edit

#Douwe edit#
#Visual Trial
trial
{   stimulus_event
   {
      picture change; #Picture Object Associated with trial
      time = 0; #After Calling Trial How much time to wait to present stimuli 
      #duration is 200ms on the occiloscpe (190+10ms after trigger) 
   } vis_se;
	stimulus_event
	{ 
		nothing{};
		deltat=9;
		code = "picture";  #Code sent to logfile
      port_code = 255;   #Code sent to parallel port
	}trigger_event;
	stimulus_event
	{ 
		picture default;
		deltat = 176; 
		duration = 1796; #is 1.841s on the ossiloscope
		code = "isi";
		#port_code = 255; #if this is on we can measure the length of stim duration and the length of ISI
	} isi_event;
}vis; 
#Douwe edit#
#Douwe edit#
trial {
trial_duration = 200;
	stimulus_event {
		picture {
		text {font_size = 25; caption ="Block finished, saving eye tracking data, please wait a moment";};
      x=0;y=0;};
		code = "end";  
		port_code = 200;  
		time = 0;
   } event_end;  
} end_trial;  
#Douwe edit#          