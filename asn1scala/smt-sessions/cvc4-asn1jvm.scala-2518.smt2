; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63570 () Bool)

(assert start!63570)

(declare-fun res!235238 () Bool)

(declare-fun e!202896 () Bool)

(assert (=> start!63570 (=> (not res!235238) (not e!202896))))

(declare-datatypes ((array!16570 0))(
  ( (array!16571 (arr!8151 (Array (_ BitVec 32) (_ BitVec 8))) (size!7155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12680 0))(
  ( (BitStream!12681 (buf!7401 array!16570) (currentByte!13706 (_ BitVec 32)) (currentBit!13701 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12680)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63570 (= res!235238 (validate_offset_bits!1 ((_ sign_extend 32) (size!7155 (buf!7401 thiss!1929))) ((_ sign_extend 32) (currentByte!13706 thiss!1929)) ((_ sign_extend 32) (currentBit!13701 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13701 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63570 e!202896))

(declare-fun e!202894 () Bool)

(declare-fun inv!12 (BitStream!12680) Bool)

(assert (=> start!63570 (and (inv!12 thiss!1929) e!202894)))

(declare-fun b!283918 () Bool)

(declare-fun res!235237 () Bool)

(assert (=> b!283918 (=> (not res!235237) (not e!202896))))

(assert (=> b!283918 (= res!235237 (not (= (currentBit!13701 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!283919 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283919 (= e!202896 (not (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13706 thiss!1929)) (size!7155 (buf!7401 thiss!1929)))))))

(declare-fun b!283920 () Bool)

(declare-fun array_inv!6848 (array!16570) Bool)

(assert (=> b!283920 (= e!202894 (array_inv!6848 (buf!7401 thiss!1929)))))

(assert (= (and start!63570 res!235238) b!283918))

(assert (= (and b!283918 res!235237) b!283919))

(assert (= start!63570 b!283920))

(declare-fun m!417031 () Bool)

(assert (=> start!63570 m!417031))

(declare-fun m!417033 () Bool)

(assert (=> start!63570 m!417033))

(declare-fun m!417035 () Bool)

(assert (=> b!283919 m!417035))

(declare-fun m!417037 () Bool)

(assert (=> b!283920 m!417037))

(push 1)

(assert (not b!283920))

(assert (not b!283919))

(assert (not start!63570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97538 () Bool)

(assert (=> d!97538 (= (array_inv!6848 (buf!7401 thiss!1929)) (bvsge (size!7155 (buf!7401 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283920 d!97538))

(declare-fun d!97544 () Bool)

(assert (=> d!97544 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13706 thiss!1929)) (size!7155 (buf!7401 thiss!1929))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!13706 thiss!1929)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!13706 thiss!1929)) (size!7155 (buf!7401 thiss!1929))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!13706 thiss!1929)) (size!7155 (buf!7401 thiss!1929)))))))))

(assert (=> b!283919 d!97544))

(declare-fun d!97552 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97552 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7155 (buf!7401 thiss!1929))) ((_ sign_extend 32) (currentByte!13706 thiss!1929)) ((_ sign_extend 32) (currentBit!13701 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13701 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7155 (buf!7401 thiss!1929))) ((_ sign_extend 32) (currentByte!13706 thiss!1929)) ((_ sign_extend 32) (currentBit!13701 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13701 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24642 () Bool)

(assert (= bs!24642 d!97552))

(declare-fun m!417043 () Bool)

(assert (=> bs!24642 m!417043))

(assert (=> start!63570 d!97552))

(declare-fun d!97558 () Bool)

(assert (=> d!97558 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13701 thiss!1929) (currentByte!13706 thiss!1929) (size!7155 (buf!7401 thiss!1929))))))

(declare-fun bs!24644 () Bool)

(assert (= bs!24644 d!97558))

(declare-fun m!417047 () Bool)

(assert (=> bs!24644 m!417047))

(assert (=> start!63570 d!97558))

(push 1)

(assert (not d!97552))

(assert (not d!97558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97570 () Bool)

(assert (=> d!97570 (= (remainingBits!0 ((_ sign_extend 32) (size!7155 (buf!7401 thiss!1929))) ((_ sign_extend 32) (currentByte!13706 thiss!1929)) ((_ sign_extend 32) (currentBit!13701 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7155 (buf!7401 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13706 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13701 thiss!1929)))))))

(assert (=> d!97552 d!97570))

(declare-fun d!97572 () Bool)

(assert (=> d!97572 (= (invariant!0 (currentBit!13701 thiss!1929) (currentByte!13706 thiss!1929) (size!7155 (buf!7401 thiss!1929))) (and (bvsge (currentBit!13701 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13701 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13706 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13706 thiss!1929) (size!7155 (buf!7401 thiss!1929))) (and (= (currentBit!13701 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13706 thiss!1929) (size!7155 (buf!7401 thiss!1929)))))))))

(assert (=> d!97558 d!97572))

(push 1)

(check-sat)

(pop 1)

