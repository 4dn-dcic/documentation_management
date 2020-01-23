Overview
============

There are several steps for developing and implementing pipelines in the 4DN data portal.
The pipeline basic structure consists of **a docker image** containing the scripts, software and packages necessary to
run all processes on a desired input data. **One or several cwl files** containing the instructions about the order in which the scripts will be run.
**One or several workflow objects** representing the pipeline in the data portal. **A foursight check** that runs the
pipeline on specific files on the data portal and with specific computer resources (benchmarking) using tibanna.

These are the following places in which the pipeline information is contained:

**Pipeline GitHub Repository:**

All the pipelines have their own GitHub Repo containing all the information about the pipeline such as the docker image,
cwl file(s), tests and others. The steps performed in GitHub can be summarized as follows:

    - Dockerization
    - CWL file(s) pointing to the docker image
    - Travis testing to ensure it is working how it is supposed to

**Data Portal:**

The pipeline workflow object and other new related objects (file formats, reference files, ...) are posted in the data portal  and the
computing resources necessary to run them are assessed (memory, disk space). The steps performed in the data portal can be summarized as follows:

    - Workflow object (s) and related objects are created
    - Tibanna benchmarking

**Foursight:**

Finally a foursight check is made to run the pipeline automatically in the data portal. The steps performed in foursight can be summarized as follows:

    - Configure pipeline run (metadata, files, query)
    - Run pipeline
