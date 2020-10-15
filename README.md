# dexter2305/min-ubuntu-dropbox

## DESCRIPTION:
Forked from  Brian Lau's [Ubuntu Dropbox](https://github.com/bnutz/min-ubuntu-dropbox) and added a couple flexibilities about permission management over the config and data folder of dropbox. 

## EXAMPLE USAGE:
```
. ./run.env
docker-compose up -d
```

## DOCKER PARAMETERS:
| Default Parameters | Function |
| ------------------ | -------- |
| `-e UID=1000`   | UID of Dropbox (current) user. |
| `-e GID=1000`   | GID of Dropbox (current) user. |
| `-v ${pwd}/dbox/drive:/dbox/Dropbox`    | Path to Dropbox folder on host machine. |
| `-v ${pwd}/dbox/config:/dbox/.dropbox`  | Path to persistent Dropbox settings folder on host machine. |


## INITIAL SETUP
At first run, the container will download the latest version of the Dropbox Linux client.

Run `docker logs dropbox -f` after starting the container and wait until you see messages similar to:

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=(xxxxx-random-nonce-value-xxxxx) to link this device.
```

Open the link in a browser to authorise the client and link the container to your Dropbox.

You should then see in the docker log:
```
This computer is now linked to Dropbox. Welcome *your-name*
```

There is no updater script, so to update the Dropbox client; remove the container and add it again. The persistent config folder will ensure you don't need to relink your account again.

## NOTES:
* Dropbox commands should be run as the `dbox` user:

  ```shell
  docker exec -it -u dbox dropbox dropbox-cli help
  ```

  Any custom configuration that is supported by the [dropbox-cli](https://help.dropbox.com/installs-integrations/desktop/linux-commands#commands) can be modified this way.

* The current Dropbox status can be seen in the docker log. It refreshes every five seconds and only outputs data when there are any changes.

  ```shell
  docker-compose logs dropbox -f
  ```
