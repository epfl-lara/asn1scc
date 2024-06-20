; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57406 () Bool)

(assert start!57406)

(declare-fun b!263097 () Bool)

(declare-fun res!220133 () Bool)

(declare-fun e!183336 () Bool)

(assert (=> b!263097 (=> res!220133 e!183336)))

(declare-datatypes ((array!14682 0))(
  ( (array!14683 (arr!7395 (Array (_ BitVec 32) (_ BitVec 8))) (size!6408 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11630 0))(
  ( (BitStream!11631 (buf!6876 array!14682) (currentByte!12728 (_ BitVec 32)) (currentBit!12723 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11630)

(assert (=> b!263097 (= res!220133 (= (size!6408 (buf!6876 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263098 () Bool)

(declare-fun e!183333 () Bool)

(declare-fun w2!580 () BitStream!11630)

(declare-fun array_inv!6132 (array!14682) Bool)

(assert (=> b!263098 (= e!183333 (array_inv!6132 (buf!6876 w2!580)))))

(declare-fun b!263099 () Bool)

(assert (=> b!263099 (= e!183336 true)))

(declare-fun lt!404633 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263099 (= lt!404633 (bitIndex!0 (size!6408 (buf!6876 w1!584)) (currentByte!12728 w1!584) (currentBit!12723 w1!584)))))

(declare-fun res!220135 () Bool)

(declare-fun e!183335 () Bool)

(assert (=> start!57406 (=> (not res!220135) (not e!183335))))

(declare-fun isPrefixOf!0 (BitStream!11630 BitStream!11630) Bool)

(assert (=> start!57406 (= res!220135 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57406 e!183335))

(declare-fun e!183338 () Bool)

(declare-fun inv!12 (BitStream!11630) Bool)

(assert (=> start!57406 (and (inv!12 w1!584) e!183338)))

(assert (=> start!57406 (and (inv!12 w2!580) e!183333)))

(declare-fun b!263100 () Bool)

(assert (=> b!263100 (= e!183338 (array_inv!6132 (buf!6876 w1!584)))))

(declare-fun b!263101 () Bool)

(assert (=> b!263101 (= e!183335 (not e!183336))))

(declare-fun res!220132 () Bool)

(assert (=> b!263101 (=> res!220132 e!183336)))

(declare-fun e!183334 () Bool)

(assert (=> b!263101 (= res!220132 e!183334)))

(declare-fun res!220134 () Bool)

(assert (=> b!263101 (=> (not res!220134) (not e!183334))))

(assert (=> b!263101 (= res!220134 (not (= (size!6408 (buf!6876 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263101 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18759 0))(
  ( (Unit!18760) )
))
(declare-fun lt!404632 () Unit!18759)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11630) Unit!18759)

(assert (=> b!263101 (= lt!404632 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404630 () BitStream!11630)

(assert (=> b!263101 (isPrefixOf!0 lt!404630 lt!404630)))

(declare-fun lt!404631 () Unit!18759)

(assert (=> b!263101 (= lt!404631 (lemmaIsPrefixRefl!0 lt!404630))))

(assert (=> b!263101 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404629 () Unit!18759)

(assert (=> b!263101 (= lt!404629 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263101 (= lt!404630 (BitStream!11631 (buf!6876 w2!580) (currentByte!12728 w1!584) (currentBit!12723 w1!584)))))

(declare-fun b!263102 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14682 array!14682 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263102 (= e!183334 (not (arrayBitRangesEq!0 (buf!6876 w1!584) (buf!6876 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6408 (buf!6876 w1!584)) (currentByte!12728 w1!584) (currentBit!12723 w1!584)))))))

(assert (= (and start!57406 res!220135) b!263101))

(assert (= (and b!263101 res!220134) b!263102))

(assert (= (and b!263101 (not res!220132)) b!263097))

(assert (= (and b!263097 (not res!220133)) b!263099))

(assert (= start!57406 b!263100))

(assert (= start!57406 b!263098))

(declare-fun m!393327 () Bool)

(assert (=> b!263100 m!393327))

(declare-fun m!393329 () Bool)

(assert (=> b!263101 m!393329))

(declare-fun m!393331 () Bool)

(assert (=> b!263101 m!393331))

(declare-fun m!393333 () Bool)

(assert (=> b!263101 m!393333))

(declare-fun m!393335 () Bool)

(assert (=> b!263101 m!393335))

(declare-fun m!393337 () Bool)

(assert (=> b!263101 m!393337))

(declare-fun m!393339 () Bool)

(assert (=> b!263101 m!393339))

(declare-fun m!393341 () Bool)

(assert (=> b!263102 m!393341))

(assert (=> b!263102 m!393341))

(declare-fun m!393343 () Bool)

(assert (=> b!263102 m!393343))

(declare-fun m!393345 () Bool)

(assert (=> b!263098 m!393345))

(declare-fun m!393347 () Bool)

(assert (=> start!57406 m!393347))

(declare-fun m!393349 () Bool)

(assert (=> start!57406 m!393349))

(declare-fun m!393351 () Bool)

(assert (=> start!57406 m!393351))

(assert (=> b!263099 m!393341))

(push 1)

(assert (not b!263100))

(assert (not b!263098))

(assert (not b!263101))

(assert (not b!263099))

(assert (not b!263102))

(assert (not start!57406))

(check-sat)

