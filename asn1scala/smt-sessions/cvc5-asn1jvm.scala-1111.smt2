; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31864 () Bool)

(assert start!31864)

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7433 0))(
  ( (array!7434 (arr!4291 (Array (_ BitVec 32) (_ BitVec 8))) (size!3370 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5908 0))(
  ( (BitStream!5909 (buf!3828 array!7433) (currentByte!7034 (_ BitVec 32)) (currentBit!7029 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5908)

(assert (=> start!31864 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!3370 (buf!3828 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7034 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7029 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!31864 true))

(declare-fun e!107978 () Bool)

(declare-fun inv!12 (BitStream!5908) Bool)

(assert (=> start!31864 (and (inv!12 thiss!1825) e!107978)))

(declare-fun b!158652 () Bool)

(declare-fun array_inv!3117 (array!7433) Bool)

(assert (=> b!158652 (= e!107978 (array_inv!3117 (buf!3828 thiss!1825)))))

(assert (= start!31864 b!158652))

(declare-fun m!249185 () Bool)

(assert (=> start!31864 m!249185))

(declare-fun m!249187 () Bool)

(assert (=> b!158652 m!249187))

(push 1)

(assert (not b!158652))

(assert (not start!31864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

