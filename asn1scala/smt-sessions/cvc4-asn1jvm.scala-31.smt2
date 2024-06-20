; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!672 () Bool)

(assert start!672)

(declare-fun res!3814 () Bool)

(declare-fun e!1453 () Bool)

(assert (=> start!672 (=> (not res!3814) (not e!1453))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!196 0))(
  ( (array!197 (arr!465 (Array (_ BitVec 32) (_ BitVec 8))) (size!78 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!196)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!672 (= res!3814 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!78 srcBuffer!6))))))))

(assert (=> start!672 e!1453))

(assert (=> start!672 true))

(declare-fun array_inv!73 (array!196) Bool)

(assert (=> start!672 (array_inv!73 srcBuffer!6)))

(declare-datatypes ((BitStream!134 0))(
  ( (BitStream!135 (buf!387 array!196) (currentByte!1336 (_ BitVec 32)) (currentBit!1331 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!134)

(declare-fun e!1457 () Bool)

(declare-fun inv!12 (BitStream!134) Bool)

(assert (=> start!672 (and (inv!12 thiss!1486) e!1457)))

(declare-fun b!2030 () Bool)

(declare-fun res!3812 () Bool)

(assert (=> b!2030 (=> (not res!3812) (not e!1453))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2030 (= res!3812 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 thiss!1486))) ((_ sign_extend 32) (currentByte!1336 thiss!1486)) ((_ sign_extend 32) (currentBit!1331 thiss!1486)) nBits!460))))

(declare-fun b!2031 () Bool)

(declare-fun res!3813 () Bool)

(declare-fun e!1454 () Bool)

(assert (=> b!2031 (=> (not res!3813) (not e!1454))))

(declare-datatypes ((Unit!89 0))(
  ( (Unit!90) )
))
(declare-datatypes ((tuple2!128 0))(
  ( (tuple2!129 (_1!71 Unit!89) (_2!71 BitStream!134)) )
))
(declare-fun lt!1331 () tuple2!128)

(assert (=> b!2031 (= res!3813 (= (size!78 (buf!387 thiss!1486)) (size!78 (buf!387 (_2!71 lt!1331)))))))

(declare-fun b!2032 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2032 (= e!1454 (not (invariant!0 (currentBit!1331 thiss!1486) (currentByte!1336 thiss!1486) (size!78 (buf!387 thiss!1486)))))))

(declare-fun b!2033 () Bool)

(assert (=> b!2033 (= e!1453 e!1454)))

(declare-fun res!3811 () Bool)

(assert (=> b!2033 (=> (not res!3811) (not e!1454))))

(assert (=> b!2033 (= res!3811 (invariant!0 (currentBit!1331 (_2!71 lt!1331)) (currentByte!1336 (_2!71 lt!1331)) (size!78 (buf!387 (_2!71 lt!1331)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!134 array!196 (_ BitVec 64) (_ BitVec 64)) tuple2!128)

(assert (=> b!2033 (= lt!1331 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2034 () Bool)

(assert (=> b!2034 (= e!1457 (array_inv!73 (buf!387 thiss!1486)))))

(assert (= (and start!672 res!3814) b!2030))

(assert (= (and b!2030 res!3812) b!2033))

(assert (= (and b!2033 res!3811) b!2031))

(assert (= (and b!2031 res!3813) b!2032))

(assert (= start!672 b!2034))

(declare-fun m!1465 () Bool)

(assert (=> b!2034 m!1465))

(declare-fun m!1467 () Bool)

(assert (=> b!2032 m!1467))

(declare-fun m!1469 () Bool)

(assert (=> start!672 m!1469))

(declare-fun m!1471 () Bool)

(assert (=> start!672 m!1471))

(declare-fun m!1473 () Bool)

(assert (=> b!2033 m!1473))

(declare-fun m!1475 () Bool)

(assert (=> b!2033 m!1475))

(declare-fun m!1477 () Bool)

(assert (=> b!2030 m!1477))

(push 1)

(assert (not start!672))

(assert (not b!2034))

(assert (not b!2030))

(assert (not b!2032))

(assert (not b!2033))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1346 () Bool)

(assert (=> d!1346 (= (array_inv!73 srcBuffer!6) (bvsge (size!78 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!672 d!1346))

(declare-fun d!1348 () Bool)

(assert (=> d!1348 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1331 thiss!1486) (currentByte!1336 thiss!1486) (size!78 (buf!387 thiss!1486))))))

(declare-fun bs!518 () Bool)

(assert (= bs!518 d!1348))

(assert (=> bs!518 m!1467))

(assert (=> start!672 d!1348))

(declare-fun d!1354 () Bool)

(assert (=> d!1354 (= (invariant!0 (currentBit!1331 thiss!1486) (currentByte!1336 thiss!1486) (size!78 (buf!387 thiss!1486))) (and (bvsge (currentBit!1331 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1331 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1336 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1336 thiss!1486) (size!78 (buf!387 thiss!1486))) (and (= (currentBit!1331 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1336 thiss!1486) (size!78 (buf!387 thiss!1486)))))))))

(assert (=> b!2032 d!1354))

(declare-fun d!1358 () Bool)

(assert (=> d!1358 (= (invariant!0 (currentBit!1331 (_2!71 lt!1331)) (currentByte!1336 (_2!71 lt!1331)) (size!78 (buf!387 (_2!71 lt!1331)))) (and (bvsge (currentBit!1331 (_2!71 lt!1331)) #b00000000000000000000000000000000) (bvslt (currentBit!1331 (_2!71 lt!1331)) #b00000000000000000000000000001000) (bvsge (currentByte!1336 (_2!71 lt!1331)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1336 (_2!71 lt!1331)) (size!78 (buf!387 (_2!71 lt!1331)))) (and (= (currentBit!1331 (_2!71 lt!1331)) #b00000000000000000000000000000000) (= (currentByte!1336 (_2!71 lt!1331)) (size!78 (buf!387 (_2!71 lt!1331))))))))))

(assert (=> b!2033 d!1358))

(declare-fun b!2083 () Bool)

(declare-fun res!3853 () Bool)

(declare-fun e!1476 () Bool)

(assert (=> b!2083 (=> (not res!3853) (not e!1476))))

(declare-fun lt!1633 () tuple2!128)

(assert (=> b!2083 (= res!3853 (= (size!78 (buf!387 thiss!1486)) (size!78 (buf!387 (_2!71 lt!1633)))))))

(declare-fun b!2084 () Bool)

(declare-fun e!1478 () tuple2!128)

(declare-fun Unit!92 () Unit!89)

(assert (=> b!2084 (= e!1478 (tuple2!129 Unit!92 thiss!1486))))

(assert (=> b!2084 (= (size!78 (buf!387 thiss!1486)) (size!78 (buf!387 thiss!1486)))))

(declare-fun lt!1615 () Unit!89)

(declare-fun Unit!94 () Unit!89)

(assert (=> b!2084 (= lt!1615 Unit!94)))

(declare-datatypes ((tuple2!132 0))(
  ( (tuple2!133 (_1!73 BitStream!134) (_2!73 BitStream!134)) )
))
(declare-fun call!9 () tuple2!132)

(declare-fun checkByteArrayBitContent!0 (BitStream!134 array!196 array!196 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!136 0))(
  ( (tuple2!137 (_1!75 array!196) (_2!75 BitStream!134)) )
))
(declare-fun readBits!0 (BitStream!134 (_ BitVec 64)) tuple2!136)

(assert (=> b!2084 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!75 (readBits!0 (_1!73 call!9) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!2085 () Bool)

(declare-fun lt!1637 () tuple2!132)

(declare-datatypes ((List!8 0))(
  ( (Nil!5) (Cons!4 (h!123 Bool) (t!758 List!8)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!134 BitStream!134 (_ BitVec 64)) List!8)

(declare-fun byteArrayBitContentToList!0 (BitStream!134 array!196 (_ BitVec 64) (_ BitVec 64)) List!8)

(assert (=> b!2085 (= e!1476 (= (bitStreamReadBitsIntoList!0 (_2!71 lt!1633) (_1!73 lt!1637) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!71 lt!1633) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!2085 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2085 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!1601 () Unit!89)

(declare-fun lt!1597 () Unit!89)

(assert (=> b!2085 (= lt!1601 lt!1597)))

(declare-fun lt!1617 () (_ BitVec 64))

(assert (=> b!2085 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 (_2!71 lt!1633)))) ((_ sign_extend 32) (currentByte!1336 thiss!1486)) ((_ sign_extend 32) (currentBit!1331 thiss!1486)) lt!1617)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!134 array!196 (_ BitVec 64)) Unit!89)

(assert (=> b!2085 (= lt!1597 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!387 (_2!71 lt!1633)) lt!1617))))

(declare-fun e!1477 () Bool)

(assert (=> b!2085 e!1477))

(declare-fun res!3856 () Bool)

(assert (=> b!2085 (=> (not res!3856) (not e!1477))))

(assert (=> b!2085 (= res!3856 (and (= (size!78 (buf!387 thiss!1486)) (size!78 (buf!387 (_2!71 lt!1633)))) (bvsge lt!1617 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2085 (= lt!1617 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!2085 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!134 BitStream!134) tuple2!132)

(assert (=> b!2085 (= lt!1637 (reader!0 thiss!1486 (_2!71 lt!1633)))))

(declare-fun b!2086 () Bool)

(declare-fun lt!1609 () tuple2!128)

(declare-fun Unit!103 () Unit!89)

(assert (=> b!2086 (= e!1478 (tuple2!129 Unit!103 (_2!71 lt!1609)))))

(declare-fun lt!1629 () tuple2!128)

(declare-fun appendBitFromByte!0 (BitStream!134 (_ BitVec 8) (_ BitVec 32)) tuple2!128)

(assert (=> b!2086 (= lt!1629 (appendBitFromByte!0 thiss!1486 (select (arr!465 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!1630 () (_ BitVec 64))

(assert (=> b!2086 (= lt!1630 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1639 () (_ BitVec 64))

(assert (=> b!2086 (= lt!1639 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!1604 () Unit!89)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!134 BitStream!134 (_ BitVec 64) (_ BitVec 64)) Unit!89)

(assert (=> b!2086 (= lt!1604 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!71 lt!1629) lt!1630 lt!1639))))

(assert (=> b!2086 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 (_2!71 lt!1629)))) ((_ sign_extend 32) (currentByte!1336 (_2!71 lt!1629))) ((_ sign_extend 32) (currentBit!1331 (_2!71 lt!1629))) (bvsub lt!1630 lt!1639))))

(declare-fun lt!1612 () Unit!89)

(assert (=> b!2086 (= lt!1612 lt!1604)))

(declare-fun lt!1627 () tuple2!132)

(assert (=> b!2086 (= lt!1627 call!9)))

(declare-fun lt!1603 () (_ BitVec 64))

(assert (=> b!2086 (= lt!1603 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!1613 () Unit!89)

(assert (=> b!2086 (= lt!1613 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!387 (_2!71 lt!1629)) lt!1603))))

(assert (=> b!2086 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 (_2!71 lt!1629)))) ((_ sign_extend 32) (currentByte!1336 thiss!1486)) ((_ sign_extend 32) (currentBit!1331 thiss!1486)) lt!1603)))

(declare-fun lt!1602 () Unit!89)

(assert (=> b!2086 (= lt!1602 lt!1613)))

(declare-fun head!7 (List!8) Bool)

(assert (=> b!2086 (= (head!7 (byteArrayBitContentToList!0 (_2!71 lt!1629) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!7 (bitStreamReadBitsIntoList!0 (_2!71 lt!1629) (_1!73 lt!1627) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1608 () Unit!89)

(declare-fun Unit!106 () Unit!89)

(assert (=> b!2086 (= lt!1608 Unit!106)))

(assert (=> b!2086 (= lt!1609 (appendBitsMSBFirstLoop!0 (_2!71 lt!1629) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!1618 () Unit!89)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!134 BitStream!134 BitStream!134) Unit!89)

(assert (=> b!2086 (= lt!1618 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!71 lt!1629) (_2!71 lt!1609)))))

(declare-fun isPrefixOf!0 (BitStream!134 BitStream!134) Bool)

(assert (=> b!2086 (isPrefixOf!0 thiss!1486 (_2!71 lt!1609))))

(declare-fun lt!1636 () Unit!89)

(assert (=> b!2086 (= lt!1636 lt!1618)))

(assert (=> b!2086 (= (size!78 (buf!387 (_2!71 lt!1609))) (size!78 (buf!387 thiss!1486)))))

(declare-fun lt!1607 () Unit!89)

(declare-fun Unit!107 () Unit!89)

(assert (=> b!2086 (= lt!1607 Unit!107)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2086 (= (bitIndex!0 (size!78 (buf!387 (_2!71 lt!1609))) (currentByte!1336 (_2!71 lt!1609)) (currentBit!1331 (_2!71 lt!1609))) (bvsub (bvadd (bitIndex!0 (size!78 (buf!387 thiss!1486)) (currentByte!1336 thiss!1486) (currentBit!1331 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!1624 () Unit!89)

(declare-fun Unit!108 () Unit!89)

(assert (=> b!2086 (= lt!1624 Unit!108)))

(assert (=> b!2086 (= (bitIndex!0 (size!78 (buf!387 (_2!71 lt!1609))) (currentByte!1336 (_2!71 lt!1609)) (currentBit!1331 (_2!71 lt!1609))) (bvsub (bvsub (bvadd (bitIndex!0 (size!78 (buf!387 (_2!71 lt!1629))) (currentByte!1336 (_2!71 lt!1629)) (currentBit!1331 (_2!71 lt!1629))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!1606 () Unit!89)

(declare-fun Unit!109 () Unit!89)

(assert (=> b!2086 (= lt!1606 Unit!109)))

(declare-fun lt!1628 () tuple2!132)

(assert (=> b!2086 (= lt!1628 (reader!0 thiss!1486 (_2!71 lt!1609)))))

(declare-fun lt!1623 () (_ BitVec 64))

(assert (=> b!2086 (= lt!1623 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1634 () Unit!89)

(assert (=> b!2086 (= lt!1634 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!387 (_2!71 lt!1609)) lt!1623))))

(assert (=> b!2086 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 (_2!71 lt!1609)))) ((_ sign_extend 32) (currentByte!1336 thiss!1486)) ((_ sign_extend 32) (currentBit!1331 thiss!1486)) lt!1623)))

(declare-fun lt!1626 () Unit!89)

(assert (=> b!2086 (= lt!1626 lt!1634)))

(declare-fun lt!1622 () tuple2!132)

(assert (=> b!2086 (= lt!1622 (reader!0 (_2!71 lt!1629) (_2!71 lt!1609)))))

(declare-fun lt!1611 () (_ BitVec 64))

(assert (=> b!2086 (= lt!1611 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!1625 () Unit!89)

(assert (=> b!2086 (= lt!1625 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!71 lt!1629) (buf!387 (_2!71 lt!1609)) lt!1611))))

(assert (=> b!2086 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 (_2!71 lt!1609)))) ((_ sign_extend 32) (currentByte!1336 (_2!71 lt!1629))) ((_ sign_extend 32) (currentBit!1331 (_2!71 lt!1629))) lt!1611)))

(declare-fun lt!1638 () Unit!89)

(assert (=> b!2086 (= lt!1638 lt!1625)))

(declare-fun lt!1599 () List!8)

(assert (=> b!2086 (= lt!1599 (byteArrayBitContentToList!0 (_2!71 lt!1609) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!1610 () List!8)

(assert (=> b!2086 (= lt!1610 (byteArrayBitContentToList!0 (_2!71 lt!1609) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1600 () List!8)

(assert (=> b!2086 (= lt!1600 (bitStreamReadBitsIntoList!0 (_2!71 lt!1609) (_1!73 lt!1628) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!1596 () List!8)

(assert (=> b!2086 (= lt!1596 (bitStreamReadBitsIntoList!0 (_2!71 lt!1609) (_1!73 lt!1622) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!1632 () (_ BitVec 64))

(assert (=> b!2086 (= lt!1632 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!1614 () Unit!89)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!134 BitStream!134 BitStream!134 BitStream!134 (_ BitVec 64) List!8) Unit!89)

(assert (=> b!2086 (= lt!1614 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!71 lt!1609) (_2!71 lt!1609) (_1!73 lt!1628) (_1!73 lt!1622) lt!1632 lt!1600))))

(declare-fun tail!15 (List!8) List!8)

(assert (=> b!2086 (= (bitStreamReadBitsIntoList!0 (_2!71 lt!1609) (_1!73 lt!1622) (bvsub lt!1632 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!15 lt!1600))))

(declare-fun lt!1619 () Unit!89)

(assert (=> b!2086 (= lt!1619 lt!1614)))

(declare-fun lt!1635 () (_ BitVec 64))

(declare-fun lt!1621 () Unit!89)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!196 array!196 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!89)

(assert (=> b!2086 (= lt!1621 (arrayBitRangesEqImpliesEq!0 (buf!387 (_2!71 lt!1629)) (buf!387 (_2!71 lt!1609)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!1635 (bitIndex!0 (size!78 (buf!387 (_2!71 lt!1629))) (currentByte!1336 (_2!71 lt!1629)) (currentBit!1331 (_2!71 lt!1629)))))))

(declare-fun bitAt!0 (array!196 (_ BitVec 64)) Bool)

(assert (=> b!2086 (= (bitAt!0 (buf!387 (_2!71 lt!1629)) lt!1635) (bitAt!0 (buf!387 (_2!71 lt!1609)) lt!1635))))

(declare-fun lt!1631 () Unit!89)

(assert (=> b!2086 (= lt!1631 lt!1621)))

(declare-fun c!96 () Bool)

(declare-fun bm!6 () Bool)

(assert (=> bm!6 (= call!9 (reader!0 thiss!1486 (ite c!96 (_2!71 lt!1629) thiss!1486)))))

(declare-fun b!2088 () Bool)

(assert (=> b!2088 (= e!1477 (validate_offset_bits!1 ((_ sign_extend 32) (size!78 (buf!387 thiss!1486))) ((_ sign_extend 32) (currentByte!1336 thiss!1486)) ((_ sign_extend 32) (currentBit!1331 thiss!1486)) lt!1617))))

(declare-fun b!2089 () Bool)

(declare-fun res!3854 () Bool)

(assert (=> b!2089 (=> (not res!3854) (not e!1476))))

(assert (=> b!2089 (= res!3854 (= (size!78 (buf!387 (_2!71 lt!1633))) (size!78 (buf!387 thiss!1486))))))

(declare-fun b!2090 () Bool)

(declare-fun res!3852 () Bool)

(assert (=> b!2090 (=> (not res!3852) (not e!1476))))

(assert (=> b!2090 (= res!3852 (invariant!0 (currentBit!1331 (_2!71 lt!1633)) (currentByte!1336 (_2!71 lt!1633)) (size!78 (buf!387 (_2!71 lt!1633)))))))

(declare-fun d!1360 () Bool)

(assert (=> d!1360 e!1476))

(declare-fun res!3855 () Bool)

(assert (=> d!1360 (=> (not res!3855) (not e!1476))))

(declare-fun lt!1616 () (_ BitVec 64))

(assert (=> d!1360 (= res!3855 (= (bitIndex!0 (size!78 (buf!387 (_2!71 lt!1633))) (currentByte!1336 (_2!71 lt!1633)) (currentBit!1331 (_2!71 lt!1633))) (bvsub lt!1616 from!367)))))

(assert (=> d!1360 (or (= (bvand lt!1616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1616 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!1598 () (_ BitVec 64))

(assert (=> d!1360 (= lt!1616 (bvadd lt!1598 from!367 nBits!460))))

(assert (=> d!1360 (or (not (= (bvand lt!1598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!1598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!1598 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1360 (= lt!1598 (bitIndex!0 (size!78 (buf!387 thiss!1486)) (currentByte!1336 thiss!1486) (currentBit!1331 thiss!1486)))))

(assert (=> d!1360 (= lt!1633 e!1478)))

(assert (=> d!1360 (= c!96 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!1605 () Unit!89)

(declare-fun lt!1620 () Unit!89)

(assert (=> d!1360 (= lt!1605 lt!1620)))

(assert (=> d!1360 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!134) Unit!89)

(assert (=> d!1360 (= lt!1620 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1360 (= lt!1635 (bitIndex!0 (size!78 (buf!387 thiss!1486)) (currentByte!1336 thiss!1486) (currentBit!1331 thiss!1486)))))

(assert (=> d!1360 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1360 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!1633)))

(declare-fun b!2087 () Bool)

(declare-fun res!3851 () Bool)

(assert (=> b!2087 (=> (not res!3851) (not e!1476))))

(assert (=> b!2087 (= res!3851 (isPrefixOf!0 thiss!1486 (_2!71 lt!1633)))))

(assert (= (and d!1360 c!96) b!2086))

(assert (= (and d!1360 (not c!96)) b!2084))

(assert (= (or b!2086 b!2084) bm!6))

(assert (= (and d!1360 res!3855) b!2090))

(assert (= (and b!2090 res!3852) b!2083))

(assert (= (and b!2083 res!3853) b!2087))

(assert (= (and b!2087 res!3851) b!2089))

(assert (= (and b!2089 res!3854) b!2085))

(assert (= (and b!2085 res!3856) b!2088))

(declare-fun m!1480 () Bool)

(assert (=> b!2085 m!1480))

(declare-fun m!1485 () Bool)

(assert (=> b!2085 m!1485))

(declare-fun m!1493 () Bool)

(assert (=> b!2085 m!1493))

(declare-fun m!1497 () Bool)

(assert (=> b!2085 m!1497))

(declare-fun m!1504 () Bool)

(assert (=> b!2085 m!1504))

(declare-fun m!1511 () Bool)

(assert (=> b!2090 m!1511))

(declare-fun m!1517 () Bool)

(assert (=> bm!6 m!1517))

(declare-fun m!1525 () Bool)

(assert (=> b!2088 m!1525))

(declare-fun m!1531 () Bool)

(assert (=> b!2087 m!1531))

(declare-fun m!1537 () Bool)

(assert (=> b!2084 m!1537))

(declare-fun m!1543 () Bool)

(assert (=> b!2084 m!1543))

(declare-fun m!1549 () Bool)

(assert (=> b!2086 m!1549))

(declare-fun m!1554 () Bool)

(assert (=> b!2086 m!1554))

(declare-fun m!1559 () Bool)

(assert (=> b!2086 m!1559))

(declare-fun m!1566 () Bool)

(assert (=> b!2086 m!1566))

(declare-fun m!1571 () Bool)

(assert (=> b!2086 m!1571))

(declare-fun m!1577 () Bool)

(assert (=> b!2086 m!1577))

(declare-fun m!1584 () Bool)

(assert (=> b!2086 m!1584))

(declare-fun m!1589 () Bool)

(assert (=> b!2086 m!1589))

(declare-fun m!1597 () Bool)

(assert (=> b!2086 m!1597))

(declare-fun m!1601 () Bool)

(assert (=> b!2086 m!1601))

(declare-fun m!1606 () Bool)

(assert (=> b!2086 m!1606))

(declare-fun m!1609 () Bool)

(assert (=> b!2086 m!1609))

(declare-fun m!1615 () Bool)

(assert (=> b!2086 m!1615))

(assert (=> b!2086 m!1597))

(declare-fun m!1622 () Bool)

(assert (=> b!2086 m!1622))

(declare-fun m!1629 () Bool)

(assert (=> b!2086 m!1629))

(assert (=> b!2086 m!1584))

(declare-fun m!1637 () Bool)

(assert (=> b!2086 m!1637))

(declare-fun m!1645 () Bool)

(assert (=> b!2086 m!1645))

(declare-fun m!1651 () Bool)

(assert (=> b!2086 m!1651))

(declare-fun m!1656 () Bool)

(assert (=> b!2086 m!1656))

(declare-fun m!1662 () Bool)

(assert (=> b!2086 m!1662))

(declare-fun m!1667 () Bool)

(assert (=> b!2086 m!1667))

(assert (=> b!2086 m!1606))

