
function []=myfunc(arg1)

[x1, x2, x3] = foo();
[x4] = bar(x1);

argFloat = str2double(arg1);

display(x1);
display(x4);
display(argFloat);

end