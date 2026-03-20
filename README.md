# Student Performance Analysis: Breaking Educational Barriers

### Mission Statement
This project leverages machine learning to identify key socio-economic and academic factors that impact student success. By analyzing these performance drivers, we aim to develop data-driven tools that bridge educational gaps and provide targeted support for learners in underserved communities.

---

### Repository Structure
This repository is organized into a modular structure to support full-stack educational technology development:

* **`summative/`**: Core project directory.
    * **`linear_regression/`**: Contains the Machine Learning pipeline.
        * `multivariate.ipynb`: Full data analysis, preprocessing, and model training.
        * `best_educational_model.pkl`: The optimized Random Forest model for performance prediction.
        * `scaler.pkl`: The standardization tool used for consistent data input.
    * **`API/`**: Backend services for model deployment (Placeholder).
    * **`FlutterApp/`**: Mobile interface for student/admin interaction (Placeholder).

---

### Technical Overview
The predictive model was developed using a **RICH dataset** of student factors. Key technical milestones include:
* **Data Optimization:** Implemented Ordinal Encoding to preserve the rank of socio-economic factors.
* **Gradient Descent:** Optimized a Linear Regression model via Stochastic Gradient Descent (SGD) to track convergence.
* **Model Selection:** Evaluated Linear Regression, Decision Trees, and Random Forests, saving the model with the **Least Loss**.
* **Clarity:** Integrated advanced visualizations, including Correlation Heatmaps and Fit Scatter Plots, to interpret academic trends.

---

### How to Use
1. Ensure `StudentPerformanceFactors.csv` is in your working directory.
2. Run the `multivariate.ipynb` notebook to see the full training lifecycle.
3. Use the `best_educational_model.pkl` and `scaler.pkl` to make real-time predictions on new student data.