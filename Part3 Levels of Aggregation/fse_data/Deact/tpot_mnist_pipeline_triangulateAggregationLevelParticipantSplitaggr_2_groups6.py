import numpy as np
import pandas as pd
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline, make_union
from sklearn.tree import DecisionTreeClassifier
from tpot.builtins import StackingEstimator

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:1.0
exported_pipeline = make_pipeline(
    StackingEstimator(estimator=GradientBoostingClassifier(learning_rate=0.001, max_depth=1, max_features=0.15000000000000002, min_samples_leaf=19, min_samples_split=6, n_estimators=100, subsample=0.8)),
    DecisionTreeClassifier(criterion="gini", max_depth=2, min_samples_leaf=10, min_samples_split=18)
)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
