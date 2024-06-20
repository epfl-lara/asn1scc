; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27424 () Bool)

(assert start!27424)

(declare-fun b!140740 () Bool)

(declare-fun res!117358 () Bool)

(declare-fun e!93767 () Bool)

(assert (=> b!140740 (=> (not res!117358) (not e!93767))))

(declare-datatypes ((array!6439 0))(
  ( (array!6440 (arr!3620 (Array (_ BitVec 32) (_ BitVec 8))) (size!2913 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5084 0))(
  ( (BitStream!5085 (buf!3334 array!6439) (currentByte!6194 (_ BitVec 32)) (currentBit!6189 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5084)

(declare-datatypes ((Unit!8808 0))(
  ( (Unit!8809) )
))
(declare-datatypes ((tuple2!12358 0))(
  ( (tuple2!12359 (_1!6509 Unit!8808) (_2!6509 BitStream!5084)) )
))
(declare-fun lt!219113 () tuple2!12358)

(declare-fun isPrefixOf!0 (BitStream!5084 BitStream!5084) Bool)

(assert (=> b!140740 (= res!117358 (isPrefixOf!0 thiss!1634 (_2!6509 lt!219113)))))

(declare-fun arr!237 () array!6439)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12360 0))(
  ( (tuple2!12361 (_1!6510 BitStream!5084) (_2!6510 (_ BitVec 8))) )
))
(declare-fun lt!219112 () tuple2!12360)

(declare-fun b!140741 () Bool)

(declare-datatypes ((tuple2!12362 0))(
  ( (tuple2!12363 (_1!6511 BitStream!5084) (_2!6511 BitStream!5084)) )
))
(declare-fun lt!219111 () tuple2!12362)

(assert (=> b!140741 (= e!93767 (and (= (_2!6510 lt!219112) (select (arr!3620 arr!237) from!447)) (= (_1!6510 lt!219112) (_2!6511 lt!219111))))))

(declare-fun readBytePure!0 (BitStream!5084) tuple2!12360)

(assert (=> b!140741 (= lt!219112 (readBytePure!0 (_1!6511 lt!219111)))))

(declare-fun reader!0 (BitStream!5084 BitStream!5084) tuple2!12362)

(assert (=> b!140741 (= lt!219111 (reader!0 thiss!1634 (_2!6509 lt!219113)))))

(declare-fun res!117356 () Bool)

(declare-fun e!93770 () Bool)

(assert (=> start!27424 (=> (not res!117356) (not e!93770))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!27424 (= res!117356 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2913 arr!237))))))

(assert (=> start!27424 e!93770))

(assert (=> start!27424 true))

(declare-fun array_inv!2702 (array!6439) Bool)

(assert (=> start!27424 (array_inv!2702 arr!237)))

(declare-fun e!93769 () Bool)

(declare-fun inv!12 (BitStream!5084) Bool)

(assert (=> start!27424 (and (inv!12 thiss!1634) e!93769)))

(declare-fun b!140742 () Bool)

(declare-fun res!117353 () Bool)

(assert (=> b!140742 (=> (not res!117353) (not e!93767))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140742 (= res!117353 (= (bitIndex!0 (size!2913 (buf!3334 (_2!6509 lt!219113))) (currentByte!6194 (_2!6509 lt!219113)) (currentBit!6189 (_2!6509 lt!219113))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2913 (buf!3334 thiss!1634)) (currentByte!6194 thiss!1634) (currentBit!6189 thiss!1634)))))))

(declare-fun b!140743 () Bool)

(declare-fun res!117352 () Bool)

(assert (=> b!140743 (=> (not res!117352) (not e!93770))))

(assert (=> b!140743 (= res!117352 (bvslt from!447 to!404))))

(declare-fun b!140744 () Bool)

(declare-fun res!117357 () Bool)

(assert (=> b!140744 (=> (not res!117357) (not e!93770))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140744 (= res!117357 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2913 (buf!3334 thiss!1634))) ((_ sign_extend 32) (currentByte!6194 thiss!1634)) ((_ sign_extend 32) (currentBit!6189 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140745 () Bool)

(declare-fun res!117354 () Bool)

(assert (=> b!140745 (=> (not res!117354) (not e!93770))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140745 (= res!117354 (invariant!0 (currentBit!6189 thiss!1634) (currentByte!6194 thiss!1634) (size!2913 (buf!3334 thiss!1634))))))

(declare-fun b!140746 () Bool)

(assert (=> b!140746 (= e!93770 (not true))))

(declare-fun lt!219110 () (_ BitVec 64))

(assert (=> b!140746 (= lt!219110 (bitIndex!0 (size!2913 (buf!3334 (_2!6509 lt!219113))) (currentByte!6194 (_2!6509 lt!219113)) (currentBit!6189 (_2!6509 lt!219113))))))

(assert (=> b!140746 e!93767))

(declare-fun res!117355 () Bool)

(assert (=> b!140746 (=> (not res!117355) (not e!93767))))

(assert (=> b!140746 (= res!117355 (= (size!2913 (buf!3334 thiss!1634)) (size!2913 (buf!3334 (_2!6509 lt!219113)))))))

(declare-fun appendByte!0 (BitStream!5084 (_ BitVec 8)) tuple2!12358)

(assert (=> b!140746 (= lt!219113 (appendByte!0 thiss!1634 (select (arr!3620 arr!237) from!447)))))

(declare-fun b!140747 () Bool)

(assert (=> b!140747 (= e!93769 (array_inv!2702 (buf!3334 thiss!1634)))))

(assert (= (and start!27424 res!117356) b!140744))

(assert (= (and b!140744 res!117357) b!140743))

(assert (= (and b!140743 res!117352) b!140745))

(assert (= (and b!140745 res!117354) b!140746))

(assert (= (and b!140746 res!117355) b!140742))

(assert (= (and b!140742 res!117353) b!140740))

(assert (= (and b!140740 res!117358) b!140741))

(assert (= start!27424 b!140747))

(declare-fun m!216557 () Bool)

(assert (=> b!140745 m!216557))

(declare-fun m!216559 () Bool)

(assert (=> b!140740 m!216559))

(declare-fun m!216561 () Bool)

(assert (=> b!140746 m!216561))

(declare-fun m!216563 () Bool)

(assert (=> b!140746 m!216563))

(assert (=> b!140746 m!216563))

(declare-fun m!216565 () Bool)

(assert (=> b!140746 m!216565))

(assert (=> b!140741 m!216563))

(declare-fun m!216567 () Bool)

(assert (=> b!140741 m!216567))

(declare-fun m!216569 () Bool)

(assert (=> b!140741 m!216569))

(declare-fun m!216571 () Bool)

(assert (=> start!27424 m!216571))

(declare-fun m!216573 () Bool)

(assert (=> start!27424 m!216573))

(declare-fun m!216575 () Bool)

(assert (=> b!140744 m!216575))

(assert (=> b!140742 m!216561))

(declare-fun m!216577 () Bool)

(assert (=> b!140742 m!216577))

(declare-fun m!216579 () Bool)

(assert (=> b!140747 m!216579))

(push 1)

(assert (not b!140747))

(assert (not b!140746))

(assert (not b!140740))

(assert (not b!140744))

(assert (not b!140741))

(assert (not b!140745))

