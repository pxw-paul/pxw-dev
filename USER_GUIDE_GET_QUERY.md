# User Guide: Cross-Reference Query Frontend

This guide explains how to use the frontend interface for querying cross-reference data in your codebase.

## Overview

The **Get Query** retrieves information about code references—showing which code items call which other code items, and displays the actual calling code. This is useful for analyzing code dependencies and understanding the flow of your application.

---

## Input Parameters

### 1. **Namespace** ⭐ (Required)
- **What it is:** The InterSystems IRIS namespace where your code resides
- **Example:** `MYAPP`, `USER`, `DEV`
- **Notes:** This field is mandatory—you must specify a namespace to run the query

---

### 2. **Item Type**
- **What it is:** The type of code item you're searching for
- **Examples:** `CLS` (Class), `RTN` (Routine), `GLO` (Global), `MAC` (Macro)
- **Leave blank:** To search across all item types
- **Use when:** You want to focus on a specific type of code

---

### 3. **Item Key 1**
- **What it is:** The name of the class or routine you want to analyze
- **Format options:**
  - **Single value:** `MyClass`
  - **Multiple values:** `Class1,Class2,Class3` (comma-separated, no wildcards)
  - **Wildcard search:** `My%Class` or `*Class` (partial name matching)
- **Notes:** Cannot mix comma-separation and wildcards in the same value
- **Example:** 
  - `MyApp.Utils` → exact match
  - `MyApp.*` → all items starting with "MyApp."
  - `User,Admin,Guest` → specific items

---

### 4. **Item Key 2**
- **What it is:** The method name or function within the item
- **Format options:**
  - **Single value:** `MyMethod`
  - **Multiple values:** `Method1,Method2,Method3` (comma-separated)
  - **Wildcard search:** `Get*` (partial name matching)
  - **All methods:** Use `*` (special case—returns all methods)
- **Leave blank:** To search all methods within items matched by Item Key 1
- **Example:**
  - `OnInit` → exact method name
  - `Get*` → all methods starting with "Get"
  - `*` → all methods (shows cross-references for every method)

---

### 5. **Called By Command**
- **What it is:** Filter results by the type of command that calls the item
- **Examples:** `CALL`, `DO`, `SET`, `XECUTE`, `NEW`
- **Leave blank:** To include all calling commands
- **Use when:** You want to see only specific types of invocations

---

### 6. **Called By Key 1**
- **What it is:** Filter to show only calls from a specific class/routine
- **Format options:**
  - **Single value:** `MyCallingClass`
  - **Multiple values:** `Class1,Class2` (comma-separated)
  - **Wildcard search:** `MyApp.*` (partial name matching)
- **Leave blank:** To include calls from anywhere
- **Use when:** You want to see what calls a method from a specific class

---

### 7. **Called By Key 2**
- **What it is:** Filter to show only calls from a specific method
- **Format options:**
  - **Single value:** `CallingMethod`
  - **Multiple values:** `Method1,Method2` (comma-separated)
  - **Wildcard search:** `Set*`
- **Leave blank:** To include calls from any method
- **Use when:** You want to narrow down which calling methods to show

---

### 8. **Window Size** (Numeric)
- **What it is:** Number of lines of context code to display around each call
- **Range:** `0` (no code context) to any positive integer
- **Typical values:** `5`, `10`, `20`
- **Default:** `0` (no context code shown)
- **Use when:** You want to see the actual code that makes the call
- **Example:** With `Window Size = 5`, you'll see 5 lines before and after the calling line

---

### 9. **Flags**
- **What it is:** Optional modifiers to change query behavior
- **Available flags:**
  - `EXTERNAL` — Show only external calls (calls from different classes)
  - `BY CALLED` — Sort results by the calling item instead of the called item
- **Format:** Enter multiple flags separated by spaces or combined: `EXTERNAL BY CALLED`
- **Leave blank:** For default sorting (by item being called)
- **Examples:**
  - `EXTERNAL` → exclude internal method calls within the same class
  - `BY CALLED` → organize results by who is calling the method
  - `EXTERNAL BY CALLED` → both filters applied

---

### 10. **Code Search**
- **What it is:** Search for specific text within the calling code
- **Format:** Plain text or use `*` as wildcard
- **Examples:** `$$$LOG`, `THROW`, `XECUTE`
- **Requirements:** Works best when `Window Size > 0` (to show the code context)
- **Leave blank:** To skip code content filtering
- **Use when:** You want to find calls containing specific code patterns

---

## Usage Examples

### Example 1: Find all methods in a class
**Goal:** See all methods in `MyApp.DataService` and what calls them
- **Item Type:** `CLS`
- **Item Key 1:** `MyApp.DataService`
- **Item Key 2:** `*`
- **Result:** Table showing every method and every call to that class

### Example 2: Find external callers
**Goal:** See only external calls to `MyApp.Utils.Format()` (calls from other classes)
- **Item Type:** `CLS`
- **Item Key 1:** `MyApp.Utils`
- **Item Key 2:** `Format`
- **Flags:** `EXTERNAL`
- **Result:** Callers from different classes only

### Example 3: Find calls with specific code patterns
**Goal:** Find all `DO` commands that call logging methods
- **Item Type:** `CLS`
- **Item Key 2:** `*Log*` (methods with "Log" in the name)
- **Called By Command:** `DO`
- **Window Size:** `10`
- **Code Search:** `$$$LOG`
- **Result:** Calls using the logging macro, with 10 lines of context

### Example 4: Find what a specific method calls
**Goal:** Find all methods called by `MyApp.Service.OnRequest()`
- **Item Key 1:** `MyApp.Service`
- **Item Key 2:** `OnRequest`
- **Flags:** `BY CALLED`
- **Result:** Everything that `OnRequest` calls, sorted by callee

---

## Understanding the Results

The query returns a table with these columns:

| Column | Meaning |
|--------|---------|
| **ItemType** | Type of code item (CLS, RTN, etc.) |
| **ItemKey1** | Class/Routine name |
| **ItemKey2** | Method name |
| **CalledByCommand** | How it's called (DO, CALL, SET, etc.) |
| **CalledByKey1** | The class/routine that calls it |
| **CalledByKey2** | The method doing the calling |
| **LineNumber** | Line number where the call occurs |
| **CallingCode** | The actual code snippet (if Window Size > 0) |

---

## Tips & Best Practices

1. **Start broad, then narrow down:** Begin with just Item Key 1, then add Item Key 2 and filters
2. **Use wildcards carefully:** `*` can return many results; be specific to improve performance
3. **Use Window Size for investigation:** Set it to `10` or `20` when analyzing code flow
4. **Combine filters:** Use `EXTERNAL` to focus on public APIs and dependencies
5. **Code Search is powerful:** With `Window Size > 0`, search for `THROW` to find error handling
6. **Check "BY CALLED" for caller analysis:** Helps understand dependency direction

---

## Common Queries

| Goal | Configuration |
|------|----------------|
| Find all callers of a method | Item Key 1 + Item Key 2 |
| Find what a method calls | Item Key 1 + Item Key 2 + "BY CALLED" flag |
| Find external calls only | Item Type + Item Key 1/2 + "EXTERNAL" flag |
| Find error handling in calls | Item Key 2 + Code Search: `THROW` + Window Size: 10 |
| Find all entry points | Item Type: CLS + Item Key 2: `*` + Called By Command: `DO` |

---

## Troubleshooting

**No results found?**
- Check namespace spelling
- Verify item names exist in your codebase
- Try removing wildcard characters for exact matches

**Too many results?**
- Add Item Key 2 to narrow down by method
- Use the EXTERNAL flag to exclude internal calls
- Try a more specific Item Key 1 pattern

**Code not showing?**
- Ensure Window Size > 0
- The code window shows context around the calling line

--- 
This was created by AI using the prompt:
can you create a user guide for a front end that calls the Get query? The front end has an input box for each parameter of the Get query.