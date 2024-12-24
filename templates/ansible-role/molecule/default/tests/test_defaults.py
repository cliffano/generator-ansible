import pytest

def test_upper_reverse_content(host):

    content_file = host.file("/tmp/generator-ansible-ansible-role-upper-reverse-content.txt")
    assert content_file.exists
    assert content_file.is_file
    assert content_file.mode == 0o644
    assert content_file.content_string == "Text: Hello World. Reverse: True. Transformation: upper.\n"
