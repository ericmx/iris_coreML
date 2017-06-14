# iris_coreML
An implementation of the Core ML framework using a linear regression model from sklearn and using the iris dataset. Obviously the iris dataset is not a linear regression, but currently classification is not supported. This model is largely based on the Apple provided Mars example, except implementing the iris dataset. 
I will also post how to actually integrate the model in Xcode (it's really easy) as well as export the model using Juypter Notebook.

You need the following in order to create your own model and integrate it into your app (if you're using SKLearn):

1. Xcode 9 Beta:https://developer.apple.com/download/ (you probably need a developer log in here, but you do not need a PAID developer account)
2. Numpy, Scipy(sklearn), Pandas
3. Python coremltools library: http://pythonhosted.org/coremltools/

## How do I generate my own model?
1. You can generally follow the Python script I have here in the project. Depending on your model you'll have to tweak some things, but the pattern is the same. After you fit your model, convert and save the model using coremltools. I highly recommend adding things like descriptions to your variables (as shown in my Python example), as well as not using any sort of crazy names in your variable names. That may give you trouble.
2. Once you have saved your generated .mlmodel file, open Xcode, and then drag the file into your project folder. Xcode will automatically generate the model in Swift. 
3. Instantiate an instance of the model. In this example, I just did let variableName = Iris() and you're good to go. Now you can excute the class methods.


## Common issues:

WTF: My python stuff is all messed up

Answer: Use Homebrew as your package manager

WTF: My Core ML model can't be found?

Answer: In the beta, for some reason right now the coremltools generated file in Ccode sometimes bugs out and doesn't show up. Clean your project and restart Xcode. You can view the Xcode generated model by clicking on the model, then under Model Class selecting the -> next to Swift Generated Code. You can change the method names, but if you don't you'll need to use those method names to instantiate the generated class. 
