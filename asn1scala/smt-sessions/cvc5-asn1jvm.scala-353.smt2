; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8278 () Bool)

(assert start!8278)

(declare-fun b!41361 () Bool)

(declare-fun res!35190 () Bool)

(declare-fun e!27414 () Bool)

(assert (=> b!41361 (=> res!35190 e!27414)))

(declare-datatypes ((array!2081 0))(
  ( (array!2082 (arr!1439 (Array (_ BitVec 32) (_ BitVec 8))) (size!940 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1624 0))(
  ( (BitStream!1625 (buf!1268 array!2081) (currentByte!2711 (_ BitVec 32)) (currentBit!2706 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1624)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41361 (= res!35190 (not (invariant!0 (currentBit!2706 thiss!1379) (currentByte!2711 thiss!1379) (size!940 (buf!1268 thiss!1379)))))))

(declare-fun b!41362 () Bool)

(declare-fun e!27412 () Bool)

(assert (=> b!41362 (= e!27412 (not e!27414))))

(declare-fun res!35189 () Bool)

(assert (=> b!41362 (=> res!35189 e!27414)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!62579 () (_ BitVec 64))

(assert (=> b!41362 (= res!35189 (or (bvslt i!635 to!314) (not (= lt!62579 (bvsub (bvadd lt!62579 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1624 BitStream!1624) Bool)

(assert (=> b!41362 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2928 0))(
  ( (Unit!2929) )
))
(declare-fun lt!62581 () Unit!2928)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1624) Unit!2928)

(assert (=> b!41362 (= lt!62581 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41362 (= lt!62579 (bitIndex!0 (size!940 (buf!1268 thiss!1379)) (currentByte!2711 thiss!1379) (currentBit!2706 thiss!1379)))))

(declare-fun b!41363 () Bool)

(assert (=> b!41363 (= e!27414 true)))

(declare-datatypes ((tuple2!3982 0))(
  ( (tuple2!3983 (_1!2078 array!2081) (_2!2078 BitStream!1624)) )
))
(declare-fun lt!62580 () tuple2!3982)

(declare-fun readBits!0 (BitStream!1624 (_ BitVec 64)) tuple2!3982)

(declare-datatypes ((tuple2!3984 0))(
  ( (tuple2!3985 (_1!2079 BitStream!1624) (_2!2079 BitStream!1624)) )
))
(declare-fun reader!0 (BitStream!1624 BitStream!1624) tuple2!3984)

(assert (=> b!41363 (= lt!62580 (readBits!0 (_1!2079 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35188 () Bool)

(assert (=> start!8278 (=> (not res!35188) (not e!27412))))

(declare-fun srcBuffer!2 () array!2081)

(assert (=> start!8278 (= res!35188 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!940 srcBuffer!2))))))))

(assert (=> start!8278 e!27412))

(assert (=> start!8278 true))

(declare-fun array_inv!865 (array!2081) Bool)

(assert (=> start!8278 (array_inv!865 srcBuffer!2)))

(declare-fun e!27411 () Bool)

(declare-fun inv!12 (BitStream!1624) Bool)

(assert (=> start!8278 (and (inv!12 thiss!1379) e!27411)))

(declare-fun b!41364 () Bool)

(assert (=> b!41364 (= e!27411 (array_inv!865 (buf!1268 thiss!1379)))))

(declare-fun b!41365 () Bool)

(declare-fun res!35187 () Bool)

(assert (=> b!41365 (=> (not res!35187) (not e!27412))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41365 (= res!35187 (validate_offset_bits!1 ((_ sign_extend 32) (size!940 (buf!1268 thiss!1379))) ((_ sign_extend 32) (currentByte!2711 thiss!1379)) ((_ sign_extend 32) (currentBit!2706 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8278 res!35188) b!41365))

(assert (= (and b!41365 res!35187) b!41362))

(assert (= (and b!41362 (not res!35189)) b!41361))

(assert (= (and b!41361 (not res!35190)) b!41363))

(assert (= start!8278 b!41364))

(declare-fun m!63067 () Bool)

(assert (=> b!41365 m!63067))

(declare-fun m!63069 () Bool)

(assert (=> b!41363 m!63069))

(declare-fun m!63071 () Bool)

(assert (=> b!41363 m!63071))

(declare-fun m!63073 () Bool)

(assert (=> b!41362 m!63073))

(declare-fun m!63075 () Bool)

(assert (=> b!41362 m!63075))

(declare-fun m!63077 () Bool)

(assert (=> b!41362 m!63077))

(declare-fun m!63079 () Bool)

(assert (=> b!41361 m!63079))

(declare-fun m!63081 () Bool)

(assert (=> start!8278 m!63081))

(declare-fun m!63083 () Bool)

(assert (=> start!8278 m!63083))

(declare-fun m!63085 () Bool)

(assert (=> b!41364 m!63085))

(push 1)

(assert (not b!41361))

(assert (not b!41364))

(assert (not b!41363))

(assert (not start!8278))

(assert (not b!41362))

(assert (not b!41365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

