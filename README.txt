
# Theater App

Theater is an app similar to Flix that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).
---

## Theater Part 2

### User Stories

#### REQUIRED (10pts)
- [✅] (5pts) User can tap a cell to see more details about a particular movie.
- [✅] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/WlRtdTQIqi.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


### Notes
Describe any challenges encountered while building the app.
A challenge I faced while building the app was getting the right number of posters to display in the collection view. I was getting 5 mini posters instead of 3 big posters. Ultimately, I managed to get 3 posters per row in the collection view by chaning the Estimate sizing from "automatic" to "none" in the size inspector.

---

## Theater Part 1

### User Stories

#### REQUIRED (10pts)
- [✅] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [✅] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [✅] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [✅] (1pt) Run your app on a real device.

### Notes
Describe any challenges encountered while building the app.
The only challenge encountered while building the app was an issue with an outlet that was changed. This kept crashing the app after running it in Xcode. However, this was an easy fix as I noticed that it appeard connected yet there was no code for it on the View Controller. Thus, I removed the connection and the app kept running flawlessly. 


