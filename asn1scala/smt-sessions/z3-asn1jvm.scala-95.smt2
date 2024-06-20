; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2248 () Bool)

(assert start!2248)

(declare-fun b!10461 () Bool)

(declare-fun e!6397 () Bool)

(declare-datatypes ((array!620 0))(
  ( (array!621 (arr!683 (Array (_ BitVec 32) (_ BitVec 8))) (size!266 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!498 0))(
  ( (BitStream!499 (buf!608 array!620) (currentByte!1674 (_ BitVec 32)) (currentBit!1669 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!498)

(declare-fun array_inv!258 (array!620) Bool)

(assert (=> b!10461 (= e!6397 (array_inv!258 (buf!608 thiss!1486)))))

(declare-fun b!10462 () Bool)

(declare-fun res!10434 () Bool)

(declare-fun e!6395 () Bool)

(assert (=> b!10462 (=> (not res!10434) (not e!6395))))

(declare-datatypes ((Unit!904 0))(
  ( (Unit!905) )
))
(declare-datatypes ((tuple2!1274 0))(
  ( (tuple2!1275 (_1!680 Unit!904) (_2!680 BitStream!498)) )
))
(declare-fun lt!16607 () tuple2!1274)

(declare-fun isPrefixOf!0 (BitStream!498 BitStream!498) Bool)

(assert (=> b!10462 (= res!10434 (isPrefixOf!0 thiss!1486 (_2!680 lt!16607)))))

(declare-fun b!10463 () Bool)

(declare-fun res!10437 () Bool)

(assert (=> b!10463 (=> (not res!10437) (not e!6395))))

(assert (=> b!10463 (= res!10437 (= (size!266 (buf!608 thiss!1486)) (size!266 (buf!608 (_2!680 lt!16607)))))))

(declare-fun b!10464 () Bool)

(declare-fun res!10436 () Bool)

(declare-fun e!6396 () Bool)

(assert (=> b!10464 (=> (not res!10436) (not e!6396))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10464 (= res!10436 (validate_offset_bits!1 ((_ sign_extend 32) (size!266 (buf!608 thiss!1486))) ((_ sign_extend 32) (currentByte!1674 thiss!1486)) ((_ sign_extend 32) (currentBit!1669 thiss!1486)) nBits!460))))

(declare-fun b!10465 () Bool)

(assert (=> b!10465 (= e!6395 false)))

(declare-datatypes ((tuple2!1276 0))(
  ( (tuple2!1277 (_1!681 BitStream!498) (_2!681 BitStream!498)) )
))
(declare-fun lt!16606 () tuple2!1276)

(declare-fun reader!0 (BitStream!498 BitStream!498) tuple2!1276)

(assert (=> b!10465 (= lt!16606 (reader!0 thiss!1486 (_2!680 lt!16607)))))

(declare-fun b!10466 () Bool)

(declare-fun res!10438 () Bool)

(assert (=> b!10466 (=> (not res!10438) (not e!6395))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10466 (= res!10438 (= (bitIndex!0 (size!266 (buf!608 (_2!680 lt!16607))) (currentByte!1674 (_2!680 lt!16607)) (currentBit!1669 (_2!680 lt!16607))) (bvadd (bitIndex!0 (size!266 (buf!608 thiss!1486)) (currentByte!1674 thiss!1486) (currentBit!1669 thiss!1486)) nBits!460)))))

(declare-fun b!10467 () Bool)

(assert (=> b!10467 (= e!6396 e!6395)))

(declare-fun res!10435 () Bool)

(assert (=> b!10467 (=> (not res!10435) (not e!6395))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10467 (= res!10435 (invariant!0 (currentBit!1669 (_2!680 lt!16607)) (currentByte!1674 (_2!680 lt!16607)) (size!266 (buf!608 (_2!680 lt!16607)))))))

(declare-fun srcBuffer!6 () array!620)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!498 array!620 (_ BitVec 64) (_ BitVec 64)) tuple2!1274)

(assert (=> b!10467 (= lt!16607 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!10433 () Bool)

(assert (=> start!2248 (=> (not res!10433) (not e!6396))))

(assert (=> start!2248 (= res!10433 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!266 srcBuffer!6))))))))

(assert (=> start!2248 e!6396))

(assert (=> start!2248 true))

(assert (=> start!2248 (array_inv!258 srcBuffer!6)))

(declare-fun inv!12 (BitStream!498) Bool)

(assert (=> start!2248 (and (inv!12 thiss!1486) e!6397)))

(assert (= (and start!2248 res!10433) b!10464))

(assert (= (and b!10464 res!10436) b!10467))

(assert (= (and b!10467 res!10435) b!10463))

(assert (= (and b!10463 res!10437) b!10466))

(assert (= (and b!10466 res!10438) b!10462))

(assert (= (and b!10462 res!10434) b!10465))

(assert (= start!2248 b!10461))

(declare-fun m!15373 () Bool)

(assert (=> b!10462 m!15373))

(declare-fun m!15375 () Bool)

(assert (=> b!10467 m!15375))

(declare-fun m!15377 () Bool)

(assert (=> b!10467 m!15377))

(declare-fun m!15379 () Bool)

(assert (=> b!10466 m!15379))

(declare-fun m!15381 () Bool)

(assert (=> b!10466 m!15381))

(declare-fun m!15383 () Bool)

(assert (=> b!10464 m!15383))

(declare-fun m!15385 () Bool)

(assert (=> b!10465 m!15385))

(declare-fun m!15387 () Bool)

(assert (=> b!10461 m!15387))

(declare-fun m!15389 () Bool)

(assert (=> start!2248 m!15389))

(declare-fun m!15391 () Bool)

(assert (=> start!2248 m!15391))

(check-sat (not start!2248) (not b!10466) (not b!10461) (not b!10464) (not b!10462) (not b!10467) (not b!10465))
