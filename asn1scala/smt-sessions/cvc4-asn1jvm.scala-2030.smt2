; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51856 () Bool)

(assert start!51856)

(declare-fun lt!374199 () (_ BitVec 32))

(declare-fun lt!374198 () (_ BitVec 32))

(assert (=> start!51856 (= lt!374199 (bvand lt!374198 #b10000000000000000000000000000000))))

(declare-datatypes ((array!13027 0))(
  ( (array!13028 (arr!6696 (Array (_ BitVec 32) (_ BitVec 8))) (size!5709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10340 0))(
  ( (BitStream!10341 (buf!6163 array!13027) (currentByte!11475 (_ BitVec 32)) (currentBit!11470 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10340)

(assert (=> start!51856 (= lt!374198 (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11475 thiss!1948) #b00000000000000000000000000000011)))))

(assert (=> start!51856 (and (= lt!374199 (bvand (currentBit!11470 thiss!1948) #b10000000000000000000000000000000)) (not (= lt!374199 (bvand (bvadd lt!374198 (currentBit!11470 thiss!1948)) #b10000000000000000000000000000000))))))

(declare-fun e!165988 () Bool)

(declare-fun inv!12 (BitStream!10340) Bool)

(assert (=> start!51856 (and (inv!12 thiss!1948) e!165988)))

(declare-fun b!239594 () Bool)

(declare-fun array_inv!5450 (array!13027) Bool)

(assert (=> b!239594 (= e!165988 (array_inv!5450 (buf!6163 thiss!1948)))))

(assert (= start!51856 b!239594))

(declare-fun m!361839 () Bool)

(assert (=> start!51856 m!361839))

(declare-fun m!361841 () Bool)

(assert (=> b!239594 m!361841))

(push 1)

(assert (not start!51856))

(assert (not b!239594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80964 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80964 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11470 thiss!1948) (currentByte!11475 thiss!1948) (size!5709 (buf!6163 thiss!1948))))))

(declare-fun bs!20394 () Bool)

(assert (= bs!20394 d!80964))

(declare-fun m!361847 () Bool)

(assert (=> bs!20394 m!361847))

(assert (=> start!51856 d!80964))

(declare-fun d!80970 () Bool)

(assert (=> d!80970 (= (array_inv!5450 (buf!6163 thiss!1948)) (bvsge (size!5709 (buf!6163 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239594 d!80970))

(push 1)

