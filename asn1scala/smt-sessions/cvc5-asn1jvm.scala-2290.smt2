; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58038 () Bool)

(assert start!58038)

(declare-fun b!266468 () Bool)

(declare-fun e!186417 () Bool)

(declare-datatypes ((array!14852 0))(
  ( (array!14853 (arr!7462 (Array (_ BitVec 32) (_ BitVec 8))) (size!6475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11764 0))(
  ( (BitStream!11765 (buf!6943 array!14852) (currentByte!12837 (_ BitVec 32)) (currentBit!12832 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11764)

(declare-fun w2!580 () BitStream!11764)

(declare-fun arrayBitRangesEq!0 (array!14852 array!14852 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266468 (= e!186417 (not (arrayBitRangesEq!0 (buf!6943 w1!584) (buf!6943 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6475 (buf!6943 w1!584)) (currentByte!12837 w1!584) (currentBit!12832 w1!584)))))))

(declare-fun res!222579 () Bool)

(declare-fun e!186413 () Bool)

(assert (=> start!58038 (=> (not res!222579) (not e!186413))))

(declare-fun isPrefixOf!0 (BitStream!11764 BitStream!11764) Bool)

(assert (=> start!58038 (= res!222579 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58038 e!186413))

(declare-fun e!186415 () Bool)

(declare-fun inv!12 (BitStream!11764) Bool)

(assert (=> start!58038 (and (inv!12 w1!584) e!186415)))

(declare-fun e!186414 () Bool)

(assert (=> start!58038 (and (inv!12 w2!580) e!186414)))

(declare-fun b!266469 () Bool)

(declare-fun array_inv!6199 (array!14852) Bool)

(assert (=> b!266469 (= e!186414 (array_inv!6199 (buf!6943 w2!580)))))

(declare-fun b!266470 () Bool)

(assert (=> b!266470 (= e!186415 (array_inv!6199 (buf!6943 w1!584)))))

(declare-fun b!266471 () Bool)

(declare-fun res!222581 () Bool)

(declare-fun e!186416 () Bool)

(assert (=> b!266471 (=> res!222581 e!186416)))

(declare-fun lt!407194 () BitStream!11764)

(assert (=> b!266471 (= res!222581 (not (isPrefixOf!0 lt!407194 w1!584)))))

(declare-fun b!266472 () Bool)

(declare-datatypes ((Unit!18923 0))(
  ( (Unit!18924) )
))
(declare-fun e!186412 () Unit!18923)

(declare-fun Unit!18925 () Unit!18923)

(assert (=> b!266472 (= e!186412 Unit!18925)))

(declare-fun b!266473 () Bool)

(assert (=> b!266473 (= e!186416 true)))

(assert (=> b!266473 (isPrefixOf!0 lt!407194 w2!580)))

(declare-fun lt!407191 () Unit!18923)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11764 BitStream!11764 BitStream!11764) Unit!18923)

(assert (=> b!266473 (= lt!407191 (lemmaIsPrefixTransitive!0 lt!407194 w1!584 w2!580))))

(declare-fun b!266474 () Bool)

(declare-fun e!186420 () Bool)

(assert (=> b!266474 (= e!186413 (not e!186420))))

(declare-fun res!222582 () Bool)

(assert (=> b!266474 (=> res!222582 e!186420)))

(assert (=> b!266474 (= res!222582 e!186417)))

(declare-fun res!222583 () Bool)

(assert (=> b!266474 (=> (not res!222583) (not e!186417))))

(assert (=> b!266474 (= res!222583 (not (= (size!6475 (buf!6943 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266474 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407197 () Unit!18923)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11764) Unit!18923)

(assert (=> b!266474 (= lt!407197 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266474 (isPrefixOf!0 lt!407194 lt!407194)))

(declare-fun lt!407195 () Unit!18923)

(assert (=> b!266474 (= lt!407195 (lemmaIsPrefixRefl!0 lt!407194))))

(assert (=> b!266474 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407198 () Unit!18923)

(assert (=> b!266474 (= lt!407198 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266474 (= lt!407194 (BitStream!11765 (buf!6943 w2!580) (currentByte!12837 w1!584) (currentBit!12832 w1!584)))))

(declare-fun b!266475 () Bool)

(declare-fun lt!407193 () Unit!18923)

(assert (=> b!266475 (= e!186412 lt!407193)))

(declare-fun lt!407196 () (_ BitVec 64))

(assert (=> b!266475 (= lt!407196 (bitIndex!0 (size!6475 (buf!6943 w1!584)) (currentByte!12837 w1!584) (currentBit!12832 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14852 array!14852 (_ BitVec 64) (_ BitVec 64)) Unit!18923)

(assert (=> b!266475 (= lt!407193 (arrayBitRangesEqSymmetric!0 (buf!6943 w1!584) (buf!6943 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407196))))

(assert (=> b!266475 (arrayBitRangesEq!0 (buf!6943 w2!580) (buf!6943 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407196)))

(declare-fun b!266476 () Bool)

(declare-fun e!186418 () Bool)

(assert (=> b!266476 (= e!186418 (not (arrayBitRangesEq!0 (buf!6943 w2!580) (buf!6943 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6475 (buf!6943 w1!584)) (currentByte!12837 w1!584) (currentBit!12832 w1!584)))))))

(declare-fun b!266477 () Bool)

(assert (=> b!266477 (= e!186420 e!186416)))

(declare-fun res!222580 () Bool)

(assert (=> b!266477 (=> res!222580 e!186416)))

(assert (=> b!266477 (= res!222580 e!186418)))

(declare-fun res!222578 () Bool)

(assert (=> b!266477 (=> (not res!222578) (not e!186418))))

(assert (=> b!266477 (= res!222578 (not (= (size!6475 (buf!6943 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407192 () Unit!18923)

(assert (=> b!266477 (= lt!407192 e!186412)))

(declare-fun c!12264 () Bool)

(assert (=> b!266477 (= c!12264 (not (= (size!6475 (buf!6943 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!58038 res!222579) b!266474))

(assert (= (and b!266474 res!222583) b!266468))

(assert (= (and b!266474 (not res!222582)) b!266477))

(assert (= (and b!266477 c!12264) b!266475))

(assert (= (and b!266477 (not c!12264)) b!266472))

(assert (= (and b!266477 res!222578) b!266476))

(assert (= (and b!266477 (not res!222580)) b!266471))

(assert (= (and b!266471 (not res!222581)) b!266473))

(assert (= start!58038 b!266470))

(assert (= start!58038 b!266469))

(declare-fun m!397283 () Bool)

(assert (=> b!266475 m!397283))

(declare-fun m!397285 () Bool)

(assert (=> b!266475 m!397285))

(declare-fun m!397287 () Bool)

(assert (=> b!266475 m!397287))

(declare-fun m!397289 () Bool)

(assert (=> b!266473 m!397289))

(declare-fun m!397291 () Bool)

(assert (=> b!266473 m!397291))

(declare-fun m!397293 () Bool)

(assert (=> b!266474 m!397293))

(declare-fun m!397295 () Bool)

(assert (=> b!266474 m!397295))

(declare-fun m!397297 () Bool)

(assert (=> b!266474 m!397297))

(declare-fun m!397299 () Bool)

(assert (=> b!266474 m!397299))

(declare-fun m!397301 () Bool)

(assert (=> b!266474 m!397301))

(declare-fun m!397303 () Bool)

(assert (=> b!266474 m!397303))

(declare-fun m!397305 () Bool)

(assert (=> start!58038 m!397305))

(declare-fun m!397307 () Bool)

(assert (=> start!58038 m!397307))

(declare-fun m!397309 () Bool)

(assert (=> start!58038 m!397309))

(assert (=> b!266476 m!397283))

(assert (=> b!266476 m!397283))

(declare-fun m!397311 () Bool)

(assert (=> b!266476 m!397311))

(declare-fun m!397313 () Bool)

(assert (=> b!266470 m!397313))

(declare-fun m!397315 () Bool)

(assert (=> b!266471 m!397315))

(assert (=> b!266468 m!397283))

(assert (=> b!266468 m!397283))

(declare-fun m!397317 () Bool)

(assert (=> b!266468 m!397317))

(declare-fun m!397319 () Bool)

(assert (=> b!266469 m!397319))

(push 1)

