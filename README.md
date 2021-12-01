[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<br />
<p align="center">
  <a href="https://github.com/CognitiveNeuroLab/swat-experiment/">
    <img src="images/logo.jpeg" alt="Logo" width="160" height="160">
  </a> 

<h3 align="center">Swat experiment Cystinosis Kids version</h3>

<h4 align="center"> This is an adaptation of the Swat experiment used in Wylie, Javitt,Foxe (2003) "Task switching: a high-density electrical mapping study". It runs on Presentation® NeuroBehavioral Systems, This task is adapted for the Cystinosis experiment battery (2021)</h4>


**Table of Contents**
  
1. [About the project](#about-the-project)
    - [Built With](#built-with)
    - [Installation](#installation)
3. [Info about the experiment](#info-about-the-experiment)
    - [Stimuli](#stimuli)
    - [Logfiles](#logfiles)
    - [V1 and V2](#v1-and-v2)
    - [Instructions](#instructions)
    - [Trigger codes](#trigger-codes)
    - [Timing](#timing)
    - [Data collection](#data-collection)
    - [Piloting Results](#piloting-results)
3. [License](#license)
3. [Contact](#contact)
3. [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

This project is using the same paradigm with adaptations on a different group of participants. For info on the previous study see [Task switching: a high-density electrical mapping study](https://www.sciencedirect.com/science/article/pii/S1053811903005044).


### Built With

* [Presentation® (NeuroBehavioral Systems)](https://www.neurobs.com/)

## Installation

[Download this Repo](https://github.com/CognitiveNeuroLab/swat-experiment)

The experiment itself is located in the presentation folder.


## Info about the experiment

### Stimuli

The stimuli folder only has a template figure for the eye tracker. All the stimuli are created by presentation. For this paradigm that means a fixation cross with either a letter or a number on the left and right of it. These are all colored Red or Green depending on what trial is happening. There are always 4 stimuli of 1 color in a row.  
  
![Stim example](https://github.com/CognitiveNeuroLab/swat-experiment/blob/main/images/stim.png)    

### Logfiles

Log files with experiment reaction times and other information automatically should be placed in the log file folder. In these log files you will find the behavioral information of each time the experiment is ran. There will also be a file with the behavioral results. This file will contain the data of all the blocks the participant did.

### V1 and V2  

There are 2 versions of the paradigm. This is done so that half of the participant do the paradigm where they click if the text is red and they see a vowel + if the text is green and they see a even number, while the other half clicks if the text is green and they see a vowel + if the text is red and they see a even number. To make sure this is not confused by the experimenter, both are run in separate experiment files and switching between them for the same participant should never happen.

### Instructions

Before running the paradigm we run the "swat_cys_1-practice" or "swat_cys_2-practice". The difference between this and the "normal" experiment is that this only has 20 trials instead of 60 and that it  doesn't save the eye tracker file. Version 1 and Version 2 have different instructions. The instructions are as described in the text above.   


### Trigger codes

The presentation software sends codes to the EEG system so that the responses and the stimuli can be time-locked in the EEG data. The following is an explanation of each trigger code: 
```
port code 201 = start recording
port code 200 = pause recording 
port code 1   = mouse button
port code 251 = Version 1
port code 252 = version 2
```  
The trigger codes related to the stimuli are created based on how presentation creates the stimuli. This means the following: 
Each stimuli (letter/number + letter/number) has a 3 digit code.  
- The first number (1 or 2) represents if the color of the stimulus is in V1 red (1) or green (2) and in V2 red (2) green (1) 
- The second number (1,2,3 or 4) represents how many stimuli of that color have happened (1= first one 2=second one 3=third one 4=last one)
- The third number (1,2,3,4,5,6,7 or 8) represents what is presented.  
  - 1 = Vowel + even + (v1)red(V2)green  
  - 2 = Consonant + odd + (v1)red(V2)green  
  - 3 = Vowel + odd + (v1)red(V2)green  
  - 4 = Consonant + even + (v1)red(V2)green  
  - 5 = Vowel + even + (v1)green(v2)red
  - 6 = Consonant + odd + (v1)green(v2)red
  - 7 = Vowel + odd + (v1)green(v2)red 
  - 8 = Consonant + even + (v1)green(v2)red 
  
For a more detailed list see the excel file in the "Settings and setup" folder.


### Timing
The reason this experiment is coded in presentation, is because of the timing resolution of this software/language. When setup correctly this experiment has potentially 0ms of jitter. This will be measured here at our lab, using an oscilloscope. It is critical that this is re-tested before EEG data is collected. This has not yet happened because we haven't decided on the duration of the trials.

This is how long should all the trials last.
    - stimulus shows for 200ms
    - ISI for 1842ms
  
    
1 trial takes 2042ms. Each block has 60 trials and we run 5 blocks to get enough EEG data.

Using the files in the "timing Testing" folder we tested the timing between the stimulus showing up on the screen and the trigger (using an oscilloscope) We made some adjustments (see the "trigger_event" in the scenario files). **Currently there is 0ms between the onset of any stimulus and when the trigger is send**. Important to note is that if this paradigm is ran anywhere else this might not be the case due to hardware differences and this needs to be checked. 

As you can see below, the onset of the trigger (orange) is at the same time as where the stimuli exceed the average threshold (blue)
![Timing](https://github.com/CognitiveNeuroLab/swat-experiment/blob/main/images/timing_onset.png)

**if you plan to use this paradigm** 
You need to do the same and test if for your setup the timing is also okay. This timing is dictated by the refresh rate of your screen, the quality of your computer and potentially other minor factors. If you want to change the timing you can change  "deltat = ..". Whenever this shows up in the code it will delay the sending of the trigger by x amount of milliseconds. So in our case we noticed the screen being 9ms delayed, so this is why we delay the trigger by the same amount. 

### Data collection
This experiment is used to collected EEG data, eye tracking data and RT data.  


### Piloting Results
Since this paradigm is used before in our lab, we didn't collect Pilot data. We only made sure the timing is still good.

<!-- LICENSE -->
## License

Distributed under the MIT License. See [LICENSE](https://github.com/CognitiveNeuroLab/swat-experiment/blob/master/LICENSE.txt) for more information.



<!-- CONTACT -->
## Contact

Douwe Horsthuis - [@douwejhorsthuis](https://twitter.com/douwejhorsthuis) - douwehorsthuis@gmail.com

Project Link: [https://github.com/CognitiveNeuroLab/swat-experiment/](https://github.com/CognitiveNeuroLab/swat-experiment/)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Ana Francisco](https://github.com/anafrancisco)

[contributors-shield]: https://img.shields.io/github/contributors/CognitiveNeuroLab/swat-experiment.svg?style=for-the-badge
[contributors-url]: https://github.com/CognitiveNeuroLab/swat-experiment/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/CognitiveNeuroLab/swat-experiment.svg?style=for-the-badge
[forks-url]: https://github.com/CognitiveNeuroLab/swat-experiment/network/members
[stars-shield]: https://img.shields.io/github/stars/CognitiveNeuroLab/swat-experiment.svg?style=for-the-badge
[stars-url]: https://github.com/CognitiveNeuroLab/swat-experiment/stargazers
[issues-shield]: https://img.shields.io/github/issues/CognitiveNeuroLab/swat-experiment.svg?style=for-the-badge
[issues-url]: https://github.com/CognitiveNeuroLab/swat-experiment/issues
[license-shield]: https://img.shields.io/github/license/CognitiveNeuroLab/swat-experiment.svg?style=for-the-badge
[license-url]: https://github.com/CognitiveNeuroLab/swat-experiment/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/douwe-horsthuis-725bb9188/

