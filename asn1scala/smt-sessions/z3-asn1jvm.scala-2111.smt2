; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53630 () Bool)

(assert start!53630)

(declare-fun b!249095 () Bool)

(declare-fun e!172587 () Bool)

(declare-datatypes ((array!13560 0))(
  ( (array!13561 (arr!6932 (Array (_ BitVec 32) (_ BitVec 8))) (size!5945 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10812 0))(
  ( (BitStream!10813 (buf!6438 array!13560) (currentByte!11863 (_ BitVec 32)) (currentBit!11858 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10812)

(declare-fun array_inv!5686 (array!13560) Bool)

(assert (=> b!249095 (= e!172587 (array_inv!5686 (buf!6438 thiss!1005)))))

(declare-fun b!249094 () Bool)

(declare-fun e!172589 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249094 (= e!172589 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5945 (buf!6438 thiss!1005))) ((_ sign_extend 32) (currentByte!11863 thiss!1005)) ((_ sign_extend 32) (currentBit!11858 thiss!1005)))))))

(declare-fun res!208457 () Bool)

(assert (=> start!53630 (=> (not res!208457) (not e!172589))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53630 (= res!208457 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53630 e!172589))

(assert (=> start!53630 true))

(declare-fun inv!12 (BitStream!10812) Bool)

(assert (=> start!53630 (and (inv!12 thiss!1005) e!172587)))

(declare-fun b!249092 () Bool)

(declare-fun res!208458 () Bool)

(assert (=> b!249092 (=> (not res!208458) (not e!172589))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249092 (= res!208458 (validate_offset_bits!1 ((_ sign_extend 32) (size!5945 (buf!6438 thiss!1005))) ((_ sign_extend 32) (currentByte!11863 thiss!1005)) ((_ sign_extend 32) (currentBit!11858 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249093 () Bool)

(declare-fun res!208456 () Bool)

(assert (=> b!249093 (=> (not res!208456) (not e!172589))))

(assert (=> b!249093 (= res!208456 (bvslt from!289 nBits!297))))

(assert (= (and start!53630 res!208457) b!249092))

(assert (= (and b!249092 res!208458) b!249093))

(assert (= (and b!249093 res!208456) b!249094))

(assert (= start!53630 b!249095))

(declare-fun m!375557 () Bool)

(assert (=> b!249095 m!375557))

(declare-fun m!375559 () Bool)

(assert (=> b!249094 m!375559))

(declare-fun m!375561 () Bool)

(assert (=> start!53630 m!375561))

(declare-fun m!375563 () Bool)

(assert (=> b!249092 m!375563))

(check-sat (not b!249094) (not b!249092) (not start!53630) (not b!249095))
(check-sat)
(get-model)

(declare-fun d!83706 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83706 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5945 (buf!6438 thiss!1005))) ((_ sign_extend 32) (currentByte!11863 thiss!1005)) ((_ sign_extend 32) (currentBit!11858 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5945 (buf!6438 thiss!1005))) ((_ sign_extend 32) (currentByte!11863 thiss!1005)) ((_ sign_extend 32) (currentBit!11858 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21179 () Bool)

(assert (= bs!21179 d!83706))

(declare-fun m!375573 () Bool)

(assert (=> bs!21179 m!375573))

(assert (=> b!249094 d!83706))

(declare-fun d!83708 () Bool)

(assert (=> d!83708 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5945 (buf!6438 thiss!1005))) ((_ sign_extend 32) (currentByte!11863 thiss!1005)) ((_ sign_extend 32) (currentBit!11858 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5945 (buf!6438 thiss!1005))) ((_ sign_extend 32) (currentByte!11863 thiss!1005)) ((_ sign_extend 32) (currentBit!11858 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21180 () Bool)

(assert (= bs!21180 d!83708))

(assert (=> bs!21180 m!375573))

(assert (=> b!249092 d!83708))

(declare-fun d!83712 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!83712 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11858 thiss!1005) (currentByte!11863 thiss!1005) (size!5945 (buf!6438 thiss!1005))))))

(declare-fun bs!21182 () Bool)

(assert (= bs!21182 d!83712))

(declare-fun m!375577 () Bool)

(assert (=> bs!21182 m!375577))

(assert (=> start!53630 d!83712))

(declare-fun d!83718 () Bool)

(assert (=> d!83718 (= (array_inv!5686 (buf!6438 thiss!1005)) (bvsge (size!5945 (buf!6438 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!249095 d!83718))

(check-sat (not d!83706) (not d!83712) (not d!83708))
(check-sat)
