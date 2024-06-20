; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61178 () Bool)

(assert start!61178)

(declare-fun b!275516 () Bool)

(declare-fun res!229026 () Bool)

(declare-fun e!195486 () Bool)

(assert (=> b!275516 (=> (not res!229026) (not e!195486))))

(declare-datatypes ((array!15739 0))(
  ( (array!15740 (arr!7804 (Array (_ BitVec 32) (_ BitVec 8))) (size!6817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12448 0))(
  ( (BitStream!12449 (buf!7285 array!15739) (currentByte!13458 (_ BitVec 32)) (currentBit!13453 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12448)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275516 (= res!229026 (validate_offset_bit!0 ((_ sign_extend 32) (size!6817 (buf!7285 bs1!11))) ((_ sign_extend 32) (currentByte!13458 bs1!11)) ((_ sign_extend 32) (currentBit!13453 bs1!11))))))

(declare-fun b!275517 () Bool)

(declare-fun res!229025 () Bool)

(assert (=> b!275517 (=> (not res!229025) (not e!195486))))

(declare-fun bs2!19 () BitStream!12448)

(declare-fun arrayBitRangesEq!0 (array!15739 array!15739 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275517 (= res!229025 (arrayBitRangesEq!0 (buf!7285 bs1!11) (buf!7285 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6817 (buf!7285 bs1!11)) (currentByte!13458 bs1!11) (currentBit!13453 bs1!11)))))))

(declare-fun res!229027 () Bool)

(assert (=> start!61178 (=> (not res!229027) (not e!195486))))

(assert (=> start!61178 (= res!229027 (= (size!6817 (buf!7285 bs1!11)) (size!6817 (buf!7285 bs2!19))))))

(assert (=> start!61178 e!195486))

(declare-fun e!195489 () Bool)

(declare-fun inv!12 (BitStream!12448) Bool)

(assert (=> start!61178 (and (inv!12 bs1!11) e!195489)))

(declare-fun e!195490 () Bool)

(assert (=> start!61178 (and (inv!12 bs2!19) e!195490)))

(declare-fun b!275518 () Bool)

(assert (=> b!275518 (= e!195486 (not true))))

(declare-datatypes ((tuple2!22454 0))(
  ( (tuple2!22455 (_1!12259 BitStream!12448) (_2!12259 Bool)) )
))
(declare-fun lt!413606 () tuple2!22454)

(declare-fun readBitPure!0 (BitStream!12448) tuple2!22454)

(assert (=> b!275518 (= lt!413606 (readBitPure!0 (BitStream!12449 (buf!7285 bs2!19) (currentByte!13458 bs1!11) (currentBit!13453 bs1!11))))))

(declare-fun lt!413605 () tuple2!22454)

(assert (=> b!275518 (= lt!413605 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275518 (invariant!0 (currentBit!13453 bs1!11) (currentByte!13458 bs1!11) (size!6817 (buf!7285 bs2!19)))))

(declare-fun b!275519 () Bool)

(declare-fun array_inv!6541 (array!15739) Bool)

(assert (=> b!275519 (= e!195489 (array_inv!6541 (buf!7285 bs1!11)))))

(declare-fun b!275520 () Bool)

(assert (=> b!275520 (= e!195490 (array_inv!6541 (buf!7285 bs2!19)))))

(assert (= (and start!61178 res!229027) b!275516))

(assert (= (and b!275516 res!229026) b!275517))

(assert (= (and b!275517 res!229025) b!275518))

(assert (= start!61178 b!275519))

(assert (= start!61178 b!275520))

(declare-fun m!408175 () Bool)

(assert (=> b!275516 m!408175))

(declare-fun m!408177 () Bool)

(assert (=> start!61178 m!408177))

(declare-fun m!408179 () Bool)

(assert (=> start!61178 m!408179))

(declare-fun m!408181 () Bool)

(assert (=> b!275519 m!408181))

(declare-fun m!408183 () Bool)

(assert (=> b!275520 m!408183))

(declare-fun m!408185 () Bool)

(assert (=> b!275517 m!408185))

(declare-fun m!408187 () Bool)

(assert (=> b!275517 m!408187))

(declare-fun m!408189 () Bool)

(assert (=> b!275518 m!408189))

(declare-fun m!408191 () Bool)

(assert (=> b!275518 m!408191))

(declare-fun m!408193 () Bool)

(assert (=> b!275518 m!408193))

(push 1)

(assert (not start!61178))

(assert (not b!275516))

(assert (not b!275519))

(assert (not b!275517))

(assert (not b!275518))

(assert (not b!275520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

