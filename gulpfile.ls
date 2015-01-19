require! <[
  express
  run-sequence
  js-string-escape
  gulp
  gulp-if
  gulp-karma
  gulp-concat
  gulp-rename
  gulp-purescript
  gulp-livescript
  gulp-filter
  gulp-uglify
  gulp-file-include
  gulp-mocha
]>

paths =
  test:
    src: <[
      bower_components/purescript-*/src/**/*.purs
      bower_components/purescript-*/src/**/*.purs.hs
      src/**/*.purs
      test/**/*.purs
    ]>
    dest: "tmp"

options =
  test:
    output: "Test.js"
    main: true
    externs: "extern.purs"

port   = 3333
server = express()

build = (k) -> ->

  x   = paths[k]
  o   = options[k]
  psc = gulp-purescript.psc o
  lsc = gulp-livescript bare : true
  fil = gulp-filter ({path}) ->
    if k is "test"
    -- This explictly filters out the bower_components version of Context.purs
    -- because the testing tools Mocha and Chai depend on Context (testing has a cyclical dependency)
    then (not /Main.purs/.test path and not /bower_components\/purescript-context\/src\/Context.purs/.test path)
    else not /Test/ig.test path

  psc.on "error" ({message}) ->
    console.error message
    psc.end()

  gulp.src x.src
    .pipe fil
    .pipe gulp-if /.purs/, psc
    .pipe gulp-if /.ls/,   lsc
    .pipe gulp-concat o.output
    .pipe gulp-if (k is "prod"), gulp-uglify()
    .pipe gulp.dest x.dest

karma = gulp-karma(
  configFile : "./karma.conf.ls"
  noColors   : true
  action     : "run"
)

mocha = gulp-mocha!

gulp.task "build:test", build "test"
gulp.task "test:unit" ->
  o = paths.test.dest+"/"+options.test.output
  gulp.src o .pipe karma
  gulp.src o .pipe mocha

gulp.task "doc" ->
  gulp.src "src/**/*.purs"
    .pipe gulp-purescript.docgen!
    .pipe gulp.dest "README.md"

gulp.task "test" -> run-sequence "build:test" "test:unit"
gulp.task "travis"  <[test]>
