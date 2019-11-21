# Gideros_SuperShape

![alt text](https://github.com/MultiPain/Gideros_SuperShape/blob/master/SuperShape.jpg)

An implementation of [Superellipse](https://en.wikipedia.org/wiki/Superellipse") and [Supershapes](http://paulbourke.net/geometry/supershape/). 

# Usage

```lua
local shape = SuperShape.new(type, [color, numberOfPoints])
```
type(string): one of SuperShape's types:
  SuperShape.SHAPE - Supershape
  SuperShape.ELLIPSE - Superellipse
  SuperShape.CIRCLE - Regular circle
color(number): shape color [default: 0xffffff]
numberOfPoints(number): Number of edge points [default: 128]

```lua
shape:build(params)
```
params - a set of params that depends on shape type

SuperShape.SHAPE - r, a, b, m, n1, n2, n3 (see [Supershape](http://paulbourke.net/geometry/supershape/)  for more detail)
SuperShape.ELLIPSE - a, b, m, n (see [Superellipse](https://en.wikipedia.org/wiki/Superellipse")  for more detail)
SuperShape.CIRCLE - r (radius)
