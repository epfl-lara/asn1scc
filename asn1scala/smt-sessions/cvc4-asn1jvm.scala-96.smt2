; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2256 () Bool)

(assert start!2256)

(declare-fun b!10545 () Bool)

(declare-fun res!10507 () Bool)

(declare-fun e!6454 () Bool)

(assert (=> b!10545 (=> (not res!10507) (not e!6454))))

(declare-datatypes ((array!628 0))(
  ( (array!629 (arr!687 (Array (_ BitVec 32) (_ BitVec 8))) (size!270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!506 0))(
  ( (BitStream!507 (buf!612 array!628) (currentByte!1678 (_ BitVec 32)) (currentBit!1673 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!912 0))(
  ( (Unit!913) )
))
(declare-datatypes ((tuple2!1290 0))(
  ( (tuple2!1291 (_1!688 Unit!912) (_2!688 BitStream!506)) )
))
(declare-fun lt!16630 () tuple2!1290)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!506)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10545 (= res!10507 (= (bitIndex!0 (size!270 (buf!612 (_2!688 lt!16630))) (currentByte!1678 (_2!688 lt!16630)) (currentBit!1673 (_2!688 lt!16630))) (bvadd (bitIndex!0 (size!270 (buf!612 thiss!1486)) (currentByte!1678 thiss!1486) (currentBit!1673 thiss!1486)) nBits!460)))))

(declare-fun b!10546 () Bool)

(declare-fun res!10508 () Bool)

(assert (=> b!10546 (=> (not res!10508) (not e!6454))))

(declare-fun isPrefixOf!0 (BitStream!506 BitStream!506) Bool)

(assert (=> b!10546 (= res!10508 (isPrefixOf!0 thiss!1486 (_2!688 lt!16630)))))

(declare-fun b!10547 () Bool)

(declare-fun e!6456 () Bool)

(declare-fun array_inv!262 (array!628) Bool)

(assert (=> b!10547 (= e!6456 (array_inv!262 (buf!612 thiss!1486)))))

(declare-fun b!10548 () Bool)

(declare-fun e!6455 () Bool)

(assert (=> b!10548 (= e!6455 e!6454)))

(declare-fun res!10506 () Bool)

(assert (=> b!10548 (=> (not res!10506) (not e!6454))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10548 (= res!10506 (invariant!0 (currentBit!1673 (_2!688 lt!16630)) (currentByte!1678 (_2!688 lt!16630)) (size!270 (buf!612 (_2!688 lt!16630)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!628)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!506 array!628 (_ BitVec 64) (_ BitVec 64)) tuple2!1290)

(assert (=> b!10548 (= lt!16630 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10549 () Bool)

(declare-fun res!10510 () Bool)

(assert (=> b!10549 (=> (not res!10510) (not e!6454))))

(assert (=> b!10549 (= res!10510 (= (size!270 (buf!612 thiss!1486)) (size!270 (buf!612 (_2!688 lt!16630)))))))

(declare-fun res!10505 () Bool)

(assert (=> start!2256 (=> (not res!10505) (not e!6455))))

(assert (=> start!2256 (= res!10505 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!270 srcBuffer!6))))))))

(assert (=> start!2256 e!6455))

(assert (=> start!2256 true))

(assert (=> start!2256 (array_inv!262 srcBuffer!6)))

(declare-fun inv!12 (BitStream!506) Bool)

(assert (=> start!2256 (and (inv!12 thiss!1486) e!6456)))

(declare-fun b!10550 () Bool)

(assert (=> b!10550 (= e!6454 false)))

(declare-datatypes ((tuple2!1292 0))(
  ( (tuple2!1293 (_1!689 BitStream!506) (_2!689 BitStream!506)) )
))
(declare-fun lt!16631 () tuple2!1292)

(declare-fun reader!0 (BitStream!506 BitStream!506) tuple2!1292)

(assert (=> b!10550 (= lt!16631 (reader!0 thiss!1486 (_2!688 lt!16630)))))

(declare-fun b!10551 () Bool)

(declare-fun res!10509 () Bool)

(assert (=> b!10551 (=> (not res!10509) (not e!6455))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10551 (= res!10509 (validate_offset_bits!1 ((_ sign_extend 32) (size!270 (buf!612 thiss!1486))) ((_ sign_extend 32) (currentByte!1678 thiss!1486)) ((_ sign_extend 32) (currentBit!1673 thiss!1486)) nBits!460))))

(assert (= (and start!2256 res!10505) b!10551))

(assert (= (and b!10551 res!10509) b!10548))

(assert (= (and b!10548 res!10506) b!10549))

(assert (= (and b!10549 res!10510) b!10545))

(assert (= (and b!10545 res!10507) b!10546))

(assert (= (and b!10546 res!10508) b!10550))

(assert (= start!2256 b!10547))

(declare-fun m!15453 () Bool)

(assert (=> b!10550 m!15453))

(declare-fun m!15455 () Bool)

(assert (=> b!10546 m!15455))

(declare-fun m!15457 () Bool)

(assert (=> b!10548 m!15457))

(declare-fun m!15459 () Bool)

(assert (=> b!10548 m!15459))

(declare-fun m!15461 () Bool)

(assert (=> b!10547 m!15461))

(declare-fun m!15463 () Bool)

(assert (=> start!2256 m!15463))

(declare-fun m!15465 () Bool)

(assert (=> start!2256 m!15465))

(declare-fun m!15467 () Bool)

(assert (=> b!10551 m!15467))

(declare-fun m!15469 () Bool)

(assert (=> b!10545 m!15469))

(declare-fun m!15471 () Bool)

(assert (=> b!10545 m!15471))

(push 1)

