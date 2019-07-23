import numpy as np
import pandas as pd
from sklearn.cluster import FeatureAgglomeration
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline, make_union
from tpot.builtins import StackingEstimator
from xgboost import XGBClassifier

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:0.8621384399987793
exported_pipeline = make_pipeline(
    StackingEstimator(estimator=LogisticRegression(C=0.01, dual=False, penalty="l2")),
    FeatureAgglomeration(affinity="euclidean", linkage="complete"),
    XGBClassifier(learning_rate=0.001, max_depth=8, min_child_weight=13, n_estimators=100, nthread=1, subsample=0.5)
)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
