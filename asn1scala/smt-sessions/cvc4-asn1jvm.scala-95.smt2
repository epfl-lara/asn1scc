; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2250 () Bool)

(assert start!2250)

(declare-fun res!10455 () Bool)

(declare-fun e!6413 () Bool)

(assert (=> start!2250 (=> (not res!10455) (not e!6413))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!622 0))(
  ( (array!623 (arr!684 (Array (_ BitVec 32) (_ BitVec 8))) (size!267 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!622)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2250 (= res!10455 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!267 srcBuffer!6))))))))

(assert (=> start!2250 e!6413))

(assert (=> start!2250 true))

(declare-fun array_inv!259 (array!622) Bool)

(assert (=> start!2250 (array_inv!259 srcBuffer!6)))

(declare-datatypes ((BitStream!500 0))(
  ( (BitStream!501 (buf!609 array!622) (currentByte!1675 (_ BitVec 32)) (currentBit!1670 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!500)

(declare-fun e!6409 () Bool)

(declare-fun inv!12 (BitStream!500) Bool)

(assert (=> start!2250 (and (inv!12 thiss!1486) e!6409)))

(declare-fun b!10482 () Bool)

(declare-fun e!6412 () Bool)

(assert (=> b!10482 (= e!6413 e!6412)))

(declare-fun res!10456 () Bool)

(assert (=> b!10482 (=> (not res!10456) (not e!6412))))

(declare-datatypes ((Unit!906 0))(
  ( (Unit!907) )
))
(declare-datatypes ((tuple2!1278 0))(
  ( (tuple2!1279 (_1!682 Unit!906) (_2!682 BitStream!500)) )
))
(declare-fun lt!16612 () tuple2!1278)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10482 (= res!10456 (invariant!0 (currentBit!1670 (_2!682 lt!16612)) (currentByte!1675 (_2!682 lt!16612)) (size!267 (buf!609 (_2!682 lt!16612)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!500 array!622 (_ BitVec 64) (_ BitVec 64)) tuple2!1278)

(assert (=> b!10482 (= lt!16612 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10483 () Bool)

(assert (=> b!10483 (= e!6409 (array_inv!259 (buf!609 thiss!1486)))))

(declare-fun b!10484 () Bool)

(declare-fun res!10454 () Bool)

(assert (=> b!10484 (=> (not res!10454) (not e!6412))))

(declare-fun isPrefixOf!0 (BitStream!500 BitStream!500) Bool)

(assert (=> b!10484 (= res!10454 (isPrefixOf!0 thiss!1486 (_2!682 lt!16612)))))

(declare-fun b!10485 () Bool)

(declare-fun res!10452 () Bool)

(assert (=> b!10485 (=> (not res!10452) (not e!6412))))

(assert (=> b!10485 (= res!10452 (= (size!267 (buf!609 thiss!1486)) (size!267 (buf!609 (_2!682 lt!16612)))))))

(declare-fun b!10486 () Bool)

(declare-fun res!10453 () Bool)

(assert (=> b!10486 (=> (not res!10453) (not e!6412))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10486 (= res!10453 (= (bitIndex!0 (size!267 (buf!609 (_2!682 lt!16612))) (currentByte!1675 (_2!682 lt!16612)) (currentBit!1670 (_2!682 lt!16612))) (bvadd (bitIndex!0 (size!267 (buf!609 thiss!1486)) (currentByte!1675 thiss!1486) (currentBit!1670 thiss!1486)) nBits!460)))))

(declare-fun b!10487 () Bool)

(assert (=> b!10487 (= e!6412 false)))

(declare-datatypes ((tuple2!1280 0))(
  ( (tuple2!1281 (_1!683 BitStream!500) (_2!683 BitStream!500)) )
))
(declare-fun lt!16613 () tuple2!1280)

(declare-fun reader!0 (BitStream!500 BitStream!500) tuple2!1280)

(assert (=> b!10487 (= lt!16613 (reader!0 thiss!1486 (_2!682 lt!16612)))))

(declare-fun b!10488 () Bool)

(declare-fun res!10451 () Bool)

(assert (=> b!10488 (=> (not res!10451) (not e!6413))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10488 (= res!10451 (validate_offset_bits!1 ((_ sign_extend 32) (size!267 (buf!609 thiss!1486))) ((_ sign_extend 32) (currentByte!1675 thiss!1486)) ((_ sign_extend 32) (currentBit!1670 thiss!1486)) nBits!460))))

(assert (= (and start!2250 res!10455) b!10488))

(assert (= (and b!10488 res!10451) b!10482))

(assert (= (and b!10482 res!10456) b!10485))

(assert (= (and b!10485 res!10452) b!10486))

(assert (= (and b!10486 res!10453) b!10484))

(assert (= (and b!10484 res!10454) b!10487))

(assert (= start!2250 b!10483))

(declare-fun m!15393 () Bool)

(assert (=> b!10482 m!15393))

(declare-fun m!15395 () Bool)

(assert (=> b!10482 m!15395))

(declare-fun m!15397 () Bool)

(assert (=> b!10483 m!15397))

(declare-fun m!15399 () Bool)

(assert (=> b!10486 m!15399))

(declare-fun m!15401 () Bool)

(assert (=> b!10486 m!15401))

(declare-fun m!15403 () Bool)

(assert (=> b!10484 m!15403))

(declare-fun m!15405 () Bool)

(assert (=> b!10487 m!15405))

(declare-fun m!15407 () Bool)

(assert (=> b!10488 m!15407))

(declare-fun m!15409 () Bool)

(assert (=> start!2250 m!15409))

(declare-fun m!15411 () Bool)

(assert (=> start!2250 m!15411))

(push 1)

(assert (not b!10483))

(assert (not start!2250))

(assert (not b!10484))

(assert (not b!10487))

(assert (not b!10482))

(assert (not b!10488))

(assert (not b!10486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

