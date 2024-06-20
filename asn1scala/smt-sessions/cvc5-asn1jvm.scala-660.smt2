; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18568 () Bool)

(assert start!18568)

(declare-fun b!92049 () Bool)

(declare-fun res!76004 () Bool)

(declare-fun e!60518 () Bool)

(assert (=> b!92049 (=> (not res!76004) (not e!60518))))

(declare-datatypes ((array!4308 0))(
  ( (array!4309 (arr!2574 (Array (_ BitVec 32) (_ BitVec 8))) (size!1946 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3436 0))(
  ( (BitStream!3437 (buf!2327 array!4308) (currentByte!4641 (_ BitVec 32)) (currentBit!4636 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3436)

(declare-fun bitStream2!8 () BitStream!3436)

(declare-fun isPrefixOf!0 (BitStream!3436 BitStream!3436) Bool)

(assert (=> b!92049 (= res!76004 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92050 () Bool)

(declare-fun e!60521 () Bool)

(declare-fun base!8 () BitStream!3436)

(declare-fun array_inv!1783 (array!4308) Bool)

(assert (=> b!92050 (= e!60521 (array_inv!1783 (buf!2327 base!8)))))

(declare-fun b!92051 () Bool)

(declare-fun res!76000 () Bool)

(assert (=> b!92051 (=> (not res!76000) (not e!60518))))

(declare-datatypes ((List!824 0))(
  ( (Nil!821) (Cons!820 (h!939 Bool) (t!1574 List!824)) )
))
(declare-fun listBits!13 () List!824)

(declare-fun length!415 (List!824) Int)

(assert (=> b!92051 (= res!76000 (> (length!415 listBits!13) 0))))

(declare-fun b!92052 () Bool)

(declare-fun e!60522 () Bool)

(assert (=> b!92052 (= e!60522 (array_inv!1783 (buf!2327 bitStream1!8)))))

(declare-fun b!92053 () Bool)

(declare-fun res!76001 () Bool)

(assert (=> b!92053 (=> (not res!76001) (not e!60518))))

(assert (=> b!92053 (= res!76001 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92054 () Bool)

(declare-fun e!60517 () Bool)

(assert (=> b!92054 (= e!60517 (array_inv!1783 (buf!2327 bitStream2!8)))))

(declare-fun b!92055 () Bool)

(declare-fun res!76005 () Bool)

(assert (=> b!92055 (=> (not res!76005) (not e!60518))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92055 (= res!76005 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1946 (buf!2327 bitStream1!8)) (currentByte!4641 bitStream1!8) (currentBit!4636 bitStream1!8))) (bitIndex!0 (size!1946 (buf!2327 bitStream2!8)) (currentByte!4641 bitStream2!8) (currentBit!4636 bitStream2!8))))))

(declare-fun b!92056 () Bool)

(declare-fun res!76003 () Bool)

(assert (=> b!92056 (=> (not res!76003) (not e!60518))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!92056 (= res!76003 (bvslt (bitIndex!0 (size!1946 (buf!2327 base!8)) (currentByte!4641 base!8) (currentBit!4636 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92057 () Bool)

(declare-fun res!76002 () Bool)

(assert (=> b!92057 (=> (not res!76002) (not e!60518))))

(assert (=> b!92057 (= res!76002 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92059 () Bool)

(assert (=> b!92059 (= e!60518 (or (bvsgt ((_ sign_extend 32) (size!1946 (buf!2327 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4641 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4636 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!76006 () Bool)

(assert (=> start!18568 (=> (not res!76006) (not e!60518))))

(assert (=> start!18568 (= res!76006 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18568 e!60518))

(assert (=> start!18568 true))

(declare-fun inv!12 (BitStream!3436) Bool)

(assert (=> start!18568 (and (inv!12 bitStream1!8) e!60522)))

(assert (=> start!18568 (and (inv!12 bitStream2!8) e!60517)))

(assert (=> start!18568 (and (inv!12 base!8) e!60521)))

(declare-fun b!92058 () Bool)

(declare-fun res!75999 () Bool)

(assert (=> b!92058 (=> (not res!75999) (not e!60518))))

(assert (=> b!92058 (= res!75999 (and (= (buf!2327 bitStream1!8) (buf!2327 bitStream2!8)) (= (buf!2327 bitStream1!8) (buf!2327 base!8))))))

(assert (= (and start!18568 res!76006) b!92051))

(assert (= (and b!92051 res!76000) b!92053))

(assert (= (and b!92053 res!76001) b!92057))

(assert (= (and b!92057 res!76002) b!92049))

(assert (= (and b!92049 res!76004) b!92058))

(assert (= (and b!92058 res!75999) b!92056))

(assert (= (and b!92056 res!76003) b!92055))

(assert (= (and b!92055 res!76005) b!92059))

(assert (= start!18568 b!92052))

(assert (= start!18568 b!92054))

(assert (= start!18568 b!92050))

(declare-fun m!136097 () Bool)

(assert (=> b!92053 m!136097))

(declare-fun m!136099 () Bool)

(assert (=> b!92057 m!136099))

(declare-fun m!136101 () Bool)

(assert (=> b!92050 m!136101))

(declare-fun m!136103 () Bool)

(assert (=> b!92054 m!136103))

(declare-fun m!136105 () Bool)

(assert (=> start!18568 m!136105))

(declare-fun m!136107 () Bool)

(assert (=> start!18568 m!136107))

(declare-fun m!136109 () Bool)

(assert (=> start!18568 m!136109))

(declare-fun m!136111 () Bool)

(assert (=> b!92052 m!136111))

(declare-fun m!136113 () Bool)

(assert (=> b!92049 m!136113))

(declare-fun m!136115 () Bool)

(assert (=> b!92051 m!136115))

(declare-fun m!136117 () Bool)

(assert (=> b!92055 m!136117))

(declare-fun m!136119 () Bool)

(assert (=> b!92055 m!136119))

(declare-fun m!136121 () Bool)

(assert (=> b!92056 m!136121))

(push 1)

(assert (not b!92057))

(assert (not b!92056))

(assert (not b!92052))

(assert (not b!92050))

(assert (not b!92054))

(assert (not b!92051))

(assert (not b!92049))

(assert (not b!92053))

(assert (not b!92055))

(assert (not start!18568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

