; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57408 () Bool)

(assert start!57408)

(declare-fun res!220144 () Bool)

(declare-fun e!183355 () Bool)

(assert (=> start!57408 (=> (not res!220144) (not e!183355))))

(declare-datatypes ((array!14684 0))(
  ( (array!14685 (arr!7396 (Array (_ BitVec 32) (_ BitVec 8))) (size!6409 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11632 0))(
  ( (BitStream!11633 (buf!6877 array!14684) (currentByte!12729 (_ BitVec 32)) (currentBit!12724 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11632)

(declare-fun w2!580 () BitStream!11632)

(declare-fun isPrefixOf!0 (BitStream!11632 BitStream!11632) Bool)

(assert (=> start!57408 (= res!220144 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57408 e!183355))

(declare-fun e!183357 () Bool)

(declare-fun inv!12 (BitStream!11632) Bool)

(assert (=> start!57408 (and (inv!12 w1!584) e!183357)))

(declare-fun e!183359 () Bool)

(assert (=> start!57408 (and (inv!12 w2!580) e!183359)))

(declare-fun b!263115 () Bool)

(declare-fun e!183354 () Bool)

(assert (=> b!263115 (= e!183354 true)))

(declare-fun lt!404648 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263115 (= lt!404648 (bitIndex!0 (size!6409 (buf!6877 w1!584)) (currentByte!12729 w1!584) (currentBit!12724 w1!584)))))

(declare-fun b!263116 () Bool)

(declare-fun array_inv!6133 (array!14684) Bool)

(assert (=> b!263116 (= e!183357 (array_inv!6133 (buf!6877 w1!584)))))

(declare-fun b!263117 () Bool)

(declare-fun e!183356 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14684 array!14684 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263117 (= e!183356 (not (arrayBitRangesEq!0 (buf!6877 w1!584) (buf!6877 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6409 (buf!6877 w1!584)) (currentByte!12729 w1!584) (currentBit!12724 w1!584)))))))

(declare-fun b!263118 () Bool)

(declare-fun res!220146 () Bool)

(assert (=> b!263118 (=> res!220146 e!183354)))

(assert (=> b!263118 (= res!220146 (= (size!6409 (buf!6877 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263119 () Bool)

(assert (=> b!263119 (= e!183355 (not e!183354))))

(declare-fun res!220145 () Bool)

(assert (=> b!263119 (=> res!220145 e!183354)))

(assert (=> b!263119 (= res!220145 e!183356)))

(declare-fun res!220147 () Bool)

(assert (=> b!263119 (=> (not res!220147) (not e!183356))))

(assert (=> b!263119 (= res!220147 (not (= (size!6409 (buf!6877 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263119 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18761 0))(
  ( (Unit!18762) )
))
(declare-fun lt!404644 () Unit!18761)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11632) Unit!18761)

(assert (=> b!263119 (= lt!404644 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404645 () BitStream!11632)

(assert (=> b!263119 (isPrefixOf!0 lt!404645 lt!404645)))

(declare-fun lt!404647 () Unit!18761)

(assert (=> b!263119 (= lt!404647 (lemmaIsPrefixRefl!0 lt!404645))))

(assert (=> b!263119 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404646 () Unit!18761)

(assert (=> b!263119 (= lt!404646 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263119 (= lt!404645 (BitStream!11633 (buf!6877 w2!580) (currentByte!12729 w1!584) (currentBit!12724 w1!584)))))

(declare-fun b!263120 () Bool)

(assert (=> b!263120 (= e!183359 (array_inv!6133 (buf!6877 w2!580)))))

(assert (= (and start!57408 res!220144) b!263119))

(assert (= (and b!263119 res!220147) b!263117))

(assert (= (and b!263119 (not res!220145)) b!263118))

(assert (= (and b!263118 (not res!220146)) b!263115))

(assert (= start!57408 b!263116))

(assert (= start!57408 b!263120))

(declare-fun m!393353 () Bool)

(assert (=> start!57408 m!393353))

(declare-fun m!393355 () Bool)

(assert (=> start!57408 m!393355))

(declare-fun m!393357 () Bool)

(assert (=> start!57408 m!393357))

(declare-fun m!393359 () Bool)

(assert (=> b!263120 m!393359))

(declare-fun m!393361 () Bool)

(assert (=> b!263116 m!393361))

(declare-fun m!393363 () Bool)

(assert (=> b!263117 m!393363))

(assert (=> b!263117 m!393363))

(declare-fun m!393365 () Bool)

(assert (=> b!263117 m!393365))

(assert (=> b!263115 m!393363))

(declare-fun m!393367 () Bool)

(assert (=> b!263119 m!393367))

(declare-fun m!393369 () Bool)

(assert (=> b!263119 m!393369))

(declare-fun m!393371 () Bool)

(assert (=> b!263119 m!393371))

(declare-fun m!393373 () Bool)

(assert (=> b!263119 m!393373))

(declare-fun m!393375 () Bool)

(assert (=> b!263119 m!393375))

(declare-fun m!393377 () Bool)

(assert (=> b!263119 m!393377))

(push 1)

(assert (not b!263116))

(assert (not b!263115))

(assert (not b!263119))

(assert (not b!263120))

(assert (not b!263117))

(assert (not start!57408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

