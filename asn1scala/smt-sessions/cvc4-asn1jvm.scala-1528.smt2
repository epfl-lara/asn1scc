; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42630 () Bool)

(assert start!42630)

(declare-fun b!201162 () Bool)

(declare-fun e!137969 () Bool)

(assert (=> b!201162 (= e!137969 (not true))))

(declare-datatypes ((array!10212 0))(
  ( (array!10213 (arr!5427 (Array (_ BitVec 32) (_ BitVec 8))) (size!4497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8102 0))(
  ( (BitStream!8103 (buf!4998 array!10212) (currentByte!9396 (_ BitVec 32)) (currentBit!9391 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8102)

(declare-fun isPrefixOf!0 (BitStream!8102 BitStream!8102) Bool)

(assert (=> b!201162 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14296 0))(
  ( (Unit!14297) )
))
(declare-fun lt!313975 () Unit!14296)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8102) Unit!14296)

(assert (=> b!201162 (= lt!313975 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!168426 () Bool)

(declare-fun e!137970 () Bool)

(assert (=> start!42630 (=> (not res!168426) (not e!137970))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42630 (= res!168426 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42630 e!137970))

(assert (=> start!42630 true))

(declare-fun e!137971 () Bool)

(declare-fun inv!12 (BitStream!8102) Bool)

(assert (=> start!42630 (and (inv!12 thiss!1204) e!137971)))

(declare-fun b!201163 () Bool)

(declare-fun res!168428 () Bool)

(assert (=> b!201163 (=> (not res!168428) (not e!137970))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201163 (= res!168428 (validate_offset_bits!1 ((_ sign_extend 32) (size!4497 (buf!4998 thiss!1204))) ((_ sign_extend 32) (currentByte!9396 thiss!1204)) ((_ sign_extend 32) (currentBit!9391 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201164 () Bool)

(declare-fun res!168429 () Bool)

(assert (=> b!201164 (=> (not res!168429) (not e!137970))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201164 (= res!168429 (invariant!0 (currentBit!9391 thiss!1204) (currentByte!9396 thiss!1204) (size!4497 (buf!4998 thiss!1204))))))

(declare-fun b!201165 () Bool)

(assert (=> b!201165 (= e!137970 e!137969)))

(declare-fun res!168427 () Bool)

(assert (=> b!201165 (=> (not res!168427) (not e!137969))))

(declare-fun lt!313974 () (_ BitVec 64))

(assert (=> b!201165 (= res!168427 (= lt!313974 (bvsub (bvadd lt!313974 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201165 (= lt!313974 (bitIndex!0 (size!4497 (buf!4998 thiss!1204)) (currentByte!9396 thiss!1204) (currentBit!9391 thiss!1204)))))

(declare-fun b!201166 () Bool)

(declare-fun array_inv!4238 (array!10212) Bool)

(assert (=> b!201166 (= e!137971 (array_inv!4238 (buf!4998 thiss!1204)))))

(declare-fun b!201167 () Bool)

(declare-fun res!168425 () Bool)

(assert (=> b!201167 (=> (not res!168425) (not e!137970))))

(assert (=> b!201167 (= res!168425 (= i!590 nBits!348))))

(assert (= (and start!42630 res!168426) b!201163))

(assert (= (and b!201163 res!168428) b!201164))

(assert (= (and b!201164 res!168429) b!201167))

(assert (= (and b!201167 res!168425) b!201165))

(assert (= (and b!201165 res!168427) b!201162))

(assert (= start!42630 b!201166))

(declare-fun m!311783 () Bool)

(assert (=> b!201166 m!311783))

(declare-fun m!311785 () Bool)

(assert (=> start!42630 m!311785))

(declare-fun m!311787 () Bool)

(assert (=> b!201163 m!311787))

(declare-fun m!311789 () Bool)

(assert (=> b!201164 m!311789))

(declare-fun m!311791 () Bool)

(assert (=> b!201162 m!311791))

(declare-fun m!311793 () Bool)

(assert (=> b!201162 m!311793))

(declare-fun m!311795 () Bool)

(assert (=> b!201165 m!311795))

(push 1)

(assert (not b!201166))

(assert (not b!201165))

(assert (not b!201162))

(assert (not b!201163))

(assert (not start!42630))

(assert (not b!201164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

