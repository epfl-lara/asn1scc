; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61176 () Bool)

(assert start!61176)

(declare-fun res!229016 () Bool)

(declare-fun e!195472 () Bool)

(assert (=> start!61176 (=> (not res!229016) (not e!195472))))

(declare-datatypes ((array!15737 0))(
  ( (array!15738 (arr!7803 (Array (_ BitVec 32) (_ BitVec 8))) (size!6816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12446 0))(
  ( (BitStream!12447 (buf!7284 array!15737) (currentByte!13457 (_ BitVec 32)) (currentBit!13452 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12446)

(declare-fun bs2!19 () BitStream!12446)

(assert (=> start!61176 (= res!229016 (= (size!6816 (buf!7284 bs1!11)) (size!6816 (buf!7284 bs2!19))))))

(assert (=> start!61176 e!195472))

(declare-fun e!195474 () Bool)

(declare-fun inv!12 (BitStream!12446) Bool)

(assert (=> start!61176 (and (inv!12 bs1!11) e!195474)))

(declare-fun e!195473 () Bool)

(assert (=> start!61176 (and (inv!12 bs2!19) e!195473)))

(declare-fun b!275501 () Bool)

(declare-fun array_inv!6540 (array!15737) Bool)

(assert (=> b!275501 (= e!195474 (array_inv!6540 (buf!7284 bs1!11)))))

(declare-fun b!275502 () Bool)

(declare-fun res!229018 () Bool)

(assert (=> b!275502 (=> (not res!229018) (not e!195472))))

(declare-fun arrayBitRangesEq!0 (array!15737 array!15737 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275502 (= res!229018 (arrayBitRangesEq!0 (buf!7284 bs1!11) (buf!7284 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6816 (buf!7284 bs1!11)) (currentByte!13457 bs1!11) (currentBit!13452 bs1!11)))))))

(declare-fun b!275503 () Bool)

(assert (=> b!275503 (= e!195473 (array_inv!6540 (buf!7284 bs2!19)))))

(declare-fun b!275504 () Bool)

(declare-fun res!229017 () Bool)

(assert (=> b!275504 (=> (not res!229017) (not e!195472))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275504 (= res!229017 (validate_offset_bit!0 ((_ sign_extend 32) (size!6816 (buf!7284 bs1!11))) ((_ sign_extend 32) (currentByte!13457 bs1!11)) ((_ sign_extend 32) (currentBit!13452 bs1!11))))))

(declare-fun b!275505 () Bool)

(assert (=> b!275505 (= e!195472 (not true))))

(declare-datatypes ((tuple2!22452 0))(
  ( (tuple2!22453 (_1!12258 BitStream!12446) (_2!12258 Bool)) )
))
(declare-fun lt!413599 () tuple2!22452)

(declare-fun readBitPure!0 (BitStream!12446) tuple2!22452)

(assert (=> b!275505 (= lt!413599 (readBitPure!0 (BitStream!12447 (buf!7284 bs2!19) (currentByte!13457 bs1!11) (currentBit!13452 bs1!11))))))

(declare-fun lt!413600 () tuple2!22452)

(assert (=> b!275505 (= lt!413600 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275505 (invariant!0 (currentBit!13452 bs1!11) (currentByte!13457 bs1!11) (size!6816 (buf!7284 bs2!19)))))

(assert (= (and start!61176 res!229016) b!275504))

(assert (= (and b!275504 res!229017) b!275502))

(assert (= (and b!275502 res!229018) b!275505))

(assert (= start!61176 b!275501))

(assert (= start!61176 b!275503))

(declare-fun m!408155 () Bool)

(assert (=> b!275502 m!408155))

(declare-fun m!408157 () Bool)

(assert (=> b!275502 m!408157))

(declare-fun m!408159 () Bool)

(assert (=> b!275505 m!408159))

(declare-fun m!408161 () Bool)

(assert (=> b!275505 m!408161))

(declare-fun m!408163 () Bool)

(assert (=> b!275505 m!408163))

(declare-fun m!408165 () Bool)

(assert (=> b!275503 m!408165))

(declare-fun m!408167 () Bool)

(assert (=> b!275501 m!408167))

(declare-fun m!408169 () Bool)

(assert (=> start!61176 m!408169))

(declare-fun m!408171 () Bool)

(assert (=> start!61176 m!408171))

(declare-fun m!408173 () Bool)

(assert (=> b!275504 m!408173))

(push 1)

(assert (not b!275504))

(assert (not b!275502))

(assert (not start!61176))

(assert (not b!275505))

(assert (not b!275501))

(assert (not b!275503))

(check-sat)

(pop 1)

