import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC

# NOTE: Make sure that the class is labeled 'target' in the data file
tpot_data = pd.read_csv('PATH/TO/DATA/FILE', sep='COLUMN_SEPARATOR', dtype=np.float64)
features = tpot_data.drop('target', axis=1).values
training_features, testing_features, training_target, testing_target = \
            train_test_split(features, tpot_data['target'].values, random_state=42)

# Score on the training set was:0.7682539682539682
exported_pipeline = LinearSVC(C=20.0, dual=False, loss="squared_hinge", penalty="l1", tol=0.0001)

exported_pipeline.fit(training_features, training_target)
results = exported_pipeline.predict(testing_features)
