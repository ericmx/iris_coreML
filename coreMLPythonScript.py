import numpy as np
from sklearn import linear_model
from sklearn import datasets
import coremltools
regr = linear_model.LinearRegression()
iris = datasets.load_iris()
iris_X = iris.data
iris_y = iris.target
np.random.seed(0)
indices = np.random.permutation(len(iris_X))
iris_X_train = iris_X[indices[:-10]]
iris_y_train = iris_y[indices[:-10]]
regr.fit(iris_X_train, iris_y_train)
coreml_model = coremltools.converters.sklearn.convert(regr, ["septallength", "septalwidth", "petallength", "petalwidth"], "classification")
coreml_model.author = 'Eric May'
coreml_model.license = 'BSD'
coreml_model.short_description = 'Predicts classification of Iris flower based on septal and petal attributes'

coreml_model.input_description['septallength'] = 'length of the septal'
coreml_model.input_description['septalwidth'] = 'width of the septal'
coreml_model.input_description['petallength'] = 'length of the petal'
coreml_model.input_description['petalwidth'] = 'width of the petal'
coreml_model.output_description['classification'] = 'classification of the iris'
coreml_model.save('Iris.mlmodel')
