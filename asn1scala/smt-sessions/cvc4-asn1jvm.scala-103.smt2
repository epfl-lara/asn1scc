; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2580 () Bool)

(assert start!2580)

(declare-fun b!12324 () Bool)

(declare-fun e!7495 () Bool)

(declare-fun e!7493 () Bool)

(assert (=> b!12324 (= e!7495 e!7493)))

(declare-fun res!11831 () Bool)

(assert (=> b!12324 (=> (not res!11831) (not e!7493))))

(declare-datatypes ((array!676 0))(
  ( (array!677 (arr!720 (Array (_ BitVec 32) (_ BitVec 8))) (size!294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!548 0))(
  ( (BitStream!549 (buf!642 array!676) (currentByte!1720 (_ BitVec 32)) (currentBit!1715 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1047 0))(
  ( (Unit!1048) )
))
(declare-datatypes ((tuple2!1438 0))(
  ( (tuple2!1439 (_1!771 Unit!1047) (_2!771 BitStream!548)) )
))
(declare-fun lt!19732 () tuple2!1438)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12324 (= res!11831 (invariant!0 (currentBit!1715 (_2!771 lt!19732)) (currentByte!1720 (_2!771 lt!19732)) (size!294 (buf!642 (_2!771 lt!19732)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!676)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!548)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!548 array!676 (_ BitVec 64) (_ BitVec 64)) tuple2!1438)

(assert (=> b!12324 (= lt!19732 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12325 () Bool)

(declare-fun e!7496 () Bool)

(declare-fun array_inv!283 (array!676) Bool)

(assert (=> b!12325 (= e!7496 (array_inv!283 (buf!642 thiss!1486)))))

(declare-fun b!12326 () Bool)

(declare-fun res!11830 () Bool)

(assert (=> b!12326 (=> (not res!11830) (not e!7493))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12326 (= res!11830 (= (bitIndex!0 (size!294 (buf!642 (_2!771 lt!19732))) (currentByte!1720 (_2!771 lt!19732)) (currentBit!1715 (_2!771 lt!19732))) (bvadd (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)) nBits!460)))))

(declare-fun b!12327 () Bool)

(declare-fun e!7499 () Bool)

(assert (=> b!12327 (= e!7493 (not e!7499))))

(declare-fun res!11833 () Bool)

(assert (=> b!12327 (=> res!11833 e!7499)))

(declare-datatypes ((tuple2!1440 0))(
  ( (tuple2!1441 (_1!772 array!676) (_2!772 BitStream!548)) )
))
(declare-fun lt!19736 () tuple2!1440)

(declare-datatypes ((List!170 0))(
  ( (Nil!167) (Cons!166 (h!285 Bool) (t!920 List!170)) )
))
(declare-fun lt!19735 () List!170)

(declare-fun byteArrayBitContentToList!0 (BitStream!548 array!676 (_ BitVec 64) (_ BitVec 64)) List!170)

(assert (=> b!12327 (= res!11833 (not (= (byteArrayBitContentToList!0 (_2!771 lt!19732) (_1!772 lt!19736) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19735)))))

(declare-datatypes ((tuple2!1442 0))(
  ( (tuple2!1443 (_1!773 BitStream!548) (_2!773 BitStream!548)) )
))
(declare-fun lt!19731 () tuple2!1442)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!548 BitStream!548 (_ BitVec 64)) List!170)

(assert (=> b!12327 (= lt!19735 (bitStreamReadBitsIntoList!0 (_2!771 lt!19732) (_1!773 lt!19731) nBits!460))))

(declare-fun readBits!0 (BitStream!548 (_ BitVec 64)) tuple2!1440)

(assert (=> b!12327 (= lt!19736 (readBits!0 (_1!773 lt!19731) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12327 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) nBits!460)))

(declare-fun lt!19733 () Unit!1047)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!548 array!676 (_ BitVec 64)) Unit!1047)

(assert (=> b!12327 (= lt!19733 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!642 (_2!771 lt!19732)) nBits!460))))

(declare-fun reader!0 (BitStream!548 BitStream!548) tuple2!1442)

(assert (=> b!12327 (= lt!19731 (reader!0 thiss!1486 (_2!771 lt!19732)))))

(declare-fun b!12328 () Bool)

(declare-fun e!7497 () Bool)

(declare-fun inv!12 (BitStream!548) Bool)

(assert (=> b!12328 (= e!7497 (inv!12 (BitStream!549 (buf!642 (_1!773 lt!19731)) (currentByte!1720 (_2!772 lt!19736)) (currentBit!1715 (_2!772 lt!19736)))))))

(declare-fun b!12329 () Bool)

(declare-fun res!11835 () Bool)

(assert (=> b!12329 (=> (not res!11835) (not e!7495))))

(assert (=> b!12329 (= res!11835 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) nBits!460))))

(declare-fun b!12330 () Bool)

(declare-fun res!11834 () Bool)

(assert (=> b!12330 (=> (not res!11834) (not e!7493))))

(declare-fun isPrefixOf!0 (BitStream!548 BitStream!548) Bool)

(assert (=> b!12330 (= res!11834 (isPrefixOf!0 thiss!1486 (_2!771 lt!19732)))))

(declare-fun b!12331 () Bool)

(declare-fun res!11829 () Bool)

(assert (=> b!12331 (=> res!11829 e!7499)))

(assert (=> b!12331 (= res!11829 (not (= lt!19735 (byteArrayBitContentToList!0 (_2!771 lt!19732) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12332 () Bool)

(declare-fun res!11832 () Bool)

(assert (=> b!12332 (=> (not res!11832) (not e!7493))))

(assert (=> b!12332 (= res!11832 (= (size!294 (buf!642 thiss!1486)) (size!294 (buf!642 (_2!771 lt!19732)))))))

(declare-fun res!11828 () Bool)

(assert (=> start!2580 (=> (not res!11828) (not e!7495))))

(assert (=> start!2580 (= res!11828 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!294 srcBuffer!6))))))))

(assert (=> start!2580 e!7495))

(assert (=> start!2580 true))

(assert (=> start!2580 (array_inv!283 srcBuffer!6)))

(assert (=> start!2580 (and (inv!12 thiss!1486) e!7496)))

(declare-fun b!12333 () Bool)

(assert (=> b!12333 (= e!7499 e!7497)))

(declare-fun res!11836 () Bool)

(assert (=> b!12333 (=> res!11836 e!7497)))

(declare-fun checkByteArrayBitContent!0 (BitStream!548 array!676 array!676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12333 (= res!11836 (not (checkByteArrayBitContent!0 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!19734 () Unit!1047)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!548 array!676 array!676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1047)

(assert (=> b!12333 (= lt!19734 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2580 res!11828) b!12329))

(assert (= (and b!12329 res!11835) b!12324))

(assert (= (and b!12324 res!11831) b!12332))

(assert (= (and b!12332 res!11832) b!12326))

(assert (= (and b!12326 res!11830) b!12330))

(assert (= (and b!12330 res!11834) b!12327))

(assert (= (and b!12327 (not res!11833)) b!12331))

(assert (= (and b!12331 (not res!11829)) b!12333))

(assert (= (and b!12333 (not res!11836)) b!12328))

(assert (= start!2580 b!12325))

(declare-fun m!18621 () Bool)

(assert (=> b!12327 m!18621))

(declare-fun m!18623 () Bool)

(assert (=> b!12327 m!18623))

(declare-fun m!18625 () Bool)

(assert (=> b!12327 m!18625))

(declare-fun m!18627 () Bool)

(assert (=> b!12327 m!18627))

(declare-fun m!18629 () Bool)

(assert (=> b!12327 m!18629))

(declare-fun m!18631 () Bool)

(assert (=> b!12327 m!18631))

(declare-fun m!18633 () Bool)

(assert (=> b!12329 m!18633))

(declare-fun m!18635 () Bool)

(assert (=> b!12330 m!18635))

(declare-fun m!18637 () Bool)

(assert (=> b!12326 m!18637))

(declare-fun m!18639 () Bool)

(assert (=> b!12326 m!18639))

(declare-fun m!18641 () Bool)

(assert (=> b!12331 m!18641))

(declare-fun m!18643 () Bool)

(assert (=> b!12324 m!18643))

(declare-fun m!18645 () Bool)

(assert (=> b!12324 m!18645))

(declare-fun m!18647 () Bool)

(assert (=> b!12325 m!18647))

(declare-fun m!18649 () Bool)

(assert (=> b!12333 m!18649))

(declare-fun m!18651 () Bool)

(assert (=> b!12333 m!18651))

(declare-fun m!18653 () Bool)

(assert (=> b!12328 m!18653))

(declare-fun m!18655 () Bool)

(assert (=> start!2580 m!18655))

(declare-fun m!18657 () Bool)

(assert (=> start!2580 m!18657))

(push 1)

(assert (not b!12328))

(assert (not b!12324))

(assert (not b!12326))

(assert (not b!12333))

(assert (not start!2580))

(assert (not b!12329))

(assert (not b!12331))

(assert (not b!12327))

(assert (not b!12330))

(assert (not b!12325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4046 () Bool)

(declare-fun e!7509 () Bool)

(assert (=> d!4046 e!7509))

(declare-fun res!11845 () Bool)

(assert (=> d!4046 (=> (not res!11845) (not e!7509))))

(declare-fun lt!19749 () (_ BitVec 64))

(declare-fun lt!19752 () (_ BitVec 64))

(declare-fun lt!19754 () (_ BitVec 64))

(assert (=> d!4046 (= res!11845 (= lt!19752 (bvsub lt!19749 lt!19754)))))

(assert (=> d!4046 (or (= (bvand lt!19749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19749 lt!19754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4046 (= lt!19754 (remainingBits!0 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))) ((_ sign_extend 32) (currentByte!1720 (_2!771 lt!19732))) ((_ sign_extend 32) (currentBit!1715 (_2!771 lt!19732)))))))

(declare-fun lt!19750 () (_ BitVec 64))

(declare-fun lt!19753 () (_ BitVec 64))

(assert (=> d!4046 (= lt!19749 (bvmul lt!19750 lt!19753))))

(assert (=> d!4046 (or (= lt!19750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19753 (bvsdiv (bvmul lt!19750 lt!19753) lt!19750)))))

(assert (=> d!4046 (= lt!19753 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4046 (= lt!19750 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))))))

(assert (=> d!4046 (= lt!19752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1720 (_2!771 lt!19732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1715 (_2!771 lt!19732)))))))

(assert (=> d!4046 (invariant!0 (currentBit!1715 (_2!771 lt!19732)) (currentByte!1720 (_2!771 lt!19732)) (size!294 (buf!642 (_2!771 lt!19732))))))

(assert (=> d!4046 (= (bitIndex!0 (size!294 (buf!642 (_2!771 lt!19732))) (currentByte!1720 (_2!771 lt!19732)) (currentBit!1715 (_2!771 lt!19732))) lt!19752)))

(declare-fun b!12348 () Bool)

(declare-fun res!11846 () Bool)

(assert (=> b!12348 (=> (not res!11846) (not e!7509))))

(assert (=> b!12348 (= res!11846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19752))))

(declare-fun b!12349 () Bool)

(declare-fun lt!19751 () (_ BitVec 64))

(assert (=> b!12349 (= e!7509 (bvsle lt!19752 (bvmul lt!19751 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12349 (or (= lt!19751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19751)))))

(assert (=> b!12349 (= lt!19751 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))))))

(assert (= (and d!4046 res!11845) b!12348))

(assert (= (and b!12348 res!11846) b!12349))

(declare-fun m!18665 () Bool)

(assert (=> d!4046 m!18665))

(assert (=> d!4046 m!18643))

(assert (=> b!12326 d!4046))

(declare-fun d!4052 () Bool)

(declare-fun e!7512 () Bool)

(assert (=> d!4052 e!7512))

(declare-fun res!11849 () Bool)

(assert (=> d!4052 (=> (not res!11849) (not e!7512))))

(declare-fun lt!19760 () (_ BitVec 64))

(declare-fun lt!19758 () (_ BitVec 64))

(declare-fun lt!19755 () (_ BitVec 64))

(assert (=> d!4052 (= res!11849 (= lt!19758 (bvsub lt!19755 lt!19760)))))

(assert (=> d!4052 (or (= (bvand lt!19755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19755 lt!19760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4052 (= lt!19760 (remainingBits!0 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486))))))

(declare-fun lt!19756 () (_ BitVec 64))

(declare-fun lt!19759 () (_ BitVec 64))

(assert (=> d!4052 (= lt!19755 (bvmul lt!19756 lt!19759))))

(assert (=> d!4052 (or (= lt!19756 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19759 (bvsdiv (bvmul lt!19756 lt!19759) lt!19756)))))

(assert (=> d!4052 (= lt!19759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4052 (= lt!19756 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))))))

(assert (=> d!4052 (= lt!19758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1720 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1715 thiss!1486))))))

(assert (=> d!4052 (invariant!0 (currentBit!1715 thiss!1486) (currentByte!1720 thiss!1486) (size!294 (buf!642 thiss!1486)))))

(assert (=> d!4052 (= (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)) lt!19758)))

(declare-fun b!12352 () Bool)

(declare-fun res!11850 () Bool)

(assert (=> b!12352 (=> (not res!11850) (not e!7512))))

(assert (=> b!12352 (= res!11850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19758))))

(declare-fun b!12353 () Bool)

(declare-fun lt!19757 () (_ BitVec 64))

(assert (=> b!12353 (= e!7512 (bvsle lt!19758 (bvmul lt!19757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12353 (or (= lt!19757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19757)))))

(assert (=> b!12353 (= lt!19757 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))))))

(assert (= (and d!4052 res!11849) b!12352))

(assert (= (and b!12352 res!11850) b!12353))

(declare-fun m!18673 () Bool)

(assert (=> d!4052 m!18673))

(declare-fun m!18675 () Bool)

(assert (=> d!4052 m!18675))

(assert (=> b!12326 d!4052))

(declare-fun d!4056 () Bool)

(declare-fun c!920 () Bool)

(assert (=> d!4056 (= c!920 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7515 () List!170)

(assert (=> d!4056 (= (byteArrayBitContentToList!0 (_2!771 lt!19732) srcBuffer!6 from!367 nBits!460) e!7515)))

(declare-fun b!12358 () Bool)

(assert (=> b!12358 (= e!7515 Nil!167)))

(declare-fun b!12359 () Bool)

(assert (=> b!12359 (= e!7515 (Cons!166 (not (= (bvand ((_ sign_extend 24) (select (arr!720 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!771 lt!19732) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4056 c!920) b!12358))

(assert (= (and d!4056 (not c!920)) b!12359))

(declare-fun m!18679 () Bool)

(assert (=> b!12359 m!18679))

(declare-fun m!18681 () Bool)

(assert (=> b!12359 m!18681))

(declare-fun m!18683 () Bool)

(assert (=> b!12359 m!18683))

(assert (=> b!12331 d!4056))

(declare-fun d!4062 () Bool)

(assert (=> d!4062 (= (array_inv!283 srcBuffer!6) (bvsge (size!294 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2580 d!4062))

(declare-fun d!4064 () Bool)

(assert (=> d!4064 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1715 thiss!1486) (currentByte!1720 thiss!1486) (size!294 (buf!642 thiss!1486))))))

(declare-fun bs!1119 () Bool)

(assert (= bs!1119 d!4064))

(assert (=> bs!1119 m!18675))

(assert (=> start!2580 d!4064))

(declare-fun d!4066 () Bool)

(assert (=> d!4066 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) nBits!460)))

(declare-fun lt!19768 () Unit!1047)

(declare-fun choose!9 (BitStream!548 array!676 (_ BitVec 64) BitStream!548) Unit!1047)

(assert (=> d!4066 (= lt!19768 (choose!9 thiss!1486 (buf!642 (_2!771 lt!19732)) nBits!460 (BitStream!549 (buf!642 (_2!771 lt!19732)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486))))))

(assert (=> d!4066 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!642 (_2!771 lt!19732)) nBits!460) lt!19768)))

(declare-fun bs!1120 () Bool)

(assert (= bs!1120 d!4066))

(assert (=> bs!1120 m!18625))

(declare-fun m!18685 () Bool)

(assert (=> bs!1120 m!18685))

(assert (=> b!12327 d!4066))

(declare-fun d!4070 () Bool)

(assert (=> d!4070 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!19732)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486))) nBits!460))))

(declare-fun bs!1121 () Bool)

(assert (= bs!1121 d!4070))

(declare-fun m!18687 () Bool)

(assert (=> bs!1121 m!18687))

(assert (=> b!12327 d!4070))

(declare-fun d!4072 () Bool)

(declare-fun c!921 () Bool)

(assert (=> d!4072 (= c!921 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7518 () List!170)

(assert (=> d!4072 (= (byteArrayBitContentToList!0 (_2!771 lt!19732) (_1!772 lt!19736) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7518)))

(declare-fun b!12364 () Bool)

(assert (=> b!12364 (= e!7518 Nil!167)))

(declare-fun b!12365 () Bool)

(assert (=> b!12365 (= e!7518 (Cons!166 (not (= (bvand ((_ sign_extend 24) (select (arr!720 (_1!772 lt!19736)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!771 lt!19732) (_1!772 lt!19736) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4072 c!921) b!12364))

(assert (= (and d!4072 (not c!921)) b!12365))

(declare-fun m!18689 () Bool)

(assert (=> b!12365 m!18689))

(declare-fun m!18691 () Bool)

(assert (=> b!12365 m!18691))

(declare-fun m!18693 () Bool)

(assert (=> b!12365 m!18693))

(assert (=> b!12327 d!4072))

(declare-fun b!12380 () Bool)

(declare-fun res!11872 () Bool)

(declare-fun e!7523 () Bool)

(assert (=> b!12380 (=> (not res!11872) (not e!7523))))

(declare-fun lt!19816 () tuple2!1440)

(declare-fun lt!19812 () (_ BitVec 64))

(assert (=> b!12380 (= res!11872 (= (size!294 (_1!772 lt!19816)) ((_ extract 31 0) lt!19812)))))

(assert (=> b!12380 (and (bvslt lt!19812 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!19812 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!19811 () (_ BitVec 64))

(declare-fun lt!19817 () (_ BitVec 64))

(assert (=> b!12380 (= lt!19812 (bvsdiv lt!19811 lt!19817))))

(assert (=> b!12380 (and (not (= lt!19817 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!19811 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!19817 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!12380 (= lt!19817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!19814 () (_ BitVec 64))

(declare-fun lt!19813 () (_ BitVec 64))

(assert (=> b!12380 (= lt!19811 (bvsub lt!19814 lt!19813))))

(assert (=> b!12380 (or (= (bvand lt!19814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19813 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19814 lt!19813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12380 (= lt!19813 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19815 () (_ BitVec 64))

(assert (=> b!12380 (= lt!19814 (bvadd nBits!460 lt!19815))))

(assert (=> b!12380 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19815 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!19815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12380 (= lt!19815 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!12381 () Bool)

(declare-fun res!11871 () Bool)

(assert (=> b!12381 (=> (not res!11871) (not e!7523))))

(assert (=> b!12381 (= res!11871 (bvsle (currentByte!1720 (_1!773 lt!19731)) (currentByte!1720 (_2!772 lt!19816))))))

(declare-fun b!12382 () Bool)

(declare-fun res!11869 () Bool)

(assert (=> b!12382 (=> (not res!11869) (not e!7523))))

(assert (=> b!12382 (= res!11869 (invariant!0 (currentBit!1715 (_2!772 lt!19816)) (currentByte!1720 (_2!772 lt!19816)) (size!294 (buf!642 (_2!772 lt!19816)))))))

(declare-fun d!4074 () Bool)

(assert (=> d!4074 e!7523))

(declare-fun res!11873 () Bool)

(assert (=> d!4074 (=> (not res!11873) (not e!7523))))

(assert (=> d!4074 (= res!11873 (= (buf!642 (_2!772 lt!19816)) (buf!642 (_1!773 lt!19731))))))

(declare-datatypes ((tuple3!92 0))(
  ( (tuple3!93 (_1!774 Unit!1047) (_2!774 BitStream!548) (_3!52 array!676)) )
))
(declare-fun lt!19809 () tuple3!92)

(assert (=> d!4074 (= lt!19816 (tuple2!1441 (_3!52 lt!19809) (_2!774 lt!19809)))))

(declare-fun readBitsLoop!0 (BitStream!548 (_ BitVec 64) array!676 (_ BitVec 64) (_ BitVec 64)) tuple3!92)

(assert (=> d!4074 (= lt!19809 (readBitsLoop!0 (_1!773 lt!19731) nBits!460 (array!677 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4074 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4074 (= (readBits!0 (_1!773 lt!19731) nBits!460) lt!19816)))

(declare-fun b!12383 () Bool)

(assert (=> b!12383 (= e!7523 (= (byteArrayBitContentToList!0 (_2!772 lt!19816) (_1!772 lt!19816) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!772 lt!19816) (_1!773 lt!19731) nBits!460)))))

(declare-fun b!12384 () Bool)

(declare-fun res!11870 () Bool)

(assert (=> b!12384 (=> (not res!11870) (not e!7523))))

(declare-fun lt!19810 () (_ BitVec 64))

(assert (=> b!12384 (= res!11870 (= (bvadd lt!19810 nBits!460) (bitIndex!0 (size!294 (buf!642 (_2!772 lt!19816))) (currentByte!1720 (_2!772 lt!19816)) (currentBit!1715 (_2!772 lt!19816)))))))

(assert (=> b!12384 (or (not (= (bvand lt!19810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19810 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12384 (= lt!19810 (bitIndex!0 (size!294 (buf!642 (_1!773 lt!19731))) (currentByte!1720 (_1!773 lt!19731)) (currentBit!1715 (_1!773 lt!19731))))))

(assert (= (and d!4074 res!11873) b!12384))

(assert (= (and b!12384 res!11870) b!12382))

(assert (= (and b!12382 res!11869) b!12380))

(assert (= (and b!12380 res!11872) b!12381))

(assert (= (and b!12381 res!11871) b!12383))

(declare-fun m!18701 () Bool)

(assert (=> b!12382 m!18701))

(declare-fun m!18703 () Bool)

(assert (=> d!4074 m!18703))

(declare-fun m!18705 () Bool)

(assert (=> b!12383 m!18705))

(declare-fun m!18707 () Bool)

(assert (=> b!12383 m!18707))

(declare-fun m!18709 () Bool)

(assert (=> b!12384 m!18709))

(declare-fun m!18711 () Bool)

(assert (=> b!12384 m!18711))

(assert (=> b!12327 d!4074))

(declare-fun b!12395 () Bool)

(declare-fun e!7529 () Bool)

(declare-fun lt!19825 () List!170)

(declare-fun isEmpty!40 (List!170) Bool)

(assert (=> b!12395 (= e!7529 (isEmpty!40 lt!19825))))

(declare-fun b!12393 () Bool)

(declare-datatypes ((tuple2!1444 0))(
  ( (tuple2!1445 (_1!775 List!170) (_2!775 BitStream!548)) )
))
(declare-fun e!7528 () tuple2!1444)

(assert (=> b!12393 (= e!7528 (tuple2!1445 Nil!167 (_1!773 lt!19731)))))

(declare-fun b!12396 () Bool)

(declare-fun length!35 (List!170) Int)

(assert (=> b!12396 (= e!7529 (> (length!35 lt!19825) 0))))

(declare-fun lt!19826 () (_ BitVec 64))

(declare-fun b!12394 () Bool)

(declare-datatypes ((tuple2!1446 0))(
  ( (tuple2!1447 (_1!776 Bool) (_2!776 BitStream!548)) )
))
(declare-fun lt!19824 () tuple2!1446)

(assert (=> b!12394 (= e!7528 (tuple2!1445 (Cons!166 (_1!776 lt!19824) (bitStreamReadBitsIntoList!0 (_2!771 lt!19732) (_2!776 lt!19824) (bvsub nBits!460 lt!19826))) (_2!776 lt!19824)))))

(declare-fun readBit!0 (BitStream!548) tuple2!1446)

(assert (=> b!12394 (= lt!19824 (readBit!0 (_1!773 lt!19731)))))

(assert (=> b!12394 (= lt!19826 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!4086 () Bool)

(assert (=> d!4086 e!7529))

(declare-fun c!927 () Bool)

(assert (=> d!4086 (= c!927 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4086 (= lt!19825 (_1!775 e!7528))))

(declare-fun c!926 () Bool)

(assert (=> d!4086 (= c!926 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4086 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4086 (= (bitStreamReadBitsIntoList!0 (_2!771 lt!19732) (_1!773 lt!19731) nBits!460) lt!19825)))

(assert (= (and d!4086 c!926) b!12393))

(assert (= (and d!4086 (not c!926)) b!12394))

(assert (= (and d!4086 c!927) b!12395))

(assert (= (and d!4086 (not c!927)) b!12396))

(declare-fun m!18713 () Bool)

(assert (=> b!12395 m!18713))

(declare-fun m!18715 () Bool)

(assert (=> b!12396 m!18715))

(declare-fun m!18717 () Bool)

(assert (=> b!12394 m!18717))

(declare-fun m!18719 () Bool)

(assert (=> b!12394 m!18719))

(assert (=> b!12327 d!4086))

(declare-fun b!12407 () Bool)

(declare-fun e!7534 () Unit!1047)

(declare-fun Unit!1057 () Unit!1047)

(assert (=> b!12407 (= e!7534 Unit!1057)))

(declare-fun e!7535 () Bool)

(declare-fun lt!19884 () (_ BitVec 64))

(declare-fun lt!19871 () tuple2!1442)

(declare-fun b!12408 () Bool)

(declare-fun lt!19880 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!548 (_ BitVec 64)) BitStream!548)

(assert (=> b!12408 (= e!7535 (= (_1!773 lt!19871) (withMovedBitIndex!0 (_2!773 lt!19871) (bvsub lt!19880 lt!19884))))))

(assert (=> b!12408 (or (= (bvand lt!19880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19884 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19880 lt!19884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12408 (= lt!19884 (bitIndex!0 (size!294 (buf!642 (_2!771 lt!19732))) (currentByte!1720 (_2!771 lt!19732)) (currentBit!1715 (_2!771 lt!19732))))))

(assert (=> b!12408 (= lt!19880 (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)))))

(declare-fun d!4088 () Bool)

(assert (=> d!4088 e!7535))

(declare-fun res!11882 () Bool)

(assert (=> d!4088 (=> (not res!11882) (not e!7535))))

(assert (=> d!4088 (= res!11882 (isPrefixOf!0 (_1!773 lt!19871) (_2!773 lt!19871)))))

(declare-fun lt!19876 () BitStream!548)

(assert (=> d!4088 (= lt!19871 (tuple2!1443 lt!19876 (_2!771 lt!19732)))))

(declare-fun lt!19867 () Unit!1047)

(declare-fun lt!19881 () Unit!1047)

(assert (=> d!4088 (= lt!19867 lt!19881)))

(assert (=> d!4088 (isPrefixOf!0 lt!19876 (_2!771 lt!19732))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!548 BitStream!548 BitStream!548) Unit!1047)

(assert (=> d!4088 (= lt!19881 (lemmaIsPrefixTransitive!0 lt!19876 (_2!771 lt!19732) (_2!771 lt!19732)))))

(declare-fun lt!19872 () Unit!1047)

(declare-fun lt!19882 () Unit!1047)

(assert (=> d!4088 (= lt!19872 lt!19882)))

(assert (=> d!4088 (isPrefixOf!0 lt!19876 (_2!771 lt!19732))))

(assert (=> d!4088 (= lt!19882 (lemmaIsPrefixTransitive!0 lt!19876 thiss!1486 (_2!771 lt!19732)))))

(declare-fun lt!19873 () Unit!1047)

(assert (=> d!4088 (= lt!19873 e!7534)))

(declare-fun c!930 () Bool)

(assert (=> d!4088 (= c!930 (not (= (size!294 (buf!642 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19883 () Unit!1047)

(declare-fun lt!19869 () Unit!1047)

(assert (=> d!4088 (= lt!19883 lt!19869)))

(assert (=> d!4088 (isPrefixOf!0 (_2!771 lt!19732) (_2!771 lt!19732))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!548) Unit!1047)

(assert (=> d!4088 (= lt!19869 (lemmaIsPrefixRefl!0 (_2!771 lt!19732)))))

(declare-fun lt!19870 () Unit!1047)

(declare-fun lt!19874 () Unit!1047)

(assert (=> d!4088 (= lt!19870 lt!19874)))

(assert (=> d!4088 (= lt!19874 (lemmaIsPrefixRefl!0 (_2!771 lt!19732)))))

(declare-fun lt!19886 () Unit!1047)

(declare-fun lt!19878 () Unit!1047)

(assert (=> d!4088 (= lt!19886 lt!19878)))

(assert (=> d!4088 (isPrefixOf!0 lt!19876 lt!19876)))

(assert (=> d!4088 (= lt!19878 (lemmaIsPrefixRefl!0 lt!19876))))

(declare-fun lt!19868 () Unit!1047)

(declare-fun lt!19885 () Unit!1047)

(assert (=> d!4088 (= lt!19868 lt!19885)))

(assert (=> d!4088 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!4088 (= lt!19885 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4088 (= lt!19876 (BitStream!549 (buf!642 (_2!771 lt!19732)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)))))

(assert (=> d!4088 (isPrefixOf!0 thiss!1486 (_2!771 lt!19732))))

(assert (=> d!4088 (= (reader!0 thiss!1486 (_2!771 lt!19732)) lt!19871)))

(declare-fun b!12409 () Bool)

(declare-fun lt!19877 () Unit!1047)

(assert (=> b!12409 (= e!7534 lt!19877)))

(declare-fun lt!19875 () (_ BitVec 64))

(assert (=> b!12409 (= lt!19875 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19879 () (_ BitVec 64))

(assert (=> b!12409 (= lt!19879 (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!676 array!676 (_ BitVec 64) (_ BitVec 64)) Unit!1047)

(assert (=> b!12409 (= lt!19877 (arrayBitRangesEqSymmetric!0 (buf!642 thiss!1486) (buf!642 (_2!771 lt!19732)) lt!19875 lt!19879))))

(declare-fun arrayBitRangesEq!0 (array!676 array!676 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12409 (arrayBitRangesEq!0 (buf!642 (_2!771 lt!19732)) (buf!642 thiss!1486) lt!19875 lt!19879)))

(declare-fun b!12410 () Bool)

(declare-fun res!11880 () Bool)

(assert (=> b!12410 (=> (not res!11880) (not e!7535))))

(assert (=> b!12410 (= res!11880 (isPrefixOf!0 (_2!773 lt!19871) (_2!771 lt!19732)))))

(declare-fun b!12411 () Bool)

(declare-fun res!11881 () Bool)

(assert (=> b!12411 (=> (not res!11881) (not e!7535))))

(assert (=> b!12411 (= res!11881 (isPrefixOf!0 (_1!773 lt!19871) thiss!1486))))

(assert (= (and d!4088 c!930) b!12409))

(assert (= (and d!4088 (not c!930)) b!12407))

(assert (= (and d!4088 res!11882) b!12411))

(assert (= (and b!12411 res!11881) b!12410))

(assert (= (and b!12410 res!11880) b!12408))

(declare-fun m!18721 () Bool)

(assert (=> b!12411 m!18721))

(assert (=> b!12409 m!18639))

(declare-fun m!18723 () Bool)

(assert (=> b!12409 m!18723))

(declare-fun m!18725 () Bool)

(assert (=> b!12409 m!18725))

(declare-fun m!18727 () Bool)

(assert (=> b!12410 m!18727))

(declare-fun m!18729 () Bool)

(assert (=> b!12408 m!18729))

(assert (=> b!12408 m!18637))

(assert (=> b!12408 m!18639))

(declare-fun m!18731 () Bool)

(assert (=> d!4088 m!18731))

(declare-fun m!18733 () Bool)

(assert (=> d!4088 m!18733))

(declare-fun m!18735 () Bool)

(assert (=> d!4088 m!18735))

(declare-fun m!18737 () Bool)

(assert (=> d!4088 m!18737))

(declare-fun m!18739 () Bool)

(assert (=> d!4088 m!18739))

(assert (=> d!4088 m!18635))

(declare-fun m!18741 () Bool)

(assert (=> d!4088 m!18741))

(declare-fun m!18743 () Bool)

(assert (=> d!4088 m!18743))

(declare-fun m!18745 () Bool)

(assert (=> d!4088 m!18745))

(declare-fun m!18747 () Bool)

(assert (=> d!4088 m!18747))

(declare-fun m!18749 () Bool)

(assert (=> d!4088 m!18749))

(assert (=> b!12327 d!4088))

(declare-fun d!4090 () Bool)

(assert (=> d!4090 (= (inv!12 (BitStream!549 (buf!642 (_1!773 lt!19731)) (currentByte!1720 (_2!772 lt!19736)) (currentBit!1715 (_2!772 lt!19736)))) (invariant!0 (currentBit!1715 (BitStream!549 (buf!642 (_1!773 lt!19731)) (currentByte!1720 (_2!772 lt!19736)) (currentBit!1715 (_2!772 lt!19736)))) (currentByte!1720 (BitStream!549 (buf!642 (_1!773 lt!19731)) (currentByte!1720 (_2!772 lt!19736)) (currentBit!1715 (_2!772 lt!19736)))) (size!294 (buf!642 (BitStream!549 (buf!642 (_1!773 lt!19731)) (currentByte!1720 (_2!772 lt!19736)) (currentBit!1715 (_2!772 lt!19736)))))))))

(declare-fun bs!1123 () Bool)

(assert (= bs!1123 d!4090))

(declare-fun m!18751 () Bool)

(assert (=> bs!1123 m!18751))

(assert (=> b!12328 d!4090))

(declare-fun d!4092 () Bool)

(declare-fun res!11887 () Bool)

(declare-fun e!7540 () Bool)

(assert (=> d!4092 (=> res!11887 e!7540)))

(assert (=> d!4092 (= res!11887 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4092 (= (checkByteArrayBitContent!0 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7540)))

(declare-fun b!12416 () Bool)

(declare-fun e!7541 () Bool)

(assert (=> b!12416 (= e!7540 e!7541)))

(declare-fun res!11888 () Bool)

(assert (=> b!12416 (=> (not res!11888) (not e!7541))))

(assert (=> b!12416 (= res!11888 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!720 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!720 (_1!772 lt!19736)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!12417 () Bool)

(assert (=> b!12417 (= e!7541 (checkByteArrayBitContent!0 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!4092 (not res!11887)) b!12416))

(assert (= (and b!12416 res!11888) b!12417))

(assert (=> b!12416 m!18679))

(assert (=> b!12416 m!18681))

(assert (=> b!12416 m!18689))

(assert (=> b!12416 m!18691))

(declare-fun m!18753 () Bool)

(assert (=> b!12417 m!18753))

(assert (=> b!12333 d!4092))

(declare-fun d!4094 () Bool)

(assert (=> d!4094 (checkByteArrayBitContent!0 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!19889 () Unit!1047)

(declare-fun choose!65 (BitStream!548 array!676 array!676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1047)

(assert (=> d!4094 (= lt!19889 (choose!65 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4094 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4094 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!771 lt!19732) srcBuffer!6 (_1!772 lt!19736) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19889)))

(declare-fun bs!1124 () Bool)

(assert (= bs!1124 d!4094))

(assert (=> bs!1124 m!18649))

(declare-fun m!18755 () Bool)

(assert (=> bs!1124 m!18755))

(assert (=> b!12333 d!4094))

(declare-fun d!4096 () Bool)

(assert (=> d!4096 (= (invariant!0 (currentBit!1715 (_2!771 lt!19732)) (currentByte!1720 (_2!771 lt!19732)) (size!294 (buf!642 (_2!771 lt!19732)))) (and (bvsge (currentBit!1715 (_2!771 lt!19732)) #b00000000000000000000000000000000) (bvslt (currentBit!1715 (_2!771 lt!19732)) #b00000000000000000000000000001000) (bvsge (currentByte!1720 (_2!771 lt!19732)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1720 (_2!771 lt!19732)) (size!294 (buf!642 (_2!771 lt!19732)))) (and (= (currentBit!1715 (_2!771 lt!19732)) #b00000000000000000000000000000000) (= (currentByte!1720 (_2!771 lt!19732)) (size!294 (buf!642 (_2!771 lt!19732))))))))))

(assert (=> b!12324 d!4096))

(declare-fun b!12547 () Bool)

(declare-fun res!11977 () Bool)

(declare-fun e!7598 () Bool)

(assert (=> b!12547 (=> (not res!11977) (not e!7598))))

(declare-fun lt!20360 () tuple2!1438)

(assert (=> b!12547 (= res!11977 (= (size!294 (buf!642 (_2!771 lt!20360))) (size!294 (buf!642 thiss!1486))))))

(declare-fun b!12548 () Bool)

(declare-fun res!11978 () Bool)

(assert (=> b!12548 (=> (not res!11978) (not e!7598))))

(assert (=> b!12548 (= res!11978 (isPrefixOf!0 thiss!1486 (_2!771 lt!20360)))))

(declare-fun b!12549 () Bool)

(declare-fun res!11976 () Bool)

(assert (=> b!12549 (=> (not res!11976) (not e!7598))))

(assert (=> b!12549 (= res!11976 (= (size!294 (buf!642 thiss!1486)) (size!294 (buf!642 (_2!771 lt!20360)))))))

(declare-fun b!12550 () Bool)

(declare-fun e!7599 () tuple2!1438)

(declare-fun lt!20383 () tuple2!1438)

(declare-fun Unit!1064 () Unit!1047)

(assert (=> b!12550 (= e!7599 (tuple2!1439 Unit!1064 (_2!771 lt!20383)))))

(declare-fun lt!20357 () tuple2!1438)

(declare-fun appendBitFromByte!0 (BitStream!548 (_ BitVec 8) (_ BitVec 32)) tuple2!1438)

(assert (=> b!12550 (= lt!20357 (appendBitFromByte!0 thiss!1486 (select (arr!720 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!20367 () (_ BitVec 64))

(assert (=> b!12550 (= lt!20367 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20369 () (_ BitVec 64))

(assert (=> b!12550 (= lt!20369 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20352 () Unit!1047)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!548 BitStream!548 (_ BitVec 64) (_ BitVec 64)) Unit!1047)

(assert (=> b!12550 (= lt!20352 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!771 lt!20357) lt!20367 lt!20369))))

(assert (=> b!12550 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!20357)))) ((_ sign_extend 32) (currentByte!1720 (_2!771 lt!20357))) ((_ sign_extend 32) (currentBit!1715 (_2!771 lt!20357))) (bvsub lt!20367 lt!20369))))

(declare-fun lt!20377 () Unit!1047)

(assert (=> b!12550 (= lt!20377 lt!20352)))

(declare-fun lt!20382 () tuple2!1442)

(assert (=> b!12550 (= lt!20382 (reader!0 thiss!1486 (_2!771 lt!20357)))))

(declare-fun lt!20362 () (_ BitVec 64))

(assert (=> b!12550 (= lt!20362 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20348 () Unit!1047)

(assert (=> b!12550 (= lt!20348 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!642 (_2!771 lt!20357)) lt!20362))))

(assert (=> b!12550 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!20357)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) lt!20362)))

(declare-fun lt!20387 () Unit!1047)

(assert (=> b!12550 (= lt!20387 lt!20348)))

(declare-fun head!67 (List!170) Bool)

(assert (=> b!12550 (= (head!67 (byteArrayBitContentToList!0 (_2!771 lt!20357) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!67 (bitStreamReadBitsIntoList!0 (_2!771 lt!20357) (_1!773 lt!20382) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20346 () Unit!1047)

(declare-fun Unit!1065 () Unit!1047)

(assert (=> b!12550 (= lt!20346 Unit!1065)))

(assert (=> b!12550 (= lt!20383 (appendBitsMSBFirstLoop!0 (_2!771 lt!20357) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!20361 () Unit!1047)

(assert (=> b!12550 (= lt!20361 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!771 lt!20357) (_2!771 lt!20383)))))

(assert (=> b!12550 (isPrefixOf!0 thiss!1486 (_2!771 lt!20383))))

(declare-fun lt!20356 () Unit!1047)

(assert (=> b!12550 (= lt!20356 lt!20361)))

(assert (=> b!12550 (= (size!294 (buf!642 (_2!771 lt!20383))) (size!294 (buf!642 thiss!1486)))))

(declare-fun lt!20379 () Unit!1047)

(declare-fun Unit!1066 () Unit!1047)

(assert (=> b!12550 (= lt!20379 Unit!1066)))

(assert (=> b!12550 (= (bitIndex!0 (size!294 (buf!642 (_2!771 lt!20383))) (currentByte!1720 (_2!771 lt!20383)) (currentBit!1715 (_2!771 lt!20383))) (bvsub (bvadd (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!20359 () Unit!1047)

(declare-fun Unit!1067 () Unit!1047)

(assert (=> b!12550 (= lt!20359 Unit!1067)))

(assert (=> b!12550 (= (bitIndex!0 (size!294 (buf!642 (_2!771 lt!20383))) (currentByte!1720 (_2!771 lt!20383)) (currentBit!1715 (_2!771 lt!20383))) (bvsub (bvsub (bvadd (bitIndex!0 (size!294 (buf!642 (_2!771 lt!20357))) (currentByte!1720 (_2!771 lt!20357)) (currentBit!1715 (_2!771 lt!20357))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!20376 () Unit!1047)

(declare-fun Unit!1068 () Unit!1047)

(assert (=> b!12550 (= lt!20376 Unit!1068)))

(declare-fun lt!20371 () tuple2!1442)

(declare-fun call!257 () tuple2!1442)

(assert (=> b!12550 (= lt!20371 call!257)))

(declare-fun lt!20345 () (_ BitVec 64))

(assert (=> b!12550 (= lt!20345 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20353 () Unit!1047)

(assert (=> b!12550 (= lt!20353 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!642 (_2!771 lt!20383)) lt!20345))))

(assert (=> b!12550 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!20383)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) lt!20345)))

(declare-fun lt!20344 () Unit!1047)

(assert (=> b!12550 (= lt!20344 lt!20353)))

(declare-fun lt!20373 () tuple2!1442)

(assert (=> b!12550 (= lt!20373 (reader!0 (_2!771 lt!20357) (_2!771 lt!20383)))))

(declare-fun lt!20358 () (_ BitVec 64))

(assert (=> b!12550 (= lt!20358 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!20349 () Unit!1047)

(assert (=> b!12550 (= lt!20349 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!771 lt!20357) (buf!642 (_2!771 lt!20383)) lt!20358))))

(assert (=> b!12550 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!20383)))) ((_ sign_extend 32) (currentByte!1720 (_2!771 lt!20357))) ((_ sign_extend 32) (currentBit!1715 (_2!771 lt!20357))) lt!20358)))

(declare-fun lt!20378 () Unit!1047)

(assert (=> b!12550 (= lt!20378 lt!20349)))

(declare-fun lt!20384 () List!170)

(assert (=> b!12550 (= lt!20384 (byteArrayBitContentToList!0 (_2!771 lt!20383) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!20386 () List!170)

(assert (=> b!12550 (= lt!20386 (byteArrayBitContentToList!0 (_2!771 lt!20383) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20366 () List!170)

(assert (=> b!12550 (= lt!20366 (bitStreamReadBitsIntoList!0 (_2!771 lt!20383) (_1!773 lt!20371) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!20380 () List!170)

(assert (=> b!12550 (= lt!20380 (bitStreamReadBitsIntoList!0 (_2!771 lt!20383) (_1!773 lt!20373) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20368 () (_ BitVec 64))

(assert (=> b!12550 (= lt!20368 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20347 () Unit!1047)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!548 BitStream!548 BitStream!548 BitStream!548 (_ BitVec 64) List!170) Unit!1047)

(assert (=> b!12550 (= lt!20347 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!771 lt!20383) (_2!771 lt!20383) (_1!773 lt!20371) (_1!773 lt!20373) lt!20368 lt!20366))))

(declare-fun tail!75 (List!170) List!170)

(assert (=> b!12550 (= (bitStreamReadBitsIntoList!0 (_2!771 lt!20383) (_1!773 lt!20373) (bvsub lt!20368 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!75 lt!20366))))

(declare-fun lt!20381 () Unit!1047)

(assert (=> b!12550 (= lt!20381 lt!20347)))

(declare-fun lt!20365 () (_ BitVec 64))

(declare-fun lt!20364 () Unit!1047)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!676 array!676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1047)

(assert (=> b!12550 (= lt!20364 (arrayBitRangesEqImpliesEq!0 (buf!642 (_2!771 lt!20357)) (buf!642 (_2!771 lt!20383)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!20365 (bitIndex!0 (size!294 (buf!642 (_2!771 lt!20357))) (currentByte!1720 (_2!771 lt!20357)) (currentBit!1715 (_2!771 lt!20357)))))))

(declare-fun bitAt!0 (array!676 (_ BitVec 64)) Bool)

(assert (=> b!12550 (= (bitAt!0 (buf!642 (_2!771 lt!20357)) lt!20365) (bitAt!0 (buf!642 (_2!771 lt!20383)) lt!20365))))

(declare-fun lt!20350 () Unit!1047)

(assert (=> b!12550 (= lt!20350 lt!20364)))

(declare-fun d!4098 () Bool)

(assert (=> d!4098 e!7598))

(declare-fun res!11979 () Bool)

(assert (=> d!4098 (=> (not res!11979) (not e!7598))))

(declare-fun lt!20354 () (_ BitVec 64))

(assert (=> d!4098 (= res!11979 (= (bitIndex!0 (size!294 (buf!642 (_2!771 lt!20360))) (currentByte!1720 (_2!771 lt!20360)) (currentBit!1715 (_2!771 lt!20360))) (bvsub lt!20354 from!367)))))

(assert (=> d!4098 (or (= (bvand lt!20354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20354 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!20370 () (_ BitVec 64))

(assert (=> d!4098 (= lt!20354 (bvadd lt!20370 from!367 nBits!460))))

(assert (=> d!4098 (or (not (= (bvand lt!20370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20370 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4098 (= lt!20370 (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)))))

(assert (=> d!4098 (= lt!20360 e!7599)))

(declare-fun c!952 () Bool)

(assert (=> d!4098 (= c!952 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!20351 () Unit!1047)

(declare-fun lt!20374 () Unit!1047)

(assert (=> d!4098 (= lt!20351 lt!20374)))

(assert (=> d!4098 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!4098 (= lt!20374 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4098 (= lt!20365 (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)))))

(assert (=> d!4098 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4098 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!20360)))

(declare-fun b!12551 () Bool)

(declare-fun Unit!1071 () Unit!1047)

(assert (=> b!12551 (= e!7599 (tuple2!1439 Unit!1071 thiss!1486))))

(assert (=> b!12551 (= (size!294 (buf!642 thiss!1486)) (size!294 (buf!642 thiss!1486)))))

(declare-fun lt!20385 () Unit!1047)

(declare-fun Unit!1072 () Unit!1047)

(assert (=> b!12551 (= lt!20385 Unit!1072)))

(assert (=> b!12551 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!772 (readBits!0 (_1!773 call!257) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun bm!254 () Bool)

(assert (=> bm!254 (= call!257 (reader!0 thiss!1486 (ite c!952 (_2!771 lt!20383) thiss!1486)))))

(declare-fun b!12552 () Bool)

(declare-fun e!7597 () Bool)

(declare-fun lt!20375 () (_ BitVec 64))

(assert (=> b!12552 (= e!7597 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) lt!20375))))

(declare-fun b!12553 () Bool)

(declare-fun res!11980 () Bool)

(assert (=> b!12553 (=> (not res!11980) (not e!7598))))

(assert (=> b!12553 (= res!11980 (invariant!0 (currentBit!1715 (_2!771 lt!20360)) (currentByte!1720 (_2!771 lt!20360)) (size!294 (buf!642 (_2!771 lt!20360)))))))

(declare-fun lt!20363 () tuple2!1442)

(declare-fun b!12554 () Bool)

(assert (=> b!12554 (= e!7598 (= (bitStreamReadBitsIntoList!0 (_2!771 lt!20360) (_1!773 lt!20363) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!771 lt!20360) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!12554 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12554 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!20372 () Unit!1047)

(declare-fun lt!20355 () Unit!1047)

(assert (=> b!12554 (= lt!20372 lt!20355)))

(assert (=> b!12554 (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 (_2!771 lt!20360)))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) lt!20375)))

(assert (=> b!12554 (= lt!20355 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!642 (_2!771 lt!20360)) lt!20375))))

(assert (=> b!12554 e!7597))

(declare-fun res!11981 () Bool)

(assert (=> b!12554 (=> (not res!11981) (not e!7597))))

(assert (=> b!12554 (= res!11981 (and (= (size!294 (buf!642 thiss!1486)) (size!294 (buf!642 (_2!771 lt!20360)))) (bvsge lt!20375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12554 (= lt!20375 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!12554 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12554 (= lt!20363 (reader!0 thiss!1486 (_2!771 lt!20360)))))

(assert (= (and d!4098 c!952) b!12550))

(assert (= (and d!4098 (not c!952)) b!12551))

(assert (= (or b!12550 b!12551) bm!254))

(assert (= (and d!4098 res!11979) b!12553))

(assert (= (and b!12553 res!11980) b!12549))

(assert (= (and b!12549 res!11976) b!12548))

(assert (= (and b!12548 res!11978) b!12547))

(assert (= (and b!12547 res!11977) b!12554))

(assert (= (and b!12554 res!11981) b!12552))

(declare-fun m!19007 () Bool)

(assert (=> bm!254 m!19007))

(declare-fun m!19009 () Bool)

(assert (=> b!12554 m!19009))

(declare-fun m!19011 () Bool)

(assert (=> b!12554 m!19011))

(declare-fun m!19013 () Bool)

(assert (=> b!12554 m!19013))

(declare-fun m!19015 () Bool)

(assert (=> b!12554 m!19015))

(declare-fun m!19017 () Bool)

(assert (=> b!12554 m!19017))

(declare-fun m!19019 () Bool)

(assert (=> b!12553 m!19019))

(declare-fun m!19021 () Bool)

(assert (=> b!12550 m!19021))

(declare-fun m!19023 () Bool)

(assert (=> b!12550 m!19023))

(declare-fun m!19025 () Bool)

(assert (=> b!12550 m!19025))

(declare-fun m!19027 () Bool)

(assert (=> b!12550 m!19027))

(declare-fun m!19029 () Bool)

(assert (=> b!12550 m!19029))

(declare-fun m!19031 () Bool)

(assert (=> b!12550 m!19031))

(assert (=> b!12550 m!18639))

(declare-fun m!19033 () Bool)

(assert (=> b!12550 m!19033))

(declare-fun m!19035 () Bool)

(assert (=> b!12550 m!19035))

(declare-fun m!19037 () Bool)

(assert (=> b!12550 m!19037))

(assert (=> b!12550 m!18679))

(declare-fun m!19039 () Bool)

(assert (=> b!12550 m!19039))

(declare-fun m!19041 () Bool)

(assert (=> b!12550 m!19041))

(declare-fun m!19043 () Bool)

(assert (=> b!12550 m!19043))

(declare-fun m!19045 () Bool)

(assert (=> b!12550 m!19045))

(declare-fun m!19047 () Bool)

(assert (=> b!12550 m!19047))

(declare-fun m!19049 () Bool)

(assert (=> b!12550 m!19049))

(declare-fun m!19051 () Bool)

(assert (=> b!12550 m!19051))

(declare-fun m!19053 () Bool)

(assert (=> b!12550 m!19053))

(assert (=> b!12550 m!19041))

(assert (=> b!12550 m!19025))

(declare-fun m!19055 () Bool)

(assert (=> b!12550 m!19055))

(declare-fun m!19057 () Bool)

(assert (=> b!12550 m!19057))

(declare-fun m!19059 () Bool)

(assert (=> b!12550 m!19059))

(declare-fun m!19061 () Bool)

(assert (=> b!12550 m!19061))

(declare-fun m!19063 () Bool)

(assert (=> b!12550 m!19063))

(assert (=> b!12550 m!18679))

(declare-fun m!19065 () Bool)

(assert (=> b!12550 m!19065))

(declare-fun m!19067 () Bool)

(assert (=> b!12550 m!19067))

(declare-fun m!19069 () Bool)

(assert (=> b!12550 m!19069))

(declare-fun m!19071 () Bool)

(assert (=> b!12550 m!19071))

(declare-fun m!19073 () Bool)

(assert (=> b!12550 m!19073))

(declare-fun m!19075 () Bool)

(assert (=> b!12550 m!19075))

(declare-fun m!19077 () Bool)

(assert (=> b!12550 m!19077))

(assert (=> b!12550 m!19067))

(declare-fun m!19079 () Bool)

(assert (=> b!12550 m!19079))

(declare-fun m!19081 () Bool)

(assert (=> b!12548 m!19081))

(declare-fun m!19083 () Bool)

(assert (=> b!12552 m!19083))

(declare-fun m!19085 () Bool)

(assert (=> d!4098 m!19085))

(assert (=> d!4098 m!18639))

(assert (=> d!4098 m!18735))

(assert (=> d!4098 m!18741))

(declare-fun m!19087 () Bool)

(assert (=> b!12551 m!19087))

(declare-fun m!19089 () Bool)

(assert (=> b!12551 m!19089))

(assert (=> b!12324 d!4098))

(declare-fun d!4134 () Bool)

(assert (=> d!4134 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!294 (buf!642 thiss!1486))) ((_ sign_extend 32) (currentByte!1720 thiss!1486)) ((_ sign_extend 32) (currentBit!1715 thiss!1486))) nBits!460))))

(declare-fun bs!1132 () Bool)

(assert (= bs!1132 d!4134))

(assert (=> bs!1132 m!18673))

(assert (=> b!12329 d!4134))

(declare-fun d!4136 () Bool)

(declare-fun res!11995 () Bool)

(declare-fun e!7608 () Bool)

(assert (=> d!4136 (=> (not res!11995) (not e!7608))))

(assert (=> d!4136 (= res!11995 (= (size!294 (buf!642 thiss!1486)) (size!294 (buf!642 (_2!771 lt!19732)))))))

(assert (=> d!4136 (= (isPrefixOf!0 thiss!1486 (_2!771 lt!19732)) e!7608)))

(declare-fun b!12571 () Bool)

(declare-fun res!11996 () Bool)

(assert (=> b!12571 (=> (not res!11996) (not e!7608))))

(assert (=> b!12571 (= res!11996 (bvsle (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486)) (bitIndex!0 (size!294 (buf!642 (_2!771 lt!19732))) (currentByte!1720 (_2!771 lt!19732)) (currentBit!1715 (_2!771 lt!19732)))))))

(declare-fun b!12572 () Bool)

(declare-fun e!7609 () Bool)

(assert (=> b!12572 (= e!7608 e!7609)))

(declare-fun res!11994 () Bool)

(assert (=> b!12572 (=> res!11994 e!7609)))

(assert (=> b!12572 (= res!11994 (= (size!294 (buf!642 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!12573 () Bool)

(assert (=> b!12573 (= e!7609 (arrayBitRangesEq!0 (buf!642 thiss!1486) (buf!642 (_2!771 lt!19732)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!294 (buf!642 thiss!1486)) (currentByte!1720 thiss!1486) (currentBit!1715 thiss!1486))))))

(assert (= (and d!4136 res!11995) b!12571))

(assert (= (and b!12571 res!11996) b!12572))

(assert (= (and b!12572 (not res!11994)) b!12573))

(assert (=> b!12571 m!18639))

(assert (=> b!12571 m!18637))

(assert (=> b!12573 m!18639))

(assert (=> b!12573 m!18639))

(declare-fun m!19091 () Bool)

(assert (=> b!12573 m!19091))

(assert (=> b!12330 d!4136))

(declare-fun d!4138 () Bool)

(assert (=> d!4138 (= (array_inv!283 (buf!642 thiss!1486)) (bvsge (size!294 (buf!642 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!12325 d!4138))

(push 1)

