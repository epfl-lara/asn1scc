; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57400 () Bool)

(assert start!57400)

(declare-fun b!263043 () Bool)

(declare-fun e!183272 () Bool)

(declare-datatypes ((array!14676 0))(
  ( (array!14677 (arr!7392 (Array (_ BitVec 32) (_ BitVec 8))) (size!6405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11624 0))(
  ( (BitStream!11625 (buf!6873 array!14676) (currentByte!12725 (_ BitVec 32)) (currentBit!12720 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11624)

(declare-fun w2!580 () BitStream!11624)

(declare-fun arrayBitRangesEq!0 (array!14676 array!14676 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263043 (= e!183272 (not (arrayBitRangesEq!0 (buf!6873 w1!584) (buf!6873 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6405 (buf!6873 w1!584)) (currentByte!12725 w1!584) (currentBit!12720 w1!584)))))))

(declare-fun res!220098 () Bool)

(declare-fun e!183275 () Bool)

(assert (=> start!57400 (=> (not res!220098) (not e!183275))))

(declare-fun isPrefixOf!0 (BitStream!11624 BitStream!11624) Bool)

(assert (=> start!57400 (= res!220098 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57400 e!183275))

(declare-fun e!183270 () Bool)

(declare-fun inv!12 (BitStream!11624) Bool)

(assert (=> start!57400 (and (inv!12 w1!584) e!183270)))

(declare-fun e!183271 () Bool)

(assert (=> start!57400 (and (inv!12 w2!580) e!183271)))

(declare-fun b!263044 () Bool)

(declare-fun e!183276 () Bool)

(assert (=> b!263044 (= e!183275 (not e!183276))))

(declare-fun res!220099 () Bool)

(assert (=> b!263044 (=> res!220099 e!183276)))

(assert (=> b!263044 (= res!220099 e!183272)))

(declare-fun res!220096 () Bool)

(assert (=> b!263044 (=> (not res!220096) (not e!183272))))

(assert (=> b!263044 (= res!220096 (not (= (size!6405 (buf!6873 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263044 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18753 0))(
  ( (Unit!18754) )
))
(declare-fun lt!404584 () Unit!18753)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11624) Unit!18753)

(assert (=> b!263044 (= lt!404584 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404585 () BitStream!11624)

(assert (=> b!263044 (isPrefixOf!0 lt!404585 lt!404585)))

(declare-fun lt!404588 () Unit!18753)

(assert (=> b!263044 (= lt!404588 (lemmaIsPrefixRefl!0 lt!404585))))

(assert (=> b!263044 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404586 () Unit!18753)

(assert (=> b!263044 (= lt!404586 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263044 (= lt!404585 (BitStream!11625 (buf!6873 w2!580) (currentByte!12725 w1!584) (currentBit!12720 w1!584)))))

(declare-fun b!263045 () Bool)

(declare-fun res!220097 () Bool)

(assert (=> b!263045 (=> res!220097 e!183276)))

(assert (=> b!263045 (= res!220097 (= (size!6405 (buf!6873 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263046 () Bool)

(declare-fun array_inv!6129 (array!14676) Bool)

(assert (=> b!263046 (= e!183271 (array_inv!6129 (buf!6873 w2!580)))))

(declare-fun b!263047 () Bool)

(assert (=> b!263047 (= e!183276 true)))

(declare-fun lt!404587 () (_ BitVec 64))

(assert (=> b!263047 (= lt!404587 (bitIndex!0 (size!6405 (buf!6873 w1!584)) (currentByte!12725 w1!584) (currentBit!12720 w1!584)))))

(declare-fun b!263048 () Bool)

(assert (=> b!263048 (= e!183270 (array_inv!6129 (buf!6873 w1!584)))))

(assert (= (and start!57400 res!220098) b!263044))

(assert (= (and b!263044 res!220096) b!263043))

(assert (= (and b!263044 (not res!220099)) b!263045))

(assert (= (and b!263045 (not res!220097)) b!263047))

(assert (= start!57400 b!263048))

(assert (= start!57400 b!263046))

(declare-fun m!393249 () Bool)

(assert (=> start!57400 m!393249))

(declare-fun m!393251 () Bool)

(assert (=> start!57400 m!393251))

(declare-fun m!393253 () Bool)

(assert (=> start!57400 m!393253))

(declare-fun m!393255 () Bool)

(assert (=> b!263048 m!393255))

(declare-fun m!393257 () Bool)

(assert (=> b!263046 m!393257))

(declare-fun m!393259 () Bool)

(assert (=> b!263043 m!393259))

(assert (=> b!263043 m!393259))

(declare-fun m!393261 () Bool)

(assert (=> b!263043 m!393261))

(declare-fun m!393263 () Bool)

(assert (=> b!263044 m!393263))

(declare-fun m!393265 () Bool)

(assert (=> b!263044 m!393265))

(declare-fun m!393267 () Bool)

(assert (=> b!263044 m!393267))

(declare-fun m!393269 () Bool)

(assert (=> b!263044 m!393269))

(declare-fun m!393271 () Bool)

(assert (=> b!263044 m!393271))

(declare-fun m!393273 () Bool)

(assert (=> b!263044 m!393273))

(assert (=> b!263047 m!393259))

(push 1)

