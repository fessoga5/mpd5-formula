# vim: sts=2 ts=2 sw=2 ai et
#Speedtest.net test
{% if grains['os'] == 'FreeBSD' %}
mpd5:
  pkg.installed
  service:
    - running
    - enable: True
    - watch:
      - file: /usr/local/etc/mpd5/mpd.conf

/usr/local/etc/mpd5/mpd.conf:
  file.managed:
    - mode: 640
    - source: salt://mpd5/mpd.conf
    - template: jinja

{% endif %}
