; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61190 () Bool)

(assert start!61190)

(declare-fun b!275606 () Bool)

(declare-fun e!195579 () Bool)

(declare-datatypes ((array!15751 0))(
  ( (array!15752 (arr!7810 (Array (_ BitVec 32) (_ BitVec 8))) (size!6823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12460 0))(
  ( (BitStream!12461 (buf!7291 array!15751) (currentByte!13464 (_ BitVec 32)) (currentBit!13459 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12460)

(declare-fun array_inv!6547 (array!15751) Bool)

(assert (=> b!275606 (= e!195579 (array_inv!6547 (buf!7291 bs2!19)))))

(declare-fun b!275607 () Bool)

(declare-fun res!229080 () Bool)

(declare-fun e!195578 () Bool)

(assert (=> b!275607 (=> (not res!229080) (not e!195578))))

(declare-fun bs1!11 () BitStream!12460)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275607 (= res!229080 (validate_offset_bit!0 ((_ sign_extend 32) (size!6823 (buf!7291 bs1!11))) ((_ sign_extend 32) (currentByte!13464 bs1!11)) ((_ sign_extend 32) (currentBit!13459 bs1!11))))))

(declare-fun b!275608 () Bool)

(declare-fun res!229081 () Bool)

(assert (=> b!275608 (=> (not res!229081) (not e!195578))))

(declare-fun arrayBitRangesEq!0 (array!15751 array!15751 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275608 (= res!229081 (arrayBitRangesEq!0 (buf!7291 bs1!11) (buf!7291 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6823 (buf!7291 bs1!11)) (currentByte!13464 bs1!11) (currentBit!13459 bs1!11)))))))

(declare-fun b!275610 () Bool)

(assert (=> b!275610 (= e!195578 (not true))))

(declare-datatypes ((tuple2!22466 0))(
  ( (tuple2!22467 (_1!12265 BitStream!12460) (_2!12265 Bool)) )
))
(declare-fun lt!413642 () tuple2!22466)

(declare-fun readBitPure!0 (BitStream!12460) tuple2!22466)

(assert (=> b!275610 (= lt!413642 (readBitPure!0 (BitStream!12461 (buf!7291 bs2!19) (currentByte!13464 bs1!11) (currentBit!13459 bs1!11))))))

(declare-fun lt!413641 () tuple2!22466)

(assert (=> b!275610 (= lt!413641 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275610 (invariant!0 (currentBit!13459 bs1!11) (currentByte!13464 bs1!11) (size!6823 (buf!7291 bs2!19)))))

(declare-fun b!275609 () Bool)

(declare-fun e!195576 () Bool)

(assert (=> b!275609 (= e!195576 (array_inv!6547 (buf!7291 bs1!11)))))

(declare-fun res!229079 () Bool)

(assert (=> start!61190 (=> (not res!229079) (not e!195578))))

(assert (=> start!61190 (= res!229079 (= (size!6823 (buf!7291 bs1!11)) (size!6823 (buf!7291 bs2!19))))))

(assert (=> start!61190 e!195578))

(declare-fun inv!12 (BitStream!12460) Bool)

(assert (=> start!61190 (and (inv!12 bs1!11) e!195576)))

(assert (=> start!61190 (and (inv!12 bs2!19) e!195579)))

(assert (= (and start!61190 res!229079) b!275607))

(assert (= (and b!275607 res!229080) b!275608))

(assert (= (and b!275608 res!229081) b!275610))

(assert (= start!61190 b!275609))

(assert (= start!61190 b!275606))

(declare-fun m!408295 () Bool)

(assert (=> b!275610 m!408295))

(declare-fun m!408297 () Bool)

(assert (=> b!275610 m!408297))

(declare-fun m!408299 () Bool)

(assert (=> b!275610 m!408299))

(declare-fun m!408301 () Bool)

(assert (=> start!61190 m!408301))

(declare-fun m!408303 () Bool)

(assert (=> start!61190 m!408303))

(declare-fun m!408305 () Bool)

(assert (=> b!275608 m!408305))

(declare-fun m!408307 () Bool)

(assert (=> b!275608 m!408307))

(declare-fun m!408309 () Bool)

(assert (=> b!275606 m!408309))

(declare-fun m!408311 () Bool)

(assert (=> b!275609 m!408311))

(declare-fun m!408313 () Bool)

(assert (=> b!275607 m!408313))

(push 1)

(assert (not b!275608))

(assert (not start!61190))

(assert (not b!275607))

(assert (not b!275610))

(assert (not b!275606))

(assert (not b!275609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

