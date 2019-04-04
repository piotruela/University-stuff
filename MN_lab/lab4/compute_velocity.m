function [velocity] = compute_velocity(time)
  m0 = 150000;
  q = 2700;
  u = 2000;
  g = 9.81;
  velocity = u*log(m0/(m0-q*time))-g*time - 750;
endfunction
