Code Book for Samsung Tidy 
========================================================

## Names Substrings

freq: frequency 
gyro: gyroscope
acc: accelerometer
mean: mean of the initial measurements
std: standard deviation of the initial measurements.
average: the average of the means groupped by subject and activity type (salking, sitting, etc)
x,y,z: coordinate of the movement initial measurement.
(): calculated, not initial measurement.
time: time meausurement, not spacial.
angle: radians measurement 
gravity: measurement after taking gravity off the equation.
subject: 1 of 30 different people.
grouppartition: train or test group
activity: 1 of 6 types of action (WALKING, SITTING, STANDING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, LAYING)

## Example

Using the substrings, determining the column names would follow:

averagetimebodyaccmean()x: the average groupped by subject and activity of the mean time elapsed measured by the accelerometer calculated for the body for the x coordinate.
