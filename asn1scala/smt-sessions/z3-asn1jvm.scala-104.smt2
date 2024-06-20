; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2668 () Bool)

(assert start!2668)

(declare-fun b!12670 () Bool)

(declare-fun e!7662 () Bool)

(declare-fun e!7663 () Bool)

(assert (=> b!12670 (= e!7662 e!7663)))

(declare-fun res!12076 () Bool)

(assert (=> b!12670 (=> (not res!12076) (not e!7663))))

(declare-datatypes ((array!683 0))(
  ( (array!684 (arr!725 (Array (_ BitVec 32) (_ BitVec 8))) (size!296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!552 0))(
  ( (BitStream!553 (buf!647 array!683) (currentByte!1731 (_ BitVec 32)) (currentBit!1726 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1075 0))(
  ( (Unit!1076) )
))
(declare-datatypes ((tuple2!1462 0))(
  ( (tuple2!1463 (_1!786 Unit!1075) (_2!786 BitStream!552)) )
))
(declare-fun lt!20544 () tuple2!1462)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12670 (= res!12076 (invariant!0 (currentBit!1726 (_2!786 lt!20544)) (currentByte!1731 (_2!786 lt!20544)) (size!296 (buf!647 (_2!786 lt!20544)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!683)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!552)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!552 array!683 (_ BitVec 64) (_ BitVec 64)) tuple2!1462)

(assert (=> b!12670 (= lt!20544 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12671 () Bool)

(declare-fun e!7667 () Bool)

(assert (=> b!12671 (= e!7667 true)))

(declare-datatypes ((tuple2!1464 0))(
  ( (tuple2!1465 (_1!787 array!683) (_2!787 BitStream!552)) )
))
(declare-fun lt!20542 () tuple2!1464)

(declare-fun lt!20541 () Unit!1075)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!552 array!683 array!683 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1075)

(assert (=> b!12671 (= lt!20541 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!786 lt!20544) srcBuffer!6 (_1!787 lt!20542) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12672 () Bool)

(declare-fun res!12078 () Bool)

(assert (=> b!12672 (=> res!12078 e!7667)))

(declare-datatypes ((List!172 0))(
  ( (Nil!169) (Cons!168 (h!287 Bool) (t!922 List!172)) )
))
(declare-fun lt!20546 () List!172)

(declare-fun byteArrayBitContentToList!0 (BitStream!552 array!683 (_ BitVec 64) (_ BitVec 64)) List!172)

(assert (=> b!12672 (= res!12078 (not (= lt!20546 (byteArrayBitContentToList!0 (_2!786 lt!20544) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12673 () Bool)

(declare-fun e!7664 () Bool)

(declare-fun array_inv!285 (array!683) Bool)

(assert (=> b!12673 (= e!7664 (array_inv!285 (buf!647 thiss!1486)))))

(declare-fun b!12674 () Bool)

(declare-fun res!12079 () Bool)

(assert (=> b!12674 (=> (not res!12079) (not e!7663))))

(assert (=> b!12674 (= res!12079 (= (size!296 (buf!647 thiss!1486)) (size!296 (buf!647 (_2!786 lt!20544)))))))

(declare-fun b!12675 () Bool)

(declare-fun res!12074 () Bool)

(assert (=> b!12675 (=> (not res!12074) (not e!7662))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12675 (= res!12074 (validate_offset_bits!1 ((_ sign_extend 32) (size!296 (buf!647 thiss!1486))) ((_ sign_extend 32) (currentByte!1731 thiss!1486)) ((_ sign_extend 32) (currentBit!1726 thiss!1486)) nBits!460))))

(declare-fun b!12676 () Bool)

(declare-fun res!12077 () Bool)

(assert (=> b!12676 (=> (not res!12077) (not e!7663))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12676 (= res!12077 (= (bitIndex!0 (size!296 (buf!647 (_2!786 lt!20544))) (currentByte!1731 (_2!786 lt!20544)) (currentBit!1726 (_2!786 lt!20544))) (bvadd (bitIndex!0 (size!296 (buf!647 thiss!1486)) (currentByte!1731 thiss!1486) (currentBit!1726 thiss!1486)) nBits!460)))))

(declare-fun res!12075 () Bool)

(assert (=> start!2668 (=> (not res!12075) (not e!7662))))

(assert (=> start!2668 (= res!12075 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!296 srcBuffer!6))))))))

(assert (=> start!2668 e!7662))

(assert (=> start!2668 true))

(assert (=> start!2668 (array_inv!285 srcBuffer!6)))

(declare-fun inv!12 (BitStream!552) Bool)

(assert (=> start!2668 (and (inv!12 thiss!1486) e!7664)))

(declare-fun b!12677 () Bool)

(assert (=> b!12677 (= e!7663 (not e!7667))))

(declare-fun res!12073 () Bool)

(assert (=> b!12677 (=> res!12073 e!7667)))

(assert (=> b!12677 (= res!12073 (not (= (byteArrayBitContentToList!0 (_2!786 lt!20544) (_1!787 lt!20542) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20546)))))

(declare-datatypes ((tuple2!1466 0))(
  ( (tuple2!1467 (_1!788 BitStream!552) (_2!788 BitStream!552)) )
))
(declare-fun lt!20543 () tuple2!1466)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!552 BitStream!552 (_ BitVec 64)) List!172)

(assert (=> b!12677 (= lt!20546 (bitStreamReadBitsIntoList!0 (_2!786 lt!20544) (_1!788 lt!20543) nBits!460))))

(declare-fun readBits!0 (BitStream!552 (_ BitVec 64)) tuple2!1464)

(assert (=> b!12677 (= lt!20542 (readBits!0 (_1!788 lt!20543) nBits!460))))

(assert (=> b!12677 (validate_offset_bits!1 ((_ sign_extend 32) (size!296 (buf!647 (_2!786 lt!20544)))) ((_ sign_extend 32) (currentByte!1731 thiss!1486)) ((_ sign_extend 32) (currentBit!1726 thiss!1486)) nBits!460)))

(declare-fun lt!20545 () Unit!1075)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!552 array!683 (_ BitVec 64)) Unit!1075)

(assert (=> b!12677 (= lt!20545 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!647 (_2!786 lt!20544)) nBits!460))))

(declare-fun reader!0 (BitStream!552 BitStream!552) tuple2!1466)

(assert (=> b!12677 (= lt!20543 (reader!0 thiss!1486 (_2!786 lt!20544)))))

(declare-fun b!12678 () Bool)

(declare-fun res!12072 () Bool)

(assert (=> b!12678 (=> (not res!12072) (not e!7663))))

(declare-fun isPrefixOf!0 (BitStream!552 BitStream!552) Bool)

(assert (=> b!12678 (= res!12072 (isPrefixOf!0 thiss!1486 (_2!786 lt!20544)))))

(assert (= (and start!2668 res!12075) b!12675))

(assert (= (and b!12675 res!12074) b!12670))

(assert (= (and b!12670 res!12076) b!12674))

(assert (= (and b!12674 res!12079) b!12676))

(assert (= (and b!12676 res!12077) b!12678))

(assert (= (and b!12678 res!12072) b!12677))

(assert (= (and b!12677 (not res!12073)) b!12672))

(assert (= (and b!12672 (not res!12078)) b!12671))

(assert (= start!2668 b!12673))

(declare-fun m!19185 () Bool)

(assert (=> b!12675 m!19185))

(declare-fun m!19187 () Bool)

(assert (=> b!12671 m!19187))

(declare-fun m!19189 () Bool)

(assert (=> b!12677 m!19189))

(declare-fun m!19191 () Bool)

(assert (=> b!12677 m!19191))

(declare-fun m!19193 () Bool)

(assert (=> b!12677 m!19193))

(declare-fun m!19195 () Bool)

(assert (=> b!12677 m!19195))

(declare-fun m!19197 () Bool)

(assert (=> b!12677 m!19197))

(declare-fun m!19199 () Bool)

(assert (=> b!12677 m!19199))

(declare-fun m!19201 () Bool)

(assert (=> b!12672 m!19201))

(declare-fun m!19203 () Bool)

(assert (=> b!12673 m!19203))

(declare-fun m!19205 () Bool)

(assert (=> start!2668 m!19205))

(declare-fun m!19207 () Bool)

(assert (=> start!2668 m!19207))

(declare-fun m!19209 () Bool)

(assert (=> b!12678 m!19209))

(declare-fun m!19211 () Bool)

(assert (=> b!12670 m!19211))

(declare-fun m!19213 () Bool)

(assert (=> b!12670 m!19213))

(declare-fun m!19215 () Bool)

(assert (=> b!12676 m!19215))

(declare-fun m!19217 () Bool)

(assert (=> b!12676 m!19217))

(check-sat (not b!12675) (not b!12678) (not b!12671) (not start!2668) (not b!12670) (not b!12676) (not b!12672) (not b!12673) (not b!12677))
