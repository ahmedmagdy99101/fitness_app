# **Fitness Tracker App**

![Project Logo](./assets/images/app_logo.png)

### 🚀 **Overview**

The Fitness Tracker App is a cross-platform mobile application built using Flutter, designed to help
users monitor and improve their physical activity and health. The app provides real-time tracking of
various fitness metrics, including steps taken, calories burned, distance traveled, heart rate, and
more. With an intuitive user interface, the app allows users to set goals, track progress, and view
detailed analytics of their fitness journey.

---

## 📊 **Datasets Used**

We utilized well-known datasets for sentiment analysis to ensure comprehensive model training and
evaluation:

1. **[Sentiment140 Dataset](https://www.kaggle.com/datasets/kazanova/sentiment140)**: 1.6M tweets
   labeled with sentiment.
2. **[Amazon Product Reviews](https://www.kaggle.com/datasets/kritanjalijain/amazon-reviews/data)**:
   Amazon product reviews with sentiment labels.
3.
    *

*[IMDB Movie Reviews](https://www.kaggle.com/datasets/lakshmi25npathi/imdb-dataset-of-50k-movie-reviews)
**: 50k movie reviews labeled as positive or negative.

4. **[Arabic Sentiment Analysis](https://www.kaggle.com/code/rehab8reda/arabic-sentiment-analysis)
   **: Arabic tweets with sentiment categories.
5.
    *

*[Stock Tweets for Sentiment Analysis and Prediction](https://www.kaggle.com/datasets/equinxx/stock-tweets-for-sentiment-analysis-and-prediction)
**:tweets FOR Gans.

---

## 🔧 **Key Features**

### 🧹 **Data Preprocessing**

We ensure the data is well-prepared for modeling through:

- **Text Cleaning**: Removing noise (URLs, stop words, punctuation).
- **Normalization**: Tokenization, stemming, and lemmatization in both English and Arabic.
- **Feature Extraction**: Using **TF-IDF**, **CountVectorizer**, and **GloVe embeddings** to convert
  text into numerical form.

| Preprocessing Workflow 1                      | Preprocessing Workflow 2                       |
|-----------------------------------------------|------------------------------------------------|
| ![Preprocessing1](./images/Preprocessing.png) | ![Preprocessing2](./images/Preprocessing2.png) |

### 🧠 **Modeling**

We experimented with multiple models to achieve the best results:

- **Traditional Models**: Logistic Regression, Random Forest, SVM.
- **Deep Learning Models**:
    - **LSTM (Long Short-Term Memory)**: For handling sequential text data.
    - **DistilBERT**: A lighter, faster version of BERT for better performance in sentiment
      classification.

![Model Architecture](./images/Model.jpg)

### 📈 **Evaluation**

Models were evaluated using:

- **Accuracy**, **Precision**, **Recall**, and **F1-Score**.
- Visualizations like **Confusion Matrix** and **Loss/Accuracy Graphs**.

| Confusion Matrix                                   | Loss/Accuracy                                  |
|----------------------------------------------------|------------------------------------------------|
| ![Confusion Matrix](./images/Confusion_matrix.png) | ![Accuracy Graph](./images/Accuracy_graph.png) |

---

## 👥 **Team Members**

Meet the amazing team behind this project:

<div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
    <div style="margin: 20px; text-align: center;">
        <img src="./images/Farahat.jpg" alt="Ahmed Samy" width="150" height="150"/><br/>
        <strong>Ahmed Samy Farahat</strong><br/>
        [LinkedIn](https://www.linkedin.com/in/ahmed-s-farahat-437b14222)
    </div>
    <div style="margin: 20px; text-align: center;">
        <img src="./images/Wael.jpeg" alt="Mohamed Wael" width="150" height="150"/><br/>
        <strong>Mohamed Wael Khalifa</strong><br/>
        [LinkedIn](https://www.linkedin.com/in/mohamed-wael-82b4342a2)
    </div>
    <div style="margin: 20px; text-align: center;">
        <img src="./images/Awad.jpeg" alt="Ahmed Awad" width="150" height="150"/><br/>
        <strong>Ahmed Awad Ata</strong><br/>
        [LinkedIn](https://www.linkedin.com/in/ahmed-awad-148079286)
    </div>
    <div style="margin: 20px; text-align: center;">
        <img src="./images/Amr.jpeg" alt="Amr Maher" width="150" height="150"/><br/>
        <strong>Amr Maher Abdallah</strong><br/>
        [LinkedIn](https://www.linkedin.com/me?trk=p_mwlite_feed-secondary_nav)
    </div>
    <div style="margin: 20px; text-align: center;">
        <img src="./images/Emad.jpeg" alt="Ahmed Emad" width="150" height="150"/><br/>
        <strong>Ahmed Emad</strong><br/>
        [LinkedIn](https://www.linkedin.com/in/ahmed-emad-702396283/)
    </div>
    <div style="margin: 20px; text-align: center;">
        <img src="./images/Abdelhamid.jpeg" alt="Ahmed Abdelhameed" width="150" height="150"/><br/>
        <strong>Ahmed Abdelhamed Hussein</strong><br/>
        [LinkedIn](https://www.linkedin.com/in/ahmed-abdelhameed-589bb6237)
    </div>
</div>

---

## 🛠 **Technologies Used**

We leveraged a range of technologies and tools to build this project:

- **Python Libraries**: Pandas, Scikit-learn, TensorFlow, Keras, SpaCy, NLTK.
- **Experiment Tracking**: **MLflow** and **DAGsHub** for model tracking and version control.
- **Cloud Services**: **Azure Cloud Services** for model deployment and scalability.

---

## 🏫 **Institution/Training Organization**

![Institution Logo](./images/proAr.png)

This project was developed as part of the **[Initiative Name](https://www.depi.gov.eg/)**.

---

## 🎥 **Demo**

To showcase our project’s capabilities, watch the demo video:

[![Project Demo]](https://www.youtube.com/watch?v=OnAEN1znghY?si=1Q9oygk3oTxJpJ5j)

---

## 💻 **How to Run the Project**

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-repo-link.git
    ```
2. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```
3. **Run the notebooks**:
    - Open the Jupyter notebooks to run data preprocessing, model training, and evaluation steps.

---

## 📈 **Results**

- **Achieved**: 90% accuracy with **DistilBERT** on English datasets.
- **Future Improvements**: Integrate more languages and optimize model inference times using GPU
  acceleration.
