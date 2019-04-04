function [xvect,xdif,fx,it_cnt]=secant(a,b,eps,fun)
  if a == 0
    a = 1e-16;
  end  
  if b == 0
    b = 1e-16;
  end
  xvect(1) = a;
  xvect(2) = b;
for i=3:10000
    xvect(i) = xvect(i-1) - ((feval(fun,xvect(i-1)))*(xvect(i-1)-xvect(i-2)))/...
    (feval(fun,xvect(i-1))-feval(fun,xvect(i-2)));
    xdif(i-2) = abs(xvect(i)-xvect(i-1));
    if abs(feval(fun,xvect(i))) < eps
      break
    end
end
fx = feval(fun,xvect(i));
xvect(1:2) = [];
it_cnt = i-2;
endfunction