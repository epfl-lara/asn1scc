; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8276 () Bool)

(assert start!8276)

(declare-fun b!41346 () Bool)

(declare-fun res!35175 () Bool)

(declare-fun e!27399 () Bool)

(assert (=> b!41346 (=> (not res!35175) (not e!27399))))

(declare-datatypes ((array!2079 0))(
  ( (array!2080 (arr!1438 (Array (_ BitVec 32) (_ BitVec 8))) (size!939 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1622 0))(
  ( (BitStream!1623 (buf!1267 array!2079) (currentByte!2710 (_ BitVec 32)) (currentBit!2705 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1622)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41346 (= res!35175 (validate_offset_bits!1 ((_ sign_extend 32) (size!939 (buf!1267 thiss!1379))) ((_ sign_extend 32) (currentByte!2710 thiss!1379)) ((_ sign_extend 32) (currentBit!2705 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35176 () Bool)

(assert (=> start!8276 (=> (not res!35176) (not e!27399))))

(declare-fun srcBuffer!2 () array!2079)

(assert (=> start!8276 (= res!35176 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!939 srcBuffer!2))))))))

(assert (=> start!8276 e!27399))

(assert (=> start!8276 true))

(declare-fun array_inv!864 (array!2079) Bool)

(assert (=> start!8276 (array_inv!864 srcBuffer!2)))

(declare-fun e!27398 () Bool)

(declare-fun inv!12 (BitStream!1622) Bool)

(assert (=> start!8276 (and (inv!12 thiss!1379) e!27398)))

(declare-fun b!41347 () Bool)

(declare-fun res!35177 () Bool)

(declare-fun e!27396 () Bool)

(assert (=> b!41347 (=> res!35177 e!27396)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41347 (= res!35177 (not (invariant!0 (currentBit!2705 thiss!1379) (currentByte!2710 thiss!1379) (size!939 (buf!1267 thiss!1379)))))))

(declare-fun b!41348 () Bool)

(assert (=> b!41348 (= e!27398 (array_inv!864 (buf!1267 thiss!1379)))))

(declare-fun b!41349 () Bool)

(assert (=> b!41349 (= e!27396 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-datatypes ((tuple2!3978 0))(
  ( (tuple2!3979 (_1!2076 array!2079) (_2!2076 BitStream!1622)) )
))
(declare-fun lt!62571 () tuple2!3978)

(declare-fun readBits!0 (BitStream!1622 (_ BitVec 64)) tuple2!3978)

(declare-datatypes ((tuple2!3980 0))(
  ( (tuple2!3981 (_1!2077 BitStream!1622) (_2!2077 BitStream!1622)) )
))
(declare-fun reader!0 (BitStream!1622 BitStream!1622) tuple2!3980)

(assert (=> b!41349 (= lt!62571 (readBits!0 (_1!2077 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41350 () Bool)

(assert (=> b!41350 (= e!27399 (not e!27396))))

(declare-fun res!35178 () Bool)

(assert (=> b!41350 (=> res!35178 e!27396)))

(declare-fun lt!62570 () (_ BitVec 64))

(assert (=> b!41350 (= res!35178 (or (bvslt i!635 to!314) (not (= lt!62570 (bvsub (bvadd lt!62570 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1622 BitStream!1622) Bool)

(assert (=> b!41350 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2926 0))(
  ( (Unit!2927) )
))
(declare-fun lt!62572 () Unit!2926)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1622) Unit!2926)

(assert (=> b!41350 (= lt!62572 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41350 (= lt!62570 (bitIndex!0 (size!939 (buf!1267 thiss!1379)) (currentByte!2710 thiss!1379) (currentBit!2705 thiss!1379)))))

(assert (= (and start!8276 res!35176) b!41346))

(assert (= (and b!41346 res!35175) b!41350))

(assert (= (and b!41350 (not res!35178)) b!41347))

(assert (= (and b!41347 (not res!35177)) b!41349))

(assert (= start!8276 b!41348))

(declare-fun m!63047 () Bool)

(assert (=> b!41348 m!63047))

(declare-fun m!63049 () Bool)

(assert (=> b!41346 m!63049))

(declare-fun m!63051 () Bool)

(assert (=> b!41349 m!63051))

(declare-fun m!63053 () Bool)

(assert (=> b!41349 m!63053))

(declare-fun m!63055 () Bool)

(assert (=> b!41347 m!63055))

(declare-fun m!63057 () Bool)

(assert (=> b!41350 m!63057))

(declare-fun m!63059 () Bool)

(assert (=> b!41350 m!63059))

(declare-fun m!63061 () Bool)

(assert (=> b!41350 m!63061))

(declare-fun m!63063 () Bool)

(assert (=> start!8276 m!63063))

(declare-fun m!63065 () Bool)

(assert (=> start!8276 m!63065))

(push 1)

(assert (not b!41347))

(assert (not start!8276))

(assert (not b!41348))

(assert (not b!41350))

(assert (not b!41346))

(assert (not b!41349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

