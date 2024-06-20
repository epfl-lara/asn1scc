; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!664 () Bool)

(assert start!664)

(declare-fun res!3772 () Bool)

(declare-fun e!1400 () Bool)

(assert (=> start!664 (=> (not res!3772) (not e!1400))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!188 0))(
  ( (array!189 (arr!461 (Array (_ BitVec 32) (_ BitVec 8))) (size!74 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!188)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!664 (= res!3772 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!74 srcBuffer!6))))))))

(assert (=> start!664 e!1400))

(assert (=> start!664 true))

(declare-fun array_inv!69 (array!188) Bool)

(assert (=> start!664 (array_inv!69 srcBuffer!6)))

(declare-datatypes ((BitStream!126 0))(
  ( (BitStream!127 (buf!383 array!188) (currentByte!1332 (_ BitVec 32)) (currentBit!1327 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!126)

(declare-fun e!1398 () Bool)

(declare-fun inv!12 (BitStream!126) Bool)

(assert (=> start!664 (and (inv!12 thiss!1486) e!1398)))

(declare-fun b!1978 () Bool)

(declare-fun res!3771 () Bool)

(assert (=> b!1978 (=> (not res!3771) (not e!1400))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1978 (= res!3771 (validate_offset_bits!1 ((_ sign_extend 32) (size!74 (buf!383 thiss!1486))) ((_ sign_extend 32) (currentByte!1332 thiss!1486)) ((_ sign_extend 32) (currentBit!1327 thiss!1486)) nBits!460))))

(declare-fun b!1979 () Bool)

(assert (=> b!1979 (= e!1400 false)))

(declare-datatypes ((Unit!81 0))(
  ( (Unit!82) )
))
(declare-datatypes ((tuple2!120 0))(
  ( (tuple2!121 (_1!67 Unit!81) (_2!67 BitStream!126)) )
))
(declare-fun lt!1319 () tuple2!120)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!126 array!188 (_ BitVec 64) (_ BitVec 64)) tuple2!120)

(assert (=> b!1979 (= lt!1319 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!1980 () Bool)

(assert (=> b!1980 (= e!1398 (array_inv!69 (buf!383 thiss!1486)))))

(assert (= (and start!664 res!3772) b!1978))

(assert (= (and b!1978 res!3771) b!1979))

(assert (= start!664 b!1980))

(declare-fun m!1417 () Bool)

(assert (=> start!664 m!1417))

(declare-fun m!1419 () Bool)

(assert (=> start!664 m!1419))

(declare-fun m!1421 () Bool)

(assert (=> b!1978 m!1421))

(declare-fun m!1423 () Bool)

(assert (=> b!1979 m!1423))

(declare-fun m!1425 () Bool)

(assert (=> b!1980 m!1425))

(check-sat (not b!1980) (not start!664) (not b!1978) (not b!1979))
