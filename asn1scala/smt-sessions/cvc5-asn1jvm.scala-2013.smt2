; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51484 () Bool)

(assert start!51484)

(declare-fun res!199893 () Bool)

(declare-fun e!165552 () Bool)

(assert (=> start!51484 (=> (not res!199893) (not e!165552))))

(declare-datatypes ((array!12897 0))(
  ( (array!12898 (arr!6646 (Array (_ BitVec 32) (_ BitVec 8))) (size!5659 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10240 0))(
  ( (BitStream!10241 (buf!6113 array!12897) (currentByte!11353 (_ BitVec 32)) (currentBit!11348 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10240)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51484 (= res!199893 (validate_offset_bits!1 ((_ sign_extend 32) (size!5659 (buf!6113 thiss!1854))) ((_ sign_extend 32) (currentByte!11353 thiss!1854)) ((_ sign_extend 32) (currentBit!11348 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51484 e!165552))

(declare-fun e!165553 () Bool)

(declare-fun inv!12 (BitStream!10240) Bool)

(assert (=> start!51484 (and (inv!12 thiss!1854) e!165553)))

(declare-fun b!239278 () Bool)

(assert (=> b!239278 (= e!165552 (bvsge (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11348 thiss!1854)))) #b00000000000000000000000010000000))))

(declare-fun b!239279 () Bool)

(declare-fun array_inv!5400 (array!12897) Bool)

(assert (=> b!239279 (= e!165553 (array_inv!5400 (buf!6113 thiss!1854)))))

(assert (= (and start!51484 res!199893) b!239278))

(assert (= start!51484 b!239279))

(declare-fun m!361399 () Bool)

(assert (=> start!51484 m!361399))

(declare-fun m!361401 () Bool)

(assert (=> start!51484 m!361401))

(declare-fun m!361403 () Bool)

(assert (=> b!239279 m!361403))

(push 1)

(assert (not b!239279))

(assert (not start!51484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80634 () Bool)

(assert (=> d!80634 (= (array_inv!5400 (buf!6113 thiss!1854)) (bvsge (size!5659 (buf!6113 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239279 d!80634))

(declare-fun d!80636 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5659 (buf!6113 thiss!1854))) ((_ sign_extend 32) (currentByte!11353 thiss!1854)) ((_ sign_extend 32) (currentBit!11348 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5659 (buf!6113 thiss!1854))) ((_ sign_extend 32) (currentByte!11353 thiss!1854)) ((_ sign_extend 32) (currentBit!11348 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20278 () Bool)

(assert (= bs!20278 d!80636))

(declare-fun m!361417 () Bool)

(assert (=> bs!20278 m!361417))

(assert (=> start!51484 d!80636))

(declare-fun d!80640 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80640 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11348 thiss!1854) (currentByte!11353 thiss!1854) (size!5659 (buf!6113 thiss!1854))))))

(declare-fun bs!20280 () Bool)

(assert (= bs!20280 d!80640))

(declare-fun m!361421 () Bool)

(assert (=> bs!20280 m!361421))

(assert (=> start!51484 d!80640))

(push 1)

(assert (not d!80636))

(assert (not d!80640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80652 () Bool)

(assert (=> d!80652 (= (remainingBits!0 ((_ sign_extend 32) (size!5659 (buf!6113 thiss!1854))) ((_ sign_extend 32) (currentByte!11353 thiss!1854)) ((_ sign_extend 32) (currentBit!11348 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5659 (buf!6113 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11353 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11348 thiss!1854)))))))

(assert (=> d!80636 d!80652))

(declare-fun d!80656 () Bool)

(assert (=> d!80656 (= (invariant!0 (currentBit!11348 thiss!1854) (currentByte!11353 thiss!1854) (size!5659 (buf!6113 thiss!1854))) (and (bvsge (currentBit!11348 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11348 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11353 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11353 thiss!1854) (size!5659 (buf!6113 thiss!1854))) (and (= (currentBit!11348 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11353 thiss!1854) (size!5659 (buf!6113 thiss!1854)))))))))

(assert (=> d!80640 d!80656))

(push 1)

(check-sat)

