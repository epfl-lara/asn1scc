; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38888 () Bool)

(assert start!38888)

(declare-fun res!144954 () Bool)

(declare-fun e!122039 () Bool)

(assert (=> start!38888 (=> (not res!144954) (not e!122039))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9408 0))(
  ( (array!9409 (arr!5080 (Array (_ BitVec 32) (_ BitVec 8))) (size!4150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7408 0))(
  ( (BitStream!7409 (buf!4587 array!9408) (currentByte!8708 (_ BitVec 32)) (currentBit!8703 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7408)

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38888 (= res!144954 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4150 (buf!4587 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8708 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8703 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4150 (buf!4587 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8708 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8703 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38888 e!122039))

(assert (=> start!38888 true))

(declare-fun e!122040 () Bool)

(declare-fun inv!12 (BitStream!7408) Bool)

(assert (=> start!38888 (and (inv!12 thiss!1204) e!122040)))

(declare-fun b!175040 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175040 (= e!122039 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8703 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8708 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4150 (buf!4587 thiss!1204)))))))))

(declare-fun b!175041 () Bool)

(declare-fun array_inv!3891 (array!9408) Bool)

(assert (=> b!175041 (= e!122040 (array_inv!3891 (buf!4587 thiss!1204)))))

(assert (= (and start!38888 res!144954) b!175040))

(assert (= start!38888 b!175041))

(declare-fun m!275289 () Bool)

(assert (=> start!38888 m!275289))

(declare-fun m!275291 () Bool)

(assert (=> b!175040 m!275291))

(declare-fun m!275293 () Bool)

(assert (=> b!175041 m!275293))

(push 1)

(assert (not b!175041))

(assert (not b!175040))

(assert (not start!38888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61893 () Bool)

(assert (=> d!61893 (= (array_inv!3891 (buf!4587 thiss!1204)) (bvsge (size!4150 (buf!4587 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175041 d!61893))

(declare-fun d!61897 () Bool)

(assert (=> d!61897 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8703 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8708 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4150 (buf!4587 thiss!1204))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8703 thiss!1204))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8703 thiss!1204))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8708 thiss!1204))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8708 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4150 (buf!4587 thiss!1204))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8703 thiss!1204))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8708 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4150 (buf!4587 thiss!1204)))))))))))

(assert (=> b!175040 d!61897))

(declare-fun d!61901 () Bool)

(assert (=> d!61901 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8703 thiss!1204) (currentByte!8708 thiss!1204) (size!4150 (buf!4587 thiss!1204))))))

(declare-fun bs!15417 () Bool)

(assert (= bs!15417 d!61901))

(declare-fun m!275309 () Bool)

(assert (=> bs!15417 m!275309))

(assert (=> start!38888 d!61901))

(push 1)

(assert (not d!61901))

(check-sat)

