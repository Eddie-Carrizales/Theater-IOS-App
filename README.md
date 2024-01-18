
# Theater App

Theater is an app similar to Flix that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Completed Features:
- [✅] (5pts) User can tap a cell to see more details about a particular movie.
- [✅] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.
- [✅] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [✅] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [✅] (3pts) User can view the movie poster image for each movie.
- [✅] (1pt) Can run your app on a real device.

## App Walkthrough 1

Here's a walkthrough of implemented user stories:
Link to walkthrough video: http://g.recordit.co/WlRtdTQIqi.gif

<img src='http://g.recordit.co/WlRtdTQIqi.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Notes
Challenges encountered while building the app:
1. A challenge I faced while building the app was getting the right number of posters to display in the collection view. I was getting 5 mini posters instead of 3 big posters. Ultimately, I managed to get 3 posters per row in the collection view by chaning the Estimate sizing from "automatic" to "none" in the size inspector.
2. The only challenge encountered while building the app was an issue with an outlet that was changed. This kept crashing the app after running it in Xcode. However, this was an easy fix as I noticed that it appeard connected yet there was no code for it on the View Controller. Thus, I removed the connection and the app kept running flawlessly. 


