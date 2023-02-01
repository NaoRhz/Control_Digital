function Gs_s = getSymb_Gs(Gs_tf)
    syms s

    num=cell2mat(Gs_tf.Numerator);
    den=cell2mat(Gs_tf.Denominator);
    
    num_len=length(num);
    den_len=length(den);
    
    num_s=0;
    den_s=0;
    
    for i=1:1:num_len
        num_s=num_s+num(i)*s^(num_len-i);
    end
    
    for i=1:1:den_len
        den_s=den_s+den(i)*s^(den_len-i);
    end

    Gs_s=num_s/den_s;
    Gs_s=vpa(Gs_s, 4);
end