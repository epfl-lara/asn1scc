; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8950 () Bool)

(assert start!8950)

(declare-fun b!44391 () Bool)

(declare-fun e!29596 () Bool)

(declare-datatypes ((array!2241 0))(
  ( (array!2242 (arr!1521 (Array (_ BitVec 32) (_ BitVec 8))) (size!1010 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1764 0))(
  ( (BitStream!1765 (buf!1353 array!2241) (currentByte!2834 (_ BitVec 32)) (currentBit!2829 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1764)

(declare-fun array_inv!935 (array!2241) Bool)

(assert (=> b!44391 (= e!29596 (array_inv!935 (buf!1353 thiss!1379)))))

(declare-fun b!44392 () Bool)

(declare-fun res!37602 () Bool)

(declare-fun e!29603 () Bool)

(assert (=> b!44392 (=> res!37602 e!29603)))

(declare-datatypes ((Unit!3162 0))(
  ( (Unit!3163) )
))
(declare-datatypes ((tuple2!4350 0))(
  ( (tuple2!4351 (_1!2268 Unit!3162) (_2!2268 BitStream!1764)) )
))
(declare-fun lt!67769 () tuple2!4350)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!44392 (= res!37602 (not (invariant!0 (currentBit!2829 (_2!2268 lt!67769)) (currentByte!2834 (_2!2268 lt!67769)) (size!1010 (buf!1353 (_2!2268 lt!67769))))))))

(declare-fun b!44393 () Bool)

(declare-fun lt!67771 () tuple2!4350)

(assert (=> b!44393 (= e!29603 (= (size!1010 (buf!1353 (_2!2268 lt!67771))) (size!1010 (buf!1353 (_2!2268 lt!67769)))))))

(declare-fun e!29598 () Bool)

(assert (=> b!44393 e!29598))

(declare-fun res!37603 () Bool)

(assert (=> b!44393 (=> (not res!37603) (not e!29598))))

(assert (=> b!44393 (= res!37603 (= (size!1010 (buf!1353 (_2!2268 lt!67769))) (size!1010 (buf!1353 thiss!1379))))))

(declare-fun res!37600 () Bool)

(declare-fun e!29594 () Bool)

(assert (=> start!8950 (=> (not res!37600) (not e!29594))))

(declare-fun srcBuffer!2 () array!2241)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8950 (= res!37600 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1010 srcBuffer!2))))))))

(assert (=> start!8950 e!29594))

(assert (=> start!8950 true))

(assert (=> start!8950 (array_inv!935 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1764) Bool)

(assert (=> start!8950 (and (inv!12 thiss!1379) e!29596)))

(declare-fun b!44394 () Bool)

(declare-fun e!29597 () Bool)

(assert (=> b!44394 (= e!29594 (not e!29597))))

(declare-fun res!37598 () Bool)

(assert (=> b!44394 (=> res!37598 e!29597)))

(assert (=> b!44394 (= res!37598 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1764 BitStream!1764) Bool)

(assert (=> b!44394 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67764 () Unit!3162)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1764) Unit!3162)

(assert (=> b!44394 (= lt!67764 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!67770 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44394 (= lt!67770 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)))))

(declare-fun e!29595 () Bool)

(declare-datatypes ((tuple2!4352 0))(
  ( (tuple2!4353 (_1!2269 BitStream!1764) (_2!2269 BitStream!1764)) )
))
(declare-fun lt!67766 () tuple2!4352)

(declare-fun b!44395 () Bool)

(declare-datatypes ((List!523 0))(
  ( (Nil!520) (Cons!519 (h!638 Bool) (t!1273 List!523)) )
))
(declare-fun head!342 (List!523) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1764 array!2241 (_ BitVec 64) (_ BitVec 64)) List!523)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1764 BitStream!1764 (_ BitVec 64)) List!523)

(assert (=> b!44395 (= e!29595 (= (head!342 (byteArrayBitContentToList!0 (_2!2268 lt!67771) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!342 (bitStreamReadBitsIntoList!0 (_2!2268 lt!67771) (_1!2269 lt!67766) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44396 () Bool)

(declare-fun e!29601 () Bool)

(assert (=> b!44396 (= e!29597 e!29601)))

(declare-fun res!37604 () Bool)

(assert (=> b!44396 (=> res!37604 e!29601)))

(assert (=> b!44396 (= res!37604 (not (isPrefixOf!0 thiss!1379 (_2!2268 lt!67771))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44396 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67767 () Unit!3162)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1764 BitStream!1764 (_ BitVec 64) (_ BitVec 64)) Unit!3162)

(assert (=> b!44396 (= lt!67767 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2268 lt!67771) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1764 (_ BitVec 8) (_ BitVec 32)) tuple2!4350)

(assert (=> b!44396 (= lt!67771 (appendBitFromByte!0 thiss!1379 (select (arr!1521 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44397 () Bool)

(declare-fun res!37597 () Bool)

(assert (=> b!44397 (=> res!37597 e!29603)))

(assert (=> b!44397 (= res!37597 (not (= (size!1010 (buf!1353 thiss!1379)) (size!1010 (buf!1353 (_2!2268 lt!67769))))))))

(declare-fun b!44398 () Bool)

(declare-fun e!29599 () Bool)

(assert (=> b!44398 (= e!29601 e!29599)))

(declare-fun res!37601 () Bool)

(assert (=> b!44398 (=> res!37601 e!29599)))

(assert (=> b!44398 (= res!37601 (not (isPrefixOf!0 (_2!2268 lt!67771) (_2!2268 lt!67769))))))

(assert (=> b!44398 (isPrefixOf!0 thiss!1379 (_2!2268 lt!67769))))

(declare-fun lt!67763 () Unit!3162)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1764 BitStream!1764 BitStream!1764) Unit!3162)

(assert (=> b!44398 (= lt!67763 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2268 lt!67771) (_2!2268 lt!67769)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1764 array!2241 (_ BitVec 64) (_ BitVec 64)) tuple2!4350)

(assert (=> b!44398 (= lt!67769 (appendBitsMSBFirstLoop!0 (_2!2268 lt!67771) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!44398 e!29595))

(declare-fun res!37599 () Bool)

(assert (=> b!44398 (=> (not res!37599) (not e!29595))))

(assert (=> b!44398 (= res!37599 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67765 () Unit!3162)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1764 array!2241 (_ BitVec 64)) Unit!3162)

(assert (=> b!44398 (= lt!67765 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1353 (_2!2268 lt!67771)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1764 BitStream!1764) tuple2!4352)

(assert (=> b!44398 (= lt!67766 (reader!0 thiss!1379 (_2!2268 lt!67771)))))

(declare-fun b!44399 () Bool)

(assert (=> b!44399 (= e!29599 e!29603)))

(declare-fun res!37596 () Bool)

(assert (=> b!44399 (=> res!37596 e!29603)))

(declare-fun lt!67768 () (_ BitVec 64))

(assert (=> b!44399 (= res!37596 (not (= lt!67768 (bvsub (bvadd lt!67770 to!314) i!635))))))

(assert (=> b!44399 (= lt!67768 (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67769))) (currentByte!2834 (_2!2268 lt!67769)) (currentBit!2829 (_2!2268 lt!67769))))))

(declare-fun b!44400 () Bool)

(assert (=> b!44400 (= e!29598 (= lt!67768 (bvsub (bvsub (bvadd (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44401 () Bool)

(declare-fun res!37605 () Bool)

(assert (=> b!44401 (=> (not res!37605) (not e!29594))))

(assert (=> b!44401 (= res!37605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 thiss!1379))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8950 res!37600) b!44401))

(assert (= (and b!44401 res!37605) b!44394))

(assert (= (and b!44394 (not res!37598)) b!44396))

(assert (= (and b!44396 (not res!37604)) b!44398))

(assert (= (and b!44398 res!37599) b!44395))

(assert (= (and b!44398 (not res!37601)) b!44399))

(assert (= (and b!44399 (not res!37596)) b!44392))

(assert (= (and b!44392 (not res!37602)) b!44397))

(assert (= (and b!44397 (not res!37597)) b!44393))

(assert (= (and b!44393 res!37603) b!44400))

(assert (= start!8950 b!44391))

(declare-fun m!67703 () Bool)

(assert (=> b!44396 m!67703))

(declare-fun m!67705 () Bool)

(assert (=> b!44396 m!67705))

(declare-fun m!67707 () Bool)

(assert (=> b!44396 m!67707))

(declare-fun m!67709 () Bool)

(assert (=> b!44396 m!67709))

(assert (=> b!44396 m!67705))

(declare-fun m!67711 () Bool)

(assert (=> b!44396 m!67711))

(declare-fun m!67713 () Bool)

(assert (=> b!44392 m!67713))

(declare-fun m!67715 () Bool)

(assert (=> start!8950 m!67715))

(declare-fun m!67717 () Bool)

(assert (=> start!8950 m!67717))

(declare-fun m!67719 () Bool)

(assert (=> b!44395 m!67719))

(assert (=> b!44395 m!67719))

(declare-fun m!67721 () Bool)

(assert (=> b!44395 m!67721))

(declare-fun m!67723 () Bool)

(assert (=> b!44395 m!67723))

(assert (=> b!44395 m!67723))

(declare-fun m!67725 () Bool)

(assert (=> b!44395 m!67725))

(declare-fun m!67727 () Bool)

(assert (=> b!44394 m!67727))

(declare-fun m!67729 () Bool)

(assert (=> b!44394 m!67729))

(declare-fun m!67731 () Bool)

(assert (=> b!44394 m!67731))

(declare-fun m!67733 () Bool)

(assert (=> b!44398 m!67733))

(declare-fun m!67735 () Bool)

(assert (=> b!44398 m!67735))

(declare-fun m!67737 () Bool)

(assert (=> b!44398 m!67737))

(declare-fun m!67739 () Bool)

(assert (=> b!44398 m!67739))

(declare-fun m!67741 () Bool)

(assert (=> b!44398 m!67741))

(declare-fun m!67743 () Bool)

(assert (=> b!44398 m!67743))

(declare-fun m!67745 () Bool)

(assert (=> b!44398 m!67745))

(declare-fun m!67747 () Bool)

(assert (=> b!44391 m!67747))

(declare-fun m!67749 () Bool)

(assert (=> b!44399 m!67749))

(declare-fun m!67751 () Bool)

(assert (=> b!44401 m!67751))

(declare-fun m!67753 () Bool)

(assert (=> b!44400 m!67753))

(check-sat (not b!44400) (not b!44396) (not start!8950) (not b!44395) (not b!44391) (not b!44398) (not b!44394) (not b!44399) (not b!44392) (not b!44401))
(check-sat)
(get-model)

(declare-fun d!12898 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 thiss!1379))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1010 (buf!1353 thiss!1379))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3445 () Bool)

(assert (= bs!3445 d!12898))

(declare-fun m!67807 () Bool)

(assert (=> bs!3445 m!67807))

(assert (=> b!44401 d!12898))

(declare-fun d!12900 () Bool)

(declare-fun res!37644 () Bool)

(declare-fun e!29638 () Bool)

(assert (=> d!12900 (=> (not res!37644) (not e!29638))))

(assert (=> d!12900 (= res!37644 (= (size!1010 (buf!1353 thiss!1379)) (size!1010 (buf!1353 (_2!2268 lt!67771)))))))

(assert (=> d!12900 (= (isPrefixOf!0 thiss!1379 (_2!2268 lt!67771)) e!29638)))

(declare-fun b!44441 () Bool)

(declare-fun res!37643 () Bool)

(assert (=> b!44441 (=> (not res!37643) (not e!29638))))

(assert (=> b!44441 (= res!37643 (bvsle (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)) (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771)))))))

(declare-fun b!44442 () Bool)

(declare-fun e!29639 () Bool)

(assert (=> b!44442 (= e!29638 e!29639)))

(declare-fun res!37642 () Bool)

(assert (=> b!44442 (=> res!37642 e!29639)))

(assert (=> b!44442 (= res!37642 (= (size!1010 (buf!1353 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44443 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2241 array!2241 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44443 (= e!29639 (arrayBitRangesEq!0 (buf!1353 thiss!1379) (buf!1353 (_2!2268 lt!67771)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379))))))

(assert (= (and d!12900 res!37644) b!44441))

(assert (= (and b!44441 res!37643) b!44442))

(assert (= (and b!44442 (not res!37642)) b!44443))

(assert (=> b!44441 m!67731))

(assert (=> b!44441 m!67753))

(assert (=> b!44443 m!67731))

(assert (=> b!44443 m!67731))

(declare-fun m!67809 () Bool)

(assert (=> b!44443 m!67809))

(assert (=> b!44396 d!12900))

(declare-fun d!12902 () Bool)

(assert (=> d!12902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3446 () Bool)

(assert (= bs!3446 d!12902))

(declare-fun m!67811 () Bool)

(assert (=> bs!3446 m!67811))

(assert (=> b!44396 d!12902))

(declare-fun d!12904 () Bool)

(declare-fun e!29642 () Bool)

(assert (=> d!12904 e!29642))

(declare-fun res!37647 () Bool)

(assert (=> d!12904 (=> (not res!37647) (not e!29642))))

(assert (=> d!12904 (= res!37647 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!67801 () Unit!3162)

(declare-fun choose!27 (BitStream!1764 BitStream!1764 (_ BitVec 64) (_ BitVec 64)) Unit!3162)

(assert (=> d!12904 (= lt!67801 (choose!27 thiss!1379 (_2!2268 lt!67771) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12904 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12904 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2268 lt!67771) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67801)))

(declare-fun b!44446 () Bool)

(assert (=> b!44446 (= e!29642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12904 res!37647) b!44446))

(declare-fun m!67813 () Bool)

(assert (=> d!12904 m!67813))

(assert (=> b!44446 m!67707))

(assert (=> b!44396 d!12904))

(declare-fun b!44501 () Bool)

(declare-fun e!29675 () Bool)

(declare-datatypes ((tuple2!4358 0))(
  ( (tuple2!4359 (_1!2272 BitStream!1764) (_2!2272 Bool)) )
))
(declare-fun lt!67880 () tuple2!4358)

(declare-fun lt!67884 () tuple2!4350)

(assert (=> b!44501 (= e!29675 (= (bitIndex!0 (size!1010 (buf!1353 (_1!2272 lt!67880))) (currentByte!2834 (_1!2272 lt!67880)) (currentBit!2829 (_1!2272 lt!67880))) (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67884))) (currentByte!2834 (_2!2268 lt!67884)) (currentBit!2829 (_2!2268 lt!67884)))))))

(declare-fun d!12906 () Bool)

(declare-fun e!29673 () Bool)

(assert (=> d!12906 e!29673))

(declare-fun res!37708 () Bool)

(assert (=> d!12906 (=> (not res!37708) (not e!29673))))

(declare-fun lt!67887 () tuple2!4350)

(assert (=> d!12906 (= res!37708 (= (size!1010 (buf!1353 (_2!2268 lt!67887))) (size!1010 (buf!1353 thiss!1379))))))

(declare-fun lt!67883 () (_ BitVec 8))

(declare-fun lt!67889 () array!2241)

(assert (=> d!12906 (= lt!67883 (select (arr!1521 lt!67889) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12906 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1010 lt!67889)))))

(assert (=> d!12906 (= lt!67889 (array!2242 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!67882 () tuple2!4350)

(assert (=> d!12906 (= lt!67887 (tuple2!4351 (_1!2268 lt!67882) (_2!2268 lt!67882)))))

(assert (=> d!12906 (= lt!67882 lt!67884)))

(declare-fun e!29674 () Bool)

(assert (=> d!12906 e!29674))

(declare-fun res!37703 () Bool)

(assert (=> d!12906 (=> (not res!37703) (not e!29674))))

(assert (=> d!12906 (= res!37703 (= (size!1010 (buf!1353 thiss!1379)) (size!1010 (buf!1353 (_2!2268 lt!67884)))))))

(declare-fun lt!67886 () Bool)

(declare-fun appendBit!0 (BitStream!1764 Bool) tuple2!4350)

(assert (=> d!12906 (= lt!67884 (appendBit!0 thiss!1379 lt!67886))))

(assert (=> d!12906 (= lt!67886 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1521 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12906 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12906 (= (appendBitFromByte!0 thiss!1379 (select (arr!1521 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!67887)))

(declare-fun b!44502 () Bool)

(declare-fun e!29676 () Bool)

(declare-fun lt!67891 () tuple2!4358)

(assert (=> b!44502 (= e!29676 (= (bitIndex!0 (size!1010 (buf!1353 (_1!2272 lt!67891))) (currentByte!2834 (_1!2272 lt!67891)) (currentBit!2829 (_1!2272 lt!67891))) (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67887))) (currentByte!2834 (_2!2268 lt!67887)) (currentBit!2829 (_2!2268 lt!67887)))))))

(declare-fun b!44503 () Bool)

(assert (=> b!44503 (= e!29673 e!29676)))

(declare-fun res!37704 () Bool)

(assert (=> b!44503 (=> (not res!37704) (not e!29676))))

(assert (=> b!44503 (= res!37704 (and (= (_2!2272 lt!67891) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1521 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!67883)) #b00000000000000000000000000000000))) (= (_1!2272 lt!67891) (_2!2268 lt!67887))))))

(declare-datatypes ((tuple2!4360 0))(
  ( (tuple2!4361 (_1!2273 array!2241) (_2!2273 BitStream!1764)) )
))
(declare-fun lt!67888 () tuple2!4360)

(declare-fun lt!67885 () BitStream!1764)

(declare-fun readBits!0 (BitStream!1764 (_ BitVec 64)) tuple2!4360)

(assert (=> b!44503 (= lt!67888 (readBits!0 lt!67885 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1764) tuple2!4358)

(assert (=> b!44503 (= lt!67891 (readBitPure!0 lt!67885))))

(declare-fun readerFrom!0 (BitStream!1764 (_ BitVec 32) (_ BitVec 32)) BitStream!1764)

(assert (=> b!44503 (= lt!67885 (readerFrom!0 (_2!2268 lt!67887) (currentBit!2829 thiss!1379) (currentByte!2834 thiss!1379)))))

(declare-fun b!44504 () Bool)

(declare-fun res!37702 () Bool)

(assert (=> b!44504 (=> (not res!37702) (not e!29674))))

(assert (=> b!44504 (= res!37702 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67884))) (currentByte!2834 (_2!2268 lt!67884)) (currentBit!2829 (_2!2268 lt!67884))) (bvadd (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44505 () Bool)

(declare-fun res!37705 () Bool)

(assert (=> b!44505 (=> (not res!37705) (not e!29673))))

(declare-fun lt!67890 () (_ BitVec 64))

(declare-fun lt!67881 () (_ BitVec 64))

(assert (=> b!44505 (= res!37705 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67887))) (currentByte!2834 (_2!2268 lt!67887)) (currentBit!2829 (_2!2268 lt!67887))) (bvadd lt!67890 lt!67881)))))

(assert (=> b!44505 (or (not (= (bvand lt!67890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67881 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67890 lt!67881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44505 (= lt!67881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44505 (= lt!67890 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)))))

(declare-fun b!44506 () Bool)

(assert (=> b!44506 (= e!29674 e!29675)))

(declare-fun res!37701 () Bool)

(assert (=> b!44506 (=> (not res!37701) (not e!29675))))

(assert (=> b!44506 (= res!37701 (and (= (_2!2272 lt!67880) lt!67886) (= (_1!2272 lt!67880) (_2!2268 lt!67884))))))

(assert (=> b!44506 (= lt!67880 (readBitPure!0 (readerFrom!0 (_2!2268 lt!67884) (currentBit!2829 thiss!1379) (currentByte!2834 thiss!1379))))))

(declare-fun b!44507 () Bool)

(declare-fun res!37707 () Bool)

(assert (=> b!44507 (=> (not res!37707) (not e!29674))))

(assert (=> b!44507 (= res!37707 (isPrefixOf!0 thiss!1379 (_2!2268 lt!67884)))))

(declare-fun b!44508 () Bool)

(declare-fun res!37706 () Bool)

(assert (=> b!44508 (=> (not res!37706) (not e!29673))))

(assert (=> b!44508 (= res!37706 (isPrefixOf!0 thiss!1379 (_2!2268 lt!67887)))))

(assert (= (and d!12906 res!37703) b!44504))

(assert (= (and b!44504 res!37702) b!44507))

(assert (= (and b!44507 res!37707) b!44506))

(assert (= (and b!44506 res!37701) b!44501))

(assert (= (and d!12906 res!37708) b!44505))

(assert (= (and b!44505 res!37705) b!44508))

(assert (= (and b!44508 res!37706) b!44503))

(assert (= (and b!44503 res!37704) b!44502))

(declare-fun m!67843 () Bool)

(assert (=> b!44502 m!67843))

(declare-fun m!67845 () Bool)

(assert (=> b!44502 m!67845))

(declare-fun m!67847 () Bool)

(assert (=> b!44508 m!67847))

(declare-fun m!67849 () Bool)

(assert (=> b!44506 m!67849))

(assert (=> b!44506 m!67849))

(declare-fun m!67851 () Bool)

(assert (=> b!44506 m!67851))

(declare-fun m!67853 () Bool)

(assert (=> b!44504 m!67853))

(assert (=> b!44504 m!67731))

(declare-fun m!67855 () Bool)

(assert (=> b!44501 m!67855))

(assert (=> b!44501 m!67853))

(declare-fun m!67857 () Bool)

(assert (=> b!44503 m!67857))

(declare-fun m!67859 () Bool)

(assert (=> b!44503 m!67859))

(declare-fun m!67861 () Bool)

(assert (=> b!44503 m!67861))

(declare-fun m!67863 () Bool)

(assert (=> d!12906 m!67863))

(declare-fun m!67865 () Bool)

(assert (=> d!12906 m!67865))

(declare-fun m!67867 () Bool)

(assert (=> d!12906 m!67867))

(declare-fun m!67869 () Bool)

(assert (=> b!44507 m!67869))

(assert (=> b!44505 m!67845))

(assert (=> b!44505 m!67731))

(assert (=> b!44396 d!12906))

(declare-fun d!12948 () Bool)

(assert (=> d!12948 (= (head!342 (byteArrayBitContentToList!0 (_2!2268 lt!67771) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!638 (byteArrayBitContentToList!0 (_2!2268 lt!67771) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44395 d!12948))

(declare-fun d!12954 () Bool)

(declare-fun c!2965 () Bool)

(assert (=> d!12954 (= c!2965 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29687 () List!523)

(assert (=> d!12954 (= (byteArrayBitContentToList!0 (_2!2268 lt!67771) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29687)))

(declare-fun b!44531 () Bool)

(assert (=> b!44531 (= e!29687 Nil!520)))

(declare-fun b!44532 () Bool)

(assert (=> b!44532 (= e!29687 (Cons!519 (not (= (bvand ((_ sign_extend 24) (select (arr!1521 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2268 lt!67771) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12954 c!2965) b!44531))

(assert (= (and d!12954 (not c!2965)) b!44532))

(assert (=> b!44532 m!67705))

(assert (=> b!44532 m!67867))

(declare-fun m!67873 () Bool)

(assert (=> b!44532 m!67873))

(assert (=> b!44395 d!12954))

(declare-fun d!12958 () Bool)

(assert (=> d!12958 (= (head!342 (bitStreamReadBitsIntoList!0 (_2!2268 lt!67771) (_1!2269 lt!67766) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!638 (bitStreamReadBitsIntoList!0 (_2!2268 lt!67771) (_1!2269 lt!67766) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44395 d!12958))

(declare-fun b!44561 () Bool)

(declare-datatypes ((tuple2!4362 0))(
  ( (tuple2!4363 (_1!2274 Bool) (_2!2274 BitStream!1764)) )
))
(declare-fun lt!67986 () tuple2!4362)

(declare-fun lt!67985 () (_ BitVec 64))

(declare-datatypes ((tuple2!4364 0))(
  ( (tuple2!4365 (_1!2275 List!523) (_2!2275 BitStream!1764)) )
))
(declare-fun e!29701 () tuple2!4364)

(assert (=> b!44561 (= e!29701 (tuple2!4365 (Cons!519 (_1!2274 lt!67986) (bitStreamReadBitsIntoList!0 (_2!2268 lt!67771) (_2!2274 lt!67986) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!67985))) (_2!2274 lt!67986)))))

(declare-fun readBit!0 (BitStream!1764) tuple2!4362)

(assert (=> b!44561 (= lt!67986 (readBit!0 (_1!2269 lt!67766)))))

(assert (=> b!44561 (= lt!67985 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!44562 () Bool)

(declare-fun e!29702 () Bool)

(declare-fun lt!67987 () List!523)

(declare-fun isEmpty!125 (List!523) Bool)

(assert (=> b!44562 (= e!29702 (isEmpty!125 lt!67987))))

(declare-fun b!44563 () Bool)

(declare-fun length!223 (List!523) Int)

(assert (=> b!44563 (= e!29702 (> (length!223 lt!67987) 0))))

(declare-fun d!12962 () Bool)

(assert (=> d!12962 e!29702))

(declare-fun c!2979 () Bool)

(assert (=> d!12962 (= c!2979 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12962 (= lt!67987 (_1!2275 e!29701))))

(declare-fun c!2978 () Bool)

(assert (=> d!12962 (= c!2978 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12962 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12962 (= (bitStreamReadBitsIntoList!0 (_2!2268 lt!67771) (_1!2269 lt!67766) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67987)))

(declare-fun b!44560 () Bool)

(assert (=> b!44560 (= e!29701 (tuple2!4365 Nil!520 (_1!2269 lt!67766)))))

(assert (= (and d!12962 c!2978) b!44560))

(assert (= (and d!12962 (not c!2978)) b!44561))

(assert (= (and d!12962 c!2979) b!44562))

(assert (= (and d!12962 (not c!2979)) b!44563))

(declare-fun m!67917 () Bool)

(assert (=> b!44561 m!67917))

(declare-fun m!67919 () Bool)

(assert (=> b!44561 m!67919))

(declare-fun m!67921 () Bool)

(assert (=> b!44562 m!67921))

(declare-fun m!67923 () Bool)

(assert (=> b!44563 m!67923))

(assert (=> b!44395 d!12962))

(declare-fun d!12974 () Bool)

(declare-fun e!29709 () Bool)

(assert (=> d!12974 e!29709))

(declare-fun res!37733 () Bool)

(assert (=> d!12974 (=> (not res!37733) (not e!29709))))

(declare-fun lt!68008 () (_ BitVec 64))

(declare-fun lt!68007 () (_ BitVec 64))

(declare-fun lt!68003 () (_ BitVec 64))

(assert (=> d!12974 (= res!37733 (= lt!68003 (bvsub lt!68007 lt!68008)))))

(assert (=> d!12974 (or (= (bvand lt!68007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68007 lt!68008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12974 (= lt!68008 (remainingBits!0 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771)))))))

(declare-fun lt!68004 () (_ BitVec 64))

(declare-fun lt!68006 () (_ BitVec 64))

(assert (=> d!12974 (= lt!68007 (bvmul lt!68004 lt!68006))))

(assert (=> d!12974 (or (= lt!68004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68006 (bvsdiv (bvmul lt!68004 lt!68006) lt!68004)))))

(assert (=> d!12974 (= lt!68006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12974 (= lt!68004 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))))))

(assert (=> d!12974 (= lt!68003 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771)))))))

(assert (=> d!12974 (invariant!0 (currentBit!2829 (_2!2268 lt!67771)) (currentByte!2834 (_2!2268 lt!67771)) (size!1010 (buf!1353 (_2!2268 lt!67771))))))

(assert (=> d!12974 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))) lt!68003)))

(declare-fun b!44574 () Bool)

(declare-fun res!37732 () Bool)

(assert (=> b!44574 (=> (not res!37732) (not e!29709))))

(assert (=> b!44574 (= res!37732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68003))))

(declare-fun b!44575 () Bool)

(declare-fun lt!68005 () (_ BitVec 64))

(assert (=> b!44575 (= e!29709 (bvsle lt!68003 (bvmul lt!68005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44575 (or (= lt!68005 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68005 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68005)))))

(assert (=> b!44575 (= lt!68005 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))))))

(assert (= (and d!12974 res!37733) b!44574))

(assert (= (and b!44574 res!37732) b!44575))

(assert (=> d!12974 m!67811))

(declare-fun m!67931 () Bool)

(assert (=> d!12974 m!67931))

(assert (=> b!44400 d!12974))

(declare-fun d!12982 () Bool)

(declare-fun e!29710 () Bool)

(assert (=> d!12982 e!29710))

(declare-fun res!37735 () Bool)

(assert (=> d!12982 (=> (not res!37735) (not e!29710))))

(declare-fun lt!68009 () (_ BitVec 64))

(declare-fun lt!68014 () (_ BitVec 64))

(declare-fun lt!68013 () (_ BitVec 64))

(assert (=> d!12982 (= res!37735 (= lt!68009 (bvsub lt!68013 lt!68014)))))

(assert (=> d!12982 (or (= (bvand lt!68013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68013 lt!68014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12982 (= lt!68014 (remainingBits!0 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67769)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67769))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67769)))))))

(declare-fun lt!68010 () (_ BitVec 64))

(declare-fun lt!68012 () (_ BitVec 64))

(assert (=> d!12982 (= lt!68013 (bvmul lt!68010 lt!68012))))

(assert (=> d!12982 (or (= lt!68010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68012 (bvsdiv (bvmul lt!68010 lt!68012) lt!68010)))))

(assert (=> d!12982 (= lt!68012 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12982 (= lt!68010 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67769)))))))

(assert (=> d!12982 (= lt!68009 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67769)))))))

(assert (=> d!12982 (invariant!0 (currentBit!2829 (_2!2268 lt!67769)) (currentByte!2834 (_2!2268 lt!67769)) (size!1010 (buf!1353 (_2!2268 lt!67769))))))

(assert (=> d!12982 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67769))) (currentByte!2834 (_2!2268 lt!67769)) (currentBit!2829 (_2!2268 lt!67769))) lt!68009)))

(declare-fun b!44576 () Bool)

(declare-fun res!37734 () Bool)

(assert (=> b!44576 (=> (not res!37734) (not e!29710))))

(assert (=> b!44576 (= res!37734 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68009))))

(declare-fun b!44577 () Bool)

(declare-fun lt!68011 () (_ BitVec 64))

(assert (=> b!44577 (= e!29710 (bvsle lt!68009 (bvmul lt!68011 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44577 (or (= lt!68011 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68011 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68011)))))

(assert (=> b!44577 (= lt!68011 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67769)))))))

(assert (= (and d!12982 res!37735) b!44576))

(assert (= (and b!44576 res!37734) b!44577))

(declare-fun m!67933 () Bool)

(assert (=> d!12982 m!67933))

(assert (=> d!12982 m!67713))

(assert (=> b!44399 d!12982))

(declare-fun d!12984 () Bool)

(declare-fun res!37738 () Bool)

(declare-fun e!29711 () Bool)

(assert (=> d!12984 (=> (not res!37738) (not e!29711))))

(assert (=> d!12984 (= res!37738 (= (size!1010 (buf!1353 thiss!1379)) (size!1010 (buf!1353 thiss!1379))))))

(assert (=> d!12984 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29711)))

(declare-fun b!44578 () Bool)

(declare-fun res!37737 () Bool)

(assert (=> b!44578 (=> (not res!37737) (not e!29711))))

(assert (=> b!44578 (= res!37737 (bvsle (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)) (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379))))))

(declare-fun b!44579 () Bool)

(declare-fun e!29712 () Bool)

(assert (=> b!44579 (= e!29711 e!29712)))

(declare-fun res!37736 () Bool)

(assert (=> b!44579 (=> res!37736 e!29712)))

(assert (=> b!44579 (= res!37736 (= (size!1010 (buf!1353 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44580 () Bool)

(assert (=> b!44580 (= e!29712 (arrayBitRangesEq!0 (buf!1353 thiss!1379) (buf!1353 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379))))))

(assert (= (and d!12984 res!37738) b!44578))

(assert (= (and b!44578 res!37737) b!44579))

(assert (= (and b!44579 (not res!37736)) b!44580))

(assert (=> b!44578 m!67731))

(assert (=> b!44578 m!67731))

(assert (=> b!44580 m!67731))

(assert (=> b!44580 m!67731))

(declare-fun m!67935 () Bool)

(assert (=> b!44580 m!67935))

(assert (=> b!44394 d!12984))

(declare-fun d!12986 () Bool)

(assert (=> d!12986 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!68017 () Unit!3162)

(declare-fun choose!11 (BitStream!1764) Unit!3162)

(assert (=> d!12986 (= lt!68017 (choose!11 thiss!1379))))

(assert (=> d!12986 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!68017)))

(declare-fun bs!3459 () Bool)

(assert (= bs!3459 d!12986))

(assert (=> bs!3459 m!67727))

(declare-fun m!67937 () Bool)

(assert (=> bs!3459 m!67937))

(assert (=> b!44394 d!12986))

(declare-fun d!12988 () Bool)

(declare-fun e!29713 () Bool)

(assert (=> d!12988 e!29713))

(declare-fun res!37740 () Bool)

(assert (=> d!12988 (=> (not res!37740) (not e!29713))))

(declare-fun lt!68022 () (_ BitVec 64))

(declare-fun lt!68023 () (_ BitVec 64))

(declare-fun lt!68018 () (_ BitVec 64))

(assert (=> d!12988 (= res!37740 (= lt!68018 (bvsub lt!68022 lt!68023)))))

(assert (=> d!12988 (or (= (bvand lt!68022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68022 lt!68023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12988 (= lt!68023 (remainingBits!0 ((_ sign_extend 32) (size!1010 (buf!1353 thiss!1379))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379))))))

(declare-fun lt!68019 () (_ BitVec 64))

(declare-fun lt!68021 () (_ BitVec 64))

(assert (=> d!12988 (= lt!68022 (bvmul lt!68019 lt!68021))))

(assert (=> d!12988 (or (= lt!68019 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68021 (bvsdiv (bvmul lt!68019 lt!68021) lt!68019)))))

(assert (=> d!12988 (= lt!68021 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12988 (= lt!68019 ((_ sign_extend 32) (size!1010 (buf!1353 thiss!1379))))))

(assert (=> d!12988 (= lt!68018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2834 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2829 thiss!1379))))))

(assert (=> d!12988 (invariant!0 (currentBit!2829 thiss!1379) (currentByte!2834 thiss!1379) (size!1010 (buf!1353 thiss!1379)))))

(assert (=> d!12988 (= (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)) lt!68018)))

(declare-fun b!44581 () Bool)

(declare-fun res!37739 () Bool)

(assert (=> b!44581 (=> (not res!37739) (not e!29713))))

(assert (=> b!44581 (= res!37739 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68018))))

(declare-fun b!44582 () Bool)

(declare-fun lt!68020 () (_ BitVec 64))

(assert (=> b!44582 (= e!29713 (bvsle lt!68018 (bvmul lt!68020 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44582 (or (= lt!68020 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68020 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68020)))))

(assert (=> b!44582 (= lt!68020 ((_ sign_extend 32) (size!1010 (buf!1353 thiss!1379))))))

(assert (= (and d!12988 res!37740) b!44581))

(assert (= (and b!44581 res!37739) b!44582))

(assert (=> d!12988 m!67807))

(declare-fun m!67939 () Bool)

(assert (=> d!12988 m!67939))

(assert (=> b!44394 d!12988))

(declare-fun d!12990 () Bool)

(assert (=> d!12990 (= (array_inv!935 srcBuffer!2) (bvsge (size!1010 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8950 d!12990))

(declare-fun d!12992 () Bool)

(assert (=> d!12992 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2829 thiss!1379) (currentByte!2834 thiss!1379) (size!1010 (buf!1353 thiss!1379))))))

(declare-fun bs!3460 () Bool)

(assert (= bs!3460 d!12992))

(assert (=> bs!3460 m!67939))

(assert (=> start!8950 d!12992))

(declare-fun d!12994 () Bool)

(assert (=> d!12994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3461 () Bool)

(assert (= bs!3461 d!12994))

(declare-fun m!67941 () Bool)

(assert (=> bs!3461 m!67941))

(assert (=> b!44398 d!12994))

(declare-fun b!44695 () Bool)

(declare-fun e!29767 () Bool)

(declare-fun lt!68460 () (_ BitVec 64))

(assert (=> b!44695 (= e!29767 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) lt!68460))))

(declare-fun b!44696 () Bool)

(declare-fun res!37814 () Bool)

(declare-fun e!29766 () Bool)

(assert (=> b!44696 (=> (not res!37814) (not e!29766))))

(declare-fun lt!68488 () tuple2!4350)

(assert (=> b!44696 (= res!37814 (= (size!1010 (buf!1353 (_2!2268 lt!67771))) (size!1010 (buf!1353 (_2!2268 lt!68488)))))))

(declare-fun b!44697 () Bool)

(declare-fun res!37813 () Bool)

(assert (=> b!44697 (=> (not res!37813) (not e!29766))))

(assert (=> b!44697 (= res!37813 (invariant!0 (currentBit!2829 (_2!2268 lt!68488)) (currentByte!2834 (_2!2268 lt!68488)) (size!1010 (buf!1353 (_2!2268 lt!68488)))))))

(declare-fun b!44698 () Bool)

(declare-fun res!37816 () Bool)

(assert (=> b!44698 (=> (not res!37816) (not e!29766))))

(assert (=> b!44698 (= res!37816 (= (size!1010 (buf!1353 (_2!2268 lt!68488))) (size!1010 (buf!1353 (_2!2268 lt!67771)))))))

(declare-fun b!44699 () Bool)

(declare-fun e!29765 () tuple2!4350)

(declare-fun lt!68465 () tuple2!4350)

(declare-fun Unit!3174 () Unit!3162)

(assert (=> b!44699 (= e!29765 (tuple2!4351 Unit!3174 (_2!2268 lt!68465)))))

(declare-fun lt!68481 () tuple2!4350)

(assert (=> b!44699 (= lt!68481 (appendBitFromByte!0 (_2!2268 lt!67771) (select (arr!1521 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!68464 () (_ BitVec 64))

(assert (=> b!44699 (= lt!68464 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68478 () (_ BitVec 64))

(assert (=> b!44699 (= lt!68478 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68455 () Unit!3162)

(assert (=> b!44699 (= lt!68455 (validateOffsetBitsIneqLemma!0 (_2!2268 lt!67771) (_2!2268 lt!68481) lt!68464 lt!68478))))

(assert (=> b!44699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!68481)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!68481))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!68481))) (bvsub lt!68464 lt!68478))))

(declare-fun lt!68475 () Unit!3162)

(assert (=> b!44699 (= lt!68475 lt!68455)))

(declare-fun lt!68480 () tuple2!4352)

(assert (=> b!44699 (= lt!68480 (reader!0 (_2!2268 lt!67771) (_2!2268 lt!68481)))))

(declare-fun lt!68456 () (_ BitVec 64))

(assert (=> b!44699 (= lt!68456 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68469 () Unit!3162)

(assert (=> b!44699 (= lt!68469 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2268 lt!67771) (buf!1353 (_2!2268 lt!68481)) lt!68456))))

(assert (=> b!44699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!68481)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) lt!68456)))

(declare-fun lt!68473 () Unit!3162)

(assert (=> b!44699 (= lt!68473 lt!68469)))

(assert (=> b!44699 (= (head!342 (byteArrayBitContentToList!0 (_2!2268 lt!68481) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!342 (bitStreamReadBitsIntoList!0 (_2!2268 lt!68481) (_1!2269 lt!68480) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68492 () Unit!3162)

(declare-fun Unit!3175 () Unit!3162)

(assert (=> b!44699 (= lt!68492 Unit!3175)))

(assert (=> b!44699 (= lt!68465 (appendBitsMSBFirstLoop!0 (_2!2268 lt!68481) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!68471 () Unit!3162)

(assert (=> b!44699 (= lt!68471 (lemmaIsPrefixTransitive!0 (_2!2268 lt!67771) (_2!2268 lt!68481) (_2!2268 lt!68465)))))

(assert (=> b!44699 (isPrefixOf!0 (_2!2268 lt!67771) (_2!2268 lt!68465))))

(declare-fun lt!68461 () Unit!3162)

(assert (=> b!44699 (= lt!68461 lt!68471)))

(assert (=> b!44699 (= (size!1010 (buf!1353 (_2!2268 lt!68465))) (size!1010 (buf!1353 (_2!2268 lt!67771))))))

(declare-fun lt!68487 () Unit!3162)

(declare-fun Unit!3176 () Unit!3162)

(assert (=> b!44699 (= lt!68487 Unit!3176)))

(assert (=> b!44699 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!68465))) (currentByte!2834 (_2!2268 lt!68465)) (currentBit!2829 (_2!2268 lt!68465))) (bvsub (bvadd (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68482 () Unit!3162)

(declare-fun Unit!3177 () Unit!3162)

(assert (=> b!44699 (= lt!68482 Unit!3177)))

(assert (=> b!44699 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!68465))) (currentByte!2834 (_2!2268 lt!68465)) (currentBit!2829 (_2!2268 lt!68465))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!68481))) (currentByte!2834 (_2!2268 lt!68481)) (currentBit!2829 (_2!2268 lt!68481))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68484 () Unit!3162)

(declare-fun Unit!3178 () Unit!3162)

(assert (=> b!44699 (= lt!68484 Unit!3178)))

(declare-fun lt!68490 () tuple2!4352)

(declare-fun call!535 () tuple2!4352)

(assert (=> b!44699 (= lt!68490 call!535)))

(declare-fun lt!68479 () (_ BitVec 64))

(assert (=> b!44699 (= lt!68479 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68467 () Unit!3162)

(assert (=> b!44699 (= lt!68467 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2268 lt!67771) (buf!1353 (_2!2268 lt!68465)) lt!68479))))

(assert (=> b!44699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!68465)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) lt!68479)))

(declare-fun lt!68468 () Unit!3162)

(assert (=> b!44699 (= lt!68468 lt!68467)))

(declare-fun lt!68474 () tuple2!4352)

(assert (=> b!44699 (= lt!68474 (reader!0 (_2!2268 lt!68481) (_2!2268 lt!68465)))))

(declare-fun lt!68494 () (_ BitVec 64))

(assert (=> b!44699 (= lt!68494 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68496 () Unit!3162)

(assert (=> b!44699 (= lt!68496 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2268 lt!68481) (buf!1353 (_2!2268 lt!68465)) lt!68494))))

(assert (=> b!44699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!68465)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!68481))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!68481))) lt!68494)))

(declare-fun lt!68493 () Unit!3162)

(assert (=> b!44699 (= lt!68493 lt!68496)))

(declare-fun lt!68477 () List!523)

(assert (=> b!44699 (= lt!68477 (byteArrayBitContentToList!0 (_2!2268 lt!68465) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!68457 () List!523)

(assert (=> b!44699 (= lt!68457 (byteArrayBitContentToList!0 (_2!2268 lt!68465) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68489 () List!523)

(assert (=> b!44699 (= lt!68489 (bitStreamReadBitsIntoList!0 (_2!2268 lt!68465) (_1!2269 lt!68490) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!68470 () List!523)

(assert (=> b!44699 (= lt!68470 (bitStreamReadBitsIntoList!0 (_2!2268 lt!68465) (_1!2269 lt!68474) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68491 () (_ BitVec 64))

(assert (=> b!44699 (= lt!68491 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68476 () Unit!3162)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1764 BitStream!1764 BitStream!1764 BitStream!1764 (_ BitVec 64) List!523) Unit!3162)

(assert (=> b!44699 (= lt!68476 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2268 lt!68465) (_2!2268 lt!68465) (_1!2269 lt!68490) (_1!2269 lt!68474) lt!68491 lt!68489))))

(declare-fun tail!215 (List!523) List!523)

(assert (=> b!44699 (= (bitStreamReadBitsIntoList!0 (_2!2268 lt!68465) (_1!2269 lt!68474) (bvsub lt!68491 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!215 lt!68489))))

(declare-fun lt!68486 () Unit!3162)

(assert (=> b!44699 (= lt!68486 lt!68476)))

(declare-fun lt!68497 () Unit!3162)

(declare-fun lt!68483 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2241 array!2241 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3162)

(assert (=> b!44699 (= lt!68497 (arrayBitRangesEqImpliesEq!0 (buf!1353 (_2!2268 lt!68481)) (buf!1353 (_2!2268 lt!68465)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!68483 (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!68481))) (currentByte!2834 (_2!2268 lt!68481)) (currentBit!2829 (_2!2268 lt!68481)))))))

(declare-fun bitAt!0 (array!2241 (_ BitVec 64)) Bool)

(assert (=> b!44699 (= (bitAt!0 (buf!1353 (_2!2268 lt!68481)) lt!68483) (bitAt!0 (buf!1353 (_2!2268 lt!68465)) lt!68483))))

(declare-fun lt!68466 () Unit!3162)

(assert (=> b!44699 (= lt!68466 lt!68497)))

(declare-fun bm!532 () Bool)

(declare-fun c!3000 () Bool)

(assert (=> bm!532 (= call!535 (reader!0 (_2!2268 lt!67771) (ite c!3000 (_2!2268 lt!68465) (_2!2268 lt!67771))))))

(declare-fun b!44701 () Bool)

(declare-fun Unit!3179 () Unit!3162)

(assert (=> b!44701 (= e!29765 (tuple2!4351 Unit!3179 (_2!2268 lt!67771)))))

(assert (=> b!44701 (= (size!1010 (buf!1353 (_2!2268 lt!67771))) (size!1010 (buf!1353 (_2!2268 lt!67771))))))

(declare-fun lt!68472 () Unit!3162)

(declare-fun Unit!3180 () Unit!3162)

(assert (=> b!44701 (= lt!68472 Unit!3180)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1764 array!2241 array!2241 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44701 (checkByteArrayBitContent!0 (_2!2268 lt!67771) srcBuffer!2 (_1!2273 (readBits!0 (_1!2269 call!535) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!44702 () Bool)

(declare-fun lt!68485 () tuple2!4352)

(assert (=> b!44702 (= e!29766 (= (bitStreamReadBitsIntoList!0 (_2!2268 lt!68488) (_1!2269 lt!68485) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2268 lt!68488) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!44702 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44702 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!68463 () Unit!3162)

(declare-fun lt!68459 () Unit!3162)

(assert (=> b!44702 (= lt!68463 lt!68459)))

(assert (=> b!44702 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!68488)))) ((_ sign_extend 32) (currentByte!2834 (_2!2268 lt!67771))) ((_ sign_extend 32) (currentBit!2829 (_2!2268 lt!67771))) lt!68460)))

(assert (=> b!44702 (= lt!68459 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2268 lt!67771) (buf!1353 (_2!2268 lt!68488)) lt!68460))))

(assert (=> b!44702 e!29767))

(declare-fun res!37817 () Bool)

(assert (=> b!44702 (=> (not res!37817) (not e!29767))))

(assert (=> b!44702 (= res!37817 (and (= (size!1010 (buf!1353 (_2!2268 lt!67771))) (size!1010 (buf!1353 (_2!2268 lt!68488)))) (bvsge lt!68460 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44702 (= lt!68460 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!44702 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44702 (= lt!68485 (reader!0 (_2!2268 lt!67771) (_2!2268 lt!68488)))))

(declare-fun d!12996 () Bool)

(assert (=> d!12996 e!29766))

(declare-fun res!37818 () Bool)

(assert (=> d!12996 (=> (not res!37818) (not e!29766))))

(declare-fun lt!68454 () (_ BitVec 64))

(assert (=> d!12996 (= res!37818 (= (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!68488))) (currentByte!2834 (_2!2268 lt!68488)) (currentBit!2829 (_2!2268 lt!68488))) (bvsub lt!68454 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12996 (or (= (bvand lt!68454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68454 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!68495 () (_ BitVec 64))

(assert (=> d!12996 (= lt!68454 (bvadd lt!68495 to!314))))

(assert (=> d!12996 (or (not (= (bvand lt!68495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68495 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12996 (= lt!68495 (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))))))

(assert (=> d!12996 (= lt!68488 e!29765)))

(assert (=> d!12996 (= c!3000 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!68458 () Unit!3162)

(declare-fun lt!68462 () Unit!3162)

(assert (=> d!12996 (= lt!68458 lt!68462)))

(assert (=> d!12996 (isPrefixOf!0 (_2!2268 lt!67771) (_2!2268 lt!67771))))

(assert (=> d!12996 (= lt!68462 (lemmaIsPrefixRefl!0 (_2!2268 lt!67771)))))

(assert (=> d!12996 (= lt!68483 (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))))))

(assert (=> d!12996 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12996 (= (appendBitsMSBFirstLoop!0 (_2!2268 lt!67771) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!68488)))

(declare-fun b!44700 () Bool)

(declare-fun res!37815 () Bool)

(assert (=> b!44700 (=> (not res!37815) (not e!29766))))

(assert (=> b!44700 (= res!37815 (isPrefixOf!0 (_2!2268 lt!67771) (_2!2268 lt!68488)))))

(assert (= (and d!12996 c!3000) b!44699))

(assert (= (and d!12996 (not c!3000)) b!44701))

(assert (= (or b!44699 b!44701) bm!532))

(assert (= (and d!12996 res!37818) b!44697))

(assert (= (and b!44697 res!37813) b!44696))

(assert (= (and b!44696 res!37814) b!44700))

(assert (= (and b!44700 res!37815) b!44698))

(assert (= (and b!44698 res!37816) b!44702))

(assert (= (and b!44702 res!37817) b!44695))

(declare-fun m!68169 () Bool)

(assert (=> b!44697 m!68169))

(declare-fun m!68171 () Bool)

(assert (=> b!44701 m!68171))

(declare-fun m!68173 () Bool)

(assert (=> b!44701 m!68173))

(declare-fun m!68175 () Bool)

(assert (=> b!44702 m!68175))

(declare-fun m!68177 () Bool)

(assert (=> b!44702 m!68177))

(declare-fun m!68179 () Bool)

(assert (=> b!44702 m!68179))

(declare-fun m!68181 () Bool)

(assert (=> b!44702 m!68181))

(declare-fun m!68183 () Bool)

(assert (=> b!44702 m!68183))

(declare-fun m!68185 () Bool)

(assert (=> b!44695 m!68185))

(declare-fun m!68187 () Bool)

(assert (=> b!44699 m!68187))

(declare-fun m!68189 () Bool)

(assert (=> b!44699 m!68189))

(declare-fun m!68191 () Bool)

(assert (=> b!44699 m!68191))

(declare-fun m!68193 () Bool)

(assert (=> b!44699 m!68193))

(declare-fun m!68195 () Bool)

(assert (=> b!44699 m!68195))

(declare-fun m!68197 () Bool)

(assert (=> b!44699 m!68197))

(declare-fun m!68199 () Bool)

(assert (=> b!44699 m!68199))

(declare-fun m!68201 () Bool)

(assert (=> b!44699 m!68201))

(declare-fun m!68203 () Bool)

(assert (=> b!44699 m!68203))

(declare-fun m!68205 () Bool)

(assert (=> b!44699 m!68205))

(declare-fun m!68207 () Bool)

(assert (=> b!44699 m!68207))

(declare-fun m!68209 () Bool)

(assert (=> b!44699 m!68209))

(declare-fun m!68211 () Bool)

(assert (=> b!44699 m!68211))

(declare-fun m!68213 () Bool)

(assert (=> b!44699 m!68213))

(declare-fun m!68215 () Bool)

(assert (=> b!44699 m!68215))

(declare-fun m!68217 () Bool)

(assert (=> b!44699 m!68217))

(declare-fun m!68219 () Bool)

(assert (=> b!44699 m!68219))

(declare-fun m!68221 () Bool)

(assert (=> b!44699 m!68221))

(declare-fun m!68223 () Bool)

(assert (=> b!44699 m!68223))

(declare-fun m!68225 () Bool)

(assert (=> b!44699 m!68225))

(declare-fun m!68227 () Bool)

(assert (=> b!44699 m!68227))

(declare-fun m!68229 () Bool)

(assert (=> b!44699 m!68229))

(declare-fun m!68231 () Bool)

(assert (=> b!44699 m!68231))

(declare-fun m!68233 () Bool)

(assert (=> b!44699 m!68233))

(assert (=> b!44699 m!68193))

(declare-fun m!68235 () Bool)

(assert (=> b!44699 m!68235))

(declare-fun m!68237 () Bool)

(assert (=> b!44699 m!68237))

(assert (=> b!44699 m!68215))

(assert (=> b!44699 m!68209))

(declare-fun m!68239 () Bool)

(assert (=> b!44699 m!68239))

(assert (=> b!44699 m!67753))

(assert (=> b!44699 m!68211))

(declare-fun m!68241 () Bool)

(assert (=> b!44699 m!68241))

(declare-fun m!68243 () Bool)

(assert (=> b!44699 m!68243))

(declare-fun m!68245 () Bool)

(assert (=> b!44699 m!68245))

(declare-fun m!68247 () Bool)

(assert (=> b!44699 m!68247))

(declare-fun m!68249 () Bool)

(assert (=> b!44700 m!68249))

(declare-fun m!68251 () Bool)

(assert (=> d!12996 m!68251))

(assert (=> d!12996 m!67753))

(declare-fun m!68253 () Bool)

(assert (=> d!12996 m!68253))

(declare-fun m!68255 () Bool)

(assert (=> d!12996 m!68255))

(declare-fun m!68257 () Bool)

(assert (=> bm!532 m!68257))

(assert (=> b!44398 d!12996))

(declare-fun d!13034 () Bool)

(declare-fun res!37821 () Bool)

(declare-fun e!29768 () Bool)

(assert (=> d!13034 (=> (not res!37821) (not e!29768))))

(assert (=> d!13034 (= res!37821 (= (size!1010 (buf!1353 (_2!2268 lt!67771))) (size!1010 (buf!1353 (_2!2268 lt!67769)))))))

(assert (=> d!13034 (= (isPrefixOf!0 (_2!2268 lt!67771) (_2!2268 lt!67769)) e!29768)))

(declare-fun b!44703 () Bool)

(declare-fun res!37820 () Bool)

(assert (=> b!44703 (=> (not res!37820) (not e!29768))))

(assert (=> b!44703 (= res!37820 (bvsle (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))) (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67769))) (currentByte!2834 (_2!2268 lt!67769)) (currentBit!2829 (_2!2268 lt!67769)))))))

(declare-fun b!44704 () Bool)

(declare-fun e!29769 () Bool)

(assert (=> b!44704 (= e!29768 e!29769)))

(declare-fun res!37819 () Bool)

(assert (=> b!44704 (=> res!37819 e!29769)))

(assert (=> b!44704 (= res!37819 (= (size!1010 (buf!1353 (_2!2268 lt!67771))) #b00000000000000000000000000000000))))

(declare-fun b!44705 () Bool)

(assert (=> b!44705 (= e!29769 (arrayBitRangesEq!0 (buf!1353 (_2!2268 lt!67771)) (buf!1353 (_2!2268 lt!67769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771)))))))

(assert (= (and d!13034 res!37821) b!44703))

(assert (= (and b!44703 res!37820) b!44704))

(assert (= (and b!44704 (not res!37819)) b!44705))

(assert (=> b!44703 m!67753))

(assert (=> b!44703 m!67749))

(assert (=> b!44705 m!67753))

(assert (=> b!44705 m!67753))

(declare-fun m!68259 () Bool)

(assert (=> b!44705 m!68259))

(assert (=> b!44398 d!13034))

(declare-fun d!13036 () Bool)

(assert (=> d!13036 (isPrefixOf!0 thiss!1379 (_2!2268 lt!67769))))

(declare-fun lt!68500 () Unit!3162)

(declare-fun choose!30 (BitStream!1764 BitStream!1764 BitStream!1764) Unit!3162)

(assert (=> d!13036 (= lt!68500 (choose!30 thiss!1379 (_2!2268 lt!67771) (_2!2268 lt!67769)))))

(assert (=> d!13036 (isPrefixOf!0 thiss!1379 (_2!2268 lt!67771))))

(assert (=> d!13036 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2268 lt!67771) (_2!2268 lt!67769)) lt!68500)))

(declare-fun bs!3467 () Bool)

(assert (= bs!3467 d!13036))

(assert (=> bs!3467 m!67745))

(declare-fun m!68261 () Bool)

(assert (=> bs!3467 m!68261))

(assert (=> bs!3467 m!67709))

(assert (=> b!44398 d!13036))

(declare-fun b!44741 () Bool)

(declare-fun e!29787 () Unit!3162)

(declare-fun Unit!3182 () Unit!3162)

(assert (=> b!44741 (= e!29787 Unit!3182)))

(declare-fun b!44742 () Bool)

(declare-fun res!37853 () Bool)

(declare-fun e!29786 () Bool)

(assert (=> b!44742 (=> (not res!37853) (not e!29786))))

(declare-fun lt!68585 () tuple2!4352)

(assert (=> b!44742 (= res!37853 (isPrefixOf!0 (_1!2269 lt!68585) thiss!1379))))

(declare-fun b!44743 () Bool)

(declare-fun res!37854 () Bool)

(assert (=> b!44743 (=> (not res!37854) (not e!29786))))

(assert (=> b!44743 (= res!37854 (isPrefixOf!0 (_2!2269 lt!68585) (_2!2268 lt!67771)))))

(declare-fun lt!68587 () (_ BitVec 64))

(declare-fun b!44744 () Bool)

(declare-fun lt!68588 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1764 (_ BitVec 64)) BitStream!1764)

(assert (=> b!44744 (= e!29786 (= (_1!2269 lt!68585) (withMovedBitIndex!0 (_2!2269 lt!68585) (bvsub lt!68588 lt!68587))))))

(assert (=> b!44744 (or (= (bvand lt!68588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68587 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68588 lt!68587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44744 (= lt!68587 (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67771))) (currentByte!2834 (_2!2268 lt!67771)) (currentBit!2829 (_2!2268 lt!67771))))))

(assert (=> b!44744 (= lt!68588 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)))))

(declare-fun d!13038 () Bool)

(assert (=> d!13038 e!29786))

(declare-fun res!37852 () Bool)

(assert (=> d!13038 (=> (not res!37852) (not e!29786))))

(assert (=> d!13038 (= res!37852 (isPrefixOf!0 (_1!2269 lt!68585) (_2!2269 lt!68585)))))

(declare-fun lt!68583 () BitStream!1764)

(assert (=> d!13038 (= lt!68585 (tuple2!4353 lt!68583 (_2!2268 lt!67771)))))

(declare-fun lt!68586 () Unit!3162)

(declare-fun lt!68579 () Unit!3162)

(assert (=> d!13038 (= lt!68586 lt!68579)))

(assert (=> d!13038 (isPrefixOf!0 lt!68583 (_2!2268 lt!67771))))

(assert (=> d!13038 (= lt!68579 (lemmaIsPrefixTransitive!0 lt!68583 (_2!2268 lt!67771) (_2!2268 lt!67771)))))

(declare-fun lt!68580 () Unit!3162)

(declare-fun lt!68582 () Unit!3162)

(assert (=> d!13038 (= lt!68580 lt!68582)))

(assert (=> d!13038 (isPrefixOf!0 lt!68583 (_2!2268 lt!67771))))

(assert (=> d!13038 (= lt!68582 (lemmaIsPrefixTransitive!0 lt!68583 thiss!1379 (_2!2268 lt!67771)))))

(declare-fun lt!68578 () Unit!3162)

(assert (=> d!13038 (= lt!68578 e!29787)))

(declare-fun c!3003 () Bool)

(assert (=> d!13038 (= c!3003 (not (= (size!1010 (buf!1353 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!68589 () Unit!3162)

(declare-fun lt!68577 () Unit!3162)

(assert (=> d!13038 (= lt!68589 lt!68577)))

(assert (=> d!13038 (isPrefixOf!0 (_2!2268 lt!67771) (_2!2268 lt!67771))))

(assert (=> d!13038 (= lt!68577 (lemmaIsPrefixRefl!0 (_2!2268 lt!67771)))))

(declare-fun lt!68594 () Unit!3162)

(declare-fun lt!68591 () Unit!3162)

(assert (=> d!13038 (= lt!68594 lt!68591)))

(assert (=> d!13038 (= lt!68591 (lemmaIsPrefixRefl!0 (_2!2268 lt!67771)))))

(declare-fun lt!68596 () Unit!3162)

(declare-fun lt!68581 () Unit!3162)

(assert (=> d!13038 (= lt!68596 lt!68581)))

(assert (=> d!13038 (isPrefixOf!0 lt!68583 lt!68583)))

(assert (=> d!13038 (= lt!68581 (lemmaIsPrefixRefl!0 lt!68583))))

(declare-fun lt!68592 () Unit!3162)

(declare-fun lt!68593 () Unit!3162)

(assert (=> d!13038 (= lt!68592 lt!68593)))

(assert (=> d!13038 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13038 (= lt!68593 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13038 (= lt!68583 (BitStream!1765 (buf!1353 (_2!2268 lt!67771)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)))))

(assert (=> d!13038 (isPrefixOf!0 thiss!1379 (_2!2268 lt!67771))))

(assert (=> d!13038 (= (reader!0 thiss!1379 (_2!2268 lt!67771)) lt!68585)))

(declare-fun b!44745 () Bool)

(declare-fun lt!68584 () Unit!3162)

(assert (=> b!44745 (= e!29787 lt!68584)))

(declare-fun lt!68595 () (_ BitVec 64))

(assert (=> b!44745 (= lt!68595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68590 () (_ BitVec 64))

(assert (=> b!44745 (= lt!68590 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2241 array!2241 (_ BitVec 64) (_ BitVec 64)) Unit!3162)

(assert (=> b!44745 (= lt!68584 (arrayBitRangesEqSymmetric!0 (buf!1353 thiss!1379) (buf!1353 (_2!2268 lt!67771)) lt!68595 lt!68590))))

(assert (=> b!44745 (arrayBitRangesEq!0 (buf!1353 (_2!2268 lt!67771)) (buf!1353 thiss!1379) lt!68595 lt!68590)))

(assert (= (and d!13038 c!3003) b!44745))

(assert (= (and d!13038 (not c!3003)) b!44741))

(assert (= (and d!13038 res!37852) b!44742))

(assert (= (and b!44742 res!37853) b!44743))

(assert (= (and b!44743 res!37854) b!44744))

(declare-fun m!68289 () Bool)

(assert (=> b!44743 m!68289))

(declare-fun m!68291 () Bool)

(assert (=> d!13038 m!68291))

(assert (=> d!13038 m!68255))

(declare-fun m!68293 () Bool)

(assert (=> d!13038 m!68293))

(declare-fun m!68295 () Bool)

(assert (=> d!13038 m!68295))

(assert (=> d!13038 m!67709))

(declare-fun m!68297 () Bool)

(assert (=> d!13038 m!68297))

(declare-fun m!68299 () Bool)

(assert (=> d!13038 m!68299))

(assert (=> d!13038 m!67729))

(assert (=> d!13038 m!68253))

(declare-fun m!68301 () Bool)

(assert (=> d!13038 m!68301))

(assert (=> d!13038 m!67727))

(declare-fun m!68303 () Bool)

(assert (=> b!44742 m!68303))

(declare-fun m!68305 () Bool)

(assert (=> b!44744 m!68305))

(assert (=> b!44744 m!67753))

(assert (=> b!44744 m!67731))

(assert (=> b!44745 m!67731))

(declare-fun m!68307 () Bool)

(assert (=> b!44745 m!68307))

(declare-fun m!68309 () Bool)

(assert (=> b!44745 m!68309))

(assert (=> b!44398 d!13038))

(declare-fun d!13040 () Bool)

(assert (=> d!13040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1010 (buf!1353 (_2!2268 lt!67771)))) ((_ sign_extend 32) (currentByte!2834 thiss!1379)) ((_ sign_extend 32) (currentBit!2829 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68599 () Unit!3162)

(declare-fun choose!9 (BitStream!1764 array!2241 (_ BitVec 64) BitStream!1764) Unit!3162)

(assert (=> d!13040 (= lt!68599 (choose!9 thiss!1379 (buf!1353 (_2!2268 lt!67771)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1765 (buf!1353 (_2!2268 lt!67771)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379))))))

(assert (=> d!13040 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1353 (_2!2268 lt!67771)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68599)))

(declare-fun bs!3468 () Bool)

(assert (= bs!3468 d!13040))

(assert (=> bs!3468 m!67739))

(declare-fun m!68311 () Bool)

(assert (=> bs!3468 m!68311))

(assert (=> b!44398 d!13040))

(declare-fun d!13042 () Bool)

(declare-fun res!37857 () Bool)

(declare-fun e!29788 () Bool)

(assert (=> d!13042 (=> (not res!37857) (not e!29788))))

(assert (=> d!13042 (= res!37857 (= (size!1010 (buf!1353 thiss!1379)) (size!1010 (buf!1353 (_2!2268 lt!67769)))))))

(assert (=> d!13042 (= (isPrefixOf!0 thiss!1379 (_2!2268 lt!67769)) e!29788)))

(declare-fun b!44746 () Bool)

(declare-fun res!37856 () Bool)

(assert (=> b!44746 (=> (not res!37856) (not e!29788))))

(assert (=> b!44746 (= res!37856 (bvsle (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379)) (bitIndex!0 (size!1010 (buf!1353 (_2!2268 lt!67769))) (currentByte!2834 (_2!2268 lt!67769)) (currentBit!2829 (_2!2268 lt!67769)))))))

(declare-fun b!44747 () Bool)

(declare-fun e!29789 () Bool)

(assert (=> b!44747 (= e!29788 e!29789)))

(declare-fun res!37855 () Bool)

(assert (=> b!44747 (=> res!37855 e!29789)))

(assert (=> b!44747 (= res!37855 (= (size!1010 (buf!1353 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44748 () Bool)

(assert (=> b!44748 (= e!29789 (arrayBitRangesEq!0 (buf!1353 thiss!1379) (buf!1353 (_2!2268 lt!67769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1010 (buf!1353 thiss!1379)) (currentByte!2834 thiss!1379) (currentBit!2829 thiss!1379))))))

(assert (= (and d!13042 res!37857) b!44746))

(assert (= (and b!44746 res!37856) b!44747))

(assert (= (and b!44747 (not res!37855)) b!44748))

(assert (=> b!44746 m!67731))

(assert (=> b!44746 m!67749))

(assert (=> b!44748 m!67731))

(assert (=> b!44748 m!67731))

(declare-fun m!68313 () Bool)

(assert (=> b!44748 m!68313))

(assert (=> b!44398 d!13042))

(declare-fun d!13044 () Bool)

(assert (=> d!13044 (= (invariant!0 (currentBit!2829 (_2!2268 lt!67769)) (currentByte!2834 (_2!2268 lt!67769)) (size!1010 (buf!1353 (_2!2268 lt!67769)))) (and (bvsge (currentBit!2829 (_2!2268 lt!67769)) #b00000000000000000000000000000000) (bvslt (currentBit!2829 (_2!2268 lt!67769)) #b00000000000000000000000000001000) (bvsge (currentByte!2834 (_2!2268 lt!67769)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2834 (_2!2268 lt!67769)) (size!1010 (buf!1353 (_2!2268 lt!67769)))) (and (= (currentBit!2829 (_2!2268 lt!67769)) #b00000000000000000000000000000000) (= (currentByte!2834 (_2!2268 lt!67769)) (size!1010 (buf!1353 (_2!2268 lt!67769))))))))))

(assert (=> b!44392 d!13044))

(declare-fun d!13046 () Bool)

(assert (=> d!13046 (= (array_inv!935 (buf!1353 thiss!1379)) (bvsge (size!1010 (buf!1353 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!44391 d!13046))

(check-sat (not d!13040) (not d!12898) (not d!12996) (not b!44506) (not d!12982) (not b!44744) (not b!44705) (not d!12904) (not b!44532) (not b!44578) (not b!44697) (not b!44745) (not b!44703) (not b!44503) (not b!44743) (not b!44561) (not b!44695) (not b!44742) (not b!44700) (not d!12992) (not bm!532) (not b!44505) (not b!44504) (not b!44562) (not d!12902) (not d!12986) (not b!44501) (not d!12906) (not d!12994) (not b!44699) (not b!44443) (not b!44446) (not d!12974) (not b!44507) (not d!13038) (not b!44502) (not b!44441) (not b!44508) (not b!44701) (not d!12988) (not b!44702) (not b!44748) (not b!44746) (not d!13036) (not b!44580) (not b!44563))
