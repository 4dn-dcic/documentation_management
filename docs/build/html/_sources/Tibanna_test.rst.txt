Test with Tibanna
=================

Prepare Tibanna input
----------------------
In order to test with tibanna, you would need to talk to Soo to add enviroment variables
clone the tibanna repository
write a tibanna_input.json file

.. note::
  if the output file is an extra file (ex. beddb and bed.multivec is an extra file for bed file)
  and not a new process file, it is necessary to add that information to tibanna.
  https://github.com/4dn-dcic/tibanna/blob/master/core/update_ffmeta_awsem/service.py#L259

Run Tibanna Test
-----------------

Go to the tibanna repository folder and run the following commands:

Activate the Tibanna environment:

::

  $ source ~/venv/tibanna/bin/activate

Run the Tibanna test:

::

   $ invoke run_workflow --input-json=tibanna_input.json

Benchmarking
------------

This is only required when the pipeline memory consumption it is highly dependent of the size of the
file. It is necessary to get an estimate of the relationship between them
so that Tibanna knows how much resources to allocate for each file based on its
size.

In order to do this, run the tibanna test above on different file sizes, changing
the following parameters in the tibanna_input.json file accordingly:

``instance_type``: choose a t2 instance that has bigger memory
``ebs_size``: modify the size of the instance for bigger files

Look at the output of the tests and record, the size, the max memory used and the
max CPU used for each file. This will give you a sense of the relationship between
file size, memory and CPU consumption.

Then go to https://github.com/SooLee/Benchmark/blob/master/Benchmark/bfunctions.py

and create a function for your pipeline that calculates how much resources are
needed for each file size.

Once you submit a PR, and Soo deploys tibanna, you can test again, usings the
tibanna_input.json file without the following parameters:

Once the test passes, you can post the workflow in data, make sure to use the
same uuids you used in webdev.

Give the tibanna_input.json file to Koray to run the workflow in the files on data.
