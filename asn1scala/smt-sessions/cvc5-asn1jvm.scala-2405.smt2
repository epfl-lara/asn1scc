; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61184 () Bool)

(assert start!61184)

(declare-fun res!229052 () Bool)

(declare-fun e!195531 () Bool)

(assert (=> start!61184 (=> (not res!229052) (not e!195531))))

(declare-datatypes ((array!15745 0))(
  ( (array!15746 (arr!7807 (Array (_ BitVec 32) (_ BitVec 8))) (size!6820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12454 0))(
  ( (BitStream!12455 (buf!7288 array!15745) (currentByte!13461 (_ BitVec 32)) (currentBit!13456 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12454)

(declare-fun bs2!19 () BitStream!12454)

(assert (=> start!61184 (= res!229052 (= (size!6820 (buf!7288 bs1!11)) (size!6820 (buf!7288 bs2!19))))))

(assert (=> start!61184 e!195531))

(declare-fun e!195533 () Bool)

(declare-fun inv!12 (BitStream!12454) Bool)

(assert (=> start!61184 (and (inv!12 bs1!11) e!195533)))

(declare-fun e!195534 () Bool)

(assert (=> start!61184 (and (inv!12 bs2!19) e!195534)))

(declare-fun b!275561 () Bool)

(declare-fun array_inv!6544 (array!15745) Bool)

(assert (=> b!275561 (= e!195533 (array_inv!6544 (buf!7288 bs1!11)))))

(declare-fun b!275562 () Bool)

(declare-fun res!229054 () Bool)

(assert (=> b!275562 (=> (not res!229054) (not e!195531))))

(declare-fun arrayBitRangesEq!0 (array!15745 array!15745 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275562 (= res!229054 (arrayBitRangesEq!0 (buf!7288 bs1!11) (buf!7288 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6820 (buf!7288 bs1!11)) (currentByte!13461 bs1!11) (currentBit!13456 bs1!11)))))))

(declare-fun b!275563 () Bool)

(assert (=> b!275563 (= e!195531 (not true))))

(declare-datatypes ((tuple2!22460 0))(
  ( (tuple2!22461 (_1!12262 BitStream!12454) (_2!12262 Bool)) )
))
(declare-fun lt!413623 () tuple2!22460)

(declare-fun readBitPure!0 (BitStream!12454) tuple2!22460)

(assert (=> b!275563 (= lt!413623 (readBitPure!0 (BitStream!12455 (buf!7288 bs2!19) (currentByte!13461 bs1!11) (currentBit!13456 bs1!11))))))

(declare-fun lt!413624 () tuple2!22460)

(assert (=> b!275563 (= lt!413624 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275563 (invariant!0 (currentBit!13456 bs1!11) (currentByte!13461 bs1!11) (size!6820 (buf!7288 bs2!19)))))

(declare-fun b!275564 () Bool)

(declare-fun res!229053 () Bool)

(assert (=> b!275564 (=> (not res!229053) (not e!195531))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275564 (= res!229053 (validate_offset_bit!0 ((_ sign_extend 32) (size!6820 (buf!7288 bs1!11))) ((_ sign_extend 32) (currentByte!13461 bs1!11)) ((_ sign_extend 32) (currentBit!13456 bs1!11))))))

(declare-fun b!275565 () Bool)

(assert (=> b!275565 (= e!195534 (array_inv!6544 (buf!7288 bs2!19)))))

(assert (= (and start!61184 res!229052) b!275564))

(assert (= (and b!275564 res!229053) b!275562))

(assert (= (and b!275562 res!229054) b!275563))

(assert (= start!61184 b!275561))

(assert (= start!61184 b!275565))

(declare-fun m!408235 () Bool)

(assert (=> b!275564 m!408235))

(declare-fun m!408237 () Bool)

(assert (=> b!275561 m!408237))

(declare-fun m!408239 () Bool)

(assert (=> b!275562 m!408239))

(declare-fun m!408241 () Bool)

(assert (=> b!275562 m!408241))

(declare-fun m!408243 () Bool)

(assert (=> b!275565 m!408243))

(declare-fun m!408245 () Bool)

(assert (=> b!275563 m!408245))

(declare-fun m!408247 () Bool)

(assert (=> b!275563 m!408247))

(declare-fun m!408249 () Bool)

(assert (=> b!275563 m!408249))

(declare-fun m!408251 () Bool)

(assert (=> start!61184 m!408251))

(declare-fun m!408253 () Bool)

(assert (=> start!61184 m!408253))

(push 1)

(assert (not start!61184))

(assert (not b!275561))

(assert (not b!275562))

(assert (not b!275563))

(assert (not b!275565))

(assert (not b!275564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

