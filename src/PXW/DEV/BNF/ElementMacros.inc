ROUTINE PXW.DEV.BNF.ElementMacros [Type=INC]
#; 
/// Get number of parts on the element.
#define ElementPartsCount(%e) $GET(%PXWparts(+%e))
#define ElementPartsCountInternal(%e) $GET(%PXWparts(+%e))

/// Check if there are any parts
#define ElementPartsExist(%e) $Data(%PXWparts(+%e))
#define ElementPartsExistInternal(%e) $Data(%PXWparts(+%e))


/// Get a specific part of an element
#define ElementPartsGetAt(%e,%n) $GET(%PXWparts(+%e,%n))
#define ElementPartsGetAtInternal(%e,%n) $GET(%PXWparts(+%e,%n))

/// 
#define ElementIsObject(%e) %e

/// Get the next element
#define ElementPartsNext(%e,%n,%d) $ORDER(%PXWparts(+%e,%n),1,%d)
#define ElementPartsNextInternal(%e,%n,%d) $ORDER(%PXWparts(+%e,%n),1,%d)

///
#define ELEMENTPARTADD(%e,%p) Set %PXWparts(+%e,$INCREMENT(%PXWparts(+%e)))=%p
#define ELEMENTPARTADDInternal(%e,%p) Set %PXWparts(+%e,$INCREMENT(%PXWparts(+%e)))=%p