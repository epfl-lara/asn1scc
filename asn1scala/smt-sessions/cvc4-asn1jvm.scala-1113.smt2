; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31894 () Bool)

(assert start!31894)

(declare-fun res!132500 () Bool)

(declare-fun e!108034 () Bool)

(assert (=> start!31894 (=> (not res!132500) (not e!108034))))

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7452 0))(
  ( (array!7453 (arr!4299 (Array (_ BitVec 32) (_ BitVec 8))) (size!3378 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5924 0))(
  ( (BitStream!5925 (buf!3836 array!7452) (currentByte!7043 (_ BitVec 32)) (currentBit!7038 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5924)

(assert (=> start!31894 (= res!132500 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3378 (buf!3836 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7043 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7038 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3378 (buf!3836 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7043 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7038 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31894 e!108034))

(assert (=> start!31894 true))

(declare-fun e!108035 () Bool)

(declare-fun inv!12 (BitStream!5924) Bool)

(assert (=> start!31894 (and (inv!12 thiss!1825) e!108035)))

(declare-fun b!158684 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158684 (= e!108034 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7038 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7043 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3378 (buf!3836 thiss!1825)))))))))

(declare-fun b!158685 () Bool)

(declare-fun array_inv!3125 (array!7452) Bool)

(assert (=> b!158685 (= e!108035 (array_inv!3125 (buf!3836 thiss!1825)))))

(assert (= (and start!31894 res!132500) b!158684))

(assert (= start!31894 b!158685))

(declare-fun m!249225 () Bool)

(assert (=> start!31894 m!249225))

(declare-fun m!249227 () Bool)

(assert (=> b!158684 m!249227))

(declare-fun m!249229 () Bool)

(assert (=> b!158685 m!249229))

(push 1)

(assert (not b!158684))

(assert (not b!158685))

(assert (not start!31894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

