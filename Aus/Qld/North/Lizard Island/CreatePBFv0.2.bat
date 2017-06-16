echo on
REM =======================================================================
REM This batch file assumes the following:
REM OSMOSIS is installed/copied too are on \xplane11\osmosisosmextractor
REM There is a folder called \xplane11\osmosisosmextractor\inputosm
REM The OSM that needs to be a PBF is called input.osm and resides beside this batch file
REM The bounding box polygon is in OSM format and is called boundary.poly and resides beside this batch file
REM This batch will generate an output.pbf file that includes only the bounded space.
REM The output.pbf can then be run through w2xp without any bounding polygon
REM =======================================================================
REM 

REM Preserve the current directory
pushd %cd%

REM Delete any old source osm files
del \xplane11\osmosisosmextractor\inputosm\*.osm
del \xplane11\osmosisosmextractor\inputosm\*.poly

REM Copy the new source osm over
copy input.osm \xplane11\osmosisosmextractor\inputosm
copy boundary.poly \xplane11\osmosisosmextractor\inputosm

REM change directories to osmosis
cd \xplane11\osmosisosmextractor\bin

Call osmosis --read-xml file=\XPlane11\osmosisosmextractor\inputosm\input.osm --bounding-polygon file=\XPlane11\osmosisosmextractor\inputosm\boundary.poly completeWays=yes completeRelations=yes cascadingRelations=yes --write-pbf file=output.pbf

REM return to the "current" directory
popd

REM copy the output pbf from the osmosis working folder to the "current" folder
copy \xplane11\osmosisosmextractor\bin\output.pbf .



