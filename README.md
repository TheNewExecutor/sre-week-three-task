# SRE Fundamentals with Google Week 3 Tasks

## Task 1
We are asked to create a bash script to check for deployment restarts and trigger a scaling down of resources if the restart count is too high.

## Task 2
We are asked to identify potential solutions or products to address the toil in the ticketing system to mitigate issues such as:
- recurring obsolete alerts
- lack of prioritization

### Task 2 Toil Mitigations Suggestions

#### Implementing Prioritization
The ticketing system resembled a simple log missing features in more reliable implementations.
In Python, for example, logs have different classifications such as warnings or errors. Prioritization
can be implemented by having stakeholders come together and agree on a ranking hierarchy of which alerts
are more important than others. Toil can then be reduced by setting filters for the priority, so 
engineers can opt in to whatever level of detail they find appropriate. 

#### Addressing Obsolescence
Another issue brought up is that the ticket system brought up old, obsolete alerts. One approach is to 
record a timestamp of the ticket and track the number of times it is brought up with a hashtable-based 
counter and limit the max amount of times an alert can recur. Obsolete alerts seems like a fundamental
design issue, so whatever code is generating the alerts should be updated to couple alerts with current
statuses of resources. 


