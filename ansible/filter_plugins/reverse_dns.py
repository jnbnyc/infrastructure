#!/usr/bin/env python3
class FilterModule(object):
    ''' A filter to reverse a DNS compliant string. '''
    def filters(self):
        return {
            'reverseDNS': self.reverse_dns
        }

    def reverse_dns(self, input_string):
        domain_levels = input_string.split('.')
        domain_levels.reverse()
        return ".".join(domain_levels)
