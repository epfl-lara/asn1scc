; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10354 () Bool)

(assert start!10354)

(declare-fun res!43551 () Bool)

(declare-fun e!34406 () Bool)

(assert (=> start!10354 (=> (not res!43551) (not e!34406))))

(declare-datatypes ((array!2381 0))(
  ( (array!2382 (arr!1621 (Array (_ BitVec 32) (_ BitVec 8))) (size!1085 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2381)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10354 (= res!43551 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1085 srcBuffer!2))))))))

(assert (=> start!10354 e!34406))

(assert (=> start!10354 true))

(declare-fun array_inv!990 (array!2381) Bool)

(assert (=> start!10354 (array_inv!990 srcBuffer!2)))

(declare-datatypes ((BitStream!1874 0))(
  ( (BitStream!1875 (buf!1441 array!2381) (currentByte!2984 (_ BitVec 32)) (currentBit!2979 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1874)

(declare-fun e!34405 () Bool)

(declare-fun inv!12 (BitStream!1874) Bool)

(assert (=> start!10354 (and (inv!12 thiss!1379) e!34405)))

(declare-fun b!52109 () Bool)

(declare-fun res!43550 () Bool)

(assert (=> b!52109 (=> (not res!43550) (not e!34406))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52109 (= res!43550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1085 (buf!1441 thiss!1379))) ((_ sign_extend 32) (currentByte!2984 thiss!1379)) ((_ sign_extend 32) (currentBit!2979 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52110 () Bool)

(assert (=> b!52110 (= e!34406 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1874 BitStream!1874) Bool)

(assert (=> b!52110 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3592 0))(
  ( (Unit!3593) )
))
(declare-fun lt!81229 () Unit!3592)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1874) Unit!3592)

(assert (=> b!52110 (= lt!81229 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81228 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52110 (= lt!81228 (bitIndex!0 (size!1085 (buf!1441 thiss!1379)) (currentByte!2984 thiss!1379) (currentBit!2979 thiss!1379)))))

(declare-fun b!52111 () Bool)

(assert (=> b!52111 (= e!34405 (array_inv!990 (buf!1441 thiss!1379)))))

(assert (= (and start!10354 res!43551) b!52109))

(assert (= (and b!52109 res!43550) b!52110))

(assert (= start!10354 b!52111))

(declare-fun m!82289 () Bool)

(assert (=> start!10354 m!82289))

(declare-fun m!82291 () Bool)

(assert (=> start!10354 m!82291))

(declare-fun m!82293 () Bool)

(assert (=> b!52109 m!82293))

(declare-fun m!82295 () Bool)

(assert (=> b!52110 m!82295))

(declare-fun m!82297 () Bool)

(assert (=> b!52110 m!82297))

(declare-fun m!82299 () Bool)

(assert (=> b!52110 m!82299))

(declare-fun m!82301 () Bool)

(assert (=> b!52111 m!82301))

(push 1)

(assert (not b!52111))

