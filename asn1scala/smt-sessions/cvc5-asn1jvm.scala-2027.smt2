; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51816 () Bool)

(assert start!51816)

(declare-fun res!200052 () Bool)

(declare-fun e!165933 () Bool)

(assert (=> start!51816 (=> (not res!200052) (not e!165933))))

(declare-datatypes ((array!13008 0))(
  ( (array!13009 (arr!6688 (Array (_ BitVec 32) (_ BitVec 8))) (size!5701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10324 0))(
  ( (BitStream!10325 (buf!6155 array!13008) (currentByte!11464 (_ BitVec 32)) (currentBit!11459 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10324)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51816 (= res!200052 (validate_offset_bits!1 ((_ sign_extend 32) (size!5701 (buf!6155 thiss!1948))) ((_ sign_extend 32) (currentByte!11464 thiss!1948)) ((_ sign_extend 32) (currentBit!11459 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11464 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11459 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51816 e!165933))

(declare-fun e!165934 () Bool)

(declare-fun inv!12 (BitStream!10324) Bool)

(assert (=> start!51816 (and (inv!12 thiss!1948) e!165934)))

(declare-fun b!239563 () Bool)

(assert (=> b!239563 (= e!165933 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5701 (buf!6155 thiss!1948))) ((_ sign_extend 32) (currentByte!11464 thiss!1948)) ((_ sign_extend 32) (currentBit!11459 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11459 thiss!1948)) #b00000000000000000000000000000111)))))))

(declare-fun b!239564 () Bool)

(declare-fun array_inv!5442 (array!13008) Bool)

(assert (=> b!239564 (= e!165934 (array_inv!5442 (buf!6155 thiss!1948)))))

(assert (= (and start!51816 res!200052) b!239563))

(assert (= start!51816 b!239564))

(declare-fun m!361783 () Bool)

(assert (=> start!51816 m!361783))

(declare-fun m!361785 () Bool)

(assert (=> start!51816 m!361785))

(declare-fun m!361787 () Bool)

(assert (=> b!239563 m!361787))

(declare-fun m!361789 () Bool)

(assert (=> b!239564 m!361789))

(push 1)

(assert (not b!239564))

(assert (not b!239563))

(assert (not start!51816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80928 () Bool)

(assert (=> d!80928 (= (array_inv!5442 (buf!6155 thiss!1948)) (bvsge (size!5701 (buf!6155 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239564 d!80928))

(declare-fun d!80934 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80934 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5701 (buf!6155 thiss!1948))) ((_ sign_extend 32) (currentByte!11464 thiss!1948)) ((_ sign_extend 32) (currentBit!11459 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11459 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5701 (buf!6155 thiss!1948))) ((_ sign_extend 32) (currentByte!11464 thiss!1948)) ((_ sign_extend 32) (currentBit!11459 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11459 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20375 () Bool)

(assert (= bs!20375 d!80934))

(declare-fun m!361809 () Bool)

(assert (=> bs!20375 m!361809))

(assert (=> b!239563 d!80934))

(declare-fun d!80938 () Bool)

(assert (=> d!80938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5701 (buf!6155 thiss!1948))) ((_ sign_extend 32) (currentByte!11464 thiss!1948)) ((_ sign_extend 32) (currentBit!11459 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11464 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11459 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5701 (buf!6155 thiss!1948))) ((_ sign_extend 32) (currentByte!11464 thiss!1948)) ((_ sign_extend 32) (currentBit!11459 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11464 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11459 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20377 () Bool)

(assert (= bs!20377 d!80938))

(assert (=> bs!20377 m!361809))

(assert (=> start!51816 d!80938))

(declare-fun d!80942 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80942 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11459 thiss!1948) (currentByte!11464 thiss!1948) (size!5701 (buf!6155 thiss!1948))))))

(declare-fun bs!20379 () Bool)

(assert (= bs!20379 d!80942))

(declare-fun m!361813 () Bool)

(assert (=> bs!20379 m!361813))

(assert (=> start!51816 d!80942))

(push 1)

(assert (not d!80934))

(assert (not d!80942))

(assert (not d!80938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

