function Gz_z = getSymb_Gz(Gz_tf)
    syms z

    num=cell2mat(Gz_tf.Numerator);
    den=cell2mat(Gz_tf.Denominator);
    
    num_len=length(num);
    den_len=length(den);
    
    num_z=0;
    den_z=0;
    
    for i=1:1:num_len
        num_z=num_z+num(i)*z^(num_len-i);
    end
    
    for i=1:1:den_len
        den_z=den_z+den(i)*z^(den_len-i);
    end

    Gz_z=num_z/den_z;
    Gz_z=vpa(Gz_z, 4);
end