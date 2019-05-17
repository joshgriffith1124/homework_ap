**Homework**

~~~
Without using any built-in date or time functions, write a function or method that accepts two
mandatory arguments: the first argument is a 12-hour time string with the format "[H]H:MM
{AM|PM}", and the second argument is a (signed) integer. The second argument is the number of
minutes to add to the time of day represented by the first argument. The return value should be a
string of the same format as the first argument. For example, AddMinutes("9:13 AM", 200) would
return "12:33 PM".
~~~

* I'm sure there is a better way to do this but in the spirit of it being an individual assessment, I did not go digging for another persons code.
* The code was tested on Ruby 2.5.1
* You will need to install the rspec gem to run the tests.
* The only limit I added was to not take an input that is > 1440 or < -1440.  Since there is no date data, going further than 24 hours in either direction gives you basically useless data as you have no reference.

**Test output**

~~~
 %  rspec spec/Homework_spec.rb --format documentation

Homework
  Returns time: 11:24 PM

Homework
  Returns time: 11:11 AM

Homework
  Returns time: 12:01 AM

Homework
  Returns time: 12:00 AM

Homework
  Returns time: 9:16 AM

Homework
  Returns time: 1:23 PM

Finished in 0.00334 seconds (files took 0.15792 seconds to load)
6 examples, 0 failures
~~~
