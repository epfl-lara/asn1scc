; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35016 () Bool)

(assert start!35016)

(declare-fun res!137447 () Bool)

(declare-fun e!114100 () Bool)

(assert (=> start!35016 (=> (not res!137447) (not e!114100))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35016 (= res!137447 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35016 e!114100))

(assert (=> start!35016 true))

(declare-datatypes ((array!8323 0))(
  ( (array!8324 (arr!4644 (Array (_ BitVec 32) (_ BitVec 8))) (size!3723 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6602 0))(
  ( (BitStream!6603 (buf!4175 array!8323) (currentByte!7785 (_ BitVec 32)) (currentBit!7780 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6602)

(declare-fun e!114102 () Bool)

(declare-fun inv!12 (BitStream!6602) Bool)

(assert (=> start!35016 (and (inv!12 thiss!1577) e!114102)))

(declare-fun b!164983 () Bool)

(declare-fun res!137446 () Bool)

(assert (=> b!164983 (=> (not res!137446) (not e!114100))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164983 (= res!137446 (validate_offset_bits!1 ((_ sign_extend 32) (size!3723 (buf!4175 thiss!1577))) ((_ sign_extend 32) (currentByte!7785 thiss!1577)) ((_ sign_extend 32) (currentBit!7780 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164984 () Bool)

(assert (=> b!164984 (= e!114100 (and (bvsle (bvadd (currentBit!7780 thiss!1577) nBits!511) #b00000000000000000000000000001000) (not (= #b00000000000000000000000000000000 (bvand (bvadd (currentBit!7780 thiss!1577) nBits!511) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7780 thiss!1577) nBits!511)) #b10000000000000000000000000000000)))))))

(declare-fun b!164985 () Bool)

(declare-fun array_inv!3464 (array!8323) Bool)

(assert (=> b!164985 (= e!114102 (array_inv!3464 (buf!4175 thiss!1577)))))

(assert (= (and start!35016 res!137447) b!164983))

(assert (= (and b!164983 res!137446) b!164984))

(assert (= start!35016 b!164985))

(declare-fun m!262321 () Bool)

(assert (=> start!35016 m!262321))

(declare-fun m!262323 () Bool)

(assert (=> b!164983 m!262323))

(declare-fun m!262325 () Bool)

(assert (=> b!164985 m!262325))

(push 1)

(assert (not start!35016))

(assert (not b!164983))

(assert (not b!164985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57029 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57029 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7780 thiss!1577) (currentByte!7785 thiss!1577) (size!3723 (buf!4175 thiss!1577))))))

(declare-fun bs!14152 () Bool)

(assert (= bs!14152 d!57029))

(declare-fun m!262335 () Bool)

(assert (=> bs!14152 m!262335))

(assert (=> start!35016 d!57029))

(declare-fun d!57031 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57031 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3723 (buf!4175 thiss!1577))) ((_ sign_extend 32) (currentByte!7785 thiss!1577)) ((_ sign_extend 32) (currentBit!7780 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3723 (buf!4175 thiss!1577))) ((_ sign_extend 32) (currentByte!7785 thiss!1577)) ((_ sign_extend 32) (currentBit!7780 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14153 () Bool)

(assert (= bs!14153 d!57031))

(declare-fun m!262337 () Bool)

(assert (=> bs!14153 m!262337))

(assert (=> b!164983 d!57031))

(declare-fun d!57033 () Bool)

(assert (=> d!57033 (= (array_inv!3464 (buf!4175 thiss!1577)) (bvsge (size!3723 (buf!4175 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164985 d!57033))

(push 1)

(assert (not d!57031))

(assert (not d!57029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57043 () Bool)

(assert (=> d!57043 (= (remainingBits!0 ((_ sign_extend 32) (size!3723 (buf!4175 thiss!1577))) ((_ sign_extend 32) (currentByte!7785 thiss!1577)) ((_ sign_extend 32) (currentBit!7780 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3723 (buf!4175 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7785 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7780 thiss!1577)))))))

