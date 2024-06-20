; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10302 () Bool)

(assert start!10302)

(declare-fun res!43461 () Bool)

(declare-fun e!34297 () Bool)

(assert (=> start!10302 (=> (not res!43461) (not e!34297))))

(declare-datatypes ((array!2366 0))(
  ( (array!2367 (arr!1615 (Array (_ BitVec 32) (_ BitVec 8))) (size!1079 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2366)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10302 (= res!43461 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1079 srcBuffer!2))))))))

(assert (=> start!10302 e!34297))

(assert (=> start!10302 true))

(declare-fun array_inv!984 (array!2366) Bool)

(assert (=> start!10302 (array_inv!984 srcBuffer!2)))

(declare-datatypes ((BitStream!1862 0))(
  ( (BitStream!1863 (buf!1435 array!2366) (currentByte!2970 (_ BitVec 32)) (currentBit!2965 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1862)

(declare-fun e!34298 () Bool)

(declare-fun inv!12 (BitStream!1862) Bool)

(assert (=> start!10302 (and (inv!12 thiss!1379) e!34298)))

(declare-fun b!52001 () Bool)

(declare-fun res!43460 () Bool)

(assert (=> b!52001 (=> (not res!43460) (not e!34297))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52001 (= res!43460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1079 (buf!1435 thiss!1379))) ((_ sign_extend 32) (currentByte!2970 thiss!1379)) ((_ sign_extend 32) (currentBit!2965 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52002 () Bool)

(declare-fun lt!81130 () (_ BitVec 64))

(assert (=> b!52002 (= e!34297 (not (or (bvslt i!635 to!314) (= lt!81130 (bvsub (bvadd lt!81130 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1862 BitStream!1862) Bool)

(assert (=> b!52002 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3580 0))(
  ( (Unit!3581) )
))
(declare-fun lt!81129 () Unit!3580)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1862) Unit!3580)

(assert (=> b!52002 (= lt!81129 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52002 (= lt!81130 (bitIndex!0 (size!1079 (buf!1435 thiss!1379)) (currentByte!2970 thiss!1379) (currentBit!2965 thiss!1379)))))

(declare-fun b!52003 () Bool)

(assert (=> b!52003 (= e!34298 (array_inv!984 (buf!1435 thiss!1379)))))

(assert (= (and start!10302 res!43461) b!52001))

(assert (= (and b!52001 res!43460) b!52002))

(assert (= start!10302 b!52003))

(declare-fun m!82183 () Bool)

(assert (=> start!10302 m!82183))

(declare-fun m!82185 () Bool)

(assert (=> start!10302 m!82185))

(declare-fun m!82187 () Bool)

(assert (=> b!52001 m!82187))

(declare-fun m!82189 () Bool)

(assert (=> b!52002 m!82189))

(declare-fun m!82191 () Bool)

(assert (=> b!52002 m!82191))

(declare-fun m!82193 () Bool)

(assert (=> b!52002 m!82193))

(declare-fun m!82195 () Bool)

(assert (=> b!52003 m!82195))

(push 1)

(assert (not b!52001))

(assert (not b!52003))

(assert (not b!52002))

(assert (not start!10302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

