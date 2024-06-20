; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42618 () Bool)

(assert start!42618)

(declare-fun b!201054 () Bool)

(declare-fun res!168339 () Bool)

(declare-fun e!137900 () Bool)

(assert (=> b!201054 (=> (not res!168339) (not e!137900))))

(declare-datatypes ((array!10200 0))(
  ( (array!10201 (arr!5421 (Array (_ BitVec 32) (_ BitVec 8))) (size!4491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8090 0))(
  ( (BitStream!8091 (buf!4992 array!10200) (currentByte!9390 (_ BitVec 32)) (currentBit!9385 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8090)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201054 (= res!168339 (invariant!0 (currentBit!9385 thiss!1204) (currentByte!9390 thiss!1204) (size!4491 (buf!4992 thiss!1204))))))

(declare-fun b!201055 () Bool)

(declare-fun res!168335 () Bool)

(assert (=> b!201055 (=> (not res!168335) (not e!137900))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201055 (= res!168335 (validate_offset_bits!1 ((_ sign_extend 32) (size!4491 (buf!4992 thiss!1204))) ((_ sign_extend 32) (currentByte!9390 thiss!1204)) ((_ sign_extend 32) (currentBit!9385 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201056 () Bool)

(declare-fun e!137897 () Bool)

(assert (=> b!201056 (= e!137897 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8090 BitStream!8090) Bool)

(assert (=> b!201056 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14284 0))(
  ( (Unit!14285) )
))
(declare-fun lt!313939 () Unit!14284)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8090) Unit!14284)

(assert (=> b!201056 (= lt!313939 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201057 () Bool)

(declare-fun res!168337 () Bool)

(assert (=> b!201057 (=> (not res!168337) (not e!137900))))

(assert (=> b!201057 (= res!168337 (= i!590 nBits!348))))

(declare-fun b!201059 () Bool)

(declare-fun e!137899 () Bool)

(declare-fun array_inv!4232 (array!10200) Bool)

(assert (=> b!201059 (= e!137899 (array_inv!4232 (buf!4992 thiss!1204)))))

(declare-fun res!168336 () Bool)

(assert (=> start!42618 (=> (not res!168336) (not e!137900))))

(assert (=> start!42618 (= res!168336 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42618 e!137900))

(assert (=> start!42618 true))

(declare-fun inv!12 (BitStream!8090) Bool)

(assert (=> start!42618 (and (inv!12 thiss!1204) e!137899)))

(declare-fun b!201058 () Bool)

(assert (=> b!201058 (= e!137900 e!137897)))

(declare-fun res!168338 () Bool)

(assert (=> b!201058 (=> (not res!168338) (not e!137897))))

(declare-fun lt!313938 () (_ BitVec 64))

(assert (=> b!201058 (= res!168338 (= lt!313938 (bvsub (bvadd lt!313938 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201058 (= lt!313938 (bitIndex!0 (size!4491 (buf!4992 thiss!1204)) (currentByte!9390 thiss!1204) (currentBit!9385 thiss!1204)))))

(assert (= (and start!42618 res!168336) b!201055))

(assert (= (and b!201055 res!168335) b!201054))

(assert (= (and b!201054 res!168339) b!201057))

(assert (= (and b!201057 res!168337) b!201058))

(assert (= (and b!201058 res!168338) b!201056))

(assert (= start!42618 b!201059))

(declare-fun m!311699 () Bool)

(assert (=> b!201055 m!311699))

(declare-fun m!311701 () Bool)

(assert (=> b!201054 m!311701))

(declare-fun m!311703 () Bool)

(assert (=> b!201056 m!311703))

(declare-fun m!311705 () Bool)

(assert (=> b!201056 m!311705))

(declare-fun m!311707 () Bool)

(assert (=> start!42618 m!311707))

(declare-fun m!311709 () Bool)

(assert (=> b!201058 m!311709))

(declare-fun m!311711 () Bool)

(assert (=> b!201059 m!311711))

(push 1)

(assert (not b!201056))

(assert (not b!201059))

(assert (not b!201054))

(assert (not start!42618))

(assert (not b!201055))

(assert (not b!201058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

