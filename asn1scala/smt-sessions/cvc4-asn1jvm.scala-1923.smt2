; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50230 () Bool)

(assert start!50230)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12442 0))(
  ( (array!12443 (arr!6453 (Array (_ BitVec 32) (_ BitVec 8))) (size!5466 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9896 0))(
  ( (BitStream!9897 (buf!5941 array!12442) (currentByte!11050 (_ BitVec 32)) (currentBit!11045 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9896)

(assert (=> start!50230 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5466 (buf!5941 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11050 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11045 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!50230 true))

(declare-fun e!163042 () Bool)

(declare-fun inv!12 (BitStream!9896) Bool)

(assert (=> start!50230 (and (inv!12 thiss!1830) e!163042)))

(declare-fun b!235820 () Bool)

(declare-fun array_inv!5207 (array!12442) Bool)

(assert (=> b!235820 (= e!163042 (array_inv!5207 (buf!5941 thiss!1830)))))

(assert (= start!50230 b!235820))

(declare-fun m!358481 () Bool)

(assert (=> start!50230 m!358481))

(declare-fun m!358483 () Bool)

(assert (=> b!235820 m!358483))

(push 1)

(assert (not start!50230))

(assert (not b!235820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

