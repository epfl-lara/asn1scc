; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61170 () Bool)

(assert start!61170)

(declare-fun b!275456 () Bool)

(declare-fun e!195430 () Bool)

(declare-datatypes ((array!15731 0))(
  ( (array!15732 (arr!7800 (Array (_ BitVec 32) (_ BitVec 8))) (size!6813 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12440 0))(
  ( (BitStream!12441 (buf!7281 array!15731) (currentByte!13454 (_ BitVec 32)) (currentBit!13449 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12440)

(declare-fun array_inv!6537 (array!15731) Bool)

(assert (=> b!275456 (= e!195430 (array_inv!6537 (buf!7281 bs1!11)))))

(declare-fun b!275457 () Bool)

(declare-fun e!195428 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275457 (= e!195428 (not (invariant!0 (currentBit!13449 bs1!11) (currentByte!13454 bs1!11) (size!6813 (buf!7281 bs1!11)))))))

(declare-datatypes ((tuple2!22446 0))(
  ( (tuple2!22447 (_1!12255 BitStream!12440) (_2!12255 Bool)) )
))
(declare-fun lt!413581 () tuple2!22446)

(declare-fun bs2!19 () BitStream!12440)

(declare-fun readBitPure!0 (BitStream!12440) tuple2!22446)

(assert (=> b!275457 (= lt!413581 (readBitPure!0 (BitStream!12441 (buf!7281 bs2!19) (currentByte!13454 bs1!11) (currentBit!13449 bs1!11))))))

(declare-fun lt!413582 () tuple2!22446)

(assert (=> b!275457 (= lt!413582 (readBitPure!0 bs1!11))))

(assert (=> b!275457 (invariant!0 (currentBit!13449 bs1!11) (currentByte!13454 bs1!11) (size!6813 (buf!7281 bs2!19)))))

(declare-fun b!275458 () Bool)

(declare-fun e!195429 () Bool)

(assert (=> b!275458 (= e!195429 (array_inv!6537 (buf!7281 bs2!19)))))

(declare-fun b!275459 () Bool)

(declare-fun res!228991 () Bool)

(assert (=> b!275459 (=> (not res!228991) (not e!195428))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275459 (= res!228991 (validate_offset_bit!0 ((_ sign_extend 32) (size!6813 (buf!7281 bs1!11))) ((_ sign_extend 32) (currentByte!13454 bs1!11)) ((_ sign_extend 32) (currentBit!13449 bs1!11))))))

(declare-fun b!275460 () Bool)

(declare-fun res!228990 () Bool)

(assert (=> b!275460 (=> (not res!228990) (not e!195428))))

(declare-fun arrayBitRangesEq!0 (array!15731 array!15731 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275460 (= res!228990 (arrayBitRangesEq!0 (buf!7281 bs1!11) (buf!7281 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6813 (buf!7281 bs1!11)) (currentByte!13454 bs1!11) (currentBit!13449 bs1!11)))))))

(declare-fun res!228989 () Bool)

(assert (=> start!61170 (=> (not res!228989) (not e!195428))))

(assert (=> start!61170 (= res!228989 (= (size!6813 (buf!7281 bs1!11)) (size!6813 (buf!7281 bs2!19))))))

(assert (=> start!61170 e!195428))

(declare-fun inv!12 (BitStream!12440) Bool)

(assert (=> start!61170 (and (inv!12 bs1!11) e!195430)))

(assert (=> start!61170 (and (inv!12 bs2!19) e!195429)))

(assert (= (and start!61170 res!228989) b!275459))

(assert (= (and b!275459 res!228991) b!275460))

(assert (= (and b!275460 res!228990) b!275457))

(assert (= start!61170 b!275456))

(assert (= start!61170 b!275458))

(declare-fun m!408093 () Bool)

(assert (=> b!275456 m!408093))

(declare-fun m!408095 () Bool)

(assert (=> b!275460 m!408095))

(declare-fun m!408097 () Bool)

(assert (=> b!275460 m!408097))

(declare-fun m!408099 () Bool)

(assert (=> start!61170 m!408099))

(declare-fun m!408101 () Bool)

(assert (=> start!61170 m!408101))

(declare-fun m!408103 () Bool)

(assert (=> b!275459 m!408103))

(declare-fun m!408105 () Bool)

(assert (=> b!275458 m!408105))

(declare-fun m!408107 () Bool)

(assert (=> b!275457 m!408107))

(declare-fun m!408109 () Bool)

(assert (=> b!275457 m!408109))

(declare-fun m!408111 () Bool)

(assert (=> b!275457 m!408111))

(declare-fun m!408113 () Bool)

(assert (=> b!275457 m!408113))

(push 1)

(assert (not b!275460))

(assert (not b!275459))

(assert (not b!275457))

(assert (not start!61170))

(assert (not b!275458))

(assert (not b!275456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

