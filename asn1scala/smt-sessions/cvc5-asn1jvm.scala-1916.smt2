; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50162 () Bool)

(assert start!50162)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12398 0))(
  ( (array!12399 (arr!6433 (Array (_ BitVec 32) (_ BitVec 8))) (size!5446 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9856 0))(
  ( (BitStream!9857 (buf!5921 array!12398) (currentByte!11027 (_ BitVec 32)) (currentBit!11022 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9856)

(assert (=> start!50162 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5446 (buf!5921 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11027 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11022 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5446 (buf!5921 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11027 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11022 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50162 true))

(declare-fun e!162877 () Bool)

(declare-fun inv!12 (BitStream!9856) Bool)

(assert (=> start!50162 (and (inv!12 thiss!1848) e!162877)))

(declare-fun b!235670 () Bool)

(declare-fun array_inv!5187 (array!12398) Bool)

(assert (=> b!235670 (= e!162877 (array_inv!5187 (buf!5921 thiss!1848)))))

(assert (= start!50162 b!235670))

(declare-fun m!358357 () Bool)

(assert (=> start!50162 m!358357))

(declare-fun m!358359 () Bool)

(assert (=> b!235670 m!358359))

(push 1)

(assert (not b!235670))

(assert (not start!50162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79544 () Bool)

(assert (=> d!79544 (= (array_inv!5187 (buf!5921 thiss!1848)) (bvsge (size!5446 (buf!5921 thiss!1848)) #b00000000000000000000000000000000))))

(assert (=> b!235670 d!79544))

(declare-fun d!79546 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79546 (= (inv!12 thiss!1848) (invariant!0 (currentBit!11022 thiss!1848) (currentByte!11027 thiss!1848) (size!5446 (buf!5921 thiss!1848))))))

