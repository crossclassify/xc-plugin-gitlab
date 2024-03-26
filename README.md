
# CrossClassify Gitlab Plugin

secure your self-hosted gitlab using [crossclassify](https://www.crossclassify.com/) gitlab plugin

## Dependencies
you need to have gitlab community edition installed on you'r machine
if not you can install it using 
```
$ curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
```

```
$ sudo EXTERNAL_URL="http://your-domain.com" apt install gitlab-ee
```

```
$ sudo gitlab-ctl reconfigure
```

## Installation

###  Debian/Ubuntu
```bash
$ wget https://ryan-gitlab-plugin.s3.ap-southeast-2.amazonaws.com/cross-classify-gitlab.deb

$ dpkg -i cross-classify-gitlab.deb
```

### other distributions
```
$ wget https://ryan-gitlab-plugin.s3.ap-southeast-2.amazonaws.com/install.sh
$ bash install.sh
```

## Unistall
### Debian/Ubuntu
```
$ dpkg -r cross-classify-gitlab
```

### other distributions
```
$ wget https://ryan-gitlab-plugin.s3.ap-southeast-2.amazonaws.com/uninstall.sh
$ bash uninstall.sh
```



