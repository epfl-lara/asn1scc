; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61160 () Bool)

(assert start!61160)

(declare-fun b!275381 () Bool)

(declare-fun e!195353 () Bool)

(declare-datatypes ((array!15721 0))(
  ( (array!15722 (arr!7795 (Array (_ BitVec 32) (_ BitVec 8))) (size!6808 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12430 0))(
  ( (BitStream!12431 (buf!7276 array!15721) (currentByte!13449 (_ BitVec 32)) (currentBit!13444 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12430)

(declare-fun array_inv!6532 (array!15721) Bool)

(assert (=> b!275381 (= e!195353 (array_inv!6532 (buf!7276 bs2!19)))))

(declare-fun res!228945 () Bool)

(declare-fun e!195355 () Bool)

(assert (=> start!61160 (=> (not res!228945) (not e!195355))))

(declare-fun bs1!11 () BitStream!12430)

(assert (=> start!61160 (= res!228945 (= (size!6808 (buf!7276 bs1!11)) (size!6808 (buf!7276 bs2!19))))))

(assert (=> start!61160 e!195355))

(declare-fun e!195351 () Bool)

(declare-fun inv!12 (BitStream!12430) Bool)

(assert (=> start!61160 (and (inv!12 bs1!11) e!195351)))

(assert (=> start!61160 (and (inv!12 bs2!19) e!195353)))

(declare-fun b!275382 () Bool)

(declare-fun res!228946 () Bool)

(assert (=> b!275382 (=> (not res!228946) (not e!195355))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275382 (= res!228946 (validate_offset_bit!0 ((_ sign_extend 32) (size!6808 (buf!7276 bs1!11))) ((_ sign_extend 32) (currentByte!13449 bs1!11)) ((_ sign_extend 32) (currentBit!13444 bs1!11))))))

(declare-fun b!275383 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275383 (= e!195355 (not (invariant!0 (currentBit!13444 bs1!11) (currentByte!13449 bs1!11) (size!6808 (buf!7276 bs1!11)))))))

(declare-datatypes ((tuple2!22436 0))(
  ( (tuple2!22437 (_1!12250 BitStream!12430) (_2!12250 Bool)) )
))
(declare-fun lt!413552 () tuple2!22436)

(declare-fun readBitPure!0 (BitStream!12430) tuple2!22436)

(assert (=> b!275383 (= lt!413552 (readBitPure!0 (BitStream!12431 (buf!7276 bs2!19) (currentByte!13449 bs1!11) (currentBit!13444 bs1!11))))))

(declare-fun lt!413551 () tuple2!22436)

(assert (=> b!275383 (= lt!413551 (readBitPure!0 bs1!11))))

(assert (=> b!275383 (invariant!0 (currentBit!13444 bs1!11) (currentByte!13449 bs1!11) (size!6808 (buf!7276 bs2!19)))))

(declare-fun b!275384 () Bool)

(assert (=> b!275384 (= e!195351 (array_inv!6532 (buf!7276 bs1!11)))))

(declare-fun b!275385 () Bool)

(declare-fun res!228944 () Bool)

(assert (=> b!275385 (=> (not res!228944) (not e!195355))))

(declare-fun arrayBitRangesEq!0 (array!15721 array!15721 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275385 (= res!228944 (arrayBitRangesEq!0 (buf!7276 bs1!11) (buf!7276 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6808 (buf!7276 bs1!11)) (currentByte!13449 bs1!11) (currentBit!13444 bs1!11)))))))

(assert (= (and start!61160 res!228945) b!275382))

(assert (= (and b!275382 res!228946) b!275385))

(assert (= (and b!275385 res!228944) b!275383))

(assert (= start!61160 b!275384))

(assert (= start!61160 b!275381))

(declare-fun m!407983 () Bool)

(assert (=> b!275381 m!407983))

(declare-fun m!407985 () Bool)

(assert (=> b!275384 m!407985))

(declare-fun m!407987 () Bool)

(assert (=> start!61160 m!407987))

(declare-fun m!407989 () Bool)

(assert (=> start!61160 m!407989))

(declare-fun m!407991 () Bool)

(assert (=> b!275385 m!407991))

(declare-fun m!407993 () Bool)

(assert (=> b!275385 m!407993))

(declare-fun m!407995 () Bool)

(assert (=> b!275383 m!407995))

(declare-fun m!407997 () Bool)

(assert (=> b!275383 m!407997))

(declare-fun m!407999 () Bool)

(assert (=> b!275383 m!407999))

(declare-fun m!408001 () Bool)

(assert (=> b!275383 m!408001))

(declare-fun m!408003 () Bool)

(assert (=> b!275382 m!408003))

(push 1)

(assert (not b!275383))

(assert (not b!275384))

(assert (not b!275385))

(assert (not start!61160))

(assert (not b!275381))

(assert (not b!275382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

