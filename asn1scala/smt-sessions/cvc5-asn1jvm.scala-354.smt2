; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8284 () Bool)

(assert start!8284)

(declare-fun b!41406 () Bool)

(declare-fun res!35223 () Bool)

(declare-fun e!27456 () Bool)

(assert (=> b!41406 (=> res!35223 e!27456)))

(declare-datatypes ((array!2087 0))(
  ( (array!2088 (arr!1442 (Array (_ BitVec 32) (_ BitVec 8))) (size!943 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1630 0))(
  ( (BitStream!1631 (buf!1271 array!2087) (currentByte!2714 (_ BitVec 32)) (currentBit!2709 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1630)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41406 (= res!35223 (not (invariant!0 (currentBit!2709 thiss!1379) (currentByte!2714 thiss!1379) (size!943 (buf!1271 thiss!1379)))))))

(declare-fun res!35226 () Bool)

(declare-fun e!27458 () Bool)

(assert (=> start!8284 (=> (not res!35226) (not e!27458))))

(declare-fun srcBuffer!2 () array!2087)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8284 (= res!35226 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!943 srcBuffer!2))))))))

(assert (=> start!8284 e!27458))

(assert (=> start!8284 true))

(declare-fun array_inv!868 (array!2087) Bool)

(assert (=> start!8284 (array_inv!868 srcBuffer!2)))

(declare-fun e!27459 () Bool)

(declare-fun inv!12 (BitStream!1630) Bool)

(assert (=> start!8284 (and (inv!12 thiss!1379) e!27459)))

(declare-fun b!41407 () Bool)

(declare-fun res!35224 () Bool)

(assert (=> b!41407 (=> (not res!35224) (not e!27458))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41407 (= res!35224 (validate_offset_bits!1 ((_ sign_extend 32) (size!943 (buf!1271 thiss!1379))) ((_ sign_extend 32) (currentByte!2714 thiss!1379)) ((_ sign_extend 32) (currentBit!2709 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41408 () Bool)

(assert (=> b!41408 (= e!27459 (array_inv!868 (buf!1271 thiss!1379)))))

(declare-fun b!41409 () Bool)

(assert (=> b!41409 (= e!27458 (not e!27456))))

(declare-fun res!35225 () Bool)

(assert (=> b!41409 (=> res!35225 e!27456)))

(declare-fun lt!62606 () (_ BitVec 64))

(assert (=> b!41409 (= res!35225 (or (bvslt i!635 to!314) (not (= lt!62606 (bvsub (bvadd lt!62606 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1630 BitStream!1630) Bool)

(assert (=> b!41409 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2934 0))(
  ( (Unit!2935) )
))
(declare-fun lt!62608 () Unit!2934)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1630) Unit!2934)

(assert (=> b!41409 (= lt!62608 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41409 (= lt!62606 (bitIndex!0 (size!943 (buf!1271 thiss!1379)) (currentByte!2714 thiss!1379) (currentBit!2709 thiss!1379)))))

(declare-fun b!41410 () Bool)

(assert (=> b!41410 (= e!27456 true)))

(declare-datatypes ((tuple2!3994 0))(
  ( (tuple2!3995 (_1!2084 array!2087) (_2!2084 BitStream!1630)) )
))
(declare-fun lt!62607 () tuple2!3994)

(declare-fun readBits!0 (BitStream!1630 (_ BitVec 64)) tuple2!3994)

(declare-datatypes ((tuple2!3996 0))(
  ( (tuple2!3997 (_1!2085 BitStream!1630) (_2!2085 BitStream!1630)) )
))
(declare-fun reader!0 (BitStream!1630 BitStream!1630) tuple2!3996)

(assert (=> b!41410 (= lt!62607 (readBits!0 (_1!2085 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8284 res!35226) b!41407))

(assert (= (and b!41407 res!35224) b!41409))

(assert (= (and b!41409 (not res!35225)) b!41406))

(assert (= (and b!41406 (not res!35223)) b!41410))

(assert (= start!8284 b!41408))

(declare-fun m!63127 () Bool)

(assert (=> b!41406 m!63127))

(declare-fun m!63129 () Bool)

(assert (=> b!41407 m!63129))

(declare-fun m!63131 () Bool)

(assert (=> b!41409 m!63131))

(declare-fun m!63133 () Bool)

(assert (=> b!41409 m!63133))

(declare-fun m!63135 () Bool)

(assert (=> b!41409 m!63135))

(declare-fun m!63137 () Bool)

(assert (=> start!8284 m!63137))

(declare-fun m!63139 () Bool)

(assert (=> start!8284 m!63139))

(declare-fun m!63141 () Bool)

(assert (=> b!41410 m!63141))

(declare-fun m!63143 () Bool)

(assert (=> b!41410 m!63143))

(declare-fun m!63145 () Bool)

(assert (=> b!41408 m!63145))

(push 1)

(assert (not b!41406))

(assert (not b!41409))

(assert (not start!8284))

(assert (not b!41407))

(assert (not b!41410))

(assert (not b!41408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

