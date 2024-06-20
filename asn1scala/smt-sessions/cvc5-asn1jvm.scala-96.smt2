; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2252 () Bool)

(assert start!2252)

(declare-fun b!10503 () Bool)

(declare-fun res!10470 () Bool)

(declare-fun e!6428 () Bool)

(assert (=> b!10503 (=> (not res!10470) (not e!6428))))

(declare-datatypes ((array!624 0))(
  ( (array!625 (arr!685 (Array (_ BitVec 32) (_ BitVec 8))) (size!268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!502 0))(
  ( (BitStream!503 (buf!610 array!624) (currentByte!1676 (_ BitVec 32)) (currentBit!1671 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!502)

(declare-datatypes ((Unit!908 0))(
  ( (Unit!909) )
))
(declare-datatypes ((tuple2!1282 0))(
  ( (tuple2!1283 (_1!684 Unit!908) (_2!684 BitStream!502)) )
))
(declare-fun lt!16619 () tuple2!1282)

(declare-fun isPrefixOf!0 (BitStream!502 BitStream!502) Bool)

(assert (=> b!10503 (= res!10470 (isPrefixOf!0 thiss!1486 (_2!684 lt!16619)))))

(declare-fun res!10469 () Bool)

(declare-fun e!6425 () Bool)

(assert (=> start!2252 (=> (not res!10469) (not e!6425))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!624)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2252 (= res!10469 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!268 srcBuffer!6))))))))

(assert (=> start!2252 e!6425))

(assert (=> start!2252 true))

(declare-fun array_inv!260 (array!624) Bool)

(assert (=> start!2252 (array_inv!260 srcBuffer!6)))

(declare-fun e!6424 () Bool)

(declare-fun inv!12 (BitStream!502) Bool)

(assert (=> start!2252 (and (inv!12 thiss!1486) e!6424)))

(declare-fun b!10504 () Bool)

(declare-fun res!10472 () Bool)

(assert (=> b!10504 (=> (not res!10472) (not e!6428))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10504 (= res!10472 (= (bitIndex!0 (size!268 (buf!610 (_2!684 lt!16619))) (currentByte!1676 (_2!684 lt!16619)) (currentBit!1671 (_2!684 lt!16619))) (bvadd (bitIndex!0 (size!268 (buf!610 thiss!1486)) (currentByte!1676 thiss!1486) (currentBit!1671 thiss!1486)) nBits!460)))))

(declare-fun b!10505 () Bool)

(declare-fun res!10471 () Bool)

(assert (=> b!10505 (=> (not res!10471) (not e!6428))))

(assert (=> b!10505 (= res!10471 (= (size!268 (buf!610 thiss!1486)) (size!268 (buf!610 (_2!684 lt!16619)))))))

(declare-fun b!10506 () Bool)

(assert (=> b!10506 (= e!6424 (array_inv!260 (buf!610 thiss!1486)))))

(declare-fun b!10507 () Bool)

(assert (=> b!10507 (= e!6425 e!6428)))

(declare-fun res!10473 () Bool)

(assert (=> b!10507 (=> (not res!10473) (not e!6428))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10507 (= res!10473 (invariant!0 (currentBit!1671 (_2!684 lt!16619)) (currentByte!1676 (_2!684 lt!16619)) (size!268 (buf!610 (_2!684 lt!16619)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!502 array!624 (_ BitVec 64) (_ BitVec 64)) tuple2!1282)

(assert (=> b!10507 (= lt!16619 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10508 () Bool)

(declare-fun res!10474 () Bool)

(assert (=> b!10508 (=> (not res!10474) (not e!6425))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10508 (= res!10474 (validate_offset_bits!1 ((_ sign_extend 32) (size!268 (buf!610 thiss!1486))) ((_ sign_extend 32) (currentByte!1676 thiss!1486)) ((_ sign_extend 32) (currentBit!1671 thiss!1486)) nBits!460))))

(declare-fun b!10509 () Bool)

(assert (=> b!10509 (= e!6428 false)))

(declare-datatypes ((tuple2!1284 0))(
  ( (tuple2!1285 (_1!685 BitStream!502) (_2!685 BitStream!502)) )
))
(declare-fun lt!16618 () tuple2!1284)

(declare-fun reader!0 (BitStream!502 BitStream!502) tuple2!1284)

(assert (=> b!10509 (= lt!16618 (reader!0 thiss!1486 (_2!684 lt!16619)))))

(assert (= (and start!2252 res!10469) b!10508))

(assert (= (and b!10508 res!10474) b!10507))

(assert (= (and b!10507 res!10473) b!10505))

(assert (= (and b!10505 res!10471) b!10504))

(assert (= (and b!10504 res!10472) b!10503))

(assert (= (and b!10503 res!10470) b!10509))

(assert (= start!2252 b!10506))

(declare-fun m!15413 () Bool)

(assert (=> b!10508 m!15413))

(declare-fun m!15415 () Bool)

(assert (=> b!10507 m!15415))

(declare-fun m!15417 () Bool)

(assert (=> b!10507 m!15417))

(declare-fun m!15419 () Bool)

(assert (=> b!10504 m!15419))

(declare-fun m!15421 () Bool)

(assert (=> b!10504 m!15421))

(declare-fun m!15423 () Bool)

(assert (=> start!2252 m!15423))

(declare-fun m!15425 () Bool)

(assert (=> start!2252 m!15425))

(declare-fun m!15427 () Bool)

(assert (=> b!10509 m!15427))

(declare-fun m!15429 () Bool)

(assert (=> b!10506 m!15429))

(declare-fun m!15431 () Bool)

(assert (=> b!10503 m!15431))

(push 1)

(assert (not b!10508))

(assert (not b!10507))

(assert (not b!10504))

(assert (not b!10503))

(assert (not b!10509))

(assert (not start!2252))

(assert (not b!10506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

