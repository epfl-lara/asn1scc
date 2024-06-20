; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61172 () Bool)

(assert start!61172)

(declare-fun res!229000 () Bool)

(declare-fun e!195444 () Bool)

(assert (=> start!61172 (=> (not res!229000) (not e!195444))))

(declare-datatypes ((array!15733 0))(
  ( (array!15734 (arr!7801 (Array (_ BitVec 32) (_ BitVec 8))) (size!6814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12442 0))(
  ( (BitStream!12443 (buf!7282 array!15733) (currentByte!13455 (_ BitVec 32)) (currentBit!13450 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12442)

(declare-fun bs2!19 () BitStream!12442)

(assert (=> start!61172 (= res!229000 (= (size!6814 (buf!7282 bs1!11)) (size!6814 (buf!7282 bs2!19))))))

(assert (=> start!61172 e!195444))

(declare-fun e!195443 () Bool)

(declare-fun inv!12 (BitStream!12442) Bool)

(assert (=> start!61172 (and (inv!12 bs1!11) e!195443)))

(declare-fun e!195441 () Bool)

(assert (=> start!61172 (and (inv!12 bs2!19) e!195441)))

(declare-fun b!275471 () Bool)

(declare-fun array_inv!6538 (array!15733) Bool)

(assert (=> b!275471 (= e!195443 (array_inv!6538 (buf!7282 bs1!11)))))

(declare-fun b!275472 () Bool)

(declare-fun res!228999 () Bool)

(assert (=> b!275472 (=> (not res!228999) (not e!195444))))

(declare-fun arrayBitRangesEq!0 (array!15733 array!15733 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275472 (= res!228999 (arrayBitRangesEq!0 (buf!7282 bs1!11) (buf!7282 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6814 (buf!7282 bs1!11)) (currentByte!13455 bs1!11) (currentBit!13450 bs1!11)))))))

(declare-fun b!275473 () Bool)

(assert (=> b!275473 (= e!195444 (not true))))

(declare-datatypes ((tuple2!22448 0))(
  ( (tuple2!22449 (_1!12256 BitStream!12442) (_2!12256 Bool)) )
))
(declare-fun lt!413587 () tuple2!22448)

(declare-fun readBitPure!0 (BitStream!12442) tuple2!22448)

(assert (=> b!275473 (= lt!413587 (readBitPure!0 (BitStream!12443 (buf!7282 bs2!19) (currentByte!13455 bs1!11) (currentBit!13450 bs1!11))))))

(declare-fun lt!413588 () tuple2!22448)

(assert (=> b!275473 (= lt!413588 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275473 (invariant!0 (currentBit!13450 bs1!11) (currentByte!13455 bs1!11) (size!6814 (buf!7282 bs2!19)))))

(declare-fun b!275474 () Bool)

(assert (=> b!275474 (= e!195441 (array_inv!6538 (buf!7282 bs2!19)))))

(declare-fun b!275475 () Bool)

(declare-fun res!228998 () Bool)

(assert (=> b!275475 (=> (not res!228998) (not e!195444))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275475 (= res!228998 (validate_offset_bit!0 ((_ sign_extend 32) (size!6814 (buf!7282 bs1!11))) ((_ sign_extend 32) (currentByte!13455 bs1!11)) ((_ sign_extend 32) (currentBit!13450 bs1!11))))))

(assert (= (and start!61172 res!229000) b!275475))

(assert (= (and b!275475 res!228998) b!275472))

(assert (= (and b!275472 res!228999) b!275473))

(assert (= start!61172 b!275471))

(assert (= start!61172 b!275474))

(declare-fun m!408115 () Bool)

(assert (=> b!275472 m!408115))

(declare-fun m!408117 () Bool)

(assert (=> b!275472 m!408117))

(declare-fun m!408119 () Bool)

(assert (=> start!61172 m!408119))

(declare-fun m!408121 () Bool)

(assert (=> start!61172 m!408121))

(declare-fun m!408123 () Bool)

(assert (=> b!275471 m!408123))

(declare-fun m!408125 () Bool)

(assert (=> b!275475 m!408125))

(declare-fun m!408127 () Bool)

(assert (=> b!275473 m!408127))

(declare-fun m!408129 () Bool)

(assert (=> b!275473 m!408129))

(declare-fun m!408131 () Bool)

(assert (=> b!275473 m!408131))

(declare-fun m!408133 () Bool)

(assert (=> b!275474 m!408133))

(push 1)

(assert (not b!275475))

(assert (not start!61172))

(assert (not b!275473))

(assert (not b!275472))

(assert (not b!275474))

(assert (not b!275471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

