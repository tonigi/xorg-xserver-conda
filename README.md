# xorg-xserver-conda
Will never work


```
what=turbovnc
docker run -v $PWD/recipe-$what:/home/conda/recipe -it quay.io/condaforge/linux-anvil-comp7

# Then in the container
conda mambabuild recipe
```
