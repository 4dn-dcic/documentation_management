Test with Tibanna
=================

Prepare Tibanna input
----------------------
In order to test with tibanna, you would need to talk to Soo to add enviroment variables
clone the tibanna repository
write a tibanna_input.json file

.. note::
  if the output file is an extra file instead of a new process file, which means that it is the result of
  a format conversion (ex. beddb and bed.multivec is an extra file for bed file)
  It is necessary to add that information to tibanna.
  https://github.com/4dn-dcic/tibanna/blob/master/core/update_ffmeta_awsem/service.py#L268

Run Tibanna Test
-----------------

Set up by following the instructions:
https://tibanna.readthedocs.io/en/latest/installation.html

Once Tibanna is setup, go to the Tibanna repository folder and run the following commands:

Activate the Tibanna environment:

::

  $ source ~/venv/tibanna/bin/activate

Run the Tibanna test:

::

   $ invoke run_workflow --input-json=tibanna_input.json

Benchmarking
------------
.. note::

    This is only required when the pipeline memory consumption it is highly dependent of the size of the
    file.

It is necessary to get an estimate of the relationship between the size of the input
files and the memory consumption so that Tibanna knows how much resources to allocate for each file based on its
size.

In order to do this, run the tibanna test above on different file sizes, changing
the following parameters in the tibanna_input.json file accordingly:

``instance_type``: choose a t2 instance that has bigger memory
``ebs_size``: modify the size of the instance for bigger files

Look at the output of the tests and record, the size, the max memory used, the
max CPU used and the size of the output file for each file. This will give you a sense of the relationship between
file size, memory and CPU consumption.

Then go to https://github.com/SooLee/Benchmark/blob/master/Benchmark/bfunctions.py

and create a function for your pipeline that calculates how much resources are
needed for each file size.

This is an example of the function created for insulator score caller:
https://github.com/SooLee/Benchmark/blob/master/Benchmark/bfunctions.py#L218

The script only run using 1 thread, therefore  ``nthreads`` = 1

The output file size was approx 1000 times smaller than the input file,
therefore ``output_bw_size`` = ``data_input_size`` * 0.001

After testing different input files in a range of 1GB - 45GB, the memory seemed
to not surpass 1.5GB, therefore, ``mem`` = 2GB


Once you submit a PR for your function, and Soo deploys tibanna, you can test again, using the
tibanna_input.json file without specifying the size of the instance.


Once the test passes, you can post the workflow in data, make sure to use the
same uuids you used in webdev.

Give the tibanna_input.json file to Koray to run the workflow in the files on the
data portal.
