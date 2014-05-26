Code Book for Samsung Tidy 
========================================================

## Names Substrings

freq: frequency  <br/>
gyro: measured with gyroscope <br/>
acc: measured with accelerometer <br/>
mean: mean of the initial measurements<br/>
std: standard deviation of the initial measurements.<br/>
average: the average of the means groupped by subject and activity type (salking, sitting, etc)<br/>
x,y,z: coordinate of the movement initial measurement.<br/>
(): calculated, not initial measurement.<br/>
time: time meausurement, not spacial.<br/>
angle: radians measurement <br/>
gravity: measurement after taking gravity off the equation.<br/>
subject: 1 of 30 different people.<br/>
grouppartition: train or test group<br/>
activity: 1 of 6 types of action (WALKING, SITTING, STANDING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, LAYING)<br/>

## Example

Using the substrings, determining the column names would follow:

averagetimebodyaccmean()x: the average groupped by subject and activity of the mean time elapsed measured by the accelerometer calculated for the body for the x coordinate.
