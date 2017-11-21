package main

import (
    "strings";
    "os/exec";
    "os";
    "io/ioutil";
    "fmt";
)

type NameNode struct {
    childs map[string]*NameNode;
}

func NewNameNode() *NameNode {
    nn := new(NameNode)
    nn.childs = make(map[string]*NameNode);
    return nn;
}

func PrintNameGroup(nameNode *NameNode, isRoot bool) {
        if (len(nameNode.childs) == 1) {
            for containerNameSeg, containerNameNode := range nameNode.childs {
                if !isRoot {
                    fmt.Print("-");
                }
                fmt.Print(containerNameSeg);
                PrintNameGroup(containerNameNode, false);
            }
        } else if (len(nameNode.childs) > 1) {
            if (!isRoot) {
                fmt.Print("[");
            }
            isFirst := true;
            for containerNameSeg, containerNameNode := range nameNode.childs {
                if !isFirst {
                    fmt.Print(" ");
                }
                isFirst = false;
                fmt.Print(containerNameSeg);
                PrintNameGroup(containerNameNode, false);
            }
            if (!isRoot) {
                fmt.Print("]");
            }
        }
    }


func main() {
    cmd := exec.Command("docker", "ps", "--format", "{{.Names}}")
    stdout, _ := cmd.StdoutPipe()
    cmd.Start()
    outputBuf, err := ioutil.ReadAll(stdout);
    if err != nil {
        os.Exit(-1);
    }
    output := string(outputBuf[:]);
    containerNames := strings.Split(output, "\n")
    containerNameRoot := NewNameNode();
    for _, containerName := range containerNames {
        containerName = strings.TrimSpace(containerName);
        containerName = strings.ToUpper(containerName);
        if strings.Compare(containerName, "") == 0 {
            continue;
        }
        containerNameSegs := []string{};
        for _, containerNameSeg0 := range strings.Split(containerName, "_") {
            for _, containerNameSeg1 := range strings.Split(containerNameSeg0, "-") {
                if strings.Compare(containerNameSeg1, "") != 0 {
                    containerNameSegs = append(containerNameSegs, containerNameSeg1);
                }
            }
        }
        curNameNode := containerNameRoot;
        for _, containerNameSeg := range containerNameSegs {
            nextNameNode, ok := curNameNode.childs[containerNameSeg];
            if ok {
                curNameNode = nextNameNode;
            } else {
                nextNameNode = NewNameNode();
                curNameNode.childs[containerNameSeg] = nextNameNode;
                curNameNode = nextNameNode;
            }
        }
    }
    PrintNameGroup(containerNameRoot, true);
    fmt.Println("");
    err = cmd.Wait();
    if err != nil {
        os.Exit(-1);
    }
}
