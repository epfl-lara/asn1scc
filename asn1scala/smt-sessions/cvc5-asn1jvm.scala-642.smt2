; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18034 () Bool)

(assert start!18034)

(declare-fun b!88562 () Bool)

(declare-fun res!72921 () Bool)

(declare-fun e!58600 () Bool)

(assert (=> b!88562 (=> (not res!72921) (not e!58600))))

(declare-datatypes ((array!4173 0))(
  ( (array!4174 (arr!2520 (Array (_ BitVec 32) (_ BitVec 8))) (size!1883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3328 0))(
  ( (BitStream!3329 (buf!2273 array!4173) (currentByte!4515 (_ BitVec 32)) (currentBit!4510 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3328)

(declare-fun thiss!1151 () BitStream!3328)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88562 (= res!72921 (and (bvsle i!576 nBits!336) (= (size!1883 (buf!2273 thiss!1152)) (size!1883 (buf!2273 thiss!1151)))))))

(declare-fun b!88563 () Bool)

(declare-fun res!72924 () Bool)

(assert (=> b!88563 (=> (not res!72924) (not e!58600))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88563 (= res!72924 (= (bitIndex!0 (size!1883 (buf!2273 thiss!1152)) (currentByte!4515 thiss!1152) (currentBit!4510 thiss!1152)) (bvadd (bitIndex!0 (size!1883 (buf!2273 thiss!1151)) (currentByte!4515 thiss!1151) (currentBit!4510 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88564 () Bool)

(declare-fun res!72923 () Bool)

(assert (=> b!88564 (=> (not res!72923) (not e!58600))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88564 (= res!72923 (invariant!0 (currentBit!4510 thiss!1151) (currentByte!4515 thiss!1151) (size!1883 (buf!2273 thiss!1151))))))

(declare-fun b!88565 () Bool)

(declare-fun res!72920 () Bool)

(assert (=> b!88565 (=> (not res!72920) (not e!58600))))

(assert (=> b!88565 (= res!72920 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun res!72919 () Bool)

(assert (=> start!18034 (=> (not res!72919) (not e!58600))))

(assert (=> start!18034 (= res!72919 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18034 e!58600))

(assert (=> start!18034 true))

(declare-fun e!58601 () Bool)

(declare-fun inv!12 (BitStream!3328) Bool)

(assert (=> start!18034 (and (inv!12 thiss!1151) e!58601)))

(declare-fun e!58598 () Bool)

(assert (=> start!18034 (and (inv!12 thiss!1152) e!58598)))

(declare-fun b!88566 () Bool)

(declare-fun array_inv!1729 (array!4173) Bool)

(assert (=> b!88566 (= e!58601 (array_inv!1729 (buf!2273 thiss!1151)))))

(declare-fun b!88567 () Bool)

(declare-fun res!72925 () Bool)

(assert (=> b!88567 (=> (not res!72925) (not e!58600))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88567 (= res!72925 (validate_offset_bits!1 ((_ sign_extend 32) (size!1883 (buf!2273 thiss!1151))) ((_ sign_extend 32) (currentByte!4515 thiss!1151)) ((_ sign_extend 32) (currentBit!4510 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88568 () Bool)

(declare-fun res!72922 () Bool)

(assert (=> b!88568 (=> (not res!72922) (not e!58600))))

(assert (=> b!88568 (= res!72922 (invariant!0 (currentBit!4510 thiss!1152) (currentByte!4515 thiss!1152) (size!1883 (buf!2273 thiss!1152))))))

(declare-fun b!88569 () Bool)

(assert (=> b!88569 (= e!58600 (and (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand i!576 #b10000000000000000000000000000000))) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 i!576) #b10000000000000000000000000000000)))))))

(declare-fun b!88570 () Bool)

(assert (=> b!88570 (= e!58598 (array_inv!1729 (buf!2273 thiss!1152)))))

(assert (= (and start!18034 res!72919) b!88567))

(assert (= (and b!88567 res!72925) b!88564))

(assert (= (and b!88564 res!72923) b!88565))

(assert (= (and b!88565 res!72920) b!88568))

(assert (= (and b!88568 res!72922) b!88562))

(assert (= (and b!88562 res!72921) b!88563))

(assert (= (and b!88563 res!72924) b!88569))

(assert (= start!18034 b!88566))

(assert (= start!18034 b!88570))

(declare-fun m!133691 () Bool)

(assert (=> b!88564 m!133691))

(declare-fun m!133693 () Bool)

(assert (=> b!88567 m!133693))

(declare-fun m!133695 () Bool)

(assert (=> start!18034 m!133695))

(declare-fun m!133697 () Bool)

(assert (=> start!18034 m!133697))

(declare-fun m!133699 () Bool)

(assert (=> b!88570 m!133699))

(declare-fun m!133701 () Bool)

(assert (=> b!88563 m!133701))

(declare-fun m!133703 () Bool)

(assert (=> b!88563 m!133703))

(declare-fun m!133705 () Bool)

(assert (=> b!88566 m!133705))

(declare-fun m!133707 () Bool)

(assert (=> b!88568 m!133707))

(push 1)

(assert (not b!88568))

(assert (not start!18034))

(assert (not b!88566))

(assert (not b!88564))

(assert (not b!88567))

(assert (not b!88570))

(assert (not b!88563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

