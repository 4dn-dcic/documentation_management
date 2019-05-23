Test with Tibanna
=================

Install Tibanna
----------------

Set up Tibanna following the instructions:
https://tibanna.readthedocs.io/en/latest/installation.html

.. note:: Talk to Soo to add environment variables.

Prepare Tibanna Input
----------------------

Write a tibanna_input_json.txt file. This file contains the inputs to test

Example:
The tibanna_input.json.txt for the bedtomultivec pipeline can be found `here <https://github.com/4dn-dcic/documentation_management/blob/master/docs/source/files/tibanna_input_bed2multivecv4_json.txt>`_

.. note::
  if the output file is an extra file instead of a new processed file, such as the ones resulting from
  a format conversion (ex. beddb and bed.multivec are extra files of the bed file)
  it is necessary to add that information to tibanna.
  https://github.com/4dn-dcic/tibanna/blob/master/core/update_ffmeta_awsem/service.py#L268

Run Tibanna Test
-----------------

Once Tibanna is set, go to the Tibanna repository folder and run the following commands:

Activate the Tibanna environment:

::

  $ source ~/venv/tibanna/bin/activate

Run the Tibanna test:

::

   $ invoke run_workflow --input-json=tibanna_input_json.txt

Benchmarking
------------
.. note::

    This is only required when the pipeline memory, CPU and/or space requirement is highly dependent of the size of the
    file.

It is necessary to get an estimate of the relationship between the size of the input
files and the memory, CPU, and disk space usage so that Tibanna knows how much resources to allocate for each file based on its
size.

In order to do this, run the Tibanna test above on different file sizes, changing
the following parameters in the tibanna_input_json.txt file accordingly:

``instance_type``: choose a t2 instance that has bigger memory and CPU. `here <https://aws.amazon.com/ec2/instance-types/t2/>`_ is a list

``ebs_size``: modify the size (in GB) of the instance for bigger files

Look at the output of the test and record: the size of the input and output files, the max memory used, and
the max CPU used for each file. This will give you a sense of the relationship between
file size, memory, CPU consumption, and disk space.

Then go to `here <https://github.com/SooLee/Benchmark/blob/master/Benchmark/bfunctions.py>_`
and create a function for your pipeline that calculates how much resources are
needed for each file size.

This is an example of the function created for insulator score caller:
https://github.com/SooLee/Benchmark/blob/master/Benchmark/bfunctions.py#L218

The script only uses 1 thread, therefore  ``nthreads`` = 1

The output file size was approx 1000 times smaller than the input file,
therefore ``output_bw_size`` = ``data_input_size`` * 0.001

After testing different input files in a range of 1GB - 45GB, the memory seemed
to not surpass 1.5GB, therefore, ``mem`` = 2GB


Once you submit a PR for your function, and Soo deploys Tibanna, you can test again, using the
tibanna_input.json.txt file without specifying the instance used.


Once the test passes, you can post the workflow in data, make sure to keep the
same uuids you used when testing in webdev.

Give the tibanna_input.json.txt file to Koray to run the workflow in the files that are in the
data portal.
