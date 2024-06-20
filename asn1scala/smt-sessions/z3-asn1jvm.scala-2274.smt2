; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57578 () Bool)

(assert start!57578)

(declare-fun b!264053 () Bool)

(declare-fun e!184227 () Bool)

(declare-datatypes ((array!14731 0))(
  ( (array!14732 (arr!7415 (Array (_ BitVec 32) (_ BitVec 8))) (size!6428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11670 0))(
  ( (BitStream!11671 (buf!6896 array!14731) (currentByte!12760 (_ BitVec 32)) (currentBit!12755 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11670)

(declare-fun array_inv!6152 (array!14731) Bool)

(assert (=> b!264053 (= e!184227 (array_inv!6152 (buf!6896 w2!580)))))

(declare-fun b!264054 () Bool)

(declare-fun e!184236 () Bool)

(assert (=> b!264054 (= e!184236 true)))

(declare-fun lt!405412 () BitStream!11670)

(declare-fun isPrefixOf!0 (BitStream!11670 BitStream!11670) Bool)

(assert (=> b!264054 (isPrefixOf!0 lt!405412 w2!580)))

(declare-datatypes ((Unit!18815 0))(
  ( (Unit!18816) )
))
(declare-fun lt!405413 () Unit!18815)

(declare-fun w1!584 () BitStream!11670)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11670 BitStream!11670 BitStream!11670) Unit!18815)

(assert (=> b!264054 (= lt!405413 (lemmaIsPrefixTransitive!0 lt!405412 w1!584 w2!580))))

(declare-fun b!264055 () Bool)

(declare-fun e!184228 () Unit!18815)

(declare-fun lt!405418 () Unit!18815)

(assert (=> b!264055 (= e!184228 lt!405418)))

(declare-fun lt!405414 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264055 (= lt!405414 (bitIndex!0 (size!6428 (buf!6896 w1!584)) (currentByte!12760 w1!584) (currentBit!12755 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14731 array!14731 (_ BitVec 64) (_ BitVec 64)) Unit!18815)

(assert (=> b!264055 (= lt!405418 (arrayBitRangesEqSymmetric!0 (buf!6896 w1!584) (buf!6896 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405414))))

(declare-fun arrayBitRangesEq!0 (array!14731 array!14731 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!264055 (arrayBitRangesEq!0 (buf!6896 w2!580) (buf!6896 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405414)))

(declare-fun b!264056 () Bool)

(declare-fun e!184234 () Bool)

(assert (=> b!264056 (= e!184234 (array_inv!6152 (buf!6896 w1!584)))))

(declare-fun res!220800 () Bool)

(declare-fun e!184235 () Bool)

(assert (=> start!57578 (=> (not res!220800) (not e!184235))))

(assert (=> start!57578 (= res!220800 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57578 e!184235))

(declare-fun inv!12 (BitStream!11670) Bool)

(assert (=> start!57578 (and (inv!12 w1!584) e!184234)))

(assert (=> start!57578 (and (inv!12 w2!580) e!184227)))

(declare-fun b!264057 () Bool)

(declare-fun e!184233 () Bool)

(assert (=> b!264057 (= e!184233 e!184236)))

(declare-fun res!220799 () Bool)

(assert (=> b!264057 (=> res!220799 e!184236)))

(declare-fun e!184231 () Bool)

(assert (=> b!264057 (= res!220799 e!184231)))

(declare-fun res!220796 () Bool)

(assert (=> b!264057 (=> (not res!220796) (not e!184231))))

(assert (=> b!264057 (= res!220796 (not (= (size!6428 (buf!6896 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405417 () Unit!18815)

(assert (=> b!264057 (= lt!405417 e!184228)))

(declare-fun c!12090 () Bool)

(assert (=> b!264057 (= c!12090 (not (= (size!6428 (buf!6896 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264058 () Bool)

(declare-fun Unit!18817 () Unit!18815)

(assert (=> b!264058 (= e!184228 Unit!18817)))

(declare-fun b!264059 () Bool)

(assert (=> b!264059 (= e!184231 (not (arrayBitRangesEq!0 (buf!6896 w2!580) (buf!6896 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6428 (buf!6896 w1!584)) (currentByte!12760 w1!584) (currentBit!12755 w1!584)))))))

(declare-fun b!264060 () Bool)

(assert (=> b!264060 (= e!184235 (not e!184233))))

(declare-fun res!220801 () Bool)

(assert (=> b!264060 (=> res!220801 e!184233)))

(declare-fun e!184230 () Bool)

(assert (=> b!264060 (= res!220801 e!184230)))

(declare-fun res!220797 () Bool)

(assert (=> b!264060 (=> (not res!220797) (not e!184230))))

(assert (=> b!264060 (= res!220797 (not (= (size!6428 (buf!6896 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264060 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405415 () Unit!18815)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11670) Unit!18815)

(assert (=> b!264060 (= lt!405415 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264060 (isPrefixOf!0 lt!405412 lt!405412)))

(declare-fun lt!405419 () Unit!18815)

(assert (=> b!264060 (= lt!405419 (lemmaIsPrefixRefl!0 lt!405412))))

(assert (=> b!264060 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405416 () Unit!18815)

(assert (=> b!264060 (= lt!405416 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264060 (= lt!405412 (BitStream!11671 (buf!6896 w2!580) (currentByte!12760 w1!584) (currentBit!12755 w1!584)))))

(declare-fun b!264061 () Bool)

(declare-fun res!220798 () Bool)

(assert (=> b!264061 (=> res!220798 e!184236)))

(assert (=> b!264061 (= res!220798 (not (isPrefixOf!0 lt!405412 w1!584)))))

(declare-fun b!264062 () Bool)

(assert (=> b!264062 (= e!184230 (not (arrayBitRangesEq!0 (buf!6896 w1!584) (buf!6896 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6428 (buf!6896 w1!584)) (currentByte!12760 w1!584) (currentBit!12755 w1!584)))))))

(assert (= (and start!57578 res!220800) b!264060))

(assert (= (and b!264060 res!220797) b!264062))

(assert (= (and b!264060 (not res!220801)) b!264057))

(assert (= (and b!264057 c!12090) b!264055))

(assert (= (and b!264057 (not c!12090)) b!264058))

(assert (= (and b!264057 res!220796) b!264059))

(assert (= (and b!264057 (not res!220799)) b!264061))

(assert (= (and b!264061 (not res!220798)) b!264054))

(assert (= start!57578 b!264056))

(assert (= start!57578 b!264053))

(declare-fun m!394447 () Bool)

(assert (=> b!264062 m!394447))

(assert (=> b!264062 m!394447))

(declare-fun m!394449 () Bool)

(assert (=> b!264062 m!394449))

(declare-fun m!394451 () Bool)

(assert (=> b!264060 m!394451))

(declare-fun m!394453 () Bool)

(assert (=> b!264060 m!394453))

(declare-fun m!394455 () Bool)

(assert (=> b!264060 m!394455))

(declare-fun m!394457 () Bool)

(assert (=> b!264060 m!394457))

(declare-fun m!394459 () Bool)

(assert (=> b!264060 m!394459))

(declare-fun m!394461 () Bool)

(assert (=> b!264060 m!394461))

(declare-fun m!394463 () Bool)

(assert (=> b!264061 m!394463))

(declare-fun m!394465 () Bool)

(assert (=> b!264054 m!394465))

(declare-fun m!394467 () Bool)

(assert (=> b!264054 m!394467))

(declare-fun m!394469 () Bool)

(assert (=> b!264053 m!394469))

(declare-fun m!394471 () Bool)

(assert (=> start!57578 m!394471))

(declare-fun m!394473 () Bool)

(assert (=> start!57578 m!394473))

(declare-fun m!394475 () Bool)

(assert (=> start!57578 m!394475))

(assert (=> b!264055 m!394447))

(declare-fun m!394477 () Bool)

(assert (=> b!264055 m!394477))

(declare-fun m!394479 () Bool)

(assert (=> b!264055 m!394479))

(assert (=> b!264059 m!394447))

(assert (=> b!264059 m!394447))

(declare-fun m!394481 () Bool)

(assert (=> b!264059 m!394481))

(declare-fun m!394483 () Bool)

(assert (=> b!264056 m!394483))

(check-sat (not b!264062) (not start!57578) (not b!264059) (not b!264055) (not b!264056) (not b!264053) (not b!264061) (not b!264054) (not b!264060))
(check-sat)
