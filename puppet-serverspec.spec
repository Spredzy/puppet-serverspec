Name:           puppet-serverspec
Version:        0.1.0
Release:        1%{?dist}
Summary:        A puppet module that installs and configure serverspec

Group:          System Environment/Libraries
License:        Apache v2
URL:            http://forge.puppetlabs.com/yguenane/serverspec
Source0:        http://forge.puppetlabs.com/yguenane/serverspec/%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Requires:       puppet

%description
This Puppet module allows you to configure serverspec

%prep
%setup -n yguenane-serverspec-%{version}

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/etc/puppet/modules/serverspec/
cp -r lib manifests $RPM_BUILD_ROOT/etc/puppet/modules/serverspec/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{_sysconfdir}/puppet/modules/*
%doc CHANGELOG README LICENSE

%changelog
* Sun Jan 4 2014  Yanis Guenane  <yguenane@gmail.com>  0.1.0
- Initial version

