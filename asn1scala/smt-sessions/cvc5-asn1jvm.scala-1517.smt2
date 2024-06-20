; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42416 () Bool)

(assert start!42416)

(declare-fun res!167813 () Bool)

(declare-fun e!137495 () Bool)

(assert (=> start!42416 (=> (not res!167813) (not e!137495))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42416 (= res!167813 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42416 e!137495))

(assert (=> start!42416 true))

(declare-datatypes ((array!10130 0))(
  ( (array!10131 (arr!5392 (Array (_ BitVec 32) (_ BitVec 8))) (size!4462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8032 0))(
  ( (BitStream!8033 (buf!4963 array!10130) (currentByte!9325 (_ BitVec 32)) (currentBit!9320 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8032)

(declare-fun e!137494 () Bool)

(declare-fun inv!12 (BitStream!8032) Bool)

(assert (=> start!42416 (and (inv!12 thiss!1204) e!137494)))

(declare-fun b!200445 () Bool)

(declare-fun res!167814 () Bool)

(assert (=> b!200445 (=> (not res!167814) (not e!137495))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200445 (= res!167814 (validate_offset_bits!1 ((_ sign_extend 32) (size!4462 (buf!4963 thiss!1204))) ((_ sign_extend 32) (currentByte!9325 thiss!1204)) ((_ sign_extend 32) (currentBit!9320 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200446 () Bool)

(assert (=> b!200446 (= e!137495 (and (not (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000))) (not (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))))

(declare-fun b!200447 () Bool)

(declare-fun array_inv!4203 (array!10130) Bool)

(assert (=> b!200447 (= e!137494 (array_inv!4203 (buf!4963 thiss!1204)))))

(assert (= (and start!42416 res!167813) b!200445))

(assert (= (and b!200445 res!167814) b!200446))

(assert (= start!42416 b!200447))

(declare-fun m!311269 () Bool)

(assert (=> start!42416 m!311269))

(declare-fun m!311271 () Bool)

(assert (=> b!200445 m!311271))

(declare-fun m!311273 () Bool)

(assert (=> b!200447 m!311273))

(push 1)

(assert (not start!42416))

(assert (not b!200447))

(assert (not b!200445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

