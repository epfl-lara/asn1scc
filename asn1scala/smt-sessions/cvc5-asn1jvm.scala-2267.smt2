; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57402 () Bool)

(assert start!57402)

(declare-fun b!263061 () Bool)

(declare-fun e!183297 () Bool)

(declare-fun e!183293 () Bool)

(assert (=> b!263061 (= e!183297 (not e!183293))))

(declare-fun res!220108 () Bool)

(assert (=> b!263061 (=> res!220108 e!183293)))

(declare-fun e!183292 () Bool)

(assert (=> b!263061 (= res!220108 e!183292)))

(declare-fun res!220111 () Bool)

(assert (=> b!263061 (=> (not res!220111) (not e!183292))))

(declare-datatypes ((array!14678 0))(
  ( (array!14679 (arr!7393 (Array (_ BitVec 32) (_ BitVec 8))) (size!6406 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11626 0))(
  ( (BitStream!11627 (buf!6874 array!14678) (currentByte!12726 (_ BitVec 32)) (currentBit!12721 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11626)

(assert (=> b!263061 (= res!220111 (not (= (size!6406 (buf!6874 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11626)

(declare-fun isPrefixOf!0 (BitStream!11626 BitStream!11626) Bool)

(assert (=> b!263061 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18755 0))(
  ( (Unit!18756) )
))
(declare-fun lt!404603 () Unit!18755)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11626) Unit!18755)

(assert (=> b!263061 (= lt!404603 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404602 () BitStream!11626)

(assert (=> b!263061 (isPrefixOf!0 lt!404602 lt!404602)))

(declare-fun lt!404599 () Unit!18755)

(assert (=> b!263061 (= lt!404599 (lemmaIsPrefixRefl!0 lt!404602))))

(assert (=> b!263061 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404600 () Unit!18755)

(assert (=> b!263061 (= lt!404600 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263061 (= lt!404602 (BitStream!11627 (buf!6874 w2!580) (currentByte!12726 w1!584) (currentBit!12721 w1!584)))))

(declare-fun b!263062 () Bool)

(declare-fun e!183296 () Bool)

(declare-fun array_inv!6130 (array!14678) Bool)

(assert (=> b!263062 (= e!183296 (array_inv!6130 (buf!6874 w2!580)))))

(declare-fun res!220109 () Bool)

(assert (=> start!57402 (=> (not res!220109) (not e!183297))))

(assert (=> start!57402 (= res!220109 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57402 e!183297))

(declare-fun e!183295 () Bool)

(declare-fun inv!12 (BitStream!11626) Bool)

(assert (=> start!57402 (and (inv!12 w1!584) e!183295)))

(assert (=> start!57402 (and (inv!12 w2!580) e!183296)))

(declare-fun b!263063 () Bool)

(assert (=> b!263063 (= e!183295 (array_inv!6130 (buf!6874 w1!584)))))

(declare-fun b!263064 () Bool)

(declare-fun res!220110 () Bool)

(assert (=> b!263064 (=> res!220110 e!183293)))

(assert (=> b!263064 (= res!220110 (= (size!6406 (buf!6874 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263065 () Bool)

(assert (=> b!263065 (= e!183293 true)))

(declare-fun lt!404601 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263065 (= lt!404601 (bitIndex!0 (size!6406 (buf!6874 w1!584)) (currentByte!12726 w1!584) (currentBit!12721 w1!584)))))

(declare-fun b!263066 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14678 array!14678 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263066 (= e!183292 (not (arrayBitRangesEq!0 (buf!6874 w1!584) (buf!6874 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6406 (buf!6874 w1!584)) (currentByte!12726 w1!584) (currentBit!12721 w1!584)))))))

(assert (= (and start!57402 res!220109) b!263061))

(assert (= (and b!263061 res!220111) b!263066))

(assert (= (and b!263061 (not res!220108)) b!263064))

(assert (= (and b!263064 (not res!220110)) b!263065))

(assert (= start!57402 b!263063))

(assert (= start!57402 b!263062))

(declare-fun m!393275 () Bool)

(assert (=> b!263063 m!393275))

(declare-fun m!393277 () Bool)

(assert (=> b!263066 m!393277))

(assert (=> b!263066 m!393277))

(declare-fun m!393279 () Bool)

(assert (=> b!263066 m!393279))

(assert (=> b!263065 m!393277))

(declare-fun m!393281 () Bool)

(assert (=> b!263062 m!393281))

(declare-fun m!393283 () Bool)

(assert (=> start!57402 m!393283))

(declare-fun m!393285 () Bool)

(assert (=> start!57402 m!393285))

(declare-fun m!393287 () Bool)

(assert (=> start!57402 m!393287))

(declare-fun m!393289 () Bool)

(assert (=> b!263061 m!393289))

(declare-fun m!393291 () Bool)

(assert (=> b!263061 m!393291))

(declare-fun m!393293 () Bool)

(assert (=> b!263061 m!393293))

(declare-fun m!393295 () Bool)

(assert (=> b!263061 m!393295))

(declare-fun m!393297 () Bool)

(assert (=> b!263061 m!393297))

(declare-fun m!393299 () Bool)

(assert (=> b!263061 m!393299))

(push 1)

(assert (not b!263063))

(assert (not b!263062))

(assert (not start!57402))

(assert (not b!263061))

(assert (not b!263066))

(assert (not b!263065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

