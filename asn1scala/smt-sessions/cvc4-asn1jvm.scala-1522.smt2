; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42594 () Bool)

(assert start!42594)

(declare-fun b!200838 () Bool)

(declare-fun e!137746 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!200838 (= e!137746 (not (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!10176 0))(
  ( (array!10177 (arr!5409 (Array (_ BitVec 32) (_ BitVec 8))) (size!4479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8066 0))(
  ( (BitStream!8067 (buf!4980 array!10176) (currentByte!9378 (_ BitVec 32)) (currentBit!9373 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17184 0))(
  ( (tuple2!17185 (_1!9243 BitStream!8066) (_2!9243 BitStream!8066)) )
))
(declare-fun lt!313831 () tuple2!17184)

(declare-fun thiss!1204 () BitStream!8066)

(declare-fun reader!0 (BitStream!8066 BitStream!8066) tuple2!17184)

(assert (=> b!200838 (= lt!313831 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8066 BitStream!8066) Bool)

(assert (=> b!200838 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14260 0))(
  ( (Unit!14261) )
))
(declare-fun lt!313830 () Unit!14260)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8066) Unit!14260)

(assert (=> b!200838 (= lt!313830 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200839 () Bool)

(declare-fun e!137744 () Bool)

(assert (=> b!200839 (= e!137744 e!137746)))

(declare-fun res!168156 () Bool)

(assert (=> b!200839 (=> (not res!168156) (not e!137746))))

(declare-fun lt!313829 () (_ BitVec 64))

(assert (=> b!200839 (= res!168156 (= lt!313829 (bvsub (bvadd lt!313829 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200839 (= lt!313829 (bitIndex!0 (size!4479 (buf!4980 thiss!1204)) (currentByte!9378 thiss!1204) (currentBit!9373 thiss!1204)))))

(declare-fun b!200840 () Bool)

(declare-fun res!168158 () Bool)

(assert (=> b!200840 (=> (not res!168158) (not e!137744))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200840 (= res!168158 (invariant!0 (currentBit!9373 thiss!1204) (currentByte!9378 thiss!1204) (size!4479 (buf!4980 thiss!1204))))))

(declare-fun b!200841 () Bool)

(declare-fun res!168155 () Bool)

(assert (=> b!200841 (=> (not res!168155) (not e!137744))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200841 (= res!168155 (validate_offset_bits!1 ((_ sign_extend 32) (size!4479 (buf!4980 thiss!1204))) ((_ sign_extend 32) (currentByte!9378 thiss!1204)) ((_ sign_extend 32) (currentBit!9373 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200842 () Bool)

(declare-fun e!137745 () Bool)

(declare-fun array_inv!4220 (array!10176) Bool)

(assert (=> b!200842 (= e!137745 (array_inv!4220 (buf!4980 thiss!1204)))))

(declare-fun res!168159 () Bool)

(assert (=> start!42594 (=> (not res!168159) (not e!137744))))

(assert (=> start!42594 (= res!168159 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42594 e!137744))

(assert (=> start!42594 true))

(declare-fun inv!12 (BitStream!8066) Bool)

(assert (=> start!42594 (and (inv!12 thiss!1204) e!137745)))

(declare-fun b!200843 () Bool)

(declare-fun res!168157 () Bool)

(assert (=> b!200843 (=> (not res!168157) (not e!137744))))

(assert (=> b!200843 (= res!168157 (= i!590 nBits!348))))

(assert (= (and start!42594 res!168159) b!200841))

(assert (= (and b!200841 res!168155) b!200840))

(assert (= (and b!200840 res!168158) b!200843))

(assert (= (and b!200843 res!168157) b!200839))

(assert (= (and b!200839 res!168156) b!200838))

(assert (= start!42594 b!200842))

(declare-fun m!311511 () Bool)

(assert (=> start!42594 m!311511))

(declare-fun m!311513 () Bool)

(assert (=> b!200839 m!311513))

(declare-fun m!311515 () Bool)

(assert (=> b!200838 m!311515))

(declare-fun m!311517 () Bool)

(assert (=> b!200838 m!311517))

(declare-fun m!311519 () Bool)

(assert (=> b!200838 m!311519))

(declare-fun m!311521 () Bool)

(assert (=> b!200841 m!311521))

(declare-fun m!311523 () Bool)

(assert (=> b!200840 m!311523))

(declare-fun m!311525 () Bool)

(assert (=> b!200842 m!311525))

(push 1)

(assert (not b!200842))

(assert (not start!42594))

(assert (not b!200841))

(assert (not b!200839))

(assert (not b!200838))

(assert (not b!200840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

