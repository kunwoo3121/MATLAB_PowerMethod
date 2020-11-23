# MATLAB_PowerMethod

* MATLAB 내장함수인 eig함수를 이용하지 않고 Power Method를 이용하여 EigenValue와 EigenVector을 구한다.

* 1을 입력하면 최대 EigenValue와 그 때의 EigenVector, 2를 입력하면 최소 EigenValue와 그 때의 EigenVector를 출력한다.

* Power Method는 정방행렬이면서 대칭행렬일 때만 사용 가능하므로 행렬 입력이 들어올 때 이 조건이 맞는지 체크한다.

## 소스 코드
```.
function [eig_val, eig_vec] = power_2016115913(A, es, maxit)

    %2016115913_강권우

    [row, col] = size(A);
    
    if(row ~= col || row < 3)
        error('Wrong matrix, Non-square matrix or ');
        exit;
    end
    
    if(issymmetric(A) == false)
        error('Wrong matrix, asymmetric');
        exit;
    end
    
    sel = input('Eigen value : the 1. largest 2. smallest?');
    
    if sel == 2
        A = inv(A);
    end
    
    x = ones(row, 1);
   
    eig_val_tmp = 1;
    
    for i = 1 : maxit
        tmp_matrix = A*x;
        tmp1 = max(tmp_matrix);
        tmp2 = min(tmp_matrix);
        
        if( abs(tmp1) >= abs(tmp2) )
            tmp = tmp1;
        else        
            tmp = tmp2;
        end
        
        tst = abs((tmp - eig_val_tmp) / tmp * 100);
       
        eig_val_tmp = tmp;
        x = tmp_matrix./tmp;
        
         if( tst < es )
            break;
        end
    end
    
    if sel ==  1  
        eig_val = eig_val_tmp;
        eig_vec = x;
    elseif sel == 2
        eig_val = 1/eig_val_tmp;
        eig_vec = x;
    else
        error('Not correct Number');
    end
end
```

## 실행 결과
![3](https://user-images.githubusercontent.com/28796089/100023319-1d4bab80-2e28-11eb-92d7-ebf91e3f4499.JPG)  
![4](https://user-images.githubusercontent.com/28796089/100023324-1e7cd880-2e28-11eb-9ed1-31c1d1e77374.JPG)
```
아래의 eig함수의 결과와 비교해보면 값이 같다는 것을 알 수 있다.
```
![5](https://user-images.githubusercontent.com/28796089/100023325-1fae0580-2e28-11eb-8de4-589a01c1d4e5.JPG)
