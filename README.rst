------
PyKMIP
------
|pypi-version|
|travis-status|
|codecov-status|
|python-versions|

PyKMIP is a Python implementation of the Key Management Interoperability
Protocol (KMIP), an `OASIS`_ communication standard for the management of
objects stored and maintained by key management systems. KMIP defines how key
management operations and operation data should be encoded and communicated
between client and server applications. Supported operations include the full
`CRUD`_ key management lifecycle, including operations for managing object
metadata and for conducting cryptographic operations. Supported object types
include:

* symmetric/asymmetric encryption keys
* passwords/passphrases
* certificates
* opaque data blobs, and more

For more information on KMIP, check out the `OASIS KMIP Technical Committee`_
and the `OASIS KMIP Documentation`_.

For more information on PyKMIP, check out the project `Documentation`_.

Installation
------------
You can install PyKMIP via ``pip``:

.. code-block:: console

    $ pip install pykmip

See `Installation`_ for more information.

---

Containerization
----------------

PyKMIP can be containerized for local development, testing, and production deployments using Docker. The project includes Makefile targets to simplify image building and publishing workflows.

Docker Build
~~~~~~~~~~~~

Build the Docker image locally:

.. code-block:: console

    $ make build

This produces a local image tagged with the default version (``latest`` or git-based tag).

Custom Image Build (CI/CD)
~~~~~~~~~~~~~~~~~~~~~~~~~~

You can override the image reference using the ``IMG`` variable:

.. code-block:: console

    $ IMG=registry.cubbit.io/pykmip:latest make docker-build

This is useful for CI/CD pipelines where image naming is controlled externally.

Multi-Architecture Build
~~~~~~~~~~~~~~~~~~~~~~~~~

For production use cases, PyKMIP supports multi-architecture builds using Docker Buildx:

.. code-block:: console

    $ make build-multi

This builds and publishes images for:

- linux/amd64
- linux/arm64

The resulting image is pushed directly to the configured container registry.

Image Versioning
~~~~~~~~~~~~~~~~

Images are versioned using git metadata when available, or fall back to ``latest``:

- ``registry.cubbit.io/pykmip:<git-tag-or-sha>``
- ``registry.cubbit.io/pykmip:latest``

Troubleshooting
~~~~~~~~~~~~~~~

Build failures or runtime issues are often related to image tagging or registry mismatches.

Common issues include:

Incorrect image reference
^^^^^^^^^^^^^^^^^^^^^^^^^

Ensure the image name matches your registry format:

.. code-block:: console

    registry.cubbit.io/pykmip:latest

Manifest or architecture issues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If using multi-architecture builds, ensure Docker Buildx is enabled:

.. code-block:: console

    docker buildx ls

Recreate builder if needed:

.. code-block:: console

    docker buildx create --use

---

Community
---------
The PyKMIP community has various forums and resources you can use:

* `Source code`_
* `Issue tracker`_
* IRC: ``#pykmip`` on ``irc.freenode.net``
* Twitter: ``@pykmip``


.. _`CRUD`: https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
.. _`OASIS`: https://www.oasis-open.org
.. _`OASIS KMIP Technical Committee`: https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=kmip
.. _`OASIS KMIP Documentation`: https://docs.oasis-open.org/kmip/spec/
.. _`Documentation`: https://pykmip.readthedocs.io/en/latest/index.html
.. _`Installation`: https://pykmip.readthedocs.io/en/latest/installation.html
.. _`Source code`: https://github.com/openkmip/pykmip
.. _`Issue tracker`: https://github.com/openkmip/pykmip/issues

.. |pypi-version| image:: https://img.shields.io/pypi/v/pykmip.svg
  :target: https://pypi.python.org/pypi/pykmip
  :alt: Latest Version
.. |travis-status| image:: https://travis-ci.org/OpenKMIP/PyKMIP.svg?branch=master
  :target: https://travis-ci.org/OpenKMIP/PyKMIP
.. |codecov-status| image:: https://codecov.io/github/OpenKMIP/PyKMIP/coverage.svg?branch=master
  :target: https://codecov.io/github/OpenKMIP/PyKMIP?branch=master
.. |python-versions| image:: https://img.shields.io/pypi/pyversions/PyKMIP.svg
  :target: https://github.com/OpenKMIP/PyKMIP
