import time
import numpy as np
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn import svm
from sklearn import cross_validation
from sklearn.metrics import accuracy_score, classification_report, log_loss, make_scorer
from sklearn.grid_search import GridSearchCV
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn import preprocessing
from sklearn.naive_bayes import GaussianNB, MultinomialNB

def main():
    # Get start time
    start = time.clock()
    
    # Read training data from file
    data = np.loadtxt('../data/phy_train_cleaned.dat')
    X = data[:, 2:].astype(float)
    Y = data[:, 1].astype(int)
    
    # Rescale X features, scaler is needed for rescaling test data
    scaler = preprocessing.StandardScaler().fit(X)
    X = scaler.transform(X)
    
    # Split training data into train/test
    Xtrain, Xtest, Ytrain, Ytest = cross_validation.train_test_split(X, Y, test_size=0.2, random_state=0)
    
    # (1) Try a model
    # tryModel(svm.SVC(kernel='linear'), Xtrain, Xtest, Ytrain, Ytest)
    
    # (2) Do parameter selection for a model
    # model = svm.SVC(kernel='poly')
    # parameters = [{'kernel': ['poly'], 'degree': [2, 3]}]
    # scores = ['accuracy', 'roc_auc']
    # selectModel(model, parameters, scores, Xtrain, Xtest, Ytrain, Ytest)
    
    # (3) Do prediction using a model
    # doPrediction(RandomForestClassifier(n_estimators=200), '../results/pred.txt')
    
    # Get end time
    end = time.clock()
    print 'Finished: %d minutes %d seconds' % ((end-start)/60, (end-start)%60) 

# Try a model
def tryModel(model, Xtrain, Xtest, Ytrain, Ytest):
    model = model.fit(Xtrain, Ytrain)
    test_acc = accuracy_score(Ytest, model.predict(Xtest))
    print "Test accuracy = %f" % test_acc
    
# Model selection (grid search)
def selectModel(model, parameters, scores, Xtrain, Xtest, Ytrain, Ytest):
    for score in scores:
        print 'Result for score %s:' % score
        clf = GridSearchCV(model, parameters, cv=5, scoring=score)
        clf.fit(Xtrain, Ytrain)
        print("Best parameters set found on development set:")
        print(clf.best_estimator_)
        print ''
        print("Grid scores on development set:")
        for params, mean_score, scores in clf.grid_scores_:
            print("%0.3f (+/-%0.03f) for %r"
                  % (mean_score, scores.std() / 2, params))
        print ''
    
        print("Detailed classification report:")
        print("The model is trained on the full development set.")
        print("The scores are computed on the full evaluation set.")
        print ''
        Ytest, Ypred = Ytest, clf.predict(Xtest)
        print(classification_report(Ytest, Ypred))
        print '-----------------------------------------------------------------'

# Do prediction using a given model
def doPrediction(model, outfile):
    print "Generating prediction..."
    
    # Read training data
    data = np.loadtxt('../data/phy_train_cleaned.dat')
    X = data[:, 2:].astype(float)
    Y = data[:, 1].astype(int)
    
    # Rescale training data
    scaler = preprocessing.StandardScaler().fit(X)
    X = scaler.transform(X)
    
    # Fit model with training data
    model = model.fit(X, Y)
    
    # Read test data
    data = np.loadtxt('../data/phy_test_cleaned.dat')
    ID = data[:, 0].astype(int)
    X = data[:, 2:].astype(float)
    
    # Use the scaler to rescale test data
    X = scaler.transform(X)
    
    # Get predict values, and write to file
    Y = model.predict(X)
    list = np.array([ID, Y]).T
    fmt = '%d\t%d'
    np.savetxt('../results/'+outfile, list, fmt=fmt)
    print "done!"


main()
    
