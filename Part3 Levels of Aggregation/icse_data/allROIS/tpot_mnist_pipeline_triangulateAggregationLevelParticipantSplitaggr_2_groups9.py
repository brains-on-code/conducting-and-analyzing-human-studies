import numpy as np
import pandas as pd
from sklearn.cluster import FeatureAgglomeration
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import BernoulliNB
from sklearn.pipeline import make_pipeline, make_union
from sklearn.tree import DecisionTreeClassifier
from tpot.builtins import StackingEstimator

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:0.9466666666666667
exported_pipeline = make_pipeline(
    StackingEstimator(estimator=BernoulliNB(alpha=0.01, fit_prior=True)),
    FeatureAgglomeration(affinity="euclidean", linkage="average"),
    DecisionTreeClassifier(criterion="gini", max_depth=5, min_samples_leaf=15, min_samples_split=16)
)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
