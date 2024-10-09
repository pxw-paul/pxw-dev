ROUTINE PXW.DEV.BNF.Compilers.macros [Type=INC]
/// Write to the given method
#define WRITENOLINE(%method,%code) d %method.Implementation.Write(%code)

#define WRITELINE(%method,%code) d %method.Implementation.WriteLine(%code)

/// Create some tabs
#define Tab(%n) $e($c(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),1,%n)

/// curly bracket in quotes messes up VSCode
#define OpenCurly $c(123)

/// curly bracket in quotes messes up VSCode
#define CloseCurly $c(125)