---
title: "Security Considerations"
keywords: deploy security
#tags: []
sidebar: home_sidebar
permalink: deployment_security.html
toc: true
---

## Firewalls and Security Software

The perfSONAR Toolkit utilizes a number of tools the help protect
against attacks on the system. Some of these tools include:

 * A default set of firewalld rules that only allow connections to
   ports required by perfSONAR tools.

 * Inclusion of the [fail2ban](http://www.fail2ban.org) intrusion
   detection system (IDS) to log and stanch suspicious activity such
   as brute-force SSH attacks

None of these solutions will protect your host from all kinds of
attacks, so best common practices and good sense should be used when
administering your host.

In addition to tools like above it’s important to [keep your host
up-to-date](http://docs.perfsonar.net/manage_update.html) with the
latest packages and to watch the [mailing
lists](about_contact.html#mailing-lists.html) for important security
announcements.


## Default Firewall Rules and Requirements

For perfSONAR to function properly, the following ports and services
must be open.  Note that all of these are provided and managed by the
`perfsonar-toolkit-security` package.

| Tool or Service | TCP | UDP |
| --------------- | --- | --- |
| ICMP | | |
| iperf2 | 5001 | |
| iperf3 | 5201 | |
| Lookup Service | 8090 | |
| Management Interfaces | 80, 443 | |
| Nuttcp | 5000, 5101 | |
| NTP | 123 | |
| OWAMP (control) | 861 | |
| OWAMP (testing) | 8760-9960 | 8760-9960 |
| Simplestream | 5890-5900 | |
| Traceroute | | 33434-33634 |
| TWAMP (control) | 862 | |
| TWAMP (testing) | 18760-19960 | 18760-19960 |



## Adding Your Own Firewall Rules

`firewalld` organizes its rules into “zones” and makes it more
difficult to distinguish perfSONAR rules from custom rules.  If you
add a standard service to the zone it will get overwritten next time
the `perfsonar-toolkit-security` package upgrades.  We recommend
looking at firewalld [rich
rules](https://fedoraproject.org/wiki/Features/FirewalldRichLanguage)
for adding custom rules.

For more information see [the Firewalld
documentation](http://www.firewalld.org/documentation/).


## Fail2ban Intrusion Detection System

By default, the perfSONAR Toolkit installs and configures the
[fail2ban](http://www.fail2ban.org) Intrusion Detection System (IDS).
This software will log suspicious activity such as a rapid succession
of failed SSH login attempts in `/var/log/secure`.  By default it will
not act to mitigate any attempts, only log them (though the default
firewall rules do SSH throttling).  If you would like to change this
default behavior to send email or block unwanted intrusions, see the
configuration file `/etc/fail2ban/jail.conf` and the [fail2ban
manual](http://www.fail2ban.org/wiki/index.php/MANUAL_0_8).


## Limiting tests to Research and Education Networks

ESnet provides a file containing all R&E subnets, which is updated
nightly.  Instructions on how to download this file and configure
pScheduler to use it are described
[here](http://docs.perfsonar.net/manage_limits.html).


## Managing Login Access

perfSONAR nodes are meant to be used, both by local users and the
public at large, to perform a variety of network tests. The open
access policy is at odds with ways to mitigate the risk of exposing
functionality to those that would cause harm. The following is a
possible approach for managing access to the host:

 * In cases where console access is available either directly or
   indirectly, `sshd` can be turned off completely to prevent remote
   access to the machine.

 * If `sshd` is turned on, consider using a jump host setup wherein
    access to the perfSONAR node can only be accomplished through a
    single (or set) of trusted hosts. This type of restriction can be
    implemented with `firewalld`.
