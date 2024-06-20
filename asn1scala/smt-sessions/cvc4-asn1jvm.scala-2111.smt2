; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53632 () Bool)

(assert start!53632)

(declare-fun b!249104 () Bool)

(declare-fun res!208466 () Bool)

(declare-fun e!172596 () Bool)

(assert (=> b!249104 (=> (not res!208466) (not e!172596))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13562 0))(
  ( (array!13563 (arr!6933 (Array (_ BitVec 32) (_ BitVec 8))) (size!5946 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10814 0))(
  ( (BitStream!10815 (buf!6439 array!13562) (currentByte!11864 (_ BitVec 32)) (currentBit!11859 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10814)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249104 (= res!208466 (validate_offset_bits!1 ((_ sign_extend 32) (size!5946 (buf!6439 thiss!1005))) ((_ sign_extend 32) (currentByte!11864 thiss!1005)) ((_ sign_extend 32) (currentBit!11859 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!208465 () Bool)

(assert (=> start!53632 (=> (not res!208465) (not e!172596))))

(assert (=> start!53632 (= res!208465 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53632 e!172596))

(assert (=> start!53632 true))

(declare-fun e!172597 () Bool)

(declare-fun inv!12 (BitStream!10814) Bool)

(assert (=> start!53632 (and (inv!12 thiss!1005) e!172597)))

(declare-fun b!249105 () Bool)

(declare-fun res!208467 () Bool)

(assert (=> b!249105 (=> (not res!208467) (not e!172596))))

(assert (=> b!249105 (= res!208467 (bvslt from!289 nBits!297))))

(declare-fun b!249106 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249106 (= e!172596 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5946 (buf!6439 thiss!1005))) ((_ sign_extend 32) (currentByte!11864 thiss!1005)) ((_ sign_extend 32) (currentBit!11859 thiss!1005)))))))

(declare-fun b!249107 () Bool)

(declare-fun array_inv!5687 (array!13562) Bool)

(assert (=> b!249107 (= e!172597 (array_inv!5687 (buf!6439 thiss!1005)))))

(assert (= (and start!53632 res!208465) b!249104))

(assert (= (and b!249104 res!208466) b!249105))

(assert (= (and b!249105 res!208467) b!249106))

(assert (= start!53632 b!249107))

(declare-fun m!375565 () Bool)

(assert (=> b!249104 m!375565))

(declare-fun m!375567 () Bool)

(assert (=> start!53632 m!375567))

(declare-fun m!375569 () Bool)

(assert (=> b!249106 m!375569))

(declare-fun m!375571 () Bool)

(assert (=> b!249107 m!375571))

(push 1)

(assert (not b!249104))

(assert (not start!53632))

(assert (not b!249107))

(assert (not b!249106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83722 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83722 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5946 (buf!6439 thiss!1005))) ((_ sign_extend 32) (currentByte!11864 thiss!1005)) ((_ sign_extend 32) (currentBit!11859 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5946 (buf!6439 thiss!1005))) ((_ sign_extend 32) (currentByte!11864 thiss!1005)) ((_ sign_extend 32) (currentBit!11859 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21185 () Bool)

(assert (= bs!21185 d!83722))

(declare-fun m!375581 () Bool)

(assert (=> bs!21185 m!375581))

(assert (=> b!249104 d!83722))

(declare-fun d!83724 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!83724 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11859 thiss!1005) (currentByte!11864 thiss!1005) (size!5946 (buf!6439 thiss!1005))))))

(declare-fun bs!21186 () Bool)

(assert (= bs!21186 d!83724))

(declare-fun m!375583 () Bool)

(assert (=> bs!21186 m!375583))

(assert (=> start!53632 d!83724))

(declare-fun d!83726 () Bool)

(assert (=> d!83726 (= (array_inv!5687 (buf!6439 thiss!1005)) (bvsge (size!5946 (buf!6439 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!249107 d!83726))

(declare-fun d!83728 () Bool)

(assert (=> d!83728 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5946 (buf!6439 thiss!1005))) ((_ sign_extend 32) (currentByte!11864 thiss!1005)) ((_ sign_extend 32) (currentBit!11859 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5946 (buf!6439 thiss!1005))) ((_ sign_extend 32) (currentByte!11864 thiss!1005)) ((_ sign_extend 32) (currentBit!11859 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21187 () Bool)

(assert (= bs!21187 d!83728))

(assert (=> bs!21187 m!375581))

(assert (=> b!249106 d!83728))

(push 1)

(assert (not d!83728))

(assert (not d!83724))

(assert (not d!83722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

