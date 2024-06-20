; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61164 () Bool)

(assert start!61164)

(declare-fun b!275411 () Bool)

(declare-fun res!228963 () Bool)

(declare-fun e!195385 () Bool)

(assert (=> b!275411 (=> (not res!228963) (not e!195385))))

(declare-datatypes ((array!15725 0))(
  ( (array!15726 (arr!7797 (Array (_ BitVec 32) (_ BitVec 8))) (size!6810 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12434 0))(
  ( (BitStream!12435 (buf!7278 array!15725) (currentByte!13451 (_ BitVec 32)) (currentBit!13446 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12434)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275411 (= res!228963 (validate_offset_bit!0 ((_ sign_extend 32) (size!6810 (buf!7278 bs1!11))) ((_ sign_extend 32) (currentByte!13451 bs1!11)) ((_ sign_extend 32) (currentBit!13446 bs1!11))))))

(declare-fun res!228964 () Bool)

(assert (=> start!61164 (=> (not res!228964) (not e!195385))))

(declare-fun bs2!19 () BitStream!12434)

(assert (=> start!61164 (= res!228964 (= (size!6810 (buf!7278 bs1!11)) (size!6810 (buf!7278 bs2!19))))))

(assert (=> start!61164 e!195385))

(declare-fun e!195383 () Bool)

(declare-fun inv!12 (BitStream!12434) Bool)

(assert (=> start!61164 (and (inv!12 bs1!11) e!195383)))

(declare-fun e!195381 () Bool)

(assert (=> start!61164 (and (inv!12 bs2!19) e!195381)))

(declare-fun b!275412 () Bool)

(declare-fun array_inv!6534 (array!15725) Bool)

(assert (=> b!275412 (= e!195383 (array_inv!6534 (buf!7278 bs1!11)))))

(declare-fun b!275413 () Bool)

(assert (=> b!275413 (= e!195381 (array_inv!6534 (buf!7278 bs2!19)))))

(declare-fun b!275414 () Bool)

(declare-fun res!228962 () Bool)

(assert (=> b!275414 (=> (not res!228962) (not e!195385))))

(declare-fun arrayBitRangesEq!0 (array!15725 array!15725 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275414 (= res!228962 (arrayBitRangesEq!0 (buf!7278 bs1!11) (buf!7278 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6810 (buf!7278 bs1!11)) (currentByte!13451 bs1!11) (currentBit!13446 bs1!11)))))))

(declare-fun b!275415 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275415 (= e!195385 (not (invariant!0 (currentBit!13446 bs1!11) (currentByte!13451 bs1!11) (size!6810 (buf!7278 bs1!11)))))))

(declare-datatypes ((tuple2!22440 0))(
  ( (tuple2!22441 (_1!12252 BitStream!12434) (_2!12252 Bool)) )
))
(declare-fun lt!413563 () tuple2!22440)

(declare-fun readBitPure!0 (BitStream!12434) tuple2!22440)

(assert (=> b!275415 (= lt!413563 (readBitPure!0 (BitStream!12435 (buf!7278 bs2!19) (currentByte!13451 bs1!11) (currentBit!13446 bs1!11))))))

(declare-fun lt!413564 () tuple2!22440)

(assert (=> b!275415 (= lt!413564 (readBitPure!0 bs1!11))))

(assert (=> b!275415 (invariant!0 (currentBit!13446 bs1!11) (currentByte!13451 bs1!11) (size!6810 (buf!7278 bs2!19)))))

(assert (= (and start!61164 res!228964) b!275411))

(assert (= (and b!275411 res!228963) b!275414))

(assert (= (and b!275414 res!228962) b!275415))

(assert (= start!61164 b!275412))

(assert (= start!61164 b!275413))

(declare-fun m!408027 () Bool)

(assert (=> b!275412 m!408027))

(declare-fun m!408029 () Bool)

(assert (=> b!275415 m!408029))

(declare-fun m!408031 () Bool)

(assert (=> b!275415 m!408031))

(declare-fun m!408033 () Bool)

(assert (=> b!275415 m!408033))

(declare-fun m!408035 () Bool)

(assert (=> b!275415 m!408035))

(declare-fun m!408037 () Bool)

(assert (=> b!275411 m!408037))

(declare-fun m!408039 () Bool)

(assert (=> b!275414 m!408039))

(declare-fun m!408041 () Bool)

(assert (=> b!275414 m!408041))

(declare-fun m!408043 () Bool)

(assert (=> start!61164 m!408043))

(declare-fun m!408045 () Bool)

(assert (=> start!61164 m!408045))

(declare-fun m!408047 () Bool)

(assert (=> b!275413 m!408047))

(push 1)

(assert (not b!275413))

(assert (not start!61164))

(assert (not b!275411))

(assert (not b!275415))

(assert (not b!275412))

(assert (not b!275414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

