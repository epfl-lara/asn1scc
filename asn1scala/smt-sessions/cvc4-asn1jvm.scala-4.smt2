; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56 () Bool)

(assert start!56)

(declare-datatypes ((array!25 0))(
  ( (array!26 (arr!399 (Array (_ BitVec 32) (_ BitVec 8))) (size!12 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8 0))(
  ( (BitStream!9 (buf!324 array!25) (currentByte!1207 (_ BitVec 32)) (currentBit!1202 (_ BitVec 32))) )
))
(declare-fun thiss!909 () BitStream!8)

(assert (=> start!56 (and (bvsgt (currentBit!1202 thiss!909) #b00000000000000000000000000000000) (= (bvand (currentByte!1207 thiss!909) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!1207 thiss!909) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!1207 thiss!909)) #b10000000000000000000000000000000))))))

(declare-fun e!70 () Bool)

(declare-fun inv!12 (BitStream!8) Bool)

(assert (=> start!56 (and (inv!12 thiss!909) e!70)))

(declare-fun b!358 () Bool)

(declare-fun array_inv!9 (array!25) Bool)

(assert (=> b!358 (= e!70 (array_inv!9 (buf!324 thiss!909)))))

(assert (= start!56 b!358))

(declare-fun m!51 () Bool)

(assert (=> start!56 m!51))

(declare-fun m!53 () Bool)

(assert (=> b!358 m!53))

(push 1)

(assert (not start!56))

(assert (not b!358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!720 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!720 (= (inv!12 thiss!909) (invariant!0 (currentBit!1202 thiss!909) (currentByte!1207 thiss!909) (size!12 (buf!324 thiss!909))))))

(declare-fun bs!340 () Bool)

(assert (= bs!340 d!720))

(declare-fun m!57 () Bool)

(assert (=> bs!340 m!57))

(assert (=> start!56 d!720))

(declare-fun d!726 () Bool)

(assert (=> d!726 (= (array_inv!9 (buf!324 thiss!909)) (bvsge (size!12 (buf!324 thiss!909)) #b00000000000000000000000000000000))))

(assert (=> b!358 d!726))

(push 1)

(assert (not d!720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!732 () Bool)

