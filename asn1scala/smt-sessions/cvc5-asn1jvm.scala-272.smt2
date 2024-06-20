; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5380 () Bool)

(assert start!5380)

(declare-fun b!21731 () Bool)

(declare-fun res!18769 () Bool)

(declare-fun e!14741 () Bool)

(assert (=> b!21731 (=> res!18769 e!14741)))

(declare-fun lt!31387 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1529 0))(
  ( (array!1530 (arr!1102 (Array (_ BitVec 32) (_ BitVec 8))) (size!652 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1138 0))(
  ( (BitStream!1139 (buf!967 array!1529) (currentByte!2268 (_ BitVec 32)) (currentBit!2263 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1898 0))(
  ( (Unit!1899) )
))
(declare-datatypes ((tuple2!2550 0))(
  ( (tuple2!2551 (_1!1360 Unit!1898) (_2!1360 BitStream!1138)) )
))
(declare-fun lt!31389 () tuple2!2550)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21731 (= res!18769 (not (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31389))) (currentByte!2268 (_2!1360 lt!31389)) (currentBit!2263 (_2!1360 lt!31389))) (bvsub (bvadd lt!31387 to!314) i!635))))))

(declare-fun b!21732 () Bool)

(declare-fun e!14745 () Bool)

(declare-fun e!14744 () Bool)

(assert (=> b!21732 (= e!14745 e!14744)))

(declare-fun res!18772 () Bool)

(assert (=> b!21732 (=> res!18772 e!14744)))

(declare-fun thiss!1379 () BitStream!1138)

(declare-fun lt!31392 () tuple2!2550)

(declare-fun isPrefixOf!0 (BitStream!1138 BitStream!1138) Bool)

(assert (=> b!21732 (= res!18772 (not (isPrefixOf!0 thiss!1379 (_2!1360 lt!31392))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21732 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31386 () Unit!1898)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1138 BitStream!1138 (_ BitVec 64) (_ BitVec 64)) Unit!1898)

(assert (=> b!21732 (= lt!31386 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1360 lt!31392) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1529)

(declare-fun appendBitFromByte!0 (BitStream!1138 (_ BitVec 8) (_ BitVec 32)) tuple2!2550)

(assert (=> b!21732 (= lt!31392 (appendBitFromByte!0 thiss!1379 (select (arr!1102 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21733 () Bool)

(assert (=> b!21733 (= e!14744 e!14741)))

(declare-fun res!18766 () Bool)

(assert (=> b!21733 (=> res!18766 e!14741)))

(assert (=> b!21733 (= res!18766 (not (isPrefixOf!0 (_2!1360 lt!31392) (_2!1360 lt!31389))))))

(assert (=> b!21733 (isPrefixOf!0 thiss!1379 (_2!1360 lt!31389))))

(declare-fun lt!31388 () Unit!1898)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1138 BitStream!1138 BitStream!1138) Unit!1898)

(assert (=> b!21733 (= lt!31388 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1360 lt!31392) (_2!1360 lt!31389)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1138 array!1529 (_ BitVec 64) (_ BitVec 64)) tuple2!2550)

(assert (=> b!21733 (= lt!31389 (appendBitsMSBFirstLoop!0 (_2!1360 lt!31392) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!14739 () Bool)

(assert (=> b!21733 e!14739))

(declare-fun res!18773 () Bool)

(assert (=> b!21733 (=> (not res!18773) (not e!14739))))

(assert (=> b!21733 (= res!18773 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31390 () Unit!1898)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1138 array!1529 (_ BitVec 64)) Unit!1898)

(assert (=> b!21733 (= lt!31390 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!967 (_2!1360 lt!31392)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2552 0))(
  ( (tuple2!2553 (_1!1361 BitStream!1138) (_2!1361 BitStream!1138)) )
))
(declare-fun lt!31391 () tuple2!2552)

(declare-fun reader!0 (BitStream!1138 BitStream!1138) tuple2!2552)

(assert (=> b!21733 (= lt!31391 (reader!0 thiss!1379 (_2!1360 lt!31392)))))

(declare-fun b!21734 () Bool)

(declare-fun res!18771 () Bool)

(assert (=> b!21734 (=> res!18771 e!14741)))

(assert (=> b!21734 (= res!18771 (not (= (size!652 (buf!967 thiss!1379)) (size!652 (buf!967 (_2!1360 lt!31389))))))))

(declare-fun b!21735 () Bool)

(declare-fun res!18767 () Bool)

(assert (=> b!21735 (=> res!18767 e!14741)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21735 (= res!18767 (not (invariant!0 (currentBit!2263 (_2!1360 lt!31389)) (currentByte!2268 (_2!1360 lt!31389)) (size!652 (buf!967 (_2!1360 lt!31389))))))))

(declare-fun res!18765 () Bool)

(declare-fun e!14740 () Bool)

(assert (=> start!5380 (=> (not res!18765) (not e!14740))))

(assert (=> start!5380 (= res!18765 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!652 srcBuffer!2))))))))

(assert (=> start!5380 e!14740))

(assert (=> start!5380 true))

(declare-fun array_inv!622 (array!1529) Bool)

(assert (=> start!5380 (array_inv!622 srcBuffer!2)))

(declare-fun e!14738 () Bool)

(declare-fun inv!12 (BitStream!1138) Bool)

(assert (=> start!5380 (and (inv!12 thiss!1379) e!14738)))

(declare-fun b!21736 () Bool)

(declare-fun res!18770 () Bool)

(assert (=> b!21736 (=> (not res!18770) (not e!14740))))

(assert (=> b!21736 (= res!18770 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 thiss!1379))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!21737 () Bool)

(assert (=> b!21737 (= e!14738 (array_inv!622 (buf!967 thiss!1379)))))

(declare-fun b!21738 () Bool)

(assert (=> b!21738 (= e!14740 (not e!14745))))

(declare-fun res!18768 () Bool)

(assert (=> b!21738 (=> res!18768 e!14745)))

(assert (=> b!21738 (= res!18768 (bvsge i!635 to!314))))

(assert (=> b!21738 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31393 () Unit!1898)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1138) Unit!1898)

(assert (=> b!21738 (= lt!31393 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!21738 (= lt!31387 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)))))

(declare-fun b!21739 () Bool)

(declare-datatypes ((List!270 0))(
  ( (Nil!267) (Cons!266 (h!385 Bool) (t!1020 List!270)) )
))
(declare-fun head!107 (List!270) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1138 array!1529 (_ BitVec 64) (_ BitVec 64)) List!270)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1138 BitStream!1138 (_ BitVec 64)) List!270)

(assert (=> b!21739 (= e!14739 (= (head!107 (byteArrayBitContentToList!0 (_2!1360 lt!31392) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!107 (bitStreamReadBitsIntoList!0 (_2!1360 lt!31392) (_1!1361 lt!31391) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21740 () Bool)

(assert (=> b!21740 (= e!14741 (invariant!0 (currentBit!2263 thiss!1379) (currentByte!2268 thiss!1379) (size!652 (buf!967 thiss!1379))))))

(assert (=> b!21740 (= (size!652 (buf!967 (_2!1360 lt!31389))) (size!652 (buf!967 thiss!1379)))))

(assert (= (and start!5380 res!18765) b!21736))

(assert (= (and b!21736 res!18770) b!21738))

(assert (= (and b!21738 (not res!18768)) b!21732))

(assert (= (and b!21732 (not res!18772)) b!21733))

(assert (= (and b!21733 res!18773) b!21739))

(assert (= (and b!21733 (not res!18766)) b!21731))

(assert (= (and b!21731 (not res!18769)) b!21735))

(assert (= (and b!21735 (not res!18767)) b!21734))

(assert (= (and b!21734 (not res!18771)) b!21740))

(assert (= start!5380 b!21737))

(declare-fun m!30105 () Bool)

(assert (=> b!21735 m!30105))

(declare-fun m!30107 () Bool)

(assert (=> b!21739 m!30107))

(assert (=> b!21739 m!30107))

(declare-fun m!30109 () Bool)

(assert (=> b!21739 m!30109))

(declare-fun m!30111 () Bool)

(assert (=> b!21739 m!30111))

(assert (=> b!21739 m!30111))

(declare-fun m!30113 () Bool)

(assert (=> b!21739 m!30113))

(declare-fun m!30115 () Bool)

(assert (=> b!21731 m!30115))

(declare-fun m!30117 () Bool)

(assert (=> b!21736 m!30117))

(declare-fun m!30119 () Bool)

(assert (=> b!21733 m!30119))

(declare-fun m!30121 () Bool)

(assert (=> b!21733 m!30121))

(declare-fun m!30123 () Bool)

(assert (=> b!21733 m!30123))

(declare-fun m!30125 () Bool)

(assert (=> b!21733 m!30125))

(declare-fun m!30127 () Bool)

(assert (=> b!21733 m!30127))

(declare-fun m!30129 () Bool)

(assert (=> b!21733 m!30129))

(declare-fun m!30131 () Bool)

(assert (=> b!21733 m!30131))

(declare-fun m!30133 () Bool)

(assert (=> b!21740 m!30133))

(declare-fun m!30135 () Bool)

(assert (=> b!21732 m!30135))

(declare-fun m!30137 () Bool)

(assert (=> b!21732 m!30137))

(declare-fun m!30139 () Bool)

(assert (=> b!21732 m!30139))

(declare-fun m!30141 () Bool)

(assert (=> b!21732 m!30141))

(assert (=> b!21732 m!30137))

(declare-fun m!30143 () Bool)

(assert (=> b!21732 m!30143))

(declare-fun m!30145 () Bool)

(assert (=> b!21738 m!30145))

(declare-fun m!30147 () Bool)

(assert (=> b!21738 m!30147))

(declare-fun m!30149 () Bool)

(assert (=> b!21738 m!30149))

(declare-fun m!30151 () Bool)

(assert (=> b!21737 m!30151))

(declare-fun m!30153 () Bool)

(assert (=> start!5380 m!30153))

(declare-fun m!30155 () Bool)

(assert (=> start!5380 m!30155))

(push 1)

(assert (not b!21738))

(assert (not b!21740))

(assert (not b!21735))

(assert (not b!21731))

(assert (not b!21733))

(assert (not b!21737))

(assert (not start!5380))

(assert (not b!21739))

(assert (not b!21732))

(assert (not b!21736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6926 () Bool)

(assert (=> d!6926 (= (head!107 (byteArrayBitContentToList!0 (_2!1360 lt!31392) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!385 (byteArrayBitContentToList!0 (_2!1360 lt!31392) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21739 d!6926))

(declare-fun d!6928 () Bool)

(declare-fun c!1552 () Bool)

(assert (=> d!6928 (= c!1552 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14796 () List!270)

(assert (=> d!6928 (= (byteArrayBitContentToList!0 (_2!1360 lt!31392) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!14796)))

(declare-fun b!21805 () Bool)

(assert (=> b!21805 (= e!14796 Nil!267)))

(declare-fun b!21806 () Bool)

(assert (=> b!21806 (= e!14796 (Cons!266 (not (= (bvand ((_ sign_extend 24) (select (arr!1102 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1360 lt!31392) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6928 c!1552) b!21805))

(assert (= (and d!6928 (not c!1552)) b!21806))

(assert (=> b!21806 m!30137))

(declare-fun m!30261 () Bool)

(assert (=> b!21806 m!30261))

(declare-fun m!30263 () Bool)

(assert (=> b!21806 m!30263))

(assert (=> b!21739 d!6928))

(declare-fun d!6930 () Bool)

(assert (=> d!6930 (= (head!107 (bitStreamReadBitsIntoList!0 (_2!1360 lt!31392) (_1!1361 lt!31391) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!385 (bitStreamReadBitsIntoList!0 (_2!1360 lt!31392) (_1!1361 lt!31391) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21739 d!6930))

(declare-datatypes ((tuple2!2562 0))(
  ( (tuple2!2563 (_1!1366 Bool) (_2!1366 BitStream!1138)) )
))
(declare-fun lt!31467 () tuple2!2562)

(declare-datatypes ((tuple2!2564 0))(
  ( (tuple2!2565 (_1!1367 List!270) (_2!1367 BitStream!1138)) )
))
(declare-fun e!14804 () tuple2!2564)

(declare-fun b!21822 () Bool)

(declare-fun lt!31466 () (_ BitVec 64))

(assert (=> b!21822 (= e!14804 (tuple2!2565 (Cons!266 (_1!1366 lt!31467) (bitStreamReadBitsIntoList!0 (_2!1360 lt!31392) (_2!1366 lt!31467) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!31466))) (_2!1366 lt!31467)))))

(declare-fun readBit!0 (BitStream!1138) tuple2!2562)

(assert (=> b!21822 (= lt!31467 (readBit!0 (_1!1361 lt!31391)))))

(assert (=> b!21822 (= lt!31466 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!21821 () Bool)

(assert (=> b!21821 (= e!14804 (tuple2!2565 Nil!267 (_1!1361 lt!31391)))))

(declare-fun b!21824 () Bool)

(declare-fun e!14805 () Bool)

(declare-fun lt!31468 () List!270)

(declare-fun length!54 (List!270) Int)

(assert (=> b!21824 (= e!14805 (> (length!54 lt!31468) 0))))

(declare-fun d!6932 () Bool)

(assert (=> d!6932 e!14805))

(declare-fun c!1557 () Bool)

(assert (=> d!6932 (= c!1557 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6932 (= lt!31468 (_1!1367 e!14804))))

(declare-fun c!1558 () Bool)

(assert (=> d!6932 (= c!1558 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6932 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6932 (= (bitStreamReadBitsIntoList!0 (_2!1360 lt!31392) (_1!1361 lt!31391) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31468)))

(declare-fun b!21823 () Bool)

(declare-fun isEmpty!59 (List!270) Bool)

(assert (=> b!21823 (= e!14805 (isEmpty!59 lt!31468))))

(assert (= (and d!6932 c!1558) b!21821))

(assert (= (and d!6932 (not c!1558)) b!21822))

(assert (= (and d!6932 c!1557) b!21823))

(assert (= (and d!6932 (not c!1557)) b!21824))

(declare-fun m!30269 () Bool)

(assert (=> b!21822 m!30269))

(declare-fun m!30271 () Bool)

(assert (=> b!21822 m!30271))

(declare-fun m!30273 () Bool)

(assert (=> b!21824 m!30273))

(declare-fun m!30275 () Bool)

(assert (=> b!21823 m!30275))

(assert (=> b!21739 d!6932))

(declare-fun b!21868 () Bool)

(declare-fun lt!31544 () tuple2!2552)

(declare-fun e!14832 () Bool)

(declare-fun lt!31539 () (_ BitVec 64))

(declare-fun lt!31549 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1138 (_ BitVec 64)) BitStream!1138)

(assert (=> b!21868 (= e!14832 (= (_1!1361 lt!31544) (withMovedBitIndex!0 (_2!1361 lt!31544) (bvsub lt!31539 lt!31549))))))

(assert (=> b!21868 (or (= (bvand lt!31539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31549 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31539 lt!31549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21868 (= lt!31549 (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392))))))

(assert (=> b!21868 (= lt!31539 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)))))

(declare-fun b!21869 () Bool)

(declare-fun e!14833 () Unit!1898)

(declare-fun lt!31541 () Unit!1898)

(assert (=> b!21869 (= e!14833 lt!31541)))

(declare-fun lt!31551 () (_ BitVec 64))

(assert (=> b!21869 (= lt!31551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!31543 () (_ BitVec 64))

(assert (=> b!21869 (= lt!31543 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1529 array!1529 (_ BitVec 64) (_ BitVec 64)) Unit!1898)

(assert (=> b!21869 (= lt!31541 (arrayBitRangesEqSymmetric!0 (buf!967 thiss!1379) (buf!967 (_2!1360 lt!31392)) lt!31551 lt!31543))))

(declare-fun arrayBitRangesEq!0 (array!1529 array!1529 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21869 (arrayBitRangesEq!0 (buf!967 (_2!1360 lt!31392)) (buf!967 thiss!1379) lt!31551 lt!31543)))

(declare-fun d!6940 () Bool)

(assert (=> d!6940 e!14832))

(declare-fun res!18873 () Bool)

(assert (=> d!6940 (=> (not res!18873) (not e!14832))))

(assert (=> d!6940 (= res!18873 (isPrefixOf!0 (_1!1361 lt!31544) (_2!1361 lt!31544)))))

(declare-fun lt!31556 () BitStream!1138)

(assert (=> d!6940 (= lt!31544 (tuple2!2553 lt!31556 (_2!1360 lt!31392)))))

(declare-fun lt!31554 () Unit!1898)

(declare-fun lt!31547 () Unit!1898)

(assert (=> d!6940 (= lt!31554 lt!31547)))

(assert (=> d!6940 (isPrefixOf!0 lt!31556 (_2!1360 lt!31392))))

(assert (=> d!6940 (= lt!31547 (lemmaIsPrefixTransitive!0 lt!31556 (_2!1360 lt!31392) (_2!1360 lt!31392)))))

(declare-fun lt!31557 () Unit!1898)

(declare-fun lt!31546 () Unit!1898)

(assert (=> d!6940 (= lt!31557 lt!31546)))

(assert (=> d!6940 (isPrefixOf!0 lt!31556 (_2!1360 lt!31392))))

(assert (=> d!6940 (= lt!31546 (lemmaIsPrefixTransitive!0 lt!31556 thiss!1379 (_2!1360 lt!31392)))))

(declare-fun lt!31558 () Unit!1898)

(assert (=> d!6940 (= lt!31558 e!14833)))

(declare-fun c!1561 () Bool)

(assert (=> d!6940 (= c!1561 (not (= (size!652 (buf!967 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!31555 () Unit!1898)

(declare-fun lt!31540 () Unit!1898)

(assert (=> d!6940 (= lt!31555 lt!31540)))

(assert (=> d!6940 (isPrefixOf!0 (_2!1360 lt!31392) (_2!1360 lt!31392))))

(assert (=> d!6940 (= lt!31540 (lemmaIsPrefixRefl!0 (_2!1360 lt!31392)))))

(declare-fun lt!31545 () Unit!1898)

(declare-fun lt!31550 () Unit!1898)

(assert (=> d!6940 (= lt!31545 lt!31550)))

(assert (=> d!6940 (= lt!31550 (lemmaIsPrefixRefl!0 (_2!1360 lt!31392)))))

(declare-fun lt!31552 () Unit!1898)

(declare-fun lt!31553 () Unit!1898)

(assert (=> d!6940 (= lt!31552 lt!31553)))

(assert (=> d!6940 (isPrefixOf!0 lt!31556 lt!31556)))

(assert (=> d!6940 (= lt!31553 (lemmaIsPrefixRefl!0 lt!31556))))

(declare-fun lt!31542 () Unit!1898)

(declare-fun lt!31548 () Unit!1898)

(assert (=> d!6940 (= lt!31542 lt!31548)))

(assert (=> d!6940 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6940 (= lt!31548 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6940 (= lt!31556 (BitStream!1139 (buf!967 (_2!1360 lt!31392)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)))))

(assert (=> d!6940 (isPrefixOf!0 thiss!1379 (_2!1360 lt!31392))))

(assert (=> d!6940 (= (reader!0 thiss!1379 (_2!1360 lt!31392)) lt!31544)))

(declare-fun b!21870 () Bool)

(declare-fun res!18875 () Bool)

(assert (=> b!21870 (=> (not res!18875) (not e!14832))))

(assert (=> b!21870 (= res!18875 (isPrefixOf!0 (_2!1361 lt!31544) (_2!1360 lt!31392)))))

(declare-fun b!21871 () Bool)

(declare-fun res!18874 () Bool)

(assert (=> b!21871 (=> (not res!18874) (not e!14832))))

(assert (=> b!21871 (= res!18874 (isPrefixOf!0 (_1!1361 lt!31544) thiss!1379))))

(declare-fun b!21872 () Bool)

(declare-fun Unit!1904 () Unit!1898)

(assert (=> b!21872 (= e!14833 Unit!1904)))

(assert (= (and d!6940 c!1561) b!21869))

(assert (= (and d!6940 (not c!1561)) b!21872))

(assert (= (and d!6940 res!18873) b!21871))

(assert (= (and b!21871 res!18874) b!21870))

(assert (= (and b!21870 res!18875) b!21868))

(assert (=> b!21869 m!30149))

(declare-fun m!30303 () Bool)

(assert (=> b!21869 m!30303))

(declare-fun m!30305 () Bool)

(assert (=> b!21869 m!30305))

(declare-fun m!30307 () Bool)

(assert (=> b!21868 m!30307))

(declare-fun m!30309 () Bool)

(assert (=> b!21868 m!30309))

(assert (=> b!21868 m!30149))

(declare-fun m!30311 () Bool)

(assert (=> d!6940 m!30311))

(declare-fun m!30313 () Bool)

(assert (=> d!6940 m!30313))

(declare-fun m!30315 () Bool)

(assert (=> d!6940 m!30315))

(declare-fun m!30317 () Bool)

(assert (=> d!6940 m!30317))

(declare-fun m!30319 () Bool)

(assert (=> d!6940 m!30319))

(declare-fun m!30321 () Bool)

(assert (=> d!6940 m!30321))

(declare-fun m!30323 () Bool)

(assert (=> d!6940 m!30323))

(assert (=> d!6940 m!30147))

(assert (=> d!6940 m!30135))

(declare-fun m!30325 () Bool)

(assert (=> d!6940 m!30325))

(assert (=> d!6940 m!30145))

(declare-fun m!30327 () Bool)

(assert (=> b!21871 m!30327))

(declare-fun m!30329 () Bool)

(assert (=> b!21870 m!30329))

(assert (=> b!21733 d!6940))

(declare-fun d!6974 () Bool)

(declare-fun res!18884 () Bool)

(declare-fun e!14838 () Bool)

(assert (=> d!6974 (=> (not res!18884) (not e!14838))))

(assert (=> d!6974 (= res!18884 (= (size!652 (buf!967 thiss!1379)) (size!652 (buf!967 (_2!1360 lt!31389)))))))

(assert (=> d!6974 (= (isPrefixOf!0 thiss!1379 (_2!1360 lt!31389)) e!14838)))

(declare-fun b!21879 () Bool)

(declare-fun res!18882 () Bool)

(assert (=> b!21879 (=> (not res!18882) (not e!14838))))

(assert (=> b!21879 (= res!18882 (bvsle (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)) (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31389))) (currentByte!2268 (_2!1360 lt!31389)) (currentBit!2263 (_2!1360 lt!31389)))))))

(declare-fun b!21880 () Bool)

(declare-fun e!14839 () Bool)

(assert (=> b!21880 (= e!14838 e!14839)))

(declare-fun res!18883 () Bool)

(assert (=> b!21880 (=> res!18883 e!14839)))

(assert (=> b!21880 (= res!18883 (= (size!652 (buf!967 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21881 () Bool)

(assert (=> b!21881 (= e!14839 (arrayBitRangesEq!0 (buf!967 thiss!1379) (buf!967 (_2!1360 lt!31389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379))))))

(assert (= (and d!6974 res!18884) b!21879))

(assert (= (and b!21879 res!18882) b!21880))

(assert (= (and b!21880 (not res!18883)) b!21881))

(assert (=> b!21879 m!30149))

(assert (=> b!21879 m!30115))

(assert (=> b!21881 m!30149))

(assert (=> b!21881 m!30149))

(declare-fun m!30331 () Bool)

(assert (=> b!21881 m!30331))

(assert (=> b!21733 d!6974))

(declare-fun b!21964 () Bool)

(declare-fun res!18939 () Bool)

(declare-fun e!14878 () Bool)

(assert (=> b!21964 (=> (not res!18939) (not e!14878))))

(declare-fun lt!31797 () tuple2!2550)

(assert (=> b!21964 (= res!18939 (= (size!652 (buf!967 (_2!1360 lt!31797))) (size!652 (buf!967 (_2!1360 lt!31392)))))))

(declare-fun b!21965 () Bool)

(declare-fun res!18941 () Bool)

(assert (=> b!21965 (=> (not res!18941) (not e!14878))))

(assert (=> b!21965 (= res!18941 (= (size!652 (buf!967 (_2!1360 lt!31392))) (size!652 (buf!967 (_2!1360 lt!31797)))))))

(declare-fun b!21966 () Bool)

(declare-fun e!14879 () Bool)

(declare-fun lt!31785 () (_ BitVec 64))

(assert (=> b!21966 (= e!14879 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) lt!31785))))

(declare-fun b!21967 () Bool)

(declare-fun e!14880 () tuple2!2550)

(declare-fun lt!31764 () tuple2!2550)

(declare-fun Unit!1905 () Unit!1898)

(assert (=> b!21967 (= e!14880 (tuple2!2551 Unit!1905 (_2!1360 lt!31764)))))

(declare-fun lt!31790 () tuple2!2550)

(assert (=> b!21967 (= lt!31790 (appendBitFromByte!0 (_2!1360 lt!31392) (select (arr!1102 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!31803 () (_ BitVec 64))

(assert (=> b!21967 (= lt!31803 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31761 () (_ BitVec 64))

(assert (=> b!21967 (= lt!31761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31767 () Unit!1898)

(assert (=> b!21967 (= lt!31767 (validateOffsetBitsIneqLemma!0 (_2!1360 lt!31392) (_2!1360 lt!31790) lt!31803 lt!31761))))

(assert (=> b!21967 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31790)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31790))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31790))) (bvsub lt!31803 lt!31761))))

(declare-fun lt!31771 () Unit!1898)

(assert (=> b!21967 (= lt!31771 lt!31767)))

(declare-fun lt!31774 () tuple2!2552)

(assert (=> b!21967 (= lt!31774 (reader!0 (_2!1360 lt!31392) (_2!1360 lt!31790)))))

(declare-fun lt!31784 () (_ BitVec 64))

(assert (=> b!21967 (= lt!31784 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31801 () Unit!1898)

(assert (=> b!21967 (= lt!31801 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1360 lt!31392) (buf!967 (_2!1360 lt!31790)) lt!31784))))

(assert (=> b!21967 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31790)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) lt!31784)))

(declare-fun lt!31789 () Unit!1898)

(assert (=> b!21967 (= lt!31789 lt!31801)))

(assert (=> b!21967 (= (head!107 (byteArrayBitContentToList!0 (_2!1360 lt!31790) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!107 (bitStreamReadBitsIntoList!0 (_2!1360 lt!31790) (_1!1361 lt!31774) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31766 () Unit!1898)

(declare-fun Unit!1906 () Unit!1898)

(assert (=> b!21967 (= lt!31766 Unit!1906)))

(assert (=> b!21967 (= lt!31764 (appendBitsMSBFirstLoop!0 (_2!1360 lt!31790) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!31802 () Unit!1898)

(assert (=> b!21967 (= lt!31802 (lemmaIsPrefixTransitive!0 (_2!1360 lt!31392) (_2!1360 lt!31790) (_2!1360 lt!31764)))))

(assert (=> b!21967 (isPrefixOf!0 (_2!1360 lt!31392) (_2!1360 lt!31764))))

(declare-fun lt!31768 () Unit!1898)

(assert (=> b!21967 (= lt!31768 lt!31802)))

(assert (=> b!21967 (= (size!652 (buf!967 (_2!1360 lt!31764))) (size!652 (buf!967 (_2!1360 lt!31392))))))

(declare-fun lt!31769 () Unit!1898)

(declare-fun Unit!1907 () Unit!1898)

(assert (=> b!21967 (= lt!31769 Unit!1907)))

(assert (=> b!21967 (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31764))) (currentByte!2268 (_2!1360 lt!31764)) (currentBit!2263 (_2!1360 lt!31764))) (bvsub (bvadd (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31783 () Unit!1898)

(declare-fun Unit!1908 () Unit!1898)

(assert (=> b!21967 (= lt!31783 Unit!1908)))

(assert (=> b!21967 (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31764))) (currentByte!2268 (_2!1360 lt!31764)) (currentBit!2263 (_2!1360 lt!31764))) (bvsub (bvsub (bvadd (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31790))) (currentByte!2268 (_2!1360 lt!31790)) (currentBit!2263 (_2!1360 lt!31790))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31796 () Unit!1898)

(declare-fun Unit!1909 () Unit!1898)

(assert (=> b!21967 (= lt!31796 Unit!1909)))

(declare-fun lt!31782 () tuple2!2552)

(assert (=> b!21967 (= lt!31782 (reader!0 (_2!1360 lt!31392) (_2!1360 lt!31764)))))

(declare-fun lt!31799 () (_ BitVec 64))

(assert (=> b!21967 (= lt!31799 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31786 () Unit!1898)

(assert (=> b!21967 (= lt!31786 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1360 lt!31392) (buf!967 (_2!1360 lt!31764)) lt!31799))))

(assert (=> b!21967 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31764)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) lt!31799)))

(declare-fun lt!31773 () Unit!1898)

(assert (=> b!21967 (= lt!31773 lt!31786)))

(declare-fun lt!31763 () tuple2!2552)

(declare-fun call!314 () tuple2!2552)

(assert (=> b!21967 (= lt!31763 call!314)))

(declare-fun lt!31795 () (_ BitVec 64))

(assert (=> b!21967 (= lt!31795 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31777 () Unit!1898)

(assert (=> b!21967 (= lt!31777 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1360 lt!31790) (buf!967 (_2!1360 lt!31764)) lt!31795))))

(assert (=> b!21967 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31764)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31790))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31790))) lt!31795)))

(declare-fun lt!31793 () Unit!1898)

(assert (=> b!21967 (= lt!31793 lt!31777)))

(declare-fun lt!31788 () List!270)

(assert (=> b!21967 (= lt!31788 (byteArrayBitContentToList!0 (_2!1360 lt!31764) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31794 () List!270)

(assert (=> b!21967 (= lt!31794 (byteArrayBitContentToList!0 (_2!1360 lt!31764) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31778 () List!270)

(assert (=> b!21967 (= lt!31778 (bitStreamReadBitsIntoList!0 (_2!1360 lt!31764) (_1!1361 lt!31782) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31781 () List!270)

(assert (=> b!21967 (= lt!31781 (bitStreamReadBitsIntoList!0 (_2!1360 lt!31764) (_1!1361 lt!31763) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31762 () (_ BitVec 64))

(assert (=> b!21967 (= lt!31762 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31776 () Unit!1898)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1138 BitStream!1138 BitStream!1138 BitStream!1138 (_ BitVec 64) List!270) Unit!1898)

(assert (=> b!21967 (= lt!31776 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1360 lt!31764) (_2!1360 lt!31764) (_1!1361 lt!31782) (_1!1361 lt!31763) lt!31762 lt!31778))))

(declare-fun tail!81 (List!270) List!270)

(assert (=> b!21967 (= (bitStreamReadBitsIntoList!0 (_2!1360 lt!31764) (_1!1361 lt!31763) (bvsub lt!31762 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!81 lt!31778))))

(declare-fun lt!31787 () Unit!1898)

(assert (=> b!21967 (= lt!31787 lt!31776)))

(declare-fun lt!31779 () (_ BitVec 64))

(declare-fun lt!31804 () Unit!1898)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1529 array!1529 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1898)

(assert (=> b!21967 (= lt!31804 (arrayBitRangesEqImpliesEq!0 (buf!967 (_2!1360 lt!31790)) (buf!967 (_2!1360 lt!31764)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!31779 (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31790))) (currentByte!2268 (_2!1360 lt!31790)) (currentBit!2263 (_2!1360 lt!31790)))))))

(declare-fun bitAt!0 (array!1529 (_ BitVec 64)) Bool)

(assert (=> b!21967 (= (bitAt!0 (buf!967 (_2!1360 lt!31790)) lt!31779) (bitAt!0 (buf!967 (_2!1360 lt!31764)) lt!31779))))

(declare-fun lt!31800 () Unit!1898)

(assert (=> b!21967 (= lt!31800 lt!31804)))

(declare-fun b!21968 () Bool)

(declare-fun res!18942 () Bool)

(assert (=> b!21968 (=> (not res!18942) (not e!14878))))

(assert (=> b!21968 (= res!18942 (isPrefixOf!0 (_2!1360 lt!31392) (_2!1360 lt!31797)))))

(declare-fun d!6976 () Bool)

(assert (=> d!6976 e!14878))

(declare-fun res!18943 () Bool)

(assert (=> d!6976 (=> (not res!18943) (not e!14878))))

(declare-fun lt!31772 () (_ BitVec 64))

(assert (=> d!6976 (= res!18943 (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31797))) (currentByte!2268 (_2!1360 lt!31797)) (currentBit!2263 (_2!1360 lt!31797))) (bvsub lt!31772 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6976 (or (= (bvand lt!31772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31772 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31780 () (_ BitVec 64))

(assert (=> d!6976 (= lt!31772 (bvadd lt!31780 to!314))))

(assert (=> d!6976 (or (not (= (bvand lt!31780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!31780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!31780 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6976 (= lt!31780 (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392))))))

(assert (=> d!6976 (= lt!31797 e!14880)))

(declare-fun c!1576 () Bool)

(assert (=> d!6976 (= c!1576 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!31798 () Unit!1898)

(declare-fun lt!31775 () Unit!1898)

(assert (=> d!6976 (= lt!31798 lt!31775)))

(assert (=> d!6976 (isPrefixOf!0 (_2!1360 lt!31392) (_2!1360 lt!31392))))

(assert (=> d!6976 (= lt!31775 (lemmaIsPrefixRefl!0 (_2!1360 lt!31392)))))

(assert (=> d!6976 (= lt!31779 (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392))))))

(assert (=> d!6976 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6976 (= (appendBitsMSBFirstLoop!0 (_2!1360 lt!31392) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!31797)))

(declare-fun lt!31770 () tuple2!2552)

(declare-fun b!21969 () Bool)

(assert (=> b!21969 (= e!14878 (= (bitStreamReadBitsIntoList!0 (_2!1360 lt!31797) (_1!1361 lt!31770) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1360 lt!31797) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!21969 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21969 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31791 () Unit!1898)

(declare-fun lt!31792 () Unit!1898)

(assert (=> b!21969 (= lt!31791 lt!31792)))

(assert (=> b!21969 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31797)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) lt!31785)))

(assert (=> b!21969 (= lt!31792 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1360 lt!31392) (buf!967 (_2!1360 lt!31797)) lt!31785))))

(assert (=> b!21969 e!14879))

(declare-fun res!18938 () Bool)

(assert (=> b!21969 (=> (not res!18938) (not e!14879))))

(assert (=> b!21969 (= res!18938 (and (= (size!652 (buf!967 (_2!1360 lt!31392))) (size!652 (buf!967 (_2!1360 lt!31797)))) (bvsge lt!31785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21969 (= lt!31785 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!21969 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21969 (= lt!31770 (reader!0 (_2!1360 lt!31392) (_2!1360 lt!31797)))))

(declare-fun b!21970 () Bool)

(declare-fun Unit!1910 () Unit!1898)

(assert (=> b!21970 (= e!14880 (tuple2!2551 Unit!1910 (_2!1360 lt!31392)))))

(assert (=> b!21970 (= (size!652 (buf!967 (_2!1360 lt!31392))) (size!652 (buf!967 (_2!1360 lt!31392))))))

(declare-fun lt!31765 () Unit!1898)

(declare-fun Unit!1911 () Unit!1898)

(assert (=> b!21970 (= lt!31765 Unit!1911)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1138 array!1529 array!1529 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2566 0))(
  ( (tuple2!2567 (_1!1368 array!1529) (_2!1368 BitStream!1138)) )
))
(declare-fun readBits!0 (BitStream!1138 (_ BitVec 64)) tuple2!2566)

(assert (=> b!21970 (checkByteArrayBitContent!0 (_2!1360 lt!31392) srcBuffer!2 (_1!1368 (readBits!0 (_1!1361 call!314) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!21971 () Bool)

(declare-fun res!18940 () Bool)

(assert (=> b!21971 (=> (not res!18940) (not e!14878))))

(assert (=> b!21971 (= res!18940 (invariant!0 (currentBit!2263 (_2!1360 lt!31797)) (currentByte!2268 (_2!1360 lt!31797)) (size!652 (buf!967 (_2!1360 lt!31797)))))))

(declare-fun bm!311 () Bool)

(assert (=> bm!311 (= call!314 (reader!0 (ite c!1576 (_2!1360 lt!31790) (_2!1360 lt!31392)) (ite c!1576 (_2!1360 lt!31764) (_2!1360 lt!31392))))))

(assert (= (and d!6976 c!1576) b!21967))

(assert (= (and d!6976 (not c!1576)) b!21970))

(assert (= (or b!21967 b!21970) bm!311))

(assert (= (and d!6976 res!18943) b!21971))

(assert (= (and b!21971 res!18940) b!21965))

(assert (= (and b!21965 res!18941) b!21968))

(assert (= (and b!21968 res!18942) b!21964))

(assert (= (and b!21964 res!18939) b!21969))

(assert (= (and b!21969 res!18938) b!21966))

(declare-fun m!30405 () Bool)

(assert (=> b!21968 m!30405))

(declare-fun m!30407 () Bool)

(assert (=> b!21971 m!30407))

(declare-fun m!30409 () Bool)

(assert (=> b!21966 m!30409))

(declare-fun m!30411 () Bool)

(assert (=> d!6976 m!30411))

(assert (=> d!6976 m!30309))

(assert (=> d!6976 m!30317))

(assert (=> d!6976 m!30319))

(declare-fun m!30413 () Bool)

(assert (=> bm!311 m!30413))

(declare-fun m!30415 () Bool)

(assert (=> b!21967 m!30415))

(declare-fun m!30417 () Bool)

(assert (=> b!21967 m!30417))

(declare-fun m!30419 () Bool)

(assert (=> b!21967 m!30419))

(declare-fun m!30421 () Bool)

(assert (=> b!21967 m!30421))

(declare-fun m!30423 () Bool)

(assert (=> b!21967 m!30423))

(declare-fun m!30425 () Bool)

(assert (=> b!21967 m!30425))

(declare-fun m!30427 () Bool)

(assert (=> b!21967 m!30427))

(declare-fun m!30429 () Bool)

(assert (=> b!21967 m!30429))

(declare-fun m!30431 () Bool)

(assert (=> b!21967 m!30431))

(declare-fun m!30433 () Bool)

(assert (=> b!21967 m!30433))

(declare-fun m!30435 () Bool)

(assert (=> b!21967 m!30435))

(declare-fun m!30437 () Bool)

(assert (=> b!21967 m!30437))

(declare-fun m!30439 () Bool)

(assert (=> b!21967 m!30439))

(declare-fun m!30441 () Bool)

(assert (=> b!21967 m!30441))

(declare-fun m!30443 () Bool)

(assert (=> b!21967 m!30443))

(declare-fun m!30445 () Bool)

(assert (=> b!21967 m!30445))

(declare-fun m!30447 () Bool)

(assert (=> b!21967 m!30447))

(declare-fun m!30449 () Bool)

(assert (=> b!21967 m!30449))

(declare-fun m!30451 () Bool)

(assert (=> b!21967 m!30451))

(declare-fun m!30453 () Bool)

(assert (=> b!21967 m!30453))

(declare-fun m!30455 () Bool)

(assert (=> b!21967 m!30455))

(declare-fun m!30457 () Bool)

(assert (=> b!21967 m!30457))

(declare-fun m!30459 () Bool)

(assert (=> b!21967 m!30459))

(assert (=> b!21967 m!30429))

(declare-fun m!30461 () Bool)

(assert (=> b!21967 m!30461))

(declare-fun m!30463 () Bool)

(assert (=> b!21967 m!30463))

(declare-fun m!30465 () Bool)

(assert (=> b!21967 m!30465))

(declare-fun m!30467 () Bool)

(assert (=> b!21967 m!30467))

(assert (=> b!21967 m!30465))

(declare-fun m!30469 () Bool)

(assert (=> b!21967 m!30469))

(assert (=> b!21967 m!30309))

(declare-fun m!30471 () Bool)

(assert (=> b!21967 m!30471))

(assert (=> b!21967 m!30415))

(declare-fun m!30473 () Bool)

(assert (=> b!21967 m!30473))

(assert (=> b!21967 m!30463))

(declare-fun m!30475 () Bool)

(assert (=> b!21967 m!30475))

(declare-fun m!30477 () Bool)

(assert (=> b!21969 m!30477))

(declare-fun m!30479 () Bool)

(assert (=> b!21969 m!30479))

(declare-fun m!30481 () Bool)

(assert (=> b!21969 m!30481))

(declare-fun m!30483 () Bool)

(assert (=> b!21969 m!30483))

(declare-fun m!30485 () Bool)

(assert (=> b!21969 m!30485))

(declare-fun m!30487 () Bool)

(assert (=> b!21970 m!30487))

(declare-fun m!30489 () Bool)

(assert (=> b!21970 m!30489))

(assert (=> b!21733 d!6976))

(declare-fun d!7000 () Bool)

(assert (=> d!7000 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31863 () Unit!1898)

(declare-fun choose!9 (BitStream!1138 array!1529 (_ BitVec 64) BitStream!1138) Unit!1898)

(assert (=> d!7000 (= lt!31863 (choose!9 thiss!1379 (buf!967 (_2!1360 lt!31392)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1139 (buf!967 (_2!1360 lt!31392)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379))))))

(assert (=> d!7000 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!967 (_2!1360 lt!31392)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31863)))

(declare-fun bs!2042 () Bool)

(assert (= bs!2042 d!7000))

(assert (=> bs!2042 m!30127))

(declare-fun m!30491 () Bool)

(assert (=> bs!2042 m!30491))

(assert (=> b!21733 d!7000))

(declare-fun d!7002 () Bool)

(declare-fun res!18946 () Bool)

(declare-fun e!14883 () Bool)

(assert (=> d!7002 (=> (not res!18946) (not e!14883))))

(assert (=> d!7002 (= res!18946 (= (size!652 (buf!967 (_2!1360 lt!31392))) (size!652 (buf!967 (_2!1360 lt!31389)))))))

(assert (=> d!7002 (= (isPrefixOf!0 (_2!1360 lt!31392) (_2!1360 lt!31389)) e!14883)))

(declare-fun b!21976 () Bool)

(declare-fun res!18944 () Bool)

(assert (=> b!21976 (=> (not res!18944) (not e!14883))))

(assert (=> b!21976 (= res!18944 (bvsle (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392))) (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31389))) (currentByte!2268 (_2!1360 lt!31389)) (currentBit!2263 (_2!1360 lt!31389)))))))

(declare-fun b!21977 () Bool)

(declare-fun e!14884 () Bool)

(assert (=> b!21977 (= e!14883 e!14884)))

(declare-fun res!18945 () Bool)

(assert (=> b!21977 (=> res!18945 e!14884)))

(assert (=> b!21977 (= res!18945 (= (size!652 (buf!967 (_2!1360 lt!31392))) #b00000000000000000000000000000000))))

(declare-fun b!21978 () Bool)

(assert (=> b!21978 (= e!14884 (arrayBitRangesEq!0 (buf!967 (_2!1360 lt!31392)) (buf!967 (_2!1360 lt!31389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392)))))))

(assert (= (and d!7002 res!18946) b!21976))

(assert (= (and b!21976 res!18944) b!21977))

(assert (= (and b!21977 (not res!18945)) b!21978))

(assert (=> b!21976 m!30309))

(assert (=> b!21976 m!30115))

(assert (=> b!21978 m!30309))

(assert (=> b!21978 m!30309))

(declare-fun m!30493 () Bool)

(assert (=> b!21978 m!30493))

(assert (=> b!21733 d!7002))

(declare-fun d!7004 () Bool)

(assert (=> d!7004 (isPrefixOf!0 thiss!1379 (_2!1360 lt!31389))))

(declare-fun lt!31886 () Unit!1898)

(declare-fun choose!30 (BitStream!1138 BitStream!1138 BitStream!1138) Unit!1898)

(assert (=> d!7004 (= lt!31886 (choose!30 thiss!1379 (_2!1360 lt!31392) (_2!1360 lt!31389)))))

(assert (=> d!7004 (isPrefixOf!0 thiss!1379 (_2!1360 lt!31392))))

(assert (=> d!7004 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1360 lt!31392) (_2!1360 lt!31389)) lt!31886)))

(declare-fun bs!2043 () Bool)

(assert (= bs!2043 d!7004))

(assert (=> bs!2043 m!30129))

(declare-fun m!30495 () Bool)

(assert (=> bs!2043 m!30495))

(assert (=> bs!2043 m!30135))

(assert (=> b!21733 d!7004))

(declare-fun d!7006 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2044 () Bool)

(assert (= bs!2044 d!7006))

(declare-fun m!30497 () Bool)

(assert (=> bs!2044 m!30497))

(assert (=> b!21733 d!7006))

(declare-fun d!7008 () Bool)

(declare-fun res!18961 () Bool)

(declare-fun e!14889 () Bool)

(assert (=> d!7008 (=> (not res!18961) (not e!14889))))

(assert (=> d!7008 (= res!18961 (= (size!652 (buf!967 thiss!1379)) (size!652 (buf!967 thiss!1379))))))

(assert (=> d!7008 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14889)))

(declare-fun b!21991 () Bool)

(declare-fun res!18959 () Bool)

(assert (=> b!21991 (=> (not res!18959) (not e!14889))))

(assert (=> b!21991 (= res!18959 (bvsle (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)) (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379))))))

(declare-fun b!21992 () Bool)

(declare-fun e!14890 () Bool)

(assert (=> b!21992 (= e!14889 e!14890)))

(declare-fun res!18960 () Bool)

(assert (=> b!21992 (=> res!18960 e!14890)))

(assert (=> b!21992 (= res!18960 (= (size!652 (buf!967 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21993 () Bool)

(assert (=> b!21993 (= e!14890 (arrayBitRangesEq!0 (buf!967 thiss!1379) (buf!967 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379))))))

(assert (= (and d!7008 res!18961) b!21991))

(assert (= (and b!21991 res!18959) b!21992))

(assert (= (and b!21992 (not res!18960)) b!21993))

(assert (=> b!21991 m!30149))

(assert (=> b!21991 m!30149))

(assert (=> b!21993 m!30149))

(assert (=> b!21993 m!30149))

(declare-fun m!30499 () Bool)

(assert (=> b!21993 m!30499))

(assert (=> b!21738 d!7008))

(declare-fun d!7010 () Bool)

(assert (=> d!7010 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31901 () Unit!1898)

(declare-fun choose!11 (BitStream!1138) Unit!1898)

(assert (=> d!7010 (= lt!31901 (choose!11 thiss!1379))))

(assert (=> d!7010 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!31901)))

(declare-fun bs!2046 () Bool)

(assert (= bs!2046 d!7010))

(assert (=> bs!2046 m!30145))

(declare-fun m!30501 () Bool)

(assert (=> bs!2046 m!30501))

(assert (=> b!21738 d!7010))

(declare-fun d!7012 () Bool)

(declare-fun e!14896 () Bool)

(assert (=> d!7012 e!14896))

(declare-fun res!18973 () Bool)

(assert (=> d!7012 (=> (not res!18973) (not e!14896))))

(declare-fun lt!31962 () (_ BitVec 64))

(declare-fun lt!31960 () (_ BitVec 64))

(declare-fun lt!31958 () (_ BitVec 64))

(assert (=> d!7012 (= res!18973 (= lt!31962 (bvsub lt!31958 lt!31960)))))

(assert (=> d!7012 (or (= (bvand lt!31958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31958 lt!31960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7012 (= lt!31960 (remainingBits!0 ((_ sign_extend 32) (size!652 (buf!967 thiss!1379))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379))))))

(declare-fun lt!31961 () (_ BitVec 64))

(declare-fun lt!31963 () (_ BitVec 64))

(assert (=> d!7012 (= lt!31958 (bvmul lt!31961 lt!31963))))

(assert (=> d!7012 (or (= lt!31961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!31963 (bvsdiv (bvmul lt!31961 lt!31963) lt!31961)))))

(assert (=> d!7012 (= lt!31963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7012 (= lt!31961 ((_ sign_extend 32) (size!652 (buf!967 thiss!1379))))))

(assert (=> d!7012 (= lt!31962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2268 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2263 thiss!1379))))))

(assert (=> d!7012 (invariant!0 (currentBit!2263 thiss!1379) (currentByte!2268 thiss!1379) (size!652 (buf!967 thiss!1379)))))

(assert (=> d!7012 (= (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)) lt!31962)))

(declare-fun b!22006 () Bool)

(declare-fun res!18972 () Bool)

(assert (=> b!22006 (=> (not res!18972) (not e!14896))))

(assert (=> b!22006 (= res!18972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!31962))))

(declare-fun b!22007 () Bool)

(declare-fun lt!31959 () (_ BitVec 64))

(assert (=> b!22007 (= e!14896 (bvsle lt!31962 (bvmul lt!31959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22007 (or (= lt!31959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!31959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!31959)))))

(assert (=> b!22007 (= lt!31959 ((_ sign_extend 32) (size!652 (buf!967 thiss!1379))))))

(assert (= (and d!7012 res!18973) b!22006))

(assert (= (and b!22006 res!18972) b!22007))

(declare-fun m!30503 () Bool)

(assert (=> d!7012 m!30503))

(assert (=> d!7012 m!30133))

(assert (=> b!21738 d!7012))

(declare-fun d!7014 () Bool)

(declare-fun res!18976 () Bool)

(declare-fun e!14897 () Bool)

(assert (=> d!7014 (=> (not res!18976) (not e!14897))))

(assert (=> d!7014 (= res!18976 (= (size!652 (buf!967 thiss!1379)) (size!652 (buf!967 (_2!1360 lt!31392)))))))

(assert (=> d!7014 (= (isPrefixOf!0 thiss!1379 (_2!1360 lt!31392)) e!14897)))

(declare-fun b!22008 () Bool)

(declare-fun res!18974 () Bool)

(assert (=> b!22008 (=> (not res!18974) (not e!14897))))

(assert (=> b!22008 (= res!18974 (bvsle (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)) (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31392))) (currentByte!2268 (_2!1360 lt!31392)) (currentBit!2263 (_2!1360 lt!31392)))))))

(declare-fun b!22009 () Bool)

(declare-fun e!14898 () Bool)

(assert (=> b!22009 (= e!14897 e!14898)))

(declare-fun res!18975 () Bool)

(assert (=> b!22009 (=> res!18975 e!14898)))

(assert (=> b!22009 (= res!18975 (= (size!652 (buf!967 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22010 () Bool)

(assert (=> b!22010 (= e!14898 (arrayBitRangesEq!0 (buf!967 thiss!1379) (buf!967 (_2!1360 lt!31392)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379))))))

(assert (= (and d!7014 res!18976) b!22008))

(assert (= (and b!22008 res!18974) b!22009))

(assert (= (and b!22009 (not res!18975)) b!22010))

(assert (=> b!22008 m!30149))

(assert (=> b!22008 m!30309))

(assert (=> b!22010 m!30149))

(assert (=> b!22010 m!30149))

(declare-fun m!30505 () Bool)

(assert (=> b!22010 m!30505))

(assert (=> b!21732 d!7014))

(declare-fun d!7016 () Bool)

(assert (=> d!7016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2047 () Bool)

(assert (= bs!2047 d!7016))

(declare-fun m!30507 () Bool)

(assert (=> bs!2047 m!30507))

(assert (=> b!21732 d!7016))

(declare-fun d!7018 () Bool)

(declare-fun e!14903 () Bool)

(assert (=> d!7018 e!14903))

(declare-fun res!18982 () Bool)

(assert (=> d!7018 (=> (not res!18982) (not e!14903))))

(assert (=> d!7018 (= res!18982 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!31966 () Unit!1898)

(declare-fun choose!27 (BitStream!1138 BitStream!1138 (_ BitVec 64) (_ BitVec 64)) Unit!1898)

(assert (=> d!7018 (= lt!31966 (choose!27 thiss!1379 (_2!1360 lt!31392) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7018 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7018 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1360 lt!31392) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31966)))

(declare-fun b!22016 () Bool)

(assert (=> b!22016 (= e!14903 (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31392)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31392))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31392))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7018 res!18982) b!22016))

(declare-fun m!30597 () Bool)

(assert (=> d!7018 m!30597))

(assert (=> b!22016 m!30141))

(assert (=> b!21732 d!7018))

(declare-fun b!22052 () Bool)

(declare-fun e!14924 () Bool)

(declare-fun e!14923 () Bool)

(assert (=> b!22052 (= e!14924 e!14923)))

(declare-fun res!19020 () Bool)

(assert (=> b!22052 (=> (not res!19020) (not e!14923))))

(declare-fun lt!32021 () tuple2!2550)

(declare-datatypes ((tuple2!2570 0))(
  ( (tuple2!2571 (_1!1370 BitStream!1138) (_2!1370 Bool)) )
))
(declare-fun lt!32015 () tuple2!2570)

(declare-fun lt!32025 () Bool)

(assert (=> b!22052 (= res!19020 (and (= (_2!1370 lt!32015) lt!32025) (= (_1!1370 lt!32015) (_2!1360 lt!32021))))))

(declare-fun readBitPure!0 (BitStream!1138) tuple2!2570)

(declare-fun readerFrom!0 (BitStream!1138 (_ BitVec 32) (_ BitVec 32)) BitStream!1138)

(assert (=> b!22052 (= lt!32015 (readBitPure!0 (readerFrom!0 (_2!1360 lt!32021) (currentBit!2263 thiss!1379) (currentByte!2268 thiss!1379))))))

(declare-fun b!22053 () Bool)

(declare-fun e!14921 () Bool)

(declare-fun e!14922 () Bool)

(assert (=> b!22053 (= e!14921 e!14922)))

(declare-fun res!19018 () Bool)

(assert (=> b!22053 (=> (not res!19018) (not e!14922))))

(declare-fun lt!32023 () tuple2!2550)

(declare-fun lt!32024 () (_ BitVec 8))

(declare-fun lt!32018 () tuple2!2570)

(assert (=> b!22053 (= res!19018 (and (= (_2!1370 lt!32018) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1102 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!32024)) #b00000000000000000000000000000000))) (= (_1!1370 lt!32018) (_2!1360 lt!32023))))))

(declare-fun lt!32017 () tuple2!2566)

(declare-fun lt!32026 () BitStream!1138)

(assert (=> b!22053 (= lt!32017 (readBits!0 lt!32026 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!22053 (= lt!32018 (readBitPure!0 lt!32026))))

(assert (=> b!22053 (= lt!32026 (readerFrom!0 (_2!1360 lt!32023) (currentBit!2263 thiss!1379) (currentByte!2268 thiss!1379)))))

(declare-fun b!22054 () Bool)

(declare-fun res!19022 () Bool)

(assert (=> b!22054 (=> (not res!19022) (not e!14921))))

(assert (=> b!22054 (= res!19022 (isPrefixOf!0 thiss!1379 (_2!1360 lt!32023)))))

(declare-fun b!22055 () Bool)

(declare-fun res!19019 () Bool)

(assert (=> b!22055 (=> (not res!19019) (not e!14921))))

(declare-fun lt!32016 () (_ BitVec 64))

(declare-fun lt!32014 () (_ BitVec 64))

(assert (=> b!22055 (= res!19019 (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!32023))) (currentByte!2268 (_2!1360 lt!32023)) (currentBit!2263 (_2!1360 lt!32023))) (bvadd lt!32016 lt!32014)))))

(assert (=> b!22055 (or (not (= (bvand lt!32016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32014 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!32016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!32016 lt!32014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22055 (= lt!32014 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22055 (= lt!32016 (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)))))

(declare-fun b!22056 () Bool)

(declare-fun res!19017 () Bool)

(assert (=> b!22056 (=> (not res!19017) (not e!14924))))

(assert (=> b!22056 (= res!19017 (isPrefixOf!0 thiss!1379 (_2!1360 lt!32021)))))

(declare-fun b!22058 () Bool)

(assert (=> b!22058 (= e!14923 (= (bitIndex!0 (size!652 (buf!967 (_1!1370 lt!32015))) (currentByte!2268 (_1!1370 lt!32015)) (currentBit!2263 (_1!1370 lt!32015))) (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!32021))) (currentByte!2268 (_2!1360 lt!32021)) (currentBit!2263 (_2!1360 lt!32021)))))))

(declare-fun b!22059 () Bool)

(assert (=> b!22059 (= e!14922 (= (bitIndex!0 (size!652 (buf!967 (_1!1370 lt!32018))) (currentByte!2268 (_1!1370 lt!32018)) (currentBit!2263 (_1!1370 lt!32018))) (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!32023))) (currentByte!2268 (_2!1360 lt!32023)) (currentBit!2263 (_2!1360 lt!32023)))))))

(declare-fun d!7026 () Bool)

(assert (=> d!7026 e!14921))

(declare-fun res!19023 () Bool)

(assert (=> d!7026 (=> (not res!19023) (not e!14921))))

(assert (=> d!7026 (= res!19023 (= (size!652 (buf!967 (_2!1360 lt!32023))) (size!652 (buf!967 thiss!1379))))))

(declare-fun lt!32027 () array!1529)

(assert (=> d!7026 (= lt!32024 (select (arr!1102 lt!32027) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7026 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!652 lt!32027)))))

(assert (=> d!7026 (= lt!32027 (array!1530 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!32022 () tuple2!2550)

(assert (=> d!7026 (= lt!32023 (tuple2!2551 (_1!1360 lt!32022) (_2!1360 lt!32022)))))

(assert (=> d!7026 (= lt!32022 lt!32021)))

(assert (=> d!7026 e!14924))

(declare-fun res!19016 () Bool)

(assert (=> d!7026 (=> (not res!19016) (not e!14924))))

(assert (=> d!7026 (= res!19016 (= (size!652 (buf!967 thiss!1379)) (size!652 (buf!967 (_2!1360 lt!32021)))))))

(declare-fun appendBit!0 (BitStream!1138 Bool) tuple2!2550)

(assert (=> d!7026 (= lt!32021 (appendBit!0 thiss!1379 lt!32025))))

(assert (=> d!7026 (= lt!32025 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1102 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7026 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7026 (= (appendBitFromByte!0 thiss!1379 (select (arr!1102 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!32023)))

(declare-fun b!22057 () Bool)

(declare-fun res!19021 () Bool)

(assert (=> b!22057 (=> (not res!19021) (not e!14924))))

(assert (=> b!22057 (= res!19021 (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!32021))) (currentByte!2268 (_2!1360 lt!32021)) (currentBit!2263 (_2!1360 lt!32021))) (bvadd (bitIndex!0 (size!652 (buf!967 thiss!1379)) (currentByte!2268 thiss!1379) (currentBit!2263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7026 res!19016) b!22057))

(assert (= (and b!22057 res!19021) b!22056))

(assert (= (and b!22056 res!19017) b!22052))

(assert (= (and b!22052 res!19020) b!22058))

(assert (= (and d!7026 res!19023) b!22055))

(assert (= (and b!22055 res!19019) b!22054))

(assert (= (and b!22054 res!19022) b!22053))

(assert (= (and b!22053 res!19018) b!22059))

(declare-fun m!30603 () Bool)

(assert (=> b!22052 m!30603))

(assert (=> b!22052 m!30603))

(declare-fun m!30605 () Bool)

(assert (=> b!22052 m!30605))

(declare-fun m!30607 () Bool)

(assert (=> b!22055 m!30607))

(assert (=> b!22055 m!30149))

(declare-fun m!30609 () Bool)

(assert (=> b!22059 m!30609))

(assert (=> b!22059 m!30607))

(declare-fun m!30611 () Bool)

(assert (=> b!22054 m!30611))

(declare-fun m!30613 () Bool)

(assert (=> b!22058 m!30613))

(declare-fun m!30615 () Bool)

(assert (=> b!22058 m!30615))

(declare-fun m!30617 () Bool)

(assert (=> b!22053 m!30617))

(declare-fun m!30619 () Bool)

(assert (=> b!22053 m!30619))

(declare-fun m!30621 () Bool)

(assert (=> b!22053 m!30621))

(declare-fun m!30623 () Bool)

(assert (=> d!7026 m!30623))

(declare-fun m!30625 () Bool)

(assert (=> d!7026 m!30625))

(assert (=> d!7026 m!30261))

(assert (=> b!22057 m!30615))

(assert (=> b!22057 m!30149))

(declare-fun m!30627 () Bool)

(assert (=> b!22056 m!30627))

(assert (=> b!21732 d!7026))

(declare-fun d!7032 () Bool)

(assert (=> d!7032 (= (array_inv!622 (buf!967 thiss!1379)) (bvsge (size!652 (buf!967 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!21737 d!7032))

(declare-fun d!7034 () Bool)

(declare-fun e!14927 () Bool)

(assert (=> d!7034 e!14927))

(declare-fun res!19027 () Bool)

(assert (=> d!7034 (=> (not res!19027) (not e!14927))))

(declare-fun lt!32030 () (_ BitVec 64))

(declare-fun lt!32032 () (_ BitVec 64))

(declare-fun lt!32034 () (_ BitVec 64))

(assert (=> d!7034 (= res!19027 (= lt!32034 (bvsub lt!32030 lt!32032)))))

(assert (=> d!7034 (or (= (bvand lt!32030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32030 lt!32032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7034 (= lt!32032 (remainingBits!0 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31389)))) ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31389))) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31389)))))))

(declare-fun lt!32033 () (_ BitVec 64))

(declare-fun lt!32035 () (_ BitVec 64))

(assert (=> d!7034 (= lt!32030 (bvmul lt!32033 lt!32035))))

(assert (=> d!7034 (or (= lt!32033 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!32035 (bvsdiv (bvmul lt!32033 lt!32035) lt!32033)))))

(assert (=> d!7034 (= lt!32035 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7034 (= lt!32033 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31389)))))))

(assert (=> d!7034 (= lt!32034 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2268 (_2!1360 lt!31389))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2263 (_2!1360 lt!31389)))))))

(assert (=> d!7034 (invariant!0 (currentBit!2263 (_2!1360 lt!31389)) (currentByte!2268 (_2!1360 lt!31389)) (size!652 (buf!967 (_2!1360 lt!31389))))))

(assert (=> d!7034 (= (bitIndex!0 (size!652 (buf!967 (_2!1360 lt!31389))) (currentByte!2268 (_2!1360 lt!31389)) (currentBit!2263 (_2!1360 lt!31389))) lt!32034)))

(declare-fun b!22062 () Bool)

(declare-fun res!19026 () Bool)

(assert (=> b!22062 (=> (not res!19026) (not e!14927))))

(assert (=> b!22062 (= res!19026 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32034))))

(declare-fun b!22063 () Bool)

(declare-fun lt!32031 () (_ BitVec 64))

(assert (=> b!22063 (= e!14927 (bvsle lt!32034 (bvmul lt!32031 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22063 (or (= lt!32031 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!32031 #b0000000000000000000000000000000000000000000000000000000000001000) lt!32031)))))

(assert (=> b!22063 (= lt!32031 ((_ sign_extend 32) (size!652 (buf!967 (_2!1360 lt!31389)))))))

(assert (= (and d!7034 res!19027) b!22062))

(assert (= (and b!22062 res!19026) b!22063))

(declare-fun m!30629 () Bool)

(assert (=> d!7034 m!30629))

(assert (=> d!7034 m!30105))

(assert (=> b!21731 d!7034))

(declare-fun d!7036 () Bool)

(assert (=> d!7036 (= (array_inv!622 srcBuffer!2) (bvsge (size!652 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5380 d!7036))

(declare-fun d!7038 () Bool)

(assert (=> d!7038 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2263 thiss!1379) (currentByte!2268 thiss!1379) (size!652 (buf!967 thiss!1379))))))

(declare-fun bs!2049 () Bool)

(assert (= bs!2049 d!7038))

(assert (=> bs!2049 m!30133))

(assert (=> start!5380 d!7038))

(declare-fun d!7040 () Bool)

(assert (=> d!7040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!652 (buf!967 thiss!1379))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!652 (buf!967 thiss!1379))) ((_ sign_extend 32) (currentByte!2268 thiss!1379)) ((_ sign_extend 32) (currentBit!2263 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2050 () Bool)

(assert (= bs!2050 d!7040))

(assert (=> bs!2050 m!30503))

(assert (=> b!21736 d!7040))

(declare-fun d!7042 () Bool)

(assert (=> d!7042 (= (invariant!0 (currentBit!2263 (_2!1360 lt!31389)) (currentByte!2268 (_2!1360 lt!31389)) (size!652 (buf!967 (_2!1360 lt!31389)))) (and (bvsge (currentBit!2263 (_2!1360 lt!31389)) #b00000000000000000000000000000000) (bvslt (currentBit!2263 (_2!1360 lt!31389)) #b00000000000000000000000000001000) (bvsge (currentByte!2268 (_2!1360 lt!31389)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2268 (_2!1360 lt!31389)) (size!652 (buf!967 (_2!1360 lt!31389)))) (and (= (currentBit!2263 (_2!1360 lt!31389)) #b00000000000000000000000000000000) (= (currentByte!2268 (_2!1360 lt!31389)) (size!652 (buf!967 (_2!1360 lt!31389))))))))))

(assert (=> b!21735 d!7042))

(declare-fun d!7044 () Bool)

(assert (=> d!7044 (= (invariant!0 (currentBit!2263 thiss!1379) (currentByte!2268 thiss!1379) (size!652 (buf!967 thiss!1379))) (and (bvsge (currentBit!2263 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2263 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2268 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2268 thiss!1379) (size!652 (buf!967 thiss!1379))) (and (= (currentBit!2263 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2268 thiss!1379) (size!652 (buf!967 thiss!1379)))))))))

(assert (=> b!21740 d!7044))

(push 1)

(assert (not b!21966))

(assert (not b!21971))

(assert (not d!7038))

(assert (not d!7010))

(assert (not b!21881))

(assert (not d!7018))

(assert (not b!21823))

(assert (not b!22008))

(assert (not b!21868))

(assert (not d!7000))

(assert (not b!21806))

(assert (not b!22054))

(assert (not b!22055))

(assert (not b!21991))

(assert (not b!21871))

(assert (not b!22010))

(assert (not d!6976))

(assert (not d!7006))

(assert (not bm!311))

(assert (not b!21869))

(assert (not b!22053))

(assert (not b!21870))

(assert (not b!22059))

(assert (not d!7034))

(assert (not b!22057))

(assert (not d!7016))

(assert (not b!21968))

(assert (not d!6940))

(assert (not d!7004))

(assert (not b!21969))

(assert (not b!22056))

(assert (not b!21822))

(assert (not b!21824))

(assert (not b!21967))

(assert (not d!7026))

(assert (not d!7012))

(assert (not b!21978))

(assert (not b!22052))

(assert (not b!21970))

(assert (not b!21993))

(assert (not d!7040))

(assert (not b!22016))

(assert (not b!21879))

(assert (not b!21976))

(assert (not b!22058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

