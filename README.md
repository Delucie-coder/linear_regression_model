# Student Performance Analysis: Breaking Educational Barriers
[TASK 1] Data Science & Model Training

### Mission Statement
My mission is to leverage data science to provide actionable insights into student academic success. By identifying key features that impact performance, this project aims to support proactive educational interventions.

---

### Repository Structure
This repository is organized into a modular structure to support full-stack educational technology development:

* **`summative/`**: Core project directory.
    * **`linear_regression/`**: Contains the Machine Learning pipeline.
        * `multivariate.ipynb`: Full data analysis, preprocessing, and model training.

---

### Technical Overview
The predictive model was developed using a **RICH dataset** of student factors. Key technical milestones include:
* **Volume & Variety:** The dataset contains 10,000 student records across 19 diverse features, including academic, environmental, and socio-economic variables.
* **Data Source:** https://www.kaggle.com/datasets/lainguyn123/student-performance-factors
* **Data Optimization:** Implemented Ordinal Encoding to preserve the rank of socio-economic factors.
* **Gradient Descent:** Optimized a Linear Regression model via Stochastic Gradient Descent (SGD) to track convergence.
* **Model Selection:** Evaluated Linear Regression, Decision Trees, and Random Forests, saving the model with the **Least Loss**.
* **Visualisations:** Integrated advanced visualizations, including Correlation Heatmaps and Fit Scatter Plots, to interpret academic trends.

---

### How to Use
1. Ensure `StudentPerformanceFactors.csv` is in your working directory.
2. Run the `multivariate.ipynb` notebook to see the full training lifecycle.
3. Use the `best_educational_model.pkl` and `scaler.pkl` to make real-time predictions on new student data.

---

## [TASK 2 & 3] API & Deployment

*This section details the FastAPI implementation and cloud hosting.*



- **Backend:** FastAPI

- **Host:** Hugging Face Spaces

- **Features:** Includes Pydantic data validation and CORS middleware.

- **Retraining:** A `/retrain` endpoint is implemented to allow for model updates as new data is collected.

- **Swagger Documentation:** https://delucie-tudent-performance-api.hf.space/docs



---



## [TASK 4] Mobile Application

*This section details the Flutter frontend implementation.*



- **Framework:** Flutter (Dart)

- **Features:** Real-time API consumption, dynamic input validation, and responsive UI for student score prediction.

---

##  How to Run the Mobile App
To run the Flutter application locally:
1. Ensure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
2. Clone this repository: `git clone [https://github.com/Delucie-coder/linear_regression_model.git]`
3. Navigate to the project folder: `cd summative/FlutterApp`
4. Fetch dependencies: `flutter pub get`
5. Run the app: 
   - For Web: `flutter run -d chrome`
   - For Mobile: Ensure an emulator is running and use `flutter run`