; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42598 () Bool)

(assert start!42598)

(declare-fun b!200874 () Bool)

(declare-fun e!137769 () Bool)

(declare-fun e!137768 () Bool)

(assert (=> b!200874 (= e!137769 e!137768)))

(declare-fun res!168189 () Bool)

(assert (=> b!200874 (=> (not res!168189) (not e!137768))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!313847 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!200874 (= res!168189 (= lt!313847 (bvsub (bvadd lt!313847 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!10180 0))(
  ( (array!10181 (arr!5411 (Array (_ BitVec 32) (_ BitVec 8))) (size!4481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8070 0))(
  ( (BitStream!8071 (buf!4982 array!10180) (currentByte!9380 (_ BitVec 32)) (currentBit!9375 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8070)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200874 (= lt!313847 (bitIndex!0 (size!4481 (buf!4982 thiss!1204)) (currentByte!9380 thiss!1204) (currentBit!9375 thiss!1204)))))

(declare-fun b!200875 () Bool)

(declare-fun res!168185 () Bool)

(assert (=> b!200875 (=> (not res!168185) (not e!137769))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200875 (= res!168185 (invariant!0 (currentBit!9375 thiss!1204) (currentByte!9380 thiss!1204) (size!4481 (buf!4982 thiss!1204))))))

(declare-fun res!168187 () Bool)

(assert (=> start!42598 (=> (not res!168187) (not e!137769))))

(assert (=> start!42598 (= res!168187 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42598 e!137769))

(assert (=> start!42598 true))

(declare-fun e!137770 () Bool)

(declare-fun inv!12 (BitStream!8070) Bool)

(assert (=> start!42598 (and (inv!12 thiss!1204) e!137770)))

(declare-fun b!200876 () Bool)

(assert (=> b!200876 (= e!137768 (not true))))

(declare-datatypes ((tuple2!17188 0))(
  ( (tuple2!17189 (_1!9245 BitStream!8070) (_2!9245 BitStream!8070)) )
))
(declare-fun lt!313848 () tuple2!17188)

(declare-fun reader!0 (BitStream!8070 BitStream!8070) tuple2!17188)

(assert (=> b!200876 (= lt!313848 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8070 BitStream!8070) Bool)

(assert (=> b!200876 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14264 0))(
  ( (Unit!14265) )
))
(declare-fun lt!313849 () Unit!14264)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8070) Unit!14264)

(assert (=> b!200876 (= lt!313849 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200877 () Bool)

(declare-fun res!168186 () Bool)

(assert (=> b!200877 (=> (not res!168186) (not e!137769))))

(assert (=> b!200877 (= res!168186 (= i!590 nBits!348))))

(declare-fun b!200878 () Bool)

(declare-fun array_inv!4222 (array!10180) Bool)

(assert (=> b!200878 (= e!137770 (array_inv!4222 (buf!4982 thiss!1204)))))

(declare-fun b!200879 () Bool)

(declare-fun res!168188 () Bool)

(assert (=> b!200879 (=> (not res!168188) (not e!137769))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200879 (= res!168188 (validate_offset_bits!1 ((_ sign_extend 32) (size!4481 (buf!4982 thiss!1204))) ((_ sign_extend 32) (currentByte!9380 thiss!1204)) ((_ sign_extend 32) (currentBit!9375 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42598 res!168187) b!200879))

(assert (= (and b!200879 res!168188) b!200875))

(assert (= (and b!200875 res!168185) b!200877))

(assert (= (and b!200877 res!168186) b!200874))

(assert (= (and b!200874 res!168189) b!200876))

(assert (= start!42598 b!200878))

(declare-fun m!311543 () Bool)

(assert (=> b!200878 m!311543))

(declare-fun m!311545 () Bool)

(assert (=> b!200879 m!311545))

(declare-fun m!311547 () Bool)

(assert (=> b!200876 m!311547))

(declare-fun m!311549 () Bool)

(assert (=> b!200876 m!311549))

(declare-fun m!311551 () Bool)

(assert (=> b!200876 m!311551))

(declare-fun m!311553 () Bool)

(assert (=> b!200875 m!311553))

(declare-fun m!311555 () Bool)

(assert (=> start!42598 m!311555))

(declare-fun m!311557 () Bool)

(assert (=> b!200874 m!311557))

(check-sat (not b!200878) (not start!42598) (not b!200875) (not b!200876) (not b!200879) (not b!200874))
