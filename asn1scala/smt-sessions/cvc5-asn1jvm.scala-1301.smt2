; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37038 () Bool)

(assert start!37038)

(declare-fun res!140410 () Bool)

(declare-fun e!117330 () Bool)

(assert (=> start!37038 (=> (not res!140410) (not e!117330))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37038 (= res!140410 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37038 e!117330))

(assert (=> start!37038 true))

(declare-datatypes ((array!8841 0))(
  ( (array!8842 (arr!4837 (Array (_ BitVec 32) (_ BitVec 8))) (size!3916 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6988 0))(
  ( (BitStream!6989 (buf!4368 array!8841) (currentByte!8314 (_ BitVec 32)) (currentBit!8309 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6988)

(declare-fun e!117329 () Bool)

(declare-fun inv!12 (BitStream!6988) Bool)

(assert (=> start!37038 (and (inv!12 thiss!1894) e!117329)))

(declare-fun b!168778 () Bool)

(declare-fun res!140411 () Bool)

(assert (=> b!168778 (=> (not res!140411) (not e!117330))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168778 (= res!140411 (validate_offset_bits!1 ((_ sign_extend 32) (size!3916 (buf!4368 thiss!1894))) ((_ sign_extend 32) (currentByte!8314 thiss!1894)) ((_ sign_extend 32) (currentBit!8309 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168779 () Bool)

(assert (=> b!168779 (= e!117330 (and (bvsgt (bvadd (currentBit!8309 thiss!1894) nBits!600) #b00000000000000000000000000001000) (= (bvand (currentByte!8314 thiss!1894) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!8314 thiss!1894) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8314 thiss!1894)) #b10000000000000000000000000000000)))))))

(declare-fun b!168780 () Bool)

(declare-fun array_inv!3657 (array!8841) Bool)

(assert (=> b!168780 (= e!117329 (array_inv!3657 (buf!4368 thiss!1894)))))

(assert (= (and start!37038 res!140410) b!168778))

(assert (= (and b!168778 res!140411) b!168779))

(assert (= start!37038 b!168780))

(declare-fun m!268371 () Bool)

(assert (=> start!37038 m!268371))

(declare-fun m!268373 () Bool)

(assert (=> b!168778 m!268373))

(declare-fun m!268375 () Bool)

(assert (=> b!168780 m!268375))

(push 1)

(assert (not b!168780))

(assert (not start!37038))

(assert (not b!168778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59615 () Bool)

(assert (=> d!59615 (= (array_inv!3657 (buf!4368 thiss!1894)) (bvsge (size!3916 (buf!4368 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168780 d!59615))

(declare-fun d!59617 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59617 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8309 thiss!1894) (currentByte!8314 thiss!1894) (size!3916 (buf!4368 thiss!1894))))))

(declare-fun bs!14777 () Bool)

(assert (= bs!14777 d!59617))

(declare-fun m!268393 () Bool)

(assert (=> bs!14777 m!268393))

(assert (=> start!37038 d!59617))

(declare-fun d!59619 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59619 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3916 (buf!4368 thiss!1894))) ((_ sign_extend 32) (currentByte!8314 thiss!1894)) ((_ sign_extend 32) (currentBit!8309 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3916 (buf!4368 thiss!1894))) ((_ sign_extend 32) (currentByte!8314 thiss!1894)) ((_ sign_extend 32) (currentBit!8309 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14778 () Bool)

(assert (= bs!14778 d!59619))

(declare-fun m!268395 () Bool)

(assert (=> bs!14778 m!268395))

(assert (=> b!168778 d!59619))

(push 1)

(assert (not d!59619))

(assert (not d!59617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59631 () Bool)

(assert (=> d!59631 (= (remainingBits!0 ((_ sign_extend 32) (size!3916 (buf!4368 thiss!1894))) ((_ sign_extend 32) (currentByte!8314 thiss!1894)) ((_ sign_extend 32) (currentBit!8309 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3916 (buf!4368 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8314 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8309 thiss!1894)))))))

(assert (=> d!59619 d!59631))

(declare-fun d!59633 () Bool)

(assert (=> d!59633 (= (invariant!0 (currentBit!8309 thiss!1894) (currentByte!8314 thiss!1894) (size!3916 (buf!4368 thiss!1894))) (and (bvsge (currentBit!8309 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8309 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8314 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8314 thiss!1894) (size!3916 (buf!4368 thiss!1894))) (and (= (currentBit!8309 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8314 thiss!1894) (size!3916 (buf!4368 thiss!1894)))))))))

(assert (=> d!59617 d!59633))

(push 1)

(check-sat)

