# sh-logger
Logger for .sh files/projects

### How to use

- Add sh-logger in your project: 
  - Add sh-logger in pom.sh
```
(...)
declare -A DEPENDENCIES=( \
	(...)
	[sh_logger]=v1.3.0 \
	(...)
);
(...)
```
  - Run sh-pm update
```
$ ./shpm.sh update
```

- Include sh-logger in your(s) script(s):
```
#!/bin/bash

source ../../../bootstrap.sh

(...)
include_lib sh-logger
(...)

#YOUR SH CODE
```

- Set log level using one of the possible values: $LOG_LEVEL_**[TRACE|DEBUG|INFO|WARN|ERROR|FATAL]**. Example:
```
LOG_LEVEL=$LOG_LEVEL_INFO
```