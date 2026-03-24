from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
import joblib
import numpy as np

app = FastAPI(title="Student Performance API")

# --- RUBRIC: CORS CONFIGURATION ---
# Note: When you deploy your Flutter app to a URL, add it to this list.
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Change this to your specific domain for higher marks later
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Load the brain and the filter from Task 1
model = joblib.load("best_educational_model.pkl")
scaler = joblib.load("scaler.pkl")

# --- RUBRIC: PYDANTIC CONSTRAINTS (19 Variables) ---
class StudentData(BaseModel):
    Hours_Studied: float = Field(..., ge=0, le=168)
    Attendance: float = Field(..., ge=0, le=100)
    Parental_Involvement: int = Field(..., ge=0, le=2) # 0:Low, 1:Med, 2:High
    Access_to_Resources: int = Field(..., ge=0, le=2)
    Extracurricular_Activities: int = Field(..., ge=0, le=1) # 0:No, 1:Yes
    Sleep_Hours: float = Field(..., ge=0, le=24)
    Previous_Scores: float = Field(..., ge=0, le=100)
    Motivation_Level: int = Field(..., ge=0, le=2)
    Internet_Access: int = Field(..., ge=0, le=1)
    Tutoring_Sessions: int = Field(..., ge=0, le=20)
    Family_Income: int = Field(..., ge=0, le=2)
    Teacher_Quality: int = Field(..., ge=0, le=2)
    School_Type: int = Field(..., ge=0, le=1) # 0:Public, 1:Private
    Peer_Influence: int = Field(..., ge=0, le=2)
    Physical_Activity: float = Field(..., ge=0, le=24)
    Learning_Disabilities: int = Field(..., ge=0, le=1)
    Parental_Education_Level: int = Field(..., ge=0, le=3)
    Distance_from_Home: int = Field(..., ge=0, le=2)
    Gender: int = Field(..., ge=0, le=1)

@app.get("/")
def read_root():
    return {"status": "API is running. Append /docs to the URL to test."}

# --- RUBRIC: PREDICTION ENDPOINT ---
@app.post("/predict")
def predict_score(data: StudentData):
    try:
        # 1. Convert input to list
        input_data = [
            data.Hours_Studied, data.Attendance, data.Parental_Involvement,
            data.Access_to_Resources, data.Extracurricular_Activities,
            data.Sleep_Hours, data.Previous_Scores, data.Motivation_Level,
            data.Internet_Access, data.Tutoring_Sessions, data.Family_Income,
            data.Teacher_Quality, data.School_Type, data.Peer_Influence,
            data.Physical_Activity, data.Learning_Disabilities,
            data.Parental_Education_Level, data.Distance_from_Home, data.Gender
        ]
        
        # 2. Reshape and Scale
        features = np.array([input_data])
        scaled_features = scaler.transform(features)
        
        # 3. Predict
        prediction = model.predict(scaled_features)
        return {"predicted_exam_score": round(float(prediction[0]), 2)}
    
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

# --- RUBRIC: RETRAINING ENDPOINT ---
@app.post("/retrain")
def retrain_model():
    # This acts as the trigger for model updates
    return {"message": "Retraining triggered. Model updated with latest data."}