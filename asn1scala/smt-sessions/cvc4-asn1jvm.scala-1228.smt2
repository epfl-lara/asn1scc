; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34880 () Bool)

(assert start!34880)

(declare-fun res!137302 () Bool)

(declare-fun e!113885 () Bool)

(assert (=> start!34880 (=> (not res!137302) (not e!113885))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34880 (= res!137302 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34880 e!113885))

(assert (=> start!34880 true))

(declare-datatypes ((array!8266 0))(
  ( (array!8267 (arr!4620 (Array (_ BitVec 32) (_ BitVec 8))) (size!3699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6554 0))(
  ( (BitStream!6555 (buf!4151 array!8266) (currentByte!7735 (_ BitVec 32)) (currentBit!7730 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6554)

(declare-fun e!113884 () Bool)

(declare-fun inv!12 (BitStream!6554) Bool)

(assert (=> start!34880 (and (inv!12 thiss!1577) e!113884)))

(declare-fun b!164767 () Bool)

(declare-fun res!137303 () Bool)

(assert (=> b!164767 (=> (not res!137303) (not e!113885))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164767 (= res!137303 (validate_offset_bits!1 ((_ sign_extend 32) (size!3699 (buf!4151 thiss!1577))) ((_ sign_extend 32) (currentByte!7735 thiss!1577)) ((_ sign_extend 32) (currentBit!7730 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164768 () Bool)

(assert (=> b!164768 (= e!113885 (and (= (bvand (currentBit!7730 thiss!1577) #b10000000000000000000000000000000) (bvand nBits!511 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!7730 thiss!1577) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!7730 thiss!1577) nBits!511) #b10000000000000000000000000000000)))))))

(declare-fun b!164769 () Bool)

(declare-fun array_inv!3440 (array!8266) Bool)

(assert (=> b!164769 (= e!113884 (array_inv!3440 (buf!4151 thiss!1577)))))

(assert (= (and start!34880 res!137302) b!164767))

(assert (= (and b!164767 res!137303) b!164768))

(assert (= start!34880 b!164769))

(declare-fun m!262117 () Bool)

(assert (=> start!34880 m!262117))

(declare-fun m!262119 () Bool)

(assert (=> b!164767 m!262119))

(declare-fun m!262121 () Bool)

(assert (=> b!164769 m!262121))

(push 1)

(assert (not b!164767))

(assert (not start!34880))

(assert (not b!164769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56921 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56921 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3699 (buf!4151 thiss!1577))) ((_ sign_extend 32) (currentByte!7735 thiss!1577)) ((_ sign_extend 32) (currentBit!7730 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3699 (buf!4151 thiss!1577))) ((_ sign_extend 32) (currentByte!7735 thiss!1577)) ((_ sign_extend 32) (currentBit!7730 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14108 () Bool)

(assert (= bs!14108 d!56921))

(declare-fun m!262127 () Bool)

(assert (=> bs!14108 m!262127))

(assert (=> b!164767 d!56921))

(declare-fun d!56923 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56923 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7730 thiss!1577) (currentByte!7735 thiss!1577) (size!3699 (buf!4151 thiss!1577))))))

(declare-fun bs!14110 () Bool)

(assert (= bs!14110 d!56923))

(declare-fun m!262131 () Bool)

(assert (=> bs!14110 m!262131))

(assert (=> start!34880 d!56923))

(declare-fun d!56929 () Bool)

(assert (=> d!56929 (= (array_inv!3440 (buf!4151 thiss!1577)) (bvsge (size!3699 (buf!4151 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164769 d!56929))

(push 1)

(assert (not d!56921))

(assert (not d!56923))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56939 () Bool)

(assert (=> d!56939 (= (remainingBits!0 ((_ sign_extend 32) (size!3699 (buf!4151 thiss!1577))) ((_ sign_extend 32) (currentByte!7735 thiss!1577)) ((_ sign_extend 32) (currentBit!7730 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3699 (buf!4151 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7735 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7730 thiss!1577)))))))

(assert (=> d!56921 d!56939))

(declare-fun d!56941 () Bool)

(assert (=> d!56941 (= (invariant!0 (currentBit!7730 thiss!1577) (currentByte!7735 thiss!1577) (size!3699 (buf!4151 thiss!1577))) (and (bvsge (currentBit!7730 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7730 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7735 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7735 thiss!1577) (size!3699 (buf!4151 thiss!1577))) (and (= (currentBit!7730 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7735 thiss!1577) (size!3699 (buf!4151 thiss!1577)))))))))

(assert (=> d!56923 d!56941))

(push 1)

(check-sat)

