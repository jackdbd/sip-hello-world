%Module word

class Word {

%TypeHeaderCode
#include "../src/word.hpp"
%End

public:
    Word(const char *);

    char *reverse() const;
};
