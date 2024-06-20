; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42616 () Bool)

(assert start!42616)

(declare-fun b!201036 () Bool)

(declare-fun e!137887 () Bool)

(declare-fun e!137888 () Bool)

(assert (=> b!201036 (= e!137887 e!137888)))

(declare-fun res!168321 () Bool)

(assert (=> b!201036 (=> (not res!168321) (not e!137888))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!313932 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201036 (= res!168321 (= lt!313932 (bvsub (bvadd lt!313932 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!10198 0))(
  ( (array!10199 (arr!5420 (Array (_ BitVec 32) (_ BitVec 8))) (size!4490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8088 0))(
  ( (BitStream!8089 (buf!4991 array!10198) (currentByte!9389 (_ BitVec 32)) (currentBit!9384 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8088)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201036 (= lt!313932 (bitIndex!0 (size!4490 (buf!4991 thiss!1204)) (currentByte!9389 thiss!1204) (currentBit!9384 thiss!1204)))))

(declare-fun b!201038 () Bool)

(declare-fun res!168322 () Bool)

(assert (=> b!201038 (=> (not res!168322) (not e!137887))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201038 (= res!168322 (validate_offset_bits!1 ((_ sign_extend 32) (size!4490 (buf!4991 thiss!1204))) ((_ sign_extend 32) (currentByte!9389 thiss!1204)) ((_ sign_extend 32) (currentBit!9384 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201039 () Bool)

(declare-fun res!168323 () Bool)

(assert (=> b!201039 (=> (not res!168323) (not e!137887))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201039 (= res!168323 (invariant!0 (currentBit!9384 thiss!1204) (currentByte!9389 thiss!1204) (size!4490 (buf!4991 thiss!1204))))))

(declare-fun b!201037 () Bool)

(assert (=> b!201037 (= e!137888 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8088 BitStream!8088) Bool)

(assert (=> b!201037 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14282 0))(
  ( (Unit!14283) )
))
(declare-fun lt!313933 () Unit!14282)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8088) Unit!14282)

(assert (=> b!201037 (= lt!313933 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!168320 () Bool)

(assert (=> start!42616 (=> (not res!168320) (not e!137887))))

(assert (=> start!42616 (= res!168320 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42616 e!137887))

(assert (=> start!42616 true))

(declare-fun e!137885 () Bool)

(declare-fun inv!12 (BitStream!8088) Bool)

(assert (=> start!42616 (and (inv!12 thiss!1204) e!137885)))

(declare-fun b!201040 () Bool)

(declare-fun array_inv!4231 (array!10198) Bool)

(assert (=> b!201040 (= e!137885 (array_inv!4231 (buf!4991 thiss!1204)))))

(declare-fun b!201041 () Bool)

(declare-fun res!168324 () Bool)

(assert (=> b!201041 (=> (not res!168324) (not e!137887))))

(assert (=> b!201041 (= res!168324 (= i!590 nBits!348))))

(assert (= (and start!42616 res!168320) b!201038))

(assert (= (and b!201038 res!168322) b!201039))

(assert (= (and b!201039 res!168323) b!201041))

(assert (= (and b!201041 res!168324) b!201036))

(assert (= (and b!201036 res!168321) b!201037))

(assert (= start!42616 b!201040))

(declare-fun m!311685 () Bool)

(assert (=> b!201039 m!311685))

(declare-fun m!311687 () Bool)

(assert (=> b!201037 m!311687))

(declare-fun m!311689 () Bool)

(assert (=> b!201037 m!311689))

(declare-fun m!311691 () Bool)

(assert (=> b!201036 m!311691))

(declare-fun m!311693 () Bool)

(assert (=> start!42616 m!311693))

(declare-fun m!311695 () Bool)

(assert (=> b!201038 m!311695))

(declare-fun m!311697 () Bool)

(assert (=> b!201040 m!311697))

(check-sat (not b!201039) (not b!201036) (not b!201037) (not b!201038) (not b!201040) (not start!42616))
(check-sat)
