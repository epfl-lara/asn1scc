; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42590 () Bool)

(assert start!42590)

(declare-fun b!200802 () Bool)

(declare-fun e!137723 () Bool)

(declare-datatypes ((array!10172 0))(
  ( (array!10173 (arr!5407 (Array (_ BitVec 32) (_ BitVec 8))) (size!4477 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8062 0))(
  ( (BitStream!8063 (buf!4978 array!10172) (currentByte!9376 (_ BitVec 32)) (currentBit!9371 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8062)

(declare-fun array_inv!4218 (array!10172) Bool)

(assert (=> b!200802 (= e!137723 (array_inv!4218 (buf!4978 thiss!1204)))))

(declare-fun b!200803 () Bool)

(declare-fun res!168126 () Bool)

(declare-fun e!137721 () Bool)

(assert (=> b!200803 (=> (not res!168126) (not e!137721))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200803 (= res!168126 (invariant!0 (currentBit!9371 thiss!1204) (currentByte!9376 thiss!1204) (size!4477 (buf!4978 thiss!1204))))))

(declare-fun res!168129 () Bool)

(assert (=> start!42590 (=> (not res!168129) (not e!137721))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42590 (= res!168129 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42590 e!137721))

(assert (=> start!42590 true))

(declare-fun inv!12 (BitStream!8062) Bool)

(assert (=> start!42590 (and (inv!12 thiss!1204) e!137723)))

(declare-fun b!200804 () Bool)

(declare-fun e!137720 () Bool)

(assert (=> b!200804 (= e!137720 (not (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!17180 0))(
  ( (tuple2!17181 (_1!9241 BitStream!8062) (_2!9241 BitStream!8062)) )
))
(declare-fun lt!313811 () tuple2!17180)

(declare-fun reader!0 (BitStream!8062 BitStream!8062) tuple2!17180)

(assert (=> b!200804 (= lt!313811 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8062 BitStream!8062) Bool)

(assert (=> b!200804 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14256 0))(
  ( (Unit!14257) )
))
(declare-fun lt!313813 () Unit!14256)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8062) Unit!14256)

(assert (=> b!200804 (= lt!313813 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200805 () Bool)

(declare-fun res!168128 () Bool)

(assert (=> b!200805 (=> (not res!168128) (not e!137721))))

(assert (=> b!200805 (= res!168128 (= i!590 nBits!348))))

(declare-fun b!200806 () Bool)

(declare-fun res!168125 () Bool)

(assert (=> b!200806 (=> (not res!168125) (not e!137721))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200806 (= res!168125 (validate_offset_bits!1 ((_ sign_extend 32) (size!4477 (buf!4978 thiss!1204))) ((_ sign_extend 32) (currentByte!9376 thiss!1204)) ((_ sign_extend 32) (currentBit!9371 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200807 () Bool)

(assert (=> b!200807 (= e!137721 e!137720)))

(declare-fun res!168127 () Bool)

(assert (=> b!200807 (=> (not res!168127) (not e!137720))))

(declare-fun lt!313812 () (_ BitVec 64))

(assert (=> b!200807 (= res!168127 (= lt!313812 (bvsub (bvadd lt!313812 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200807 (= lt!313812 (bitIndex!0 (size!4477 (buf!4978 thiss!1204)) (currentByte!9376 thiss!1204) (currentBit!9371 thiss!1204)))))

(assert (= (and start!42590 res!168129) b!200806))

(assert (= (and b!200806 res!168125) b!200803))

(assert (= (and b!200803 res!168126) b!200805))

(assert (= (and b!200805 res!168128) b!200807))

(assert (= (and b!200807 res!168127) b!200804))

(assert (= start!42590 b!200802))

(declare-fun m!311479 () Bool)

(assert (=> b!200807 m!311479))

(declare-fun m!311481 () Bool)

(assert (=> b!200804 m!311481))

(declare-fun m!311483 () Bool)

(assert (=> b!200804 m!311483))

(declare-fun m!311485 () Bool)

(assert (=> b!200804 m!311485))

(declare-fun m!311487 () Bool)

(assert (=> b!200806 m!311487))

(declare-fun m!311489 () Bool)

(assert (=> b!200802 m!311489))

(declare-fun m!311491 () Bool)

(assert (=> start!42590 m!311491))

(declare-fun m!311493 () Bool)

(assert (=> b!200803 m!311493))

(push 1)

(assert (not b!200807))

(assert (not start!42590))

(assert (not b!200804))

(assert (not b!200802))

(assert (not b!200803))

(assert (not b!200806))

(check-sat)

(pop 1)

