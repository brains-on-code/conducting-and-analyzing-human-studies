import numpy as np
import pandas as pd
from sklearn.ensemble import ExtraTreesClassifier, GradientBoostingClassifier
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline, make_union
from sklearn.svm import LinearSVC
from tpot.builtins import StackingEstimator

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:0.892487684729064
exported_pipeline = make_pipeline(
    StackingEstimator(estimator=LinearSVC(C=0.001, dual=False, loss="squared_hinge", penalty="l2", tol=0.001)),
    StackingEstimator(estimator=ExtraTreesClassifier(bootstrap=False, criterion="gini", max_features=0.5, min_samples_leaf=10, min_samples_split=11, n_estimators=100)),
    GradientBoostingClassifier(learning_rate=0.01, max_depth=8, max_features=0.9500000000000001, min_samples_leaf=3, min_samples_split=15, n_estimators=100, subsample=0.7500000000000001)
)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
