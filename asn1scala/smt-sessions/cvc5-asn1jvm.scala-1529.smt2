; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42632 () Bool)

(assert start!42632)

(declare-fun res!168440 () Bool)

(declare-fun e!137984 () Bool)

(assert (=> start!42632 (=> (not res!168440) (not e!137984))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42632 (= res!168440 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42632 e!137984))

(assert (=> start!42632 true))

(declare-datatypes ((array!10214 0))(
  ( (array!10215 (arr!5428 (Array (_ BitVec 32) (_ BitVec 8))) (size!4498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8104 0))(
  ( (BitStream!8105 (buf!4999 array!10214) (currentByte!9397 (_ BitVec 32)) (currentBit!9392 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8104)

(declare-fun e!137981 () Bool)

(declare-fun inv!12 (BitStream!8104) Bool)

(assert (=> start!42632 (and (inv!12 thiss!1204) e!137981)))

(declare-fun b!201180 () Bool)

(declare-fun e!137982 () Bool)

(assert (=> b!201180 (= e!137984 e!137982)))

(declare-fun res!168444 () Bool)

(assert (=> b!201180 (=> (not res!168444) (not e!137982))))

(declare-fun lt!313981 () (_ BitVec 64))

(assert (=> b!201180 (= res!168444 (= lt!313981 (bvsub (bvadd lt!313981 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201180 (= lt!313981 (bitIndex!0 (size!4498 (buf!4999 thiss!1204)) (currentByte!9397 thiss!1204) (currentBit!9392 thiss!1204)))))

(declare-fun b!201181 () Bool)

(declare-fun res!168441 () Bool)

(assert (=> b!201181 (=> (not res!168441) (not e!137984))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201181 (= res!168441 (invariant!0 (currentBit!9392 thiss!1204) (currentByte!9397 thiss!1204) (size!4498 (buf!4999 thiss!1204))))))

(declare-fun b!201182 () Bool)

(assert (=> b!201182 (= e!137982 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8104 BitStream!8104) Bool)

(assert (=> b!201182 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14298 0))(
  ( (Unit!14299) )
))
(declare-fun lt!313980 () Unit!14298)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8104) Unit!14298)

(assert (=> b!201182 (= lt!313980 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201183 () Bool)

(declare-fun res!168442 () Bool)

(assert (=> b!201183 (=> (not res!168442) (not e!137984))))

(assert (=> b!201183 (= res!168442 (= i!590 nBits!348))))

(declare-fun b!201184 () Bool)

(declare-fun res!168443 () Bool)

(assert (=> b!201184 (=> (not res!168443) (not e!137984))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201184 (= res!168443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4498 (buf!4999 thiss!1204))) ((_ sign_extend 32) (currentByte!9397 thiss!1204)) ((_ sign_extend 32) (currentBit!9392 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201185 () Bool)

(declare-fun array_inv!4239 (array!10214) Bool)

(assert (=> b!201185 (= e!137981 (array_inv!4239 (buf!4999 thiss!1204)))))

(assert (= (and start!42632 res!168440) b!201184))

(assert (= (and b!201184 res!168443) b!201181))

(assert (= (and b!201181 res!168441) b!201183))

(assert (= (and b!201183 res!168442) b!201180))

(assert (= (and b!201180 res!168444) b!201182))

(assert (= start!42632 b!201185))

(declare-fun m!311797 () Bool)

(assert (=> b!201182 m!311797))

(declare-fun m!311799 () Bool)

(assert (=> b!201182 m!311799))

(declare-fun m!311801 () Bool)

(assert (=> b!201185 m!311801))

(declare-fun m!311803 () Bool)

(assert (=> b!201180 m!311803))

(declare-fun m!311805 () Bool)

(assert (=> b!201181 m!311805))

(declare-fun m!311807 () Bool)

(assert (=> b!201184 m!311807))

(declare-fun m!311809 () Bool)

(assert (=> start!42632 m!311809))

(push 1)

(assert (not b!201181))

(assert (not b!201182))

(assert (not b!201180))

(assert (not b!201184))

(assert (not start!42632))

(assert (not b!201185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

