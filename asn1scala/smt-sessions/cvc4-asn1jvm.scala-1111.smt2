; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31868 () Bool)

(assert start!31868)

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7437 0))(
  ( (array!7438 (arr!4293 (Array (_ BitVec 32) (_ BitVec 8))) (size!3372 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5912 0))(
  ( (BitStream!5913 (buf!3830 array!7437) (currentByte!7036 (_ BitVec 32)) (currentBit!7031 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5912)

(assert (=> start!31868 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!3372 (buf!3830 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7036 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7031 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!31868 true))

(declare-fun e!107990 () Bool)

(declare-fun inv!12 (BitStream!5912) Bool)

(assert (=> start!31868 (and (inv!12 thiss!1825) e!107990)))

(declare-fun b!158658 () Bool)

(declare-fun array_inv!3119 (array!7437) Bool)

(assert (=> b!158658 (= e!107990 (array_inv!3119 (buf!3830 thiss!1825)))))

(assert (= start!31868 b!158658))

(declare-fun m!249193 () Bool)

(assert (=> start!31868 m!249193))

(declare-fun m!249195 () Bool)

(assert (=> b!158658 m!249195))

(push 1)

