; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31890 () Bool)

(assert start!31890)

(declare-fun res!132494 () Bool)

(declare-fun e!108016 () Bool)

(assert (=> start!31890 (=> (not res!132494) (not e!108016))))

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7448 0))(
  ( (array!7449 (arr!4297 (Array (_ BitVec 32) (_ BitVec 8))) (size!3376 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5920 0))(
  ( (BitStream!5921 (buf!3834 array!7448) (currentByte!7041 (_ BitVec 32)) (currentBit!7036 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5920)

(assert (=> start!31890 (= res!132494 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3376 (buf!3834 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7041 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7036 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3376 (buf!3834 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7041 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7036 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31890 e!108016))

(assert (=> start!31890 true))

(declare-fun e!108017 () Bool)

(declare-fun inv!12 (BitStream!5920) Bool)

(assert (=> start!31890 (and (inv!12 thiss!1825) e!108017)))

(declare-fun b!158672 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158672 (= e!108016 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7036 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7041 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3376 (buf!3834 thiss!1825)))))))))

(declare-fun b!158673 () Bool)

(declare-fun array_inv!3123 (array!7448) Bool)

(assert (=> b!158673 (= e!108017 (array_inv!3123 (buf!3834 thiss!1825)))))

(assert (= (and start!31890 res!132494) b!158672))

(assert (= start!31890 b!158673))

(declare-fun m!249213 () Bool)

(assert (=> start!31890 m!249213))

(declare-fun m!249215 () Bool)

(assert (=> b!158672 m!249215))

(declare-fun m!249217 () Bool)

(assert (=> b!158673 m!249217))

(push 1)

(assert (not start!31890))

(assert (not b!158672))

(assert (not b!158673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

