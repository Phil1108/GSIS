# GSIS
German Satellite Image Segmentation

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Phil1108/GSIS/Images/Example_Hybrid.png">
    <img src="images/Example_Hybrid.png" alt="Logo" width="150" height="150">
  </a>

  <h3 align="center">Best-README-Template</h3>

  <p align="center">
    German Satellite Image Segmentation - The smart way to get Training Data for aerial Image Classification
    <br />
    <a href="https://www.kaggle.com/greatprao"><Download an example dataset here»</strong></a>
    <br />
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template">View More Examples</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Installation](#installation)


<!-- ABOUT THE PROJECT -->
## About The Project

There are many datasets available for the segmentation of aerial images. However most of them lack of scale, detail or are under commercial license. 
This projects aims to: 
* Provide a large amount of training data (35.000 km²) fully annotated with segments
* Consists of a vast amount of different classes (Streets, Vegetation, Homes, Garages, Paths ...)
* Covers rural and urban areas 
* Create your individual datasets with adoptable classes and extent
* Allows to train an CNN to detect estate boundaries

**If you wanna try out an example just download one preformed database (size of around !!! GB) at [kaggle](https://www.kaggle.com/greatprao).**

The code itself is released under the MIT License however the data is provided by the federal state of North Rhine-Westphalia under the [Data licence Germany – attribution – version 2.0](https://www.govdata.de/dl-de/by-2-0). 


## Getting Started
To create or adpot the databases you need _one of_ the following system setups:
1. Docker where you can just run the prebuild docker files (the easiest solution)

2. OSGeo4W (for Windows) or OSGeolive where nearly all [Installation](#installation) requirements are already build in 

3. Python3 (Tested with Ubuntu 18.04 but Windows may also work) where you have to install all packages from [Installation](#installation)

[contributors-shield]: https://img.shields.io/github/contributors/phil1108/GSIS.svg??style=plastic
[contributors-url]: https://github.com/phil1108/GSIS/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/phil1108/GSIS.svg?style=flat-square
[forks-url]: https://github.com/ophil1108/GSIS/network/members

[issues-shield]: https://img.shields.io/github/issues/phil1108/GSIS.svg?style=flat-square
[issues-url]: https://github.com/phil1108/GSIS/issues

[license-url]: https://github.com/phil1108/GSIS/blob/master/LICENSE.txt
[license-shield]: https://img.shields.io/github/license/phil1108/GSIS.svg?style=flat-square

### Installation


