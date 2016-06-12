nFolds = 5;
%num_tests = 1; % Do 100 tests
%tests = zeros(num_tests, 1);
%for t=1:num_tests,
    %mcycle = load('data/mcycle80.txt'); y=mcycle(:,end); X=mcycle(:,1:end-1);
    %[X y] = shuffleData(X,y); % shuffle data randomly to avoid pathologica
    %[Xtr Xte Ytr Yte] = splitData(X,y, .75); % split data into 75/25 train/test
    min_error = -1;
    best_k = 1;
    for k=1:64,
      total_error = 0;
      for iFold = 1:nFolds,
        [Xti,Xvi,Yti,Yvi] = crossValidate(X,y,nFolds,iFold);
        learner = knnRegress(Xti, Yti, k);
        total_error = total_error + mse(learner, Xvi, Yvi);
      end;
      total_error = total_error / nFolds;
      if total_error < min_error || min_error < 0
          min_error = total_error;
          best_k = k;
      end;
    end;
    %tests(t) = best_k;
    best_k
%end;
%mode(tests) % Get the majority of the test results