; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57404 () Bool)

(assert start!57404)

(declare-fun res!220120 () Bool)

(declare-fun e!183316 () Bool)

(assert (=> start!57404 (=> (not res!220120) (not e!183316))))

(declare-datatypes ((array!14680 0))(
  ( (array!14681 (arr!7394 (Array (_ BitVec 32) (_ BitVec 8))) (size!6407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11628 0))(
  ( (BitStream!11629 (buf!6875 array!14680) (currentByte!12727 (_ BitVec 32)) (currentBit!12722 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11628)

(declare-fun w2!580 () BitStream!11628)

(declare-fun isPrefixOf!0 (BitStream!11628 BitStream!11628) Bool)

(assert (=> start!57404 (= res!220120 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57404 e!183316))

(declare-fun e!183314 () Bool)

(declare-fun inv!12 (BitStream!11628) Bool)

(assert (=> start!57404 (and (inv!12 w1!584) e!183314)))

(declare-fun e!183315 () Bool)

(assert (=> start!57404 (and (inv!12 w2!580) e!183315)))

(declare-fun b!263079 () Bool)

(declare-fun e!183312 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14680 array!14680 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263079 (= e!183312 (not (arrayBitRangesEq!0 (buf!6875 w1!584) (buf!6875 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6407 (buf!6875 w1!584)) (currentByte!12727 w1!584) (currentBit!12722 w1!584)))))))

(declare-fun b!263080 () Bool)

(declare-fun e!183318 () Bool)

(assert (=> b!263080 (= e!183318 true)))

(declare-fun lt!404616 () (_ BitVec 64))

(assert (=> b!263080 (= lt!404616 (bitIndex!0 (size!6407 (buf!6875 w1!584)) (currentByte!12727 w1!584) (currentBit!12722 w1!584)))))

(declare-fun b!263081 () Bool)

(declare-fun res!220123 () Bool)

(assert (=> b!263081 (=> res!220123 e!183318)))

(assert (=> b!263081 (= res!220123 (= (size!6407 (buf!6875 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263082 () Bool)

(declare-fun array_inv!6131 (array!14680) Bool)

(assert (=> b!263082 (= e!183314 (array_inv!6131 (buf!6875 w1!584)))))

(declare-fun b!263083 () Bool)

(assert (=> b!263083 (= e!183316 (not e!183318))))

(declare-fun res!220122 () Bool)

(assert (=> b!263083 (=> res!220122 e!183318)))

(assert (=> b!263083 (= res!220122 e!183312)))

(declare-fun res!220121 () Bool)

(assert (=> b!263083 (=> (not res!220121) (not e!183312))))

(assert (=> b!263083 (= res!220121 (not (= (size!6407 (buf!6875 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263083 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18757 0))(
  ( (Unit!18758) )
))
(declare-fun lt!404615 () Unit!18757)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11628) Unit!18757)

(assert (=> b!263083 (= lt!404615 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404614 () BitStream!11628)

(assert (=> b!263083 (isPrefixOf!0 lt!404614 lt!404614)))

(declare-fun lt!404618 () Unit!18757)

(assert (=> b!263083 (= lt!404618 (lemmaIsPrefixRefl!0 lt!404614))))

(assert (=> b!263083 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404617 () Unit!18757)

(assert (=> b!263083 (= lt!404617 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263083 (= lt!404614 (BitStream!11629 (buf!6875 w2!580) (currentByte!12727 w1!584) (currentBit!12722 w1!584)))))

(declare-fun b!263084 () Bool)

(assert (=> b!263084 (= e!183315 (array_inv!6131 (buf!6875 w2!580)))))

(assert (= (and start!57404 res!220120) b!263083))

(assert (= (and b!263083 res!220121) b!263079))

(assert (= (and b!263083 (not res!220122)) b!263081))

(assert (= (and b!263081 (not res!220123)) b!263080))

(assert (= start!57404 b!263082))

(assert (= start!57404 b!263084))

(declare-fun m!393301 () Bool)

(assert (=> start!57404 m!393301))

(declare-fun m!393303 () Bool)

(assert (=> start!57404 m!393303))

(declare-fun m!393305 () Bool)

(assert (=> start!57404 m!393305))

(declare-fun m!393307 () Bool)

(assert (=> b!263082 m!393307))

(declare-fun m!393309 () Bool)

(assert (=> b!263079 m!393309))

(assert (=> b!263079 m!393309))

(declare-fun m!393311 () Bool)

(assert (=> b!263079 m!393311))

(assert (=> b!263080 m!393309))

(declare-fun m!393313 () Bool)

(assert (=> b!263083 m!393313))

(declare-fun m!393315 () Bool)

(assert (=> b!263083 m!393315))

(declare-fun m!393317 () Bool)

(assert (=> b!263083 m!393317))

(declare-fun m!393319 () Bool)

(assert (=> b!263083 m!393319))

(declare-fun m!393321 () Bool)

(assert (=> b!263083 m!393321))

(declare-fun m!393323 () Bool)

(assert (=> b!263083 m!393323))

(declare-fun m!393325 () Bool)

(assert (=> b!263084 m!393325))

(check-sat (not start!57404) (not b!263083) (not b!263079) (not b!263084) (not b!263080) (not b!263082))
