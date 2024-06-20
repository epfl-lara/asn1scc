; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1694 () Bool)

(assert start!1694)

(declare-fun b!8177 () Bool)

(declare-fun e!5110 () Bool)

(declare-datatypes ((array!543 0))(
  ( (array!544 (arr!640 (Array (_ BitVec 32) (_ BitVec 8))) (size!235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!448 0))(
  ( (BitStream!449 (buf!571 array!543) (currentByte!1586 (_ BitVec 32)) (currentBit!1581 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!448)

(declare-datatypes ((Unit!661 0))(
  ( (Unit!662) )
))
(declare-datatypes ((tuple2!1102 0))(
  ( (tuple2!1103 (_1!582 Unit!661) (_2!582 BitStream!448)) )
))
(declare-fun lt!11144 () tuple2!1102)

(assert (=> b!8177 (= e!5110 (not (= (size!235 (buf!571 thiss!1486)) (size!235 (buf!571 (_2!582 lt!11144))))))))

(declare-fun b!8178 () Bool)

(declare-fun e!5111 () Bool)

(declare-fun array_inv!230 (array!543) Bool)

(assert (=> b!8178 (= e!5111 (array_inv!230 (buf!571 thiss!1486)))))

(declare-fun b!8176 () Bool)

(declare-fun e!5112 () Bool)

(assert (=> b!8176 (= e!5112 e!5110)))

(declare-fun res!8773 () Bool)

(assert (=> b!8176 (=> (not res!8773) (not e!5110))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8176 (= res!8773 (invariant!0 (currentBit!1581 (_2!582 lt!11144)) (currentByte!1586 (_2!582 lt!11144)) (size!235 (buf!571 (_2!582 lt!11144)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!543)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!448 array!543 (_ BitVec 64) (_ BitVec 64)) tuple2!1102)

(assert (=> b!8176 (= lt!11144 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8175 () Bool)

(declare-fun res!8772 () Bool)

(assert (=> b!8175 (=> (not res!8772) (not e!5112))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8175 (= res!8772 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 thiss!1486))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486)) nBits!460))))

(declare-fun res!8771 () Bool)

(assert (=> start!1694 (=> (not res!8771) (not e!5112))))

(assert (=> start!1694 (= res!8771 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!235 srcBuffer!6))))))))

(assert (=> start!1694 e!5112))

(assert (=> start!1694 true))

(assert (=> start!1694 (array_inv!230 srcBuffer!6)))

(declare-fun inv!12 (BitStream!448) Bool)

(assert (=> start!1694 (and (inv!12 thiss!1486) e!5111)))

(assert (= (and start!1694 res!8771) b!8175))

(assert (= (and b!8175 res!8772) b!8176))

(assert (= (and b!8176 res!8773) b!8177))

(assert (= start!1694 b!8178))

(declare-fun m!10767 () Bool)

(assert (=> b!8178 m!10767))

(declare-fun m!10769 () Bool)

(assert (=> b!8176 m!10769))

(declare-fun m!10771 () Bool)

(assert (=> b!8176 m!10771))

(declare-fun m!10773 () Bool)

(assert (=> b!8175 m!10773))

(declare-fun m!10775 () Bool)

(assert (=> start!1694 m!10775))

(declare-fun m!10777 () Bool)

(assert (=> start!1694 m!10777))

(push 1)

(assert (not b!8175))

(assert (not start!1694))

(assert (not b!8176))

(assert (not b!8178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2400 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2400 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 thiss!1486))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!235 (buf!571 thiss!1486))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486))) nBits!460))))

(declare-fun bs!821 () Bool)

(assert (= bs!821 d!2400))

(declare-fun m!10803 () Bool)

(assert (=> bs!821 m!10803))

(assert (=> b!8175 d!2400))

(declare-fun d!2402 () Bool)

(assert (=> d!2402 (= (array_inv!230 srcBuffer!6) (bvsge (size!235 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1694 d!2402))

(declare-fun d!2406 () Bool)

(assert (=> d!2406 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1581 thiss!1486) (currentByte!1586 thiss!1486) (size!235 (buf!571 thiss!1486))))))

(declare-fun bs!822 () Bool)

(assert (= bs!822 d!2406))

(declare-fun m!10805 () Bool)

(assert (=> bs!822 m!10805))

(assert (=> start!1694 d!2406))

(declare-fun d!2408 () Bool)

(assert (=> d!2408 (= (invariant!0 (currentBit!1581 (_2!582 lt!11144)) (currentByte!1586 (_2!582 lt!11144)) (size!235 (buf!571 (_2!582 lt!11144)))) (and (bvsge (currentBit!1581 (_2!582 lt!11144)) #b00000000000000000000000000000000) (bvslt (currentBit!1581 (_2!582 lt!11144)) #b00000000000000000000000000001000) (bvsge (currentByte!1586 (_2!582 lt!11144)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1586 (_2!582 lt!11144)) (size!235 (buf!571 (_2!582 lt!11144)))) (and (= (currentBit!1581 (_2!582 lt!11144)) #b00000000000000000000000000000000) (= (currentByte!1586 (_2!582 lt!11144)) (size!235 (buf!571 (_2!582 lt!11144))))))))))

(assert (=> b!8176 d!2408))

(declare-fun bm!107 () Bool)

(declare-fun c!455 () Bool)

(declare-fun lt!11525 () tuple2!1102)

(declare-datatypes ((tuple2!1114 0))(
  ( (tuple2!1115 (_1!588 BitStream!448) (_2!588 BitStream!448)) )
))
(declare-fun call!110 () tuple2!1114)

(declare-fun reader!0 (BitStream!448 BitStream!448) tuple2!1114)

(assert (=> bm!107 (= call!110 (reader!0 thiss!1486 (ite c!455 (_2!582 lt!11525) thiss!1486)))))

(declare-fun b!8267 () Bool)

(declare-fun res!8840 () Bool)

(declare-fun e!5170 () Bool)

(assert (=> b!8267 (=> (not res!8840) (not e!5170))))

(declare-fun lt!11537 () tuple2!1102)

(assert (=> b!8267 (= res!8840 (invariant!0 (currentBit!1581 (_2!582 lt!11537)) (currentByte!1586 (_2!582 lt!11537)) (size!235 (buf!571 (_2!582 lt!11537)))))))

(declare-fun b!8268 () Bool)

(declare-fun e!5169 () tuple2!1102)

(declare-fun lt!11522 () tuple2!1102)

(declare-fun Unit!674 () Unit!661)

(assert (=> b!8268 (= e!5169 (tuple2!1103 Unit!674 (_2!582 lt!11522)))))

(declare-fun appendBitFromByte!0 (BitStream!448 (_ BitVec 8) (_ BitVec 32)) tuple2!1102)

(assert (=> b!8268 (= lt!11525 (appendBitFromByte!0 thiss!1486 (select (arr!640 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11542 () (_ BitVec 64))

(assert (=> b!8268 (= lt!11542 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11512 () (_ BitVec 64))

(assert (=> b!8268 (= lt!11512 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11533 () Unit!661)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!448 BitStream!448 (_ BitVec 64) (_ BitVec 64)) Unit!661)

(assert (=> b!8268 (= lt!11533 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!582 lt!11525) lt!11542 lt!11512))))

(assert (=> b!8268 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 (_2!582 lt!11525)))) ((_ sign_extend 32) (currentByte!1586 (_2!582 lt!11525))) ((_ sign_extend 32) (currentBit!1581 (_2!582 lt!11525))) (bvsub lt!11542 lt!11512))))

(declare-fun lt!11519 () Unit!661)

(assert (=> b!8268 (= lt!11519 lt!11533)))

(declare-fun lt!11540 () tuple2!1114)

(assert (=> b!8268 (= lt!11540 call!110)))

(declare-fun lt!11536 () (_ BitVec 64))

(assert (=> b!8268 (= lt!11536 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11539 () Unit!661)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!448 array!543 (_ BitVec 64)) Unit!661)

(assert (=> b!8268 (= lt!11539 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!571 (_2!582 lt!11525)) lt!11536))))

(assert (=> b!8268 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 (_2!582 lt!11525)))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486)) lt!11536)))

(declare-fun lt!11534 () Unit!661)

(assert (=> b!8268 (= lt!11534 lt!11539)))

(declare-datatypes ((List!134 0))(
  ( (Nil!131) (Cons!130 (h!249 Bool) (t!884 List!134)) )
))
(declare-fun head!39 (List!134) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!448 array!543 (_ BitVec 64) (_ BitVec 64)) List!134)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!448 BitStream!448 (_ BitVec 64)) List!134)

(assert (=> b!8268 (= (head!39 (byteArrayBitContentToList!0 (_2!582 lt!11525) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!39 (bitStreamReadBitsIntoList!0 (_2!582 lt!11525) (_1!588 lt!11540) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11544 () Unit!661)

(declare-fun Unit!676 () Unit!661)

(assert (=> b!8268 (= lt!11544 Unit!676)))

(assert (=> b!8268 (= lt!11522 (appendBitsMSBFirstLoop!0 (_2!582 lt!11525) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11543 () Unit!661)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!448 BitStream!448 BitStream!448) Unit!661)

(assert (=> b!8268 (= lt!11543 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!582 lt!11525) (_2!582 lt!11522)))))

(declare-fun isPrefixOf!0 (BitStream!448 BitStream!448) Bool)

(assert (=> b!8268 (isPrefixOf!0 thiss!1486 (_2!582 lt!11522))))

(declare-fun lt!11520 () Unit!661)

(assert (=> b!8268 (= lt!11520 lt!11543)))

(assert (=> b!8268 (= (size!235 (buf!571 (_2!582 lt!11522))) (size!235 (buf!571 thiss!1486)))))

(declare-fun lt!11504 () Unit!661)

(declare-fun Unit!677 () Unit!661)

(assert (=> b!8268 (= lt!11504 Unit!677)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8268 (= (bitIndex!0 (size!235 (buf!571 (_2!582 lt!11522))) (currentByte!1586 (_2!582 lt!11522)) (currentBit!1581 (_2!582 lt!11522))) (bvsub (bvadd (bitIndex!0 (size!235 (buf!571 thiss!1486)) (currentByte!1586 thiss!1486) (currentBit!1581 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11511 () Unit!661)

(declare-fun Unit!679 () Unit!661)

(assert (=> b!8268 (= lt!11511 Unit!679)))

(assert (=> b!8268 (= (bitIndex!0 (size!235 (buf!571 (_2!582 lt!11522))) (currentByte!1586 (_2!582 lt!11522)) (currentBit!1581 (_2!582 lt!11522))) (bvsub (bvsub (bvadd (bitIndex!0 (size!235 (buf!571 (_2!582 lt!11525))) (currentByte!1586 (_2!582 lt!11525)) (currentBit!1581 (_2!582 lt!11525))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11521 () Unit!661)

(declare-fun Unit!680 () Unit!661)

(assert (=> b!8268 (= lt!11521 Unit!680)))

(declare-fun lt!11546 () tuple2!1114)

(assert (=> b!8268 (= lt!11546 (reader!0 thiss!1486 (_2!582 lt!11522)))))

(declare-fun lt!11528 () (_ BitVec 64))

(assert (=> b!8268 (= lt!11528 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11524 () Unit!661)

(assert (=> b!8268 (= lt!11524 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!571 (_2!582 lt!11522)) lt!11528))))

(assert (=> b!8268 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 (_2!582 lt!11522)))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486)) lt!11528)))

(declare-fun lt!11545 () Unit!661)

(assert (=> b!8268 (= lt!11545 lt!11524)))

(declare-fun lt!11509 () tuple2!1114)

(assert (=> b!8268 (= lt!11509 (reader!0 (_2!582 lt!11525) (_2!582 lt!11522)))))

(declare-fun lt!11518 () (_ BitVec 64))

(assert (=> b!8268 (= lt!11518 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11530 () Unit!661)

(assert (=> b!8268 (= lt!11530 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!582 lt!11525) (buf!571 (_2!582 lt!11522)) lt!11518))))

(assert (=> b!8268 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 (_2!582 lt!11522)))) ((_ sign_extend 32) (currentByte!1586 (_2!582 lt!11525))) ((_ sign_extend 32) (currentBit!1581 (_2!582 lt!11525))) lt!11518)))

(declare-fun lt!11514 () Unit!661)

(assert (=> b!8268 (= lt!11514 lt!11530)))

(declare-fun lt!11516 () List!134)

(assert (=> b!8268 (= lt!11516 (byteArrayBitContentToList!0 (_2!582 lt!11522) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11506 () List!134)

(assert (=> b!8268 (= lt!11506 (byteArrayBitContentToList!0 (_2!582 lt!11522) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11517 () List!134)

(assert (=> b!8268 (= lt!11517 (bitStreamReadBitsIntoList!0 (_2!582 lt!11522) (_1!588 lt!11546) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11529 () List!134)

(assert (=> b!8268 (= lt!11529 (bitStreamReadBitsIntoList!0 (_2!582 lt!11522) (_1!588 lt!11509) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11531 () (_ BitVec 64))

(assert (=> b!8268 (= lt!11531 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11526 () Unit!661)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!448 BitStream!448 BitStream!448 BitStream!448 (_ BitVec 64) List!134) Unit!661)

(assert (=> b!8268 (= lt!11526 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!582 lt!11522) (_2!582 lt!11522) (_1!588 lt!11546) (_1!588 lt!11509) lt!11531 lt!11517))))

(declare-fun tail!47 (List!134) List!134)

(assert (=> b!8268 (= (bitStreamReadBitsIntoList!0 (_2!582 lt!11522) (_1!588 lt!11509) (bvsub lt!11531 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!47 lt!11517))))

(declare-fun lt!11532 () Unit!661)

(assert (=> b!8268 (= lt!11532 lt!11526)))

(declare-fun lt!11527 () (_ BitVec 64))

(declare-fun lt!11507 () Unit!661)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!543 array!543 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!661)

(assert (=> b!8268 (= lt!11507 (arrayBitRangesEqImpliesEq!0 (buf!571 (_2!582 lt!11525)) (buf!571 (_2!582 lt!11522)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11527 (bitIndex!0 (size!235 (buf!571 (_2!582 lt!11525))) (currentByte!1586 (_2!582 lt!11525)) (currentBit!1581 (_2!582 lt!11525)))))))

(declare-fun bitAt!0 (array!543 (_ BitVec 64)) Bool)

(assert (=> b!8268 (= (bitAt!0 (buf!571 (_2!582 lt!11525)) lt!11527) (bitAt!0 (buf!571 (_2!582 lt!11522)) lt!11527))))

(declare-fun lt!11510 () Unit!661)

(assert (=> b!8268 (= lt!11510 lt!11507)))

(declare-fun b!8269 () Bool)

(declare-fun lt!11523 () tuple2!1114)

(assert (=> b!8269 (= e!5170 (= (bitStreamReadBitsIntoList!0 (_2!582 lt!11537) (_1!588 lt!11523) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!582 lt!11537) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8269 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8269 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11505 () Unit!661)

(declare-fun lt!11515 () Unit!661)

(assert (=> b!8269 (= lt!11505 lt!11515)))

(declare-fun lt!11508 () (_ BitVec 64))

(assert (=> b!8269 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 (_2!582 lt!11537)))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486)) lt!11508)))

(assert (=> b!8269 (= lt!11515 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!571 (_2!582 lt!11537)) lt!11508))))

(declare-fun e!5171 () Bool)

(assert (=> b!8269 e!5171))

(declare-fun res!8844 () Bool)

(assert (=> b!8269 (=> (not res!8844) (not e!5171))))

(assert (=> b!8269 (= res!8844 (and (= (size!235 (buf!571 thiss!1486)) (size!235 (buf!571 (_2!582 lt!11537)))) (bvsge lt!11508 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8269 (= lt!11508 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8269 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8269 (= lt!11523 (reader!0 thiss!1486 (_2!582 lt!11537)))))

(declare-fun b!8270 () Bool)

(declare-fun res!8841 () Bool)

(assert (=> b!8270 (=> (not res!8841) (not e!5170))))

(assert (=> b!8270 (= res!8841 (= (size!235 (buf!571 thiss!1486)) (size!235 (buf!571 (_2!582 lt!11537)))))))

(declare-fun b!8271 () Bool)

(declare-fun res!8845 () Bool)

(assert (=> b!8271 (=> (not res!8845) (not e!5170))))

(assert (=> b!8271 (= res!8845 (isPrefixOf!0 thiss!1486 (_2!582 lt!11537)))))

(declare-fun b!8272 () Bool)

(declare-fun res!8843 () Bool)

(assert (=> b!8272 (=> (not res!8843) (not e!5170))))

(assert (=> b!8272 (= res!8843 (= (size!235 (buf!571 (_2!582 lt!11537))) (size!235 (buf!571 thiss!1486))))))

(declare-fun d!2412 () Bool)

(assert (=> d!2412 e!5170))

(declare-fun res!8842 () Bool)

(assert (=> d!2412 (=> (not res!8842) (not e!5170))))

(declare-fun lt!11535 () (_ BitVec 64))

(assert (=> d!2412 (= res!8842 (= (bitIndex!0 (size!235 (buf!571 (_2!582 lt!11537))) (currentByte!1586 (_2!582 lt!11537)) (currentBit!1581 (_2!582 lt!11537))) (bvsub lt!11535 from!367)))))

(assert (=> d!2412 (or (= (bvand lt!11535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11535 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11541 () (_ BitVec 64))

(assert (=> d!2412 (= lt!11535 (bvadd lt!11541 from!367 nBits!460))))

(assert (=> d!2412 (or (not (= (bvand lt!11541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11541 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2412 (= lt!11541 (bitIndex!0 (size!235 (buf!571 thiss!1486)) (currentByte!1586 thiss!1486) (currentBit!1581 thiss!1486)))))

(assert (=> d!2412 (= lt!11537 e!5169)))

(assert (=> d!2412 (= c!455 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11513 () Unit!661)

(declare-fun lt!11538 () Unit!661)

(assert (=> d!2412 (= lt!11513 lt!11538)))

(assert (=> d!2412 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!448) Unit!661)

(assert (=> d!2412 (= lt!11538 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2412 (= lt!11527 (bitIndex!0 (size!235 (buf!571 thiss!1486)) (currentByte!1586 thiss!1486) (currentBit!1581 thiss!1486)))))

(assert (=> d!2412 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2412 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11537)))

(declare-fun b!8273 () Bool)

(assert (=> b!8273 (= e!5171 (validate_offset_bits!1 ((_ sign_extend 32) (size!235 (buf!571 thiss!1486))) ((_ sign_extend 32) (currentByte!1586 thiss!1486)) ((_ sign_extend 32) (currentBit!1581 thiss!1486)) lt!11508))))

(declare-fun b!8274 () Bool)

(declare-fun Unit!684 () Unit!661)

(assert (=> b!8274 (= e!5169 (tuple2!1103 Unit!684 thiss!1486))))

(assert (=> b!8274 (= (size!235 (buf!571 thiss!1486)) (size!235 (buf!571 thiss!1486)))))

(declare-fun lt!11503 () Unit!661)

(declare-fun Unit!685 () Unit!661)

(assert (=> b!8274 (= lt!11503 Unit!685)))

(declare-fun checkByteArrayBitContent!0 (BitStream!448 array!543 array!543 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1116 0))(
  ( (tuple2!1117 (_1!589 array!543) (_2!589 BitStream!448)) )
))
(declare-fun readBits!0 (BitStream!448 (_ BitVec 64)) tuple2!1116)

(assert (=> b!8274 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!589 (readBits!0 (_1!588 call!110) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (= (and d!2412 c!455) b!8268))

(assert (= (and d!2412 (not c!455)) b!8274))

(assert (= (or b!8268 b!8274) bm!107))

(assert (= (and d!2412 res!8842) b!8267))

(assert (= (and b!8267 res!8840) b!8270))

(assert (= (and b!8270 res!8841) b!8271))

(assert (= (and b!8271 res!8845) b!8272))

(assert (= (and b!8272 res!8843) b!8269))

(assert (= (and b!8269 res!8844) b!8273))

(declare-fun m!10999 () Bool)

(assert (=> b!8269 m!10999))

(declare-fun m!11001 () Bool)

(assert (=> b!8269 m!11001))

(declare-fun m!11003 () Bool)

(assert (=> b!8269 m!11003))

(declare-fun m!11005 () Bool)

(assert (=> b!8269 m!11005))

(declare-fun m!11007 () Bool)

(assert (=> b!8269 m!11007))

(declare-fun m!11009 () Bool)

(assert (=> bm!107 m!11009))

(declare-fun m!11011 () Bool)

(assert (=> b!8273 m!11011))

(declare-fun m!11013 () Bool)

(assert (=> b!8271 m!11013))

(declare-fun m!11015 () Bool)

(assert (=> b!8267 m!11015))

(declare-fun m!11017 () Bool)

(assert (=> b!8268 m!11017))

(declare-fun m!11019 () Bool)

(assert (=> b!8268 m!11019))

(declare-fun m!11021 () Bool)

(assert (=> b!8268 m!11021))

(declare-fun m!11023 () Bool)

(assert (=> b!8268 m!11023))

(declare-fun m!11025 () Bool)

(assert (=> b!8268 m!11025))

(declare-fun m!11027 () Bool)

(assert (=> b!8268 m!11027))

(assert (=> b!8268 m!11019))

(declare-fun m!11029 () Bool)

(assert (=> b!8268 m!11029))

(declare-fun m!11031 () Bool)

(assert (=> b!8268 m!11031))

(declare-fun m!11033 () Bool)

(assert (=> b!8268 m!11033))

(declare-fun m!11035 () Bool)

(assert (=> b!8268 m!11035))

(declare-fun m!11037 () Bool)

(assert (=> b!8268 m!11037))

(declare-fun m!11039 () Bool)

(assert (=> b!8268 m!11039))

(assert (=> b!8268 m!11035))

(declare-fun m!11041 () Bool)

(assert (=> b!8268 m!11041))

(declare-fun m!11043 () Bool)

(assert (=> b!8268 m!11043))

(declare-fun m!11045 () Bool)

(assert (=> b!8268 m!11045))

(declare-fun m!11047 () Bool)

(assert (=> b!8268 m!11047))

(declare-fun m!11049 () Bool)

(assert (=> b!8268 m!11049))

(declare-fun m!11051 () Bool)

(assert (=> b!8268 m!11051))

(assert (=> b!8268 m!11043))

(declare-fun m!11053 () Bool)

(assert (=> b!8268 m!11053))

(declare-fun m!11055 () Bool)

(assert (=> b!8268 m!11055))

(declare-fun m!11057 () Bool)

(assert (=> b!8268 m!11057))

(declare-fun m!11059 () Bool)

(assert (=> b!8268 m!11059))

(declare-fun m!11061 () Bool)

(assert (=> b!8268 m!11061))

(declare-fun m!11063 () Bool)

(assert (=> b!8268 m!11063))

(declare-fun m!11065 () Bool)

(assert (=> b!8268 m!11065))

(assert (=> b!8268 m!11027))

(declare-fun m!11067 () Bool)

(assert (=> b!8268 m!11067))

(declare-fun m!11069 () Bool)

(assert (=> b!8268 m!11069))

(declare-fun m!11071 () Bool)

(assert (=> b!8268 m!11071))

(declare-fun m!11073 () Bool)

(assert (=> b!8268 m!11073))

(declare-fun m!11075 () Bool)

(assert (=> b!8268 m!11075))

(declare-fun m!11077 () Bool)

(assert (=> b!8268 m!11077))

(declare-fun m!11079 () Bool)

(assert (=> b!8268 m!11079))

(declare-fun m!11081 () Bool)

(assert (=> b!8274 m!11081))

(declare-fun m!11083 () Bool)

(assert (=> b!8274 m!11083))

(declare-fun m!11085 () Bool)

(assert (=> d!2412 m!11085))

(assert (=> d!2412 m!11023))

(declare-fun m!11087 () Bool)

(assert (=> d!2412 m!11087))

(declare-fun m!11089 () Bool)

(assert (=> d!2412 m!11089))

(assert (=> b!8176 d!2412))

(declare-fun d!2432 () Bool)

(assert (=> d!2432 (= (array_inv!230 (buf!571 thiss!1486)) (bvsge (size!235 (buf!571 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8178 d!2432))

(push 1)

(assert (not b!8273))

(assert (not b!8268))

(assert (not b!8271))

(assert (not d!2400))

(assert (not b!8269))

(assert (not b!8267))

(assert (not d!2406))

(assert (not bm!107))

(assert (not d!2412))

(assert (not b!8274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

