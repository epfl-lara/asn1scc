; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42622 () Bool)

(assert start!42622)

(declare-fun b!201090 () Bool)

(declare-fun res!168367 () Bool)

(declare-fun e!137922 () Bool)

(assert (=> b!201090 (=> (not res!168367) (not e!137922))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10204 0))(
  ( (array!10205 (arr!5423 (Array (_ BitVec 32) (_ BitVec 8))) (size!4493 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8094 0))(
  ( (BitStream!8095 (buf!4994 array!10204) (currentByte!9392 (_ BitVec 32)) (currentBit!9387 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8094)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201090 (= res!168367 (validate_offset_bits!1 ((_ sign_extend 32) (size!4493 (buf!4994 thiss!1204))) ((_ sign_extend 32) (currentByte!9392 thiss!1204)) ((_ sign_extend 32) (currentBit!9387 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201091 () Bool)

(declare-fun e!137921 () Bool)

(assert (=> b!201091 (= e!137922 e!137921)))

(declare-fun res!168366 () Bool)

(assert (=> b!201091 (=> (not res!168366) (not e!137921))))

(declare-fun lt!313950 () (_ BitVec 64))

(assert (=> b!201091 (= res!168366 (= lt!313950 (bvsub (bvadd lt!313950 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201091 (= lt!313950 (bitIndex!0 (size!4493 (buf!4994 thiss!1204)) (currentByte!9392 thiss!1204) (currentBit!9387 thiss!1204)))))

(declare-fun b!201092 () Bool)

(assert (=> b!201092 (= e!137921 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8094 BitStream!8094) Bool)

(assert (=> b!201092 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14288 0))(
  ( (Unit!14289) )
))
(declare-fun lt!313951 () Unit!14288)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8094) Unit!14288)

(assert (=> b!201092 (= lt!313951 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201093 () Bool)

(declare-fun res!168365 () Bool)

(assert (=> b!201093 (=> (not res!168365) (not e!137922))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201093 (= res!168365 (invariant!0 (currentBit!9387 thiss!1204) (currentByte!9392 thiss!1204) (size!4493 (buf!4994 thiss!1204))))))

(declare-fun b!201094 () Bool)

(declare-fun e!137923 () Bool)

(declare-fun array_inv!4234 (array!10204) Bool)

(assert (=> b!201094 (= e!137923 (array_inv!4234 (buf!4994 thiss!1204)))))

(declare-fun res!168369 () Bool)

(assert (=> start!42622 (=> (not res!168369) (not e!137922))))

(assert (=> start!42622 (= res!168369 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42622 e!137922))

(assert (=> start!42622 true))

(declare-fun inv!12 (BitStream!8094) Bool)

(assert (=> start!42622 (and (inv!12 thiss!1204) e!137923)))

(declare-fun b!201095 () Bool)

(declare-fun res!168368 () Bool)

(assert (=> b!201095 (=> (not res!168368) (not e!137922))))

(assert (=> b!201095 (= res!168368 (= i!590 nBits!348))))

(assert (= (and start!42622 res!168369) b!201090))

(assert (= (and b!201090 res!168367) b!201093))

(assert (= (and b!201093 res!168365) b!201095))

(assert (= (and b!201095 res!168368) b!201091))

(assert (= (and b!201091 res!168366) b!201092))

(assert (= start!42622 b!201094))

(declare-fun m!311727 () Bool)

(assert (=> b!201090 m!311727))

(declare-fun m!311729 () Bool)

(assert (=> b!201093 m!311729))

(declare-fun m!311731 () Bool)

(assert (=> start!42622 m!311731))

(declare-fun m!311733 () Bool)

(assert (=> b!201092 m!311733))

(declare-fun m!311735 () Bool)

(assert (=> b!201092 m!311735))

(declare-fun m!311737 () Bool)

(assert (=> b!201094 m!311737))

(declare-fun m!311739 () Bool)

(assert (=> b!201091 m!311739))

(check-sat (not b!201094) (not start!42622) (not b!201091) (not b!201092) (not b!201093) (not b!201090))
