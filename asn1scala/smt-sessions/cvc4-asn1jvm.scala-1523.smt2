; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42600 () Bool)

(assert start!42600)

(declare-fun res!168202 () Bool)

(declare-fun e!137781 () Bool)

(assert (=> start!42600 (=> (not res!168202) (not e!137781))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42600 (= res!168202 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42600 e!137781))

(assert (=> start!42600 true))

(declare-datatypes ((array!10182 0))(
  ( (array!10183 (arr!5412 (Array (_ BitVec 32) (_ BitVec 8))) (size!4482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8072 0))(
  ( (BitStream!8073 (buf!4983 array!10182) (currentByte!9381 (_ BitVec 32)) (currentBit!9376 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8072)

(declare-fun e!137782 () Bool)

(declare-fun inv!12 (BitStream!8072) Bool)

(assert (=> start!42600 (and (inv!12 thiss!1204) e!137782)))

(declare-fun b!200892 () Bool)

(declare-fun e!137780 () Bool)

(assert (=> b!200892 (= e!137780 (not true))))

(declare-datatypes ((tuple2!17190 0))(
  ( (tuple2!17191 (_1!9246 BitStream!8072) (_2!9246 BitStream!8072)) )
))
(declare-fun lt!313857 () tuple2!17190)

(declare-fun reader!0 (BitStream!8072 BitStream!8072) tuple2!17190)

(assert (=> b!200892 (= lt!313857 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8072 BitStream!8072) Bool)

(assert (=> b!200892 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14266 0))(
  ( (Unit!14267) )
))
(declare-fun lt!313858 () Unit!14266)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8072) Unit!14266)

(assert (=> b!200892 (= lt!313858 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200893 () Bool)

(declare-fun res!168204 () Bool)

(assert (=> b!200893 (=> (not res!168204) (not e!137781))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200893 (= res!168204 (invariant!0 (currentBit!9376 thiss!1204) (currentByte!9381 thiss!1204) (size!4482 (buf!4983 thiss!1204))))))

(declare-fun b!200894 () Bool)

(declare-fun array_inv!4223 (array!10182) Bool)

(assert (=> b!200894 (= e!137782 (array_inv!4223 (buf!4983 thiss!1204)))))

(declare-fun b!200895 () Bool)

(declare-fun res!168200 () Bool)

(assert (=> b!200895 (=> (not res!168200) (not e!137781))))

(assert (=> b!200895 (= res!168200 (= i!590 nBits!348))))

(declare-fun b!200896 () Bool)

(declare-fun res!168201 () Bool)

(assert (=> b!200896 (=> (not res!168201) (not e!137781))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200896 (= res!168201 (validate_offset_bits!1 ((_ sign_extend 32) (size!4482 (buf!4983 thiss!1204))) ((_ sign_extend 32) (currentByte!9381 thiss!1204)) ((_ sign_extend 32) (currentBit!9376 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200897 () Bool)

(assert (=> b!200897 (= e!137781 e!137780)))

(declare-fun res!168203 () Bool)

(assert (=> b!200897 (=> (not res!168203) (not e!137780))))

(declare-fun lt!313856 () (_ BitVec 64))

(assert (=> b!200897 (= res!168203 (= lt!313856 (bvsub (bvadd lt!313856 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200897 (= lt!313856 (bitIndex!0 (size!4482 (buf!4983 thiss!1204)) (currentByte!9381 thiss!1204) (currentBit!9376 thiss!1204)))))

(assert (= (and start!42600 res!168202) b!200896))

(assert (= (and b!200896 res!168201) b!200893))

(assert (= (and b!200893 res!168204) b!200895))

(assert (= (and b!200895 res!168200) b!200897))

(assert (= (and b!200897 res!168203) b!200892))

(assert (= start!42600 b!200894))

(declare-fun m!311559 () Bool)

(assert (=> b!200897 m!311559))

(declare-fun m!311561 () Bool)

(assert (=> b!200894 m!311561))

(declare-fun m!311563 () Bool)

(assert (=> start!42600 m!311563))

(declare-fun m!311565 () Bool)

(assert (=> b!200892 m!311565))

(declare-fun m!311567 () Bool)

(assert (=> b!200892 m!311567))

(declare-fun m!311569 () Bool)

(assert (=> b!200892 m!311569))

(declare-fun m!311571 () Bool)

(assert (=> b!200896 m!311571))

(declare-fun m!311573 () Bool)

(assert (=> b!200893 m!311573))

(push 1)

(assert (not start!42600))

(assert (not b!200897))

(assert (not b!200894))

(assert (not b!200893))

(assert (not b!200892))

(assert (not b!200896))

(check-sat)

