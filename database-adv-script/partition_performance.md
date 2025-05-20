| Metric                   | Without Partitioning | With Partitioning (Expected)    |
| ------------------------ | -------------------- | ------------------------------- |
| Total rows scanned       | All rows             | Only rows in matching partition |
| Query execution time     | Slower               | Faster                          |
| Disk I/O / Buffer access | Higher               | Lower                           |
