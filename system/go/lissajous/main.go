// Package main offers a lissajous executable based on "The Go Programming Language" by Donovan and Kernighan.
package main

import (
	"image"
	"image/color"
	"image/gif"
	"io"
	"log"
	"math"
	"os"
)

// palette lists some colors for the GIF artifact.
var palette = []color.Color{color.White, color.Black}

// Palette indices.
const (
	whiteIndex = 0
	blackIndex = 1
)

// main is the entrypoint for this application.
func main() {
	lissajous(os.Stdout)
}

// Given an output stream, generate an animated lissajous GIF and emit to the stream.
func lissajous(out io.Writer) {
	const (
		cycles            = 5
		angularResolution = 0.01
		imageSize         = 100
		frames            = 64
		frameDelay        = 8 // units: 10ms
	)

	frequency := 8.0
	animation := gif.GIF{LoopCount: 0} // Loop forever
	phaseDifference := 0.0

	for i := 0; i < frames; i++ {
		rectangle := image.Rect(0, 0, 2*imageSize+1, 2*imageSize+1)

		image := image.NewPaletted(rectangle, palette)

		for t := 0.0; t < cycles*2*math.Pi; t += angularResolution {
			x := math.Sin(t)
			y := math.Sin(t*frequency + phaseDifference)

			image.SetColorIndex(imageSize+int(x*imageSize+0.5), imageSize+int(y*imageSize+0.5), blackIndex)
		}

		phaseDifference += 0.1

		animation.Delay = append(animation.Delay, frameDelay)
		animation.Image = append(animation.Image, image)
	}

	err := gif.EncodeAll(out, &animation)

	if err != nil {
		log.Panic(err)
	}
}
