# Adslot Code Test by Fred Wu

## Prerequisite

- node (tested on v5.11.0)

## Run Tests

```bash
cd 06-memory
npm i
npm t
```

```bash
cd 10-word-count
npm i
npm t
```

## Thoughts

### Implementation Approach

- KISS (Keep It Simple and Stupid)
- Full git commit history

### 06-memory

This appears to be a puzzle for a fairly straightforward performance optimisation technique: instead of reading the entire file in memory, read it line by line.

### 10-word-count

Started out simple and refactored with more (edge) cases, please feel free to refer to the commit history. The logic itself is encapsulated in the `WordCruncher` object rather than being embedded in the `through2` object.

## Author

- Fred Wu <ifredwu@gmail.com>
- 2016-05-26
