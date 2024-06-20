; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8282 () Bool)

(assert start!8282)

(declare-fun b!41391 () Bool)

(declare-fun e!27442 () Bool)

(declare-fun e!27444 () Bool)

(assert (=> b!41391 (= e!27442 (not e!27444))))

(declare-fun res!35211 () Bool)

(assert (=> b!41391 (=> res!35211 e!27444)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!62597 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41391 (= res!35211 (or (bvslt i!635 to!314) (not (= lt!62597 (bvsub (bvadd lt!62597 to!314) i!635)))))))

(declare-datatypes ((array!2085 0))(
  ( (array!2086 (arr!1441 (Array (_ BitVec 32) (_ BitVec 8))) (size!942 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1628 0))(
  ( (BitStream!1629 (buf!1270 array!2085) (currentByte!2713 (_ BitVec 32)) (currentBit!2708 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1628)

(declare-fun isPrefixOf!0 (BitStream!1628 BitStream!1628) Bool)

(assert (=> b!41391 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2932 0))(
  ( (Unit!2933) )
))
(declare-fun lt!62598 () Unit!2932)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1628) Unit!2932)

(assert (=> b!41391 (= lt!62598 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41391 (= lt!62597 (bitIndex!0 (size!942 (buf!1270 thiss!1379)) (currentByte!2713 thiss!1379) (currentBit!2708 thiss!1379)))))

(declare-fun b!41392 () Bool)

(declare-fun res!35214 () Bool)

(assert (=> b!41392 (=> (not res!35214) (not e!27442))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41392 (= res!35214 (validate_offset_bits!1 ((_ sign_extend 32) (size!942 (buf!1270 thiss!1379))) ((_ sign_extend 32) (currentByte!2713 thiss!1379)) ((_ sign_extend 32) (currentBit!2708 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41393 () Bool)

(assert (=> b!41393 (= e!27444 true)))

(declare-datatypes ((tuple2!3990 0))(
  ( (tuple2!3991 (_1!2082 array!2085) (_2!2082 BitStream!1628)) )
))
(declare-fun lt!62599 () tuple2!3990)

(declare-fun readBits!0 (BitStream!1628 (_ BitVec 64)) tuple2!3990)

(declare-datatypes ((tuple2!3992 0))(
  ( (tuple2!3993 (_1!2083 BitStream!1628) (_2!2083 BitStream!1628)) )
))
(declare-fun reader!0 (BitStream!1628 BitStream!1628) tuple2!3992)

(assert (=> b!41393 (= lt!62599 (readBits!0 (_1!2083 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41394 () Bool)

(declare-fun e!27445 () Bool)

(declare-fun array_inv!867 (array!2085) Bool)

(assert (=> b!41394 (= e!27445 (array_inv!867 (buf!1270 thiss!1379)))))

(declare-fun res!35213 () Bool)

(assert (=> start!8282 (=> (not res!35213) (not e!27442))))

(declare-fun srcBuffer!2 () array!2085)

(assert (=> start!8282 (= res!35213 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!942 srcBuffer!2))))))))

(assert (=> start!8282 e!27442))

(assert (=> start!8282 true))

(assert (=> start!8282 (array_inv!867 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1628) Bool)

(assert (=> start!8282 (and (inv!12 thiss!1379) e!27445)))

(declare-fun b!41395 () Bool)

(declare-fun res!35212 () Bool)

(assert (=> b!41395 (=> res!35212 e!27444)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41395 (= res!35212 (not (invariant!0 (currentBit!2708 thiss!1379) (currentByte!2713 thiss!1379) (size!942 (buf!1270 thiss!1379)))))))

(assert (= (and start!8282 res!35213) b!41392))

(assert (= (and b!41392 res!35214) b!41391))

(assert (= (and b!41391 (not res!35211)) b!41395))

(assert (= (and b!41395 (not res!35212)) b!41393))

(assert (= start!8282 b!41394))

(declare-fun m!63107 () Bool)

(assert (=> start!8282 m!63107))

(declare-fun m!63109 () Bool)

(assert (=> start!8282 m!63109))

(declare-fun m!63111 () Bool)

(assert (=> b!41393 m!63111))

(declare-fun m!63113 () Bool)

(assert (=> b!41393 m!63113))

(declare-fun m!63115 () Bool)

(assert (=> b!41394 m!63115))

(declare-fun m!63117 () Bool)

(assert (=> b!41395 m!63117))

(declare-fun m!63119 () Bool)

(assert (=> b!41392 m!63119))

(declare-fun m!63121 () Bool)

(assert (=> b!41391 m!63121))

(declare-fun m!63123 () Bool)

(assert (=> b!41391 m!63123))

(declare-fun m!63125 () Bool)

(assert (=> b!41391 m!63125))

(push 1)

(assert (not b!41394))

(assert (not b!41391))

(assert (not b!41393))

(assert (not b!41395))

