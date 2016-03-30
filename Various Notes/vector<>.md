###OF Course
#Use vector<...> not arrays

##On Processing
While using Processing we were storing collections of objects inside arrays like 

``` float myArray [] = new float [10];```

In the above code we are creating a new array called ```myArray ``` that will hold float numbers and it will have a capacity of 10. The data type, in this case ```float``` could be any kind of object (class) and the capacity is limited by your computers RAM memory, which should be a very large number for modern computers.

##On openFrameworks and C++

As discussed before, openFrameworks (OF from now onwards) is written in C++, in which you can use arrays quite much in the same way as in Processing, but the way for handling these is a bit different. You have to worry about memory allocations and leaks and, besides this, you cannot change it's capacity once set.
To avoid these problems C++ has a special kind of container, similar to arrays, called [std::vector.](http://www.cplusplus.com/reference/vector/vector/). This allows us to have collections of objects to which we can add and remove elements during runtime without having to worry about memory and leaks.

The ```std::``` part says that this type belongs to the ```std``` library, which is part of the whole C++ environment.

OF has already declared, internaly, that it is going to use the ```std``` library, so you dont need to write ```std::vector< ... >``` just ```vector< ... >```. 
You can use any of the two forms, the latter is just shorter to write :) .


Imagine a ```vector< float >``` as a list of ```float``` numbers. As any list, its element are orderer in a sequential way. It could be ```float``` or any other type of object. To refer to each element of the list we use its position number or index. The first element has always index 0.

###  vector<...> usage
#### Declaration

To declare a vector in OF you should write, usually in the .h file.

```vector<ofImage> myImages;```

Here, ```ofImage``` is the type of objects that this ~~collection~~ list can have  and its name is ```myImages```. So far it is empty, as we haven't added anything to it.



#### Adding elements

Lets add an ofImage:

```myImages.push_back(ofImage());```

This will add a new empty ofImage as the last element of our collection.

In this case we would like to load something into this new empty ofImage.
Now to load an image into it we do the following.

```myImages.back().load("someImageFile.png");```

Here the ```.back()``` part is refering to the last element of our collection, the new empty ofImage we just added.
The ```.load("someImageFile.png")``` is telling this last element to load into itself an image with name ```someImageFile.png``` that should be in the ```bin/data/``` folder of our project.

#### Accessing elements.

For accessing the elements of the ```vector< >```  use the ```[]``` operator, just like in an array. In between the square brackets put the index of the element to access.

```myImages[0].draw(0,0);```

This will access the first element of the collection, which has index 0, and it will draw it at cordinates 0,0.

To go through all the elements of a ```vector< >``` use a ```for``` loop in the following way. 

```
for(int i = 0; i < myImages.size(); i++){
	cout << myImages[i].getWidth() << endl;
}
```

This will print into the console the width of each image that out collection holds, one per line.

Notice that in the declaration of the for loop it says ```myImages.size()```. The ```.size()``` function of the vector will return the number of elements of the collection. This way we can be sure that we never access an element with an index out of range.

#### Clearing

If you want to erase all the elements of your vector < > you just call

```myImages.clear()```

#### Resize

If you want to resize the vector you can call,

```myImages.resize(10);```

Here we are resizing the collection to have only 10 elements, if it originaly had more elements only the first 10 elements will be left inside of it and the rest will be destroyed/deleted. In case of the opposite, you want to resize to a larger number of elements than what it already has, the necesary objects will be added at the end of the vector. Each new element will be created with the default values for that kind of object. In the case of ofImage it will be an empty image.

In case that you dont want these new elements to be the default you can pass as a second argument telling what you want these to be.
So if we have a collection of ```float``` called ```numbers```:

```vector<float>numbers;```

and we write 

```numbers.resize(10, 0.33);```

the ```numbers``` vector will be resized to have 10 elements and each of the new elements added will have a value of ```0.33```.







#### Others

You can perform several other operations over the vector<>, just check [this link ](http://www.cplusplus.com/reference/vector/vector)for more detailed information.

###Conclusion 


Vector< > objects are much more flexible and secure than arrays in C++, as the vector itself will handle memory managment there is no need for worrying about allocations and leaking memory space. It's capability for adding and deleting elements during runtime gives you a lot of freedom with out you having to define it's size before hand. The vector has been coded for high performance so using it will have no incidence on your code performance.




