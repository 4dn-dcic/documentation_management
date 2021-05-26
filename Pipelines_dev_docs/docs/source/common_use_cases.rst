Common Use Cases
================

Output Files
-------------

When the output of the pipeline will result in a new processed file. Current examples of this case
in the data portal are the Hi-C pipeline and other processing pipelines.

In the workflow object, the output argument field must have the following fields:

``"argument_type": "Output processed file"``

Extra files
------------

When the output of the pipeline will result in an extra file for an existing file.
Current examples of this case in the data portal are bedtobedb and bedtomultivec.

In the workflow object, the output argument field must have the following fields:

``"argument_format": " <add the format of the file>"``

``"argument_to_be_attached_to":"<the argument name of the file to which it will be attached to>"``

``""argument_type":"Output to be-extra-input file"``

If the extra file is going to be used for visualization, the following field should be added as well:

``"extra_file_use_for": "visualization"`` 

This will add the tag ``use_for`` to the extra file

QC metrics that are attached to existing files
------------------------------------------------

When the output of the pipeline will result in a QC metric object attached to an existing file.
The output of the pipeline should be a json file in which the key corresponds to the field and the
value corresponds to the value in the QC metric object. Current examples in the data portal include
PairsQC and BamqQC. Make sure that the quality metric type is in the schema, otherwise, add it to it.

In the workflow object, the output argument field must have the following fields:

``"argument_type": "Output QC file"``

``"qc_json": "true"``

``"argument_to_be_attached_to": "<the argument name of the file to which it will be attached to>"``

``"qc_type": "<the quality metric type>"`` This is the quality metric object (eg. quality_metric_bamqc)


QC metrics that are patched by tibanna to a specific field
-----------------------------------------------------------

When the output will be patched to a field by tibanna (such as md5 and rna-strandedness).
The output of the pipeline should be a txt file containing the value(s) of the field(s) that are going to be patched,
each value should be on a separate line.
Current examples in the data portal include md5 and fastq-formatqc.

Before being able to run the pipeline the following steps should be performed:

	- Add new field to the schema (fourfront) if it is not already there yet.

	- Build Fourfront locally and test that the field works properly (Do some patches)

	- Submit PR and once it is in master tell Soo to handle the tibanna part

In the workflow object, the output argument field must have the following field:

``"argument_type": "Output report file"``
