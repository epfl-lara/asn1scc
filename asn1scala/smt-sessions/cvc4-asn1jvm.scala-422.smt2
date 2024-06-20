; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10972 () Bool)

(assert start!10972)

(declare-fun b!54583 () Bool)

(declare-fun e!36442 () Bool)

(declare-datatypes ((array!2561 0))(
  ( (array!2562 (arr!1708 (Array (_ BitVec 32) (_ BitVec 8))) (size!1168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2024 0))(
  ( (BitStream!2025 (buf!1525 array!2561) (currentByte!3101 (_ BitVec 32)) (currentBit!3096 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2024)

(declare-fun array_inv!1071 (array!2561) Bool)

(assert (=> b!54583 (= e!36442 (array_inv!1071 (buf!1525 thiss!1379)))))

(declare-fun b!54584 () Bool)

(declare-fun lt!84684 () (_ BitVec 64))

(declare-fun lt!84686 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!36441 () Bool)

(assert (=> b!54584 (= e!36441 (or (not (= lt!84684 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!84684 (bvand (bvadd lt!84686 to!314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54584 (= lt!84684 (bvand lt!84686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!54585 () Bool)

(declare-fun e!36439 () Bool)

(declare-fun e!36443 () Bool)

(assert (=> b!54585 (= e!36439 (not e!36443))))

(declare-fun res!45538 () Bool)

(assert (=> b!54585 (=> res!45538 e!36443)))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!54585 (= res!45538 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2024 BitStream!2024) Bool)

(assert (=> b!54585 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3767 0))(
  ( (Unit!3768) )
))
(declare-fun lt!84688 () Unit!3767)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2024) Unit!3767)

(assert (=> b!54585 (= lt!84688 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54585 (= lt!84686 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)))))

(declare-fun b!54586 () Bool)

(declare-fun e!36437 () Bool)

(assert (=> b!54586 (= e!36443 e!36437)))

(declare-fun res!45540 () Bool)

(assert (=> b!54586 (=> res!45540 e!36437)))

(declare-datatypes ((tuple2!4978 0))(
  ( (tuple2!4979 (_1!2600 Unit!3767) (_2!2600 BitStream!2024)) )
))
(declare-fun lt!84687 () tuple2!4978)

(assert (=> b!54586 (= res!45540 (not (isPrefixOf!0 thiss!1379 (_2!2600 lt!84687))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84681 () Unit!3767)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2024 BitStream!2024 (_ BitVec 64) (_ BitVec 64)) Unit!3767)

(assert (=> b!54586 (= lt!84681 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2600 lt!84687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2561)

(declare-fun appendBitFromByte!0 (BitStream!2024 (_ BitVec 8) (_ BitVec 32)) tuple2!4978)

(assert (=> b!54586 (= lt!84687 (appendBitFromByte!0 thiss!1379 (select (arr!1708 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!45535 () Bool)

(assert (=> start!10972 (=> (not res!45535) (not e!36439))))

(assert (=> start!10972 (= res!45535 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1168 srcBuffer!2))))))))

(assert (=> start!10972 e!36439))

(assert (=> start!10972 true))

(assert (=> start!10972 (array_inv!1071 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2024) Bool)

(assert (=> start!10972 (and (inv!12 thiss!1379) e!36442)))

(declare-fun b!54587 () Bool)

(declare-fun res!45537 () Bool)

(assert (=> b!54587 (=> (not res!45537) (not e!36439))))

(assert (=> b!54587 (= res!45537 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 thiss!1379))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54588 () Bool)

(assert (=> b!54588 (= e!36437 e!36441)))

(declare-fun res!45536 () Bool)

(assert (=> b!54588 (=> res!45536 e!36441)))

(declare-fun lt!84682 () tuple2!4978)

(assert (=> b!54588 (= res!45536 (not (isPrefixOf!0 (_2!2600 lt!84687) (_2!2600 lt!84682))))))

(assert (=> b!54588 (isPrefixOf!0 thiss!1379 (_2!2600 lt!84682))))

(declare-fun lt!84683 () Unit!3767)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2024 BitStream!2024 BitStream!2024) Unit!3767)

(assert (=> b!54588 (= lt!84683 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2600 lt!84687) (_2!2600 lt!84682)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2024 array!2561 (_ BitVec 64) (_ BitVec 64)) tuple2!4978)

(assert (=> b!54588 (= lt!84682 (appendBitsMSBFirstLoop!0 (_2!2600 lt!84687) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36440 () Bool)

(assert (=> b!54588 e!36440))

(declare-fun res!45539 () Bool)

(assert (=> b!54588 (=> (not res!45539) (not e!36440))))

(assert (=> b!54588 (= res!45539 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84685 () Unit!3767)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2024 array!2561 (_ BitVec 64)) Unit!3767)

(assert (=> b!54588 (= lt!84685 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1525 (_2!2600 lt!84687)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4980 0))(
  ( (tuple2!4981 (_1!2601 BitStream!2024) (_2!2601 BitStream!2024)) )
))
(declare-fun lt!84680 () tuple2!4980)

(declare-fun reader!0 (BitStream!2024 BitStream!2024) tuple2!4980)

(assert (=> b!54588 (= lt!84680 (reader!0 thiss!1379 (_2!2600 lt!84687)))))

(declare-fun b!54589 () Bool)

(declare-datatypes ((List!587 0))(
  ( (Nil!584) (Cons!583 (h!702 Bool) (t!1337 List!587)) )
))
(declare-fun head!406 (List!587) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2024 array!2561 (_ BitVec 64) (_ BitVec 64)) List!587)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2024 BitStream!2024 (_ BitVec 64)) List!587)

(assert (=> b!54589 (= e!36440 (= (head!406 (byteArrayBitContentToList!0 (_2!2600 lt!84687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!406 (bitStreamReadBitsIntoList!0 (_2!2600 lt!84687) (_1!2601 lt!84680) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!10972 res!45535) b!54587))

(assert (= (and b!54587 res!45537) b!54585))

(assert (= (and b!54585 (not res!45538)) b!54586))

(assert (= (and b!54586 (not res!45540)) b!54588))

(assert (= (and b!54588 res!45539) b!54589))

(assert (= (and b!54588 (not res!45536)) b!54584))

(assert (= start!10972 b!54583))

(declare-fun m!85881 () Bool)

(assert (=> b!54583 m!85881))

(declare-fun m!85883 () Bool)

(assert (=> b!54588 m!85883))

(declare-fun m!85885 () Bool)

(assert (=> b!54588 m!85885))

(declare-fun m!85887 () Bool)

(assert (=> b!54588 m!85887))

(declare-fun m!85889 () Bool)

(assert (=> b!54588 m!85889))

(declare-fun m!85891 () Bool)

(assert (=> b!54588 m!85891))

(declare-fun m!85893 () Bool)

(assert (=> b!54588 m!85893))

(declare-fun m!85895 () Bool)

(assert (=> b!54588 m!85895))

(declare-fun m!85897 () Bool)

(assert (=> b!54587 m!85897))

(declare-fun m!85899 () Bool)

(assert (=> b!54585 m!85899))

(declare-fun m!85901 () Bool)

(assert (=> b!54585 m!85901))

(declare-fun m!85903 () Bool)

(assert (=> b!54585 m!85903))

(declare-fun m!85905 () Bool)

(assert (=> b!54589 m!85905))

(assert (=> b!54589 m!85905))

(declare-fun m!85907 () Bool)

(assert (=> b!54589 m!85907))

(declare-fun m!85909 () Bool)

(assert (=> b!54589 m!85909))

(assert (=> b!54589 m!85909))

(declare-fun m!85911 () Bool)

(assert (=> b!54589 m!85911))

(declare-fun m!85913 () Bool)

(assert (=> b!54586 m!85913))

(declare-fun m!85915 () Bool)

(assert (=> b!54586 m!85915))

(declare-fun m!85917 () Bool)

(assert (=> b!54586 m!85917))

(assert (=> b!54586 m!85913))

(declare-fun m!85919 () Bool)

(assert (=> b!54586 m!85919))

(declare-fun m!85921 () Bool)

(assert (=> b!54586 m!85921))

(declare-fun m!85923 () Bool)

(assert (=> start!10972 m!85923))

(declare-fun m!85925 () Bool)

(assert (=> start!10972 m!85925))

(push 1)

(assert (not b!54589))

(assert (not b!54586))

(assert (not b!54585))

(assert (not b!54588))

(assert (not b!54583))

(assert (not b!54587))

(assert (not start!10972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17400 () Bool)

(assert (=> d!17400 (= (array_inv!1071 srcBuffer!2) (bvsge (size!1168 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10972 d!17400))

(declare-fun d!17402 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17402 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3096 thiss!1379) (currentByte!3101 thiss!1379) (size!1168 (buf!1525 thiss!1379))))))

(declare-fun bs!4387 () Bool)

(assert (= bs!4387 d!17402))

(declare-fun m!85949 () Bool)

(assert (=> bs!4387 m!85949))

(assert (=> start!10972 d!17402))

(declare-fun d!17406 () Bool)

(assert (=> d!17406 (= (head!406 (byteArrayBitContentToList!0 (_2!2600 lt!84687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!702 (byteArrayBitContentToList!0 (_2!2600 lt!84687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54589 d!17406))

(declare-fun d!17408 () Bool)

(declare-fun c!3870 () Bool)

(assert (=> d!17408 (= c!3870 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36469 () List!587)

(assert (=> d!17408 (= (byteArrayBitContentToList!0 (_2!2600 lt!84687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36469)))

(declare-fun b!54627 () Bool)

(assert (=> b!54627 (= e!36469 Nil!584)))

(declare-fun b!54628 () Bool)

(assert (=> b!54628 (= e!36469 (Cons!583 (not (= (bvand ((_ sign_extend 24) (select (arr!1708 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2600 lt!84687) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17408 c!3870) b!54627))

(assert (= (and d!17408 (not c!3870)) b!54628))

(assert (=> b!54628 m!85913))

(declare-fun m!85953 () Bool)

(assert (=> b!54628 m!85953))

(declare-fun m!85955 () Bool)

(assert (=> b!54628 m!85955))

(assert (=> b!54589 d!17408))

(declare-fun d!17412 () Bool)

(assert (=> d!17412 (= (head!406 (bitStreamReadBitsIntoList!0 (_2!2600 lt!84687) (_1!2601 lt!84680) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!702 (bitStreamReadBitsIntoList!0 (_2!2600 lt!84687) (_1!2601 lt!84680) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54589 d!17412))

(declare-fun b!54640 () Bool)

(declare-fun e!36474 () Bool)

(declare-fun lt!84724 () List!587)

(declare-fun length!270 (List!587) Int)

(assert (=> b!54640 (= e!36474 (> (length!270 lt!84724) 0))))

(declare-fun d!17414 () Bool)

(assert (=> d!17414 e!36474))

(declare-fun c!3875 () Bool)

(assert (=> d!17414 (= c!3875 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4982 0))(
  ( (tuple2!4983 (_1!2602 List!587) (_2!2602 BitStream!2024)) )
))
(declare-fun e!36475 () tuple2!4982)

(assert (=> d!17414 (= lt!84724 (_1!2602 e!36475))))

(declare-fun c!3876 () Bool)

(assert (=> d!17414 (= c!3876 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17414 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17414 (= (bitStreamReadBitsIntoList!0 (_2!2600 lt!84687) (_1!2601 lt!84680) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84724)))

(declare-datatypes ((tuple2!4988 0))(
  ( (tuple2!4989 (_1!2605 Bool) (_2!2605 BitStream!2024)) )
))
(declare-fun lt!84723 () tuple2!4988)

(declare-fun b!54638 () Bool)

(declare-fun lt!84722 () (_ BitVec 64))

(assert (=> b!54638 (= e!36475 (tuple2!4983 (Cons!583 (_1!2605 lt!84723) (bitStreamReadBitsIntoList!0 (_2!2600 lt!84687) (_2!2605 lt!84723) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!84722))) (_2!2605 lt!84723)))))

(declare-fun readBit!0 (BitStream!2024) tuple2!4988)

(assert (=> b!54638 (= lt!84723 (readBit!0 (_1!2601 lt!84680)))))

(assert (=> b!54638 (= lt!84722 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!54639 () Bool)

(declare-fun isEmpty!156 (List!587) Bool)

(assert (=> b!54639 (= e!36474 (isEmpty!156 lt!84724))))

(declare-fun b!54637 () Bool)

(assert (=> b!54637 (= e!36475 (tuple2!4983 Nil!584 (_1!2601 lt!84680)))))

(assert (= (and d!17414 c!3876) b!54637))

(assert (= (and d!17414 (not c!3876)) b!54638))

(assert (= (and d!17414 c!3875) b!54639))

(assert (= (and d!17414 (not c!3875)) b!54640))

(declare-fun m!85957 () Bool)

(assert (=> b!54640 m!85957))

(declare-fun m!85959 () Bool)

(assert (=> b!54638 m!85959))

(declare-fun m!85961 () Bool)

(assert (=> b!54638 m!85961))

(declare-fun m!85963 () Bool)

(assert (=> b!54639 m!85963))

(assert (=> b!54589 d!17414))

(declare-fun d!17416 () Bool)

(declare-fun res!45580 () Bool)

(declare-fun e!36481 () Bool)

(assert (=> d!17416 (=> (not res!45580) (not e!36481))))

(assert (=> d!17416 (= res!45580 (= (size!1168 (buf!1525 thiss!1379)) (size!1168 (buf!1525 (_2!2600 lt!84687)))))))

(assert (=> d!17416 (= (isPrefixOf!0 thiss!1379 (_2!2600 lt!84687)) e!36481)))

(declare-fun b!54647 () Bool)

(declare-fun res!45582 () Bool)

(assert (=> b!54647 (=> (not res!45582) (not e!36481))))

(assert (=> b!54647 (= res!45582 (bvsle (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)) (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687)))))))

(declare-fun b!54648 () Bool)

(declare-fun e!36480 () Bool)

(assert (=> b!54648 (= e!36481 e!36480)))

(declare-fun res!45581 () Bool)

(assert (=> b!54648 (=> res!45581 e!36480)))

(assert (=> b!54648 (= res!45581 (= (size!1168 (buf!1525 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54649 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2561 array!2561 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54649 (= e!36480 (arrayBitRangesEq!0 (buf!1525 thiss!1379) (buf!1525 (_2!2600 lt!84687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379))))))

(assert (= (and d!17416 res!45580) b!54647))

(assert (= (and b!54647 res!45582) b!54648))

(assert (= (and b!54648 (not res!45581)) b!54649))

(assert (=> b!54647 m!85903))

(declare-fun m!85965 () Bool)

(assert (=> b!54647 m!85965))

(assert (=> b!54649 m!85903))

(assert (=> b!54649 m!85903))

(declare-fun m!85967 () Bool)

(assert (=> b!54649 m!85967))

(assert (=> b!54586 d!17416))

(declare-fun d!17418 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17418 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4388 () Bool)

(assert (= bs!4388 d!17418))

(declare-fun m!85969 () Bool)

(assert (=> bs!4388 m!85969))

(assert (=> b!54586 d!17418))

(declare-fun d!17420 () Bool)

(declare-fun e!36484 () Bool)

(assert (=> d!17420 e!36484))

(declare-fun res!45585 () Bool)

(assert (=> d!17420 (=> (not res!45585) (not e!36484))))

(assert (=> d!17420 (= res!45585 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!84727 () Unit!3767)

(declare-fun choose!27 (BitStream!2024 BitStream!2024 (_ BitVec 64) (_ BitVec 64)) Unit!3767)

(assert (=> d!17420 (= lt!84727 (choose!27 thiss!1379 (_2!2600 lt!84687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17420 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17420 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2600 lt!84687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84727)))

(declare-fun b!54652 () Bool)

(assert (=> b!54652 (= e!36484 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17420 res!45585) b!54652))

(declare-fun m!85971 () Bool)

(assert (=> d!17420 m!85971))

(assert (=> b!54652 m!85921))

(assert (=> b!54586 d!17420))

(declare-fun b!54723 () Bool)

(declare-fun res!45656 () Bool)

(declare-fun e!36520 () Bool)

(assert (=> b!54723 (=> (not res!45656) (not e!36520))))

(declare-fun lt!84834 () tuple2!4978)

(declare-fun lt!84838 () (_ BitVec 64))

(declare-fun lt!84833 () (_ BitVec 64))

(assert (=> b!54723 (= res!45656 (= (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84834))) (currentByte!3101 (_2!2600 lt!84834)) (currentBit!3096 (_2!2600 lt!84834))) (bvadd lt!84833 lt!84838)))))

(assert (=> b!54723 (or (not (= (bvand lt!84833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84833 lt!84838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54723 (= lt!84838 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!54723 (= lt!84833 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)))))

(declare-fun b!54724 () Bool)

(declare-fun e!36519 () Bool)

(declare-datatypes ((tuple2!4994 0))(
  ( (tuple2!4995 (_1!2608 BitStream!2024) (_2!2608 Bool)) )
))
(declare-fun lt!84839 () tuple2!4994)

(declare-fun lt!84841 () tuple2!4978)

(assert (=> b!54724 (= e!36519 (= (bitIndex!0 (size!1168 (buf!1525 (_1!2608 lt!84839))) (currentByte!3101 (_1!2608 lt!84839)) (currentBit!3096 (_1!2608 lt!84839))) (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84841))) (currentByte!3101 (_2!2600 lt!84841)) (currentBit!3096 (_2!2600 lt!84841)))))))

(declare-fun b!54725 () Bool)

(declare-fun res!45660 () Bool)

(declare-fun e!36522 () Bool)

(assert (=> b!54725 (=> (not res!45660) (not e!36522))))

(assert (=> b!54725 (= res!45660 (= (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84841))) (currentByte!3101 (_2!2600 lt!84841)) (currentBit!3096 (_2!2600 lt!84841))) (bvadd (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!54726 () Bool)

(declare-fun res!45655 () Bool)

(assert (=> b!54726 (=> (not res!45655) (not e!36520))))

(assert (=> b!54726 (= res!45655 (isPrefixOf!0 thiss!1379 (_2!2600 lt!84834)))))

(declare-fun b!54727 () Bool)

(assert (=> b!54727 (= e!36522 e!36519)))

(declare-fun res!45654 () Bool)

(assert (=> b!54727 (=> (not res!45654) (not e!36519))))

(declare-fun lt!84831 () Bool)

(assert (=> b!54727 (= res!45654 (and (= (_2!2608 lt!84839) lt!84831) (= (_1!2608 lt!84839) (_2!2600 lt!84841))))))

(declare-fun readBitPure!0 (BitStream!2024) tuple2!4994)

(declare-fun readerFrom!0 (BitStream!2024 (_ BitVec 32) (_ BitVec 32)) BitStream!2024)

(assert (=> b!54727 (= lt!84839 (readBitPure!0 (readerFrom!0 (_2!2600 lt!84841) (currentBit!3096 thiss!1379) (currentByte!3101 thiss!1379))))))

(declare-fun b!54728 () Bool)

(declare-fun e!36521 () Bool)

(declare-fun lt!84840 () tuple2!4994)

(assert (=> b!54728 (= e!36521 (= (bitIndex!0 (size!1168 (buf!1525 (_1!2608 lt!84840))) (currentByte!3101 (_1!2608 lt!84840)) (currentBit!3096 (_1!2608 lt!84840))) (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84834))) (currentByte!3101 (_2!2600 lt!84834)) (currentBit!3096 (_2!2600 lt!84834)))))))

(declare-fun d!17422 () Bool)

(assert (=> d!17422 e!36520))

(declare-fun res!45658 () Bool)

(assert (=> d!17422 (=> (not res!45658) (not e!36520))))

(assert (=> d!17422 (= res!45658 (= (size!1168 (buf!1525 (_2!2600 lt!84834))) (size!1168 (buf!1525 thiss!1379))))))

(declare-fun lt!84835 () (_ BitVec 8))

(declare-fun lt!84836 () array!2561)

(assert (=> d!17422 (= lt!84835 (select (arr!1708 lt!84836) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17422 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1168 lt!84836)))))

(assert (=> d!17422 (= lt!84836 (array!2562 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!84830 () tuple2!4978)

(assert (=> d!17422 (= lt!84834 (tuple2!4979 (_1!2600 lt!84830) (_2!2600 lt!84830)))))

(assert (=> d!17422 (= lt!84830 lt!84841)))

(assert (=> d!17422 e!36522))

(declare-fun res!45657 () Bool)

(assert (=> d!17422 (=> (not res!45657) (not e!36522))))

(assert (=> d!17422 (= res!45657 (= (size!1168 (buf!1525 thiss!1379)) (size!1168 (buf!1525 (_2!2600 lt!84841)))))))

(declare-fun appendBit!0 (BitStream!2024 Bool) tuple2!4978)

(assert (=> d!17422 (= lt!84841 (appendBit!0 thiss!1379 lt!84831))))

(assert (=> d!17422 (= lt!84831 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1708 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17422 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17422 (= (appendBitFromByte!0 thiss!1379 (select (arr!1708 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!84834)))

(declare-fun b!54729 () Bool)

(declare-fun res!45653 () Bool)

(assert (=> b!54729 (=> (not res!45653) (not e!36522))))

(assert (=> b!54729 (= res!45653 (isPrefixOf!0 thiss!1379 (_2!2600 lt!84841)))))

(declare-fun b!54730 () Bool)

(assert (=> b!54730 (= e!36520 e!36521)))

(declare-fun res!45659 () Bool)

(assert (=> b!54730 (=> (not res!45659) (not e!36521))))

(assert (=> b!54730 (= res!45659 (and (= (_2!2608 lt!84840) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1708 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!84835)) #b00000000000000000000000000000000))) (= (_1!2608 lt!84840) (_2!2600 lt!84834))))))

(declare-datatypes ((tuple2!4996 0))(
  ( (tuple2!4997 (_1!2609 array!2561) (_2!2609 BitStream!2024)) )
))
(declare-fun lt!84837 () tuple2!4996)

(declare-fun lt!84832 () BitStream!2024)

(declare-fun readBits!0 (BitStream!2024 (_ BitVec 64)) tuple2!4996)

(assert (=> b!54730 (= lt!84837 (readBits!0 lt!84832 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!54730 (= lt!84840 (readBitPure!0 lt!84832))))

(assert (=> b!54730 (= lt!84832 (readerFrom!0 (_2!2600 lt!84834) (currentBit!3096 thiss!1379) (currentByte!3101 thiss!1379)))))

(assert (= (and d!17422 res!45657) b!54725))

(assert (= (and b!54725 res!45660) b!54729))

(assert (= (and b!54729 res!45653) b!54727))

(assert (= (and b!54727 res!45654) b!54724))

(assert (= (and d!17422 res!45658) b!54723))

(assert (= (and b!54723 res!45656) b!54726))

(assert (= (and b!54726 res!45655) b!54730))

(assert (= (and b!54730 res!45659) b!54728))

(declare-fun m!86039 () Bool)

(assert (=> b!54725 m!86039))

(assert (=> b!54725 m!85903))

(declare-fun m!86041 () Bool)

(assert (=> b!54729 m!86041))

(declare-fun m!86043 () Bool)

(assert (=> b!54723 m!86043))

(assert (=> b!54723 m!85903))

(declare-fun m!86045 () Bool)

(assert (=> b!54724 m!86045))

(assert (=> b!54724 m!86039))

(declare-fun m!86047 () Bool)

(assert (=> d!17422 m!86047))

(declare-fun m!86049 () Bool)

(assert (=> d!17422 m!86049))

(assert (=> d!17422 m!85953))

(declare-fun m!86051 () Bool)

(assert (=> b!54728 m!86051))

(assert (=> b!54728 m!86043))

(declare-fun m!86053 () Bool)

(assert (=> b!54730 m!86053))

(declare-fun m!86055 () Bool)

(assert (=> b!54730 m!86055))

(declare-fun m!86057 () Bool)

(assert (=> b!54730 m!86057))

(declare-fun m!86059 () Bool)

(assert (=> b!54726 m!86059))

(declare-fun m!86061 () Bool)

(assert (=> b!54727 m!86061))

(assert (=> b!54727 m!86061))

(declare-fun m!86063 () Bool)

(assert (=> b!54727 m!86063))

(assert (=> b!54586 d!17422))

(declare-fun d!17444 () Bool)

(declare-fun res!45661 () Bool)

(declare-fun e!36524 () Bool)

(assert (=> d!17444 (=> (not res!45661) (not e!36524))))

(assert (=> d!17444 (= res!45661 (= (size!1168 (buf!1525 thiss!1379)) (size!1168 (buf!1525 thiss!1379))))))

(assert (=> d!17444 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36524)))

(declare-fun b!54731 () Bool)

(declare-fun res!45663 () Bool)

(assert (=> b!54731 (=> (not res!45663) (not e!36524))))

(assert (=> b!54731 (= res!45663 (bvsle (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)) (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379))))))

(declare-fun b!54732 () Bool)

(declare-fun e!36523 () Bool)

(assert (=> b!54732 (= e!36524 e!36523)))

(declare-fun res!45662 () Bool)

(assert (=> b!54732 (=> res!45662 e!36523)))

(assert (=> b!54732 (= res!45662 (= (size!1168 (buf!1525 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54733 () Bool)

(assert (=> b!54733 (= e!36523 (arrayBitRangesEq!0 (buf!1525 thiss!1379) (buf!1525 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379))))))

(assert (= (and d!17444 res!45661) b!54731))

(assert (= (and b!54731 res!45663) b!54732))

(assert (= (and b!54732 (not res!45662)) b!54733))

(assert (=> b!54731 m!85903))

(assert (=> b!54731 m!85903))

(assert (=> b!54733 m!85903))

(assert (=> b!54733 m!85903))

(declare-fun m!86065 () Bool)

(assert (=> b!54733 m!86065))

(assert (=> b!54585 d!17444))

(declare-fun d!17446 () Bool)

(assert (=> d!17446 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!84844 () Unit!3767)

(declare-fun choose!11 (BitStream!2024) Unit!3767)

(assert (=> d!17446 (= lt!84844 (choose!11 thiss!1379))))

(assert (=> d!17446 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!84844)))

(declare-fun bs!4394 () Bool)

(assert (= bs!4394 d!17446))

(assert (=> bs!4394 m!85899))

(declare-fun m!86067 () Bool)

(assert (=> bs!4394 m!86067))

(assert (=> b!54585 d!17446))

(declare-fun d!17448 () Bool)

(declare-fun e!36527 () Bool)

(assert (=> d!17448 e!36527))

(declare-fun res!45669 () Bool)

(assert (=> d!17448 (=> (not res!45669) (not e!36527))))

(declare-fun lt!84858 () (_ BitVec 64))

(declare-fun lt!84861 () (_ BitVec 64))

(declare-fun lt!84857 () (_ BitVec 64))

(assert (=> d!17448 (= res!45669 (= lt!84858 (bvsub lt!84861 lt!84857)))))

(assert (=> d!17448 (or (= (bvand lt!84861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84861 lt!84857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17448 (= lt!84857 (remainingBits!0 ((_ sign_extend 32) (size!1168 (buf!1525 thiss!1379))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379))))))

(declare-fun lt!84859 () (_ BitVec 64))

(declare-fun lt!84862 () (_ BitVec 64))

(assert (=> d!17448 (= lt!84861 (bvmul lt!84859 lt!84862))))

(assert (=> d!17448 (or (= lt!84859 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!84862 (bvsdiv (bvmul lt!84859 lt!84862) lt!84859)))))

(assert (=> d!17448 (= lt!84862 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17448 (= lt!84859 ((_ sign_extend 32) (size!1168 (buf!1525 thiss!1379))))))

(assert (=> d!17448 (= lt!84858 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3101 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3096 thiss!1379))))))

(assert (=> d!17448 (invariant!0 (currentBit!3096 thiss!1379) (currentByte!3101 thiss!1379) (size!1168 (buf!1525 thiss!1379)))))

(assert (=> d!17448 (= (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)) lt!84858)))

(declare-fun b!54738 () Bool)

(declare-fun res!45668 () Bool)

(assert (=> b!54738 (=> (not res!45668) (not e!36527))))

(assert (=> b!54738 (= res!45668 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!84858))))

(declare-fun b!54739 () Bool)

(declare-fun lt!84860 () (_ BitVec 64))

(assert (=> b!54739 (= e!36527 (bvsle lt!84858 (bvmul lt!84860 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54739 (or (= lt!84860 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!84860 #b0000000000000000000000000000000000000000000000000000000000001000) lt!84860)))))

(assert (=> b!54739 (= lt!84860 ((_ sign_extend 32) (size!1168 (buf!1525 thiss!1379))))))

(assert (= (and d!17448 res!45669) b!54738))

(assert (= (and b!54738 res!45668) b!54739))

(declare-fun m!86069 () Bool)

(assert (=> d!17448 m!86069))

(assert (=> d!17448 m!85949))

(assert (=> b!54585 d!17448))

(declare-fun d!17450 () Bool)

(assert (=> d!17450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 thiss!1379))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1168 (buf!1525 thiss!1379))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4395 () Bool)

(assert (= bs!4395 d!17450))

(assert (=> bs!4395 m!86069))

(assert (=> b!54587 d!17450))

(declare-fun d!17452 () Bool)

(assert (=> d!17452 (= (array_inv!1071 (buf!1525 thiss!1379)) (bvsge (size!1168 (buf!1525 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54583 d!17452))

(declare-fun d!17454 () Bool)

(assert (=> d!17454 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4396 () Bool)

(assert (= bs!4396 d!17454))

(declare-fun m!86071 () Bool)

(assert (=> bs!4396 m!86071))

(assert (=> b!54588 d!17454))

(declare-fun d!17456 () Bool)

(assert (=> d!17456 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 thiss!1379)) ((_ sign_extend 32) (currentBit!3096 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84865 () Unit!3767)

(declare-fun choose!9 (BitStream!2024 array!2561 (_ BitVec 64) BitStream!2024) Unit!3767)

(assert (=> d!17456 (= lt!84865 (choose!9 thiss!1379 (buf!1525 (_2!2600 lt!84687)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2025 (buf!1525 (_2!2600 lt!84687)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379))))))

(assert (=> d!17456 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1525 (_2!2600 lt!84687)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84865)))

(declare-fun bs!4397 () Bool)

(assert (= bs!4397 d!17456))

(assert (=> bs!4397 m!85889))

(declare-fun m!86073 () Bool)

(assert (=> bs!4397 m!86073))

(assert (=> b!54588 d!17456))

(declare-fun d!17458 () Bool)

(declare-fun e!36533 () Bool)

(assert (=> d!17458 e!36533))

(declare-fun res!45677 () Bool)

(assert (=> d!17458 (=> (not res!45677) (not e!36533))))

(declare-fun lt!84922 () tuple2!4980)

(assert (=> d!17458 (= res!45677 (isPrefixOf!0 (_1!2601 lt!84922) (_2!2601 lt!84922)))))

(declare-fun lt!84912 () BitStream!2024)

(assert (=> d!17458 (= lt!84922 (tuple2!4981 lt!84912 (_2!2600 lt!84687)))))

(declare-fun lt!84916 () Unit!3767)

(declare-fun lt!84921 () Unit!3767)

(assert (=> d!17458 (= lt!84916 lt!84921)))

(assert (=> d!17458 (isPrefixOf!0 lt!84912 (_2!2600 lt!84687))))

(assert (=> d!17458 (= lt!84921 (lemmaIsPrefixTransitive!0 lt!84912 (_2!2600 lt!84687) (_2!2600 lt!84687)))))

(declare-fun lt!84924 () Unit!3767)

(declare-fun lt!84909 () Unit!3767)

(assert (=> d!17458 (= lt!84924 lt!84909)))

(assert (=> d!17458 (isPrefixOf!0 lt!84912 (_2!2600 lt!84687))))

(assert (=> d!17458 (= lt!84909 (lemmaIsPrefixTransitive!0 lt!84912 thiss!1379 (_2!2600 lt!84687)))))

(declare-fun lt!84914 () Unit!3767)

(declare-fun e!36532 () Unit!3767)

(assert (=> d!17458 (= lt!84914 e!36532)))

(declare-fun c!3879 () Bool)

(assert (=> d!17458 (= c!3879 (not (= (size!1168 (buf!1525 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!84908 () Unit!3767)

(declare-fun lt!84906 () Unit!3767)

(assert (=> d!17458 (= lt!84908 lt!84906)))

(assert (=> d!17458 (isPrefixOf!0 (_2!2600 lt!84687) (_2!2600 lt!84687))))

(assert (=> d!17458 (= lt!84906 (lemmaIsPrefixRefl!0 (_2!2600 lt!84687)))))

(declare-fun lt!84920 () Unit!3767)

(declare-fun lt!84910 () Unit!3767)

(assert (=> d!17458 (= lt!84920 lt!84910)))

(assert (=> d!17458 (= lt!84910 (lemmaIsPrefixRefl!0 (_2!2600 lt!84687)))))

(declare-fun lt!84911 () Unit!3767)

(declare-fun lt!84919 () Unit!3767)

(assert (=> d!17458 (= lt!84911 lt!84919)))

(assert (=> d!17458 (isPrefixOf!0 lt!84912 lt!84912)))

(assert (=> d!17458 (= lt!84919 (lemmaIsPrefixRefl!0 lt!84912))))

(declare-fun lt!84923 () Unit!3767)

(declare-fun lt!84907 () Unit!3767)

(assert (=> d!17458 (= lt!84923 lt!84907)))

(assert (=> d!17458 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17458 (= lt!84907 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17458 (= lt!84912 (BitStream!2025 (buf!1525 (_2!2600 lt!84687)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)))))

(assert (=> d!17458 (isPrefixOf!0 thiss!1379 (_2!2600 lt!84687))))

(assert (=> d!17458 (= (reader!0 thiss!1379 (_2!2600 lt!84687)) lt!84922)))

(declare-fun lt!84925 () (_ BitVec 64))

(declare-fun b!54750 () Bool)

(declare-fun lt!84917 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2024 (_ BitVec 64)) BitStream!2024)

(assert (=> b!54750 (= e!36533 (= (_1!2601 lt!84922) (withMovedBitIndex!0 (_2!2601 lt!84922) (bvsub lt!84925 lt!84917))))))

(assert (=> b!54750 (or (= (bvand lt!84925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84925 lt!84917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54750 (= lt!84917 (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687))))))

(assert (=> b!54750 (= lt!84925 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)))))

(declare-fun b!54751 () Bool)

(declare-fun res!45676 () Bool)

(assert (=> b!54751 (=> (not res!45676) (not e!36533))))

(assert (=> b!54751 (= res!45676 (isPrefixOf!0 (_2!2601 lt!84922) (_2!2600 lt!84687)))))

(declare-fun b!54752 () Bool)

(declare-fun res!45678 () Bool)

(assert (=> b!54752 (=> (not res!45678) (not e!36533))))

(assert (=> b!54752 (= res!45678 (isPrefixOf!0 (_1!2601 lt!84922) thiss!1379))))

(declare-fun b!54753 () Bool)

(declare-fun lt!84913 () Unit!3767)

(assert (=> b!54753 (= e!36532 lt!84913)))

(declare-fun lt!84918 () (_ BitVec 64))

(assert (=> b!54753 (= lt!84918 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84915 () (_ BitVec 64))

(assert (=> b!54753 (= lt!84915 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2561 array!2561 (_ BitVec 64) (_ BitVec 64)) Unit!3767)

(assert (=> b!54753 (= lt!84913 (arrayBitRangesEqSymmetric!0 (buf!1525 thiss!1379) (buf!1525 (_2!2600 lt!84687)) lt!84918 lt!84915))))

(assert (=> b!54753 (arrayBitRangesEq!0 (buf!1525 (_2!2600 lt!84687)) (buf!1525 thiss!1379) lt!84918 lt!84915)))

(declare-fun b!54754 () Bool)

(declare-fun Unit!3785 () Unit!3767)

(assert (=> b!54754 (= e!36532 Unit!3785)))

(assert (= (and d!17458 c!3879) b!54753))

(assert (= (and d!17458 (not c!3879)) b!54754))

(assert (= (and d!17458 res!45677) b!54752))

(assert (= (and b!54752 res!45678) b!54751))

(assert (= (and b!54751 res!45676) b!54750))

(declare-fun m!86075 () Bool)

(assert (=> b!54751 m!86075))

(declare-fun m!86077 () Bool)

(assert (=> b!54750 m!86077))

(assert (=> b!54750 m!85965))

(assert (=> b!54750 m!85903))

(assert (=> d!17458 m!85917))

(declare-fun m!86079 () Bool)

(assert (=> d!17458 m!86079))

(declare-fun m!86081 () Bool)

(assert (=> d!17458 m!86081))

(declare-fun m!86083 () Bool)

(assert (=> d!17458 m!86083))

(declare-fun m!86085 () Bool)

(assert (=> d!17458 m!86085))

(assert (=> d!17458 m!85901))

(assert (=> d!17458 m!85899))

(declare-fun m!86087 () Bool)

(assert (=> d!17458 m!86087))

(declare-fun m!86089 () Bool)

(assert (=> d!17458 m!86089))

(declare-fun m!86091 () Bool)

(assert (=> d!17458 m!86091))

(declare-fun m!86093 () Bool)

(assert (=> d!17458 m!86093))

(declare-fun m!86095 () Bool)

(assert (=> b!54752 m!86095))

(assert (=> b!54753 m!85903))

(declare-fun m!86097 () Bool)

(assert (=> b!54753 m!86097))

(declare-fun m!86099 () Bool)

(assert (=> b!54753 m!86099))

(assert (=> b!54588 d!17458))

(declare-fun d!17460 () Bool)

(declare-fun res!45679 () Bool)

(declare-fun e!36535 () Bool)

(assert (=> d!17460 (=> (not res!45679) (not e!36535))))

(assert (=> d!17460 (= res!45679 (= (size!1168 (buf!1525 (_2!2600 lt!84687))) (size!1168 (buf!1525 (_2!2600 lt!84682)))))))

(assert (=> d!17460 (= (isPrefixOf!0 (_2!2600 lt!84687) (_2!2600 lt!84682)) e!36535)))

(declare-fun b!54755 () Bool)

(declare-fun res!45681 () Bool)

(assert (=> b!54755 (=> (not res!45681) (not e!36535))))

(assert (=> b!54755 (= res!45681 (bvsle (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687))) (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84682))) (currentByte!3101 (_2!2600 lt!84682)) (currentBit!3096 (_2!2600 lt!84682)))))))

(declare-fun b!54756 () Bool)

(declare-fun e!36534 () Bool)

(assert (=> b!54756 (= e!36535 e!36534)))

(declare-fun res!45680 () Bool)

(assert (=> b!54756 (=> res!45680 e!36534)))

(assert (=> b!54756 (= res!45680 (= (size!1168 (buf!1525 (_2!2600 lt!84687))) #b00000000000000000000000000000000))))

(declare-fun b!54757 () Bool)

(assert (=> b!54757 (= e!36534 (arrayBitRangesEq!0 (buf!1525 (_2!2600 lt!84687)) (buf!1525 (_2!2600 lt!84682)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687)))))))

(assert (= (and d!17460 res!45679) b!54755))

(assert (= (and b!54755 res!45681) b!54756))

(assert (= (and b!54756 (not res!45680)) b!54757))

(assert (=> b!54755 m!85965))

(declare-fun m!86101 () Bool)

(assert (=> b!54755 m!86101))

(assert (=> b!54757 m!85965))

(assert (=> b!54757 m!85965))

(declare-fun m!86103 () Bool)

(assert (=> b!54757 m!86103))

(assert (=> b!54588 d!17460))

(declare-fun d!17462 () Bool)

(declare-fun res!45682 () Bool)

(declare-fun e!36537 () Bool)

(assert (=> d!17462 (=> (not res!45682) (not e!36537))))

(assert (=> d!17462 (= res!45682 (= (size!1168 (buf!1525 thiss!1379)) (size!1168 (buf!1525 (_2!2600 lt!84682)))))))

(assert (=> d!17462 (= (isPrefixOf!0 thiss!1379 (_2!2600 lt!84682)) e!36537)))

(declare-fun b!54758 () Bool)

(declare-fun res!45684 () Bool)

(assert (=> b!54758 (=> (not res!45684) (not e!36537))))

(assert (=> b!54758 (= res!45684 (bvsle (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379)) (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84682))) (currentByte!3101 (_2!2600 lt!84682)) (currentBit!3096 (_2!2600 lt!84682)))))))

(declare-fun b!54759 () Bool)

(declare-fun e!36536 () Bool)

(assert (=> b!54759 (= e!36537 e!36536)))

(declare-fun res!45683 () Bool)

(assert (=> b!54759 (=> res!45683 e!36536)))

(assert (=> b!54759 (= res!45683 (= (size!1168 (buf!1525 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54760 () Bool)

(assert (=> b!54760 (= e!36536 (arrayBitRangesEq!0 (buf!1525 thiss!1379) (buf!1525 (_2!2600 lt!84682)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1168 (buf!1525 thiss!1379)) (currentByte!3101 thiss!1379) (currentBit!3096 thiss!1379))))))

(assert (= (and d!17462 res!45682) b!54758))

(assert (= (and b!54758 res!45684) b!54759))

(assert (= (and b!54759 (not res!45683)) b!54760))

(assert (=> b!54758 m!85903))

(assert (=> b!54758 m!86101))

(assert (=> b!54760 m!85903))

(assert (=> b!54760 m!85903))

(declare-fun m!86105 () Bool)

(assert (=> b!54760 m!86105))

(assert (=> b!54588 d!17462))

(declare-fun lt!85460 () tuple2!4978)

(declare-fun bm!697 () Bool)

(declare-fun call!700 () tuple2!4980)

(declare-fun c!3906 () Bool)

(assert (=> bm!697 (= call!700 (reader!0 (_2!2600 lt!84687) (ite c!3906 (_2!2600 lt!85460) (_2!2600 lt!84687))))))

(declare-fun b!54897 () Bool)

(declare-fun e!36599 () tuple2!4978)

(declare-fun Unit!3786 () Unit!3767)

(assert (=> b!54897 (= e!36599 (tuple2!4979 Unit!3786 (_2!2600 lt!84687)))))

(assert (=> b!54897 (= (size!1168 (buf!1525 (_2!2600 lt!84687))) (size!1168 (buf!1525 (_2!2600 lt!84687))))))

(declare-fun lt!85473 () Unit!3767)

(declare-fun Unit!3787 () Unit!3767)

(assert (=> b!54897 (= lt!85473 Unit!3787)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2024 array!2561 array!2561 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54897 (checkByteArrayBitContent!0 (_2!2600 lt!84687) srcBuffer!2 (_1!2609 (readBits!0 (_1!2601 call!700) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!54898 () Bool)

(declare-fun e!36598 () Bool)

(declare-fun lt!85467 () (_ BitVec 64))

(assert (=> b!54898 (= e!36598 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!84687)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) lt!85467))))

(declare-fun b!54899 () Bool)

(declare-fun res!45771 () Bool)

(declare-fun e!36597 () Bool)

(assert (=> b!54899 (=> (not res!45771) (not e!36597))))

(declare-fun lt!85461 () tuple2!4978)

(assert (=> b!54899 (= res!45771 (= (size!1168 (buf!1525 (_2!2600 lt!84687))) (size!1168 (buf!1525 (_2!2600 lt!85461)))))))

(declare-fun b!54900 () Bool)

(declare-fun res!45770 () Bool)

(assert (=> b!54900 (=> (not res!45770) (not e!36597))))

(assert (=> b!54900 (= res!45770 (isPrefixOf!0 (_2!2600 lt!84687) (_2!2600 lt!85461)))))

(declare-fun b!54901 () Bool)

(declare-fun lt!85471 () tuple2!4978)

(declare-fun Unit!3788 () Unit!3767)

(assert (=> b!54901 (= e!36599 (tuple2!4979 Unit!3788 (_2!2600 lt!85471)))))

(assert (=> b!54901 (= lt!85460 (appendBitFromByte!0 (_2!2600 lt!84687) (select (arr!1708 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!85446 () (_ BitVec 64))

(assert (=> b!54901 (= lt!85446 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85452 () (_ BitVec 64))

(assert (=> b!54901 (= lt!85452 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85439 () Unit!3767)

(assert (=> b!54901 (= lt!85439 (validateOffsetBitsIneqLemma!0 (_2!2600 lt!84687) (_2!2600 lt!85460) lt!85446 lt!85452))))

(assert (=> b!54901 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!85460)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!85460))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!85460))) (bvsub lt!85446 lt!85452))))

(declare-fun lt!85466 () Unit!3767)

(assert (=> b!54901 (= lt!85466 lt!85439)))

(declare-fun lt!85463 () tuple2!4980)

(assert (=> b!54901 (= lt!85463 call!700)))

(declare-fun lt!85458 () (_ BitVec 64))

(assert (=> b!54901 (= lt!85458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85472 () Unit!3767)

(assert (=> b!54901 (= lt!85472 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2600 lt!84687) (buf!1525 (_2!2600 lt!85460)) lt!85458))))

(assert (=> b!54901 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!85460)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) lt!85458)))

(declare-fun lt!85437 () Unit!3767)

(assert (=> b!54901 (= lt!85437 lt!85472)))

(assert (=> b!54901 (= (head!406 (byteArrayBitContentToList!0 (_2!2600 lt!85460) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!406 (bitStreamReadBitsIntoList!0 (_2!2600 lt!85460) (_1!2601 lt!85463) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85441 () Unit!3767)

(declare-fun Unit!3789 () Unit!3767)

(assert (=> b!54901 (= lt!85441 Unit!3789)))

(assert (=> b!54901 (= lt!85471 (appendBitsMSBFirstLoop!0 (_2!2600 lt!85460) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!85470 () Unit!3767)

(assert (=> b!54901 (= lt!85470 (lemmaIsPrefixTransitive!0 (_2!2600 lt!84687) (_2!2600 lt!85460) (_2!2600 lt!85471)))))

(assert (=> b!54901 (isPrefixOf!0 (_2!2600 lt!84687) (_2!2600 lt!85471))))

(declare-fun lt!85465 () Unit!3767)

(assert (=> b!54901 (= lt!85465 lt!85470)))

(assert (=> b!54901 (= (size!1168 (buf!1525 (_2!2600 lt!85471))) (size!1168 (buf!1525 (_2!2600 lt!84687))))))

(declare-fun lt!85477 () Unit!3767)

(declare-fun Unit!3790 () Unit!3767)

(assert (=> b!54901 (= lt!85477 Unit!3790)))

(assert (=> b!54901 (= (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!85471))) (currentByte!3101 (_2!2600 lt!85471)) (currentBit!3096 (_2!2600 lt!85471))) (bvsub (bvadd (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85447 () Unit!3767)

(declare-fun Unit!3791 () Unit!3767)

(assert (=> b!54901 (= lt!85447 Unit!3791)))

(assert (=> b!54901 (= (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!85471))) (currentByte!3101 (_2!2600 lt!85471)) (currentBit!3096 (_2!2600 lt!85471))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!85460))) (currentByte!3101 (_2!2600 lt!85460)) (currentBit!3096 (_2!2600 lt!85460))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85445 () Unit!3767)

(declare-fun Unit!3792 () Unit!3767)

(assert (=> b!54901 (= lt!85445 Unit!3792)))

(declare-fun lt!85440 () tuple2!4980)

(assert (=> b!54901 (= lt!85440 (reader!0 (_2!2600 lt!84687) (_2!2600 lt!85471)))))

(declare-fun lt!85451 () (_ BitVec 64))

(assert (=> b!54901 (= lt!85451 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85454 () Unit!3767)

(assert (=> b!54901 (= lt!85454 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2600 lt!84687) (buf!1525 (_2!2600 lt!85471)) lt!85451))))

(assert (=> b!54901 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!85471)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) lt!85451)))

(declare-fun lt!85468 () Unit!3767)

(assert (=> b!54901 (= lt!85468 lt!85454)))

(declare-fun lt!85444 () tuple2!4980)

(assert (=> b!54901 (= lt!85444 (reader!0 (_2!2600 lt!85460) (_2!2600 lt!85471)))))

(declare-fun lt!85475 () (_ BitVec 64))

(assert (=> b!54901 (= lt!85475 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85453 () Unit!3767)

(assert (=> b!54901 (= lt!85453 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2600 lt!85460) (buf!1525 (_2!2600 lt!85471)) lt!85475))))

(assert (=> b!54901 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!85471)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!85460))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!85460))) lt!85475)))

(declare-fun lt!85455 () Unit!3767)

(assert (=> b!54901 (= lt!85455 lt!85453)))

(declare-fun lt!85442 () List!587)

(assert (=> b!54901 (= lt!85442 (byteArrayBitContentToList!0 (_2!2600 lt!85471) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85459 () List!587)

(assert (=> b!54901 (= lt!85459 (byteArrayBitContentToList!0 (_2!2600 lt!85471) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85438 () List!587)

(assert (=> b!54901 (= lt!85438 (bitStreamReadBitsIntoList!0 (_2!2600 lt!85471) (_1!2601 lt!85440) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85474 () List!587)

(assert (=> b!54901 (= lt!85474 (bitStreamReadBitsIntoList!0 (_2!2600 lt!85471) (_1!2601 lt!85444) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85457 () (_ BitVec 64))

(assert (=> b!54901 (= lt!85457 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85476 () Unit!3767)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2024 BitStream!2024 BitStream!2024 BitStream!2024 (_ BitVec 64) List!587) Unit!3767)

(assert (=> b!54901 (= lt!85476 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2600 lt!85471) (_2!2600 lt!85471) (_1!2601 lt!85440) (_1!2601 lt!85444) lt!85457 lt!85438))))

(declare-fun tail!260 (List!587) List!587)

(assert (=> b!54901 (= (bitStreamReadBitsIntoList!0 (_2!2600 lt!85471) (_1!2601 lt!85444) (bvsub lt!85457 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!260 lt!85438))))

(declare-fun lt!85449 () Unit!3767)

(assert (=> b!54901 (= lt!85449 lt!85476)))

(declare-fun lt!85436 () (_ BitVec 64))

(declare-fun lt!85464 () Unit!3767)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2561 array!2561 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3767)

(assert (=> b!54901 (= lt!85464 (arrayBitRangesEqImpliesEq!0 (buf!1525 (_2!2600 lt!85460)) (buf!1525 (_2!2600 lt!85471)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!85436 (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!85460))) (currentByte!3101 (_2!2600 lt!85460)) (currentBit!3096 (_2!2600 lt!85460)))))))

(declare-fun bitAt!0 (array!2561 (_ BitVec 64)) Bool)

(assert (=> b!54901 (= (bitAt!0 (buf!1525 (_2!2600 lt!85460)) lt!85436) (bitAt!0 (buf!1525 (_2!2600 lt!85471)) lt!85436))))

(declare-fun lt!85448 () Unit!3767)

(assert (=> b!54901 (= lt!85448 lt!85464)))

(declare-fun d!17464 () Bool)

(assert (=> d!17464 e!36597))

(declare-fun res!45772 () Bool)

(assert (=> d!17464 (=> (not res!45772) (not e!36597))))

(declare-fun lt!85450 () (_ BitVec 64))

(assert (=> d!17464 (= res!45772 (= (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!85461))) (currentByte!3101 (_2!2600 lt!85461)) (currentBit!3096 (_2!2600 lt!85461))) (bvsub lt!85450 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17464 (or (= (bvand lt!85450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85450 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85469 () (_ BitVec 64))

(assert (=> d!17464 (= lt!85450 (bvadd lt!85469 to!314))))

(assert (=> d!17464 (or (not (= (bvand lt!85469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!85469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!85469 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17464 (= lt!85469 (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687))))))

(assert (=> d!17464 (= lt!85461 e!36599)))

(assert (=> d!17464 (= c!3906 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!85462 () Unit!3767)

(declare-fun lt!85443 () Unit!3767)

(assert (=> d!17464 (= lt!85462 lt!85443)))

(assert (=> d!17464 (isPrefixOf!0 (_2!2600 lt!84687) (_2!2600 lt!84687))))

(assert (=> d!17464 (= lt!85443 (lemmaIsPrefixRefl!0 (_2!2600 lt!84687)))))

(assert (=> d!17464 (= lt!85436 (bitIndex!0 (size!1168 (buf!1525 (_2!2600 lt!84687))) (currentByte!3101 (_2!2600 lt!84687)) (currentBit!3096 (_2!2600 lt!84687))))))

(assert (=> d!17464 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17464 (= (appendBitsMSBFirstLoop!0 (_2!2600 lt!84687) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!85461)))

(declare-fun b!54902 () Bool)

(declare-fun lt!85456 () tuple2!4980)

(assert (=> b!54902 (= e!36597 (= (bitStreamReadBitsIntoList!0 (_2!2600 lt!85461) (_1!2601 lt!85456) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2600 lt!85461) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!54902 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54902 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85435 () Unit!3767)

(declare-fun lt!85434 () Unit!3767)

(assert (=> b!54902 (= lt!85435 lt!85434)))

(assert (=> b!54902 (validate_offset_bits!1 ((_ sign_extend 32) (size!1168 (buf!1525 (_2!2600 lt!85461)))) ((_ sign_extend 32) (currentByte!3101 (_2!2600 lt!84687))) ((_ sign_extend 32) (currentBit!3096 (_2!2600 lt!84687))) lt!85467)))

(assert (=> b!54902 (= lt!85434 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2600 lt!84687) (buf!1525 (_2!2600 lt!85461)) lt!85467))))

(assert (=> b!54902 e!36598))

(declare-fun res!45769 () Bool)

(assert (=> b!54902 (=> (not res!45769) (not e!36598))))

(assert (=> b!54902 (= res!45769 (and (= (size!1168 (buf!1525 (_2!2600 lt!84687))) (size!1168 (buf!1525 (_2!2600 lt!85461)))) (bvsge lt!85467 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54902 (= lt!85467 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!54902 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54902 (= lt!85456 (reader!0 (_2!2600 lt!84687) (_2!2600 lt!85461)))))

(declare-fun b!54903 () Bool)

(declare-fun res!45773 () Bool)

(assert (=> b!54903 (=> (not res!45773) (not e!36597))))

(assert (=> b!54903 (= res!45773 (invariant!0 (currentBit!3096 (_2!2600 lt!85461)) (currentByte!3101 (_2!2600 lt!85461)) (size!1168 (buf!1525 (_2!2600 lt!85461)))))))

(declare-fun b!54904 () Bool)

(declare-fun res!45774 () Bool)

(assert (=> b!54904 (=> (not res!45774) (not e!36597))))

(assert (=> b!54904 (= res!45774 (= (size!1168 (buf!1525 (_2!2600 lt!85461))) (size!1168 (buf!1525 (_2!2600 lt!84687)))))))

(assert (= (and d!17464 c!3906) b!54901))

(assert (= (and d!17464 (not c!3906)) b!54897))

(assert (= (or b!54901 b!54897) bm!697))

(assert (= (and d!17464 res!45772) b!54903))

(assert (= (and b!54903 res!45773) b!54899))

(assert (= (and b!54899 res!45771) b!54900))

(assert (= (and b!54900 res!45770) b!54904))

(assert (= (and b!54904 res!45774) b!54902))

(assert (= (and b!54902 res!45769) b!54898))

(declare-fun m!86365 () Bool)

(assert (=> b!54898 m!86365))

(declare-fun m!86367 () Bool)

(assert (=> b!54901 m!86367))

(declare-fun m!86369 () Bool)

(assert (=> b!54901 m!86369))

(declare-fun m!86371 () Bool)

(assert (=> b!54901 m!86371))

(declare-fun m!86373 () Bool)

(assert (=> b!54901 m!86373))

(declare-fun m!86375 () Bool)

(assert (=> b!54901 m!86375))

(declare-fun m!86377 () Bool)

(assert (=> b!54901 m!86377))

(declare-fun m!86379 () Bool)

(assert (=> b!54901 m!86379))

(declare-fun m!86381 () Bool)

(assert (=> b!54901 m!86381))

(declare-fun m!86383 () Bool)

(assert (=> b!54901 m!86383))

(declare-fun m!86385 () Bool)

(assert (=> b!54901 m!86385))

(declare-fun m!86387 () Bool)

(assert (=> b!54901 m!86387))

(declare-fun m!86389 () Bool)

(assert (=> b!54901 m!86389))

(declare-fun m!86391 () Bool)

(assert (=> b!54901 m!86391))

(declare-fun m!86393 () Bool)

(assert (=> b!54901 m!86393))

(declare-fun m!86395 () Bool)

(assert (=> b!54901 m!86395))

(declare-fun m!86397 () Bool)

(assert (=> b!54901 m!86397))

(declare-fun m!86399 () Bool)

(assert (=> b!54901 m!86399))

(declare-fun m!86401 () Bool)

(assert (=> b!54901 m!86401))

(declare-fun m!86403 () Bool)

(assert (=> b!54901 m!86403))

(declare-fun m!86405 () Bool)

(assert (=> b!54901 m!86405))

(declare-fun m!86407 () Bool)

(assert (=> b!54901 m!86407))

(declare-fun m!86409 () Bool)

(assert (=> b!54901 m!86409))

(assert (=> b!54901 m!86381))

(declare-fun m!86411 () Bool)

(assert (=> b!54901 m!86411))

(declare-fun m!86413 () Bool)

(assert (=> b!54901 m!86413))

(declare-fun m!86415 () Bool)

(assert (=> b!54901 m!86415))

(declare-fun m!86417 () Bool)

(assert (=> b!54901 m!86417))

(assert (=> b!54901 m!85965))

(declare-fun m!86419 () Bool)

(assert (=> b!54901 m!86419))

(declare-fun m!86421 () Bool)

(assert (=> b!54901 m!86421))

(assert (=> b!54901 m!86387))

(declare-fun m!86423 () Bool)

(assert (=> b!54901 m!86423))

(assert (=> b!54901 m!86417))

(declare-fun m!86425 () Bool)

(assert (=> b!54901 m!86425))

(assert (=> b!54901 m!86419))

(declare-fun m!86427 () Bool)

(assert (=> b!54901 m!86427))

(declare-fun m!86429 () Bool)

(assert (=> b!54897 m!86429))

(declare-fun m!86431 () Bool)

(assert (=> b!54897 m!86431))

(declare-fun m!86433 () Bool)

(assert (=> d!17464 m!86433))

(assert (=> d!17464 m!85965))

(assert (=> d!17464 m!86091))

(assert (=> d!17464 m!86081))

(declare-fun m!86435 () Bool)

(assert (=> b!54903 m!86435))

(declare-fun m!86437 () Bool)

(assert (=> b!54900 m!86437))

(declare-fun m!86439 () Bool)

(assert (=> bm!697 m!86439))

(declare-fun m!86441 () Bool)

(assert (=> b!54902 m!86441))

(declare-fun m!86443 () Bool)

(assert (=> b!54902 m!86443))

(declare-fun m!86445 () Bool)

(assert (=> b!54902 m!86445))

(declare-fun m!86447 () Bool)

(assert (=> b!54902 m!86447))

(declare-fun m!86449 () Bool)

(assert (=> b!54902 m!86449))

(assert (=> b!54588 d!17464))

(declare-fun d!17510 () Bool)

(assert (=> d!17510 (isPrefixOf!0 thiss!1379 (_2!2600 lt!84682))))

(declare-fun lt!85489 () Unit!3767)

(declare-fun choose!30 (BitStream!2024 BitStream!2024 BitStream!2024) Unit!3767)

(assert (=> d!17510 (= lt!85489 (choose!30 thiss!1379 (_2!2600 lt!84687) (_2!2600 lt!84682)))))

(assert (=> d!17510 (isPrefixOf!0 thiss!1379 (_2!2600 lt!84687))))

(assert (=> d!17510 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2600 lt!84687) (_2!2600 lt!84682)) lt!85489)))

(declare-fun bs!4406 () Bool)

(assert (= bs!4406 d!17510))

(assert (=> bs!4406 m!85893))

(declare-fun m!86459 () Bool)

(assert (=> bs!4406 m!86459))

(assert (=> bs!4406 m!85917))

(assert (=> b!54588 d!17510))

(push 1)

(assert (not d!17464))

(assert (not b!54755))

(assert (not b!54639))

(assert (not b!54628))

(assert (not b!54733))

(assert (not b!54727))

(assert (not b!54898))

(assert (not b!54725))

(assert (not b!54903))

(assert (not d!17448))

(assert (not b!54638))

(assert (not b!54760))

(assert (not b!54731))

(assert (not b!54750))

(assert (not d!17422))

(assert (not b!54758))

(assert (not b!54652))

(assert (not bm!697))

(assert (not d!17446))

(assert (not d!17454))

(assert (not b!54723))

(assert (not b!54757))

(assert (not b!54751))

(assert (not b!54728))

(assert (not b!54752))

(assert (not b!54726))

(assert (not b!54753))

(assert (not b!54640))

(assert (not d!17402))

(assert (not d!17420))

(assert (not d!17418))

(assert (not b!54724))

(assert (not d!17510))

(assert (not b!54729))

(assert (not b!54647))

(assert (not b!54649))

(assert (not d!17458))

(assert (not b!54902))

(assert (not b!54901))

(assert (not d!17450))

(assert (not b!54900))

(assert (not b!54730))

(assert (not b!54897))

(assert (not d!17456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

