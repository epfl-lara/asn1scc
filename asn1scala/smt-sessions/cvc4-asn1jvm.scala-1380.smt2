; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38134 () Bool)

(assert start!38134)

(declare-fun res!142335 () Bool)

(declare-fun e!120014 () Bool)

(assert (=> start!38134 (=> (not res!142335) (not e!120014))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9178 0))(
  ( (array!9179 (arr!4986 (Array (_ BitVec 32) (_ BitVec 8))) (size!4056 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7220 0))(
  ( (BitStream!7221 (buf!4484 array!9178) (currentByte!8518 (_ BitVec 32)) (currentBit!8513 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7220)

(assert (=> start!38134 (= res!142335 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4056 (buf!4484 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8518 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8513 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4056 (buf!4484 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8518 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8513 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38134 e!120014))

(assert (=> start!38134 true))

(declare-fun e!120015 () Bool)

(declare-fun inv!12 (BitStream!7220) Bool)

(assert (=> start!38134 (and (inv!12 thiss!1817) e!120015)))

(declare-fun b!171755 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171755 (= e!120014 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8513 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8518 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4056 (buf!4484 thiss!1817)))))))))

(declare-fun b!171756 () Bool)

(declare-fun array_inv!3797 (array!9178) Bool)

(assert (=> b!171756 (= e!120015 (array_inv!3797 (buf!4484 thiss!1817)))))

(assert (= (and start!38134 res!142335) b!171755))

(assert (= start!38134 b!171756))

(declare-fun m!271007 () Bool)

(assert (=> start!38134 m!271007))

(declare-fun m!271009 () Bool)

(assert (=> b!171755 m!271009))

(declare-fun m!271011 () Bool)

(assert (=> b!171756 m!271011))

(push 1)

(assert (not b!171756))

(assert (not b!171755))

(assert (not start!38134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60875 () Bool)

(assert (=> d!60875 (= (array_inv!3797 (buf!4484 thiss!1817)) (bvsge (size!4056 (buf!4484 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171756 d!60875))

(declare-fun d!60879 () Bool)

(assert (=> d!60879 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8513 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8518 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4056 (buf!4484 thiss!1817))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8513 thiss!1817))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8513 thiss!1817))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8518 thiss!1817))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8518 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4056 (buf!4484 thiss!1817))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8513 thiss!1817))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8518 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4056 (buf!4484 thiss!1817)))))))))))

(assert (=> b!171755 d!60879))

(declare-fun d!60883 () Bool)

(assert (=> d!60883 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8513 thiss!1817) (currentByte!8518 thiss!1817) (size!4056 (buf!4484 thiss!1817))))))

