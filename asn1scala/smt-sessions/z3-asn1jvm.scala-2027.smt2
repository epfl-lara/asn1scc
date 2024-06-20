; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51818 () Bool)

(assert start!51818)

(declare-fun res!200055 () Bool)

(declare-fun e!165942 () Bool)

(assert (=> start!51818 (=> (not res!200055) (not e!165942))))

(declare-datatypes ((array!13010 0))(
  ( (array!13011 (arr!6689 (Array (_ BitVec 32) (_ BitVec 8))) (size!5702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10326 0))(
  ( (BitStream!10327 (buf!6156 array!13010) (currentByte!11465 (_ BitVec 32)) (currentBit!11460 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10326)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51818 (= res!200055 (validate_offset_bits!1 ((_ sign_extend 32) (size!5702 (buf!6156 thiss!1948))) ((_ sign_extend 32) (currentByte!11465 thiss!1948)) ((_ sign_extend 32) (currentBit!11460 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11465 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11460 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51818 e!165942))

(declare-fun e!165943 () Bool)

(declare-fun inv!12 (BitStream!10326) Bool)

(assert (=> start!51818 (and (inv!12 thiss!1948) e!165943)))

(declare-fun b!239569 () Bool)

(assert (=> b!239569 (= e!165942 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5702 (buf!6156 thiss!1948))) ((_ sign_extend 32) (currentByte!11465 thiss!1948)) ((_ sign_extend 32) (currentBit!11460 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11460 thiss!1948)) #b00000000000000000000000000000111)))))))

(declare-fun b!239570 () Bool)

(declare-fun array_inv!5443 (array!13010) Bool)

(assert (=> b!239570 (= e!165943 (array_inv!5443 (buf!6156 thiss!1948)))))

(assert (= (and start!51818 res!200055) b!239569))

(assert (= start!51818 b!239570))

(declare-fun m!361791 () Bool)

(assert (=> start!51818 m!361791))

(declare-fun m!361793 () Bool)

(assert (=> start!51818 m!361793))

(declare-fun m!361795 () Bool)

(assert (=> b!239569 m!361795))

(declare-fun m!361797 () Bool)

(assert (=> b!239570 m!361797))

(check-sat (not b!239570) (not b!239569) (not start!51818))
(check-sat)
(get-model)

(declare-fun d!80932 () Bool)

(assert (=> d!80932 (= (array_inv!5443 (buf!6156 thiss!1948)) (bvsge (size!5702 (buf!6156 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239570 d!80932))

(declare-fun d!80944 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80944 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5702 (buf!6156 thiss!1948))) ((_ sign_extend 32) (currentByte!11465 thiss!1948)) ((_ sign_extend 32) (currentBit!11460 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11460 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5702 (buf!6156 thiss!1948))) ((_ sign_extend 32) (currentByte!11465 thiss!1948)) ((_ sign_extend 32) (currentBit!11460 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11460 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20380 () Bool)

(assert (= bs!20380 d!80944))

(declare-fun m!361815 () Bool)

(assert (=> bs!20380 m!361815))

(assert (=> b!239569 d!80944))

(declare-fun d!80948 () Bool)

(assert (=> d!80948 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5702 (buf!6156 thiss!1948))) ((_ sign_extend 32) (currentByte!11465 thiss!1948)) ((_ sign_extend 32) (currentBit!11460 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11465 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11460 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5702 (buf!6156 thiss!1948))) ((_ sign_extend 32) (currentByte!11465 thiss!1948)) ((_ sign_extend 32) (currentBit!11460 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11465 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11460 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20381 () Bool)

(assert (= bs!20381 d!80948))

(assert (=> bs!20381 m!361815))

(assert (=> start!51818 d!80948))

(declare-fun d!80950 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80950 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11460 thiss!1948) (currentByte!11465 thiss!1948) (size!5702 (buf!6156 thiss!1948))))))

(declare-fun bs!20382 () Bool)

(assert (= bs!20382 d!80950))

(declare-fun m!361817 () Bool)

(assert (=> bs!20382 m!361817))

(assert (=> start!51818 d!80950))

(check-sat (not d!80948) (not d!80944) (not d!80950))
(check-sat)
