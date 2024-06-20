; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42604 () Bool)

(assert start!42604)

(declare-fun b!200928 () Bool)

(declare-fun res!168234 () Bool)

(declare-fun e!137809 () Bool)

(assert (=> b!200928 (=> (not res!168234) (not e!137809))))

(declare-datatypes ((array!10186 0))(
  ( (array!10187 (arr!5414 (Array (_ BitVec 32) (_ BitVec 8))) (size!4484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8076 0))(
  ( (BitStream!8077 (buf!4985 array!10186) (currentByte!9383 (_ BitVec 32)) (currentBit!9378 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8076)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200928 (= res!168234 (invariant!0 (currentBit!9378 thiss!1204) (currentByte!9383 thiss!1204) (size!4484 (buf!4985 thiss!1204))))))

(declare-fun b!200929 () Bool)

(declare-fun e!137813 () Bool)

(declare-fun lt!313882 () (_ BitVec 64))

(assert (=> b!200929 (= e!137813 (not (bvsge lt!313882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17194 0))(
  ( (tuple2!17195 (_1!9248 BitStream!8076) (_2!9248 BitStream!8076)) )
))
(declare-fun lt!313880 () tuple2!17194)

(declare-fun reader!0 (BitStream!8076 BitStream!8076) tuple2!17194)

(assert (=> b!200929 (= lt!313880 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8076 BitStream!8076) Bool)

(assert (=> b!200929 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14270 0))(
  ( (Unit!14271) )
))
(declare-fun lt!313879 () Unit!14270)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8076) Unit!14270)

(assert (=> b!200929 (= lt!313879 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!168230 () Bool)

(declare-fun e!137810 () Bool)

(assert (=> start!42604 (=> (not res!168230) (not e!137810))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42604 (= res!168230 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42604 e!137810))

(assert (=> start!42604 true))

(declare-fun e!137812 () Bool)

(declare-fun inv!12 (BitStream!8076) Bool)

(assert (=> start!42604 (and (inv!12 thiss!1204) e!137812)))

(declare-fun b!200930 () Bool)

(declare-fun array_inv!4225 (array!10186) Bool)

(assert (=> b!200930 (= e!137812 (array_inv!4225 (buf!4985 thiss!1204)))))

(declare-fun b!200931 () Bool)

(assert (=> b!200931 (= e!137810 e!137809)))

(declare-fun res!168232 () Bool)

(assert (=> b!200931 (=> (not res!168232) (not e!137809))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200931 (= res!168232 (validate_offset_bits!1 ((_ sign_extend 32) (size!4484 (buf!4985 thiss!1204))) ((_ sign_extend 32) (currentByte!9383 thiss!1204)) ((_ sign_extend 32) (currentBit!9378 thiss!1204)) lt!313882))))

(assert (=> b!200931 (= lt!313882 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!200932 () Bool)

(assert (=> b!200932 (= e!137809 e!137813)))

(declare-fun res!168233 () Bool)

(assert (=> b!200932 (=> (not res!168233) (not e!137813))))

(declare-fun lt!313881 () (_ BitVec 64))

(assert (=> b!200932 (= res!168233 (= lt!313881 (bvsub (bvadd lt!313881 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200932 (= lt!313881 (bitIndex!0 (size!4484 (buf!4985 thiss!1204)) (currentByte!9383 thiss!1204) (currentBit!9378 thiss!1204)))))

(declare-fun b!200933 () Bool)

(declare-fun res!168231 () Bool)

(assert (=> b!200933 (=> (not res!168231) (not e!137809))))

(assert (=> b!200933 (= res!168231 (= i!590 nBits!348))))

(assert (= (and start!42604 res!168230) b!200931))

(assert (= (and b!200931 res!168232) b!200928))

(assert (= (and b!200928 res!168234) b!200933))

(assert (= (and b!200933 res!168231) b!200932))

(assert (= (and b!200932 res!168233) b!200929))

(assert (= start!42604 b!200930))

(declare-fun m!311591 () Bool)

(assert (=> start!42604 m!311591))

(declare-fun m!311593 () Bool)

(assert (=> b!200930 m!311593))

(declare-fun m!311595 () Bool)

(assert (=> b!200931 m!311595))

(declare-fun m!311597 () Bool)

(assert (=> b!200928 m!311597))

(declare-fun m!311599 () Bool)

(assert (=> b!200932 m!311599))

(declare-fun m!311601 () Bool)

(assert (=> b!200929 m!311601))

(declare-fun m!311603 () Bool)

(assert (=> b!200929 m!311603))

(declare-fun m!311605 () Bool)

(assert (=> b!200929 m!311605))

(check-sat (not b!200932) (not start!42604) (not b!200929) (not b!200930) (not b!200931) (not b!200928))
(check-sat)
