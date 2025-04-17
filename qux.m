addpath(genpath("/opt/myapp/foobar"));

[x1, x2, x3] = foo();
[x4] = bar(x1);

display(x1);
display(x4);