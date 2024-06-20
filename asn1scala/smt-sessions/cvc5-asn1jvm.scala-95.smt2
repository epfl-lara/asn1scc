; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2246 () Bool)

(assert start!2246)

(declare-fun res!10418 () Bool)

(declare-fun e!6380 () Bool)

(assert (=> start!2246 (=> (not res!10418) (not e!6380))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!618 0))(
  ( (array!619 (arr!682 (Array (_ BitVec 32) (_ BitVec 8))) (size!265 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!618)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2246 (= res!10418 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!265 srcBuffer!6))))))))

(assert (=> start!2246 e!6380))

(assert (=> start!2246 true))

(declare-fun array_inv!257 (array!618) Bool)

(assert (=> start!2246 (array_inv!257 srcBuffer!6)))

(declare-datatypes ((BitStream!496 0))(
  ( (BitStream!497 (buf!607 array!618) (currentByte!1673 (_ BitVec 32)) (currentBit!1668 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!496)

(declare-fun e!6379 () Bool)

(declare-fun inv!12 (BitStream!496) Bool)

(assert (=> start!2246 (and (inv!12 thiss!1486) e!6379)))

(declare-fun b!10440 () Bool)

(assert (=> b!10440 (= e!6379 (array_inv!257 (buf!607 thiss!1486)))))

(declare-fun b!10441 () Bool)

(declare-fun res!10417 () Bool)

(declare-fun e!6382 () Bool)

(assert (=> b!10441 (=> (not res!10417) (not e!6382))))

(declare-datatypes ((Unit!902 0))(
  ( (Unit!903) )
))
(declare-datatypes ((tuple2!1270 0))(
  ( (tuple2!1271 (_1!678 Unit!902) (_2!678 BitStream!496)) )
))
(declare-fun lt!16601 () tuple2!1270)

(declare-fun isPrefixOf!0 (BitStream!496 BitStream!496) Bool)

(assert (=> b!10441 (= res!10417 (isPrefixOf!0 thiss!1486 (_2!678 lt!16601)))))

(declare-fun b!10442 () Bool)

(declare-fun res!10416 () Bool)

(assert (=> b!10442 (=> (not res!10416) (not e!6382))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10442 (= res!10416 (= (bitIndex!0 (size!265 (buf!607 (_2!678 lt!16601))) (currentByte!1673 (_2!678 lt!16601)) (currentBit!1668 (_2!678 lt!16601))) (bvadd (bitIndex!0 (size!265 (buf!607 thiss!1486)) (currentByte!1673 thiss!1486) (currentBit!1668 thiss!1486)) nBits!460)))))

(declare-fun b!10443 () Bool)

(assert (=> b!10443 (= e!6382 false)))

(declare-datatypes ((tuple2!1272 0))(
  ( (tuple2!1273 (_1!679 BitStream!496) (_2!679 BitStream!496)) )
))
(declare-fun lt!16600 () tuple2!1272)

(declare-fun reader!0 (BitStream!496 BitStream!496) tuple2!1272)

(assert (=> b!10443 (= lt!16600 (reader!0 thiss!1486 (_2!678 lt!16601)))))

(declare-fun b!10444 () Bool)

(declare-fun res!10420 () Bool)

(assert (=> b!10444 (=> (not res!10420) (not e!6380))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10444 (= res!10420 (validate_offset_bits!1 ((_ sign_extend 32) (size!265 (buf!607 thiss!1486))) ((_ sign_extend 32) (currentByte!1673 thiss!1486)) ((_ sign_extend 32) (currentBit!1668 thiss!1486)) nBits!460))))

(declare-fun b!10445 () Bool)

(declare-fun res!10415 () Bool)

(assert (=> b!10445 (=> (not res!10415) (not e!6382))))

(assert (=> b!10445 (= res!10415 (= (size!265 (buf!607 thiss!1486)) (size!265 (buf!607 (_2!678 lt!16601)))))))

(declare-fun b!10446 () Bool)

(assert (=> b!10446 (= e!6380 e!6382)))

(declare-fun res!10419 () Bool)

(assert (=> b!10446 (=> (not res!10419) (not e!6382))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10446 (= res!10419 (invariant!0 (currentBit!1668 (_2!678 lt!16601)) (currentByte!1673 (_2!678 lt!16601)) (size!265 (buf!607 (_2!678 lt!16601)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!496 array!618 (_ BitVec 64) (_ BitVec 64)) tuple2!1270)

(assert (=> b!10446 (= lt!16601 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2246 res!10418) b!10444))

(assert (= (and b!10444 res!10420) b!10446))

(assert (= (and b!10446 res!10419) b!10445))

(assert (= (and b!10445 res!10415) b!10442))

(assert (= (and b!10442 res!10416) b!10441))

(assert (= (and b!10441 res!10417) b!10443))

(assert (= start!2246 b!10440))

(declare-fun m!15353 () Bool)

(assert (=> b!10441 m!15353))

(declare-fun m!15355 () Bool)

(assert (=> b!10444 m!15355))

(declare-fun m!15357 () Bool)

(assert (=> b!10442 m!15357))

(declare-fun m!15359 () Bool)

(assert (=> b!10442 m!15359))

(declare-fun m!15361 () Bool)

(assert (=> b!10446 m!15361))

(declare-fun m!15363 () Bool)

(assert (=> b!10446 m!15363))

(declare-fun m!15365 () Bool)

(assert (=> b!10443 m!15365))

(declare-fun m!15367 () Bool)

(assert (=> b!10440 m!15367))

(declare-fun m!15369 () Bool)

(assert (=> start!2246 m!15369))

(declare-fun m!15371 () Bool)

(assert (=> start!2246 m!15371))

(push 1)

(assert (not b!10446))

(assert (not b!10440))

(assert (not b!10442))

(assert (not b!10443))

(assert (not b!10441))

(assert (not start!2246))

(assert (not b!10444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

