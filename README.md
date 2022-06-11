<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/mertguven/marve_universe">
    <img src="assets/images/logoWithBg.png" alt="Logo" width="30%">
  </a>

  <h1 align="center">Marvel Universe</h1>

  <p align="center">
    Marvel Universe is an application that introduces characters from marvel universe using marvel api.
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#project-structure">Project Structure</a></li>
    <li><a href="#packages">Packages</a></li>
    <li><a href="#design-pattern">Design Pattern</a></li>
    <li><a href="#descriptions-of-project-files">Descriptions Of Project Files</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


<div id="built-with"></div>

## Built With

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)
* [Marvel API](https://developer.marvel.com/docs)

<div id="project-structure"></div>

## Project Structure

<pre>
├── android
├── assets
│   ├── images
│   └── translations
├── ios
├── lib
│   ├── controller
│   ├── core
│   │   ├── constants
│   │   ├── extensions
│   │   ├── helper
│   │   ├── theme
│   │   └── utilities
│   ├── cubit
│   ├── model
│   ├── view
│   │   ├── not_found
│   │   └── home
│   │       ├── character_detail
│   │       └── characters
│   ├── main.dart
│   ├── splash_view.dart
├── pubspec.lock
└── pubspec.yaml
</pre>

<div id="packages"></div>

## Packages

* Default Package
  * [cupertino_icons](https://pub.dev/packages/cupertino_icons/)
* Network Package
  * [dio](https://pub.dev/packages/dio/)
* State Management Package
  * [flutter_bloc](https://pub.dev/packages/flutter_bloc/)
* Presentation Packages
  * [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter/)
  * [page_transition](https://pub.dev/packages/page_transition/)
  * [shimmer](https://pub.dev/packages/shimmer/)
* Localization Package
  * [easy_localization](https://pub.dev/packages/easy_localization/)


<div id="design-pattern"></div>

## Design Pattern
The design pattern of the project is [MVC](https://en.wikipedia.org/wiki/Model–view–controller).


<div id="descriptions-of-project-files"></div>

## Descriptions Of Project Files

<b>assets/ :</b>
  <p>This folder is the folder where the asset files of the project are located.</p>
<b>assets/images/ :</b>
  <p>This folder is the folder where the image files of the project are located.</p>
<b>assets/translations/ :</b>
  <p>This file is the file containing the translations files of the project.</p>
<b>lib/ :</b>
  <p>It's the section where the source code of the project is located.</p>
<b>lib/controller/ :</b>
  <p>It's the section that controls the business processes of the project.</p>
<b>core/ :</b>
  <p>It's the section where the core folders of the project are located.</p>
<b>core/constants/ :</b>
  <p>It's the section where the constants of the project are located.</p>
<b>core/theme/ :</b>
  <p>It's the section where the theme of the project is located.</p>
<b>core/utilities/ :</b>
  <p>It's the section where the custom widgets used throughout the project are located.</p>
<b>cubit/ :</b>
  <p>It's the section where the state management of the project is located.</p>
<b>model :</b>
  <p>It's the project section where the models of the data coming from the Marvel API are located.</p>
<b>data/service :</b>
  <p>It's the part that communicates with the Marvel API.</p>
<b>presentation/ :</b>
  <p>It's the presentation layer of the project.</p>
  

<div id="license"></div>

## License

<pre>
Copyright 2022 MERT GÜVEN

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
</pre>


<div id="contact"></div>

## Contact

* Mert Güven - [mertguven.com](http://mertguven.com/#/) - mertguven789@gmail.com

<p align="right"><a href="#top">⬆️</a></p>
