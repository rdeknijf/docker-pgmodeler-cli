pgmodeler-cli Docker image
==========================

Run pgmodeler-cli without building or installing.

## Usage

    docker run -v $(pwd):/some/path rdeknijf/pgmodeler-cli pgmodeler-cli --input /some/path/some.dbm --export-to-file --output /some/path/some.sql