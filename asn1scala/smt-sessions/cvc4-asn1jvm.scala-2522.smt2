; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63696 () Bool)

(assert start!63696)

(declare-datatypes ((array!16606 0))(
  ( (array!16607 (arr!8163 (Array (_ BitVec 32) (_ BitVec 8))) (size!7167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12704 0))(
  ( (BitStream!12705 (buf!7413 array!16606) (currentByte!13745 (_ BitVec 32)) (currentBit!13740 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12704)

(assert (=> start!63696 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!13740 thiss!1929) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13740 thiss!1929)) #b10000000000000000000000000000000))))))

(declare-fun e!202994 () Bool)

(declare-fun inv!12 (BitStream!12704) Bool)

(assert (=> start!63696 (and (inv!12 thiss!1929) e!202994)))

(declare-fun b!284010 () Bool)

(declare-fun array_inv!6860 (array!16606) Bool)

(assert (=> b!284010 (= e!202994 (array_inv!6860 (buf!7413 thiss!1929)))))

(assert (= start!63696 b!284010))

(declare-fun m!417149 () Bool)

(assert (=> start!63696 m!417149))

(declare-fun m!417151 () Bool)

(assert (=> b!284010 m!417151))

(push 1)

(assert (not start!63696))

(assert (not b!284010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97664 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97664 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13740 thiss!1929) (currentByte!13745 thiss!1929) (size!7167 (buf!7413 thiss!1929))))))

(declare-fun bs!24677 () Bool)

(assert (= bs!24677 d!97664))

(declare-fun m!417157 () Bool)

(assert (=> bs!24677 m!417157))

(assert (=> start!63696 d!97664))

(declare-fun d!97668 () Bool)

