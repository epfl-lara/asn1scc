; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51846 () Bool)

(assert start!51846)

(declare-datatypes ((array!13017 0))(
  ( (array!13018 (arr!6691 (Array (_ BitVec 32) (_ BitVec 8))) (size!5704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10330 0))(
  ( (BitStream!10331 (buf!6158 array!13017) (currentByte!11470 (_ BitVec 32)) (currentBit!11465 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10330)

(assert (=> start!51846 (not (= (bvand (currentByte!11470 thiss!1948) #b00000000000000000000000000000011) (bvsdiv (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11470 thiss!1948) #b00000000000000000000000000000011)) #b00000000000000000000000000001000)))))

(declare-fun e!165958 () Bool)

(declare-fun inv!12 (BitStream!10330) Bool)

(assert (=> start!51846 (and (inv!12 thiss!1948) e!165958)))

(declare-fun b!239579 () Bool)

(declare-fun array_inv!5445 (array!13017) Bool)

(assert (=> b!239579 (= e!165958 (array_inv!5445 (buf!6158 thiss!1948)))))

(assert (= start!51846 b!239579))

(declare-fun m!361819 () Bool)

(assert (=> start!51846 m!361819))

(declare-fun m!361821 () Bool)

(assert (=> b!239579 m!361821))

(push 1)

(assert (not start!51846))

(assert (not b!239579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

