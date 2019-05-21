#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: <insert DockerHub image>

- class: "InlineJavascriptRequirement"

inputs:
 <insert input name>:
  type: <insert input type>
  inputBinding:
   position: <insert input order>

outputs:
 <insert output name>:
  type: <input output type>
  outputBinding:
   <insert output binding>

baseCommand: [<insert run.sh file name>]
