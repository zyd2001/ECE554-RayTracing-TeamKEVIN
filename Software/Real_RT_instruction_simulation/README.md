# RT instruction simulation
We wrote C++ version of our camera ray generation, trace (adopted from [Scratch pixels](https://www.scratchapixel.com/index.php?redirect)), and physically based shader. We use it to test if our software can correctly generate the right image.

- Software single will generate image that has only one light source and one material
- Software full will generate image that has multiple rays and materials 

To build, simply type `make full` or `make single`. You can vary the 3D models by changing the file name in `main()`