# Materials for ICSE'19 Paper

# Literature Survey

We provide a list with all reviewed studies including our assessment comments and explanations in `literature_review.tsv`.

# Reanalysis with Aggregation of Studies from Literature Survey

## Study 1: Does organizing security patterns focus architectural choices?

Paper's Web site: https://distrinet.cs.kuleuven.be/software/securitypatterns/

For reanalysis of both, time and efficiency, we removed outliers according to Figures 2 and 3 of the original paper, and we removed all rows that belonged to Task A, which was the warm up task and was ignored for the analysis.

Time: The according file for reanalysis is available at: https://distrinet.cs.kuleuven.be/software/securitypatterns/effort.csv
(we used the term time, instead of effort, to be consistent within our paper). We computed the sum of the three last columns denoting the completing time (i.e, "STUDY_REQUIREMENT","CREATING_SHORTLIST", and "FINAL_SELECTION"). We used only this sum as a new column from now on. Furthermore, we removed all columns except the column "Group", which denotes whether participants worked with or without structured security patterns. Thus, the input data consisted of just two columns: Group and Sum. Then, we tested for normal distribution and conducted the Wilcoxon test, since data are not normally distributed (these two steps are available in the jupyter notebook `/reanalysis/Reanalysis.ipynb`; for the other steps, we used Excel).

Efficiency: The according data set is available at:
https://distrinet.cs.kuleuven.be/software/securitypatterns/efficiency.csv
For efficiency, we divided column NFINAL by NVIEWED, and we also just have two columns: Group and Values (i.e., the result of NFINAL/NVIEWED). Then, we tested for normal distribution and conducted the Wilcoxon test, since data are not normally distributed (these two steps are available in the jupyter notebook `/reanalysis/Reanalysis.ipynb`).

## Study 2: Do background colors improve program comprehension in the #ifdef hell?

Paper's Web site: http://fosd.net/experiments

There is one excel file with all the relevant data: https://www.infosun.fim.uni-passau.de/se/janet/colors/workingset1.xls

Time: We computed the arithmetic mean for all static and maintenance tasks. The jupyter notebook `/reanalysis/Reanalysis.ipynb` contains the reanalysis of the response times on the aggregated data.

Correctness: We summarized the correctness according to Figure 5 of the [original paper](https://link.springer.com/article/10.1007/s10664-012-9208-x). In the jupyter notebook `/reanalysis/Reanalysis.ipynb`, we provide the results of the according chi^2 test.

## Study 3: Do developers read compiler error messages?

Paper's Web site: http://static.barik.net/barik/gazerbeams/

For reanalysis, we aggregated the gaze data of participants according to Tables 1 (task categories), 2 (correctness), and 3 (gaze behavior) of the original paper. The reanalsis is available in the jupyter notebook `/reanalysis/Reanalysis.ipynb`.

# Levels of Aggregation

## Software Setup

* Python 3.3
* Jupyter notebooks

Each folder contains the scripts and generated learning pipelines for the according study. If you just want to run the generated tpot scripts, that is, execute the optimal learning pipeline for each input data set, there is no need to install tpot.

To this end, you need to adapt each notebook with 'Prediction' in the name. You need to remove the following commands:

```
from tpot import TPOTClassifier

tpot = TPOTClassifier(generations=5, population_size=20, verbosity=2, n_jobs=20)
tpot.fit(training_features, training_target)
print(tpot.score(testing_features, testing_target))
tpot.export(fileNameTPot + '.py')"
```

After that, you can run the ExecuteNotebook in each folder (i.e., ICSE, FSE, ESEM). Since only the prediction is executed, it should not take more than a few hours.

Be sure to have write permission, as several files are created during the generation and prediction.

For generating the learning pipelines, tpot is necessary: http://epistasislab.github.io/tpot/installing/

We also installed XGBoost. For each input set, tpot automatically finds the optimal learning pipeline, including hyper parameters. You also need to run the ExecuteNotebook in each folder, but without adapting anything. Depending on the performance of the computer, it takes a day until all generation and learning is completed. You can reduce that time by reducing the number of generations and population_size (but this may lead to less optimal learing pipelines) or increase n_jobs (to the number of cpus/gpus that you can use at the same time).

Note that there is also some randomness in the tpot approach, running it again may not lead to the same learning pipelines that we used.

## Outlier Removal and Plots

For each of the three fMRI studies, we show the z-transformed data of the voxels. The x axis shows all scans of each participant (e.g., there are 900 scans for the ICSE study, and 16 participants, so this translates to 900 x 16 = 14 000 values on the x-axis). The y axis shows the activation values of each voxel, after z transformation.

### ICSE '14
![ICSE Outliers](ICSE_Outliers.png)

### FSE '17
![FSE Outliers](FSE_Outliers.png)

### ESEM '18
![ESEM Outliers](ESEM_Outliers.png)

In the sense of transparent and replicable science, we are doing our best to provide all necessary information on this Web site. Please contact us if you run into any troubles!
