## How to copy a github repo to a new one

```
git clone --bare https://github.com/p1nrojas/old-one
cd old-one.git
git push --mirror https://github.com/p1nrojas/new-one
cd ..
rm -rf old-one.git
```
