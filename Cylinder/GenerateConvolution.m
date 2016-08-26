%code to calculate the bilinear interpolation of the Qext spec
ParamArr(52,40,3) = 0; %1=peak loc, 2=gamma, 3=ampl.
for i = 1:1:3
for d = 24:1:76
   for h = 80:1:120
       if (d>=50)&&((h/10)>=10)
          %upper right quadrant
          %x1=50,y1=10,x2=63,y2=11
          factor = 1/(13*1);
          ParamArr(d-23,h-79,i) = factor ...
               *(Params(2,2,i)*(63-d)*(11-(h/10)) ...
               + Params(3,2,i)*(d-50)*(11-(h/10)) ...
               + Params(2,3,i)*(63-d)*((h/10)-10) ...
               + Params(3,3,i)*(d-50)*((h/10)-10));
       end
            
       if (d>=50)&&((h/10)<10)
           %lower right quadrant
           %x1=50,y1=10,x2=62,y2=9
           factor = 1/(-13);
           ParamArr(d-23,h-79,i) = factor ...
               *(Params(2,2,i)*(63-d)*(9-(h/10)) ...
               + Params(3,2,i)*(d-50)*(9-(h/10)) ...
               + Params(2,1,i)*(63-d)*((h/10)-10) ...
               + Params(3,1,i)*(d-50)*((h/10)-10));
       end
            
       if (d<50)&&((h/10)>=10)
           %upper left quadrant
           %x1=50,y1=10,x2=37,y2=11
           factor = 1/(-13*1);
           ParamArr(d-23,h-79,i) = factor ...
               *(Params(2,2,i)*(37-d)*(11-(h/10)) ...
               + Params(1,2,i)*(d-50)*(11-(h/10)) ...
               + Params(2,3,i)*(37-d)*((h/10)-10) ...
               + Params(1,3,i)*(d-50)*((h/10)-10));
       end
       
       if (d<50)&&((h/10)<10)
           %lower left quadrant
           %x1=50,y1=10,x2=37,y2=9
           factor = 1/13;
           ParamArr(d-23,h-79,i) = factor ...
               *(Params(2,2,i)*(37-d)*(9-(h/10)) ...
               + Params(1,2,i)*(d-50)*(9-(h/10)) ...
               + Params(2,1,i)*(37-d)*((h/10)-10) ...
               + Params(1,1,i)*(d-50)*((h/10)-10));
         
       end
   end
end
end

%now to calculate the Lorentz peak spectra using this array of params.
Qext_Lorentz(52,40,121) = 0;

for lambda = 1:1:121
    for d = 24:1:76
        for h = 80:1:120
            Qext_Lorentz(d-23,h-79,lambda) = (ParamArr(d-23,h-79,3) ...
                *ParamArr(d-23,h-79,2))/((ParamArr(d-23,h-79,1) ...
                - (lambda*5+300))^2 + (ParamArr(d-23,h-79,2))^2);
        end
    end
end

%Now calculate the probability density function (2D gaussian)
MeanX = 50;
StdevX = 13;
MeanY = 10;
StdevY = 1;
Gauss_2D(52,40) = 0;
sum = 0;
for x = 24:1:76
    for y = 80:1:120
        %create gaussian
        Gauss_2D(x-23,y-79) = exp(-(((x-MeanX)^2)/(2*StdevX^2) ...
            + (((y/10)-MeanY)^2)/(2*StdevY^2)));
        sum = sum + exp(-(((x-MeanX)^2)/(2*StdevX^2) ...
            + (((y/10)-MeanY)^2)/(2*StdevY^2)));
    end
end
Gauss_2D = Gauss_2D./sum;

%now implement the sum calculation:
Qext_conv(121) = 0;
for lambda = 1:1:121
    for x = 24:1:76
        for y = 80:1:120
            %do your thing
            Qext_conv(lambda) = Qext_conv(lambda) ...
                + Gauss_2D(x-23,y-79)*Qext_Lorentz(x-23,y-79,lambda);
        end
    end
end

plot(wave,Qext_conv);