Traffic Volume Prediction and Analysis
1. Project Overview
This project explores machine learning and deep learning techniques for traffic-related data analysis and prediction. It includes supervised machine learning models, unsupervised machine learning techniques, and a deep learning-based artificial neural network (ANN) with explainability and model optimisation methods.

The project aims to investigate predictive performance, identify patterns in traffic data, and explore techniques for improving model interpretability and deployment efficiency.

2. Project Structure
The project contains three main Python scripts:

traffic-project/
│
├── proxy_label_creation.py
├── supervised_ML_models.py
├── unsupervised_ML_models.py
├── deep_learning_ANN_recommendationsystem.py
├── synthetic_traffic.csv       # Generated synthetic data
└── README.md
Script descriptions

proxy_label_creation.py - Create proxy labels for the original dataset for accident risk and congestion category
supervised_ML_models.py — Implements supervised machine learning algorithms to predict traffic-related outcomes. Models can be evaluated using appropriate regression or classification metrics, depending on the prediction task.
unsupervised_ML_models.py — Implements unsupervised machine learning techniques to explore underlying patterns, groupings, or structures in the traffic data without relying on labelled target values. The filename is retained as provided.
deep_learning_ANN_recommendationsystem.py — Implements the deep learning component of the project, including an artificial neural network for traffic volume prediction. This component also explores SHAP-based model explainability, dynamic-range quantisation, and GAN-based synthetic traffic data generation, where implemented in the script.
The dataset and output files listed above are illustrative. Their actual names and locations should match the files in your project directory.

3. Dataset and Data Source
The project uses traffic-related data containing features such as traffic volume, time-related variables, and weather conditions, where available.

The dataset should be classified as one of the following:

Original dataset: An actual traffic dataset obtained from a documented source, containing recorded variables.
Original dataset with proxy: Dataset used for all scripts in this project.


4. Requirements
The project uses Python and may require the following libraries, depending on which scripts and features are executed:

Python 3
NumPy
Pandas
Scikit-learn
Matplotlib
TensorFlow / Keras
SHAP
Install the required packages using:

pip install numpy pandas scikit-learn matplotlib tensorflow shap
If the project uses additional libraries, install them before running the corresponding script.

5. How to Run the Project
Step 1: Obtain the dataset
Download or prepare the dataset from the documented source and place it in the project directory, or update the relevant script with the correct file path.

Check that the dataset contains the columns expected by each script. 

Step 2: Run proxy label creation script
python proxy_label_creation.py
This script creates the proxy labels in the code.

Step 3: Run supervised machine learning
python supervised_ML_models.py
This script runs the supervised learning experiments defined in the file and evaluates model performance using the metrics implemented in the code.

Step 4: Run unsupervised machine learning
python unsupervised_ML_models.py
This script executes the unsupervised learning experiments defined in the file to identify patterns or groupings in the dataset.

Step 5: Run the deep learning ANN
python deep_learning_ANN_recommendationsystem.py
This script runs the ANN, quantisation, GAN and recommendation system. 

6. Methods and Techniques
Supervised Machine Learning
Supervised learning is used to learn relationships between input features and a target variable. Model performance is assessed using the evaluation metrics appropriate to the task.

Unsupervised Machine Learning
Unsupervised learning is used to explore patterns in the dataset without requiring a labelled target for the learning process.

Artificial Neural Network
A feedforward ANN is used for traffic volume regression. The model consists of input features, a hidden layer containing ten neurons with ReLU activation, and a linear output neuron.

SHAP Explainability
SHAP is used to estimate feature contributions to the ANN's predictions. The resulting feature importance analysis helps identify which variables most strongly influence the model output.

Dynamic-Range Quantisation
TensorFlow Lite dynamic-range post-training quantisation reduces the ANN's storage requirements by quantising model weights. In the reported experiment, model size decreased from 35.79 KB to 3.14 KB, a reduction of 91.22%, while predictions remained virtually unchanged.

GAN-Based Synthetic Data Generation
A Generative Adversarial Network can be used to generate synthetic traffic observations resembling the training data. Generated records should be validated against the original dataset before being used for data augmentation.

7. Evaluation
Model evaluation should use an appropriate test dataset that is separate from the training data. For traffic forecasting, chronological splitting is recommended to reduce information leakage from future observations.

For regression models, relevant metrics include:

Mean Absolute Error (MAE)
Root Mean Squared Error (RMSE)
Coefficient of determination (R²)
Unsupervised models should be evaluated using metrics and visualisations appropriate to the method used. Synthetic data should be assessed for distributional similarity, feature relationships, and realistic values.

8. Limitations
The reliability of the results depends on the quality, coverage, and representativeness of the source dataset. Traffic volume observations do not directly establish accident occurrence or accident risk.

SHAP explanations describe model behaviour rather than causal relationships. Quantisation reduces model size but does not necessarily improve predictive accuracy or inference speed. GAN-generated records may fail to preserve temporal dependencies or realistic feature combinations.

The models should therefore be interpreted within the limitations of their data sources, evaluation procedures, and intended applications.

9. Reproducibility
For reproducible experiments:

Record the Python and library versions used.
Set random seeds where applicable.
Document preprocessing and feature selection.
Preserve the original train/test split.
Record model configurations and evaluation metrics.
Clearly distinguish real observations, proxy data, and synthetic records.
10. Conclusion
This project provides a framework for investigating traffic-related prediction and analysis using supervised learning, unsupervised learning, and deep learning. SHAP supports interpretation of ANN predictions, dynamic-range quantisation reduces model storage requirements, and GANs provide an approach to synthetic data generation. The reliability and applicability of the findings depend on transparent data sourcing, suitable evaluation, and clear acknowledgement of methodological limitations.