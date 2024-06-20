; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42626 () Bool)

(assert start!42626)

(declare-fun b!201126 () Bool)

(declare-fun e!137946 () Bool)

(declare-fun e!137948 () Bool)

(assert (=> b!201126 (= e!137946 e!137948)))

(declare-fun res!168399 () Bool)

(assert (=> b!201126 (=> (not res!168399) (not e!137948))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!313962 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201126 (= res!168399 (= lt!313962 (bvsub (bvadd lt!313962 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!10208 0))(
  ( (array!10209 (arr!5425 (Array (_ BitVec 32) (_ BitVec 8))) (size!4495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8098 0))(
  ( (BitStream!8099 (buf!4996 array!10208) (currentByte!9394 (_ BitVec 32)) (currentBit!9389 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8098)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201126 (= lt!313962 (bitIndex!0 (size!4495 (buf!4996 thiss!1204)) (currentByte!9394 thiss!1204) (currentBit!9389 thiss!1204)))))

(declare-fun res!168395 () Bool)

(assert (=> start!42626 (=> (not res!168395) (not e!137946))))

(assert (=> start!42626 (= res!168395 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42626 e!137946))

(assert (=> start!42626 true))

(declare-fun e!137945 () Bool)

(declare-fun inv!12 (BitStream!8098) Bool)

(assert (=> start!42626 (and (inv!12 thiss!1204) e!137945)))

(declare-fun b!201127 () Bool)

(declare-fun res!168397 () Bool)

(assert (=> b!201127 (=> (not res!168397) (not e!137946))))

(assert (=> b!201127 (= res!168397 (= i!590 nBits!348))))

(declare-fun b!201128 () Bool)

(declare-fun array_inv!4236 (array!10208) Bool)

(assert (=> b!201128 (= e!137945 (array_inv!4236 (buf!4996 thiss!1204)))))

(declare-fun b!201129 () Bool)

(declare-fun res!168398 () Bool)

(assert (=> b!201129 (=> (not res!168398) (not e!137946))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201129 (= res!168398 (validate_offset_bits!1 ((_ sign_extend 32) (size!4495 (buf!4996 thiss!1204))) ((_ sign_extend 32) (currentByte!9394 thiss!1204)) ((_ sign_extend 32) (currentBit!9389 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201130 () Bool)

(assert (=> b!201130 (= e!137948 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8098 BitStream!8098) Bool)

(assert (=> b!201130 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14292 0))(
  ( (Unit!14293) )
))
(declare-fun lt!313963 () Unit!14292)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8098) Unit!14292)

(assert (=> b!201130 (= lt!313963 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201131 () Bool)

(declare-fun res!168396 () Bool)

(assert (=> b!201131 (=> (not res!168396) (not e!137946))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201131 (= res!168396 (invariant!0 (currentBit!9389 thiss!1204) (currentByte!9394 thiss!1204) (size!4495 (buf!4996 thiss!1204))))))

(assert (= (and start!42626 res!168395) b!201129))

(assert (= (and b!201129 res!168398) b!201131))

(assert (= (and b!201131 res!168396) b!201127))

(assert (= (and b!201127 res!168397) b!201126))

(assert (= (and b!201126 res!168399) b!201130))

(assert (= start!42626 b!201128))

(declare-fun m!311755 () Bool)

(assert (=> b!201131 m!311755))

(declare-fun m!311757 () Bool)

(assert (=> b!201129 m!311757))

(declare-fun m!311759 () Bool)

(assert (=> start!42626 m!311759))

(declare-fun m!311761 () Bool)

(assert (=> b!201130 m!311761))

(declare-fun m!311763 () Bool)

(assert (=> b!201130 m!311763))

(declare-fun m!311765 () Bool)

(assert (=> b!201126 m!311765))

(declare-fun m!311767 () Bool)

(assert (=> b!201128 m!311767))

(push 1)

(assert (not start!42626))

(assert (not b!201129))

(assert (not b!201130))

(assert (not b!201131))

(assert (not b!201126))

(assert (not b!201128))

(check-sat)

