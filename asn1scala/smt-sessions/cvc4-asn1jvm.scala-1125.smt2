; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32002 () Bool)

(assert start!32002)

(declare-fun res!132533 () Bool)

(declare-fun e!108124 () Bool)

(assert (=> start!32002 (=> (not res!132533) (not e!108124))))

(declare-datatypes ((array!7480 0))(
  ( (array!7481 (arr!4311 (Array (_ BitVec 32) (_ BitVec 8))) (size!3390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5948 0))(
  ( (BitStream!5949 (buf!3848 array!7480) (currentByte!7059 (_ BitVec 32)) (currentBit!7054 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5948)

(assert (=> start!32002 (= res!132533 (and (bvsle ((_ sign_extend 32) (size!3390 (buf!3848 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7059 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7054 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3390 (buf!3848 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7059 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7054 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!32002 e!108124))

(declare-fun e!108125 () Bool)

(declare-fun inv!12 (BitStream!5948) Bool)

(assert (=> start!32002 (and (inv!12 thiss!1602) e!108125)))

(declare-fun b!158747 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158747 (= e!108124 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7054 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7059 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (size!3390 (buf!3848 thiss!1602)))))))))

(declare-fun b!158748 () Bool)

(declare-fun array_inv!3137 (array!7480) Bool)

(assert (=> b!158748 (= e!108125 (array_inv!3137 (buf!3848 thiss!1602)))))

(assert (= (and start!32002 res!132533) b!158747))

(assert (= start!32002 b!158748))

(declare-fun m!249307 () Bool)

(assert (=> start!32002 m!249307))

(declare-fun m!249309 () Bool)

(assert (=> b!158747 m!249309))

(declare-fun m!249311 () Bool)

(assert (=> b!158748 m!249311))

(push 1)

(assert (not b!158748))

(assert (not start!32002))

(assert (not b!158747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

