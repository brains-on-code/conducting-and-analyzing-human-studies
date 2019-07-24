# Materials for Paper "Conducting and Analyzing Human Studies: The Role of Variation and Aggregation"

# Part 1: Literature Survey

In the folder `Part1 Literature Review`, we provide a list with all reviewed studies including our assessment comments and explanations in `literature_review.tsv`. We prepared a summary in the table below.

We like to note that we defined the term `empirical` broadly and thus included many studies that would not hold a strict definition of empirical study.

| Venue | Year | Papers | Empirical | Human | Tasks | Aggregated | Single | Both | Other|
|---|---|---|---|---|---|---|---|---|---|
| ICSE | 2011 | 61 | 61 | 13 | 3 | 1 | 0 | 2 | 0 |
| ICSE | 2012 | 82 | 82 | 24 | 14 | 8 | 3 | 2 | 1 |
| ICSE | 2013 | 106 | 106 | 36 | 9 | 3 | 2 | 3 | 1 |
| ICSE | 2014 | 99 | 96 | 28 | 15 | 6 | 0 | 5 | 4 |
| ICSE | 2015 | 84 | 83 | 19 | 9 | 5 | 1 | 2 | 1 |
| ICSE | 2016 | 101 | 101 | 26 | 8 | 2 | 1 | 4 | 1 |
| ICSE | 2017 | 68 | 68 | 20 | 10 | 6 | 3 | 1 | 0 |
| ICSE | 2018 | 105 | 105 | 29 | 9 | 2 | 4 | 1 | 2 |
| FSE | 2011 | 34 | 34 | 2 | 0 | 0 | 0 | 0 | 0 |
| FSE | 2012 | 34 | 34 | 5 | 2 | 1 | 0 | 0 | 1 |
| FSE | 2013 | 51 | 51 | 2 | 2 | 0 | 2 | 0 | 0 |
| FSE | 2014 | 61 | 60 | 13 | 3 | 0 | 1 | 2 | 0 |
| FSE | 2015 | 74 | 74 | 18 | 7 | 1 | 3 | 3 | 0 |
| FSE | 2016 | 73 | 73 | 11 | 3 | 1 | 0 | 1 | 1 |
| FSE | 2017 | 72 | 72 | 9 | 4 | 2 | 1 | 1 | 0 |
| FSE | 2018 | 61 | 61 | 10 | 2 | 0 | 0 | 2 | 0 |
| EMSE | 2011 | 25 | 25 | 7 | 2 | 1 | 0 | 0 | 1 |
| EMSE | 2012 | 24 | 24 | 5 | 3 | 1 | 0 | 1 | 1 |
| EMSE | 2013 | 31 | 31 | 6 | 3 | 2 | 1 | 0 | 0 |
| EMSE | 2014 | 53 | 53 | 29 | 16 | 14 | 1 | 1 | 0 |
| EMSE | 2015 | 50 | 50 | 20 | 13 | 9 | 0 | 3 | 1 |
| EMSE | 2016 | 64 | 64 | 15 | 7 | 1 | 1 | 4 | 1 |
| EMSE | 2017 | 78 | 78 | 24 | 9 | 3 | 0 | 6 | 0 |
| EMSE | 2018 | 93 | 93 | 26 | 9 | 2 | 0 | 4 | 3 |
| Combined | | 1584 | 1579 | 397 | 165 | 71 | 22 | 51 | 19

# Part 2: Reanalyzed Studies

In the folder `Part2 Reanalyzed Studies`, we provide the scripts and data of each study that we reanalyzed. We also provide a short summary of the study and our results in a PDF in each folder.

Overall, we reanalyzed 12 studies.

| Paper Title                                                  | Paper ID      | Statistical Test?                                            | Correction for Multiple Comparison?  | Appropriate Statistical Tests? | Test for Normality?                                          | Different results?                                           |
| :----------------------------------------------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------ | ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Clone-Based and Interactive Recommendation for Modifying Pasted Code | FSE2015_41    |                                                              | No. Results change for two tasks     | Partly                         | No                                                           | Yes, ambiguous                                               |
| Boa: a language and infrastructure for analyzing ultra-large-scale software repositories | ICSE13_19     | No                                                           | na                                   | na                             | na                                                           | No                                                           |
| An empirical study on the impact of static typing on software maintainability | EMSE14_8      | Yes                                                          | No. Results change for one task      | Yes                            | Yes                                                          | Yes, but not because of the tests, but the interpretation    |
| Does Organizing Security Patterns Focus Architectural Choices? | ICSE12_34     | Yes                                                          | No (but it would not change results) | Yes                            | Yes                                                          | Yes. Ambiguous in their interpretation: i.e., they define a null hypothesis for each task, but in the higher level discussions (intro, discussion,…) they do not make this differentiation, but state the efficiency in general |
| Drag-and-Drop Refactoring: Intuitive and Efficient Program Transformation | ICSE13_38     | Yes                                                          | No (but it would not change results) | Yes                            | Unclear ("we cannot assume that the data (configuration time) is normally distributed") | No                                                           |
|                                                              |               |                                                              |                                      |                                |                                                              |                                                              |
| Do Background Colors Improve Program Comprehension in the \#ifdef Hell? | ESE13_18(4)_2 | Yes                                                          | No. Results change for one task      | Yes                            | Yes                                                          | Yes (task-specific peculiarity)                              |
| Do Security Patterns Really Help Designers?                  | ICSE2015_19   | Yes                                                          | No. Results change for one task      | Yes                            | Yes                                                          | Yes, for one task. Different analysis tools (Python vs. R) led to different results for Task E. |
| Do Developers Read Compiler Error Messages?                  | ICSE2017_47   | Not really (only to compare response times of correct and incorrect solutions; not for correctness or gaze behavior) | na                                   | na                             | na                                                           | No, but more nuanced                                         |
| Feedback-Based Debugging                                     | ICSE2017_30   | Yes                                                          | No (but it would not change results) | Unclear                        | Unclear                                                      | No                                                           |
| FlexJava: Language Support for Safe and Modular Approximate Programming | FSE2015_62    | No (but should have)                                         | na                                   | na                             | na                                                           | No                                                           |
| Explaining Inconsistent Code                                 |               | No                                                           | na                                   | na                             | na                                                           | No                                                           |
| Debugging with Intelligence via Probabilistic Inference      | ICSE2018_52   | Yes                                                          | No                                   | No                             | No                                                           | Yes                                                          |

# Part 3: Levels of Aggregation

In the folder `Part3 Levels of Aggregation`, we share our analyses for the levels of aggregation. We analyzed data from three functional magnetic resonance imaging (fMRI) studies.

## Software Setup

* Python 3.3
* Jupyter notebooks

Each study folder (`esem`, `fse`, `icse`) contains the scripts and generated learning pipelines for the according study. If you just want to run the generated tpot scripts, that is, execute the optimal learning pipeline for each input data set, there is no need to install [tpot](https://github.com/EpistasisLab/tpot).

To this end, you need to adapt each notebook with 'Prediction' in the name. You need to remove the following commands:

```python
from tpot import TPOTClassifier

tpot = TPOTClassifier(generations=5, population_size=20, verbosity=2, n_jobs=20)
tpot.fit(training_features, training_target)
print(tpot.score(testing_features, testing_target))
tpot.export(fileNameTPot + '.py')
```

After that, you can run the ExecuteNotebook in each folder (i.e., ICSE, FSE, ESEM). Since only the prediction is executed, it should not take more than a few hours.

Be sure to have write permission, as several files are created during the generation and prediction.

For generating the learning pipelines, tpot is necessary: http://epistasislab.github.io/tpot/installing/

We also installed [XGBoost](https://xgboost.readthedocs.io/en/latest/) for increased performance. For each input set, tpot automatically finds the optimal learning pipeline, including hyper parameters. You also need to run the ExecuteNotebook in each folder, but without adapting anything. Depending on the performance of the computer, it takes a day until all generation and learning is completed. You can reduce that time by reducing the number of generations and `population_size` (but this may lead to less optimal learning pipelines) or increase `n_jobs` (to the number of CPUs/GPUs that you can use at the same time).

Note that there is also some randomness in the tpot approach, running it again may not lead to the same learning pipelines that we used.

## Outlier Removal and Plots

For each of the three fMRI studies, we show the z-transformed data of the voxels. The x axis shows all scans of each participant (e.g., there are 900 scans for the ICSE study, and 16 participants, so this translates to 900 x 16 = 14 000 values on the x-axis). The y axis shows the activation values of each voxel, after z transformation.

### ICSE '14
![ICSE Outliers](Part3%20Levels%20of%20Aggregation/ICSE_Outliers.png)

### FSE '17
![FSE Outliers](/Part3%20Levels%20of%20Aggregation/FSE_Outliers.png)

### ESEM '18
![ESEM Outliers](/Part3%20Levels%20of%20Aggregation/ESEM_Outliers.png)

## Contact

In the sense of transparent and replicable science, we are doing our best to provide all necessary information on this Web site. Please contact us if you run into any troubles!
