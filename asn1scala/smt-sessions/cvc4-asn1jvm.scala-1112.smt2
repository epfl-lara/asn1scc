; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31874 () Bool)

(assert start!31874)

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7443 0))(
  ( (array!7444 (arr!4296 (Array (_ BitVec 32) (_ BitVec 8))) (size!3375 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5918 0))(
  ( (BitStream!5919 (buf!3833 array!7443) (currentByte!7039 (_ BitVec 32)) (currentBit!7034 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5918)

(assert (=> start!31874 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3375 (buf!3833 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7039 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7034 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3375 (buf!3833 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7039 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7034 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31874 true))

(declare-fun e!108008 () Bool)

(declare-fun inv!12 (BitStream!5918) Bool)

(assert (=> start!31874 (and (inv!12 thiss!1825) e!108008)))

(declare-fun b!158667 () Bool)

(declare-fun array_inv!3122 (array!7443) Bool)

(assert (=> b!158667 (= e!108008 (array_inv!3122 (buf!3833 thiss!1825)))))

(assert (= start!31874 b!158667))

(declare-fun m!249205 () Bool)

(assert (=> start!31874 m!249205))

(declare-fun m!249207 () Bool)

(assert (=> b!158667 m!249207))

(push 1)

(assert (not b!158667))

(assert (not start!31874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

