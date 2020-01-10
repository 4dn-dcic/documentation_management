Common Use Cases
================

You can visit the following repos that used more complicated pipelines:

Output Files
-------------

When the output of the pipeline will result in a processed file

QC metrics
------------

When the output of the pipeline will result in a QC metric object attached to an existing file.
The output of the pipeline should be a json file in which the key corresponds to the field and the
value corresponds to the value in the QC metric object.


QC metrics
-----------

The output will be patched to an schema field such as md5 and rna-strandedness.
The output of the pipeline should be a txt file containing the value of the field that is going to be attached to

Steps:
 	Add new field to the schema (fourfront)
	Build Fourfront locally and test that the field works properly (Do some patches)
    Submit PR and tell Soo to handle the tibanna part

In the workflow object Add to the output field
{
    "argument_type": "Output report file",
    "workflow_argument_name": "match_count"
}
