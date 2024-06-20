; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8352 () Bool)

(assert start!8352)

(declare-fun b!41651 () Bool)

(declare-fun e!27620 () Bool)

(declare-datatypes ((array!2104 0))(
  ( (array!2105 (arr!1449 (Array (_ BitVec 32) (_ BitVec 8))) (size!950 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1644 0))(
  ( (BitStream!1645 (buf!1278 array!2104) (currentByte!2730 (_ BitVec 32)) (currentBit!2725 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1644)

(declare-fun array_inv!875 (array!2104) Bool)

(assert (=> b!41651 (= e!27620 (array_inv!875 (buf!1278 thiss!1379)))))

(declare-fun b!41652 () Bool)

(declare-fun res!35429 () Bool)

(declare-fun e!27623 () Bool)

(assert (=> b!41652 (=> res!35429 e!27623)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41652 (= res!35429 (not (invariant!0 (currentBit!2725 thiss!1379) (currentByte!2730 thiss!1379) (size!950 (buf!1278 thiss!1379)))))))

(declare-fun b!41653 () Bool)

(declare-fun res!35431 () Bool)

(declare-fun e!27624 () Bool)

(assert (=> b!41653 (=> (not res!35431) (not e!27624))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41653 (= res!35431 (validate_offset_bits!1 ((_ sign_extend 32) (size!950 (buf!1278 thiss!1379))) ((_ sign_extend 32) (currentByte!2730 thiss!1379)) ((_ sign_extend 32) (currentBit!2725 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41654 () Bool)

(declare-fun e!27622 () Bool)

(assert (=> b!41654 (= e!27623 e!27622)))

(declare-fun res!35430 () Bool)

(assert (=> b!41654 (=> res!35430 e!27622)))

(assert (=> b!41654 (= res!35430 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4022 0))(
  ( (tuple2!4023 (_1!2101 array!2104) (_2!2101 BitStream!1644)) )
))
(declare-fun lt!62995 () tuple2!4022)

(declare-fun readBits!0 (BitStream!1644 (_ BitVec 64)) tuple2!4022)

(declare-datatypes ((tuple2!4024 0))(
  ( (tuple2!4025 (_1!2102 BitStream!1644) (_2!2102 BitStream!1644)) )
))
(declare-fun reader!0 (BitStream!1644 BitStream!1644) tuple2!4024)

(assert (=> b!41654 (= lt!62995 (readBits!0 (_1!2102 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35432 () Bool)

(assert (=> start!8352 (=> (not res!35432) (not e!27624))))

(declare-fun srcBuffer!2 () array!2104)

(assert (=> start!8352 (= res!35432 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!950 srcBuffer!2))))))))

(assert (=> start!8352 e!27624))

(assert (=> start!8352 true))

(assert (=> start!8352 (array_inv!875 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1644) Bool)

(assert (=> start!8352 (and (inv!12 thiss!1379) e!27620)))

(declare-fun b!41655 () Bool)

(assert (=> b!41655 (= e!27622 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1644 array!2104 array!2104 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41655 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2101 lt!62995) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41656 () Bool)

(assert (=> b!41656 (= e!27624 (not e!27623))))

(declare-fun res!35433 () Bool)

(assert (=> b!41656 (=> res!35433 e!27623)))

(declare-fun lt!62994 () (_ BitVec 64))

(assert (=> b!41656 (= res!35433 (or (bvslt i!635 to!314) (not (= lt!62994 (bvsub (bvadd lt!62994 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1644 BitStream!1644) Bool)

(assert (=> b!41656 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2951 0))(
  ( (Unit!2952) )
))
(declare-fun lt!62993 () Unit!2951)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1644) Unit!2951)

(assert (=> b!41656 (= lt!62993 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41656 (= lt!62994 (bitIndex!0 (size!950 (buf!1278 thiss!1379)) (currentByte!2730 thiss!1379) (currentBit!2725 thiss!1379)))))

(assert (= (and start!8352 res!35432) b!41653))

(assert (= (and b!41653 res!35431) b!41656))

(assert (= (and b!41656 (not res!35433)) b!41652))

(assert (= (and b!41652 (not res!35429)) b!41654))

(assert (= (and b!41654 (not res!35430)) b!41655))

(assert (= start!8352 b!41651))

(declare-fun m!63383 () Bool)

(assert (=> b!41653 m!63383))

(declare-fun m!63385 () Bool)

(assert (=> start!8352 m!63385))

(declare-fun m!63387 () Bool)

(assert (=> start!8352 m!63387))

(declare-fun m!63389 () Bool)

(assert (=> b!41655 m!63389))

(declare-fun m!63391 () Bool)

(assert (=> b!41652 m!63391))

(declare-fun m!63393 () Bool)

(assert (=> b!41656 m!63393))

(declare-fun m!63395 () Bool)

(assert (=> b!41656 m!63395))

(declare-fun m!63397 () Bool)

(assert (=> b!41656 m!63397))

(declare-fun m!63399 () Bool)

(assert (=> b!41651 m!63399))

(declare-fun m!63401 () Bool)

(assert (=> b!41654 m!63401))

(declare-fun m!63403 () Bool)

(assert (=> b!41654 m!63403))

(check-sat (not b!41654) (not start!8352) (not b!41653) (not b!41655) (not b!41651) (not b!41656) (not b!41652))
