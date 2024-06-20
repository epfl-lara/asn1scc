; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8288 () Bool)

(assert start!8288)

(declare-fun res!35247 () Bool)

(declare-fun e!27488 () Bool)

(assert (=> start!8288 (=> (not res!35247) (not e!27488))))

(declare-datatypes ((array!2091 0))(
  ( (array!2092 (arr!1444 (Array (_ BitVec 32) (_ BitVec 8))) (size!945 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2091)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8288 (= res!35247 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!945 srcBuffer!2))))))))

(assert (=> start!8288 e!27488))

(assert (=> start!8288 true))

(declare-fun array_inv!870 (array!2091) Bool)

(assert (=> start!8288 (array_inv!870 srcBuffer!2)))

(declare-datatypes ((BitStream!1634 0))(
  ( (BitStream!1635 (buf!1273 array!2091) (currentByte!2716 (_ BitVec 32)) (currentBit!2711 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1634)

(declare-fun e!27490 () Bool)

(declare-fun inv!12 (BitStream!1634) Bool)

(assert (=> start!8288 (and (inv!12 thiss!1379) e!27490)))

(declare-fun b!41436 () Bool)

(declare-fun res!35248 () Bool)

(assert (=> b!41436 (=> (not res!35248) (not e!27488))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41436 (= res!35248 (validate_offset_bits!1 ((_ sign_extend 32) (size!945 (buf!1273 thiss!1379))) ((_ sign_extend 32) (currentByte!2716 thiss!1379)) ((_ sign_extend 32) (currentBit!2711 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41437 () Bool)

(declare-fun res!35249 () Bool)

(declare-fun e!27486 () Bool)

(assert (=> b!41437 (=> res!35249 e!27486)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41437 (= res!35249 (not (invariant!0 (currentBit!2711 thiss!1379) (currentByte!2716 thiss!1379) (size!945 (buf!1273 thiss!1379)))))))

(declare-fun b!41438 () Bool)

(assert (=> b!41438 (= e!27488 (not e!27486))))

(declare-fun res!35250 () Bool)

(assert (=> b!41438 (=> res!35250 e!27486)))

(declare-fun lt!62624 () (_ BitVec 64))

(assert (=> b!41438 (= res!35250 (or (bvslt i!635 to!314) (not (= lt!62624 (bvsub (bvadd lt!62624 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1634 BitStream!1634) Bool)

(assert (=> b!41438 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2938 0))(
  ( (Unit!2939) )
))
(declare-fun lt!62626 () Unit!2938)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1634) Unit!2938)

(assert (=> b!41438 (= lt!62626 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41438 (= lt!62624 (bitIndex!0 (size!945 (buf!1273 thiss!1379)) (currentByte!2716 thiss!1379) (currentBit!2711 thiss!1379)))))

(declare-fun b!41439 () Bool)

(assert (=> b!41439 (= e!27486 true)))

(declare-datatypes ((tuple2!4002 0))(
  ( (tuple2!4003 (_1!2088 array!2091) (_2!2088 BitStream!1634)) )
))
(declare-fun lt!62625 () tuple2!4002)

(declare-fun readBits!0 (BitStream!1634 (_ BitVec 64)) tuple2!4002)

(declare-datatypes ((tuple2!4004 0))(
  ( (tuple2!4005 (_1!2089 BitStream!1634) (_2!2089 BitStream!1634)) )
))
(declare-fun reader!0 (BitStream!1634 BitStream!1634) tuple2!4004)

(assert (=> b!41439 (= lt!62625 (readBits!0 (_1!2089 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41440 () Bool)

(assert (=> b!41440 (= e!27490 (array_inv!870 (buf!1273 thiss!1379)))))

(assert (= (and start!8288 res!35247) b!41436))

(assert (= (and b!41436 res!35248) b!41438))

(assert (= (and b!41438 (not res!35250)) b!41437))

(assert (= (and b!41437 (not res!35249)) b!41439))

(assert (= start!8288 b!41440))

(declare-fun m!63167 () Bool)

(assert (=> b!41436 m!63167))

(declare-fun m!63169 () Bool)

(assert (=> start!8288 m!63169))

(declare-fun m!63171 () Bool)

(assert (=> start!8288 m!63171))

(declare-fun m!63173 () Bool)

(assert (=> b!41440 m!63173))

(declare-fun m!63175 () Bool)

(assert (=> b!41439 m!63175))

(declare-fun m!63177 () Bool)

(assert (=> b!41439 m!63177))

(declare-fun m!63179 () Bool)

(assert (=> b!41438 m!63179))

(declare-fun m!63181 () Bool)

(assert (=> b!41438 m!63181))

(declare-fun m!63183 () Bool)

(assert (=> b!41438 m!63183))

(declare-fun m!63185 () Bool)

(assert (=> b!41437 m!63185))

(push 1)

