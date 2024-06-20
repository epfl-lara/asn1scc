; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38954 () Bool)

(assert start!38954)

(declare-fun b!175471 () Bool)

(declare-fun e!122350 () Bool)

(declare-fun e!122351 () Bool)

(assert (=> b!175471 (= e!122350 e!122351)))

(declare-fun res!145306 () Bool)

(assert (=> b!175471 (=> (not res!145306) (not e!122351))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!270505 () (_ BitVec 64))

(assert (=> b!175471 (= res!145306 (= lt!270505 (bvsub (bvadd lt!270505 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9464 0))(
  ( (array!9465 (arr!5107 (Array (_ BitVec 32) (_ BitVec 8))) (size!4177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7462 0))(
  ( (BitStream!7463 (buf!4614 array!9464) (currentByte!8737 (_ BitVec 32)) (currentBit!8732 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175471 (= lt!270505 (bitIndex!0 (size!4177 (buf!4614 thiss!1204)) (currentByte!8737 thiss!1204) (currentBit!8732 thiss!1204)))))

(declare-fun b!175472 () Bool)

(declare-fun e!122352 () Bool)

(declare-fun array_inv!3918 (array!9464) Bool)

(assert (=> b!175472 (= e!122352 (array_inv!3918 (buf!4614 thiss!1204)))))

(declare-fun b!175473 () Bool)

(declare-fun res!145305 () Bool)

(assert (=> b!175473 (=> (not res!145305) (not e!122350))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175473 (= res!145305 (invariant!0 (currentBit!8732 thiss!1204) (currentByte!8737 thiss!1204) (size!4177 (buf!4614 thiss!1204))))))

(declare-fun res!145308 () Bool)

(declare-fun e!122353 () Bool)

(assert (=> start!38954 (=> (not res!145308) (not e!122353))))

(assert (=> start!38954 (= res!145308 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38954 e!122353))

(assert (=> start!38954 true))

(declare-fun inv!12 (BitStream!7462) Bool)

(assert (=> start!38954 (and (inv!12 thiss!1204) e!122352)))

(declare-fun b!175474 () Bool)

(assert (=> b!175474 (= e!122353 e!122350)))

(declare-fun res!145307 () Bool)

(assert (=> b!175474 (=> (not res!145307) (not e!122350))))

(declare-fun lt!270506 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175474 (= res!145307 (validate_offset_bits!1 ((_ sign_extend 32) (size!4177 (buf!4614 thiss!1204))) ((_ sign_extend 32) (currentByte!8737 thiss!1204)) ((_ sign_extend 32) (currentBit!8732 thiss!1204)) lt!270506))))

(assert (=> b!175474 (= lt!270506 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175475 () Bool)

(declare-fun res!145304 () Bool)

(assert (=> b!175475 (=> (not res!145304) (not e!122350))))

(assert (=> b!175475 (= res!145304 (= i!590 nBits!348))))

(declare-fun b!175476 () Bool)

(assert (=> b!175476 (= e!122351 (not true))))

(declare-datatypes ((Unit!12662 0))(
  ( (Unit!12663) )
))
(declare-fun lt!270503 () Unit!12662)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7462 array!9464 (_ BitVec 64)) Unit!12662)

(assert (=> b!175476 (= lt!270503 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4614 thiss!1204) lt!270506))))

(declare-datatypes ((tuple2!15100 0))(
  ( (tuple2!15101 (_1!8195 BitStream!7462) (_2!8195 BitStream!7462)) )
))
(declare-fun lt!270504 () tuple2!15100)

(declare-fun reader!0 (BitStream!7462 BitStream!7462) tuple2!15100)

(assert (=> b!175476 (= lt!270504 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7462 BitStream!7462) Bool)

(assert (=> b!175476 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270502 () Unit!12662)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7462) Unit!12662)

(assert (=> b!175476 (= lt!270502 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!38954 res!145308) b!175474))

(assert (= (and b!175474 res!145307) b!175473))

(assert (= (and b!175473 res!145305) b!175475))

(assert (= (and b!175475 res!145304) b!175471))

(assert (= (and b!175471 res!145306) b!175476))

(assert (= start!38954 b!175472))

(declare-fun m!275647 () Bool)

(assert (=> b!175472 m!275647))

(declare-fun m!275649 () Bool)

(assert (=> b!175474 m!275649))

(declare-fun m!275651 () Bool)

(assert (=> start!38954 m!275651))

(declare-fun m!275653 () Bool)

(assert (=> b!175473 m!275653))

(declare-fun m!275655 () Bool)

(assert (=> b!175476 m!275655))

(declare-fun m!275657 () Bool)

(assert (=> b!175476 m!275657))

(declare-fun m!275659 () Bool)

(assert (=> b!175476 m!275659))

(declare-fun m!275661 () Bool)

(assert (=> b!175476 m!275661))

(declare-fun m!275663 () Bool)

(assert (=> b!175471 m!275663))

(push 1)

(assert (not b!175473))

(assert (not b!175471))

(assert (not b!175472))

(assert (not start!38954))

(assert (not b!175474))

(assert (not b!175476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

