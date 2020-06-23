# PitchPerfect
Udacity nanodegree project 1


# PitchPerfect An iOS voice changer app.
Allows user to record his voice and listen it with different effects.

<img width="300" alt="Screen Shot 2020-06-23 at 5 29 04 PM" src="https://user-images.githubusercontent.com/64661105/85423786-69dc4380-b577-11ea-8c51-8233e0ccaed1.png"> <img width="300" alt="Screen Shot 2020-06-23 at 5 28 53 PM" src="https://user-images.githubusercontent.com/64661105/85424111-ce979e00-b577-11ea-8ee5-20dc488bfea8.png">

# Implementation
The app has two view controller scenes: 
RecordSoundsViewController - consists a record button with a microphone image. Tapping this microphone button starts an audio recording session and present a stop button. When the stop button is clicked, the app completes recording and then show the PlaySound controller. 
PlaySoundsViewController - contains six buttons to play the recorded sound file with different effects and a button to stop the playback. The application uses code from AVFoundation to record sounds from the microphone (AVAudioRecorder) and play recorded audio with effects (AVAudioPlayer, AVAudioEngine). 
# Requirements 
- Xcode 8  
- Swift 3.0
