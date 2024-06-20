; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!670 () Bool)

(assert start!670)

(declare-fun b!2015 () Bool)

(declare-fun e!1439 () Bool)

(declare-fun e!1440 () Bool)

(assert (=> b!2015 (= e!1439 e!1440)))

(declare-fun res!3801 () Bool)

(assert (=> b!2015 (=> (not res!3801) (not e!1440))))

(declare-datatypes ((array!194 0))(
  ( (array!195 (arr!464 (Array (_ BitVec 32) (_ BitVec 8))) (size!77 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!132 0))(
  ( (BitStream!133 (buf!386 array!194) (currentByte!1335 (_ BitVec 32)) (currentBit!1330 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!87 0))(
  ( (Unit!88) )
))
(declare-datatypes ((tuple2!126 0))(
  ( (tuple2!127 (_1!70 Unit!87) (_2!70 BitStream!132)) )
))
(declare-fun lt!1328 () tuple2!126)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2015 (= res!3801 (invariant!0 (currentBit!1330 (_2!70 lt!1328)) (currentByte!1335 (_2!70 lt!1328)) (size!77 (buf!386 (_2!70 lt!1328)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!194)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!132)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!132 array!194 (_ BitVec 64) (_ BitVec 64)) tuple2!126)

(assert (=> b!2015 (= lt!1328 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!3800 () Bool)

(assert (=> start!670 (=> (not res!3800) (not e!1439))))

(assert (=> start!670 (= res!3800 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!77 srcBuffer!6))))))))

(assert (=> start!670 e!1439))

(assert (=> start!670 true))

(declare-fun array_inv!72 (array!194) Bool)

(assert (=> start!670 (array_inv!72 srcBuffer!6)))

(declare-fun e!1438 () Bool)

(declare-fun inv!12 (BitStream!132) Bool)

(assert (=> start!670 (and (inv!12 thiss!1486) e!1438)))

(declare-fun b!2016 () Bool)

(declare-fun res!3802 () Bool)

(assert (=> b!2016 (=> (not res!3802) (not e!1439))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2016 (= res!3802 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 thiss!1486))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486)) nBits!460))))

(declare-fun b!2017 () Bool)

(assert (=> b!2017 (= e!1438 (array_inv!72 (buf!386 thiss!1486)))))

(declare-fun b!2018 () Bool)

(declare-fun res!3799 () Bool)

(assert (=> b!2018 (=> (not res!3799) (not e!1440))))

(assert (=> b!2018 (= res!3799 (= (size!77 (buf!386 thiss!1486)) (size!77 (buf!386 (_2!70 lt!1328)))))))

(declare-fun b!2019 () Bool)

(assert (=> b!2019 (= e!1440 (not (invariant!0 (currentBit!1330 thiss!1486) (currentByte!1335 thiss!1486) (size!77 (buf!386 thiss!1486)))))))

(assert (= (and start!670 res!3800) b!2016))

(assert (= (and b!2016 res!3802) b!2015))

(assert (= (and b!2015 res!3801) b!2018))

(assert (= (and b!2018 res!3799) b!2019))

(assert (= start!670 b!2017))

(declare-fun m!1451 () Bool)

(assert (=> start!670 m!1451))

(declare-fun m!1453 () Bool)

(assert (=> start!670 m!1453))

(declare-fun m!1455 () Bool)

(assert (=> b!2015 m!1455))

(declare-fun m!1457 () Bool)

(assert (=> b!2015 m!1457))

(declare-fun m!1459 () Bool)

(assert (=> b!2019 m!1459))

(declare-fun m!1461 () Bool)

(assert (=> b!2017 m!1461))

(declare-fun m!1463 () Bool)

(assert (=> b!2016 m!1463))

(check-sat (not b!2016) (not b!2017) (not start!670) (not b!2019) (not b!2015))
(check-sat)
(get-model)

(declare-fun d!1344 () Bool)

(assert (=> d!1344 (= (invariant!0 (currentBit!1330 thiss!1486) (currentByte!1335 thiss!1486) (size!77 (buf!386 thiss!1486))) (and (bvsge (currentBit!1330 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1330 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1335 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1335 thiss!1486) (size!77 (buf!386 thiss!1486))) (and (= (currentBit!1330 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1335 thiss!1486) (size!77 (buf!386 thiss!1486)))))))))

(assert (=> b!2019 d!1344))

(declare-fun d!1350 () Bool)

(assert (=> d!1350 (= (invariant!0 (currentBit!1330 (_2!70 lt!1328)) (currentByte!1335 (_2!70 lt!1328)) (size!77 (buf!386 (_2!70 lt!1328)))) (and (bvsge (currentBit!1330 (_2!70 lt!1328)) #b00000000000000000000000000000000) (bvslt (currentBit!1330 (_2!70 lt!1328)) #b00000000000000000000000000001000) (bvsge (currentByte!1335 (_2!70 lt!1328)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1335 (_2!70 lt!1328)) (size!77 (buf!386 (_2!70 lt!1328)))) (and (= (currentBit!1330 (_2!70 lt!1328)) #b00000000000000000000000000000000) (= (currentByte!1335 (_2!70 lt!1328)) (size!77 (buf!386 (_2!70 lt!1328))))))))))

(assert (=> b!2015 d!1350))

(declare-fun b!2091 () Bool)

(declare-fun e!1481 () tuple2!126)

(declare-fun lt!1712 () tuple2!126)

(declare-fun Unit!91 () Unit!87)

(assert (=> b!2091 (= e!1481 (tuple2!127 Unit!91 (_2!70 lt!1712)))))

(declare-fun lt!1668 () tuple2!126)

(declare-fun appendBitFromByte!0 (BitStream!132 (_ BitVec 8) (_ BitVec 32)) tuple2!126)

(assert (=> b!2091 (= lt!1668 (appendBitFromByte!0 thiss!1486 (select (arr!464 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!1706 () (_ BitVec 64))

(assert (=> b!2091 (= lt!1706 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1650 () (_ BitVec 64))

(assert (=> b!2091 (= lt!1650 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!1708 () Unit!87)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!132 BitStream!132 (_ BitVec 64) (_ BitVec 64)) Unit!87)

(assert (=> b!2091 (= lt!1708 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!70 lt!1668) lt!1706 lt!1650))))

(assert (=> b!2091 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 (_2!70 lt!1668)))) ((_ sign_extend 32) (currentByte!1335 (_2!70 lt!1668))) ((_ sign_extend 32) (currentBit!1330 (_2!70 lt!1668))) (bvsub lt!1706 lt!1650))))

(declare-fun lt!1666 () Unit!87)

(assert (=> b!2091 (= lt!1666 lt!1708)))

(declare-datatypes ((tuple2!134 0))(
  ( (tuple2!135 (_1!74 BitStream!132) (_2!74 BitStream!132)) )
))
(declare-fun lt!1658 () tuple2!134)

(declare-fun reader!0 (BitStream!132 BitStream!132) tuple2!134)

(assert (=> b!2091 (= lt!1658 (reader!0 thiss!1486 (_2!70 lt!1668)))))

(declare-fun lt!1698 () (_ BitVec 64))

(assert (=> b!2091 (= lt!1698 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!1690 () Unit!87)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!132 array!194 (_ BitVec 64)) Unit!87)

(assert (=> b!2091 (= lt!1690 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!386 (_2!70 lt!1668)) lt!1698))))

(assert (=> b!2091 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 (_2!70 lt!1668)))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486)) lt!1698)))

(declare-fun lt!1651 () Unit!87)

(assert (=> b!2091 (= lt!1651 lt!1690)))

(declare-datatypes ((List!7 0))(
  ( (Nil!4) (Cons!3 (h!122 Bool) (t!757 List!7)) )
))
(declare-fun head!5 (List!7) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!132 array!194 (_ BitVec 64) (_ BitVec 64)) List!7)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!132 BitStream!132 (_ BitVec 64)) List!7)

(assert (=> b!2091 (= (head!5 (byteArrayBitContentToList!0 (_2!70 lt!1668) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!5 (bitStreamReadBitsIntoList!0 (_2!70 lt!1668) (_1!74 lt!1658) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1643 () Unit!87)

(declare-fun Unit!95 () Unit!87)

(assert (=> b!2091 (= lt!1643 Unit!95)))

(assert (=> b!2091 (= lt!1712 (appendBitsMSBFirstLoop!0 (_2!70 lt!1668) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!1648 () Unit!87)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!132 BitStream!132 BitStream!132) Unit!87)

(assert (=> b!2091 (= lt!1648 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!70 lt!1668) (_2!70 lt!1712)))))

(declare-fun isPrefixOf!0 (BitStream!132 BitStream!132) Bool)

(assert (=> b!2091 (isPrefixOf!0 thiss!1486 (_2!70 lt!1712))))

(declare-fun lt!1694 () Unit!87)

(assert (=> b!2091 (= lt!1694 lt!1648)))

(assert (=> b!2091 (= (size!77 (buf!386 (_2!70 lt!1712))) (size!77 (buf!386 thiss!1486)))))

(declare-fun lt!1678 () Unit!87)

(declare-fun Unit!98 () Unit!87)

(assert (=> b!2091 (= lt!1678 Unit!98)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2091 (= (bitIndex!0 (size!77 (buf!386 (_2!70 lt!1712))) (currentByte!1335 (_2!70 lt!1712)) (currentBit!1330 (_2!70 lt!1712))) (bvsub (bvadd (bitIndex!0 (size!77 (buf!386 thiss!1486)) (currentByte!1335 thiss!1486) (currentBit!1330 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!1688 () Unit!87)

(declare-fun Unit!100 () Unit!87)

(assert (=> b!2091 (= lt!1688 Unit!100)))

(assert (=> b!2091 (= (bitIndex!0 (size!77 (buf!386 (_2!70 lt!1712))) (currentByte!1335 (_2!70 lt!1712)) (currentBit!1330 (_2!70 lt!1712))) (bvsub (bvsub (bvadd (bitIndex!0 (size!77 (buf!386 (_2!70 lt!1668))) (currentByte!1335 (_2!70 lt!1668)) (currentBit!1330 (_2!70 lt!1668))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!1642 () Unit!87)

(declare-fun Unit!102 () Unit!87)

(assert (=> b!2091 (= lt!1642 Unit!102)))

(declare-fun lt!1655 () tuple2!134)

(assert (=> b!2091 (= lt!1655 (reader!0 thiss!1486 (_2!70 lt!1712)))))

(declare-fun lt!1660 () (_ BitVec 64))

(assert (=> b!2091 (= lt!1660 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1662 () Unit!87)

(assert (=> b!2091 (= lt!1662 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!386 (_2!70 lt!1712)) lt!1660))))

(assert (=> b!2091 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 (_2!70 lt!1712)))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486)) lt!1660)))

(declare-fun lt!1653 () Unit!87)

(assert (=> b!2091 (= lt!1653 lt!1662)))

(declare-fun lt!1716 () tuple2!134)

(declare-fun call!10 () tuple2!134)

(assert (=> b!2091 (= lt!1716 call!10)))

(declare-fun lt!1656 () (_ BitVec 64))

(assert (=> b!2091 (= lt!1656 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!1645 () Unit!87)

(assert (=> b!2091 (= lt!1645 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!70 lt!1668) (buf!386 (_2!70 lt!1712)) lt!1656))))

(assert (=> b!2091 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 (_2!70 lt!1712)))) ((_ sign_extend 32) (currentByte!1335 (_2!70 lt!1668))) ((_ sign_extend 32) (currentBit!1330 (_2!70 lt!1668))) lt!1656)))

(declare-fun lt!1686 () Unit!87)

(assert (=> b!2091 (= lt!1686 lt!1645)))

(declare-fun lt!1700 () List!7)

(assert (=> b!2091 (= lt!1700 (byteArrayBitContentToList!0 (_2!70 lt!1712) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!1647 () List!7)

(assert (=> b!2091 (= lt!1647 (byteArrayBitContentToList!0 (_2!70 lt!1712) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1676 () List!7)

(assert (=> b!2091 (= lt!1676 (bitStreamReadBitsIntoList!0 (_2!70 lt!1712) (_1!74 lt!1655) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!1684 () List!7)

(assert (=> b!2091 (= lt!1684 (bitStreamReadBitsIntoList!0 (_2!70 lt!1712) (_1!74 lt!1716) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1670 () (_ BitVec 64))

(assert (=> b!2091 (= lt!1670 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1702 () Unit!87)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!132 BitStream!132 BitStream!132 BitStream!132 (_ BitVec 64) List!7) Unit!87)

(assert (=> b!2091 (= lt!1702 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!70 lt!1712) (_2!70 lt!1712) (_1!74 lt!1655) (_1!74 lt!1716) lt!1670 lt!1676))))

(declare-fun tail!14 (List!7) List!7)

(assert (=> b!2091 (= (bitStreamReadBitsIntoList!0 (_2!70 lt!1712) (_1!74 lt!1716) (bvsub lt!1670 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!14 lt!1676))))

(declare-fun lt!1680 () Unit!87)

(assert (=> b!2091 (= lt!1680 lt!1702)))

(declare-fun lt!1692 () (_ BitVec 64))

(declare-fun lt!1704 () Unit!87)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!194 array!194 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!87)

(assert (=> b!2091 (= lt!1704 (arrayBitRangesEqImpliesEq!0 (buf!386 (_2!70 lt!1668)) (buf!386 (_2!70 lt!1712)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!1692 (bitIndex!0 (size!77 (buf!386 (_2!70 lt!1668))) (currentByte!1335 (_2!70 lt!1668)) (currentBit!1330 (_2!70 lt!1668)))))))

(declare-fun bitAt!0 (array!194 (_ BitVec 64)) Bool)

(assert (=> b!2091 (= (bitAt!0 (buf!386 (_2!70 lt!1668)) lt!1692) (bitAt!0 (buf!386 (_2!70 lt!1712)) lt!1692))))

(declare-fun lt!1646 () Unit!87)

(assert (=> b!2091 (= lt!1646 lt!1704)))

(declare-fun lt!1714 () tuple2!126)

(declare-fun e!1479 () Bool)

(declare-fun lt!1649 () tuple2!134)

(declare-fun b!2092 () Bool)

(assert (=> b!2092 (= e!1479 (= (bitStreamReadBitsIntoList!0 (_2!70 lt!1714) (_1!74 lt!1649) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!70 lt!1714) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!2092 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2092 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!1641 () Unit!87)

(declare-fun lt!1664 () Unit!87)

(assert (=> b!2092 (= lt!1641 lt!1664)))

(declare-fun lt!1673 () (_ BitVec 64))

(assert (=> b!2092 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 (_2!70 lt!1714)))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486)) lt!1673)))

(assert (=> b!2092 (= lt!1664 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!386 (_2!70 lt!1714)) lt!1673))))

(declare-fun e!1480 () Bool)

(assert (=> b!2092 e!1480))

(declare-fun res!3862 () Bool)

(assert (=> b!2092 (=> (not res!3862) (not e!1480))))

(assert (=> b!2092 (= res!3862 (and (= (size!77 (buf!386 thiss!1486)) (size!77 (buf!386 (_2!70 lt!1714)))) (bvsge lt!1673 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2092 (= lt!1673 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!2092 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2092 (= lt!1649 (reader!0 thiss!1486 (_2!70 lt!1714)))))

(declare-fun b!2093 () Bool)

(declare-fun res!3859 () Bool)

(assert (=> b!2093 (=> (not res!3859) (not e!1479))))

(assert (=> b!2093 (= res!3859 (isPrefixOf!0 thiss!1486 (_2!70 lt!1714)))))

(declare-fun c!98 () Bool)

(declare-fun bm!7 () Bool)

(assert (=> bm!7 (= call!10 (reader!0 (ite c!98 (_2!70 lt!1668) thiss!1486) (ite c!98 (_2!70 lt!1712) thiss!1486)))))

(declare-fun b!2094 () Bool)

(declare-fun res!3863 () Bool)

(assert (=> b!2094 (=> (not res!3863) (not e!1479))))

(assert (=> b!2094 (= res!3863 (= (size!77 (buf!386 thiss!1486)) (size!77 (buf!386 (_2!70 lt!1714)))))))

(declare-fun b!2095 () Bool)

(declare-fun res!3857 () Bool)

(assert (=> b!2095 (=> (not res!3857) (not e!1479))))

(assert (=> b!2095 (= res!3857 (= (size!77 (buf!386 (_2!70 lt!1714))) (size!77 (buf!386 thiss!1486))))))

(declare-fun b!2096 () Bool)

(assert (=> b!2096 (= e!1480 (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 thiss!1486))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486)) lt!1673))))

(declare-fun d!1352 () Bool)

(assert (=> d!1352 e!1479))

(declare-fun res!3858 () Bool)

(assert (=> d!1352 (=> (not res!3858) (not e!1479))))

(declare-fun lt!1640 () (_ BitVec 64))

(assert (=> d!1352 (= res!3858 (= (bitIndex!0 (size!77 (buf!386 (_2!70 lt!1714))) (currentByte!1335 (_2!70 lt!1714)) (currentBit!1330 (_2!70 lt!1714))) (bvsub lt!1640 from!367)))))

(assert (=> d!1352 (or (= (bvand lt!1640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1640 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!1644 () (_ BitVec 64))

(assert (=> d!1352 (= lt!1640 (bvadd lt!1644 from!367 nBits!460))))

(assert (=> d!1352 (or (not (= (bvand lt!1644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!1644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!1644 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1352 (= lt!1644 (bitIndex!0 (size!77 (buf!386 thiss!1486)) (currentByte!1335 thiss!1486) (currentBit!1330 thiss!1486)))))

(assert (=> d!1352 (= lt!1714 e!1481)))

(assert (=> d!1352 (= c!98 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!1710 () Unit!87)

(declare-fun lt!1682 () Unit!87)

(assert (=> d!1352 (= lt!1710 lt!1682)))

(assert (=> d!1352 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!132) Unit!87)

(assert (=> d!1352 (= lt!1682 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1352 (= lt!1692 (bitIndex!0 (size!77 (buf!386 thiss!1486)) (currentByte!1335 thiss!1486) (currentBit!1330 thiss!1486)))))

(assert (=> d!1352 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1352 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!1714)))

(declare-fun b!2097 () Bool)

(declare-fun res!3866 () Bool)

(assert (=> b!2097 (=> (not res!3866) (not e!1479))))

(assert (=> b!2097 (= res!3866 (invariant!0 (currentBit!1330 (_2!70 lt!1714)) (currentByte!1335 (_2!70 lt!1714)) (size!77 (buf!386 (_2!70 lt!1714)))))))

(declare-fun b!2098 () Bool)

(declare-fun Unit!110 () Unit!87)

(assert (=> b!2098 (= e!1481 (tuple2!127 Unit!110 thiss!1486))))

(assert (=> b!2098 (= (size!77 (buf!386 thiss!1486)) (size!77 (buf!386 thiss!1486)))))

(declare-fun lt!1696 () Unit!87)

(declare-fun Unit!111 () Unit!87)

(assert (=> b!2098 (= lt!1696 Unit!111)))

(declare-fun checkByteArrayBitContent!0 (BitStream!132 array!194 array!194 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!140 0))(
  ( (tuple2!141 (_1!77 array!194) (_2!77 BitStream!132)) )
))
(declare-fun readBits!0 (BitStream!132 (_ BitVec 64)) tuple2!140)

(assert (=> b!2098 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!77 (readBits!0 (_1!74 call!10) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (= (and d!1352 c!98) b!2091))

(assert (= (and d!1352 (not c!98)) b!2098))

(assert (= (or b!2091 b!2098) bm!7))

(assert (= (and d!1352 res!3858) b!2097))

(assert (= (and b!2097 res!3866) b!2094))

(assert (= (and b!2094 res!3863) b!2093))

(assert (= (and b!2093 res!3859) b!2095))

(assert (= (and b!2095 res!3857) b!2092))

(assert (= (and b!2092 res!3862) b!2096))

(declare-fun m!1481 () Bool)

(assert (=> b!2096 m!1481))

(declare-fun m!1489 () Bool)

(assert (=> b!2097 m!1489))

(declare-fun m!1495 () Bool)

(assert (=> d!1352 m!1495))

(declare-fun m!1499 () Bool)

(assert (=> d!1352 m!1499))

(declare-fun m!1505 () Bool)

(assert (=> d!1352 m!1505))

(declare-fun m!1507 () Bool)

(assert (=> d!1352 m!1507))

(declare-fun m!1513 () Bool)

(assert (=> b!2098 m!1513))

(declare-fun m!1520 () Bool)

(assert (=> b!2098 m!1520))

(declare-fun m!1527 () Bool)

(assert (=> b!2093 m!1527))

(declare-fun m!1534 () Bool)

(assert (=> bm!7 m!1534))

(declare-fun m!1541 () Bool)

(assert (=> b!2092 m!1541))

(declare-fun m!1547 () Bool)

(assert (=> b!2092 m!1547))

(declare-fun m!1551 () Bool)

(assert (=> b!2092 m!1551))

(declare-fun m!1557 () Bool)

(assert (=> b!2092 m!1557))

(declare-fun m!1563 () Bool)

(assert (=> b!2092 m!1563))

(declare-fun m!1569 () Bool)

(assert (=> b!2091 m!1569))

(declare-fun m!1575 () Bool)

(assert (=> b!2091 m!1575))

(declare-fun m!1581 () Bool)

(assert (=> b!2091 m!1581))

(declare-fun m!1587 () Bool)

(assert (=> b!2091 m!1587))

(declare-fun m!1593 () Bool)

(assert (=> b!2091 m!1593))

(declare-fun m!1599 () Bool)

(assert (=> b!2091 m!1599))

(declare-fun m!1603 () Bool)

(assert (=> b!2091 m!1603))

(declare-fun m!1607 () Bool)

(assert (=> b!2091 m!1607))

(declare-fun m!1611 () Bool)

(assert (=> b!2091 m!1611))

(assert (=> b!2091 m!1499))

(assert (=> b!2091 m!1587))

(declare-fun m!1619 () Bool)

(assert (=> b!2091 m!1619))

(declare-fun m!1623 () Bool)

(assert (=> b!2091 m!1623))

(declare-fun m!1627 () Bool)

(assert (=> b!2091 m!1627))

(declare-fun m!1633 () Bool)

(assert (=> b!2091 m!1633))

(assert (=> b!2091 m!1569))

(declare-fun m!1643 () Bool)

(assert (=> b!2091 m!1643))

(declare-fun m!1649 () Bool)

(assert (=> b!2091 m!1649))

(declare-fun m!1657 () Bool)

(assert (=> b!2091 m!1657))

(declare-fun m!1663 () Bool)

(assert (=> b!2091 m!1663))

(assert (=> b!2091 m!1603))

(declare-fun m!1669 () Bool)

(assert (=> b!2091 m!1669))

(declare-fun m!1671 () Bool)

(assert (=> b!2091 m!1671))

(declare-fun m!1679 () Bool)

(assert (=> b!2091 m!1679))

(declare-fun m!1683 () Bool)

(assert (=> b!2091 m!1683))

(declare-fun m!1689 () Bool)

(assert (=> b!2091 m!1689))

(declare-fun m!1695 () Bool)

(assert (=> b!2091 m!1695))

(declare-fun m!1701 () Bool)

(assert (=> b!2091 m!1701))

(declare-fun m!1707 () Bool)

(assert (=> b!2091 m!1707))

(assert (=> b!2091 m!1679))

(declare-fun m!1717 () Bool)

(assert (=> b!2091 m!1717))

(declare-fun m!1727 () Bool)

(assert (=> b!2091 m!1727))

(declare-fun m!1730 () Bool)

(assert (=> b!2091 m!1730))

(declare-fun m!1737 () Bool)

(assert (=> b!2091 m!1737))

(declare-fun m!1743 () Bool)

(assert (=> b!2091 m!1743))

(declare-fun m!1745 () Bool)

(assert (=> b!2091 m!1745))

(assert (=> b!2015 d!1352))

(declare-fun d!1366 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1366 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!77 (buf!386 thiss!1486))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!77 (buf!386 thiss!1486))) ((_ sign_extend 32) (currentByte!1335 thiss!1486)) ((_ sign_extend 32) (currentBit!1330 thiss!1486))) nBits!460))))

(declare-fun bs!519 () Bool)

(assert (= bs!519 d!1366))

(declare-fun m!1755 () Bool)

(assert (=> bs!519 m!1755))

(assert (=> b!2016 d!1366))

(declare-fun d!1376 () Bool)

(assert (=> d!1376 (= (array_inv!72 (buf!386 thiss!1486)) (bvsge (size!77 (buf!386 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2017 d!1376))

(declare-fun d!1378 () Bool)

(assert (=> d!1378 (= (array_inv!72 srcBuffer!6) (bvsge (size!77 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!670 d!1378))

(declare-fun d!1382 () Bool)

(assert (=> d!1382 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1330 thiss!1486) (currentByte!1335 thiss!1486) (size!77 (buf!386 thiss!1486))))))

(declare-fun bs!523 () Bool)

(assert (= bs!523 d!1382))

(assert (=> bs!523 m!1459))

(assert (=> start!670 d!1382))

(check-sat (not bm!7) (not b!2093) (not b!2091) (not b!2097) (not d!1382) (not d!1352) (not b!2092) (not d!1366) (not b!2096) (not b!2098))
