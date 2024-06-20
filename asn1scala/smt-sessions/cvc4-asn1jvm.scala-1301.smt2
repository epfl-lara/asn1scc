; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37042 () Bool)

(assert start!37042)

(declare-fun res!140422 () Bool)

(declare-fun e!117348 () Bool)

(assert (=> start!37042 (=> (not res!140422) (not e!117348))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37042 (= res!140422 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37042 e!117348))

(assert (=> start!37042 true))

(declare-datatypes ((array!8845 0))(
  ( (array!8846 (arr!4839 (Array (_ BitVec 32) (_ BitVec 8))) (size!3918 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6992 0))(
  ( (BitStream!6993 (buf!4370 array!8845) (currentByte!8316 (_ BitVec 32)) (currentBit!8311 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6992)

(declare-fun e!117347 () Bool)

(declare-fun inv!12 (BitStream!6992) Bool)

(assert (=> start!37042 (and (inv!12 thiss!1894) e!117347)))

(declare-fun b!168796 () Bool)

(declare-fun res!140423 () Bool)

(assert (=> b!168796 (=> (not res!140423) (not e!117348))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168796 (= res!140423 (validate_offset_bits!1 ((_ sign_extend 32) (size!3918 (buf!4370 thiss!1894))) ((_ sign_extend 32) (currentByte!8316 thiss!1894)) ((_ sign_extend 32) (currentBit!8311 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168797 () Bool)

(assert (=> b!168797 (= e!117348 (and (bvsgt (bvadd (currentBit!8311 thiss!1894) nBits!600) #b00000000000000000000000000001000) (= (bvand (currentByte!8316 thiss!1894) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!8316 thiss!1894) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8316 thiss!1894)) #b10000000000000000000000000000000)))))))

(declare-fun b!168798 () Bool)

(declare-fun array_inv!3659 (array!8845) Bool)

(assert (=> b!168798 (= e!117347 (array_inv!3659 (buf!4370 thiss!1894)))))

(assert (= (and start!37042 res!140422) b!168796))

(assert (= (and b!168796 res!140423) b!168797))

(assert (= start!37042 b!168798))

(declare-fun m!268383 () Bool)

(assert (=> start!37042 m!268383))

(declare-fun m!268385 () Bool)

(assert (=> b!168796 m!268385))

(declare-fun m!268387 () Bool)

(assert (=> b!168798 m!268387))

(push 1)

(assert (not start!37042))

(assert (not b!168796))

(assert (not b!168798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59621 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59621 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8311 thiss!1894) (currentByte!8316 thiss!1894) (size!3918 (buf!4370 thiss!1894))))))

(declare-fun bs!14779 () Bool)

(assert (= bs!14779 d!59621))

(declare-fun m!268397 () Bool)

(assert (=> bs!14779 m!268397))

(assert (=> start!37042 d!59621))

(declare-fun d!59625 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59625 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3918 (buf!4370 thiss!1894))) ((_ sign_extend 32) (currentByte!8316 thiss!1894)) ((_ sign_extend 32) (currentBit!8311 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3918 (buf!4370 thiss!1894))) ((_ sign_extend 32) (currentByte!8316 thiss!1894)) ((_ sign_extend 32) (currentBit!8311 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14780 () Bool)

(assert (= bs!14780 d!59625))

(declare-fun m!268399 () Bool)

(assert (=> bs!14780 m!268399))

(assert (=> b!168796 d!59625))

(declare-fun d!59629 () Bool)

(assert (=> d!59629 (= (array_inv!3659 (buf!4370 thiss!1894)) (bvsge (size!3918 (buf!4370 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168798 d!59629))

(push 1)

(assert (not d!59625))

(assert (not d!59621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

