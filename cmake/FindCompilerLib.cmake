#The places to look for the compilerlib folders
set(FIND_COMPILERLIB_PATHS
        ${CMAKE_CURRENT_LIST_DIR}/../cmake-build-debug/compilerlib
        ${CMAKE_CURRENT_LIST_DIR}/../compilerlib
        )

#The location of the include folder (and thus the header files)
#find_path uses the paths we defined above as places to look
#Saves the location of the header files in a variable called COMPILERLIB_INCLUDE_DIR
find_path(COMPILERLIB_INCLUDE_DIR compilerlib.h   #The variable to store the path in and the name of the header files
        PATH_SUFFIXES include               #The folder name containing the header files
        PATHS ${FIND_COMPILERLIB_PATHS})       #Where to look (defined above)

#The location of the lib folder (and thus the .a file)
#find_library uses the paths we defined above as places to look
#Saves the location of the .a file in a variable called COMPILERLIB_LIBRARY
find_library(COMPILERLIB_LIBRARY               #The variable to store where it found the .a files
        NAMES compilerlib                      #The name of the .a file (without the extension and without the 'lib')
        PATH_SUFFIXES lib                   #The folder the .a file is in
        PATHS ${FIND_COMPILERLIB_PATHS})       #Where to look (defined above)