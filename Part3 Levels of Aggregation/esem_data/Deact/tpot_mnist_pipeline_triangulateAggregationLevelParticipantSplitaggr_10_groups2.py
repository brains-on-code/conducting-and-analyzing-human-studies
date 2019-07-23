import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline, make_union
from sklearn.svm import LinearSVC
from sklearn.tree import DecisionTreeClassifier
from tpot.builtins import StackingEstimator

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:0.8666666666666668
exported_pipeline = make_pipeline(
    StackingEstimator(estimator=LinearSVC(C=5.0, dual=False, loss="squared_hinge", penalty="l2", tol=0.1)),
    DecisionTreeClassifier(criterion="gini", max_depth=2, min_samples_leaf=6, min_samples_split=10)
)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
