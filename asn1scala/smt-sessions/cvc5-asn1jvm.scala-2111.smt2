; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53628 () Bool)

(assert start!53628)

(declare-fun b!249083 () Bool)

(declare-fun e!172578 () Bool)

(declare-datatypes ((array!13558 0))(
  ( (array!13559 (arr!6931 (Array (_ BitVec 32) (_ BitVec 8))) (size!5944 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10810 0))(
  ( (BitStream!10811 (buf!6437 array!13558) (currentByte!11862 (_ BitVec 32)) (currentBit!11857 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10810)

(declare-fun array_inv!5685 (array!13558) Bool)

(assert (=> b!249083 (= e!172578 (array_inv!5685 (buf!6437 thiss!1005)))))

(declare-fun res!208448 () Bool)

(declare-fun e!172579 () Bool)

(assert (=> start!53628 (=> (not res!208448) (not e!172579))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53628 (= res!208448 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53628 e!172579))

(assert (=> start!53628 true))

(declare-fun inv!12 (BitStream!10810) Bool)

(assert (=> start!53628 (and (inv!12 thiss!1005) e!172578)))

(declare-fun b!249082 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249082 (= e!172579 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5944 (buf!6437 thiss!1005))) ((_ sign_extend 32) (currentByte!11862 thiss!1005)) ((_ sign_extend 32) (currentBit!11857 thiss!1005)))))))

(declare-fun b!249081 () Bool)

(declare-fun res!208447 () Bool)

(assert (=> b!249081 (=> (not res!208447) (not e!172579))))

(assert (=> b!249081 (= res!208447 (bvslt from!289 nBits!297))))

(declare-fun b!249080 () Bool)

(declare-fun res!208449 () Bool)

(assert (=> b!249080 (=> (not res!208449) (not e!172579))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249080 (= res!208449 (validate_offset_bits!1 ((_ sign_extend 32) (size!5944 (buf!6437 thiss!1005))) ((_ sign_extend 32) (currentByte!11862 thiss!1005)) ((_ sign_extend 32) (currentBit!11857 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53628 res!208448) b!249080))

(assert (= (and b!249080 res!208449) b!249081))

(assert (= (and b!249081 res!208447) b!249082))

(assert (= start!53628 b!249083))

(declare-fun m!375549 () Bool)

(assert (=> b!249083 m!375549))

(declare-fun m!375551 () Bool)

(assert (=> start!53628 m!375551))

(declare-fun m!375553 () Bool)

(assert (=> b!249082 m!375553))

(declare-fun m!375555 () Bool)

(assert (=> b!249080 m!375555))

(push 1)

(assert (not b!249083))

(assert (not b!249082))

(assert (not b!249080))

(assert (not start!53628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83710 () Bool)

(assert (=> d!83710 (= (array_inv!5685 (buf!6437 thiss!1005)) (bvsge (size!5944 (buf!6437 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!249083 d!83710))

(declare-fun d!83714 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83714 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5944 (buf!6437 thiss!1005))) ((_ sign_extend 32) (currentByte!11862 thiss!1005)) ((_ sign_extend 32) (currentBit!11857 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5944 (buf!6437 thiss!1005))) ((_ sign_extend 32) (currentByte!11862 thiss!1005)) ((_ sign_extend 32) (currentBit!11857 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21181 () Bool)

(assert (= bs!21181 d!83714))

(declare-fun m!375575 () Bool)

(assert (=> bs!21181 m!375575))

(assert (=> b!249082 d!83714))

(declare-fun d!83716 () Bool)

(assert (=> d!83716 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5944 (buf!6437 thiss!1005))) ((_ sign_extend 32) (currentByte!11862 thiss!1005)) ((_ sign_extend 32) (currentBit!11857 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5944 (buf!6437 thiss!1005))) ((_ sign_extend 32) (currentByte!11862 thiss!1005)) ((_ sign_extend 32) (currentBit!11857 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21183 () Bool)

(assert (= bs!21183 d!83716))

(assert (=> bs!21183 m!375575))

(assert (=> b!249080 d!83716))

(declare-fun d!83720 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!83720 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11857 thiss!1005) (currentByte!11862 thiss!1005) (size!5944 (buf!6437 thiss!1005))))))

(declare-fun bs!21184 () Bool)

(assert (= bs!21184 d!83720))

(declare-fun m!375579 () Bool)

(assert (=> bs!21184 m!375579))

(assert (=> start!53628 d!83720))

(push 1)

(assert (not d!83716))

(assert (not d!83720))

(assert (not d!83714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

