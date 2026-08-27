---
name: objectscript-xref-usage
description: 'Query PXW_Xref.Data in InterSystems IRIS to find which ObjectScript classes, methods, and properties use or reference another class member. Use for xref questions, caller lookups, and "what classes use" requests.'
argument-hint: 'Target class or member, for example %ISQL.Transformer'
user-invocable: true
---

# ObjectScript Xref Usage

Use this skill when the user asks which classes, methods, or properties use an ObjectScript class or member in the PXW xref database.

## Data Model

`PXW_Xref.Data` stores xref relationships:

- `ItemType = 'CLS'` identifies class relationships.
- `ItemKey1` is the referenced class name.
- `ItemKey2` is the referenced method or property name.
- `CalledByType` identifies the caller document type.
- `CalledByKey1` is the calling class or document name.
- `CalledByKey2` is the calling method or property name.
- `CalledByKey3` identifies the call occurrence within the caller member.
- `CalledByCommand` describes the relationship kind.
- `LineNumber` is the source line in the caller member.

The caller columns are named `CalledByKey1`, `CalledByKey2`, and `CalledByKey3`.

## Procedure

1. Read the workspace VS Code settings and locate `pxw.xref.connection`.
2. Use the `namespace` value from `pxw.xref.connection` as the namespace for every xref query. Do not infer it from the active connection, the target class, or another settings key. If the setting or its namespace is missing, stop and ask for it rather than choosing a fallback.
3. Never query `PXW_Xref.Data` in `%SYS`. In particular, do not fall back to `%SYS` when the configured namespace is unavailable, and do not run SQL in `%SYS` for this data. For this repository, the configured namespace is `USER`.
4. Query `PXW_Xref.Data` in that configured namespace with `ItemType = 'CLS'` and the target class in `ItemKey1`.
5. Select `CalledByKey1`, `CalledByKey2`, and `LineNumber` for the caller list. Include `CalledByCommand` when the relationship type matters.
6. Exclude rows where `CalledByKey1 = ItemKey1` when the user wants external users rather than the target class's internal references.
7. Use `DISTINCT` only when duplicate relationship rows are not useful; preserve individual rows when the user needs every occurrence.
8. Resolve each returned class name to an existing workspace source file where possible. ObjectScript class names map to class files by replacing dots with path separators and appending `.cls`; search the workspace source roots when the class is not at the repository root.
9. Render resolved class names as Markdown links to the workspace-relative file, using the xref `LineNumber` as the link anchor when that line exists in the local source. Link the member name separately only when a precise member location is known.
10. Leave classes without a local source file as plain text and say that the source is not present in the workspace. Never fabricate file links or use `file://`/`vscode://` URLs.
11. Report the calling class, calling member, and source line. State clearly whether internal self-references were excluded.

## Query Template

```sql
SELECT DISTINCT
    CalledByKey1,
    CalledByKey2,
    LineNumber
FROM PXW_Xref.Data
WHERE ItemType = 'CLS'
  AND ItemKey1 = '<target-class>'
  AND CalledByKey1 <> '<target-class>'
ORDER BY CalledByKey1, CalledByKey2, LineNumber
```

For a specific method or property, add:

```sql
AND ItemKey2 = '<target-member>'
```

## Important Checks

- The xref database may contain stale or incomplete data, so use a direct source search to corroborate surprising results.
- Class names and member names may be returned in uppercase by IRIS SQL even when source uses mixed case.
- A direct search for the exact token can miss relationships represented by the xref builder, while the xref table can include internal implementation references. Explain this distinction when relevant.
