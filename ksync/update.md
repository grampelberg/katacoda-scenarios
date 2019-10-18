Open up the code in your favorite editor. For demo purposes, this assumes you've configured EDITOR. You really can open it however you'd like though.

`nano ksync/server.py`{{execute}}

Add a new key to the JSON response by editing the return value.

```
return jsonify({
    "ksync": True,
    "restart": LAST_RESTART,
    "pod": os.environ.get('POD_NAME'),
    "files": file_list,
})
```

Take a look at the status now. It should be reloading the remote container.

`ksync get`{{execute}}

After a second or two, hit the container again and you should see your new response.

`curl localhost:8080`{{execute}}
