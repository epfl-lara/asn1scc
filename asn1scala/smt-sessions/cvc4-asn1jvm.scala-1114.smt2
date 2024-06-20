; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31912 () Bool)

(assert start!31912)

(declare-fun res!132518 () Bool)

(declare-fun e!108062 () Bool)

(assert (=> start!31912 (=> (not res!132518) (not e!108062))))

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7459 0))(
  ( (array!7460 (arr!4302 (Array (_ BitVec 32) (_ BitVec 8))) (size!3381 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5930 0))(
  ( (BitStream!5931 (buf!3839 array!7459) (currentByte!7049 (_ BitVec 32)) (currentBit!7044 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5930)

(assert (=> start!31912 (= res!132518 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3381 (buf!3839 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7049 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7044 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3381 (buf!3839 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7049 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7044 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31912 e!108062))

(assert (=> start!31912 true))

(declare-fun e!108063 () Bool)

(declare-fun inv!12 (BitStream!5930) Bool)

(assert (=> start!31912 (and (inv!12 thiss!1825) e!108063)))

(declare-fun b!158710 () Bool)

(declare-fun res!132517 () Bool)

(assert (=> b!158710 (=> (not res!132517) (not e!108062))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158710 (= res!132517 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7044 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7049 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3381 (buf!3839 thiss!1825))))))))

(declare-fun b!158711 () Bool)

(assert (=> b!158711 (= e!108062 (bvslt ((_ sign_extend 32) nBits!578) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158712 () Bool)

(declare-fun array_inv!3128 (array!7459) Bool)

(assert (=> b!158712 (= e!108063 (array_inv!3128 (buf!3839 thiss!1825)))))

(assert (= (and start!31912 res!132518) b!158710))

(assert (= (and b!158710 res!132517) b!158711))

(assert (= start!31912 b!158712))

(declare-fun m!249247 () Bool)

(assert (=> start!31912 m!249247))

(declare-fun m!249249 () Bool)

(assert (=> b!158710 m!249249))

(declare-fun m!249251 () Bool)

(assert (=> b!158712 m!249251))

(push 1)

(assert (not start!31912))

(assert (not b!158710))

(assert (not b!158712))

(check-sat)

