package workerapi

import (
	"encoding/json"
	"github.com/hanc00l/nemo_go/pkg/task/pocscan"
	"github.com/hanc00l/nemo_go/pkg/task/serverapi"
	"testing"
)

func TestPocsuite(t *testing.T) {
	config := pocscan.Config{
		Target:  "172.16.80.1:7001,127.0.0.1,192.168.3.223,192.168.120.160",
		PocFile: "weblogic-console-2020-14882_all_rce.py",
		CmdBin:  "pocsuite",
	}
	configJSON, err := json.Marshal(config)
	if err != nil {
		t.Log(err)
	}
	result, err := serverapi.NewTask("pocscan", string(configJSON), "")
	t.Log(result, err)
}

func TestXray(t *testing.T) {
	config := pocscan.Config{
		Target:  "172.16.80.1:7001,127.0.0.1:7001,192.168.120.160:7001",
		PocFile: "weblogic-cve-2020-14750.yml",
		CmdBin:  "xray",
	}
	configJSON, err := json.Marshal(config)
	if err != nil {
		t.Log(err)
	}
	result, err := serverapi.NewTask("pocscan", string(configJSON), "")
	t.Log(result, err)
}
