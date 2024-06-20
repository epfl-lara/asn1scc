; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!668 () Bool)

(assert start!668)

(declare-fun b!2000 () Bool)

(declare-fun e!1426 () Bool)

(declare-datatypes ((array!192 0))(
  ( (array!193 (arr!463 (Array (_ BitVec 32) (_ BitVec 8))) (size!76 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!130 0))(
  ( (BitStream!131 (buf!385 array!192) (currentByte!1334 (_ BitVec 32)) (currentBit!1329 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!130)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2000 (= e!1426 (not (invariant!0 (currentBit!1329 thiss!1486) (currentByte!1334 thiss!1486) (size!76 (buf!385 thiss!1486)))))))

(declare-fun b!2001 () Bool)

(declare-fun e!1424 () Bool)

(assert (=> b!2001 (= e!1424 e!1426)))

(declare-fun res!3789 () Bool)

(assert (=> b!2001 (=> (not res!3789) (not e!1426))))

(declare-datatypes ((Unit!85 0))(
  ( (Unit!86) )
))
(declare-datatypes ((tuple2!124 0))(
  ( (tuple2!125 (_1!69 Unit!85) (_2!69 BitStream!130)) )
))
(declare-fun lt!1325 () tuple2!124)

(assert (=> b!2001 (= res!3789 (invariant!0 (currentBit!1329 (_2!69 lt!1325)) (currentByte!1334 (_2!69 lt!1325)) (size!76 (buf!385 (_2!69 lt!1325)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!192)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!130 array!192 (_ BitVec 64) (_ BitVec 64)) tuple2!124)

(assert (=> b!2001 (= lt!1325 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2002 () Bool)

(declare-fun res!3790 () Bool)

(assert (=> b!2002 (=> (not res!3790) (not e!1424))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2002 (= res!3790 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 thiss!1486))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486)) nBits!460))))

(declare-fun b!2004 () Bool)

(declare-fun e!1423 () Bool)

(declare-fun array_inv!71 (array!192) Bool)

(assert (=> b!2004 (= e!1423 (array_inv!71 (buf!385 thiss!1486)))))

(declare-fun b!2003 () Bool)

(declare-fun res!3787 () Bool)

(assert (=> b!2003 (=> (not res!3787) (not e!1426))))

(assert (=> b!2003 (= res!3787 (= (size!76 (buf!385 thiss!1486)) (size!76 (buf!385 (_2!69 lt!1325)))))))

(declare-fun res!3788 () Bool)

(assert (=> start!668 (=> (not res!3788) (not e!1424))))

(assert (=> start!668 (= res!3788 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!76 srcBuffer!6))))))))

(assert (=> start!668 e!1424))

(assert (=> start!668 true))

(assert (=> start!668 (array_inv!71 srcBuffer!6)))

(declare-fun inv!12 (BitStream!130) Bool)

(assert (=> start!668 (and (inv!12 thiss!1486) e!1423)))

(assert (= (and start!668 res!3788) b!2002))

(assert (= (and b!2002 res!3790) b!2001))

(assert (= (and b!2001 res!3789) b!2003))

(assert (= (and b!2003 res!3787) b!2000))

(assert (= start!668 b!2004))

(declare-fun m!1437 () Bool)

(assert (=> start!668 m!1437))

(declare-fun m!1439 () Bool)

(assert (=> start!668 m!1439))

(declare-fun m!1441 () Bool)

(assert (=> b!2000 m!1441))

(declare-fun m!1443 () Bool)

(assert (=> b!2004 m!1443))

(declare-fun m!1445 () Bool)

(assert (=> b!2001 m!1445))

(declare-fun m!1447 () Bool)

(assert (=> b!2001 m!1447))

(declare-fun m!1449 () Bool)

(assert (=> b!2002 m!1449))

(push 1)

(assert (not b!2001))

(assert (not b!2002))

(assert (not b!2000))

(assert (not b!2004))

(assert (not start!668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1356 () Bool)

(assert (=> d!1356 (= (invariant!0 (currentBit!1329 thiss!1486) (currentByte!1334 thiss!1486) (size!76 (buf!385 thiss!1486))) (and (bvsge (currentBit!1329 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1329 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1334 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1334 thiss!1486) (size!76 (buf!385 thiss!1486))) (and (= (currentBit!1329 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1334 thiss!1486) (size!76 (buf!385 thiss!1486)))))))))

(assert (=> b!2000 d!1356))

(declare-fun d!1362 () Bool)

(assert (=> d!1362 (= (invariant!0 (currentBit!1329 (_2!69 lt!1325)) (currentByte!1334 (_2!69 lt!1325)) (size!76 (buf!385 (_2!69 lt!1325)))) (and (bvsge (currentBit!1329 (_2!69 lt!1325)) #b00000000000000000000000000000000) (bvslt (currentBit!1329 (_2!69 lt!1325)) #b00000000000000000000000000001000) (bvsge (currentByte!1334 (_2!69 lt!1325)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1334 (_2!69 lt!1325)) (size!76 (buf!385 (_2!69 lt!1325)))) (and (= (currentBit!1329 (_2!69 lt!1325)) #b00000000000000000000000000000000) (= (currentByte!1334 (_2!69 lt!1325)) (size!76 (buf!385 (_2!69 lt!1325))))))))))

(assert (=> b!2001 d!1362))

(declare-fun bm!8 () Bool)

(declare-datatypes ((tuple2!130 0))(
  ( (tuple2!131 (_1!72 BitStream!130) (_2!72 BitStream!130)) )
))
(declare-fun call!11 () tuple2!130)

(declare-fun c!97 () Bool)

(declare-fun lt!1713 () tuple2!124)

(declare-fun reader!0 (BitStream!130 BitStream!130) tuple2!130)

(assert (=> bm!8 (= call!11 (reader!0 thiss!1486 (ite c!97 (_2!69 lt!1713) thiss!1486)))))

(declare-fun b!2099 () Bool)

(declare-fun res!3865 () Bool)

(declare-fun e!1483 () Bool)

(assert (=> b!2099 (=> (not res!3865) (not e!1483))))

(declare-fun lt!1717 () tuple2!124)

(assert (=> b!2099 (= res!3865 (= (size!76 (buf!385 thiss!1486)) (size!76 (buf!385 (_2!69 lt!1717)))))))

(declare-fun b!2100 () Bool)

(declare-fun res!3860 () Bool)

(assert (=> b!2100 (=> (not res!3860) (not e!1483))))

(declare-fun isPrefixOf!0 (BitStream!130 BitStream!130) Bool)

(assert (=> b!2100 (= res!3860 (isPrefixOf!0 thiss!1486 (_2!69 lt!1717)))))

(declare-fun b!2101 () Bool)

(declare-fun e!1482 () tuple2!124)

(declare-fun lt!1705 () tuple2!124)

(declare-fun Unit!93 () Unit!85)

(assert (=> b!2101 (= e!1482 (tuple2!125 Unit!93 (_2!69 lt!1705)))))

(declare-fun appendBitFromByte!0 (BitStream!130 (_ BitVec 8) (_ BitVec 32)) tuple2!124)

(assert (=> b!2101 (= lt!1713 (appendBitFromByte!0 thiss!1486 (select (arr!463 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!1687 () (_ BitVec 64))

(assert (=> b!2101 (= lt!1687 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1683 () (_ BitVec 64))

(assert (=> b!2101 (= lt!1683 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!1665 () Unit!85)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!130 BitStream!130 (_ BitVec 64) (_ BitVec 64)) Unit!85)

(assert (=> b!2101 (= lt!1665 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!69 lt!1713) lt!1687 lt!1683))))

(assert (=> b!2101 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 (_2!69 lt!1713)))) ((_ sign_extend 32) (currentByte!1334 (_2!69 lt!1713))) ((_ sign_extend 32) (currentBit!1329 (_2!69 lt!1713))) (bvsub lt!1687 lt!1683))))

(declare-fun lt!1707 () Unit!85)

(assert (=> b!2101 (= lt!1707 lt!1665)))

(declare-fun lt!1672 () tuple2!130)

(assert (=> b!2101 (= lt!1672 call!11)))

(declare-fun lt!1671 () (_ BitVec 64))

(assert (=> b!2101 (= lt!1671 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!1691 () Unit!85)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!130 array!192 (_ BitVec 64)) Unit!85)

(assert (=> b!2101 (= lt!1691 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!385 (_2!69 lt!1713)) lt!1671))))

(assert (=> b!2101 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 (_2!69 lt!1713)))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486)) lt!1671)))

(declare-fun lt!1675 () Unit!85)

(assert (=> b!2101 (= lt!1675 lt!1691)))

(declare-datatypes ((List!6 0))(
  ( (Nil!3) (Cons!2 (h!121 Bool) (t!756 List!6)) )
))
(declare-fun head!6 (List!6) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!130 array!192 (_ BitVec 64) (_ BitVec 64)) List!6)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!130 BitStream!130 (_ BitVec 64)) List!6)

(assert (=> b!2101 (= (head!6 (byteArrayBitContentToList!0 (_2!69 lt!1713) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!6 (bitStreamReadBitsIntoList!0 (_2!69 lt!1713) (_1!72 lt!1672) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1689 () Unit!85)

(declare-fun Unit!96 () Unit!85)

(assert (=> b!2101 (= lt!1689 Unit!96)))

(assert (=> b!2101 (= lt!1705 (appendBitsMSBFirstLoop!0 (_2!69 lt!1713) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!1661 () Unit!85)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!130 BitStream!130 BitStream!130) Unit!85)

(assert (=> b!2101 (= lt!1661 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!69 lt!1713) (_2!69 lt!1705)))))

(assert (=> b!2101 (isPrefixOf!0 thiss!1486 (_2!69 lt!1705))))

(declare-fun lt!1726 () Unit!85)

(assert (=> b!2101 (= lt!1726 lt!1661)))

(assert (=> b!2101 (= (size!76 (buf!385 (_2!69 lt!1705))) (size!76 (buf!385 thiss!1486)))))

(declare-fun lt!1654 () Unit!85)

(declare-fun Unit!97 () Unit!85)

(assert (=> b!2101 (= lt!1654 Unit!97)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2101 (= (bitIndex!0 (size!76 (buf!385 (_2!69 lt!1705))) (currentByte!1334 (_2!69 lt!1705)) (currentBit!1329 (_2!69 lt!1705))) (bvsub (bvadd (bitIndex!0 (size!76 (buf!385 thiss!1486)) (currentByte!1334 thiss!1486) (currentBit!1329 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!1709 () Unit!85)

(declare-fun Unit!99 () Unit!85)

(assert (=> b!2101 (= lt!1709 Unit!99)))

(assert (=> b!2101 (= (bitIndex!0 (size!76 (buf!385 (_2!69 lt!1705))) (currentByte!1334 (_2!69 lt!1705)) (currentBit!1329 (_2!69 lt!1705))) (bvsub (bvsub (bvadd (bitIndex!0 (size!76 (buf!385 (_2!69 lt!1713))) (currentByte!1334 (_2!69 lt!1713)) (currentBit!1329 (_2!69 lt!1713))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!1724 () Unit!85)

(declare-fun Unit!101 () Unit!85)

(assert (=> b!2101 (= lt!1724 Unit!101)))

(declare-fun lt!1715 () tuple2!130)

(assert (=> b!2101 (= lt!1715 (reader!0 thiss!1486 (_2!69 lt!1705)))))

(declare-fun lt!1727 () (_ BitVec 64))

(assert (=> b!2101 (= lt!1727 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1721 () Unit!85)

(assert (=> b!2101 (= lt!1721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!385 (_2!69 lt!1705)) lt!1727))))

(assert (=> b!2101 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 (_2!69 lt!1705)))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486)) lt!1727)))

(declare-fun lt!1674 () Unit!85)

(assert (=> b!2101 (= lt!1674 lt!1721)))

(declare-fun lt!1722 () tuple2!130)

(assert (=> b!2101 (= lt!1722 (reader!0 (_2!69 lt!1713) (_2!69 lt!1705)))))

(declare-fun lt!1711 () (_ BitVec 64))

(assert (=> b!2101 (= lt!1711 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!1685 () Unit!85)

(assert (=> b!2101 (= lt!1685 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!69 lt!1713) (buf!385 (_2!69 lt!1705)) lt!1711))))

(assert (=> b!2101 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 (_2!69 lt!1705)))) ((_ sign_extend 32) (currentByte!1334 (_2!69 lt!1713))) ((_ sign_extend 32) (currentBit!1329 (_2!69 lt!1713))) lt!1711)))

(declare-fun lt!1669 () Unit!85)

(assert (=> b!2101 (= lt!1669 lt!1685)))

(declare-fun lt!1720 () List!6)

(assert (=> b!2101 (= lt!1720 (byteArrayBitContentToList!0 (_2!69 lt!1705) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!1663 () List!6)

(assert (=> b!2101 (= lt!1663 (byteArrayBitContentToList!0 (_2!69 lt!1705) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1652 () List!6)

(assert (=> b!2101 (= lt!1652 (bitStreamReadBitsIntoList!0 (_2!69 lt!1705) (_1!72 lt!1715) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!1723 () List!6)

(assert (=> b!2101 (= lt!1723 (bitStreamReadBitsIntoList!0 (_2!69 lt!1705) (_1!72 lt!1722) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1695 () (_ BitVec 64))

(assert (=> b!2101 (= lt!1695 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1703 () Unit!85)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!130 BitStream!130 BitStream!130 BitStream!130 (_ BitVec 64) List!6) Unit!85)

(assert (=> b!2101 (= lt!1703 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!69 lt!1705) (_2!69 lt!1705) (_1!72 lt!1715) (_1!72 lt!1722) lt!1695 lt!1652))))

(declare-fun tail!13 (List!6) List!6)

(assert (=> b!2101 (= (bitStreamReadBitsIntoList!0 (_2!69 lt!1705) (_1!72 lt!1722) (bvsub lt!1695 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!13 lt!1652))))

(declare-fun lt!1699 () Unit!85)

(assert (=> b!2101 (= lt!1699 lt!1703)))

(declare-fun lt!1681 () Unit!85)

(declare-fun lt!1677 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!192 array!192 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!85)

(assert (=> b!2101 (= lt!1681 (arrayBitRangesEqImpliesEq!0 (buf!385 (_2!69 lt!1713)) (buf!385 (_2!69 lt!1705)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!1677 (bitIndex!0 (size!76 (buf!385 (_2!69 lt!1713))) (currentByte!1334 (_2!69 lt!1713)) (currentBit!1329 (_2!69 lt!1713)))))))

(declare-fun bitAt!0 (array!192 (_ BitVec 64)) Bool)

(assert (=> b!2101 (= (bitAt!0 (buf!385 (_2!69 lt!1713)) lt!1677) (bitAt!0 (buf!385 (_2!69 lt!1705)) lt!1677))))

(declare-fun lt!1719 () Unit!85)

(assert (=> b!2101 (= lt!1719 lt!1681)))

(declare-fun b!2102 () Bool)

(declare-fun res!3864 () Bool)

(assert (=> b!2102 (=> (not res!3864) (not e!1483))))

(assert (=> b!2102 (= res!3864 (invariant!0 (currentBit!1329 (_2!69 lt!1717)) (currentByte!1334 (_2!69 lt!1717)) (size!76 (buf!385 (_2!69 lt!1717)))))))

(declare-fun b!2103 () Bool)

(declare-fun Unit!104 () Unit!85)

(assert (=> b!2103 (= e!1482 (tuple2!125 Unit!104 thiss!1486))))

(assert (=> b!2103 (= (size!76 (buf!385 thiss!1486)) (size!76 (buf!385 thiss!1486)))))

(declare-fun lt!1657 () Unit!85)

(declare-fun Unit!105 () Unit!85)

(assert (=> b!2103 (= lt!1657 Unit!105)))

(declare-fun checkByteArrayBitContent!0 (BitStream!130 array!192 array!192 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!138 0))(
  ( (tuple2!139 (_1!76 array!192) (_2!76 BitStream!130)) )
))
(declare-fun readBits!0 (BitStream!130 (_ BitVec 64)) tuple2!138)

(assert (=> b!2103 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!76 (readBits!0 (_1!72 call!11) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!2104 () Bool)

(declare-fun res!3868 () Bool)

(assert (=> b!2104 (=> (not res!3868) (not e!1483))))

(assert (=> b!2104 (= res!3868 (= (size!76 (buf!385 (_2!69 lt!1717))) (size!76 (buf!385 thiss!1486))))))

(declare-fun d!1364 () Bool)

(assert (=> d!1364 e!1483))

(declare-fun res!3861 () Bool)

(assert (=> d!1364 (=> (not res!3861) (not e!1483))))

(declare-fun lt!1701 () (_ BitVec 64))

(assert (=> d!1364 (= res!3861 (= (bitIndex!0 (size!76 (buf!385 (_2!69 lt!1717))) (currentByte!1334 (_2!69 lt!1717)) (currentBit!1329 (_2!69 lt!1717))) (bvsub lt!1701 from!367)))))

(assert (=> d!1364 (or (= (bvand lt!1701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1701 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!1667 () (_ BitVec 64))

(assert (=> d!1364 (= lt!1701 (bvadd lt!1667 from!367 nBits!460))))

(assert (=> d!1364 (or (not (= (bvand lt!1667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!1667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!1667 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1364 (= lt!1667 (bitIndex!0 (size!76 (buf!385 thiss!1486)) (currentByte!1334 thiss!1486) (currentBit!1329 thiss!1486)))))

(assert (=> d!1364 (= lt!1717 e!1482)))

(assert (=> d!1364 (= c!97 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!1693 () Unit!85)

(declare-fun lt!1697 () Unit!85)

(assert (=> d!1364 (= lt!1693 lt!1697)))

(assert (=> d!1364 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!130) Unit!85)

(assert (=> d!1364 (= lt!1697 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1364 (= lt!1677 (bitIndex!0 (size!76 (buf!385 thiss!1486)) (currentByte!1334 thiss!1486) (currentBit!1329 thiss!1486)))))

(assert (=> d!1364 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1364 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!1717)))

(declare-fun b!2105 () Bool)

(declare-fun lt!1679 () tuple2!130)

(assert (=> b!2105 (= e!1483 (= (bitStreamReadBitsIntoList!0 (_2!69 lt!1717) (_1!72 lt!1679) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!69 lt!1717) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!2105 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2105 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!1659 () Unit!85)

(declare-fun lt!1725 () Unit!85)

(assert (=> b!2105 (= lt!1659 lt!1725)))

(declare-fun lt!1718 () (_ BitVec 64))

(assert (=> b!2105 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 (_2!69 lt!1717)))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486)) lt!1718)))

(assert (=> b!2105 (= lt!1725 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!385 (_2!69 lt!1717)) lt!1718))))

(declare-fun e!1484 () Bool)

(assert (=> b!2105 e!1484))

(declare-fun res!3867 () Bool)

(assert (=> b!2105 (=> (not res!3867) (not e!1484))))

(assert (=> b!2105 (= res!3867 (and (= (size!76 (buf!385 thiss!1486)) (size!76 (buf!385 (_2!69 lt!1717)))) (bvsge lt!1718 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2105 (= lt!1718 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!2105 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2105 (= lt!1679 (reader!0 thiss!1486 (_2!69 lt!1717)))))

(declare-fun b!2106 () Bool)

(assert (=> b!2106 (= e!1484 (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 thiss!1486))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486)) lt!1718))))

(assert (= (and d!1364 c!97) b!2101))

(assert (= (and d!1364 (not c!97)) b!2103))

(assert (= (or b!2101 b!2103) bm!8))

(assert (= (and d!1364 res!3861) b!2102))

(assert (= (and b!2102 res!3864) b!2099))

(assert (= (and b!2099 res!3865) b!2100))

(assert (= (and b!2100 res!3860) b!2104))

(assert (= (and b!2104 res!3868) b!2105))

(assert (= (and b!2105 res!3867) b!2106))

(declare-fun m!1483 () Bool)

(assert (=> b!2101 m!1483))

(declare-fun m!1487 () Bool)

(assert (=> b!2101 m!1487))

(declare-fun m!1491 () Bool)

(assert (=> b!2101 m!1491))

(declare-fun m!1501 () Bool)

(assert (=> b!2101 m!1501))

(declare-fun m!1509 () Bool)

(assert (=> b!2101 m!1509))

(declare-fun m!1515 () Bool)

(assert (=> b!2101 m!1515))

(declare-fun m!1521 () Bool)

(assert (=> b!2101 m!1521))

(declare-fun m!1524 () Bool)

(assert (=> b!2101 m!1524))

(declare-fun m!1530 () Bool)

(assert (=> b!2101 m!1530))

(declare-fun m!1535 () Bool)

(assert (=> b!2101 m!1535))

(declare-fun m!1539 () Bool)

(assert (=> b!2101 m!1539))

(declare-fun m!1545 () Bool)

(assert (=> b!2101 m!1545))

(declare-fun m!1555 () Bool)

(assert (=> b!2101 m!1555))

(declare-fun m!1561 () Bool)

(assert (=> b!2101 m!1561))

(declare-fun m!1567 () Bool)

(assert (=> b!2101 m!1567))

(declare-fun m!1573 () Bool)

(assert (=> b!2101 m!1573))

(declare-fun m!1579 () Bool)

(assert (=> b!2101 m!1579))

(declare-fun m!1585 () Bool)

(assert (=> b!2101 m!1585))

(declare-fun m!1591 () Bool)

(assert (=> b!2101 m!1591))

(declare-fun m!1595 () Bool)

(assert (=> b!2101 m!1595))

(assert (=> b!2101 m!1573))

(declare-fun m!1613 () Bool)

(assert (=> b!2101 m!1613))

(declare-fun m!1617 () Bool)

(assert (=> b!2101 m!1617))

(assert (=> b!2101 m!1487))

(declare-fun m!1625 () Bool)

(assert (=> b!2101 m!1625))

(declare-fun m!1631 () Bool)

(assert (=> b!2101 m!1631))

(declare-fun m!1635 () Bool)

(assert (=> b!2101 m!1635))

(declare-fun m!1639 () Bool)

(assert (=> b!2101 m!1639))

(declare-fun m!1641 () Bool)

(assert (=> b!2101 m!1641))

(declare-fun m!1647 () Bool)

(assert (=> b!2101 m!1647))

(declare-fun m!1653 () Bool)

(assert (=> b!2101 m!1653))

(declare-fun m!1659 () Bool)

(assert (=> b!2101 m!1659))

(declare-fun m!1665 () Bool)

(assert (=> b!2101 m!1665))

(assert (=> b!2101 m!1639))

(assert (=> b!2101 m!1521))

(declare-fun m!1673 () Bool)

(assert (=> b!2101 m!1673))

(declare-fun m!1677 () Bool)

(assert (=> b!2102 m!1677))

(declare-fun m!1687 () Bool)

(assert (=> d!1364 m!1687))

(assert (=> d!1364 m!1561))

(declare-fun m!1693 () Bool)

(assert (=> d!1364 m!1693))

(declare-fun m!1697 () Bool)

(assert (=> d!1364 m!1697))

(declare-fun m!1705 () Bool)

(assert (=> b!2106 m!1705))

(declare-fun m!1711 () Bool)

(assert (=> b!2100 m!1711))

(declare-fun m!1715 () Bool)

(assert (=> b!2105 m!1715))

(declare-fun m!1719 () Bool)

(assert (=> b!2105 m!1719))

(declare-fun m!1723 () Bool)

(assert (=> b!2105 m!1723))

(declare-fun m!1733 () Bool)

(assert (=> b!2105 m!1733))

(declare-fun m!1735 () Bool)

(assert (=> b!2105 m!1735))

(declare-fun m!1742 () Bool)

(assert (=> b!2103 m!1742))

(declare-fun m!1749 () Bool)

(assert (=> b!2103 m!1749))

(declare-fun m!1753 () Bool)

(assert (=> bm!8 m!1753))

(assert (=> b!2001 d!1364))

(declare-fun d!1368 () Bool)

(assert (=> d!1368 (= (array_inv!71 srcBuffer!6) (bvsge (size!76 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!668 d!1368))

(declare-fun d!1374 () Bool)

(assert (=> d!1374 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1329 thiss!1486) (currentByte!1334 thiss!1486) (size!76 (buf!385 thiss!1486))))))

(declare-fun bs!521 () Bool)

(assert (= bs!521 d!1374))

(assert (=> bs!521 m!1441))

(assert (=> start!668 d!1374))

(declare-fun d!1380 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!76 (buf!385 thiss!1486))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!76 (buf!385 thiss!1486))) ((_ sign_extend 32) (currentByte!1334 thiss!1486)) ((_ sign_extend 32) (currentBit!1329 thiss!1486))) nBits!460))))

(declare-fun bs!522 () Bool)

(assert (= bs!522 d!1380))

(declare-fun m!1759 () Bool)

(assert (=> bs!522 m!1759))

(assert (=> b!2002 d!1380))

(declare-fun d!1384 () Bool)

(assert (=> d!1384 (= (array_inv!71 (buf!385 thiss!1486)) (bvsge (size!76 (buf!385 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2004 d!1384))

(push 1)

(assert (not b!2102))

(assert (not b!2103))

(assert (not b!2100))

(assert (not b!2105))

(assert (not b!2101))

(assert (not bm!8))

(assert (not d!1364))

(assert (not d!1374))

(assert (not b!2106))

(assert (not d!1380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

