function [xvect,xdif,fx,it_cnt]=bisect(a,b,eps,fun)
  for i = 1:100
    x = (a + b)/2;
    % bisection algorithm
    xvect(i) = x;
    if (abs(feval(fun,x))< eps);
      break;
    else if feval(fun,b)*feval(fun,x) < 0
      xdif(i) = abs(a-x);
      a = x;
    else
      xdif(i) = abs(b-x);
      b = x;
    end
  end
  fx = feval(fun,xvect(i));
  it_cnt = i;
end