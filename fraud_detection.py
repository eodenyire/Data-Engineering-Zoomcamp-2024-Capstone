import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report

# Load data from Kafka topic into DataFrame
data = pd.read_kafka('kafka_topic')

# Perform data preprocessing and feature engineering (example: dummy encoding for categorical variables)
data = pd.get_dummies(data, columns=['categorical_column'])

# Split data into features and target variable
X = data.drop('target_variable', axis=1)
y = data['target_variable']

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train logistic regression model
model = LogisticRegression()
model.fit(X_train, y_train)

# Evaluate model
y_pred = model.predict(X_test)
print(classification_report(y_test, y_pred))

