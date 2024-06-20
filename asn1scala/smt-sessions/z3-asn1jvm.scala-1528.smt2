; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42628 () Bool)

(assert start!42628)

(declare-fun b!201144 () Bool)

(declare-fun res!168411 () Bool)

(declare-fun e!137958 () Bool)

(assert (=> b!201144 (=> (not res!168411) (not e!137958))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10210 0))(
  ( (array!10211 (arr!5426 (Array (_ BitVec 32) (_ BitVec 8))) (size!4496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8100 0))(
  ( (BitStream!8101 (buf!4997 array!10210) (currentByte!9395 (_ BitVec 32)) (currentBit!9390 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8100)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201144 (= res!168411 (validate_offset_bits!1 ((_ sign_extend 32) (size!4496 (buf!4997 thiss!1204))) ((_ sign_extend 32) (currentByte!9395 thiss!1204)) ((_ sign_extend 32) (currentBit!9390 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201145 () Bool)

(declare-fun res!168414 () Bool)

(assert (=> b!201145 (=> (not res!168414) (not e!137958))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201145 (= res!168414 (invariant!0 (currentBit!9390 thiss!1204) (currentByte!9395 thiss!1204) (size!4496 (buf!4997 thiss!1204))))))

(declare-fun b!201146 () Bool)

(declare-fun e!137959 () Bool)

(assert (=> b!201146 (= e!137958 e!137959)))

(declare-fun res!168412 () Bool)

(assert (=> b!201146 (=> (not res!168412) (not e!137959))))

(declare-fun lt!313969 () (_ BitVec 64))

(assert (=> b!201146 (= res!168412 (= lt!313969 (bvsub (bvadd lt!313969 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201146 (= lt!313969 (bitIndex!0 (size!4496 (buf!4997 thiss!1204)) (currentByte!9395 thiss!1204) (currentBit!9390 thiss!1204)))))

(declare-fun b!201147 () Bool)

(assert (=> b!201147 (= e!137959 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8100 BitStream!8100) Bool)

(assert (=> b!201147 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14294 0))(
  ( (Unit!14295) )
))
(declare-fun lt!313968 () Unit!14294)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8100) Unit!14294)

(assert (=> b!201147 (= lt!313968 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201149 () Bool)

(declare-fun e!137960 () Bool)

(declare-fun array_inv!4237 (array!10210) Bool)

(assert (=> b!201149 (= e!137960 (array_inv!4237 (buf!4997 thiss!1204)))))

(declare-fun b!201148 () Bool)

(declare-fun res!168410 () Bool)

(assert (=> b!201148 (=> (not res!168410) (not e!137958))))

(assert (=> b!201148 (= res!168410 (= i!590 nBits!348))))

(declare-fun res!168413 () Bool)

(assert (=> start!42628 (=> (not res!168413) (not e!137958))))

(assert (=> start!42628 (= res!168413 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42628 e!137958))

(assert (=> start!42628 true))

(declare-fun inv!12 (BitStream!8100) Bool)

(assert (=> start!42628 (and (inv!12 thiss!1204) e!137960)))

(assert (= (and start!42628 res!168413) b!201144))

(assert (= (and b!201144 res!168411) b!201145))

(assert (= (and b!201145 res!168414) b!201148))

(assert (= (and b!201148 res!168410) b!201146))

(assert (= (and b!201146 res!168412) b!201147))

(assert (= start!42628 b!201149))

(declare-fun m!311769 () Bool)

(assert (=> b!201145 m!311769))

(declare-fun m!311771 () Bool)

(assert (=> b!201147 m!311771))

(declare-fun m!311773 () Bool)

(assert (=> b!201147 m!311773))

(declare-fun m!311775 () Bool)

(assert (=> b!201144 m!311775))

(declare-fun m!311777 () Bool)

(assert (=> b!201146 m!311777))

(declare-fun m!311779 () Bool)

(assert (=> b!201149 m!311779))

(declare-fun m!311781 () Bool)

(assert (=> start!42628 m!311781))

(check-sat (not start!42628) (not b!201147) (not b!201149) (not b!201145) (not b!201144) (not b!201146))
(check-sat)
