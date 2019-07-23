import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import PolynomialFeatures
from sklearn.tree import DecisionTreeClassifier
from tpot.builtins import OneHotEncoder

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:0.8726190476190476
exported_pipeline = make_pipeline(
    OneHotEncoder(minimum_fraction=0.2, sparse=False),
    PolynomialFeatures(degree=2, include_bias=False, interaction_only=False),
    OneHotEncoder(minimum_fraction=0.25, sparse=False),
    DecisionTreeClassifier(criterion="gini", max_depth=3, min_samples_leaf=20, min_samples_split=17)
)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
