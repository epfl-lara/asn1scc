; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57398 () Bool)

(assert start!57398)

(declare-fun b!263025 () Bool)

(declare-fun e!183251 () Bool)

(assert (=> b!263025 (= e!183251 true)))

(declare-fun lt!404569 () (_ BitVec 64))

(declare-datatypes ((array!14674 0))(
  ( (array!14675 (arr!7391 (Array (_ BitVec 32) (_ BitVec 8))) (size!6404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11622 0))(
  ( (BitStream!11623 (buf!6872 array!14674) (currentByte!12724 (_ BitVec 32)) (currentBit!12719 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11622)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263025 (= lt!404569 (bitIndex!0 (size!6404 (buf!6872 w1!584)) (currentByte!12724 w1!584) (currentBit!12719 w1!584)))))

(declare-fun b!263026 () Bool)

(declare-fun e!183254 () Bool)

(declare-fun array_inv!6128 (array!14674) Bool)

(assert (=> b!263026 (= e!183254 (array_inv!6128 (buf!6872 w1!584)))))

(declare-fun b!263027 () Bool)

(declare-fun res!220087 () Bool)

(assert (=> b!263027 (=> res!220087 e!183251)))

(assert (=> b!263027 (= res!220087 (= (size!6404 (buf!6872 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263028 () Bool)

(declare-fun e!183250 () Bool)

(declare-fun w2!580 () BitStream!11622)

(assert (=> b!263028 (= e!183250 (array_inv!6128 (buf!6872 w2!580)))))

(declare-fun b!263029 () Bool)

(declare-fun e!183252 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14674 array!14674 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263029 (= e!183252 (not (arrayBitRangesEq!0 (buf!6872 w1!584) (buf!6872 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6404 (buf!6872 w1!584)) (currentByte!12724 w1!584) (currentBit!12719 w1!584)))))))

(declare-fun b!263030 () Bool)

(declare-fun e!183249 () Bool)

(assert (=> b!263030 (= e!183249 (not e!183251))))

(declare-fun res!220084 () Bool)

(assert (=> b!263030 (=> res!220084 e!183251)))

(assert (=> b!263030 (= res!220084 e!183252)))

(declare-fun res!220085 () Bool)

(assert (=> b!263030 (=> (not res!220085) (not e!183252))))

(assert (=> b!263030 (= res!220085 (not (= (size!6404 (buf!6872 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11622 BitStream!11622) Bool)

(assert (=> b!263030 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18751 0))(
  ( (Unit!18752) )
))
(declare-fun lt!404573 () Unit!18751)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11622) Unit!18751)

(assert (=> b!263030 (= lt!404573 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404570 () BitStream!11622)

(assert (=> b!263030 (isPrefixOf!0 lt!404570 lt!404570)))

(declare-fun lt!404571 () Unit!18751)

(assert (=> b!263030 (= lt!404571 (lemmaIsPrefixRefl!0 lt!404570))))

(assert (=> b!263030 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404572 () Unit!18751)

(assert (=> b!263030 (= lt!404572 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263030 (= lt!404570 (BitStream!11623 (buf!6872 w2!580) (currentByte!12724 w1!584) (currentBit!12719 w1!584)))))

(declare-fun res!220086 () Bool)

(assert (=> start!57398 (=> (not res!220086) (not e!183249))))

(assert (=> start!57398 (= res!220086 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57398 e!183249))

(declare-fun inv!12 (BitStream!11622) Bool)

(assert (=> start!57398 (and (inv!12 w1!584) e!183254)))

(assert (=> start!57398 (and (inv!12 w2!580) e!183250)))

(assert (= (and start!57398 res!220086) b!263030))

(assert (= (and b!263030 res!220085) b!263029))

(assert (= (and b!263030 (not res!220084)) b!263027))

(assert (= (and b!263027 (not res!220087)) b!263025))

(assert (= start!57398 b!263026))

(assert (= start!57398 b!263028))

(declare-fun m!393223 () Bool)

(assert (=> b!263030 m!393223))

(declare-fun m!393225 () Bool)

(assert (=> b!263030 m!393225))

(declare-fun m!393227 () Bool)

(assert (=> b!263030 m!393227))

(declare-fun m!393229 () Bool)

(assert (=> b!263030 m!393229))

(declare-fun m!393231 () Bool)

(assert (=> b!263030 m!393231))

(declare-fun m!393233 () Bool)

(assert (=> b!263030 m!393233))

(declare-fun m!393235 () Bool)

(assert (=> b!263026 m!393235))

(declare-fun m!393237 () Bool)

(assert (=> b!263028 m!393237))

(declare-fun m!393239 () Bool)

(assert (=> b!263029 m!393239))

(assert (=> b!263029 m!393239))

(declare-fun m!393241 () Bool)

(assert (=> b!263029 m!393241))

(declare-fun m!393243 () Bool)

(assert (=> start!57398 m!393243))

(declare-fun m!393245 () Bool)

(assert (=> start!57398 m!393245))

(declare-fun m!393247 () Bool)

(assert (=> start!57398 m!393247))

(assert (=> b!263025 m!393239))

(check-sat (not b!263026) (not start!57398) (not b!263030) (not b!263028) (not b!263025) (not b!263029))
