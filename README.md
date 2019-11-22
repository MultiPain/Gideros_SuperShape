# Gideros_SuperShape

![SuperShape_prview](https://github.com/MultiPain/Gideros_SuperShape/blob/master/SuperShape_prview.jpg)

An implementation of [Superellipse](https://en.wikipedia.org/wiki/Superellipse) and [Supershapes](http://paulbourke.net/geometry/supershape/). 

# Usage

```lua
local shape = SuperShape.new([type, color, numberOfPoints])
```

1. type(string): one of SuperShape's types [default: SuperShape.SHAPE]:
  - SuperShape.SHAPE - Supershape
  - SuperShape.ELLIPSE - Superellipse
  - SuperShape.CIRCLE - Regular circle
  - SuperShape.HEART - Heart shape
2. color(number): shape color [default: 0xffffff]
3. numberOfPoints(number): Number of edge points [default: 128]


```lua
shape:build(params)
```
params - a set of params that depends on shape type

1. SuperShape.SHAPE - r, a, b, m, n1, n2, n3 (see [Supershape](http://paulbourke.net/geometry/supershape/)  for more detail)
2. SuperShape.ELLIPSE - a, b, m, n (see [Superellipse](https://en.wikipedia.org/wiki/Superellipse")  for more detail)
3. SuperShape.CIRCLE - r (radius)
4. SuperShape.HEART - r (radius SCALE)

