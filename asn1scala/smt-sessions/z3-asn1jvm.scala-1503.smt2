; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41596 () Bool)

(assert start!41596)

(declare-fun b!195378 () Bool)

(declare-fun res!163430 () Bool)

(declare-fun e!134338 () Bool)

(assert (=> b!195378 (=> (not res!163430) (not e!134338))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10033 0))(
  ( (array!10034 (arr!5354 (Array (_ BitVec 32) (_ BitVec 8))) (size!4424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7956 0))(
  ( (BitStream!7957 (buf!4910 array!10033) (currentByte!9212 (_ BitVec 32)) (currentBit!9207 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7956)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195378 (= res!163430 (validate_offset_bits!1 ((_ sign_extend 32) (size!4424 (buf!4910 thiss!1204))) ((_ sign_extend 32) (currentByte!9212 thiss!1204)) ((_ sign_extend 32) (currentBit!9207 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195379 () Bool)

(declare-fun res!163427 () Bool)

(assert (=> b!195379 (=> (not res!163427) (not e!134338))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195379 (= res!163427 (invariant!0 (currentBit!9207 thiss!1204) (currentByte!9212 thiss!1204) (size!4424 (buf!4910 thiss!1204))))))

(declare-fun b!195380 () Bool)

(declare-fun res!163428 () Bool)

(assert (=> b!195380 (=> (not res!163428) (not e!134338))))

(assert (=> b!195380 (= res!163428 (= i!590 nBits!348))))

(declare-fun b!195381 () Bool)

(declare-fun e!134336 () Bool)

(assert (=> b!195381 (= e!134336 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7956 BitStream!7956) Bool)

(assert (=> b!195381 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!13791 0))(
  ( (Unit!13792) )
))
(declare-fun lt!303811 () Unit!13791)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7956) Unit!13791)

(assert (=> b!195381 (= lt!303811 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!163431 () Bool)

(assert (=> start!41596 (=> (not res!163431) (not e!134338))))

(assert (=> start!41596 (= res!163431 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41596 e!134338))

(assert (=> start!41596 true))

(declare-fun e!134339 () Bool)

(declare-fun inv!12 (BitStream!7956) Bool)

(assert (=> start!41596 (and (inv!12 thiss!1204) e!134339)))

(declare-fun b!195382 () Bool)

(assert (=> b!195382 (= e!134338 e!134336)))

(declare-fun res!163429 () Bool)

(assert (=> b!195382 (=> (not res!163429) (not e!134336))))

(declare-fun lt!303810 () (_ BitVec 64))

(assert (=> b!195382 (= res!163429 (= lt!303810 (bvsub (bvadd lt!303810 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195382 (= lt!303810 (bitIndex!0 (size!4424 (buf!4910 thiss!1204)) (currentByte!9212 thiss!1204) (currentBit!9207 thiss!1204)))))

(declare-fun b!195383 () Bool)

(declare-fun array_inv!4165 (array!10033) Bool)

(assert (=> b!195383 (= e!134339 (array_inv!4165 (buf!4910 thiss!1204)))))

(assert (= (and start!41596 res!163431) b!195378))

(assert (= (and b!195378 res!163430) b!195379))

(assert (= (and b!195379 res!163427) b!195380))

(assert (= (and b!195380 res!163428) b!195382))

(assert (= (and b!195382 res!163429) b!195381))

(assert (= start!41596 b!195383))

(declare-fun m!302599 () Bool)

(assert (=> b!195383 m!302599))

(declare-fun m!302601 () Bool)

(assert (=> b!195379 m!302601))

(declare-fun m!302603 () Bool)

(assert (=> b!195381 m!302603))

(declare-fun m!302605 () Bool)

(assert (=> b!195381 m!302605))

(declare-fun m!302607 () Bool)

(assert (=> b!195378 m!302607))

(declare-fun m!302609 () Bool)

(assert (=> b!195382 m!302609))

(declare-fun m!302611 () Bool)

(assert (=> start!41596 m!302611))

(check-sat (not b!195383) (not b!195382) (not b!195381) (not b!195379) (not start!41596) (not b!195378))
