# Mars Rover technical Challenge

The problem below requires some kind of input. You are free to implement any mechanism for feeding input into your solution (for example, using hard coded data within a unit test). You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

We highly recommend using a unit testing framework such as JUnit or NUnit. Even if you have not used it before, it is simple to learn and incredibly useful.

The code you write should be of production quality, and most importantly, it should be code you are proud of.

## MARS ROVERS

A squad of robotic rovers are to be landed by NASA on a plateau on Mars.

This plateau, which is curiously rectangular, must be navigated by the rovers so that their on board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position is represented by a combination of an x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.

'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

### Input

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

Output:

The output for each rover should be its final co-ordinates and heading.

Test Input:

```CMD
5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM
```

Expected Output:

```CMD
1 3 N

5 1 E
```

## Live Demo

N/A

## Built With

- Ruby
- Rspec

## Getting Started

- You will need to have Zip compress file software installed in your computer. If you don't have it you can download it from [here](https://www.7-zip.org/download.html)
- Do double click on the hatchways-main.zip and choose a folder where to place all the decompressed files.
- Once you are done decompressing, you can open the created folder in a text editor of your choice.
- To run the project, make sure you have ubuntu/MAC OS installed.

Run the commands below in order to have access and use the project on a local machine.

```cmd
git clone https://github.com/elisha2kyakpo1/mars_rover_challenge.git
cd mars_rover_challenge
bundle install
```

## Available Scripts

In the project directory, you can run to run the project:

### `Ruby bin/main.rb`

================

### Run test

```cmd
rspec
```

## Author

👤 **Elisha Kyakopo**

- Linkedin: [Elisha Kyakopo](https://www.linkedin.com/in/elisha-kyakopo/)
- Github: [@elisha2kyakpo1](https://github.com/elisha2kyakpo1)
- Twitter: [@elisha1k](https://twitter.com/Elisha1k)

=======

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

=======

## Show your support

Give a ⭐️ if you like this project!

=======
