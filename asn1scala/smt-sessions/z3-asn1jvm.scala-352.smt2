; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8274 () Bool)

(assert start!8274)

(declare-fun res!35163 () Bool)

(declare-fun e!27383 () Bool)

(assert (=> start!8274 (=> (not res!35163) (not e!27383))))

(declare-datatypes ((array!2077 0))(
  ( (array!2078 (arr!1437 (Array (_ BitVec 32) (_ BitVec 8))) (size!938 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2077)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8274 (= res!35163 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!938 srcBuffer!2))))))))

(assert (=> start!8274 e!27383))

(assert (=> start!8274 true))

(declare-fun array_inv!863 (array!2077) Bool)

(assert (=> start!8274 (array_inv!863 srcBuffer!2)))

(declare-datatypes ((BitStream!1620 0))(
  ( (BitStream!1621 (buf!1266 array!2077) (currentByte!2709 (_ BitVec 32)) (currentBit!2704 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1620)

(declare-fun e!27381 () Bool)

(declare-fun inv!12 (BitStream!1620) Bool)

(assert (=> start!8274 (and (inv!12 thiss!1379) e!27381)))

(declare-fun b!41331 () Bool)

(declare-fun res!35165 () Bool)

(declare-fun e!27384 () Bool)

(assert (=> b!41331 (=> res!35165 e!27384)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41331 (= res!35165 (not (invariant!0 (currentBit!2704 thiss!1379) (currentByte!2709 thiss!1379) (size!938 (buf!1266 thiss!1379)))))))

(declare-fun b!41332 () Bool)

(assert (=> b!41332 (= e!27381 (array_inv!863 (buf!1266 thiss!1379)))))

(declare-fun b!41333 () Bool)

(assert (=> b!41333 (= e!27384 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-datatypes ((tuple2!3974 0))(
  ( (tuple2!3975 (_1!2074 array!2077) (_2!2074 BitStream!1620)) )
))
(declare-fun lt!62561 () tuple2!3974)

(declare-fun readBits!0 (BitStream!1620 (_ BitVec 64)) tuple2!3974)

(declare-datatypes ((tuple2!3976 0))(
  ( (tuple2!3977 (_1!2075 BitStream!1620) (_2!2075 BitStream!1620)) )
))
(declare-fun reader!0 (BitStream!1620 BitStream!1620) tuple2!3976)

(assert (=> b!41333 (= lt!62561 (readBits!0 (_1!2075 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41334 () Bool)

(assert (=> b!41334 (= e!27383 (not e!27384))))

(declare-fun res!35164 () Bool)

(assert (=> b!41334 (=> res!35164 e!27384)))

(declare-fun lt!62562 () (_ BitVec 64))

(assert (=> b!41334 (= res!35164 (or (bvslt i!635 to!314) (not (= lt!62562 (bvsub (bvadd lt!62562 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1620 BitStream!1620) Bool)

(assert (=> b!41334 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2924 0))(
  ( (Unit!2925) )
))
(declare-fun lt!62563 () Unit!2924)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1620) Unit!2924)

(assert (=> b!41334 (= lt!62563 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41334 (= lt!62562 (bitIndex!0 (size!938 (buf!1266 thiss!1379)) (currentByte!2709 thiss!1379) (currentBit!2704 thiss!1379)))))

(declare-fun b!41335 () Bool)

(declare-fun res!35166 () Bool)

(assert (=> b!41335 (=> (not res!35166) (not e!27383))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41335 (= res!35166 (validate_offset_bits!1 ((_ sign_extend 32) (size!938 (buf!1266 thiss!1379))) ((_ sign_extend 32) (currentByte!2709 thiss!1379)) ((_ sign_extend 32) (currentBit!2704 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8274 res!35163) b!41335))

(assert (= (and b!41335 res!35166) b!41334))

(assert (= (and b!41334 (not res!35164)) b!41331))

(assert (= (and b!41331 (not res!35165)) b!41333))

(assert (= start!8274 b!41332))

(declare-fun m!63027 () Bool)

(assert (=> b!41332 m!63027))

(declare-fun m!63029 () Bool)

(assert (=> b!41333 m!63029))

(declare-fun m!63031 () Bool)

(assert (=> b!41333 m!63031))

(declare-fun m!63033 () Bool)

(assert (=> b!41335 m!63033))

(declare-fun m!63035 () Bool)

(assert (=> b!41334 m!63035))

(declare-fun m!63037 () Bool)

(assert (=> b!41334 m!63037))

(declare-fun m!63039 () Bool)

(assert (=> b!41334 m!63039))

(declare-fun m!63041 () Bool)

(assert (=> b!41331 m!63041))

(declare-fun m!63043 () Bool)

(assert (=> start!8274 m!63043))

(declare-fun m!63045 () Bool)

(assert (=> start!8274 m!63045))

(check-sat (not b!41334) (not b!41333) (not b!41332) (not b!41331) (not start!8274) (not b!41335))
(check-sat)
