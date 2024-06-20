; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38158 () Bool)

(assert start!38158)

(declare-fun res!142353 () Bool)

(declare-fun e!120043 () Bool)

(assert (=> start!38158 (=> (not res!142353) (not e!120043))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9187 0))(
  ( (array!9188 (arr!4989 (Array (_ BitVec 32) (_ BitVec 8))) (size!4059 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7226 0))(
  ( (BitStream!7227 (buf!4487 array!9187) (currentByte!8524 (_ BitVec 32)) (currentBit!8519 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7226)

(assert (=> start!38158 (= res!142353 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4059 (buf!4487 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8524 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8519 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4059 (buf!4487 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8524 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8519 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38158 e!120043))

(assert (=> start!38158 true))

(declare-fun e!120042 () Bool)

(declare-fun inv!12 (BitStream!7226) Bool)

(assert (=> start!38158 (and (inv!12 thiss!1817) e!120042)))

(declare-fun b!171781 () Bool)

(declare-fun res!142352 () Bool)

(assert (=> b!171781 (=> (not res!142352) (not e!120043))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171781 (= res!142352 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8519 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8524 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4059 (buf!4487 thiss!1817))))))))

(declare-fun b!171782 () Bool)

(assert (=> b!171782 (= e!120043 (bvslt ((_ sign_extend 32) nBits!575) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171783 () Bool)

(declare-fun array_inv!3800 (array!9187) Bool)

(assert (=> b!171783 (= e!120042 (array_inv!3800 (buf!4487 thiss!1817)))))

(assert (= (and start!38158 res!142353) b!171781))

(assert (= (and b!171781 res!142352) b!171782))

(assert (= start!38158 b!171783))

(declare-fun m!271031 () Bool)

(assert (=> start!38158 m!271031))

(declare-fun m!271033 () Bool)

(assert (=> b!171781 m!271033))

(declare-fun m!271035 () Bool)

(assert (=> b!171783 m!271035))

(push 1)

(assert (not b!171783))

(assert (not b!171781))

(assert (not start!38158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

