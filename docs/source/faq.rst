Frequently asked questions
===========================
This document contain questions that I think people would ask.

You should check out the :ref:`discord.py FAQ <dpy:faq>` too if you haven't. 
No point in repeating the same information in 2 different places

How to write a discord.py bot?
-------------------------------
The :ref:`discord.py <dpy:intro>` docs is helpful for that.

Why do I need to pass ``ctx`` or ``bot`` to everything?
--------------------------------------------------------
I haven't figured out a way to do this automatically. 
I'll update this section once I found a method

What are the ``Optional`` and ``Union`` types?
--------------------------------------------------
They are helper types essentially. :class:`typing.Optional` means that that method or 
function returns or accepts either the item(s) in ``[]`` s or :data:`None`. 

:class:`typing.Union` means that that method accepts or returns types listed in the ``[]`` s

Example:

.. code:: python

    typing.Union[Client, AutoShardedClient]
    # or
    Union[Client, AutoShardedClient]

means one of ``Client`` or ``AutoShardedClient`` or their subclasses is required.

My question isn't documented here!
-----------------------------------
Refer to `the questions section of this doc <https://github.com/kcomain/dpextras/blob/develop/contributing.md#ive-got-questions>`_

This package sucks!
--------------------
I'm sorry, you can either `create a pr <https://github.com/kcomain/dpextras/blob/develop/contributing.md#this-code-is-garbage>`_ 
to improve the code or `file a feature request 
<https://github.com/kcomain/dpextras/blob/develop/contributing.md#ive-got-some-ideasstuff-that-you-can-put-in-this>`_.