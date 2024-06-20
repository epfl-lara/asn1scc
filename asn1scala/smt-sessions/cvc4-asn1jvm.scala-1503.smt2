; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41598 () Bool)

(assert start!41598)

(declare-fun b!195396 () Bool)

(declare-fun res!163444 () Bool)

(declare-fun e!134350 () Bool)

(assert (=> b!195396 (=> (not res!163444) (not e!134350))))

(declare-datatypes ((array!10035 0))(
  ( (array!10036 (arr!5355 (Array (_ BitVec 32) (_ BitVec 8))) (size!4425 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7958 0))(
  ( (BitStream!7959 (buf!4911 array!10035) (currentByte!9213 (_ BitVec 32)) (currentBit!9208 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7958)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195396 (= res!163444 (invariant!0 (currentBit!9208 thiss!1204) (currentByte!9213 thiss!1204) (size!4425 (buf!4911 thiss!1204))))))

(declare-fun b!195397 () Bool)

(declare-fun res!163446 () Bool)

(assert (=> b!195397 (=> (not res!163446) (not e!134350))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195397 (= res!163446 (= i!590 nBits!348))))

(declare-fun b!195398 () Bool)

(declare-fun e!134348 () Bool)

(assert (=> b!195398 (= e!134348 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7958 BitStream!7958) Bool)

(assert (=> b!195398 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!13793 0))(
  ( (Unit!13794) )
))
(declare-fun lt!303816 () Unit!13793)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7958) Unit!13793)

(assert (=> b!195398 (= lt!303816 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!195399 () Bool)

(declare-fun res!163443 () Bool)

(assert (=> b!195399 (=> (not res!163443) (not e!134350))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195399 (= res!163443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4425 (buf!4911 thiss!1204))) ((_ sign_extend 32) (currentByte!9213 thiss!1204)) ((_ sign_extend 32) (currentBit!9208 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195400 () Bool)

(assert (=> b!195400 (= e!134350 e!134348)))

(declare-fun res!163445 () Bool)

(assert (=> b!195400 (=> (not res!163445) (not e!134348))))

(declare-fun lt!303817 () (_ BitVec 64))

(assert (=> b!195400 (= res!163445 (= lt!303817 (bvsub (bvadd lt!303817 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195400 (= lt!303817 (bitIndex!0 (size!4425 (buf!4911 thiss!1204)) (currentByte!9213 thiss!1204) (currentBit!9208 thiss!1204)))))

(declare-fun b!195401 () Bool)

(declare-fun e!134349 () Bool)

(declare-fun array_inv!4166 (array!10035) Bool)

(assert (=> b!195401 (= e!134349 (array_inv!4166 (buf!4911 thiss!1204)))))

(declare-fun res!163442 () Bool)

(assert (=> start!41598 (=> (not res!163442) (not e!134350))))

(assert (=> start!41598 (= res!163442 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41598 e!134350))

(assert (=> start!41598 true))

(declare-fun inv!12 (BitStream!7958) Bool)

(assert (=> start!41598 (and (inv!12 thiss!1204) e!134349)))

(assert (= (and start!41598 res!163442) b!195399))

(assert (= (and b!195399 res!163443) b!195396))

(assert (= (and b!195396 res!163444) b!195397))

(assert (= (and b!195397 res!163446) b!195400))

(assert (= (and b!195400 res!163445) b!195398))

(assert (= start!41598 b!195401))

(declare-fun m!302613 () Bool)

(assert (=> b!195401 m!302613))

(declare-fun m!302615 () Bool)

(assert (=> b!195399 m!302615))

(declare-fun m!302617 () Bool)

(assert (=> b!195398 m!302617))

(declare-fun m!302619 () Bool)

(assert (=> b!195398 m!302619))

(declare-fun m!302621 () Bool)

(assert (=> b!195400 m!302621))

(declare-fun m!302623 () Bool)

(assert (=> start!41598 m!302623))

(declare-fun m!302625 () Bool)

(assert (=> b!195396 m!302625))

(push 1)

(assert (not b!195396))

(assert (not start!41598))

(assert (not b!195399))

(assert (not b!195400))

(assert (not b!195401))

(assert (not b!195398))

(check-sat)

