# Materials for ICSE'19 Paper

## Software Setup

* Python 3.3
* Jupyter notebooks

The easiest way to set everything up is to use Anaconda (we used version 4.1): https://jupyter.readthedocs.io/en/latest/install.html

For generating the learning pipelines, tpot is necessary: http://epistasislab.github.io/tpot/installing/
We also installed XGBoost.

If you just want to run the generated tpot scripts, there is no need to install tpot.

## Execution

Each folder in `/scripts/` contains the scripts and generated learning pipelines for the according study. To generate the learning scrips, make the predictions, and generate the plots with the summary of accuracy, you need to run the ExecuteNotebook in each folder (i.e., ICSE, FSE, ESEM). Depending on the performance of the computer, it takes a day until all generation and learning is completed.

If you just want to execute the learning pipelines, you need to adapt each notebook with 'Prediction' in the name. To this end, you need to remove the following commands:

```
from tpot import TPOTClassifier

tpot = TPOTClassifier(generations=5, population_size=20, verbosity=2, n_jobs=20)
tpot.fit(training_features, training_target)
print(tpot.score(testing_features, testing_target))
tpot.export(fileNameTPot + '.py')"
```

After that only the prediction is executed, which should not take more than a few hours.

Be sure to have write permission, as several files are created during the generation and prediction.

In the sense of transparent and replicable science, we are doing our best to provide all necessary information on this Web site. Please contact us if you run into any troubles!

# Literature Review

A list of all reviewed studies with our assessment comments and explanations is provided in `literature_review.tsv`.

