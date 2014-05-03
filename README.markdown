This is an exercise to estimate the values of π using [Monte Carlo Algorithm](http://en.wikipedia.org/wiki/Monte_Carlo_algorithm)

This method tries to find the value of π by estimating if a randomly chosen point lies inside a circle. We choose the radius of the circle to be 1000 units. The co-ordinates of the choosen points would range from (0, 0) to (1000, 1000).

Mathematically it boils down to 

<pre>Area of quarter circle / area of square enclosing the quarter circle
   = number of points inside quarter circle / number of points inside square
</pre>

<pre>⇒ [(3/4) * πr² / r² = k</pre>

<pre>where k = number of points inside quarter circle / number of points inside square (k is found by experiment)</pre>

<pre>⇒ (3/4) π = k</pre>

<pre>⇒ π = k * (4/3)</pre>

Now if we have ```n``` number of points, the value of ```k``` is found by the following logic

The distance of a point from origin is <pre>d = sqrt(x'² + y'²)</pre>

_```x'``` and ```y'``` denote randomly generated numbers_

The point lies inside the circle if <pre>d < r</pre>

So ```k``` turns out to be the count of points for which <pre>d < r</pre>

This algorithm can be used to test the randomness of the random number generator methods / function available in different languages.

Select a sample size and run the simulation for a thousand times. Increase the sample size and observe how the error in π reduces.

The sample size and the [*average*](https://github.com/chiku/Find-pi/blob/master/output/average.markdown), [*best*](https://github.com/chiku/Find-pi/blob/master/output/best.markdown) and [*worst*](https://github.com/chiku/Find-pi/blob/master/output/worst.markdown) errors are tabulated.

