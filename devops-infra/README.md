# DevOps infrastructure in a can

This project contains your DevOps infrastructure in a can, everything but
the most important - your culture. That's something nobody but you can create.

## How to get started?

1. Install VirtualBox and Vagrant

2. ``vagrant plugin install vagrant-hostsupdater && vagrant plugin install vagrant-hosts``

3. ``vagrant up admin cia``

4. Browse to http://10.11.0.10:4440/ (admin/admin)

Currently all that's visible is the RunDeck console.

## What does this project currently contain?

1. Puppet Master

2. RunDeck

## What's on the roadmap?

3. Centralized log tracking with ``fluentd``, Kibana and ElasticSearch

4. Centralized metrics collection with ``collectd`` or Red Hat RHQ

5. Jenkins CI

6. Continuous Delivery pipeline (and deployment) with Jenkins

7. Your private ``DEB``-file application repository with ``reprepro``

8. GitLab.org and GitLab-CI

9. ForgeRock identity stack http://forgerock.com/what-we-offer/open-identity-stack/

10. a NTP server, and "internal" NTP client configuration

## What's on the related application development roadmap?

A. CI application packaging into ``DEB`` with ``fpm``

B. Data model migration with LiquiBase


