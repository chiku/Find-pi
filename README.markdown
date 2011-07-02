This is an exercise to estimate the values of π using [Monte Carlo Algorithm](http://en.wikipedia.org/wiki/Monte_Carlo_algorithm)

This method tries to find the value of π by estimating if a randomly chosen point lies inside a circle. The radius of the circle is 1000 units and the co-ordinates of the choosen points are from (0, 0) to (1000, 1000).

Mathematically it boils down to 

<pre>Area of quarter circle / area of square enclosing the quarter circle
   = number of points inside quarter circle / number of points inside square
</pre>

<pre>or [(3/4) * π (r ^ 2)] / [r ^ 2] = k</pre>

<pre>where k = number of points inside quarter circle / number of points inside square (k is found by experiment)<pre>

<pre>or (3/4) π = k</pre>

<pre>or π = k * (4/3)</pre>

Now if we have n number of points, the value of k is found by the following logic

The distance of a point from origin is <pre>d = sqrt(x* ^ 2 + y* ^2)</pre>
_x* and y* denote randomly generated numbers_
The point lies inside the circle if <pre>d < r</pre>

So k turns out to be the count of points for which <pre>d < r</pre>

This algorithm can be used to test the randomness of the random number generator methods / function available in different languages

Select a sample size of run and the algorithm for a thousand times. Increase the sample size and observe how the error in π reduces.

Currently only the default random number generator in Ruby is presented. More languages to follow.

The sample size and the *average* error are tabulated

| Language  | 1       | 10      | 100     | 1,000   | 10,000  | 100,000 |
| --------- | -------:| -------:| -------:| -------:| -------:| -------:|
| Ruby      | 3.3611% | 0.5345% | 0.1530% | 0.0501% | 0.0024% | 0.0071% |

