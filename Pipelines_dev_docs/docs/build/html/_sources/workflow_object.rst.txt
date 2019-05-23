Create Workflow Object
=======================

In order to implement the pipeline in the data portal, it is necessary to create
a workflow object. Test your workflow in webdev first. Upload your workflow and test files. Since
this will be tested with tibanna, you can use bigger test files than the ones used in the travis
test. **You need also to create file formats and software objects**
in case they do not exists in the system.

Example:

You can find the bedtomultivec workflow.json `here <https://github.com/4dn-dcic/documentation_management/blob/master/docs/source/files/bedtomultivec_workflow_v4.json>`_

Here is a `template <https://github.com/4dn-dcic/documentation_management/blob/master/Pipelines_dev_docs/docs/source/files/workflow.json>`_
you can use.

.. warning::

          The workflow object along with the file formats and software objects created should have
          the same uuid in both webdev and data. Therefore, if a file format or software already exists
          on data and not in webdev, it is best to post the same object to webdev. Likewise, whenever an
          object is created in webdev, it is best to post the same object in data in order to keep the same
          uuids.

.. note::

          The new workflow object along with the new file formats and software objects jsons will be
          added to fourfront inserts
