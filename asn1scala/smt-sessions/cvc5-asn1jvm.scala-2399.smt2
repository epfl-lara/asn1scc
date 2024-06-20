; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61148 () Bool)

(assert start!61148)

(declare-fun b!275291 () Bool)

(declare-fun res!228890 () Bool)

(declare-fun e!195263 () Bool)

(assert (=> b!275291 (=> (not res!228890) (not e!195263))))

(declare-datatypes ((array!15709 0))(
  ( (array!15710 (arr!7789 (Array (_ BitVec 32) (_ BitVec 8))) (size!6802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12418 0))(
  ( (BitStream!12419 (buf!7270 array!15709) (currentByte!13443 (_ BitVec 32)) (currentBit!13438 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12418)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275291 (= res!228890 (validate_offset_bit!0 ((_ sign_extend 32) (size!6802 (buf!7270 bs1!11))) ((_ sign_extend 32) (currentByte!13443 bs1!11)) ((_ sign_extend 32) (currentBit!13438 bs1!11))))))

(declare-fun b!275292 () Bool)

(declare-fun e!195261 () Bool)

(declare-fun array_inv!6526 (array!15709) Bool)

(assert (=> b!275292 (= e!195261 (array_inv!6526 (buf!7270 bs1!11)))))

(declare-fun b!275293 () Bool)

(declare-fun e!195264 () Bool)

(declare-fun bs2!19 () BitStream!12418)

(assert (=> b!275293 (= e!195264 (array_inv!6526 (buf!7270 bs2!19)))))

(declare-fun b!275294 () Bool)

(declare-fun res!228892 () Bool)

(assert (=> b!275294 (=> (not res!228892) (not e!195263))))

(declare-fun arrayBitRangesEq!0 (array!15709 array!15709 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275294 (= res!228892 (arrayBitRangesEq!0 (buf!7270 bs1!11) (buf!7270 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6802 (buf!7270 bs1!11)) (currentByte!13443 bs1!11) (currentBit!13438 bs1!11)))))))

(declare-fun res!228891 () Bool)

(assert (=> start!61148 (=> (not res!228891) (not e!195263))))

(assert (=> start!61148 (= res!228891 (= (size!6802 (buf!7270 bs1!11)) (size!6802 (buf!7270 bs2!19))))))

(assert (=> start!61148 e!195263))

(declare-fun inv!12 (BitStream!12418) Bool)

(assert (=> start!61148 (and (inv!12 bs1!11) e!195261)))

(assert (=> start!61148 (and (inv!12 bs2!19) e!195264)))

(declare-fun b!275295 () Bool)

(assert (=> b!275295 (= e!195263 (not true))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275295 (invariant!0 (currentBit!13438 bs1!11) (currentByte!13443 bs1!11) (size!6802 (buf!7270 bs2!19)))))

(assert (= (and start!61148 res!228891) b!275291))

(assert (= (and b!275291 res!228890) b!275294))

(assert (= (and b!275294 res!228892) b!275295))

(assert (= start!61148 b!275292))

(assert (= start!61148 b!275293))

(declare-fun m!407875 () Bool)

(assert (=> b!275292 m!407875))

(declare-fun m!407877 () Bool)

(assert (=> b!275291 m!407877))

(declare-fun m!407879 () Bool)

(assert (=> b!275295 m!407879))

(declare-fun m!407881 () Bool)

(assert (=> b!275294 m!407881))

(declare-fun m!407883 () Bool)

(assert (=> b!275294 m!407883))

(declare-fun m!407885 () Bool)

(assert (=> b!275293 m!407885))

(declare-fun m!407887 () Bool)

(assert (=> start!61148 m!407887))

(declare-fun m!407889 () Bool)

(assert (=> start!61148 m!407889))

(push 1)

(assert (not b!275295))

(assert (not b!275293))

(assert (not start!61148))

(assert (not b!275294))

(assert (not b!275292))

(assert (not b!275291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

