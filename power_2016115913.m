function [eig_val, eig_vec] = power_2016115913(A, es, maxit)

    %2016115913_°­±Ç¿ì

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