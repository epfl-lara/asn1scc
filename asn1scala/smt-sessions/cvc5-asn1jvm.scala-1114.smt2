; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31908 () Bool)

(assert start!31908)

(declare-fun res!132505 () Bool)

(declare-fun e!108045 () Bool)

(assert (=> start!31908 (=> (not res!132505) (not e!108045))))

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7455 0))(
  ( (array!7456 (arr!4300 (Array (_ BitVec 32) (_ BitVec 8))) (size!3379 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5926 0))(
  ( (BitStream!5927 (buf!3837 array!7455) (currentByte!7047 (_ BitVec 32)) (currentBit!7042 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5926)

(assert (=> start!31908 (= res!132505 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3379 (buf!3837 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7047 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7042 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3379 (buf!3837 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7047 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7042 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31908 e!108045))

(assert (=> start!31908 true))

(declare-fun e!108044 () Bool)

(declare-fun inv!12 (BitStream!5926) Bool)

(assert (=> start!31908 (and (inv!12 thiss!1825) e!108044)))

(declare-fun b!158692 () Bool)

(declare-fun res!132506 () Bool)

(assert (=> b!158692 (=> (not res!132506) (not e!108045))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158692 (= res!132506 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7042 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7047 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3379 (buf!3837 thiss!1825))))))))

(declare-fun b!158693 () Bool)

(assert (=> b!158693 (= e!108045 (bvslt ((_ sign_extend 32) nBits!578) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158694 () Bool)

(declare-fun array_inv!3126 (array!7455) Bool)

(assert (=> b!158694 (= e!108044 (array_inv!3126 (buf!3837 thiss!1825)))))

(assert (= (and start!31908 res!132505) b!158692))

(assert (= (and b!158692 res!132506) b!158693))

(assert (= start!31908 b!158694))

(declare-fun m!249235 () Bool)

(assert (=> start!31908 m!249235))

(declare-fun m!249237 () Bool)

(assert (=> b!158692 m!249237))

(declare-fun m!249239 () Bool)

(assert (=> b!158694 m!249239))

(push 1)

(assert (not start!31908))

(assert (not b!158692))

(assert (not b!158694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

