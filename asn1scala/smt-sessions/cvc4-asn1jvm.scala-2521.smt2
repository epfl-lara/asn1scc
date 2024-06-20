; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63666 () Bool)

(assert start!63666)

(declare-fun res!235292 () Bool)

(declare-fun e!202977 () Bool)

(assert (=> start!63666 (=> (not res!235292) (not e!202977))))

(declare-datatypes ((array!16597 0))(
  ( (array!16598 (arr!8160 (Array (_ BitVec 32) (_ BitVec 8))) (size!7164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12698 0))(
  ( (BitStream!12699 (buf!7410 array!16597) (currentByte!13736 (_ BitVec 32)) (currentBit!13731 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12698)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63666 (= res!235292 (validate_offset_bits!1 ((_ sign_extend 32) (size!7164 (buf!7410 thiss!1929))) ((_ sign_extend 32) (currentByte!13736 thiss!1929)) ((_ sign_extend 32) (currentBit!13731 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13731 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63666 e!202977))

(declare-fun e!202976 () Bool)

(declare-fun inv!12 (BitStream!12698) Bool)

(assert (=> start!63666 (and (inv!12 thiss!1929) e!202976)))

(declare-fun b!283999 () Bool)

(declare-fun res!235291 () Bool)

(assert (=> b!283999 (=> (not res!235291) (not e!202977))))

(assert (=> b!283999 (= res!235291 (= (currentBit!13731 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284000 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284000 (= e!202977 (not (invariant!0 (currentBit!13731 thiss!1929) (currentByte!13736 thiss!1929) (size!7164 (buf!7410 thiss!1929)))))))

(declare-fun b!284001 () Bool)

(declare-fun array_inv!6857 (array!16597) Bool)

(assert (=> b!284001 (= e!202976 (array_inv!6857 (buf!7410 thiss!1929)))))

(assert (= (and start!63666 res!235292) b!283999))

(assert (= (and b!283999 res!235291) b!284000))

(assert (= start!63666 b!284001))

(declare-fun m!417127 () Bool)

(assert (=> start!63666 m!417127))

(declare-fun m!417129 () Bool)

(assert (=> start!63666 m!417129))

(declare-fun m!417131 () Bool)

(assert (=> b!284000 m!417131))

(declare-fun m!417133 () Bool)

(assert (=> b!284001 m!417133))

(push 1)

(assert (not b!284001))

(assert (not b!284000))

(assert (not start!63666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97632 () Bool)

(assert (=> d!97632 (= (array_inv!6857 (buf!7410 thiss!1929)) (bvsge (size!7164 (buf!7410 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284001 d!97632))

(declare-fun d!97636 () Bool)

(assert (=> d!97636 (= (invariant!0 (currentBit!13731 thiss!1929) (currentByte!13736 thiss!1929) (size!7164 (buf!7410 thiss!1929))) (and (bvsge (currentBit!13731 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13731 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13736 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13736 thiss!1929) (size!7164 (buf!7410 thiss!1929))) (and (= (currentBit!13731 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13736 thiss!1929) (size!7164 (buf!7410 thiss!1929)))))))))

(assert (=> b!284000 d!97636))

(declare-fun d!97648 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97648 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7164 (buf!7410 thiss!1929))) ((_ sign_extend 32) (currentByte!13736 thiss!1929)) ((_ sign_extend 32) (currentBit!13731 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13731 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7164 (buf!7410 thiss!1929))) ((_ sign_extend 32) (currentByte!13736 thiss!1929)) ((_ sign_extend 32) (currentBit!13731 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13731 thiss!1929)) #b00000000000000000000000000000111))))))

