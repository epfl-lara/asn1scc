; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8368 () Bool)

(assert start!8368)

(declare-fun b!41795 () Bool)

(declare-fun e!27769 () Bool)

(assert (=> b!41795 (= e!27769 true)))

(declare-datatypes ((array!2120 0))(
  ( (array!2121 (arr!1457 (Array (_ BitVec 32) (_ BitVec 8))) (size!958 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2120)

(declare-datatypes ((BitStream!1660 0))(
  ( (BitStream!1661 (buf!1286 array!2120) (currentByte!2738 (_ BitVec 32)) (currentBit!2733 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1660)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!4054 0))(
  ( (tuple2!4055 (_1!2117 array!2120) (_2!2117 BitStream!1660)) )
))
(declare-fun lt!63066 () tuple2!4054)

(declare-fun checkByteArrayBitContent!0 (BitStream!1660 array!2120 array!2120 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41795 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2117 lt!63066) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41796 () Bool)

(declare-fun e!27767 () Bool)

(assert (=> b!41796 (= e!27767 e!27769)))

(declare-fun res!35550 () Bool)

(assert (=> b!41796 (=> res!35550 e!27769)))

(assert (=> b!41796 (= res!35550 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1660 (_ BitVec 64)) tuple2!4054)

(declare-datatypes ((tuple2!4056 0))(
  ( (tuple2!4057 (_1!2118 BitStream!1660) (_2!2118 BitStream!1660)) )
))
(declare-fun reader!0 (BitStream!1660 BitStream!1660) tuple2!4056)

(assert (=> b!41796 (= lt!63066 (readBits!0 (_1!2118 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41797 () Bool)

(declare-fun res!35552 () Bool)

(declare-fun e!27764 () Bool)

(assert (=> b!41797 (=> (not res!35552) (not e!27764))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41797 (= res!35552 (validate_offset_bits!1 ((_ sign_extend 32) (size!958 (buf!1286 thiss!1379))) ((_ sign_extend 32) (currentByte!2738 thiss!1379)) ((_ sign_extend 32) (currentBit!2733 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41798 () Bool)

(declare-fun e!27766 () Bool)

(declare-fun array_inv!883 (array!2120) Bool)

(assert (=> b!41798 (= e!27766 (array_inv!883 (buf!1286 thiss!1379)))))

(declare-fun b!41799 () Bool)

(declare-fun res!35553 () Bool)

(assert (=> b!41799 (=> res!35553 e!27767)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41799 (= res!35553 (not (invariant!0 (currentBit!2733 thiss!1379) (currentByte!2738 thiss!1379) (size!958 (buf!1286 thiss!1379)))))))

(declare-fun b!41800 () Bool)

(assert (=> b!41800 (= e!27764 (not e!27767))))

(declare-fun res!35551 () Bool)

(assert (=> b!41800 (=> res!35551 e!27767)))

(declare-fun lt!63067 () (_ BitVec 64))

(assert (=> b!41800 (= res!35551 (or (bvslt i!635 to!314) (not (= lt!63067 (bvsub (bvadd lt!63067 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1660 BitStream!1660) Bool)

(assert (=> b!41800 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2967 0))(
  ( (Unit!2968) )
))
(declare-fun lt!63065 () Unit!2967)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1660) Unit!2967)

(assert (=> b!41800 (= lt!63065 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41800 (= lt!63067 (bitIndex!0 (size!958 (buf!1286 thiss!1379)) (currentByte!2738 thiss!1379) (currentBit!2733 thiss!1379)))))

(declare-fun res!35549 () Bool)

(assert (=> start!8368 (=> (not res!35549) (not e!27764))))

(assert (=> start!8368 (= res!35549 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!958 srcBuffer!2))))))))

(assert (=> start!8368 e!27764))

(assert (=> start!8368 true))

(assert (=> start!8368 (array_inv!883 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1660) Bool)

(assert (=> start!8368 (and (inv!12 thiss!1379) e!27766)))

(assert (= (and start!8368 res!35549) b!41797))

(assert (= (and b!41797 res!35552) b!41800))

(assert (= (and b!41800 (not res!35551)) b!41799))

(assert (= (and b!41799 (not res!35553)) b!41796))

(assert (= (and b!41796 (not res!35550)) b!41795))

(assert (= start!8368 b!41798))

(declare-fun m!63559 () Bool)

(assert (=> b!41797 m!63559))

(declare-fun m!63561 () Bool)

(assert (=> b!41799 m!63561))

(declare-fun m!63563 () Bool)

(assert (=> b!41796 m!63563))

(declare-fun m!63565 () Bool)

(assert (=> b!41796 m!63565))

(declare-fun m!63567 () Bool)

(assert (=> start!8368 m!63567))

(declare-fun m!63569 () Bool)

(assert (=> start!8368 m!63569))

(declare-fun m!63571 () Bool)

(assert (=> b!41798 m!63571))

(declare-fun m!63573 () Bool)

(assert (=> b!41800 m!63573))

(declare-fun m!63575 () Bool)

(assert (=> b!41800 m!63575))

(declare-fun m!63577 () Bool)

(assert (=> b!41800 m!63577))

(declare-fun m!63579 () Bool)

(assert (=> b!41795 m!63579))

(push 1)

(assert (not b!41797))

(assert (not b!41799))

(assert (not b!41800))

(assert (not b!41798))

(assert (not b!41795))

(assert (not b!41796))

(assert (not start!8368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

