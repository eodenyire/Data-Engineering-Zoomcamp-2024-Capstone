import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
from sklearn.svm import SVC
from sklearn.metrics import classification_report


"""

This code expands the previous example to include feature scaling using StandardScaler, a pipeline to encapsulate preprocessing and modeling steps, hyperparameter tuning using GridSearchCV, and four different classifiers: Logistic Regression, Random Forest, Gradient Boosting, and Support Vector Machine. The best model found through grid search is evaluated on the test set using classification metrics.
"""

# Load data from Kafka topic into DataFrame
data = pd.read_kafka('kafka_topic')

# Perform data preprocessing and feature engineering
# (Include your feature engineering steps here)

# Split data into features and target variable
X = data.drop('target_variable', axis=1)
y = data['target_variable']

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create pipeline for preprocessing and modeling
pipeline = Pipeline([
    ('scaler', StandardScaler()),  # Standardize features
    ('clf', None)  # Classifier will be set dynamically
])

# Define hyperparameters for each classifier
parameters = [
    {
        'clf': [LogisticRegression()],
        'clf__penalty': ['l1', 'l2'],
        'clf__C': [0.001, 0.01, 0.1, 1, 10, 100]
    },
    {
        'clf': [RandomForestClassifier()],
        'clf__n_estimators': [50, 100, 200],
        'clf__max_depth': [None, 10, 20],
        'clf__min_samples_split': [2, 5, 10]
    },
    {
        'clf': [GradientBoostingClassifier()],
        'clf__n_estimators': [50, 100, 200],
        'clf__learning_rate': [0.01, 0.1, 1],
        'clf__max_depth': [3, 5, 10]
    },
    {
        'clf': [SVC()],
        'clf__kernel': ['linear', 'rbf'],
        'clf__C': [0.001, 0.01, 0.1, 1, 10, 100]
    }
]

# Perform grid search with cross-validation to find best model
grid_search = GridSearchCV(pipeline, parameters, cv=5, scoring='accuracy', n_jobs=-1)
grid_search.fit(X_train, y_train)

# Evaluate best model on test set
best_model = grid_search.best_estimator_
y_pred = best_model.predict(X_test)
print(classification_report(y_test, y_pred))

