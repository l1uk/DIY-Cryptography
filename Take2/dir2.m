function names = dir2(folder)
%dà solo un'array di stringhe dei nomi di file/cartelle togliendo . e ..

names = {dir(folder).name};
names = convertCharsToStrings(names);
names = names(~strcmp(names,'.') & ~strcmp(names,'..'));

end
