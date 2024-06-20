; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1436 () Bool)

(assert start!1436)

(declare-fun b!6797 () Bool)

(declare-fun res!7696 () Bool)

(declare-fun e!4294 () Bool)

(assert (=> b!6797 (=> (not res!7696) (not e!4294))))

(declare-datatypes ((array!474 0))(
  ( (array!475 (arr!604 (Array (_ BitVec 32) (_ BitVec 8))) (size!205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!388 0))(
  ( (BitStream!389 (buf!535 array!474) (currentByte!1532 (_ BitVec 32)) (currentBit!1527 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!532 0))(
  ( (Unit!533) )
))
(declare-datatypes ((tuple2!910 0))(
  ( (tuple2!911 (_1!480 Unit!532) (_2!480 BitStream!388)) )
))
(declare-fun lt!8765 () tuple2!910)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!388)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6797 (= res!7696 (= (bitIndex!0 (size!205 (buf!535 (_2!480 lt!8765))) (currentByte!1532 (_2!480 lt!8765)) (currentBit!1527 (_2!480 lt!8765))) (bvadd (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)) nBits!460)))))

(declare-fun b!6798 () Bool)

(declare-fun res!7693 () Bool)

(declare-fun e!4298 () Bool)

(assert (=> b!6798 (=> (not res!7693) (not e!4298))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6798 (= res!7693 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) nBits!460))))

(declare-fun b!6799 () Bool)

(declare-fun e!4292 () Bool)

(declare-datatypes ((tuple2!912 0))(
  ( (tuple2!913 (_1!481 BitStream!388) (_2!481 BitStream!388)) )
))
(declare-fun lt!8763 () tuple2!912)

(assert (=> b!6799 (= e!4292 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_1!481 lt!8763)))) ((_ sign_extend 32) (currentByte!1532 (_1!481 lt!8763))) ((_ sign_extend 32) (currentBit!1527 (_1!481 lt!8763))) nBits!460))))

(declare-fun b!6800 () Bool)

(declare-fun e!4296 () Bool)

(assert (=> b!6800 (= e!4294 (not e!4296))))

(declare-fun res!7695 () Bool)

(assert (=> b!6800 (=> res!7695 e!4296)))

(declare-datatypes ((List!105 0))(
  ( (Nil!102) (Cons!101 (h!220 Bool) (t!855 List!105)) )
))
(declare-fun lt!8760 () List!105)

(declare-datatypes ((tuple2!914 0))(
  ( (tuple2!915 (_1!482 array!474) (_2!482 BitStream!388)) )
))
(declare-fun lt!8761 () tuple2!914)

(declare-fun byteArrayBitContentToList!0 (BitStream!388 array!474 (_ BitVec 64) (_ BitVec 64)) List!105)

(assert (=> b!6800 (= res!7695 (not (= (byteArrayBitContentToList!0 (_2!480 lt!8765) (_1!482 lt!8761) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8760)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!388 BitStream!388 (_ BitVec 64)) List!105)

(assert (=> b!6800 (= lt!8760 (bitStreamReadBitsIntoList!0 (_2!480 lt!8765) (_1!481 lt!8763) nBits!460))))

(declare-fun readBits!0 (BitStream!388 (_ BitVec 64)) tuple2!914)

(assert (=> b!6800 (= lt!8761 (readBits!0 (_1!481 lt!8763) nBits!460))))

(assert (=> b!6800 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) nBits!460)))

(declare-fun lt!8764 () Unit!532)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!388 array!474 (_ BitVec 64)) Unit!532)

(assert (=> b!6800 (= lt!8764 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!535 (_2!480 lt!8765)) nBits!460))))

(declare-fun reader!0 (BitStream!388 BitStream!388) tuple2!912)

(assert (=> b!6800 (= lt!8763 (reader!0 thiss!1486 (_2!480 lt!8765)))))

(declare-fun b!6801 () Bool)

(declare-fun res!7699 () Bool)

(assert (=> b!6801 (=> res!7699 e!4292)))

(assert (=> b!6801 (= res!7699 (bvsgt nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!6802 () Bool)

(declare-fun res!7702 () Bool)

(assert (=> b!6802 (=> res!7702 e!4296)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!474)

(assert (=> b!6802 (= res!7702 (not (= lt!8760 (byteArrayBitContentToList!0 (_2!480 lt!8765) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6803 () Bool)

(declare-fun e!4297 () Bool)

(declare-fun array_inv!200 (array!474) Bool)

(assert (=> b!6803 (= e!4297 (array_inv!200 (buf!535 thiss!1486)))))

(declare-fun b!6804 () Bool)

(assert (=> b!6804 (= e!4296 e!4292)))

(declare-fun res!7701 () Bool)

(assert (=> b!6804 (=> res!7701 e!4292)))

(declare-fun checkByteArrayBitContent!0 (BitStream!388 array!474 array!474 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6804 (= res!7701 (not (checkByteArrayBitContent!0 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!8762 () Unit!532)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!388 array!474 array!474 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!532)

(assert (=> b!6804 (= lt!8762 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6805 () Bool)

(declare-fun res!7697 () Bool)

(assert (=> b!6805 (=> (not res!7697) (not e!4294))))

(assert (=> b!6805 (= res!7697 (= (size!205 (buf!535 thiss!1486)) (size!205 (buf!535 (_2!480 lt!8765)))))))

(declare-fun b!6806 () Bool)

(declare-fun res!7698 () Bool)

(assert (=> b!6806 (=> (not res!7698) (not e!4294))))

(declare-fun isPrefixOf!0 (BitStream!388 BitStream!388) Bool)

(assert (=> b!6806 (= res!7698 (isPrefixOf!0 thiss!1486 (_2!480 lt!8765)))))

(declare-fun res!7700 () Bool)

(assert (=> start!1436 (=> (not res!7700) (not e!4298))))

(assert (=> start!1436 (= res!7700 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!205 srcBuffer!6))))))))

(assert (=> start!1436 e!4298))

(assert (=> start!1436 true))

(assert (=> start!1436 (array_inv!200 srcBuffer!6)))

(declare-fun inv!12 (BitStream!388) Bool)

(assert (=> start!1436 (and (inv!12 thiss!1486) e!4297)))

(declare-fun b!6807 () Bool)

(assert (=> b!6807 (= e!4298 e!4294)))

(declare-fun res!7694 () Bool)

(assert (=> b!6807 (=> (not res!7694) (not e!4294))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6807 (= res!7694 (invariant!0 (currentBit!1527 (_2!480 lt!8765)) (currentByte!1532 (_2!480 lt!8765)) (size!205 (buf!535 (_2!480 lt!8765)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!388 array!474 (_ BitVec 64) (_ BitVec 64)) tuple2!910)

(assert (=> b!6807 (= lt!8765 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1436 res!7700) b!6798))

(assert (= (and b!6798 res!7693) b!6807))

(assert (= (and b!6807 res!7694) b!6805))

(assert (= (and b!6805 res!7697) b!6797))

(assert (= (and b!6797 res!7696) b!6806))

(assert (= (and b!6806 res!7698) b!6800))

(assert (= (and b!6800 (not res!7695)) b!6802))

(assert (= (and b!6802 (not res!7702)) b!6804))

(assert (= (and b!6804 (not res!7701)) b!6801))

(assert (= (and b!6801 (not res!7699)) b!6799))

(assert (= start!1436 b!6803))

(declare-fun m!8595 () Bool)

(assert (=> b!6798 m!8595))

(declare-fun m!8597 () Bool)

(assert (=> b!6802 m!8597))

(declare-fun m!8599 () Bool)

(assert (=> b!6803 m!8599))

(declare-fun m!8601 () Bool)

(assert (=> b!6804 m!8601))

(declare-fun m!8603 () Bool)

(assert (=> b!6804 m!8603))

(declare-fun m!8605 () Bool)

(assert (=> b!6797 m!8605))

(declare-fun m!8607 () Bool)

(assert (=> b!6797 m!8607))

(declare-fun m!8609 () Bool)

(assert (=> b!6800 m!8609))

(declare-fun m!8611 () Bool)

(assert (=> b!6800 m!8611))

(declare-fun m!8613 () Bool)

(assert (=> b!6800 m!8613))

(declare-fun m!8615 () Bool)

(assert (=> b!6800 m!8615))

(declare-fun m!8617 () Bool)

(assert (=> b!6800 m!8617))

(declare-fun m!8619 () Bool)

(assert (=> b!6800 m!8619))

(declare-fun m!8621 () Bool)

(assert (=> b!6807 m!8621))

(declare-fun m!8623 () Bool)

(assert (=> b!6807 m!8623))

(declare-fun m!8625 () Bool)

(assert (=> start!1436 m!8625))

(declare-fun m!8627 () Bool)

(assert (=> start!1436 m!8627))

(declare-fun m!8629 () Bool)

(assert (=> b!6799 m!8629))

(declare-fun m!8631 () Bool)

(assert (=> b!6806 m!8631))

(push 1)

(assert (not b!6798))

(assert (not b!6802))

(assert (not b!6804))

(assert (not b!6800))

(assert (not b!6807))

(assert (not b!6806))

(assert (not b!6797))

(assert (not b!6799))

(assert (not start!1436))

(assert (not b!6803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2122 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2122 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486))) nBits!460))))

(declare-fun bs!752 () Bool)

(assert (= bs!752 d!2122))

(declare-fun m!8709 () Bool)

(assert (=> bs!752 m!8709))

(assert (=> b!6798 d!2122))

(declare-fun d!2124 () Bool)

(assert (=> d!2124 (= (array_inv!200 (buf!535 thiss!1486)) (bvsge (size!205 (buf!535 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!6803 d!2124))

(declare-fun d!2126 () Bool)

(declare-fun res!7776 () Bool)

(declare-fun e!4354 () Bool)

(assert (=> d!2126 (=> res!7776 e!4354)))

(assert (=> d!2126 (= res!7776 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2126 (= (checkByteArrayBitContent!0 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4354)))

(declare-fun b!6893 () Bool)

(declare-fun e!4355 () Bool)

(assert (=> b!6893 (= e!4354 e!4355)))

(declare-fun res!7777 () Bool)

(assert (=> b!6893 (=> (not res!7777) (not e!4355))))

(assert (=> b!6893 (= res!7777 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!604 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!604 (_1!482 lt!8761)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!6894 () Bool)

(assert (=> b!6894 (= e!4355 (checkByteArrayBitContent!0 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2126 (not res!7776)) b!6893))

(assert (= (and b!6893 res!7777) b!6894))

(declare-fun m!8721 () Bool)

(assert (=> b!6893 m!8721))

(declare-fun m!8723 () Bool)

(assert (=> b!6893 m!8723))

(declare-fun m!8725 () Bool)

(assert (=> b!6893 m!8725))

(declare-fun m!8727 () Bool)

(assert (=> b!6893 m!8727))

(declare-fun m!8729 () Bool)

(assert (=> b!6894 m!8729))

(assert (=> b!6804 d!2126))

(declare-fun d!2136 () Bool)

(assert (=> d!2136 (checkByteArrayBitContent!0 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!8807 () Unit!532)

(declare-fun choose!65 (BitStream!388 array!474 array!474 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!532)

(assert (=> d!2136 (= lt!8807 (choose!65 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2136 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2136 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!480 lt!8765) srcBuffer!6 (_1!482 lt!8761) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8807)))

(declare-fun bs!755 () Bool)

(assert (= bs!755 d!2136))

(assert (=> bs!755 m!8601))

(declare-fun m!8741 () Bool)

(assert (=> bs!755 m!8741))

(assert (=> b!6804 d!2136))

(declare-fun d!2146 () Bool)

(declare-fun c!348 () Bool)

(assert (=> d!2146 (= c!348 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4365 () List!105)

(assert (=> d!2146 (= (byteArrayBitContentToList!0 (_2!480 lt!8765) srcBuffer!6 from!367 nBits!460) e!4365)))

(declare-fun b!6910 () Bool)

(assert (=> b!6910 (= e!4365 Nil!102)))

(declare-fun b!6911 () Bool)

(assert (=> b!6911 (= e!4365 (Cons!101 (not (= (bvand ((_ sign_extend 24) (select (arr!604 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!480 lt!8765) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2146 c!348) b!6910))

(assert (= (and d!2146 (not c!348)) b!6911))

(assert (=> b!6911 m!8721))

(assert (=> b!6911 m!8723))

(declare-fun m!8745 () Bool)

(assert (=> b!6911 m!8745))

(assert (=> b!6802 d!2146))

(declare-fun d!2150 () Bool)

(assert (=> d!2150 (= (invariant!0 (currentBit!1527 (_2!480 lt!8765)) (currentByte!1532 (_2!480 lt!8765)) (size!205 (buf!535 (_2!480 lt!8765)))) (and (bvsge (currentBit!1527 (_2!480 lt!8765)) #b00000000000000000000000000000000) (bvslt (currentBit!1527 (_2!480 lt!8765)) #b00000000000000000000000000001000) (bvsge (currentByte!1532 (_2!480 lt!8765)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1532 (_2!480 lt!8765)) (size!205 (buf!535 (_2!480 lt!8765)))) (and (= (currentBit!1527 (_2!480 lt!8765)) #b00000000000000000000000000000000) (= (currentByte!1532 (_2!480 lt!8765)) (size!205 (buf!535 (_2!480 lt!8765))))))))))

(assert (=> b!6807 d!2150))

(declare-fun b!6998 () Bool)

(declare-fun e!4402 () Bool)

(declare-fun lt!9092 () tuple2!912)

(declare-fun lt!9122 () tuple2!910)

(assert (=> b!6998 (= e!4402 (= (bitStreamReadBitsIntoList!0 (_2!480 lt!9122) (_1!481 lt!9092) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!480 lt!9122) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!6998 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6998 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!9103 () Unit!532)

(declare-fun lt!9109 () Unit!532)

(assert (=> b!6998 (= lt!9103 lt!9109)))

(declare-fun lt!9117 () (_ BitVec 64))

(assert (=> b!6998 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!9122)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) lt!9117)))

(assert (=> b!6998 (= lt!9109 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!535 (_2!480 lt!9122)) lt!9117))))

(declare-fun e!4404 () Bool)

(assert (=> b!6998 e!4404))

(declare-fun res!7843 () Bool)

(assert (=> b!6998 (=> (not res!7843) (not e!4404))))

(assert (=> b!6998 (= res!7843 (and (= (size!205 (buf!535 thiss!1486)) (size!205 (buf!535 (_2!480 lt!9122)))) (bvsge lt!9117 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6998 (= lt!9117 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!6998 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6998 (= lt!9092 (reader!0 thiss!1486 (_2!480 lt!9122)))))

(declare-fun b!6999 () Bool)

(declare-fun e!4403 () tuple2!910)

(declare-fun Unit!539 () Unit!532)

(assert (=> b!6999 (= e!4403 (tuple2!911 Unit!539 thiss!1486))))

(assert (=> b!6999 (= (size!205 (buf!535 thiss!1486)) (size!205 (buf!535 thiss!1486)))))

(declare-fun lt!9125 () Unit!532)

(declare-fun Unit!540 () Unit!532)

(assert (=> b!6999 (= lt!9125 Unit!540)))

(declare-fun call!79 () tuple2!912)

(assert (=> b!6999 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!482 (readBits!0 (_1!481 call!79) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!7000 () Bool)

(assert (=> b!7000 (= e!4404 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) lt!9117))))

(declare-fun b!7001 () Bool)

(declare-fun res!7844 () Bool)

(assert (=> b!7001 (=> (not res!7844) (not e!4402))))

(assert (=> b!7001 (= res!7844 (= (size!205 (buf!535 (_2!480 lt!9122))) (size!205 (buf!535 thiss!1486))))))

(declare-fun b!7002 () Bool)

(declare-fun res!7841 () Bool)

(assert (=> b!7002 (=> (not res!7841) (not e!4402))))

(assert (=> b!7002 (= res!7841 (invariant!0 (currentBit!1527 (_2!480 lt!9122)) (currentByte!1532 (_2!480 lt!9122)) (size!205 (buf!535 (_2!480 lt!9122)))))))

(declare-fun b!7003 () Bool)

(declare-fun res!7846 () Bool)

(assert (=> b!7003 (=> (not res!7846) (not e!4402))))

(assert (=> b!7003 (= res!7846 (isPrefixOf!0 thiss!1486 (_2!480 lt!9122)))))

(declare-fun b!7004 () Bool)

(declare-fun lt!9107 () tuple2!910)

(declare-fun Unit!541 () Unit!532)

(assert (=> b!7004 (= e!4403 (tuple2!911 Unit!541 (_2!480 lt!9107)))))

(declare-fun lt!9083 () tuple2!910)

(declare-fun appendBitFromByte!0 (BitStream!388 (_ BitVec 8) (_ BitVec 32)) tuple2!910)

(assert (=> b!7004 (= lt!9083 (appendBitFromByte!0 thiss!1486 (select (arr!604 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!9106 () (_ BitVec 64))

(assert (=> b!7004 (= lt!9106 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9100 () (_ BitVec 64))

(assert (=> b!7004 (= lt!9100 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9086 () Unit!532)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!388 BitStream!388 (_ BitVec 64) (_ BitVec 64)) Unit!532)

(assert (=> b!7004 (= lt!9086 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!480 lt!9083) lt!9106 lt!9100))))

(assert (=> b!7004 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!9083)))) ((_ sign_extend 32) (currentByte!1532 (_2!480 lt!9083))) ((_ sign_extend 32) (currentBit!1527 (_2!480 lt!9083))) (bvsub lt!9106 lt!9100))))

(declare-fun lt!9085 () Unit!532)

(assert (=> b!7004 (= lt!9085 lt!9086)))

(declare-fun lt!9101 () tuple2!912)

(assert (=> b!7004 (= lt!9101 call!79)))

(declare-fun lt!9104 () (_ BitVec 64))

(assert (=> b!7004 (= lt!9104 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9108 () Unit!532)

(assert (=> b!7004 (= lt!9108 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!535 (_2!480 lt!9083)) lt!9104))))

(assert (=> b!7004 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!9083)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) lt!9104)))

(declare-fun lt!9097 () Unit!532)

(assert (=> b!7004 (= lt!9097 lt!9108)))

(declare-fun head!29 (List!105) Bool)

(assert (=> b!7004 (= (head!29 (byteArrayBitContentToList!0 (_2!480 lt!9083) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!29 (bitStreamReadBitsIntoList!0 (_2!480 lt!9083) (_1!481 lt!9101) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9119 () Unit!532)

(declare-fun Unit!542 () Unit!532)

(assert (=> b!7004 (= lt!9119 Unit!542)))

(assert (=> b!7004 (= lt!9107 (appendBitsMSBFirstLoop!0 (_2!480 lt!9083) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!9095 () Unit!532)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!388 BitStream!388 BitStream!388) Unit!532)

(assert (=> b!7004 (= lt!9095 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!480 lt!9083) (_2!480 lt!9107)))))

(assert (=> b!7004 (isPrefixOf!0 thiss!1486 (_2!480 lt!9107))))

(declare-fun lt!9115 () Unit!532)

(assert (=> b!7004 (= lt!9115 lt!9095)))

(assert (=> b!7004 (= (size!205 (buf!535 (_2!480 lt!9107))) (size!205 (buf!535 thiss!1486)))))

(declare-fun lt!9105 () Unit!532)

(declare-fun Unit!543 () Unit!532)

(assert (=> b!7004 (= lt!9105 Unit!543)))

(assert (=> b!7004 (= (bitIndex!0 (size!205 (buf!535 (_2!480 lt!9107))) (currentByte!1532 (_2!480 lt!9107)) (currentBit!1527 (_2!480 lt!9107))) (bvsub (bvadd (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!9084 () Unit!532)

(declare-fun Unit!544 () Unit!532)

(assert (=> b!7004 (= lt!9084 Unit!544)))

(assert (=> b!7004 (= (bitIndex!0 (size!205 (buf!535 (_2!480 lt!9107))) (currentByte!1532 (_2!480 lt!9107)) (currentBit!1527 (_2!480 lt!9107))) (bvsub (bvsub (bvadd (bitIndex!0 (size!205 (buf!535 (_2!480 lt!9083))) (currentByte!1532 (_2!480 lt!9083)) (currentBit!1527 (_2!480 lt!9083))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!9121 () Unit!532)

(declare-fun Unit!545 () Unit!532)

(assert (=> b!7004 (= lt!9121 Unit!545)))

(declare-fun lt!9102 () tuple2!912)

(assert (=> b!7004 (= lt!9102 (reader!0 thiss!1486 (_2!480 lt!9107)))))

(declare-fun lt!9112 () (_ BitVec 64))

(assert (=> b!7004 (= lt!9112 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9098 () Unit!532)

(assert (=> b!7004 (= lt!9098 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!535 (_2!480 lt!9107)) lt!9112))))

(assert (=> b!7004 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!9107)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) lt!9112)))

(declare-fun lt!9111 () Unit!532)

(assert (=> b!7004 (= lt!9111 lt!9098)))

(declare-fun lt!9116 () tuple2!912)

(assert (=> b!7004 (= lt!9116 (reader!0 (_2!480 lt!9083) (_2!480 lt!9107)))))

(declare-fun lt!9094 () (_ BitVec 64))

(assert (=> b!7004 (= lt!9094 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!9120 () Unit!532)

(assert (=> b!7004 (= lt!9120 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!480 lt!9083) (buf!535 (_2!480 lt!9107)) lt!9094))))

(assert (=> b!7004 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!9107)))) ((_ sign_extend 32) (currentByte!1532 (_2!480 lt!9083))) ((_ sign_extend 32) (currentBit!1527 (_2!480 lt!9083))) lt!9094)))

(declare-fun lt!9093 () Unit!532)

(assert (=> b!7004 (= lt!9093 lt!9120)))

(declare-fun lt!9099 () List!105)

(assert (=> b!7004 (= lt!9099 (byteArrayBitContentToList!0 (_2!480 lt!9107) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!9114 () List!105)

(assert (=> b!7004 (= lt!9114 (byteArrayBitContentToList!0 (_2!480 lt!9107) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9096 () List!105)

(assert (=> b!7004 (= lt!9096 (bitStreamReadBitsIntoList!0 (_2!480 lt!9107) (_1!481 lt!9102) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!9110 () List!105)

(assert (=> b!7004 (= lt!9110 (bitStreamReadBitsIntoList!0 (_2!480 lt!9107) (_1!481 lt!9116) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9087 () (_ BitVec 64))

(assert (=> b!7004 (= lt!9087 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9089 () Unit!532)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!388 BitStream!388 BitStream!388 BitStream!388 (_ BitVec 64) List!105) Unit!532)

(assert (=> b!7004 (= lt!9089 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!480 lt!9107) (_2!480 lt!9107) (_1!481 lt!9102) (_1!481 lt!9116) lt!9087 lt!9096))))

(declare-fun tail!37 (List!105) List!105)

(assert (=> b!7004 (= (bitStreamReadBitsIntoList!0 (_2!480 lt!9107) (_1!481 lt!9116) (bvsub lt!9087 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!37 lt!9096))))

(declare-fun lt!9124 () Unit!532)

(assert (=> b!7004 (= lt!9124 lt!9089)))

(declare-fun lt!9123 () (_ BitVec 64))

(declare-fun lt!9113 () Unit!532)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!474 array!474 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!532)

(assert (=> b!7004 (= lt!9113 (arrayBitRangesEqImpliesEq!0 (buf!535 (_2!480 lt!9083)) (buf!535 (_2!480 lt!9107)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!9123 (bitIndex!0 (size!205 (buf!535 (_2!480 lt!9083))) (currentByte!1532 (_2!480 lt!9083)) (currentBit!1527 (_2!480 lt!9083)))))))

(declare-fun bitAt!0 (array!474 (_ BitVec 64)) Bool)

(assert (=> b!7004 (= (bitAt!0 (buf!535 (_2!480 lt!9083)) lt!9123) (bitAt!0 (buf!535 (_2!480 lt!9107)) lt!9123))))

(declare-fun lt!9090 () Unit!532)

(assert (=> b!7004 (= lt!9090 lt!9113)))

(declare-fun c!365 () Bool)

(declare-fun bm!76 () Bool)

(assert (=> bm!76 (= call!79 (reader!0 thiss!1486 (ite c!365 (_2!480 lt!9083) thiss!1486)))))

(declare-fun d!2152 () Bool)

(assert (=> d!2152 e!4402))

(declare-fun res!7842 () Bool)

(assert (=> d!2152 (=> (not res!7842) (not e!4402))))

(declare-fun lt!9088 () (_ BitVec 64))

(assert (=> d!2152 (= res!7842 (= (bitIndex!0 (size!205 (buf!535 (_2!480 lt!9122))) (currentByte!1532 (_2!480 lt!9122)) (currentBit!1527 (_2!480 lt!9122))) (bvsub lt!9088 from!367)))))

(assert (=> d!2152 (or (= (bvand lt!9088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9088 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!9126 () (_ BitVec 64))

(assert (=> d!2152 (= lt!9088 (bvadd lt!9126 from!367 nBits!460))))

(assert (=> d!2152 (or (not (= (bvand lt!9126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!9126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!9126 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2152 (= lt!9126 (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)))))

(assert (=> d!2152 (= lt!9122 e!4403)))

(assert (=> d!2152 (= c!365 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!9091 () Unit!532)

(declare-fun lt!9118 () Unit!532)

(assert (=> d!2152 (= lt!9091 lt!9118)))

(assert (=> d!2152 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!388) Unit!532)

(assert (=> d!2152 (= lt!9118 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2152 (= lt!9123 (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)))))

(assert (=> d!2152 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2152 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!9122)))

(declare-fun b!7005 () Bool)

(declare-fun res!7845 () Bool)

(assert (=> b!7005 (=> (not res!7845) (not e!4402))))

(assert (=> b!7005 (= res!7845 (= (size!205 (buf!535 thiss!1486)) (size!205 (buf!535 (_2!480 lt!9122)))))))

(assert (= (and d!2152 c!365) b!7004))

(assert (= (and d!2152 (not c!365)) b!6999))

(assert (= (or b!7004 b!6999) bm!76))

(assert (= (and d!2152 res!7842) b!7002))

(assert (= (and b!7002 res!7841) b!7005))

(assert (= (and b!7005 res!7845) b!7003))

(assert (= (and b!7003 res!7846) b!7001))

(assert (= (and b!7001 res!7844) b!6998))

(assert (= (and b!6998 res!7843) b!7000))

(declare-fun m!8815 () Bool)

(assert (=> b!6998 m!8815))

(declare-fun m!8817 () Bool)

(assert (=> b!6998 m!8817))

(declare-fun m!8819 () Bool)

(assert (=> b!6998 m!8819))

(declare-fun m!8821 () Bool)

(assert (=> b!6998 m!8821))

(declare-fun m!8823 () Bool)

(assert (=> b!6998 m!8823))

(declare-fun m!8825 () Bool)

(assert (=> b!7004 m!8825))

(declare-fun m!8827 () Bool)

(assert (=> b!7004 m!8827))

(declare-fun m!8829 () Bool)

(assert (=> b!7004 m!8829))

(declare-fun m!8831 () Bool)

(assert (=> b!7004 m!8831))

(assert (=> b!7004 m!8721))

(declare-fun m!8833 () Bool)

(assert (=> b!7004 m!8833))

(declare-fun m!8835 () Bool)

(assert (=> b!7004 m!8835))

(declare-fun m!8837 () Bool)

(assert (=> b!7004 m!8837))

(declare-fun m!8839 () Bool)

(assert (=> b!7004 m!8839))

(declare-fun m!8841 () Bool)

(assert (=> b!7004 m!8841))

(declare-fun m!8843 () Bool)

(assert (=> b!7004 m!8843))

(declare-fun m!8845 () Bool)

(assert (=> b!7004 m!8845))

(assert (=> b!7004 m!8843))

(declare-fun m!8847 () Bool)

(assert (=> b!7004 m!8847))

(declare-fun m!8849 () Bool)

(assert (=> b!7004 m!8849))

(declare-fun m!8851 () Bool)

(assert (=> b!7004 m!8851))

(declare-fun m!8853 () Bool)

(assert (=> b!7004 m!8853))

(declare-fun m!8855 () Bool)

(assert (=> b!7004 m!8855))

(declare-fun m!8857 () Bool)

(assert (=> b!7004 m!8857))

(declare-fun m!8859 () Bool)

(assert (=> b!7004 m!8859))

(declare-fun m!8861 () Bool)

(assert (=> b!7004 m!8861))

(declare-fun m!8863 () Bool)

(assert (=> b!7004 m!8863))

(assert (=> b!7004 m!8721))

(declare-fun m!8865 () Bool)

(assert (=> b!7004 m!8865))

(declare-fun m!8867 () Bool)

(assert (=> b!7004 m!8867))

(declare-fun m!8869 () Bool)

(assert (=> b!7004 m!8869))

(declare-fun m!8871 () Bool)

(assert (=> b!7004 m!8871))

(declare-fun m!8873 () Bool)

(assert (=> b!7004 m!8873))

(assert (=> b!7004 m!8607))

(declare-fun m!8875 () Bool)

(assert (=> b!7004 m!8875))

(declare-fun m!8877 () Bool)

(assert (=> b!7004 m!8877))

(assert (=> b!7004 m!8861))

(assert (=> b!7004 m!8835))

(declare-fun m!8879 () Bool)

(assert (=> b!7004 m!8879))

(declare-fun m!8881 () Bool)

(assert (=> b!7004 m!8881))

(declare-fun m!8883 () Bool)

(assert (=> b!7004 m!8883))

(declare-fun m!8885 () Bool)

(assert (=> b!6999 m!8885))

(declare-fun m!8887 () Bool)

(assert (=> b!6999 m!8887))

(declare-fun m!8889 () Bool)

(assert (=> b!7000 m!8889))

(declare-fun m!8891 () Bool)

(assert (=> b!7003 m!8891))

(declare-fun m!8893 () Bool)

(assert (=> b!7002 m!8893))

(declare-fun m!8895 () Bool)

(assert (=> bm!76 m!8895))

(declare-fun m!8897 () Bool)

(assert (=> d!2152 m!8897))

(assert (=> d!2152 m!8607))

(declare-fun m!8899 () Bool)

(assert (=> d!2152 m!8899))

(declare-fun m!8901 () Bool)

(assert (=> d!2152 m!8901))

(assert (=> b!6807 d!2152))

(declare-fun d!2178 () Bool)

(declare-fun e!4410 () Bool)

(assert (=> d!2178 e!4410))

(declare-fun res!7857 () Bool)

(assert (=> d!2178 (=> (not res!7857) (not e!4410))))

(declare-fun lt!9186 () (_ BitVec 64))

(declare-fun lt!9183 () (_ BitVec 64))

(declare-fun lt!9185 () (_ BitVec 64))

(assert (=> d!2178 (= res!7857 (= lt!9185 (bvsub lt!9186 lt!9183)))))

(assert (=> d!2178 (or (= (bvand lt!9186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9183 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9186 lt!9183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2178 (= lt!9183 (remainingBits!0 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))) ((_ sign_extend 32) (currentByte!1532 (_2!480 lt!8765))) ((_ sign_extend 32) (currentBit!1527 (_2!480 lt!8765)))))))

(declare-fun lt!9188 () (_ BitVec 64))

(declare-fun lt!9187 () (_ BitVec 64))

(assert (=> d!2178 (= lt!9186 (bvmul lt!9188 lt!9187))))

(assert (=> d!2178 (or (= lt!9188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!9187 (bvsdiv (bvmul lt!9188 lt!9187) lt!9188)))))

(assert (=> d!2178 (= lt!9187 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2178 (= lt!9188 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))))))

(assert (=> d!2178 (= lt!9185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1532 (_2!480 lt!8765))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1527 (_2!480 lt!8765)))))))

(assert (=> d!2178 (invariant!0 (currentBit!1527 (_2!480 lt!8765)) (currentByte!1532 (_2!480 lt!8765)) (size!205 (buf!535 (_2!480 lt!8765))))))

(assert (=> d!2178 (= (bitIndex!0 (size!205 (buf!535 (_2!480 lt!8765))) (currentByte!1532 (_2!480 lt!8765)) (currentBit!1527 (_2!480 lt!8765))) lt!9185)))

(declare-fun b!7018 () Bool)

(declare-fun res!7858 () Bool)

(assert (=> b!7018 (=> (not res!7858) (not e!4410))))

(assert (=> b!7018 (= res!7858 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!9185))))

(declare-fun b!7019 () Bool)

(declare-fun lt!9184 () (_ BitVec 64))

(assert (=> b!7019 (= e!4410 (bvsle lt!9185 (bvmul lt!9184 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7019 (or (= lt!9184 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!9184 #b0000000000000000000000000000000000000000000000000000000000001000) lt!9184)))))

(assert (=> b!7019 (= lt!9184 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))))))

(assert (= (and d!2178 res!7857) b!7018))

(assert (= (and b!7018 res!7858) b!7019))

(declare-fun m!8993 () Bool)

(assert (=> d!2178 m!8993))

(assert (=> d!2178 m!8621))

(assert (=> b!6797 d!2178))

(declare-fun d!2184 () Bool)

(declare-fun e!4411 () Bool)

(assert (=> d!2184 e!4411))

(declare-fun res!7859 () Bool)

(assert (=> d!2184 (=> (not res!7859) (not e!4411))))

(declare-fun lt!9192 () (_ BitVec 64))

(declare-fun lt!9191 () (_ BitVec 64))

(declare-fun lt!9189 () (_ BitVec 64))

(assert (=> d!2184 (= res!7859 (= lt!9191 (bvsub lt!9192 lt!9189)))))

(assert (=> d!2184 (or (= (bvand lt!9192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9192 lt!9189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2184 (= lt!9189 (remainingBits!0 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486))))))

(declare-fun lt!9194 () (_ BitVec 64))

(declare-fun lt!9193 () (_ BitVec 64))

(assert (=> d!2184 (= lt!9192 (bvmul lt!9194 lt!9193))))

(assert (=> d!2184 (or (= lt!9194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!9193 (bvsdiv (bvmul lt!9194 lt!9193) lt!9194)))))

(assert (=> d!2184 (= lt!9193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2184 (= lt!9194 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))))))

(assert (=> d!2184 (= lt!9191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1532 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1527 thiss!1486))))))

(assert (=> d!2184 (invariant!0 (currentBit!1527 thiss!1486) (currentByte!1532 thiss!1486) (size!205 (buf!535 thiss!1486)))))

(assert (=> d!2184 (= (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)) lt!9191)))

(declare-fun b!7020 () Bool)

(declare-fun res!7860 () Bool)

(assert (=> b!7020 (=> (not res!7860) (not e!4411))))

(assert (=> b!7020 (= res!7860 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!9191))))

(declare-fun b!7021 () Bool)

(declare-fun lt!9190 () (_ BitVec 64))

(assert (=> b!7021 (= e!4411 (bvsle lt!9191 (bvmul lt!9190 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7021 (or (= lt!9190 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!9190 #b0000000000000000000000000000000000000000000000000000000000001000) lt!9190)))))

(assert (=> b!7021 (= lt!9190 ((_ sign_extend 32) (size!205 (buf!535 thiss!1486))))))

(assert (= (and d!2184 res!7859) b!7020))

(assert (= (and b!7020 res!7860) b!7021))

(assert (=> d!2184 m!8709))

(declare-fun m!8995 () Bool)

(assert (=> d!2184 m!8995))

(assert (=> b!6797 d!2184))

(declare-fun d!2186 () Bool)

(declare-fun res!7877 () Bool)

(declare-fun e!4420 () Bool)

(assert (=> d!2186 (=> (not res!7877) (not e!4420))))

(assert (=> d!2186 (= res!7877 (= (size!205 (buf!535 thiss!1486)) (size!205 (buf!535 (_2!480 lt!8765)))))))

(assert (=> d!2186 (= (isPrefixOf!0 thiss!1486 (_2!480 lt!8765)) e!4420)))

(declare-fun b!7036 () Bool)

(declare-fun res!7876 () Bool)

(assert (=> b!7036 (=> (not res!7876) (not e!4420))))

(assert (=> b!7036 (= res!7876 (bvsle (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)) (bitIndex!0 (size!205 (buf!535 (_2!480 lt!8765))) (currentByte!1532 (_2!480 lt!8765)) (currentBit!1527 (_2!480 lt!8765)))))))

(declare-fun b!7037 () Bool)

(declare-fun e!4421 () Bool)

(assert (=> b!7037 (= e!4420 e!4421)))

(declare-fun res!7875 () Bool)

(assert (=> b!7037 (=> res!7875 e!4421)))

(assert (=> b!7037 (= res!7875 (= (size!205 (buf!535 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!7038 () Bool)

(declare-fun arrayBitRangesEq!0 (array!474 array!474 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7038 (= e!4421 (arrayBitRangesEq!0 (buf!535 thiss!1486) (buf!535 (_2!480 lt!8765)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486))))))

(assert (= (and d!2186 res!7877) b!7036))

(assert (= (and b!7036 res!7876) b!7037))

(assert (= (and b!7037 (not res!7875)) b!7038))

(assert (=> b!7036 m!8607))

(assert (=> b!7036 m!8605))

(assert (=> b!7038 m!8607))

(assert (=> b!7038 m!8607))

(declare-fun m!8999 () Bool)

(assert (=> b!7038 m!8999))

(assert (=> b!6806 d!2186))

(declare-fun d!2194 () Bool)

(assert (=> d!2194 (= (array_inv!200 srcBuffer!6) (bvsge (size!205 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1436 d!2194))

(declare-fun d!2196 () Bool)

(assert (=> d!2196 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1527 thiss!1486) (currentByte!1532 thiss!1486) (size!205 (buf!535 thiss!1486))))))

(declare-fun bs!761 () Bool)

(assert (= bs!761 d!2196))

(assert (=> bs!761 m!8995))

(assert (=> start!1436 d!2196))

(declare-fun d!2198 () Bool)

(assert (=> d!2198 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_1!481 lt!8763)))) ((_ sign_extend 32) (currentByte!1532 (_1!481 lt!8763))) ((_ sign_extend 32) (currentBit!1527 (_1!481 lt!8763))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!205 (buf!535 (_1!481 lt!8763)))) ((_ sign_extend 32) (currentByte!1532 (_1!481 lt!8763))) ((_ sign_extend 32) (currentBit!1527 (_1!481 lt!8763)))) nBits!460))))

(declare-fun bs!762 () Bool)

(assert (= bs!762 d!2198))

(declare-fun m!9001 () Bool)

(assert (=> bs!762 m!9001))

(assert (=> b!6799 d!2198))

(declare-fun d!2200 () Bool)

(assert (=> d!2200 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486))) nBits!460))))

(declare-fun bs!763 () Bool)

(assert (= bs!763 d!2200))

(declare-fun m!9003 () Bool)

(assert (=> bs!763 m!9003))

(assert (=> b!6800 d!2200))

(declare-fun d!2202 () Bool)

(declare-fun c!367 () Bool)

(assert (=> d!2202 (= c!367 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4422 () List!105)

(assert (=> d!2202 (= (byteArrayBitContentToList!0 (_2!480 lt!8765) (_1!482 lt!8761) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4422)))

(declare-fun b!7039 () Bool)

(assert (=> b!7039 (= e!4422 Nil!102)))

(declare-fun b!7040 () Bool)

(assert (=> b!7040 (= e!4422 (Cons!101 (not (= (bvand ((_ sign_extend 24) (select (arr!604 (_1!482 lt!8761)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!480 lt!8765) (_1!482 lt!8761) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2202 c!367) b!7039))

(assert (= (and d!2202 (not c!367)) b!7040))

(assert (=> b!7040 m!8725))

(assert (=> b!7040 m!8727))

(declare-fun m!9005 () Bool)

(assert (=> b!7040 m!9005))

(assert (=> b!6800 d!2202))

(declare-fun d!2204 () Bool)

(declare-fun e!4439 () Bool)

(assert (=> d!2204 e!4439))

(declare-fun res!7905 () Bool)

(assert (=> d!2204 (=> (not res!7905) (not e!4439))))

(declare-fun lt!9416 () tuple2!912)

(assert (=> d!2204 (= res!7905 (isPrefixOf!0 (_1!481 lt!9416) (_2!481 lt!9416)))))

(declare-fun lt!9407 () BitStream!388)

(assert (=> d!2204 (= lt!9416 (tuple2!913 lt!9407 (_2!480 lt!8765)))))

(declare-fun lt!9410 () Unit!532)

(declare-fun lt!9425 () Unit!532)

(assert (=> d!2204 (= lt!9410 lt!9425)))

(assert (=> d!2204 (isPrefixOf!0 lt!9407 (_2!480 lt!8765))))

(assert (=> d!2204 (= lt!9425 (lemmaIsPrefixTransitive!0 lt!9407 (_2!480 lt!8765) (_2!480 lt!8765)))))

(declare-fun lt!9409 () Unit!532)

(declare-fun lt!9420 () Unit!532)

(assert (=> d!2204 (= lt!9409 lt!9420)))

(assert (=> d!2204 (isPrefixOf!0 lt!9407 (_2!480 lt!8765))))

(assert (=> d!2204 (= lt!9420 (lemmaIsPrefixTransitive!0 lt!9407 thiss!1486 (_2!480 lt!8765)))))

(declare-fun lt!9413 () Unit!532)

(declare-fun e!4440 () Unit!532)

(assert (=> d!2204 (= lt!9413 e!4440)))

(declare-fun c!375 () Bool)

(assert (=> d!2204 (= c!375 (not (= (size!205 (buf!535 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!9421 () Unit!532)

(declare-fun lt!9408 () Unit!532)

(assert (=> d!2204 (= lt!9421 lt!9408)))

(assert (=> d!2204 (isPrefixOf!0 (_2!480 lt!8765) (_2!480 lt!8765))))

(assert (=> d!2204 (= lt!9408 (lemmaIsPrefixRefl!0 (_2!480 lt!8765)))))

(declare-fun lt!9419 () Unit!532)

(declare-fun lt!9412 () Unit!532)

(assert (=> d!2204 (= lt!9419 lt!9412)))

(assert (=> d!2204 (= lt!9412 (lemmaIsPrefixRefl!0 (_2!480 lt!8765)))))

(declare-fun lt!9411 () Unit!532)

(declare-fun lt!9422 () Unit!532)

(assert (=> d!2204 (= lt!9411 lt!9422)))

(assert (=> d!2204 (isPrefixOf!0 lt!9407 lt!9407)))

(assert (=> d!2204 (= lt!9422 (lemmaIsPrefixRefl!0 lt!9407))))

(declare-fun lt!9426 () Unit!532)

(declare-fun lt!9418 () Unit!532)

(assert (=> d!2204 (= lt!9426 lt!9418)))

(assert (=> d!2204 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2204 (= lt!9418 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2204 (= lt!9407 (BitStream!389 (buf!535 (_2!480 lt!8765)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)))))

(assert (=> d!2204 (isPrefixOf!0 thiss!1486 (_2!480 lt!8765))))

(assert (=> d!2204 (= (reader!0 thiss!1486 (_2!480 lt!8765)) lt!9416)))

(declare-fun b!7082 () Bool)

(declare-fun lt!9424 () (_ BitVec 64))

(declare-fun lt!9417 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!388 (_ BitVec 64)) BitStream!388)

(assert (=> b!7082 (= e!4439 (= (_1!481 lt!9416) (withMovedBitIndex!0 (_2!481 lt!9416) (bvsub lt!9417 lt!9424))))))

(assert (=> b!7082 (or (= (bvand lt!9417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9424 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9417 lt!9424) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7082 (= lt!9424 (bitIndex!0 (size!205 (buf!535 (_2!480 lt!8765))) (currentByte!1532 (_2!480 lt!8765)) (currentBit!1527 (_2!480 lt!8765))))))

(assert (=> b!7082 (= lt!9417 (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)))))

(declare-fun b!7083 () Bool)

(declare-fun res!7907 () Bool)

(assert (=> b!7083 (=> (not res!7907) (not e!4439))))

(assert (=> b!7083 (= res!7907 (isPrefixOf!0 (_1!481 lt!9416) thiss!1486))))

(declare-fun b!7084 () Bool)

(declare-fun res!7906 () Bool)

(assert (=> b!7084 (=> (not res!7906) (not e!4439))))

(assert (=> b!7084 (= res!7906 (isPrefixOf!0 (_2!481 lt!9416) (_2!480 lt!8765)))))

(declare-fun b!7085 () Bool)

(declare-fun Unit!560 () Unit!532)

(assert (=> b!7085 (= e!4440 Unit!560)))

(declare-fun b!7086 () Bool)

(declare-fun lt!9414 () Unit!532)

(assert (=> b!7086 (= e!4440 lt!9414)))

(declare-fun lt!9423 () (_ BitVec 64))

(assert (=> b!7086 (= lt!9423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!9415 () (_ BitVec 64))

(assert (=> b!7086 (= lt!9415 (bitIndex!0 (size!205 (buf!535 thiss!1486)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!474 array!474 (_ BitVec 64) (_ BitVec 64)) Unit!532)

(assert (=> b!7086 (= lt!9414 (arrayBitRangesEqSymmetric!0 (buf!535 thiss!1486) (buf!535 (_2!480 lt!8765)) lt!9423 lt!9415))))

(assert (=> b!7086 (arrayBitRangesEq!0 (buf!535 (_2!480 lt!8765)) (buf!535 thiss!1486) lt!9423 lt!9415)))

(assert (= (and d!2204 c!375) b!7086))

(assert (= (and d!2204 (not c!375)) b!7085))

(assert (= (and d!2204 res!7905) b!7083))

(assert (= (and b!7083 res!7907) b!7084))

(assert (= (and b!7084 res!7906) b!7082))

(assert (=> d!2204 m!8901))

(declare-fun m!9033 () Bool)

(assert (=> d!2204 m!9033))

(declare-fun m!9035 () Bool)

(assert (=> d!2204 m!9035))

(declare-fun m!9037 () Bool)

(assert (=> d!2204 m!9037))

(declare-fun m!9039 () Bool)

(assert (=> d!2204 m!9039))

(assert (=> d!2204 m!8899))

(declare-fun m!9043 () Bool)

(assert (=> d!2204 m!9043))

(declare-fun m!9045 () Bool)

(assert (=> d!2204 m!9045))

(assert (=> d!2204 m!8631))

(declare-fun m!9047 () Bool)

(assert (=> d!2204 m!9047))

(declare-fun m!9049 () Bool)

(assert (=> d!2204 m!9049))

(declare-fun m!9051 () Bool)

(assert (=> b!7083 m!9051))

(declare-fun m!9053 () Bool)

(assert (=> b!7084 m!9053))

(declare-fun m!9055 () Bool)

(assert (=> b!7082 m!9055))

(assert (=> b!7082 m!8605))

(assert (=> b!7082 m!8607))

(assert (=> b!7086 m!8607))

(declare-fun m!9057 () Bool)

(assert (=> b!7086 m!9057))

(declare-fun m!9059 () Bool)

(assert (=> b!7086 m!9059))

(assert (=> b!6800 d!2204))

(declare-fun b!7128 () Bool)

(declare-fun res!7949 () Bool)

(declare-fun e!4456 () Bool)

(assert (=> b!7128 (=> (not res!7949) (not e!4456))))

(declare-fun lt!9535 () tuple2!914)

(declare-fun lt!9537 () (_ BitVec 64))

(assert (=> b!7128 (= res!7949 (= (size!205 (_1!482 lt!9535)) ((_ extract 31 0) lt!9537)))))

(assert (=> b!7128 (and (bvslt lt!9537 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!9537 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!9540 () (_ BitVec 64))

(declare-fun lt!9538 () (_ BitVec 64))

(assert (=> b!7128 (= lt!9537 (bvsdiv lt!9540 lt!9538))))

(assert (=> b!7128 (and (not (= lt!9538 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!9540 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!9538 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!7128 (= lt!9538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!9536 () (_ BitVec 64))

(declare-fun lt!9534 () (_ BitVec 64))

(assert (=> b!7128 (= lt!9540 (bvsub lt!9536 lt!9534))))

(assert (=> b!7128 (or (= (bvand lt!9536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9534 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9536 lt!9534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7128 (= lt!9534 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9542 () (_ BitVec 64))

(assert (=> b!7128 (= lt!9536 (bvadd nBits!460 lt!9542))))

(assert (=> b!7128 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9542 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!9542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7128 (= lt!9542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!7129 () Bool)

(declare-fun res!7948 () Bool)

(assert (=> b!7129 (=> (not res!7948) (not e!4456))))

(assert (=> b!7129 (= res!7948 (invariant!0 (currentBit!1527 (_2!482 lt!9535)) (currentByte!1532 (_2!482 lt!9535)) (size!205 (buf!535 (_2!482 lt!9535)))))))

(declare-fun b!7130 () Bool)

(declare-fun res!7946 () Bool)

(assert (=> b!7130 (=> (not res!7946) (not e!4456))))

(declare-fun lt!9541 () (_ BitVec 64))

(assert (=> b!7130 (= res!7946 (= (bvadd lt!9541 nBits!460) (bitIndex!0 (size!205 (buf!535 (_2!482 lt!9535))) (currentByte!1532 (_2!482 lt!9535)) (currentBit!1527 (_2!482 lt!9535)))))))

(assert (=> b!7130 (or (not (= (bvand lt!9541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!9541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!9541 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7130 (= lt!9541 (bitIndex!0 (size!205 (buf!535 (_1!481 lt!8763))) (currentByte!1532 (_1!481 lt!8763)) (currentBit!1527 (_1!481 lt!8763))))))

(declare-fun b!7131 () Bool)

(assert (=> b!7131 (= e!4456 (= (byteArrayBitContentToList!0 (_2!482 lt!9535) (_1!482 lt!9535) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!482 lt!9535) (_1!481 lt!8763) nBits!460)))))

(declare-fun b!7127 () Bool)

(declare-fun res!7950 () Bool)

(assert (=> b!7127 (=> (not res!7950) (not e!4456))))

(assert (=> b!7127 (= res!7950 (bvsle (currentByte!1532 (_1!481 lt!8763)) (currentByte!1532 (_2!482 lt!9535))))))

(declare-fun d!2210 () Bool)

(assert (=> d!2210 e!4456))

(declare-fun res!7947 () Bool)

(assert (=> d!2210 (=> (not res!7947) (not e!4456))))

(assert (=> d!2210 (= res!7947 (= (buf!535 (_2!482 lt!9535)) (buf!535 (_1!481 lt!8763))))))

(declare-datatypes ((tuple3!52 0))(
  ( (tuple3!53 (_1!492 Unit!532) (_2!492 BitStream!388) (_3!26 array!474)) )
))
(declare-fun lt!9539 () tuple3!52)

(assert (=> d!2210 (= lt!9535 (tuple2!915 (_3!26 lt!9539) (_2!492 lt!9539)))))

(declare-fun readBitsLoop!0 (BitStream!388 (_ BitVec 64) array!474 (_ BitVec 64) (_ BitVec 64)) tuple3!52)

(assert (=> d!2210 (= lt!9539 (readBitsLoop!0 (_1!481 lt!8763) nBits!460 (array!475 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2210 (= (readBits!0 (_1!481 lt!8763) nBits!460) lt!9535)))

(assert (= (and d!2210 res!7947) b!7130))

(assert (= (and b!7130 res!7946) b!7129))

(assert (= (and b!7129 res!7948) b!7128))

(assert (= (and b!7128 res!7949) b!7127))

(assert (= (and b!7127 res!7950) b!7131))

(declare-fun m!9149 () Bool)

(assert (=> b!7129 m!9149))

(declare-fun m!9151 () Bool)

(assert (=> b!7130 m!9151))

(declare-fun m!9153 () Bool)

(assert (=> b!7130 m!9153))

(declare-fun m!9155 () Bool)

(assert (=> b!7131 m!9155))

(declare-fun m!9157 () Bool)

(assert (=> b!7131 m!9157))

(declare-fun m!9159 () Bool)

(assert (=> d!2210 m!9159))

(assert (=> b!6800 d!2210))

(declare-fun d!2220 () Bool)

(declare-fun e!4469 () Bool)

(assert (=> d!2220 e!4469))

(declare-fun c!385 () Bool)

(assert (=> d!2220 (= c!385 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!9568 () List!105)

(declare-datatypes ((tuple2!932 0))(
  ( (tuple2!933 (_1!493 List!105) (_2!493 BitStream!388)) )
))
(declare-fun e!4468 () tuple2!932)

(assert (=> d!2220 (= lt!9568 (_1!493 e!4468))))

(declare-fun c!386 () Bool)

(assert (=> d!2220 (= c!386 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2220 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2220 (= (bitStreamReadBitsIntoList!0 (_2!480 lt!8765) (_1!481 lt!8763) nBits!460) lt!9568)))

(declare-fun b!7158 () Bool)

(declare-fun length!15 (List!105) Int)

(assert (=> b!7158 (= e!4469 (> (length!15 lt!9568) 0))))

(declare-datatypes ((tuple2!934 0))(
  ( (tuple2!935 (_1!494 Bool) (_2!494 BitStream!388)) )
))
(declare-fun lt!9567 () tuple2!934)

(declare-fun b!7156 () Bool)

(declare-fun lt!9569 () (_ BitVec 64))

(assert (=> b!7156 (= e!4468 (tuple2!933 (Cons!101 (_1!494 lt!9567) (bitStreamReadBitsIntoList!0 (_2!480 lt!8765) (_2!494 lt!9567) (bvsub nBits!460 lt!9569))) (_2!494 lt!9567)))))

(declare-fun readBit!0 (BitStream!388) tuple2!934)

(assert (=> b!7156 (= lt!9567 (readBit!0 (_1!481 lt!8763)))))

(assert (=> b!7156 (= lt!9569 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!7155 () Bool)

(assert (=> b!7155 (= e!4468 (tuple2!933 Nil!102 (_1!481 lt!8763)))))

(declare-fun b!7157 () Bool)

(declare-fun isEmpty!20 (List!105) Bool)

(assert (=> b!7157 (= e!4469 (isEmpty!20 lt!9568))))

(assert (= (and d!2220 c!386) b!7155))

(assert (= (and d!2220 (not c!386)) b!7156))

(assert (= (and d!2220 c!385) b!7157))

(assert (= (and d!2220 (not c!385)) b!7158))

(declare-fun m!9177 () Bool)

(assert (=> b!7158 m!9177))

(declare-fun m!9179 () Bool)

(assert (=> b!7156 m!9179))

(declare-fun m!9181 () Bool)

(assert (=> b!7156 m!9181))

(declare-fun m!9183 () Bool)

(assert (=> b!7157 m!9183))

(assert (=> b!6800 d!2220))

(declare-fun d!2226 () Bool)

(assert (=> d!2226 (validate_offset_bits!1 ((_ sign_extend 32) (size!205 (buf!535 (_2!480 lt!8765)))) ((_ sign_extend 32) (currentByte!1532 thiss!1486)) ((_ sign_extend 32) (currentBit!1527 thiss!1486)) nBits!460)))

(declare-fun lt!9575 () Unit!532)

(declare-fun choose!9 (BitStream!388 array!474 (_ BitVec 64) BitStream!388) Unit!532)

(assert (=> d!2226 (= lt!9575 (choose!9 thiss!1486 (buf!535 (_2!480 lt!8765)) nBits!460 (BitStream!389 (buf!535 (_2!480 lt!8765)) (currentByte!1532 thiss!1486) (currentBit!1527 thiss!1486))))))

(assert (=> d!2226 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!535 (_2!480 lt!8765)) nBits!460) lt!9575)))

(declare-fun bs!767 () Bool)

(assert (= bs!767 d!2226))

(assert (=> bs!767 m!8611))

(declare-fun m!9195 () Bool)

(assert (=> bs!767 m!9195))

(assert (=> b!6800 d!2226))

(push 1)

(assert (not b!6894))

(assert (not b!7038))

(assert (not d!2198))

(assert (not d!2210))

(assert (not d!2122))

(assert (not b!7082))

(assert (not b!6998))

(assert (not b!7002))

(assert (not d!2178))

(assert (not b!7084))

(assert (not d!2196))

(assert (not b!7000))

(assert (not b!7131))

(assert (not b!7003))

(assert (not bm!76))

(assert (not b!7086))

(assert (not b!7156))

(assert (not d!2184))

(assert (not d!2226))

(assert (not b!6999))

(assert (not b!7157))

(assert (not b!7130))

(assert (not b!7158))

(assert (not d!2136))

(assert (not b!7083))

(assert (not d!2204))

(assert (not b!7129))

(assert (not b!7040))

(assert (not d!2152))

(assert (not b!7036))

(assert (not d!2200))

(assert (not b!7004))

(assert (not b!6911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

