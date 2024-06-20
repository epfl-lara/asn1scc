; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2576 () Bool)

(assert start!2576)

(declare-fun b!12264 () Bool)

(declare-fun e!7455 () Bool)

(declare-datatypes ((array!672 0))(
  ( (array!673 (arr!718 (Array (_ BitVec 32) (_ BitVec 8))) (size!292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!544 0))(
  ( (BitStream!545 (buf!640 array!672) (currentByte!1718 (_ BitVec 32)) (currentBit!1713 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1426 0))(
  ( (tuple2!1427 (_1!765 BitStream!544) (_2!765 BitStream!544)) )
))
(declare-fun lt!19700 () tuple2!1426)

(declare-datatypes ((tuple2!1428 0))(
  ( (tuple2!1429 (_1!766 array!672) (_2!766 BitStream!544)) )
))
(declare-fun lt!19695 () tuple2!1428)

(declare-fun inv!12 (BitStream!544) Bool)

(assert (=> b!12264 (= e!7455 (inv!12 (BitStream!545 (buf!640 (_1!765 lt!19700)) (currentByte!1718 (_2!766 lt!19695)) (currentBit!1713 (_2!766 lt!19695)))))))

(declare-fun res!11780 () Bool)

(declare-fun e!7451 () Bool)

(assert (=> start!2576 (=> (not res!11780) (not e!7451))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!672)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2576 (= res!11780 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!292 srcBuffer!6))))))))

(assert (=> start!2576 e!7451))

(assert (=> start!2576 true))

(declare-fun array_inv!281 (array!672) Bool)

(assert (=> start!2576 (array_inv!281 srcBuffer!6)))

(declare-fun thiss!1486 () BitStream!544)

(declare-fun e!7452 () Bool)

(assert (=> start!2576 (and (inv!12 thiss!1486) e!7452)))

(declare-fun b!12265 () Bool)

(declare-fun e!7457 () Bool)

(assert (=> b!12265 (= e!7457 e!7455)))

(declare-fun res!11778 () Bool)

(assert (=> b!12265 (=> res!11778 e!7455)))

(declare-datatypes ((Unit!1043 0))(
  ( (Unit!1044) )
))
(declare-datatypes ((tuple2!1430 0))(
  ( (tuple2!1431 (_1!767 Unit!1043) (_2!767 BitStream!544)) )
))
(declare-fun lt!19698 () tuple2!1430)

(declare-fun checkByteArrayBitContent!0 (BitStream!544 array!672 array!672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12265 (= res!11778 (not (checkByteArrayBitContent!0 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!19697 () Unit!1043)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!544 array!672 array!672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1043)

(assert (=> b!12265 (= lt!19697 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12266 () Bool)

(assert (=> b!12266 (= e!7452 (array_inv!281 (buf!640 thiss!1486)))))

(declare-fun b!12267 () Bool)

(declare-fun res!11776 () Bool)

(declare-fun e!7453 () Bool)

(assert (=> b!12267 (=> (not res!11776) (not e!7453))))

(assert (=> b!12267 (= res!11776 (= (size!292 (buf!640 thiss!1486)) (size!292 (buf!640 (_2!767 lt!19698)))))))

(declare-fun b!12268 () Bool)

(declare-fun res!11779 () Bool)

(assert (=> b!12268 (=> (not res!11779) (not e!7451))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12268 (= res!11779 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) nBits!460))))

(declare-fun b!12269 () Bool)

(assert (=> b!12269 (= e!7453 (not e!7457))))

(declare-fun res!11782 () Bool)

(assert (=> b!12269 (=> res!11782 e!7457)))

(declare-datatypes ((List!168 0))(
  ( (Nil!165) (Cons!164 (h!283 Bool) (t!918 List!168)) )
))
(declare-fun lt!19696 () List!168)

(declare-fun byteArrayBitContentToList!0 (BitStream!544 array!672 (_ BitVec 64) (_ BitVec 64)) List!168)

(assert (=> b!12269 (= res!11782 (not (= (byteArrayBitContentToList!0 (_2!767 lt!19698) (_1!766 lt!19695) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19696)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!544 BitStream!544 (_ BitVec 64)) List!168)

(assert (=> b!12269 (= lt!19696 (bitStreamReadBitsIntoList!0 (_2!767 lt!19698) (_1!765 lt!19700) nBits!460))))

(declare-fun readBits!0 (BitStream!544 (_ BitVec 64)) tuple2!1428)

(assert (=> b!12269 (= lt!19695 (readBits!0 (_1!765 lt!19700) nBits!460))))

(assert (=> b!12269 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) nBits!460)))

(declare-fun lt!19699 () Unit!1043)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!544 array!672 (_ BitVec 64)) Unit!1043)

(assert (=> b!12269 (= lt!19699 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!640 (_2!767 lt!19698)) nBits!460))))

(declare-fun reader!0 (BitStream!544 BitStream!544) tuple2!1426)

(assert (=> b!12269 (= lt!19700 (reader!0 thiss!1486 (_2!767 lt!19698)))))

(declare-fun b!12270 () Bool)

(declare-fun res!11777 () Bool)

(assert (=> b!12270 (=> (not res!11777) (not e!7453))))

(declare-fun isPrefixOf!0 (BitStream!544 BitStream!544) Bool)

(assert (=> b!12270 (= res!11777 (isPrefixOf!0 thiss!1486 (_2!767 lt!19698)))))

(declare-fun b!12271 () Bool)

(declare-fun res!11775 () Bool)

(assert (=> b!12271 (=> res!11775 e!7457)))

(assert (=> b!12271 (= res!11775 (not (= lt!19696 (byteArrayBitContentToList!0 (_2!767 lt!19698) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12272 () Bool)

(declare-fun res!11774 () Bool)

(assert (=> b!12272 (=> (not res!11774) (not e!7453))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12272 (= res!11774 (= (bitIndex!0 (size!292 (buf!640 (_2!767 lt!19698))) (currentByte!1718 (_2!767 lt!19698)) (currentBit!1713 (_2!767 lt!19698))) (bvadd (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)) nBits!460)))))

(declare-fun b!12273 () Bool)

(assert (=> b!12273 (= e!7451 e!7453)))

(declare-fun res!11781 () Bool)

(assert (=> b!12273 (=> (not res!11781) (not e!7453))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12273 (= res!11781 (invariant!0 (currentBit!1713 (_2!767 lt!19698)) (currentByte!1718 (_2!767 lt!19698)) (size!292 (buf!640 (_2!767 lt!19698)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!544 array!672 (_ BitVec 64) (_ BitVec 64)) tuple2!1430)

(assert (=> b!12273 (= lt!19698 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2576 res!11780) b!12268))

(assert (= (and b!12268 res!11779) b!12273))

(assert (= (and b!12273 res!11781) b!12267))

(assert (= (and b!12267 res!11776) b!12272))

(assert (= (and b!12272 res!11774) b!12270))

(assert (= (and b!12270 res!11777) b!12269))

(assert (= (and b!12269 (not res!11782)) b!12271))

(assert (= (and b!12271 (not res!11775)) b!12265))

(assert (= (and b!12265 (not res!11778)) b!12264))

(assert (= start!2576 b!12266))

(declare-fun m!18545 () Bool)

(assert (=> b!12271 m!18545))

(declare-fun m!18547 () Bool)

(assert (=> b!12273 m!18547))

(declare-fun m!18549 () Bool)

(assert (=> b!12273 m!18549))

(declare-fun m!18551 () Bool)

(assert (=> b!12269 m!18551))

(declare-fun m!18553 () Bool)

(assert (=> b!12269 m!18553))

(declare-fun m!18555 () Bool)

(assert (=> b!12269 m!18555))

(declare-fun m!18557 () Bool)

(assert (=> b!12269 m!18557))

(declare-fun m!18559 () Bool)

(assert (=> b!12269 m!18559))

(declare-fun m!18561 () Bool)

(assert (=> b!12269 m!18561))

(declare-fun m!18563 () Bool)

(assert (=> start!2576 m!18563))

(declare-fun m!18565 () Bool)

(assert (=> start!2576 m!18565))

(declare-fun m!18567 () Bool)

(assert (=> b!12265 m!18567))

(declare-fun m!18569 () Bool)

(assert (=> b!12265 m!18569))

(declare-fun m!18571 () Bool)

(assert (=> b!12270 m!18571))

(declare-fun m!18573 () Bool)

(assert (=> b!12272 m!18573))

(declare-fun m!18575 () Bool)

(assert (=> b!12272 m!18575))

(declare-fun m!18577 () Bool)

(assert (=> b!12266 m!18577))

(declare-fun m!18579 () Bool)

(assert (=> b!12264 m!18579))

(declare-fun m!18581 () Bool)

(assert (=> b!12268 m!18581))

(push 1)

(assert (not b!12271))

(assert (not b!12265))

(assert (not b!12273))

(assert (not start!2576))

(assert (not b!12272))

(assert (not b!12266))

(assert (not b!12270))

(assert (not b!12264))

(assert (not b!12269))

(assert (not b!12268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4044 () Bool)

(declare-fun c!917 () Bool)

(assert (=> d!4044 (= c!917 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7502 () List!168)

(assert (=> d!4044 (= (byteArrayBitContentToList!0 (_2!767 lt!19698) srcBuffer!6 from!367 nBits!460) e!7502)))

(declare-fun b!12338 () Bool)

(assert (=> b!12338 (= e!7502 Nil!165)))

(declare-fun b!12339 () Bool)

(assert (=> b!12339 (= e!7502 (Cons!164 (not (= (bvand ((_ sign_extend 24) (select (arr!718 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!767 lt!19698) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4044 c!917) b!12338))

(assert (= (and d!4044 (not c!917)) b!12339))

(declare-fun m!18659 () Bool)

(assert (=> b!12339 m!18659))

(declare-fun m!18661 () Bool)

(assert (=> b!12339 m!18661))

(declare-fun m!18663 () Bool)

(assert (=> b!12339 m!18663))

(assert (=> b!12271 d!4044))

(declare-fun d!4048 () Bool)

(assert (=> d!4048 (= (array_inv!281 (buf!640 thiss!1486)) (bvsge (size!292 (buf!640 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!12266 d!4048))

(declare-fun d!4050 () Bool)

(declare-fun res!11847 () Bool)

(declare-fun e!7510 () Bool)

(assert (=> d!4050 (=> res!11847 e!7510)))

(assert (=> d!4050 (= res!11847 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4050 (= (checkByteArrayBitContent!0 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7510)))

(declare-fun b!12350 () Bool)

(declare-fun e!7511 () Bool)

(assert (=> b!12350 (= e!7510 e!7511)))

(declare-fun res!11848 () Bool)

(assert (=> b!12350 (=> (not res!11848) (not e!7511))))

(assert (=> b!12350 (= res!11848 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!718 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!718 (_1!766 lt!19695)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!12351 () Bool)

(assert (=> b!12351 (= e!7511 (checkByteArrayBitContent!0 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!4050 (not res!11847)) b!12350))

(assert (= (and b!12350 res!11848) b!12351))

(assert (=> b!12350 m!18659))

(assert (=> b!12350 m!18661))

(declare-fun m!18667 () Bool)

(assert (=> b!12350 m!18667))

(declare-fun m!18669 () Bool)

(assert (=> b!12350 m!18669))

(declare-fun m!18671 () Bool)

(assert (=> b!12351 m!18671))

(assert (=> b!12265 d!4050))

(declare-fun d!4054 () Bool)

(assert (=> d!4054 (checkByteArrayBitContent!0 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!19763 () Unit!1043)

(declare-fun choose!65 (BitStream!544 array!672 array!672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1043)

(assert (=> d!4054 (= lt!19763 (choose!65 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4054 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4054 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!767 lt!19698) srcBuffer!6 (_1!766 lt!19695) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19763)))

(declare-fun bs!1118 () Bool)

(assert (= bs!1118 d!4054))

(assert (=> bs!1118 m!18567))

(declare-fun m!18677 () Bool)

(assert (=> bs!1118 m!18677))

(assert (=> b!12265 d!4054))

(declare-fun d!4058 () Bool)

(declare-fun e!7519 () Bool)

(assert (=> d!4058 e!7519))

(declare-fun res!11856 () Bool)

(assert (=> d!4058 (=> (not res!11856) (not e!7519))))

(declare-fun lt!19784 () (_ BitVec 64))

(declare-fun lt!19781 () (_ BitVec 64))

(declare-fun lt!19782 () (_ BitVec 64))

(assert (=> d!4058 (= res!11856 (= lt!19782 (bvsub lt!19781 lt!19784)))))

(assert (=> d!4058 (or (= (bvand lt!19781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19781 lt!19784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4058 (= lt!19784 (remainingBits!0 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))) ((_ sign_extend 32) (currentByte!1718 (_2!767 lt!19698))) ((_ sign_extend 32) (currentBit!1713 (_2!767 lt!19698)))))))

(declare-fun lt!19783 () (_ BitVec 64))

(declare-fun lt!19779 () (_ BitVec 64))

(assert (=> d!4058 (= lt!19781 (bvmul lt!19783 lt!19779))))

(assert (=> d!4058 (or (= lt!19783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19779 (bvsdiv (bvmul lt!19783 lt!19779) lt!19783)))))

(assert (=> d!4058 (= lt!19779 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4058 (= lt!19783 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))))))

(assert (=> d!4058 (= lt!19782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1718 (_2!767 lt!19698))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1713 (_2!767 lt!19698)))))))

(assert (=> d!4058 (invariant!0 (currentBit!1713 (_2!767 lt!19698)) (currentByte!1718 (_2!767 lt!19698)) (size!292 (buf!640 (_2!767 lt!19698))))))

(assert (=> d!4058 (= (bitIndex!0 (size!292 (buf!640 (_2!767 lt!19698))) (currentByte!1718 (_2!767 lt!19698)) (currentBit!1713 (_2!767 lt!19698))) lt!19782)))

(declare-fun b!12366 () Bool)

(declare-fun res!11855 () Bool)

(assert (=> b!12366 (=> (not res!11855) (not e!7519))))

(assert (=> b!12366 (= res!11855 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19782))))

(declare-fun b!12367 () Bool)

(declare-fun lt!19780 () (_ BitVec 64))

(assert (=> b!12367 (= e!7519 (bvsle lt!19782 (bvmul lt!19780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12367 (or (= lt!19780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19780)))))

(assert (=> b!12367 (= lt!19780 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))))))

(assert (= (and d!4058 res!11856) b!12366))

(assert (= (and b!12366 res!11855) b!12367))

(declare-fun m!18695 () Bool)

(assert (=> d!4058 m!18695))

(assert (=> d!4058 m!18547))

(assert (=> b!12272 d!4058))

(declare-fun d!4076 () Bool)

(declare-fun e!7520 () Bool)

(assert (=> d!4076 e!7520))

(declare-fun res!11858 () Bool)

(assert (=> d!4076 (=> (not res!11858) (not e!7520))))

(declare-fun lt!19788 () (_ BitVec 64))

(declare-fun lt!19787 () (_ BitVec 64))

(declare-fun lt!19790 () (_ BitVec 64))

(assert (=> d!4076 (= res!11858 (= lt!19788 (bvsub lt!19787 lt!19790)))))

(assert (=> d!4076 (or (= (bvand lt!19787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19787 lt!19790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4076 (= lt!19790 (remainingBits!0 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486))))))

(declare-fun lt!19789 () (_ BitVec 64))

(declare-fun lt!19785 () (_ BitVec 64))

(assert (=> d!4076 (= lt!19787 (bvmul lt!19789 lt!19785))))

(assert (=> d!4076 (or (= lt!19789 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19785 (bvsdiv (bvmul lt!19789 lt!19785) lt!19789)))))

(assert (=> d!4076 (= lt!19785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4076 (= lt!19789 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))))))

(assert (=> d!4076 (= lt!19788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1718 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1713 thiss!1486))))))

(assert (=> d!4076 (invariant!0 (currentBit!1713 thiss!1486) (currentByte!1718 thiss!1486) (size!292 (buf!640 thiss!1486)))))

(assert (=> d!4076 (= (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)) lt!19788)))

(declare-fun b!12368 () Bool)

(declare-fun res!11857 () Bool)

(assert (=> b!12368 (=> (not res!11857) (not e!7520))))

(assert (=> b!12368 (= res!11857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19788))))

(declare-fun b!12369 () Bool)

(declare-fun lt!19786 () (_ BitVec 64))

(assert (=> b!12369 (= e!7520 (bvsle lt!19788 (bvmul lt!19786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12369 (or (= lt!19786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19786)))))

(assert (=> b!12369 (= lt!19786 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))))))

(assert (= (and d!4076 res!11858) b!12368))

(assert (= (and b!12368 res!11857) b!12369))

(declare-fun m!18697 () Bool)

(assert (=> d!4076 m!18697))

(declare-fun m!18699 () Bool)

(assert (=> d!4076 m!18699))

(assert (=> b!12272 d!4076))

(declare-fun d!4078 () Bool)

(assert (=> d!4078 (= (array_inv!281 srcBuffer!6) (bvsge (size!292 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2576 d!4078))

(declare-fun d!4080 () Bool)

(assert (=> d!4080 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1713 thiss!1486) (currentByte!1718 thiss!1486) (size!292 (buf!640 thiss!1486))))))

(declare-fun bs!1122 () Bool)

(assert (= bs!1122 d!4080))

(assert (=> bs!1122 m!18699))

(assert (=> start!2576 d!4080))

(declare-fun d!4082 () Bool)

(assert (=> d!4082 (= (invariant!0 (currentBit!1713 (_2!767 lt!19698)) (currentByte!1718 (_2!767 lt!19698)) (size!292 (buf!640 (_2!767 lt!19698)))) (and (bvsge (currentBit!1713 (_2!767 lt!19698)) #b00000000000000000000000000000000) (bvslt (currentBit!1713 (_2!767 lt!19698)) #b00000000000000000000000000001000) (bvsge (currentByte!1718 (_2!767 lt!19698)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1718 (_2!767 lt!19698)) (size!292 (buf!640 (_2!767 lt!19698)))) (and (= (currentBit!1713 (_2!767 lt!19698)) #b00000000000000000000000000000000) (= (currentByte!1718 (_2!767 lt!19698)) (size!292 (buf!640 (_2!767 lt!19698))))))))))

(assert (=> b!12273 d!4082))

(declare-fun b!12450 () Bool)

(declare-fun res!11918 () Bool)

(declare-fun e!7554 () Bool)

(assert (=> b!12450 (=> (not res!11918) (not e!7554))))

(declare-fun lt!20091 () tuple2!1430)

(assert (=> b!12450 (= res!11918 (= (size!292 (buf!640 (_2!767 lt!20091))) (size!292 (buf!640 thiss!1486))))))

(declare-fun b!12451 () Bool)

(declare-fun res!11917 () Bool)

(assert (=> b!12451 (=> (not res!11917) (not e!7554))))

(assert (=> b!12451 (= res!11917 (isPrefixOf!0 thiss!1486 (_2!767 lt!20091)))))

(declare-fun b!12452 () Bool)

(declare-fun res!11915 () Bool)

(assert (=> b!12452 (=> (not res!11915) (not e!7554))))

(assert (=> b!12452 (= res!11915 (= (size!292 (buf!640 thiss!1486)) (size!292 (buf!640 (_2!767 lt!20091)))))))

(declare-fun b!12453 () Bool)

(declare-fun lt!20090 () tuple2!1426)

(assert (=> b!12453 (= e!7554 (= (bitStreamReadBitsIntoList!0 (_2!767 lt!20091) (_1!765 lt!20090) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!767 lt!20091) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!12453 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12453 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!20072 () Unit!1043)

(declare-fun lt!20089 () Unit!1043)

(assert (=> b!12453 (= lt!20072 lt!20089)))

(declare-fun lt!20086 () (_ BitVec 64))

(assert (=> b!12453 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!20091)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) lt!20086)))

(assert (=> b!12453 (= lt!20089 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!640 (_2!767 lt!20091)) lt!20086))))

(declare-fun e!7555 () Bool)

(assert (=> b!12453 e!7555))

(declare-fun res!11913 () Bool)

(assert (=> b!12453 (=> (not res!11913) (not e!7555))))

(assert (=> b!12453 (= res!11913 (and (= (size!292 (buf!640 thiss!1486)) (size!292 (buf!640 (_2!767 lt!20091)))) (bvsge lt!20086 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12453 (= lt!20086 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!12453 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12453 (= lt!20090 (reader!0 thiss!1486 (_2!767 lt!20091)))))

(declare-fun b!12454 () Bool)

(declare-fun e!7556 () tuple2!1430)

(declare-fun Unit!1049 () Unit!1043)

(assert (=> b!12454 (= e!7556 (tuple2!1431 Unit!1049 thiss!1486))))

(assert (=> b!12454 (= (size!292 (buf!640 thiss!1486)) (size!292 (buf!640 thiss!1486)))))

(declare-fun lt!20102 () Unit!1043)

(declare-fun Unit!1050 () Unit!1043)

(assert (=> b!12454 (= lt!20102 Unit!1050)))

(declare-fun call!253 () tuple2!1426)

(assert (=> b!12454 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!766 (readBits!0 (_1!765 call!253) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!12455 () Bool)

(assert (=> b!12455 (= e!7555 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) lt!20086))))

(declare-fun b!12456 () Bool)

(declare-fun lt!20068 () tuple2!1430)

(declare-fun Unit!1051 () Unit!1043)

(assert (=> b!12456 (= e!7556 (tuple2!1431 Unit!1051 (_2!767 lt!20068)))))

(declare-fun lt!20104 () tuple2!1430)

(declare-fun appendBitFromByte!0 (BitStream!544 (_ BitVec 8) (_ BitVec 32)) tuple2!1430)

(assert (=> b!12456 (= lt!20104 (appendBitFromByte!0 thiss!1486 (select (arr!718 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!20085 () (_ BitVec 64))

(assert (=> b!12456 (= lt!20085 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20074 () (_ BitVec 64))

(assert (=> b!12456 (= lt!20074 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20079 () Unit!1043)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!544 BitStream!544 (_ BitVec 64) (_ BitVec 64)) Unit!1043)

(assert (=> b!12456 (= lt!20079 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!767 lt!20104) lt!20085 lt!20074))))

(assert (=> b!12456 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!20104)))) ((_ sign_extend 32) (currentByte!1718 (_2!767 lt!20104))) ((_ sign_extend 32) (currentBit!1713 (_2!767 lt!20104))) (bvsub lt!20085 lt!20074))))

(declare-fun lt!20098 () Unit!1043)

(assert (=> b!12456 (= lt!20098 lt!20079)))

(declare-fun lt!20083 () tuple2!1426)

(assert (=> b!12456 (= lt!20083 call!253)))

(declare-fun lt!20094 () (_ BitVec 64))

(assert (=> b!12456 (= lt!20094 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20105 () Unit!1043)

(assert (=> b!12456 (= lt!20105 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!640 (_2!767 lt!20104)) lt!20094))))

(assert (=> b!12456 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!20104)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) lt!20094)))

(declare-fun lt!20084 () Unit!1043)

(assert (=> b!12456 (= lt!20084 lt!20105)))

(declare-fun head!65 (List!168) Bool)

(assert (=> b!12456 (= (head!65 (byteArrayBitContentToList!0 (_2!767 lt!20104) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!65 (bitStreamReadBitsIntoList!0 (_2!767 lt!20104) (_1!765 lt!20083) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20066 () Unit!1043)

(declare-fun Unit!1052 () Unit!1043)

(assert (=> b!12456 (= lt!20066 Unit!1052)))

(assert (=> b!12456 (= lt!20068 (appendBitsMSBFirstLoop!0 (_2!767 lt!20104) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!20075 () Unit!1043)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!544 BitStream!544 BitStream!544) Unit!1043)

(assert (=> b!12456 (= lt!20075 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!767 lt!20104) (_2!767 lt!20068)))))

(assert (=> b!12456 (isPrefixOf!0 thiss!1486 (_2!767 lt!20068))))

(declare-fun lt!20071 () Unit!1043)

(assert (=> b!12456 (= lt!20071 lt!20075)))

(assert (=> b!12456 (= (size!292 (buf!640 (_2!767 lt!20068))) (size!292 (buf!640 thiss!1486)))))

(declare-fun lt!20092 () Unit!1043)

(declare-fun Unit!1053 () Unit!1043)

(assert (=> b!12456 (= lt!20092 Unit!1053)))

(assert (=> b!12456 (= (bitIndex!0 (size!292 (buf!640 (_2!767 lt!20068))) (currentByte!1718 (_2!767 lt!20068)) (currentBit!1713 (_2!767 lt!20068))) (bvsub (bvadd (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!20109 () Unit!1043)

(declare-fun Unit!1054 () Unit!1043)

(assert (=> b!12456 (= lt!20109 Unit!1054)))

(assert (=> b!12456 (= (bitIndex!0 (size!292 (buf!640 (_2!767 lt!20068))) (currentByte!1718 (_2!767 lt!20068)) (currentBit!1713 (_2!767 lt!20068))) (bvsub (bvsub (bvadd (bitIndex!0 (size!292 (buf!640 (_2!767 lt!20104))) (currentByte!1718 (_2!767 lt!20104)) (currentBit!1713 (_2!767 lt!20104))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!20088 () Unit!1043)

(declare-fun Unit!1055 () Unit!1043)

(assert (=> b!12456 (= lt!20088 Unit!1055)))

(declare-fun lt!20101 () tuple2!1426)

(assert (=> b!12456 (= lt!20101 (reader!0 thiss!1486 (_2!767 lt!20068)))))

(declare-fun lt!20077 () (_ BitVec 64))

(assert (=> b!12456 (= lt!20077 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20073 () Unit!1043)

(assert (=> b!12456 (= lt!20073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!640 (_2!767 lt!20068)) lt!20077))))

(assert (=> b!12456 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!20068)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) lt!20077)))

(declare-fun lt!20076 () Unit!1043)

(assert (=> b!12456 (= lt!20076 lt!20073)))

(declare-fun lt!20081 () tuple2!1426)

(assert (=> b!12456 (= lt!20081 (reader!0 (_2!767 lt!20104) (_2!767 lt!20068)))))

(declare-fun lt!20100 () (_ BitVec 64))

(assert (=> b!12456 (= lt!20100 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!20070 () Unit!1043)

(assert (=> b!12456 (= lt!20070 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!767 lt!20104) (buf!640 (_2!767 lt!20068)) lt!20100))))

(assert (=> b!12456 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!20068)))) ((_ sign_extend 32) (currentByte!1718 (_2!767 lt!20104))) ((_ sign_extend 32) (currentBit!1713 (_2!767 lt!20104))) lt!20100)))

(declare-fun lt!20082 () Unit!1043)

(assert (=> b!12456 (= lt!20082 lt!20070)))

(declare-fun lt!20067 () List!168)

(assert (=> b!12456 (= lt!20067 (byteArrayBitContentToList!0 (_2!767 lt!20068) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!20069 () List!168)

(assert (=> b!12456 (= lt!20069 (byteArrayBitContentToList!0 (_2!767 lt!20068) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20097 () List!168)

(assert (=> b!12456 (= lt!20097 (bitStreamReadBitsIntoList!0 (_2!767 lt!20068) (_1!765 lt!20101) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!20108 () List!168)

(assert (=> b!12456 (= lt!20108 (bitStreamReadBitsIntoList!0 (_2!767 lt!20068) (_1!765 lt!20081) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20106 () (_ BitVec 64))

(assert (=> b!12456 (= lt!20106 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20107 () Unit!1043)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!544 BitStream!544 BitStream!544 BitStream!544 (_ BitVec 64) List!168) Unit!1043)

(assert (=> b!12456 (= lt!20107 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!767 lt!20068) (_2!767 lt!20068) (_1!765 lt!20101) (_1!765 lt!20081) lt!20106 lt!20097))))

(declare-fun tail!73 (List!168) List!168)

(assert (=> b!12456 (= (bitStreamReadBitsIntoList!0 (_2!767 lt!20068) (_1!765 lt!20081) (bvsub lt!20106 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!73 lt!20097))))

(declare-fun lt!20099 () Unit!1043)

(assert (=> b!12456 (= lt!20099 lt!20107)))

(declare-fun lt!20096 () Unit!1043)

(declare-fun lt!20078 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!672 array!672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1043)

(assert (=> b!12456 (= lt!20096 (arrayBitRangesEqImpliesEq!0 (buf!640 (_2!767 lt!20104)) (buf!640 (_2!767 lt!20068)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!20078 (bitIndex!0 (size!292 (buf!640 (_2!767 lt!20104))) (currentByte!1718 (_2!767 lt!20104)) (currentBit!1713 (_2!767 lt!20104)))))))

(declare-fun bitAt!0 (array!672 (_ BitVec 64)) Bool)

(assert (=> b!12456 (= (bitAt!0 (buf!640 (_2!767 lt!20104)) lt!20078) (bitAt!0 (buf!640 (_2!767 lt!20068)) lt!20078))))

(declare-fun lt!20103 () Unit!1043)

(assert (=> b!12456 (= lt!20103 lt!20096)))

(declare-fun d!4084 () Bool)

(assert (=> d!4084 e!7554))

(declare-fun res!11916 () Bool)

(assert (=> d!4084 (=> (not res!11916) (not e!7554))))

(declare-fun lt!20093 () (_ BitVec 64))

(assert (=> d!4084 (= res!11916 (= (bitIndex!0 (size!292 (buf!640 (_2!767 lt!20091))) (currentByte!1718 (_2!767 lt!20091)) (currentBit!1713 (_2!767 lt!20091))) (bvsub lt!20093 from!367)))))

(assert (=> d!4084 (or (= (bvand lt!20093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20093 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!20080 () (_ BitVec 64))

(assert (=> d!4084 (= lt!20093 (bvadd lt!20080 from!367 nBits!460))))

(assert (=> d!4084 (or (not (= (bvand lt!20080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20080 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4084 (= lt!20080 (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)))))

(assert (=> d!4084 (= lt!20091 e!7556)))

(declare-fun c!935 () Bool)

(assert (=> d!4084 (= c!935 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!20087 () Unit!1043)

(declare-fun lt!20095 () Unit!1043)

(assert (=> d!4084 (= lt!20087 lt!20095)))

(assert (=> d!4084 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!544) Unit!1043)

(assert (=> d!4084 (= lt!20095 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4084 (= lt!20078 (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)))))

(assert (=> d!4084 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4084 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!20091)))

(declare-fun bm!250 () Bool)

(assert (=> bm!250 (= call!253 (reader!0 thiss!1486 (ite c!935 (_2!767 lt!20104) thiss!1486)))))

(declare-fun b!12457 () Bool)

(declare-fun res!11914 () Bool)

(assert (=> b!12457 (=> (not res!11914) (not e!7554))))

(assert (=> b!12457 (= res!11914 (invariant!0 (currentBit!1713 (_2!767 lt!20091)) (currentByte!1718 (_2!767 lt!20091)) (size!292 (buf!640 (_2!767 lt!20091)))))))

(assert (= (and d!4084 c!935) b!12456))

(assert (= (and d!4084 (not c!935)) b!12454))

(assert (= (or b!12456 b!12454) bm!250))

(assert (= (and d!4084 res!11916) b!12457))

(assert (= (and b!12457 res!11914) b!12452))

(assert (= (and b!12452 res!11915) b!12451))

(assert (= (and b!12451 res!11917) b!12450))

(assert (= (and b!12450 res!11918) b!12453))

(assert (= (and b!12453 res!11913) b!12455))

(declare-fun m!18757 () Bool)

(assert (=> d!4084 m!18757))

(assert (=> d!4084 m!18575))

(declare-fun m!18759 () Bool)

(assert (=> d!4084 m!18759))

(declare-fun m!18761 () Bool)

(assert (=> d!4084 m!18761))

(declare-fun m!18763 () Bool)

(assert (=> b!12456 m!18763))

(declare-fun m!18765 () Bool)

(assert (=> b!12456 m!18765))

(declare-fun m!18767 () Bool)

(assert (=> b!12456 m!18767))

(declare-fun m!18769 () Bool)

(assert (=> b!12456 m!18769))

(assert (=> b!12456 m!18765))

(declare-fun m!18771 () Bool)

(assert (=> b!12456 m!18771))

(declare-fun m!18773 () Bool)

(assert (=> b!12456 m!18773))

(declare-fun m!18775 () Bool)

(assert (=> b!12456 m!18775))

(declare-fun m!18777 () Bool)

(assert (=> b!12456 m!18777))

(declare-fun m!18779 () Bool)

(assert (=> b!12456 m!18779))

(declare-fun m!18781 () Bool)

(assert (=> b!12456 m!18781))

(declare-fun m!18783 () Bool)

(assert (=> b!12456 m!18783))

(declare-fun m!18785 () Bool)

(assert (=> b!12456 m!18785))

(declare-fun m!18787 () Bool)

(assert (=> b!12456 m!18787))

(assert (=> b!12456 m!18575))

(declare-fun m!18789 () Bool)

(assert (=> b!12456 m!18789))

(declare-fun m!18791 () Bool)

(assert (=> b!12456 m!18791))

(declare-fun m!18793 () Bool)

(assert (=> b!12456 m!18793))

(declare-fun m!18795 () Bool)

(assert (=> b!12456 m!18795))

(declare-fun m!18797 () Bool)

(assert (=> b!12456 m!18797))

(declare-fun m!18799 () Bool)

(assert (=> b!12456 m!18799))

(declare-fun m!18801 () Bool)

(assert (=> b!12456 m!18801))

(declare-fun m!18803 () Bool)

(assert (=> b!12456 m!18803))

(declare-fun m!18805 () Bool)

(assert (=> b!12456 m!18805))

(assert (=> b!12456 m!18659))

(declare-fun m!18807 () Bool)

(assert (=> b!12456 m!18807))

(assert (=> b!12456 m!18659))

(declare-fun m!18809 () Bool)

(assert (=> b!12456 m!18809))

(assert (=> b!12456 m!18783))

(declare-fun m!18811 () Bool)

(assert (=> b!12456 m!18811))

(declare-fun m!18813 () Bool)

(assert (=> b!12456 m!18813))

(declare-fun m!18815 () Bool)

(assert (=> b!12456 m!18815))

(declare-fun m!18817 () Bool)

(assert (=> b!12456 m!18817))

(assert (=> b!12456 m!18767))

(declare-fun m!18819 () Bool)

(assert (=> b!12456 m!18819))

(declare-fun m!18821 () Bool)

(assert (=> b!12456 m!18821))

(declare-fun m!18823 () Bool)

(assert (=> bm!250 m!18823))

(declare-fun m!18825 () Bool)

(assert (=> b!12453 m!18825))

(declare-fun m!18827 () Bool)

(assert (=> b!12453 m!18827))

(declare-fun m!18829 () Bool)

(assert (=> b!12453 m!18829))

(declare-fun m!18831 () Bool)

(assert (=> b!12453 m!18831))

(declare-fun m!18833 () Bool)

(assert (=> b!12453 m!18833))

(declare-fun m!18835 () Bool)

(assert (=> b!12451 m!18835))

(declare-fun m!18837 () Bool)

(assert (=> b!12455 m!18837))

(declare-fun m!18839 () Bool)

(assert (=> b!12457 m!18839))

(declare-fun m!18841 () Bool)

(assert (=> b!12454 m!18841))

(declare-fun m!18843 () Bool)

(assert (=> b!12454 m!18843))

(assert (=> b!12273 d!4084))

(declare-fun d!4100 () Bool)

(assert (=> d!4100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!292 (buf!640 thiss!1486))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486))) nBits!460))))

(declare-fun bs!1125 () Bool)

(assert (= bs!1125 d!4100))

(assert (=> bs!1125 m!18697))

(assert (=> b!12268 d!4100))

(declare-fun d!4102 () Bool)

(declare-fun res!11931 () Bool)

(declare-fun e!7564 () Bool)

(assert (=> d!4102 (=> (not res!11931) (not e!7564))))

(assert (=> d!4102 (= res!11931 (= (size!292 (buf!640 thiss!1486)) (size!292 (buf!640 (_2!767 lt!19698)))))))

(assert (=> d!4102 (= (isPrefixOf!0 thiss!1486 (_2!767 lt!19698)) e!7564)))

(declare-fun b!12472 () Bool)

(declare-fun res!11933 () Bool)

(assert (=> b!12472 (=> (not res!11933) (not e!7564))))

(assert (=> b!12472 (= res!11933 (bvsle (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)) (bitIndex!0 (size!292 (buf!640 (_2!767 lt!19698))) (currentByte!1718 (_2!767 lt!19698)) (currentBit!1713 (_2!767 lt!19698)))))))

(declare-fun b!12473 () Bool)

(declare-fun e!7565 () Bool)

(assert (=> b!12473 (= e!7564 e!7565)))

(declare-fun res!11932 () Bool)

(assert (=> b!12473 (=> res!11932 e!7565)))

(assert (=> b!12473 (= res!11932 (= (size!292 (buf!640 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!12474 () Bool)

(declare-fun arrayBitRangesEq!0 (array!672 array!672 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12474 (= e!7565 (arrayBitRangesEq!0 (buf!640 thiss!1486) (buf!640 (_2!767 lt!19698)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486))))))

(assert (= (and d!4102 res!11931) b!12472))

(assert (= (and b!12472 res!11933) b!12473))

(assert (= (and b!12473 (not res!11932)) b!12474))

(assert (=> b!12472 m!18575))

(assert (=> b!12472 m!18573))

(assert (=> b!12474 m!18575))

(assert (=> b!12474 m!18575))

(declare-fun m!18935 () Bool)

(assert (=> b!12474 m!18935))

(assert (=> b!12270 d!4102))

(declare-fun d!4106 () Bool)

(assert (=> d!4106 (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) nBits!460)))

(declare-fun lt!20156 () Unit!1043)

(declare-fun choose!9 (BitStream!544 array!672 (_ BitVec 64) BitStream!544) Unit!1043)

(assert (=> d!4106 (= lt!20156 (choose!9 thiss!1486 (buf!640 (_2!767 lt!19698)) nBits!460 (BitStream!545 (buf!640 (_2!767 lt!19698)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486))))))

(assert (=> d!4106 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!640 (_2!767 lt!19698)) nBits!460) lt!20156)))

(declare-fun bs!1126 () Bool)

(assert (= bs!1126 d!4106))

(assert (=> bs!1126 m!18559))

(declare-fun m!18937 () Bool)

(assert (=> bs!1126 m!18937))

(assert (=> b!12269 d!4106))

(declare-fun d!4108 () Bool)

(declare-fun e!7577 () Bool)

(assert (=> d!4108 e!7577))

(declare-fun res!11950 () Bool)

(assert (=> d!4108 (=> (not res!11950) (not e!7577))))

(declare-fun lt!20178 () tuple2!1428)

(assert (=> d!4108 (= res!11950 (= (buf!640 (_2!766 lt!20178)) (buf!640 (_1!765 lt!19700))))))

(declare-datatypes ((tuple3!94 0))(
  ( (tuple3!95 (_1!777 Unit!1043) (_2!777 BitStream!544) (_3!53 array!672)) )
))
(declare-fun lt!20184 () tuple3!94)

(assert (=> d!4108 (= lt!20178 (tuple2!1429 (_3!53 lt!20184) (_2!777 lt!20184)))))

(declare-fun readBitsLoop!0 (BitStream!544 (_ BitVec 64) array!672 (_ BitVec 64) (_ BitVec 64)) tuple3!94)

(assert (=> d!4108 (= lt!20184 (readBitsLoop!0 (_1!765 lt!19700) nBits!460 (array!673 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4108 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4108 (= (readBits!0 (_1!765 lt!19700) nBits!460) lt!20178)))

(declare-fun b!12497 () Bool)

(declare-fun res!11953 () Bool)

(assert (=> b!12497 (=> (not res!11953) (not e!7577))))

(assert (=> b!12497 (= res!11953 (invariant!0 (currentBit!1713 (_2!766 lt!20178)) (currentByte!1718 (_2!766 lt!20178)) (size!292 (buf!640 (_2!766 lt!20178)))))))

(declare-fun b!12498 () Bool)

(declare-fun res!11954 () Bool)

(assert (=> b!12498 (=> (not res!11954) (not e!7577))))

(declare-fun lt!20180 () (_ BitVec 64))

(assert (=> b!12498 (= res!11954 (= (size!292 (_1!766 lt!20178)) ((_ extract 31 0) lt!20180)))))

(assert (=> b!12498 (and (bvslt lt!20180 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!20180 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!20182 () (_ BitVec 64))

(declare-fun lt!20183 () (_ BitVec 64))

(assert (=> b!12498 (= lt!20180 (bvsdiv lt!20182 lt!20183))))

(assert (=> b!12498 (and (not (= lt!20183 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!20182 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!20183 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!12498 (= lt!20183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!20181 () (_ BitVec 64))

(declare-fun lt!20179 () (_ BitVec 64))

(assert (=> b!12498 (= lt!20182 (bvsub lt!20181 lt!20179))))

(assert (=> b!12498 (or (= (bvand lt!20181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20179 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20181 lt!20179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12498 (= lt!20179 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20186 () (_ BitVec 64))

(assert (=> b!12498 (= lt!20181 (bvadd nBits!460 lt!20186))))

(assert (=> b!12498 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20186 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!20186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12498 (= lt!20186 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!12499 () Bool)

(declare-fun res!11952 () Bool)

(assert (=> b!12499 (=> (not res!11952) (not e!7577))))

(assert (=> b!12499 (= res!11952 (bvsle (currentByte!1718 (_1!765 lt!19700)) (currentByte!1718 (_2!766 lt!20178))))))

(declare-fun b!12500 () Bool)

(assert (=> b!12500 (= e!7577 (= (byteArrayBitContentToList!0 (_2!766 lt!20178) (_1!766 lt!20178) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!766 lt!20178) (_1!765 lt!19700) nBits!460)))))

(declare-fun b!12501 () Bool)

(declare-fun res!11951 () Bool)

(assert (=> b!12501 (=> (not res!11951) (not e!7577))))

(declare-fun lt!20185 () (_ BitVec 64))

(assert (=> b!12501 (= res!11951 (= (bvadd lt!20185 nBits!460) (bitIndex!0 (size!292 (buf!640 (_2!766 lt!20178))) (currentByte!1718 (_2!766 lt!20178)) (currentBit!1713 (_2!766 lt!20178)))))))

(assert (=> b!12501 (or (not (= (bvand lt!20185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20185 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12501 (= lt!20185 (bitIndex!0 (size!292 (buf!640 (_1!765 lt!19700))) (currentByte!1718 (_1!765 lt!19700)) (currentBit!1713 (_1!765 lt!19700))))))

(assert (= (and d!4108 res!11950) b!12501))

(assert (= (and b!12501 res!11951) b!12497))

(assert (= (and b!12497 res!11953) b!12498))

(assert (= (and b!12498 res!11954) b!12499))

(assert (= (and b!12499 res!11952) b!12500))

(declare-fun m!18957 () Bool)

(assert (=> d!4108 m!18957))

(declare-fun m!18959 () Bool)

(assert (=> b!12497 m!18959))

(declare-fun m!18961 () Bool)

(assert (=> b!12500 m!18961))

(declare-fun m!18963 () Bool)

(assert (=> b!12500 m!18963))

(declare-fun m!18965 () Bool)

(assert (=> b!12501 m!18965))

(declare-fun m!18967 () Bool)

(assert (=> b!12501 m!18967))

(assert (=> b!12269 d!4108))

(declare-fun d!4124 () Bool)

(declare-fun c!940 () Bool)

(assert (=> d!4124 (= c!940 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7578 () List!168)

(assert (=> d!4124 (= (byteArrayBitContentToList!0 (_2!767 lt!19698) (_1!766 lt!19695) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7578)))

(declare-fun b!12502 () Bool)

(assert (=> b!12502 (= e!7578 Nil!165)))

(declare-fun b!12503 () Bool)

(assert (=> b!12503 (= e!7578 (Cons!164 (not (= (bvand ((_ sign_extend 24) (select (arr!718 (_1!766 lt!19695)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!767 lt!19698) (_1!766 lt!19695) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4124 c!940) b!12502))

(assert (= (and d!4124 (not c!940)) b!12503))

(assert (=> b!12503 m!18667))

(assert (=> b!12503 m!18669))

(declare-fun m!18969 () Bool)

(assert (=> b!12503 m!18969))

(assert (=> b!12269 d!4124))

(declare-fun d!4126 () Bool)

(assert (=> d!4126 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!292 (buf!640 (_2!767 lt!19698)))) ((_ sign_extend 32) (currentByte!1718 thiss!1486)) ((_ sign_extend 32) (currentBit!1713 thiss!1486))) nBits!460))))

(declare-fun bs!1131 () Bool)

(assert (= bs!1131 d!4126))

(declare-fun m!18971 () Bool)

(assert (=> bs!1131 m!18971))

(assert (=> b!12269 d!4126))

(declare-fun d!4128 () Bool)

(declare-fun e!7590 () Bool)

(assert (=> d!4128 e!7590))

(declare-fun c!949 () Bool)

(assert (=> d!4128 (= c!949 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!20244 () List!168)

(declare-datatypes ((tuple2!1448 0))(
  ( (tuple2!1449 (_1!778 List!168) (_2!778 BitStream!544)) )
))
(declare-fun e!7589 () tuple2!1448)

(assert (=> d!4128 (= lt!20244 (_1!778 e!7589))))

(declare-fun c!950 () Bool)

(assert (=> d!4128 (= c!950 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4128 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4128 (= (bitStreamReadBitsIntoList!0 (_2!767 lt!19698) (_1!765 lt!19700) nBits!460) lt!20244)))

(declare-fun b!12529 () Bool)

(declare-fun length!36 (List!168) Int)

(assert (=> b!12529 (= e!7590 (> (length!36 lt!20244) 0))))

(declare-datatypes ((tuple2!1450 0))(
  ( (tuple2!1451 (_1!779 Bool) (_2!779 BitStream!544)) )
))
(declare-fun lt!20243 () tuple2!1450)

(declare-fun lt!20245 () (_ BitVec 64))

(declare-fun b!12527 () Bool)

(assert (=> b!12527 (= e!7589 (tuple2!1449 (Cons!164 (_1!779 lt!20243) (bitStreamReadBitsIntoList!0 (_2!767 lt!19698) (_2!779 lt!20243) (bvsub nBits!460 lt!20245))) (_2!779 lt!20243)))))

(declare-fun readBit!0 (BitStream!544) tuple2!1450)

(assert (=> b!12527 (= lt!20243 (readBit!0 (_1!765 lt!19700)))))

(assert (=> b!12527 (= lt!20245 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!12528 () Bool)

(declare-fun isEmpty!41 (List!168) Bool)

(assert (=> b!12528 (= e!7590 (isEmpty!41 lt!20244))))

(declare-fun b!12526 () Bool)

(assert (=> b!12526 (= e!7589 (tuple2!1449 Nil!165 (_1!765 lt!19700)))))

(assert (= (and d!4128 c!950) b!12526))

(assert (= (and d!4128 (not c!950)) b!12527))

(assert (= (and d!4128 c!949) b!12528))

(assert (= (and d!4128 (not c!949)) b!12529))

(declare-fun m!18973 () Bool)

(assert (=> b!12529 m!18973))

(declare-fun m!18975 () Bool)

(assert (=> b!12527 m!18975))

(declare-fun m!18977 () Bool)

(assert (=> b!12527 m!18977))

(declare-fun m!18979 () Bool)

(assert (=> b!12528 m!18979))

(assert (=> b!12269 d!4128))

(declare-fun d!4130 () Bool)

(declare-fun e!7610 () Bool)

(assert (=> d!4130 e!7610))

(declare-fun res!11999 () Bool)

(assert (=> d!4130 (=> (not res!11999) (not e!7610))))

(declare-fun lt!20442 () tuple2!1426)

(assert (=> d!4130 (= res!11999 (isPrefixOf!0 (_1!765 lt!20442) (_2!765 lt!20442)))))

(declare-fun lt!20446 () BitStream!544)

(assert (=> d!4130 (= lt!20442 (tuple2!1427 lt!20446 (_2!767 lt!19698)))))

(declare-fun lt!20434 () Unit!1043)

(declare-fun lt!20430 () Unit!1043)

(assert (=> d!4130 (= lt!20434 lt!20430)))

(assert (=> d!4130 (isPrefixOf!0 lt!20446 (_2!767 lt!19698))))

(assert (=> d!4130 (= lt!20430 (lemmaIsPrefixTransitive!0 lt!20446 (_2!767 lt!19698) (_2!767 lt!19698)))))

(declare-fun lt!20432 () Unit!1043)

(declare-fun lt!20441 () Unit!1043)

(assert (=> d!4130 (= lt!20432 lt!20441)))

(assert (=> d!4130 (isPrefixOf!0 lt!20446 (_2!767 lt!19698))))

(assert (=> d!4130 (= lt!20441 (lemmaIsPrefixTransitive!0 lt!20446 thiss!1486 (_2!767 lt!19698)))))

(declare-fun lt!20437 () Unit!1043)

(declare-fun e!7611 () Unit!1043)

(assert (=> d!4130 (= lt!20437 e!7611)))

(declare-fun c!955 () Bool)

(assert (=> d!4130 (= c!955 (not (= (size!292 (buf!640 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!20435 () Unit!1043)

(declare-fun lt!20429 () Unit!1043)

(assert (=> d!4130 (= lt!20435 lt!20429)))

(assert (=> d!4130 (isPrefixOf!0 (_2!767 lt!19698) (_2!767 lt!19698))))

(assert (=> d!4130 (= lt!20429 (lemmaIsPrefixRefl!0 (_2!767 lt!19698)))))

(declare-fun lt!20438 () Unit!1043)

(declare-fun lt!20444 () Unit!1043)

(assert (=> d!4130 (= lt!20438 lt!20444)))

(assert (=> d!4130 (= lt!20444 (lemmaIsPrefixRefl!0 (_2!767 lt!19698)))))

(declare-fun lt!20447 () Unit!1043)

(declare-fun lt!20431 () Unit!1043)

(assert (=> d!4130 (= lt!20447 lt!20431)))

(assert (=> d!4130 (isPrefixOf!0 lt!20446 lt!20446)))

(assert (=> d!4130 (= lt!20431 (lemmaIsPrefixRefl!0 lt!20446))))

(declare-fun lt!20436 () Unit!1043)

(declare-fun lt!20433 () Unit!1043)

(assert (=> d!4130 (= lt!20436 lt!20433)))

(assert (=> d!4130 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!4130 (= lt!20433 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4130 (= lt!20446 (BitStream!545 (buf!640 (_2!767 lt!19698)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)))))

(assert (=> d!4130 (isPrefixOf!0 thiss!1486 (_2!767 lt!19698))))

(assert (=> d!4130 (= (reader!0 thiss!1486 (_2!767 lt!19698)) lt!20442)))

(declare-fun b!12574 () Bool)

(declare-fun lt!20428 () Unit!1043)

(assert (=> b!12574 (= e!7611 lt!20428)))

(declare-fun lt!20440 () (_ BitVec 64))

(assert (=> b!12574 (= lt!20440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!20445 () (_ BitVec 64))

(assert (=> b!12574 (= lt!20445 (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!672 array!672 (_ BitVec 64) (_ BitVec 64)) Unit!1043)

(assert (=> b!12574 (= lt!20428 (arrayBitRangesEqSymmetric!0 (buf!640 thiss!1486) (buf!640 (_2!767 lt!19698)) lt!20440 lt!20445))))

(assert (=> b!12574 (arrayBitRangesEq!0 (buf!640 (_2!767 lt!19698)) (buf!640 thiss!1486) lt!20440 lt!20445)))

(declare-fun b!12575 () Bool)

(declare-fun res!11998 () Bool)

(assert (=> b!12575 (=> (not res!11998) (not e!7610))))

(assert (=> b!12575 (= res!11998 (isPrefixOf!0 (_1!765 lt!20442) thiss!1486))))

(declare-fun lt!20439 () (_ BitVec 64))

(declare-fun b!12576 () Bool)

(declare-fun lt!20443 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!544 (_ BitVec 64)) BitStream!544)

(assert (=> b!12576 (= e!7610 (= (_1!765 lt!20442) (withMovedBitIndex!0 (_2!765 lt!20442) (bvsub lt!20439 lt!20443))))))

(assert (=> b!12576 (or (= (bvand lt!20439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20439 lt!20443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12576 (= lt!20443 (bitIndex!0 (size!292 (buf!640 (_2!767 lt!19698))) (currentByte!1718 (_2!767 lt!19698)) (currentBit!1713 (_2!767 lt!19698))))))

(assert (=> b!12576 (= lt!20439 (bitIndex!0 (size!292 (buf!640 thiss!1486)) (currentByte!1718 thiss!1486) (currentBit!1713 thiss!1486)))))

(declare-fun b!12577 () Bool)

(declare-fun res!11997 () Bool)

(assert (=> b!12577 (=> (not res!11997) (not e!7610))))

(assert (=> b!12577 (= res!11997 (isPrefixOf!0 (_2!765 lt!20442) (_2!767 lt!19698)))))

(declare-fun b!12578 () Bool)

(declare-fun Unit!1070 () Unit!1043)

(assert (=> b!12578 (= e!7611 Unit!1070)))

(assert (= (and d!4130 c!955) b!12574))

(assert (= (and d!4130 (not c!955)) b!12578))

(assert (= (and d!4130 res!11999) b!12575))

(assert (= (and b!12575 res!11998) b!12577))

(assert (= (and b!12577 res!11997) b!12576))

(declare-fun m!19093 () Bool)

(assert (=> b!12575 m!19093))

(assert (=> b!12574 m!18575))

(declare-fun m!19095 () Bool)

(assert (=> b!12574 m!19095))

(declare-fun m!19097 () Bool)

(assert (=> b!12574 m!19097))

(declare-fun m!19099 () Bool)

(assert (=> b!12576 m!19099))

(assert (=> b!12576 m!18573))

(assert (=> b!12576 m!18575))

(declare-fun m!19101 () Bool)

(assert (=> b!12577 m!19101))

(declare-fun m!19103 () Bool)

(assert (=> d!4130 m!19103))

(assert (=> d!4130 m!18761))

(assert (=> d!4130 m!18759))

(declare-fun m!19105 () Bool)

(assert (=> d!4130 m!19105))

(declare-fun m!19107 () Bool)

(assert (=> d!4130 m!19107))

(declare-fun m!19109 () Bool)

(assert (=> d!4130 m!19109))

(declare-fun m!19111 () Bool)

(assert (=> d!4130 m!19111))

(declare-fun m!19113 () Bool)

(assert (=> d!4130 m!19113))

(declare-fun m!19115 () Bool)

(assert (=> d!4130 m!19115))

(assert (=> d!4130 m!18571))

(declare-fun m!19117 () Bool)

(assert (=> d!4130 m!19117))

(assert (=> b!12269 d!4130))

(declare-fun d!4140 () Bool)

(assert (=> d!4140 (= (inv!12 (BitStream!545 (buf!640 (_1!765 lt!19700)) (currentByte!1718 (_2!766 lt!19695)) (currentBit!1713 (_2!766 lt!19695)))) (invariant!0 (currentBit!1713 (BitStream!545 (buf!640 (_1!765 lt!19700)) (currentByte!1718 (_2!766 lt!19695)) (currentBit!1713 (_2!766 lt!19695)))) (currentByte!1718 (BitStream!545 (buf!640 (_1!765 lt!19700)) (currentByte!1718 (_2!766 lt!19695)) (currentBit!1713 (_2!766 lt!19695)))) (size!292 (buf!640 (BitStream!545 (buf!640 (_1!765 lt!19700)) (currentByte!1718 (_2!766 lt!19695)) (currentBit!1713 (_2!766 lt!19695)))))))))

(declare-fun bs!1133 () Bool)

(assert (= bs!1133 d!4140))

(declare-fun m!19119 () Bool)

(assert (=> bs!1133 m!19119))

(assert (=> b!12264 d!4140))

(push 1)

(assert (not d!4106))

(assert (not d!4084))

(assert (not b!12501))

(assert (not b!12529))

(assert (not b!12351))

(assert (not d!4054))

(assert (not b!12474))

(assert (not d!4076))

(assert (not b!12575))

(assert (not b!12497))

(assert (not d!4108))

(assert (not b!12576))

(assert (not b!12339))

(assert (not d!4126))

(assert (not b!12503))

(assert (not b!12456))

(assert (not b!12453))

(assert (not d!4080))

(assert (not b!12454))

(assert (not d!4058))

(assert (not d!4100))

(assert (not b!12527))

(assert (not b!12500))

(assert (not b!12577))

(assert (not b!12457))

(assert (not b!12451))

(assert (not b!12574))

(assert (not d!4140))

(assert (not b!12455))

(assert (not bm!250))

(assert (not d!4130))

(assert (not b!12472))

(assert (not b!12528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

