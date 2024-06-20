; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6256 () Bool)

(assert start!6256)

(declare-fun b!29440 () Bool)

(declare-fun res!25414 () Bool)

(declare-fun e!19718 () Bool)

(assert (=> b!29440 (=> res!25414 e!19718)))

(declare-datatypes ((array!1771 0))(
  ( (array!1772 (arr!1233 (Array (_ BitVec 32) (_ BitVec 8))) (size!770 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1362 0))(
  ( (BitStream!1363 (buf!1098 array!1771) (currentByte!2435 (_ BitVec 32)) (currentBit!2430 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2285 0))(
  ( (Unit!2286) )
))
(declare-datatypes ((tuple2!3138 0))(
  ( (tuple2!3139 (_1!1656 Unit!2285) (_2!1656 BitStream!1362)) )
))
(declare-fun lt!42145 () tuple2!3138)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!29440 (= res!25414 (not (invariant!0 (currentBit!2430 (_2!1656 lt!42145)) (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42145))))))))

(declare-fun b!29441 () Bool)

(declare-fun res!25426 () Bool)

(declare-fun e!19719 () Bool)

(assert (=> b!29441 (=> res!25426 e!19719)))

(declare-fun lt!42147 () tuple2!3138)

(assert (=> b!29441 (= res!25426 (not (invariant!0 (currentBit!2430 (_2!1656 lt!42147)) (currentByte!2435 (_2!1656 lt!42147)) (size!770 (buf!1098 (_2!1656 lt!42147))))))))

(declare-fun b!29442 () Bool)

(declare-fun res!25416 () Bool)

(declare-fun e!19715 () Bool)

(assert (=> b!29442 (=> res!25416 e!19715)))

(declare-datatypes ((List!382 0))(
  ( (Nil!379) (Cons!378 (h!497 Bool) (t!1132 List!382)) )
))
(declare-fun lt!42140 () List!382)

(declare-fun length!108 (List!382) Int)

(assert (=> b!29442 (= res!25416 (<= (length!108 lt!42140) 0))))

(declare-fun b!29443 () Bool)

(assert (=> b!29443 (= e!19719 e!19718)))

(declare-fun res!25419 () Bool)

(assert (=> b!29443 (=> res!25419 e!19718)))

(assert (=> b!29443 (= res!25419 (not (= (size!770 (buf!1098 (_2!1656 lt!42145))) (size!770 (buf!1098 (_2!1656 lt!42147))))))))

(declare-fun e!19723 () Bool)

(assert (=> b!29443 e!19723))

(declare-fun res!25415 () Bool)

(assert (=> b!29443 (=> (not res!25415) (not e!19723))))

(declare-fun thiss!1379 () BitStream!1362)

(assert (=> b!29443 (= res!25415 (= (size!770 (buf!1098 (_2!1656 lt!42147))) (size!770 (buf!1098 thiss!1379))))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!29444 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!42144 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!29444 (= e!19723 (= lt!42144 (bvsub (bvsub (bvadd (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun srcBuffer!2 () array!1771)

(declare-fun b!29445 () Bool)

(declare-fun e!19724 () Bool)

(declare-datatypes ((tuple2!3140 0))(
  ( (tuple2!3141 (_1!1657 BitStream!1362) (_2!1657 BitStream!1362)) )
))
(declare-fun lt!42151 () tuple2!3140)

(declare-fun head!219 (List!382) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1362 array!1771 (_ BitVec 64) (_ BitVec 64)) List!382)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1362 BitStream!1362 (_ BitVec 64)) List!382)

(assert (=> b!29445 (= e!19724 (= (head!219 (byteArrayBitContentToList!0 (_2!1656 lt!42145) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!219 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42145) (_1!1657 lt!42151) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!29446 () Bool)

(declare-fun lt!42150 () List!382)

(declare-fun lt!42134 () List!382)

(declare-fun lt!42148 () (_ BitVec 64))

(declare-fun lt!42146 () tuple2!3140)

(assert (=> b!29446 (= e!19715 (or (not (= lt!42134 lt!42150)) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42148) (bvslt lt!42148 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!770 (buf!1098 (_1!1657 lt!42146)))))))))))

(assert (=> b!29446 (= lt!42150 lt!42134)))

(declare-fun tail!99 (List!382) List!382)

(assert (=> b!29446 (= lt!42134 (tail!99 lt!42140))))

(declare-fun lt!42142 () tuple2!3140)

(declare-fun lt!42138 () Unit!2285)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1362 BitStream!1362 BitStream!1362 BitStream!1362 (_ BitVec 64) List!382) Unit!2285)

(assert (=> b!29446 (= lt!42138 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1656 lt!42147) (_2!1656 lt!42147) (_1!1657 lt!42142) (_1!1657 lt!42146) (bvsub to!314 i!635) lt!42140))))

(declare-fun b!29447 () Bool)

(declare-fun e!19720 () Bool)

(declare-fun e!19717 () Bool)

(assert (=> b!29447 (= e!19720 (not e!19717))))

(declare-fun res!25423 () Bool)

(assert (=> b!29447 (=> res!25423 e!19717)))

(assert (=> b!29447 (= res!25423 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1362 BitStream!1362) Bool)

(assert (=> b!29447 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!42149 () Unit!2285)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1362) Unit!2285)

(assert (=> b!29447 (= lt!42149 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!29447 (= lt!42148 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(declare-fun b!29448 () Bool)

(declare-fun e!19726 () Bool)

(assert (=> b!29448 (= e!19726 e!19719)))

(declare-fun res!25417 () Bool)

(assert (=> b!29448 (=> res!25417 e!19719)))

(assert (=> b!29448 (= res!25417 (not (= lt!42144 (bvsub (bvadd lt!42148 to!314) i!635))))))

(assert (=> b!29448 (= lt!42144 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42147))) (currentByte!2435 (_2!1656 lt!42147)) (currentBit!2430 (_2!1656 lt!42147))))))

(declare-fun b!29450 () Bool)

(declare-fun e!19721 () Bool)

(assert (=> b!29450 (= e!19717 e!19721)))

(declare-fun res!25424 () Bool)

(assert (=> b!29450 (=> res!25424 e!19721)))

(assert (=> b!29450 (= res!25424 (not (isPrefixOf!0 thiss!1379 (_2!1656 lt!42145))))))

(declare-fun lt!42135 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29450 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42135)))

(assert (=> b!29450 (= lt!42135 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42141 () Unit!2285)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1362 BitStream!1362 (_ BitVec 64) (_ BitVec 64)) Unit!2285)

(assert (=> b!29450 (= lt!42141 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1656 lt!42145) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1362 (_ BitVec 8) (_ BitVec 32)) tuple2!3138)

(assert (=> b!29450 (= lt!42145 (appendBitFromByte!0 thiss!1379 (select (arr!1233 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!29451 () Bool)

(declare-fun res!25427 () Bool)

(assert (=> b!29451 (=> (not res!25427) (not e!19720))))

(assert (=> b!29451 (= res!25427 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 thiss!1379))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!29452 () Bool)

(assert (=> b!29452 (= e!19718 e!19715)))

(declare-fun res!25421 () Bool)

(assert (=> b!29452 (=> res!25421 e!19715)))

(assert (=> b!29452 (= res!25421 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!29452 (= lt!42150 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_1!1657 lt!42146) lt!42135))))

(assert (=> b!29452 (= lt!42140 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_1!1657 lt!42142) (bvsub to!314 i!635)))))

(assert (=> b!29452 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42135)))

(declare-fun lt!42143 () Unit!2285)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1362 array!1771 (_ BitVec 64)) Unit!2285)

(assert (=> b!29452 (= lt!42143 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1656 lt!42145) (buf!1098 (_2!1656 lt!42147)) lt!42135))))

(declare-fun reader!0 (BitStream!1362 BitStream!1362) tuple2!3140)

(assert (=> b!29452 (= lt!42146 (reader!0 (_2!1656 lt!42145) (_2!1656 lt!42147)))))

(assert (=> b!29452 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!42136 () Unit!2285)

(assert (=> b!29452 (= lt!42136 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1098 (_2!1656 lt!42147)) (bvsub to!314 i!635)))))

(assert (=> b!29452 (= lt!42142 (reader!0 thiss!1379 (_2!1656 lt!42147)))))

(declare-fun b!29453 () Bool)

(declare-fun e!19716 () Bool)

(declare-fun array_inv!734 (array!1771) Bool)

(assert (=> b!29453 (= e!19716 (array_inv!734 (buf!1098 thiss!1379)))))

(declare-fun b!29454 () Bool)

(declare-fun res!25422 () Bool)

(assert (=> b!29454 (=> res!25422 e!19719)))

(assert (=> b!29454 (= res!25422 (not (= (size!770 (buf!1098 thiss!1379)) (size!770 (buf!1098 (_2!1656 lt!42147))))))))

(declare-fun b!29455 () Bool)

(declare-fun res!25418 () Bool)

(assert (=> b!29455 (=> res!25418 e!19718)))

(assert (=> b!29455 (= res!25418 (not (invariant!0 (currentBit!2430 (_2!1656 lt!42145)) (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42147))))))))

(declare-fun res!25425 () Bool)

(assert (=> start!6256 (=> (not res!25425) (not e!19720))))

(assert (=> start!6256 (= res!25425 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!770 srcBuffer!2))))))))

(assert (=> start!6256 e!19720))

(assert (=> start!6256 true))

(assert (=> start!6256 (array_inv!734 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1362) Bool)

(assert (=> start!6256 (and (inv!12 thiss!1379) e!19716)))

(declare-fun b!29449 () Bool)

(assert (=> b!29449 (= e!19721 e!19726)))

(declare-fun res!25420 () Bool)

(assert (=> b!29449 (=> res!25420 e!19726)))

(assert (=> b!29449 (= res!25420 (not (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42147))))))

(assert (=> b!29449 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42147))))

(declare-fun lt!42137 () Unit!2285)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1362 BitStream!1362 BitStream!1362) Unit!2285)

(assert (=> b!29449 (= lt!42137 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1656 lt!42145) (_2!1656 lt!42147)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1362 array!1771 (_ BitVec 64) (_ BitVec 64)) tuple2!3138)

(assert (=> b!29449 (= lt!42147 (appendBitsMSBFirstLoop!0 (_2!1656 lt!42145) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!29449 e!19724))

(declare-fun res!25428 () Bool)

(assert (=> b!29449 (=> (not res!25428) (not e!19724))))

(assert (=> b!29449 (= res!25428 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42139 () Unit!2285)

(assert (=> b!29449 (= lt!42139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1098 (_2!1656 lt!42145)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29449 (= lt!42151 (reader!0 thiss!1379 (_2!1656 lt!42145)))))

(assert (= (and start!6256 res!25425) b!29451))

(assert (= (and b!29451 res!25427) b!29447))

(assert (= (and b!29447 (not res!25423)) b!29450))

(assert (= (and b!29450 (not res!25424)) b!29449))

(assert (= (and b!29449 res!25428) b!29445))

(assert (= (and b!29449 (not res!25420)) b!29448))

(assert (= (and b!29448 (not res!25417)) b!29441))

(assert (= (and b!29441 (not res!25426)) b!29454))

(assert (= (and b!29454 (not res!25422)) b!29443))

(assert (= (and b!29443 res!25415) b!29444))

(assert (= (and b!29443 (not res!25419)) b!29440))

(assert (= (and b!29440 (not res!25414)) b!29455))

(assert (= (and b!29455 (not res!25418)) b!29452))

(assert (= (and b!29452 (not res!25421)) b!29442))

(assert (= (and b!29442 (not res!25416)) b!29446))

(assert (= start!6256 b!29453))

(declare-fun m!42615 () Bool)

(assert (=> b!29440 m!42615))

(declare-fun m!42617 () Bool)

(assert (=> b!29449 m!42617))

(declare-fun m!42619 () Bool)

(assert (=> b!29449 m!42619))

(declare-fun m!42621 () Bool)

(assert (=> b!29449 m!42621))

(declare-fun m!42623 () Bool)

(assert (=> b!29449 m!42623))

(declare-fun m!42625 () Bool)

(assert (=> b!29449 m!42625))

(declare-fun m!42627 () Bool)

(assert (=> b!29449 m!42627))

(declare-fun m!42629 () Bool)

(assert (=> b!29449 m!42629))

(declare-fun m!42631 () Bool)

(assert (=> b!29446 m!42631))

(declare-fun m!42633 () Bool)

(assert (=> b!29446 m!42633))

(declare-fun m!42635 () Bool)

(assert (=> start!6256 m!42635))

(declare-fun m!42637 () Bool)

(assert (=> start!6256 m!42637))

(declare-fun m!42639 () Bool)

(assert (=> b!29441 m!42639))

(declare-fun m!42641 () Bool)

(assert (=> b!29455 m!42641))

(declare-fun m!42643 () Bool)

(assert (=> b!29447 m!42643))

(declare-fun m!42645 () Bool)

(assert (=> b!29447 m!42645))

(declare-fun m!42647 () Bool)

(assert (=> b!29447 m!42647))

(declare-fun m!42649 () Bool)

(assert (=> b!29445 m!42649))

(assert (=> b!29445 m!42649))

(declare-fun m!42651 () Bool)

(assert (=> b!29445 m!42651))

(declare-fun m!42653 () Bool)

(assert (=> b!29445 m!42653))

(assert (=> b!29445 m!42653))

(declare-fun m!42655 () Bool)

(assert (=> b!29445 m!42655))

(declare-fun m!42657 () Bool)

(assert (=> b!29448 m!42657))

(declare-fun m!42659 () Bool)

(assert (=> b!29453 m!42659))

(declare-fun m!42661 () Bool)

(assert (=> b!29442 m!42661))

(declare-fun m!42663 () Bool)

(assert (=> b!29444 m!42663))

(declare-fun m!42665 () Bool)

(assert (=> b!29452 m!42665))

(declare-fun m!42667 () Bool)

(assert (=> b!29452 m!42667))

(declare-fun m!42669 () Bool)

(assert (=> b!29452 m!42669))

(declare-fun m!42671 () Bool)

(assert (=> b!29452 m!42671))

(declare-fun m!42673 () Bool)

(assert (=> b!29452 m!42673))

(declare-fun m!42675 () Bool)

(assert (=> b!29452 m!42675))

(declare-fun m!42677 () Bool)

(assert (=> b!29452 m!42677))

(declare-fun m!42679 () Bool)

(assert (=> b!29452 m!42679))

(declare-fun m!42681 () Bool)

(assert (=> b!29450 m!42681))

(declare-fun m!42683 () Bool)

(assert (=> b!29450 m!42683))

(declare-fun m!42685 () Bool)

(assert (=> b!29450 m!42685))

(declare-fun m!42687 () Bool)

(assert (=> b!29450 m!42687))

(declare-fun m!42689 () Bool)

(assert (=> b!29450 m!42689))

(assert (=> b!29450 m!42685))

(declare-fun m!42691 () Bool)

(assert (=> b!29451 m!42691))

(check-sat (not b!29455) (not b!29441) (not b!29452) (not b!29448) (not b!29449) (not b!29445) (not b!29442) (not b!29446) (not b!29453) (not b!29444) (not b!29447) (not start!6256) (not b!29440) (not b!29450) (not b!29451))
(check-sat)
(get-model)

(declare-fun d!8340 () Bool)

(assert (=> d!8340 (= (invariant!0 (currentBit!2430 (_2!1656 lt!42145)) (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42147)))) (and (bvsge (currentBit!2430 (_2!1656 lt!42145)) #b00000000000000000000000000000000) (bvslt (currentBit!2430 (_2!1656 lt!42145)) #b00000000000000000000000000001000) (bvsge (currentByte!2435 (_2!1656 lt!42145)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42147)))) (and (= (currentBit!2430 (_2!1656 lt!42145)) #b00000000000000000000000000000000) (= (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42147))))))))))

(assert (=> b!29455 d!8340))

(declare-fun d!8342 () Bool)

(declare-fun e!19765 () Bool)

(assert (=> d!8342 e!19765))

(declare-fun res!25479 () Bool)

(assert (=> d!8342 (=> (not res!25479) (not e!19765))))

(declare-fun lt!42220 () (_ BitVec 64))

(declare-fun lt!42218 () (_ BitVec 64))

(declare-fun lt!42221 () (_ BitVec 64))

(assert (=> d!8342 (= res!25479 (= lt!42218 (bvsub lt!42221 lt!42220)))))

(assert (=> d!8342 (or (= (bvand lt!42221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42221 lt!42220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8342 (= lt!42220 (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145)))))))

(declare-fun lt!42219 () (_ BitVec 64))

(declare-fun lt!42222 () (_ BitVec 64))

(assert (=> d!8342 (= lt!42221 (bvmul lt!42219 lt!42222))))

(assert (=> d!8342 (or (= lt!42219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42222 (bvsdiv (bvmul lt!42219 lt!42222) lt!42219)))))

(assert (=> d!8342 (= lt!42222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8342 (= lt!42219 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))))))

(assert (=> d!8342 (= lt!42218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145)))))))

(assert (=> d!8342 (invariant!0 (currentBit!2430 (_2!1656 lt!42145)) (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42145))))))

(assert (=> d!8342 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))) lt!42218)))

(declare-fun b!29508 () Bool)

(declare-fun res!25478 () Bool)

(assert (=> b!29508 (=> (not res!25478) (not e!19765))))

(assert (=> b!29508 (= res!25478 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42218))))

(declare-fun b!29509 () Bool)

(declare-fun lt!42223 () (_ BitVec 64))

(assert (=> b!29509 (= e!19765 (bvsle lt!42218 (bvmul lt!42223 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29509 (or (= lt!42223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42223)))))

(assert (=> b!29509 (= lt!42223 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))))))

(assert (= (and d!8342 res!25479) b!29508))

(assert (= (and b!29508 res!25478) b!29509))

(declare-fun m!42771 () Bool)

(assert (=> d!8342 m!42771))

(assert (=> d!8342 m!42615))

(assert (=> b!29444 d!8342))

(declare-fun d!8344 () Bool)

(assert (=> d!8344 (= (tail!99 lt!42140) (t!1132 lt!42140))))

(assert (=> b!29446 d!8344))

(declare-fun d!8346 () Bool)

(declare-fun e!19768 () Bool)

(assert (=> d!8346 e!19768))

(declare-fun res!25482 () Bool)

(assert (=> d!8346 (=> (not res!25482) (not e!19768))))

(declare-fun lt!42229 () (_ BitVec 64))

(assert (=> d!8346 (= res!25482 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!42229) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8346 (= lt!42229 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42228 () Unit!2285)

(declare-fun choose!42 (BitStream!1362 BitStream!1362 BitStream!1362 BitStream!1362 (_ BitVec 64) List!382) Unit!2285)

(assert (=> d!8346 (= lt!42228 (choose!42 (_2!1656 lt!42147) (_2!1656 lt!42147) (_1!1657 lt!42142) (_1!1657 lt!42146) (bvsub to!314 i!635) lt!42140))))

(assert (=> d!8346 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8346 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1656 lt!42147) (_2!1656 lt!42147) (_1!1657 lt!42142) (_1!1657 lt!42146) (bvsub to!314 i!635) lt!42140) lt!42228)))

(declare-fun b!29512 () Bool)

(assert (=> b!29512 (= e!19768 (= (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_1!1657 lt!42146) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!99 lt!42140)))))

(assert (= (and d!8346 res!25482) b!29512))

(declare-fun m!42773 () Bool)

(assert (=> d!8346 m!42773))

(declare-fun m!42775 () Bool)

(assert (=> b!29512 m!42775))

(assert (=> b!29512 m!42631))

(assert (=> b!29446 d!8346))

(declare-fun d!8348 () Bool)

(assert (=> d!8348 (= (head!219 (byteArrayBitContentToList!0 (_2!1656 lt!42145) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!497 (byteArrayBitContentToList!0 (_2!1656 lt!42145) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29445 d!8348))

(declare-fun d!8350 () Bool)

(declare-fun c!1905 () Bool)

(assert (=> d!8350 (= c!1905 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19771 () List!382)

(assert (=> d!8350 (= (byteArrayBitContentToList!0 (_2!1656 lt!42145) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19771)))

(declare-fun b!29517 () Bool)

(assert (=> b!29517 (= e!19771 Nil!379)))

(declare-fun b!29518 () Bool)

(assert (=> b!29518 (= e!19771 (Cons!378 (not (= (bvand ((_ sign_extend 24) (select (arr!1233 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1656 lt!42145) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8350 c!1905) b!29517))

(assert (= (and d!8350 (not c!1905)) b!29518))

(assert (=> b!29518 m!42685))

(declare-fun m!42777 () Bool)

(assert (=> b!29518 m!42777))

(declare-fun m!42779 () Bool)

(assert (=> b!29518 m!42779))

(assert (=> b!29445 d!8350))

(declare-fun d!8352 () Bool)

(assert (=> d!8352 (= (head!219 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42145) (_1!1657 lt!42151) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!497 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42145) (_1!1657 lt!42151) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29445 d!8352))

(declare-fun b!29529 () Bool)

(declare-fun e!19777 () Bool)

(declare-fun lt!42237 () List!382)

(declare-fun isEmpty!76 (List!382) Bool)

(assert (=> b!29529 (= e!19777 (isEmpty!76 lt!42237))))

(declare-fun b!29530 () Bool)

(assert (=> b!29530 (= e!19777 (> (length!108 lt!42237) 0))))

(declare-fun b!29527 () Bool)

(declare-datatypes ((tuple2!3146 0))(
  ( (tuple2!3147 (_1!1660 List!382) (_2!1660 BitStream!1362)) )
))
(declare-fun e!19776 () tuple2!3146)

(assert (=> b!29527 (= e!19776 (tuple2!3147 Nil!379 (_1!1657 lt!42151)))))

(declare-fun d!8354 () Bool)

(assert (=> d!8354 e!19777))

(declare-fun c!1910 () Bool)

(assert (=> d!8354 (= c!1910 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8354 (= lt!42237 (_1!1660 e!19776))))

(declare-fun c!1911 () Bool)

(assert (=> d!8354 (= c!1911 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8354 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8354 (= (bitStreamReadBitsIntoList!0 (_2!1656 lt!42145) (_1!1657 lt!42151) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42237)))

(declare-fun b!29528 () Bool)

(declare-datatypes ((tuple2!3148 0))(
  ( (tuple2!3149 (_1!1661 Bool) (_2!1661 BitStream!1362)) )
))
(declare-fun lt!42238 () tuple2!3148)

(declare-fun lt!42236 () (_ BitVec 64))

(assert (=> b!29528 (= e!19776 (tuple2!3147 (Cons!378 (_1!1661 lt!42238) (bitStreamReadBitsIntoList!0 (_2!1656 lt!42145) (_2!1661 lt!42238) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!42236))) (_2!1661 lt!42238)))))

(declare-fun readBit!0 (BitStream!1362) tuple2!3148)

(assert (=> b!29528 (= lt!42238 (readBit!0 (_1!1657 lt!42151)))))

(assert (=> b!29528 (= lt!42236 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8354 c!1911) b!29527))

(assert (= (and d!8354 (not c!1911)) b!29528))

(assert (= (and d!8354 c!1910) b!29529))

(assert (= (and d!8354 (not c!1910)) b!29530))

(declare-fun m!42781 () Bool)

(assert (=> b!29529 m!42781))

(declare-fun m!42783 () Bool)

(assert (=> b!29530 m!42783))

(declare-fun m!42785 () Bool)

(assert (=> b!29528 m!42785))

(declare-fun m!42787 () Bool)

(assert (=> b!29528 m!42787))

(assert (=> b!29445 d!8354))

(declare-fun d!8356 () Bool)

(declare-fun size!772 (List!382) Int)

(assert (=> d!8356 (= (length!108 lt!42140) (size!772 lt!42140))))

(declare-fun bs!2372 () Bool)

(assert (= bs!2372 d!8356))

(declare-fun m!42789 () Bool)

(assert (=> bs!2372 m!42789))

(assert (=> b!29442 d!8356))

(declare-fun d!8358 () Bool)

(assert (=> d!8358 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42135)))

(declare-fun lt!42241 () Unit!2285)

(declare-fun choose!9 (BitStream!1362 array!1771 (_ BitVec 64) BitStream!1362) Unit!2285)

(assert (=> d!8358 (= lt!42241 (choose!9 (_2!1656 lt!42145) (buf!1098 (_2!1656 lt!42147)) lt!42135 (BitStream!1363 (buf!1098 (_2!1656 lt!42147)) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145)))))))

(assert (=> d!8358 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1656 lt!42145) (buf!1098 (_2!1656 lt!42147)) lt!42135) lt!42241)))

(declare-fun bs!2373 () Bool)

(assert (= bs!2373 d!8358))

(assert (=> bs!2373 m!42667))

(declare-fun m!42791 () Bool)

(assert (=> bs!2373 m!42791))

(assert (=> b!29452 d!8358))

(declare-fun b!29533 () Bool)

(declare-fun e!19779 () Bool)

(declare-fun lt!42243 () List!382)

(assert (=> b!29533 (= e!19779 (isEmpty!76 lt!42243))))

(declare-fun b!29534 () Bool)

(assert (=> b!29534 (= e!19779 (> (length!108 lt!42243) 0))))

(declare-fun b!29531 () Bool)

(declare-fun e!19778 () tuple2!3146)

(assert (=> b!29531 (= e!19778 (tuple2!3147 Nil!379 (_1!1657 lt!42142)))))

(declare-fun d!8360 () Bool)

(assert (=> d!8360 e!19779))

(declare-fun c!1912 () Bool)

(assert (=> d!8360 (= c!1912 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8360 (= lt!42243 (_1!1660 e!19778))))

(declare-fun c!1913 () Bool)

(assert (=> d!8360 (= c!1913 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8360 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8360 (= (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_1!1657 lt!42142) (bvsub to!314 i!635)) lt!42243)))

(declare-fun lt!42242 () (_ BitVec 64))

(declare-fun b!29532 () Bool)

(declare-fun lt!42244 () tuple2!3148)

(assert (=> b!29532 (= e!19778 (tuple2!3147 (Cons!378 (_1!1661 lt!42244) (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_2!1661 lt!42244) (bvsub (bvsub to!314 i!635) lt!42242))) (_2!1661 lt!42244)))))

(assert (=> b!29532 (= lt!42244 (readBit!0 (_1!1657 lt!42142)))))

(assert (=> b!29532 (= lt!42242 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8360 c!1913) b!29531))

(assert (= (and d!8360 (not c!1913)) b!29532))

(assert (= (and d!8360 c!1912) b!29533))

(assert (= (and d!8360 (not c!1912)) b!29534))

(declare-fun m!42793 () Bool)

(assert (=> b!29533 m!42793))

(declare-fun m!42795 () Bool)

(assert (=> b!29534 m!42795))

(declare-fun m!42797 () Bool)

(assert (=> b!29532 m!42797))

(declare-fun m!42799 () Bool)

(assert (=> b!29532 m!42799))

(assert (=> b!29452 d!8360))

(declare-fun d!8362 () Bool)

(assert (=> d!8362 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!42245 () Unit!2285)

(assert (=> d!8362 (= lt!42245 (choose!9 thiss!1379 (buf!1098 (_2!1656 lt!42147)) (bvsub to!314 i!635) (BitStream!1363 (buf!1098 (_2!1656 lt!42147)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379))))))

(assert (=> d!8362 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1098 (_2!1656 lt!42147)) (bvsub to!314 i!635)) lt!42245)))

(declare-fun bs!2374 () Bool)

(assert (= bs!2374 d!8362))

(assert (=> bs!2374 m!42673))

(declare-fun m!42801 () Bool)

(assert (=> bs!2374 m!42801))

(assert (=> b!29452 d!8362))

(declare-fun b!29545 () Bool)

(declare-fun res!25489 () Bool)

(declare-fun e!19785 () Bool)

(assert (=> b!29545 (=> (not res!25489) (not e!19785))))

(declare-fun lt!42302 () tuple2!3140)

(assert (=> b!29545 (= res!25489 (isPrefixOf!0 (_1!1657 lt!42302) thiss!1379))))

(declare-fun d!8364 () Bool)

(assert (=> d!8364 e!19785))

(declare-fun res!25490 () Bool)

(assert (=> d!8364 (=> (not res!25490) (not e!19785))))

(assert (=> d!8364 (= res!25490 (isPrefixOf!0 (_1!1657 lt!42302) (_2!1657 lt!42302)))))

(declare-fun lt!42288 () BitStream!1362)

(assert (=> d!8364 (= lt!42302 (tuple2!3141 lt!42288 (_2!1656 lt!42147)))))

(declare-fun lt!42292 () Unit!2285)

(declare-fun lt!42299 () Unit!2285)

(assert (=> d!8364 (= lt!42292 lt!42299)))

(assert (=> d!8364 (isPrefixOf!0 lt!42288 (_2!1656 lt!42147))))

(assert (=> d!8364 (= lt!42299 (lemmaIsPrefixTransitive!0 lt!42288 (_2!1656 lt!42147) (_2!1656 lt!42147)))))

(declare-fun lt!42290 () Unit!2285)

(declare-fun lt!42293 () Unit!2285)

(assert (=> d!8364 (= lt!42290 lt!42293)))

(assert (=> d!8364 (isPrefixOf!0 lt!42288 (_2!1656 lt!42147))))

(assert (=> d!8364 (= lt!42293 (lemmaIsPrefixTransitive!0 lt!42288 thiss!1379 (_2!1656 lt!42147)))))

(declare-fun lt!42295 () Unit!2285)

(declare-fun e!19784 () Unit!2285)

(assert (=> d!8364 (= lt!42295 e!19784)))

(declare-fun c!1916 () Bool)

(assert (=> d!8364 (= c!1916 (not (= (size!770 (buf!1098 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!42291 () Unit!2285)

(declare-fun lt!42286 () Unit!2285)

(assert (=> d!8364 (= lt!42291 lt!42286)))

(assert (=> d!8364 (isPrefixOf!0 (_2!1656 lt!42147) (_2!1656 lt!42147))))

(assert (=> d!8364 (= lt!42286 (lemmaIsPrefixRefl!0 (_2!1656 lt!42147)))))

(declare-fun lt!42301 () Unit!2285)

(declare-fun lt!42303 () Unit!2285)

(assert (=> d!8364 (= lt!42301 lt!42303)))

(assert (=> d!8364 (= lt!42303 (lemmaIsPrefixRefl!0 (_2!1656 lt!42147)))))

(declare-fun lt!42287 () Unit!2285)

(declare-fun lt!42297 () Unit!2285)

(assert (=> d!8364 (= lt!42287 lt!42297)))

(assert (=> d!8364 (isPrefixOf!0 lt!42288 lt!42288)))

(assert (=> d!8364 (= lt!42297 (lemmaIsPrefixRefl!0 lt!42288))))

(declare-fun lt!42300 () Unit!2285)

(declare-fun lt!42289 () Unit!2285)

(assert (=> d!8364 (= lt!42300 lt!42289)))

(assert (=> d!8364 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8364 (= lt!42289 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8364 (= lt!42288 (BitStream!1363 (buf!1098 (_2!1656 lt!42147)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(assert (=> d!8364 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42147))))

(assert (=> d!8364 (= (reader!0 thiss!1379 (_2!1656 lt!42147)) lt!42302)))

(declare-fun b!29546 () Bool)

(declare-fun Unit!2289 () Unit!2285)

(assert (=> b!29546 (= e!19784 Unit!2289)))

(declare-fun b!29547 () Bool)

(declare-fun res!25491 () Bool)

(assert (=> b!29547 (=> (not res!25491) (not e!19785))))

(assert (=> b!29547 (= res!25491 (isPrefixOf!0 (_2!1657 lt!42302) (_2!1656 lt!42147)))))

(declare-fun b!29548 () Bool)

(declare-fun lt!42298 () Unit!2285)

(assert (=> b!29548 (= e!19784 lt!42298)))

(declare-fun lt!42304 () (_ BitVec 64))

(assert (=> b!29548 (= lt!42304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42294 () (_ BitVec 64))

(assert (=> b!29548 (= lt!42294 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1771 array!1771 (_ BitVec 64) (_ BitVec 64)) Unit!2285)

(assert (=> b!29548 (= lt!42298 (arrayBitRangesEqSymmetric!0 (buf!1098 thiss!1379) (buf!1098 (_2!1656 lt!42147)) lt!42304 lt!42294))))

(declare-fun arrayBitRangesEq!0 (array!1771 array!1771 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29548 (arrayBitRangesEq!0 (buf!1098 (_2!1656 lt!42147)) (buf!1098 thiss!1379) lt!42304 lt!42294)))

(declare-fun lt!42305 () (_ BitVec 64))

(declare-fun lt!42296 () (_ BitVec 64))

(declare-fun b!29549 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1362 (_ BitVec 64)) BitStream!1362)

(assert (=> b!29549 (= e!19785 (= (_1!1657 lt!42302) (withMovedBitIndex!0 (_2!1657 lt!42302) (bvsub lt!42296 lt!42305))))))

(assert (=> b!29549 (or (= (bvand lt!42296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42305 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42296 lt!42305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29549 (= lt!42305 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42147))) (currentByte!2435 (_2!1656 lt!42147)) (currentBit!2430 (_2!1656 lt!42147))))))

(assert (=> b!29549 (= lt!42296 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(assert (= (and d!8364 c!1916) b!29548))

(assert (= (and d!8364 (not c!1916)) b!29546))

(assert (= (and d!8364 res!25490) b!29545))

(assert (= (and b!29545 res!25489) b!29547))

(assert (= (and b!29547 res!25491) b!29549))

(declare-fun m!42803 () Bool)

(assert (=> b!29549 m!42803))

(assert (=> b!29549 m!42657))

(assert (=> b!29549 m!42647))

(assert (=> b!29548 m!42647))

(declare-fun m!42805 () Bool)

(assert (=> b!29548 m!42805))

(declare-fun m!42807 () Bool)

(assert (=> b!29548 m!42807))

(declare-fun m!42809 () Bool)

(assert (=> d!8364 m!42809))

(assert (=> d!8364 m!42643))

(declare-fun m!42811 () Bool)

(assert (=> d!8364 m!42811))

(declare-fun m!42813 () Bool)

(assert (=> d!8364 m!42813))

(declare-fun m!42815 () Bool)

(assert (=> d!8364 m!42815))

(declare-fun m!42817 () Bool)

(assert (=> d!8364 m!42817))

(declare-fun m!42819 () Bool)

(assert (=> d!8364 m!42819))

(declare-fun m!42821 () Bool)

(assert (=> d!8364 m!42821))

(declare-fun m!42823 () Bool)

(assert (=> d!8364 m!42823))

(assert (=> d!8364 m!42619))

(assert (=> d!8364 m!42645))

(declare-fun m!42825 () Bool)

(assert (=> b!29547 m!42825))

(declare-fun m!42827 () Bool)

(assert (=> b!29545 m!42827))

(assert (=> b!29452 d!8364))

(declare-fun b!29550 () Bool)

(declare-fun res!25492 () Bool)

(declare-fun e!19787 () Bool)

(assert (=> b!29550 (=> (not res!25492) (not e!19787))))

(declare-fun lt!42322 () tuple2!3140)

(assert (=> b!29550 (= res!25492 (isPrefixOf!0 (_1!1657 lt!42322) (_2!1656 lt!42145)))))

(declare-fun d!8366 () Bool)

(assert (=> d!8366 e!19787))

(declare-fun res!25493 () Bool)

(assert (=> d!8366 (=> (not res!25493) (not e!19787))))

(assert (=> d!8366 (= res!25493 (isPrefixOf!0 (_1!1657 lt!42322) (_2!1657 lt!42322)))))

(declare-fun lt!42308 () BitStream!1362)

(assert (=> d!8366 (= lt!42322 (tuple2!3141 lt!42308 (_2!1656 lt!42147)))))

(declare-fun lt!42312 () Unit!2285)

(declare-fun lt!42319 () Unit!2285)

(assert (=> d!8366 (= lt!42312 lt!42319)))

(assert (=> d!8366 (isPrefixOf!0 lt!42308 (_2!1656 lt!42147))))

(assert (=> d!8366 (= lt!42319 (lemmaIsPrefixTransitive!0 lt!42308 (_2!1656 lt!42147) (_2!1656 lt!42147)))))

(declare-fun lt!42310 () Unit!2285)

(declare-fun lt!42313 () Unit!2285)

(assert (=> d!8366 (= lt!42310 lt!42313)))

(assert (=> d!8366 (isPrefixOf!0 lt!42308 (_2!1656 lt!42147))))

(assert (=> d!8366 (= lt!42313 (lemmaIsPrefixTransitive!0 lt!42308 (_2!1656 lt!42145) (_2!1656 lt!42147)))))

(declare-fun lt!42315 () Unit!2285)

(declare-fun e!19786 () Unit!2285)

(assert (=> d!8366 (= lt!42315 e!19786)))

(declare-fun c!1917 () Bool)

(assert (=> d!8366 (= c!1917 (not (= (size!770 (buf!1098 (_2!1656 lt!42145))) #b00000000000000000000000000000000)))))

(declare-fun lt!42311 () Unit!2285)

(declare-fun lt!42306 () Unit!2285)

(assert (=> d!8366 (= lt!42311 lt!42306)))

(assert (=> d!8366 (isPrefixOf!0 (_2!1656 lt!42147) (_2!1656 lt!42147))))

(assert (=> d!8366 (= lt!42306 (lemmaIsPrefixRefl!0 (_2!1656 lt!42147)))))

(declare-fun lt!42321 () Unit!2285)

(declare-fun lt!42323 () Unit!2285)

(assert (=> d!8366 (= lt!42321 lt!42323)))

(assert (=> d!8366 (= lt!42323 (lemmaIsPrefixRefl!0 (_2!1656 lt!42147)))))

(declare-fun lt!42307 () Unit!2285)

(declare-fun lt!42317 () Unit!2285)

(assert (=> d!8366 (= lt!42307 lt!42317)))

(assert (=> d!8366 (isPrefixOf!0 lt!42308 lt!42308)))

(assert (=> d!8366 (= lt!42317 (lemmaIsPrefixRefl!0 lt!42308))))

(declare-fun lt!42320 () Unit!2285)

(declare-fun lt!42309 () Unit!2285)

(assert (=> d!8366 (= lt!42320 lt!42309)))

(assert (=> d!8366 (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42145))))

(assert (=> d!8366 (= lt!42309 (lemmaIsPrefixRefl!0 (_2!1656 lt!42145)))))

(assert (=> d!8366 (= lt!42308 (BitStream!1363 (buf!1098 (_2!1656 lt!42147)) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))))))

(assert (=> d!8366 (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42147))))

(assert (=> d!8366 (= (reader!0 (_2!1656 lt!42145) (_2!1656 lt!42147)) lt!42322)))

(declare-fun b!29551 () Bool)

(declare-fun Unit!2290 () Unit!2285)

(assert (=> b!29551 (= e!19786 Unit!2290)))

(declare-fun b!29552 () Bool)

(declare-fun res!25494 () Bool)

(assert (=> b!29552 (=> (not res!25494) (not e!19787))))

(assert (=> b!29552 (= res!25494 (isPrefixOf!0 (_2!1657 lt!42322) (_2!1656 lt!42147)))))

(declare-fun b!29553 () Bool)

(declare-fun lt!42318 () Unit!2285)

(assert (=> b!29553 (= e!19786 lt!42318)))

(declare-fun lt!42324 () (_ BitVec 64))

(assert (=> b!29553 (= lt!42324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42314 () (_ BitVec 64))

(assert (=> b!29553 (= lt!42314 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))))))

(assert (=> b!29553 (= lt!42318 (arrayBitRangesEqSymmetric!0 (buf!1098 (_2!1656 lt!42145)) (buf!1098 (_2!1656 lt!42147)) lt!42324 lt!42314))))

(assert (=> b!29553 (arrayBitRangesEq!0 (buf!1098 (_2!1656 lt!42147)) (buf!1098 (_2!1656 lt!42145)) lt!42324 lt!42314)))

(declare-fun b!29554 () Bool)

(declare-fun lt!42325 () (_ BitVec 64))

(declare-fun lt!42316 () (_ BitVec 64))

(assert (=> b!29554 (= e!19787 (= (_1!1657 lt!42322) (withMovedBitIndex!0 (_2!1657 lt!42322) (bvsub lt!42316 lt!42325))))))

(assert (=> b!29554 (or (= (bvand lt!42316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42316 lt!42325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29554 (= lt!42325 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42147))) (currentByte!2435 (_2!1656 lt!42147)) (currentBit!2430 (_2!1656 lt!42147))))))

(assert (=> b!29554 (= lt!42316 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))))))

(assert (= (and d!8366 c!1917) b!29553))

(assert (= (and d!8366 (not c!1917)) b!29551))

(assert (= (and d!8366 res!25493) b!29550))

(assert (= (and b!29550 res!25492) b!29552))

(assert (= (and b!29552 res!25494) b!29554))

(declare-fun m!42829 () Bool)

(assert (=> b!29554 m!42829))

(assert (=> b!29554 m!42657))

(assert (=> b!29554 m!42663))

(assert (=> b!29553 m!42663))

(declare-fun m!42831 () Bool)

(assert (=> b!29553 m!42831))

(declare-fun m!42833 () Bool)

(assert (=> b!29553 m!42833))

(declare-fun m!42835 () Bool)

(assert (=> d!8366 m!42835))

(declare-fun m!42837 () Bool)

(assert (=> d!8366 m!42837))

(declare-fun m!42839 () Bool)

(assert (=> d!8366 m!42839))

(declare-fun m!42841 () Bool)

(assert (=> d!8366 m!42841))

(assert (=> d!8366 m!42815))

(assert (=> d!8366 m!42817))

(declare-fun m!42843 () Bool)

(assert (=> d!8366 m!42843))

(declare-fun m!42845 () Bool)

(assert (=> d!8366 m!42845))

(declare-fun m!42847 () Bool)

(assert (=> d!8366 m!42847))

(assert (=> d!8366 m!42629))

(declare-fun m!42849 () Bool)

(assert (=> d!8366 m!42849))

(declare-fun m!42851 () Bool)

(assert (=> b!29552 m!42851))

(declare-fun m!42853 () Bool)

(assert (=> b!29550 m!42853))

(assert (=> b!29452 d!8366))

(declare-fun d!8368 () Bool)

(assert (=> d!8368 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2375 () Bool)

(assert (= bs!2375 d!8368))

(declare-fun m!42855 () Bool)

(assert (=> bs!2375 m!42855))

(assert (=> b!29452 d!8368))

(declare-fun d!8370 () Bool)

(assert (=> d!8370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145)))) lt!42135))))

(declare-fun bs!2376 () Bool)

(assert (= bs!2376 d!8370))

(declare-fun m!42857 () Bool)

(assert (=> bs!2376 m!42857))

(assert (=> b!29452 d!8370))

(declare-fun b!29557 () Bool)

(declare-fun e!19789 () Bool)

(declare-fun lt!42327 () List!382)

(assert (=> b!29557 (= e!19789 (isEmpty!76 lt!42327))))

(declare-fun b!29558 () Bool)

(assert (=> b!29558 (= e!19789 (> (length!108 lt!42327) 0))))

(declare-fun b!29555 () Bool)

(declare-fun e!19788 () tuple2!3146)

(assert (=> b!29555 (= e!19788 (tuple2!3147 Nil!379 (_1!1657 lt!42146)))))

(declare-fun d!8372 () Bool)

(assert (=> d!8372 e!19789))

(declare-fun c!1918 () Bool)

(assert (=> d!8372 (= c!1918 (= lt!42135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8372 (= lt!42327 (_1!1660 e!19788))))

(declare-fun c!1919 () Bool)

(assert (=> d!8372 (= c!1919 (= lt!42135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8372 (bvsge lt!42135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8372 (= (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_1!1657 lt!42146) lt!42135) lt!42327)))

(declare-fun b!29556 () Bool)

(declare-fun lt!42326 () (_ BitVec 64))

(declare-fun lt!42328 () tuple2!3148)

(assert (=> b!29556 (= e!19788 (tuple2!3147 (Cons!378 (_1!1661 lt!42328) (bitStreamReadBitsIntoList!0 (_2!1656 lt!42147) (_2!1661 lt!42328) (bvsub lt!42135 lt!42326))) (_2!1661 lt!42328)))))

(assert (=> b!29556 (= lt!42328 (readBit!0 (_1!1657 lt!42146)))))

(assert (=> b!29556 (= lt!42326 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8372 c!1919) b!29555))

(assert (= (and d!8372 (not c!1919)) b!29556))

(assert (= (and d!8372 c!1918) b!29557))

(assert (= (and d!8372 (not c!1918)) b!29558))

(declare-fun m!42859 () Bool)

(assert (=> b!29557 m!42859))

(declare-fun m!42861 () Bool)

(assert (=> b!29558 m!42861))

(declare-fun m!42863 () Bool)

(assert (=> b!29556 m!42863))

(declare-fun m!42865 () Bool)

(assert (=> b!29556 m!42865))

(assert (=> b!29452 d!8372))

(declare-fun d!8374 () Bool)

(assert (=> d!8374 (= (invariant!0 (currentBit!2430 (_2!1656 lt!42147)) (currentByte!2435 (_2!1656 lt!42147)) (size!770 (buf!1098 (_2!1656 lt!42147)))) (and (bvsge (currentBit!2430 (_2!1656 lt!42147)) #b00000000000000000000000000000000) (bvslt (currentBit!2430 (_2!1656 lt!42147)) #b00000000000000000000000000001000) (bvsge (currentByte!2435 (_2!1656 lt!42147)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2435 (_2!1656 lt!42147)) (size!770 (buf!1098 (_2!1656 lt!42147)))) (and (= (currentBit!2430 (_2!1656 lt!42147)) #b00000000000000000000000000000000) (= (currentByte!2435 (_2!1656 lt!42147)) (size!770 (buf!1098 (_2!1656 lt!42147))))))))))

(assert (=> b!29441 d!8374))

(declare-fun d!8376 () Bool)

(assert (=> d!8376 (= (array_inv!734 srcBuffer!2) (bvsge (size!770 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6256 d!8376))

(declare-fun d!8378 () Bool)

(assert (=> d!8378 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2430 thiss!1379) (currentByte!2435 thiss!1379) (size!770 (buf!1098 thiss!1379))))))

(declare-fun bs!2377 () Bool)

(assert (= bs!2377 d!8378))

(declare-fun m!42867 () Bool)

(assert (=> bs!2377 m!42867))

(assert (=> start!6256 d!8378))

(declare-fun d!8380 () Bool)

(assert (=> d!8380 (= (array_inv!734 (buf!1098 thiss!1379)) (bvsge (size!770 (buf!1098 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!29453 d!8380))

(declare-fun d!8382 () Bool)

(declare-fun res!25503 () Bool)

(declare-fun e!19794 () Bool)

(assert (=> d!8382 (=> (not res!25503) (not e!19794))))

(assert (=> d!8382 (= res!25503 (= (size!770 (buf!1098 thiss!1379)) (size!770 (buf!1098 (_2!1656 lt!42145)))))))

(assert (=> d!8382 (= (isPrefixOf!0 thiss!1379 (_2!1656 lt!42145)) e!19794)))

(declare-fun b!29565 () Bool)

(declare-fun res!25501 () Bool)

(assert (=> b!29565 (=> (not res!25501) (not e!19794))))

(assert (=> b!29565 (= res!25501 (bvsle (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)) (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145)))))))

(declare-fun b!29566 () Bool)

(declare-fun e!19795 () Bool)

(assert (=> b!29566 (= e!19794 e!19795)))

(declare-fun res!25502 () Bool)

(assert (=> b!29566 (=> res!25502 e!19795)))

(assert (=> b!29566 (= res!25502 (= (size!770 (buf!1098 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29567 () Bool)

(assert (=> b!29567 (= e!19795 (arrayBitRangesEq!0 (buf!1098 thiss!1379) (buf!1098 (_2!1656 lt!42145)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379))))))

(assert (= (and d!8382 res!25503) b!29565))

(assert (= (and b!29565 res!25501) b!29566))

(assert (= (and b!29566 (not res!25502)) b!29567))

(assert (=> b!29565 m!42647))

(assert (=> b!29565 m!42663))

(assert (=> b!29567 m!42647))

(assert (=> b!29567 m!42647))

(declare-fun m!42869 () Bool)

(assert (=> b!29567 m!42869))

(assert (=> b!29450 d!8382))

(declare-fun d!8384 () Bool)

(assert (=> d!8384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145)))) lt!42135))))

(declare-fun bs!2378 () Bool)

(assert (= bs!2378 d!8384))

(assert (=> bs!2378 m!42771))

(assert (=> b!29450 d!8384))

(declare-fun d!8386 () Bool)

(declare-fun e!19798 () Bool)

(assert (=> d!8386 e!19798))

(declare-fun res!25506 () Bool)

(assert (=> d!8386 (=> (not res!25506) (not e!19798))))

(assert (=> d!8386 (= res!25506 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42331 () Unit!2285)

(declare-fun choose!27 (BitStream!1362 BitStream!1362 (_ BitVec 64) (_ BitVec 64)) Unit!2285)

(assert (=> d!8386 (= lt!42331 (choose!27 thiss!1379 (_2!1656 lt!42145) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8386 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1656 lt!42145) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42331)))

(declare-fun b!29570 () Bool)

(assert (=> b!29570 (= e!19798 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8386 res!25506) b!29570))

(declare-fun m!42871 () Bool)

(assert (=> d!8386 m!42871))

(declare-fun m!42873 () Bool)

(assert (=> b!29570 m!42873))

(assert (=> b!29450 d!8386))

(declare-fun b!29588 () Bool)

(declare-fun e!19808 () Bool)

(declare-fun e!19810 () Bool)

(assert (=> b!29588 (= e!19808 e!19810)))

(declare-fun res!25527 () Bool)

(assert (=> b!29588 (=> (not res!25527) (not e!19810))))

(declare-fun lt!42367 () tuple2!3138)

(declare-fun lt!42364 () Bool)

(declare-datatypes ((tuple2!3150 0))(
  ( (tuple2!3151 (_1!1662 BitStream!1362) (_2!1662 Bool)) )
))
(declare-fun lt!42363 () tuple2!3150)

(assert (=> b!29588 (= res!25527 (and (= (_2!1662 lt!42363) lt!42364) (= (_1!1662 lt!42363) (_2!1656 lt!42367))))))

(declare-fun readBitPure!0 (BitStream!1362) tuple2!3150)

(declare-fun readerFrom!0 (BitStream!1362 (_ BitVec 32) (_ BitVec 32)) BitStream!1362)

(assert (=> b!29588 (= lt!42363 (readBitPure!0 (readerFrom!0 (_2!1656 lt!42367) (currentBit!2430 thiss!1379) (currentByte!2435 thiss!1379))))))

(declare-fun b!29589 () Bool)

(declare-fun res!25528 () Bool)

(declare-fun e!19809 () Bool)

(assert (=> b!29589 (=> (not res!25528) (not e!19809))))

(declare-fun lt!42360 () tuple2!3138)

(declare-fun lt!42357 () (_ BitVec 64))

(declare-fun lt!42366 () (_ BitVec 64))

(assert (=> b!29589 (= res!25528 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42360))) (currentByte!2435 (_2!1656 lt!42360)) (currentBit!2430 (_2!1656 lt!42360))) (bvadd lt!42357 lt!42366)))))

(assert (=> b!29589 (or (not (= (bvand lt!42357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42366 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!42357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!42357 lt!42366) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29589 (= lt!42366 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!29589 (= lt!42357 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(declare-fun b!29590 () Bool)

(declare-fun res!25523 () Bool)

(assert (=> b!29590 (=> (not res!25523) (not e!19809))))

(assert (=> b!29590 (= res!25523 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42360)))))

(declare-fun b!29591 () Bool)

(declare-fun res!25530 () Bool)

(assert (=> b!29591 (=> (not res!25530) (not e!19808))))

(assert (=> b!29591 (= res!25530 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42367))) (currentByte!2435 (_2!1656 lt!42367)) (currentBit!2430 (_2!1656 lt!42367))) (bvadd (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29592 () Bool)

(declare-fun res!25524 () Bool)

(assert (=> b!29592 (=> (not res!25524) (not e!19808))))

(assert (=> b!29592 (= res!25524 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42367)))))

(declare-fun b!29593 () Bool)

(declare-fun e!19807 () Bool)

(assert (=> b!29593 (= e!19809 e!19807)))

(declare-fun res!25529 () Bool)

(assert (=> b!29593 (=> (not res!25529) (not e!19807))))

(declare-fun lt!42359 () (_ BitVec 8))

(declare-fun lt!42358 () tuple2!3150)

(assert (=> b!29593 (= res!25529 (and (= (_2!1662 lt!42358) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1233 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!42359)) #b00000000000000000000000000000000))) (= (_1!1662 lt!42358) (_2!1656 lt!42360))))))

(declare-datatypes ((tuple2!3152 0))(
  ( (tuple2!3153 (_1!1663 array!1771) (_2!1663 BitStream!1362)) )
))
(declare-fun lt!42365 () tuple2!3152)

(declare-fun lt!42361 () BitStream!1362)

(declare-fun readBits!0 (BitStream!1362 (_ BitVec 64)) tuple2!3152)

(assert (=> b!29593 (= lt!42365 (readBits!0 lt!42361 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29593 (= lt!42358 (readBitPure!0 lt!42361))))

(assert (=> b!29593 (= lt!42361 (readerFrom!0 (_2!1656 lt!42360) (currentBit!2430 thiss!1379) (currentByte!2435 thiss!1379)))))

(declare-fun d!8388 () Bool)

(assert (=> d!8388 e!19809))

(declare-fun res!25525 () Bool)

(assert (=> d!8388 (=> (not res!25525) (not e!19809))))

(assert (=> d!8388 (= res!25525 (= (size!770 (buf!1098 (_2!1656 lt!42360))) (size!770 (buf!1098 thiss!1379))))))

(declare-fun lt!42362 () array!1771)

(assert (=> d!8388 (= lt!42359 (select (arr!1233 lt!42362) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8388 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!770 lt!42362)))))

(assert (=> d!8388 (= lt!42362 (array!1772 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!42356 () tuple2!3138)

(assert (=> d!8388 (= lt!42360 (tuple2!3139 (_1!1656 lt!42356) (_2!1656 lt!42356)))))

(assert (=> d!8388 (= lt!42356 lt!42367)))

(assert (=> d!8388 e!19808))

(declare-fun res!25526 () Bool)

(assert (=> d!8388 (=> (not res!25526) (not e!19808))))

(assert (=> d!8388 (= res!25526 (= (size!770 (buf!1098 thiss!1379)) (size!770 (buf!1098 (_2!1656 lt!42367)))))))

(declare-fun appendBit!0 (BitStream!1362 Bool) tuple2!3138)

(assert (=> d!8388 (= lt!42367 (appendBit!0 thiss!1379 lt!42364))))

(assert (=> d!8388 (= lt!42364 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1233 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8388 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8388 (= (appendBitFromByte!0 thiss!1379 (select (arr!1233 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!42360)))

(declare-fun b!29594 () Bool)

(assert (=> b!29594 (= e!19810 (= (bitIndex!0 (size!770 (buf!1098 (_1!1662 lt!42363))) (currentByte!2435 (_1!1662 lt!42363)) (currentBit!2430 (_1!1662 lt!42363))) (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42367))) (currentByte!2435 (_2!1656 lt!42367)) (currentBit!2430 (_2!1656 lt!42367)))))))

(declare-fun b!29595 () Bool)

(assert (=> b!29595 (= e!19807 (= (bitIndex!0 (size!770 (buf!1098 (_1!1662 lt!42358))) (currentByte!2435 (_1!1662 lt!42358)) (currentBit!2430 (_1!1662 lt!42358))) (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42360))) (currentByte!2435 (_2!1656 lt!42360)) (currentBit!2430 (_2!1656 lt!42360)))))))

(assert (= (and d!8388 res!25526) b!29591))

(assert (= (and b!29591 res!25530) b!29592))

(assert (= (and b!29592 res!25524) b!29588))

(assert (= (and b!29588 res!25527) b!29594))

(assert (= (and d!8388 res!25525) b!29589))

(assert (= (and b!29589 res!25528) b!29590))

(assert (= (and b!29590 res!25523) b!29593))

(assert (= (and b!29593 res!25529) b!29595))

(declare-fun m!42875 () Bool)

(assert (=> b!29588 m!42875))

(assert (=> b!29588 m!42875))

(declare-fun m!42877 () Bool)

(assert (=> b!29588 m!42877))

(declare-fun m!42879 () Bool)

(assert (=> b!29594 m!42879))

(declare-fun m!42881 () Bool)

(assert (=> b!29594 m!42881))

(declare-fun m!42883 () Bool)

(assert (=> b!29595 m!42883))

(declare-fun m!42885 () Bool)

(assert (=> b!29595 m!42885))

(declare-fun m!42887 () Bool)

(assert (=> d!8388 m!42887))

(declare-fun m!42889 () Bool)

(assert (=> d!8388 m!42889))

(assert (=> d!8388 m!42777))

(declare-fun m!42891 () Bool)

(assert (=> b!29593 m!42891))

(declare-fun m!42893 () Bool)

(assert (=> b!29593 m!42893))

(declare-fun m!42895 () Bool)

(assert (=> b!29593 m!42895))

(declare-fun m!42897 () Bool)

(assert (=> b!29590 m!42897))

(assert (=> b!29589 m!42885))

(assert (=> b!29589 m!42647))

(declare-fun m!42899 () Bool)

(assert (=> b!29592 m!42899))

(assert (=> b!29591 m!42881))

(assert (=> b!29591 m!42647))

(assert (=> b!29450 d!8388))

(declare-fun b!29795 () Bool)

(declare-fun e!19912 () tuple2!3138)

(declare-fun Unit!2291 () Unit!2285)

(assert (=> b!29795 (= e!19912 (tuple2!3139 Unit!2291 (_2!1656 lt!42145)))))

(assert (=> b!29795 (= (size!770 (buf!1098 (_2!1656 lt!42145))) (size!770 (buf!1098 (_2!1656 lt!42145))))))

(declare-fun lt!42834 () Unit!2285)

(declare-fun Unit!2292 () Unit!2285)

(assert (=> b!29795 (= lt!42834 Unit!2292)))

(declare-fun call!376 () tuple2!3140)

(declare-fun checkByteArrayBitContent!0 (BitStream!1362 array!1771 array!1771 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29795 (checkByteArrayBitContent!0 (_2!1656 lt!42145) srcBuffer!2 (_1!1663 (readBits!0 (_1!1657 call!376) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42829 () tuple2!3138)

(declare-fun bm!373 () Bool)

(declare-fun c!1951 () Bool)

(assert (=> bm!373 (= call!376 (reader!0 (_2!1656 lt!42145) (ite c!1951 (_2!1656 lt!42829) (_2!1656 lt!42145))))))

(declare-fun b!29796 () Bool)

(declare-fun Unit!2293 () Unit!2285)

(assert (=> b!29796 (= e!19912 (tuple2!3139 Unit!2293 (_2!1656 lt!42829)))))

(declare-fun lt!42798 () tuple2!3138)

(assert (=> b!29796 (= lt!42798 (appendBitFromByte!0 (_2!1656 lt!42145) (select (arr!1233 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!42796 () (_ BitVec 64))

(assert (=> b!29796 (= lt!42796 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42809 () (_ BitVec 64))

(assert (=> b!29796 (= lt!42809 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42827 () Unit!2285)

(assert (=> b!29796 (= lt!42827 (validateOffsetBitsIneqLemma!0 (_2!1656 lt!42145) (_2!1656 lt!42798) lt!42796 lt!42809))))

(assert (=> b!29796 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42798)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42798))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42798))) (bvsub lt!42796 lt!42809))))

(declare-fun lt!42835 () Unit!2285)

(assert (=> b!29796 (= lt!42835 lt!42827)))

(declare-fun lt!42828 () tuple2!3140)

(assert (=> b!29796 (= lt!42828 (reader!0 (_2!1656 lt!42145) (_2!1656 lt!42798)))))

(declare-fun lt!42797 () (_ BitVec 64))

(assert (=> b!29796 (= lt!42797 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42801 () Unit!2285)

(assert (=> b!29796 (= lt!42801 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1656 lt!42145) (buf!1098 (_2!1656 lt!42798)) lt!42797))))

(assert (=> b!29796 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42798)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42797)))

(declare-fun lt!42817 () Unit!2285)

(assert (=> b!29796 (= lt!42817 lt!42801)))

(assert (=> b!29796 (= (head!219 (byteArrayBitContentToList!0 (_2!1656 lt!42798) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!219 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42798) (_1!1657 lt!42828) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!42831 () Unit!2285)

(declare-fun Unit!2294 () Unit!2285)

(assert (=> b!29796 (= lt!42831 Unit!2294)))

(assert (=> b!29796 (= lt!42829 (appendBitsMSBFirstLoop!0 (_2!1656 lt!42798) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!42803 () Unit!2285)

(assert (=> b!29796 (= lt!42803 (lemmaIsPrefixTransitive!0 (_2!1656 lt!42145) (_2!1656 lt!42798) (_2!1656 lt!42829)))))

(assert (=> b!29796 (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42829))))

(declare-fun lt!42800 () Unit!2285)

(assert (=> b!29796 (= lt!42800 lt!42803)))

(assert (=> b!29796 (= (size!770 (buf!1098 (_2!1656 lt!42829))) (size!770 (buf!1098 (_2!1656 lt!42145))))))

(declare-fun lt!42812 () Unit!2285)

(declare-fun Unit!2295 () Unit!2285)

(assert (=> b!29796 (= lt!42812 Unit!2295)))

(assert (=> b!29796 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42829))) (currentByte!2435 (_2!1656 lt!42829)) (currentBit!2430 (_2!1656 lt!42829))) (bvsub (bvadd (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42813 () Unit!2285)

(declare-fun Unit!2296 () Unit!2285)

(assert (=> b!29796 (= lt!42813 Unit!2296)))

(assert (=> b!29796 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42829))) (currentByte!2435 (_2!1656 lt!42829)) (currentBit!2430 (_2!1656 lt!42829))) (bvsub (bvsub (bvadd (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42798))) (currentByte!2435 (_2!1656 lt!42798)) (currentBit!2430 (_2!1656 lt!42798))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42818 () Unit!2285)

(declare-fun Unit!2297 () Unit!2285)

(assert (=> b!29796 (= lt!42818 Unit!2297)))

(declare-fun lt!42816 () tuple2!3140)

(assert (=> b!29796 (= lt!42816 call!376)))

(declare-fun lt!42810 () (_ BitVec 64))

(assert (=> b!29796 (= lt!42810 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42822 () Unit!2285)

(assert (=> b!29796 (= lt!42822 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1656 lt!42145) (buf!1098 (_2!1656 lt!42829)) lt!42810))))

(assert (=> b!29796 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42829)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42810)))

(declare-fun lt!42808 () Unit!2285)

(assert (=> b!29796 (= lt!42808 lt!42822)))

(declare-fun lt!42832 () tuple2!3140)

(assert (=> b!29796 (= lt!42832 (reader!0 (_2!1656 lt!42798) (_2!1656 lt!42829)))))

(declare-fun lt!42814 () (_ BitVec 64))

(assert (=> b!29796 (= lt!42814 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42836 () Unit!2285)

(assert (=> b!29796 (= lt!42836 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1656 lt!42798) (buf!1098 (_2!1656 lt!42829)) lt!42814))))

(assert (=> b!29796 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42829)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42798))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42798))) lt!42814)))

(declare-fun lt!42823 () Unit!2285)

(assert (=> b!29796 (= lt!42823 lt!42836)))

(declare-fun lt!42833 () List!382)

(assert (=> b!29796 (= lt!42833 (byteArrayBitContentToList!0 (_2!1656 lt!42829) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!42825 () List!382)

(assert (=> b!29796 (= lt!42825 (byteArrayBitContentToList!0 (_2!1656 lt!42829) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!42838 () List!382)

(assert (=> b!29796 (= lt!42838 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42829) (_1!1657 lt!42816) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!42830 () List!382)

(assert (=> b!29796 (= lt!42830 (bitStreamReadBitsIntoList!0 (_2!1656 lt!42829) (_1!1657 lt!42832) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!42802 () (_ BitVec 64))

(assert (=> b!29796 (= lt!42802 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42837 () Unit!2285)

(assert (=> b!29796 (= lt!42837 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1656 lt!42829) (_2!1656 lt!42829) (_1!1657 lt!42816) (_1!1657 lt!42832) lt!42802 lt!42838))))

(assert (=> b!29796 (= (bitStreamReadBitsIntoList!0 (_2!1656 lt!42829) (_1!1657 lt!42832) (bvsub lt!42802 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!99 lt!42838))))

(declare-fun lt!42799 () Unit!2285)

(assert (=> b!29796 (= lt!42799 lt!42837)))

(declare-fun lt!42805 () Unit!2285)

(declare-fun lt!42819 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1771 array!1771 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2285)

(assert (=> b!29796 (= lt!42805 (arrayBitRangesEqImpliesEq!0 (buf!1098 (_2!1656 lt!42798)) (buf!1098 (_2!1656 lt!42829)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!42819 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42798))) (currentByte!2435 (_2!1656 lt!42798)) (currentBit!2430 (_2!1656 lt!42798)))))))

(declare-fun bitAt!0 (array!1771 (_ BitVec 64)) Bool)

(assert (=> b!29796 (= (bitAt!0 (buf!1098 (_2!1656 lt!42798)) lt!42819) (bitAt!0 (buf!1098 (_2!1656 lt!42829)) lt!42819))))

(declare-fun lt!42815 () Unit!2285)

(assert (=> b!29796 (= lt!42815 lt!42805)))

(declare-fun b!29797 () Bool)

(declare-fun res!25671 () Bool)

(declare-fun e!19914 () Bool)

(assert (=> b!29797 (=> (not res!25671) (not e!19914))))

(declare-fun lt!42820 () tuple2!3138)

(assert (=> b!29797 (= res!25671 (invariant!0 (currentBit!2430 (_2!1656 lt!42820)) (currentByte!2435 (_2!1656 lt!42820)) (size!770 (buf!1098 (_2!1656 lt!42820)))))))

(declare-fun b!29798 () Bool)

(declare-fun res!25669 () Bool)

(assert (=> b!29798 (=> (not res!25669) (not e!19914))))

(assert (=> b!29798 (= res!25669 (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42820)))))

(declare-fun b!29799 () Bool)

(declare-fun res!25666 () Bool)

(assert (=> b!29799 (=> (not res!25666) (not e!19914))))

(assert (=> b!29799 (= res!25666 (= (size!770 (buf!1098 (_2!1656 lt!42820))) (size!770 (buf!1098 (_2!1656 lt!42145)))))))

(declare-fun b!29800 () Bool)

(declare-fun res!25670 () Bool)

(assert (=> b!29800 (=> (not res!25670) (not e!19914))))

(assert (=> b!29800 (= res!25670 (= (size!770 (buf!1098 (_2!1656 lt!42145))) (size!770 (buf!1098 (_2!1656 lt!42820)))))))

(declare-fun d!8390 () Bool)

(assert (=> d!8390 e!19914))

(declare-fun res!25668 () Bool)

(assert (=> d!8390 (=> (not res!25668) (not e!19914))))

(declare-fun lt!42807 () (_ BitVec 64))

(assert (=> d!8390 (= res!25668 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42820))) (currentByte!2435 (_2!1656 lt!42820)) (currentBit!2430 (_2!1656 lt!42820))) (bvsub lt!42807 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8390 (or (= (bvand lt!42807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42807 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!42795 () (_ BitVec 64))

(assert (=> d!8390 (= lt!42807 (bvadd lt!42795 to!314))))

(assert (=> d!8390 (or (not (= (bvand lt!42795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!42795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!42795 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8390 (= lt!42795 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))))))

(assert (=> d!8390 (= lt!42820 e!19912)))

(assert (=> d!8390 (= c!1951 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!42826 () Unit!2285)

(declare-fun lt!42804 () Unit!2285)

(assert (=> d!8390 (= lt!42826 lt!42804)))

(assert (=> d!8390 (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42145))))

(assert (=> d!8390 (= lt!42804 (lemmaIsPrefixRefl!0 (_2!1656 lt!42145)))))

(assert (=> d!8390 (= lt!42819 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))))))

(assert (=> d!8390 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8390 (= (appendBitsMSBFirstLoop!0 (_2!1656 lt!42145) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!42820)))

(declare-fun b!29801 () Bool)

(declare-fun e!19913 () Bool)

(declare-fun lt!42811 () (_ BitVec 64))

(assert (=> b!29801 (= e!19913 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42811))))

(declare-fun b!29802 () Bool)

(declare-fun lt!42824 () tuple2!3140)

(assert (=> b!29802 (= e!19914 (= (bitStreamReadBitsIntoList!0 (_2!1656 lt!42820) (_1!1657 lt!42824) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1656 lt!42820) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!29802 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29802 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!42806 () Unit!2285)

(declare-fun lt!42821 () Unit!2285)

(assert (=> b!29802 (= lt!42806 lt!42821)))

(assert (=> b!29802 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42820)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42145))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42145))) lt!42811)))

(assert (=> b!29802 (= lt!42821 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1656 lt!42145) (buf!1098 (_2!1656 lt!42820)) lt!42811))))

(assert (=> b!29802 e!19913))

(declare-fun res!25667 () Bool)

(assert (=> b!29802 (=> (not res!25667) (not e!19913))))

(assert (=> b!29802 (= res!25667 (and (= (size!770 (buf!1098 (_2!1656 lt!42145))) (size!770 (buf!1098 (_2!1656 lt!42820)))) (bvsge lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29802 (= lt!42811 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!29802 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29802 (= lt!42824 (reader!0 (_2!1656 lt!42145) (_2!1656 lt!42820)))))

(assert (= (and d!8390 c!1951) b!29796))

(assert (= (and d!8390 (not c!1951)) b!29795))

(assert (= (or b!29796 b!29795) bm!373))

(assert (= (and d!8390 res!25668) b!29797))

(assert (= (and b!29797 res!25671) b!29800))

(assert (= (and b!29800 res!25670) b!29798))

(assert (= (and b!29798 res!25669) b!29799))

(assert (= (and b!29799 res!25666) b!29802))

(assert (= (and b!29802 res!25667) b!29801))

(declare-fun m!43159 () Bool)

(assert (=> b!29796 m!43159))

(declare-fun m!43161 () Bool)

(assert (=> b!29796 m!43161))

(declare-fun m!43163 () Bool)

(assert (=> b!29796 m!43163))

(declare-fun m!43165 () Bool)

(assert (=> b!29796 m!43165))

(declare-fun m!43167 () Bool)

(assert (=> b!29796 m!43167))

(declare-fun m!43169 () Bool)

(assert (=> b!29796 m!43169))

(declare-fun m!43171 () Bool)

(assert (=> b!29796 m!43171))

(declare-fun m!43173 () Bool)

(assert (=> b!29796 m!43173))

(declare-fun m!43175 () Bool)

(assert (=> b!29796 m!43175))

(declare-fun m!43177 () Bool)

(assert (=> b!29796 m!43177))

(declare-fun m!43179 () Bool)

(assert (=> b!29796 m!43179))

(declare-fun m!43181 () Bool)

(assert (=> b!29796 m!43181))

(declare-fun m!43183 () Bool)

(assert (=> b!29796 m!43183))

(declare-fun m!43185 () Bool)

(assert (=> b!29796 m!43185))

(declare-fun m!43187 () Bool)

(assert (=> b!29796 m!43187))

(declare-fun m!43189 () Bool)

(assert (=> b!29796 m!43189))

(declare-fun m!43191 () Bool)

(assert (=> b!29796 m!43191))

(declare-fun m!43193 () Bool)

(assert (=> b!29796 m!43193))

(declare-fun m!43195 () Bool)

(assert (=> b!29796 m!43195))

(declare-fun m!43197 () Bool)

(assert (=> b!29796 m!43197))

(declare-fun m!43199 () Bool)

(assert (=> b!29796 m!43199))

(assert (=> b!29796 m!43181))

(declare-fun m!43201 () Bool)

(assert (=> b!29796 m!43201))

(assert (=> b!29796 m!43175))

(declare-fun m!43203 () Bool)

(assert (=> b!29796 m!43203))

(assert (=> b!29796 m!42663))

(declare-fun m!43205 () Bool)

(assert (=> b!29796 m!43205))

(declare-fun m!43207 () Bool)

(assert (=> b!29796 m!43207))

(declare-fun m!43209 () Bool)

(assert (=> b!29796 m!43209))

(declare-fun m!43211 () Bool)

(assert (=> b!29796 m!43211))

(declare-fun m!43213 () Bool)

(assert (=> b!29796 m!43213))

(declare-fun m!43215 () Bool)

(assert (=> b!29796 m!43215))

(assert (=> b!29796 m!43205))

(declare-fun m!43217 () Bool)

(assert (=> b!29796 m!43217))

(assert (=> b!29796 m!43161))

(declare-fun m!43219 () Bool)

(assert (=> b!29796 m!43219))

(declare-fun m!43221 () Bool)

(assert (=> b!29795 m!43221))

(declare-fun m!43223 () Bool)

(assert (=> b!29795 m!43223))

(declare-fun m!43225 () Bool)

(assert (=> b!29798 m!43225))

(declare-fun m!43227 () Bool)

(assert (=> bm!373 m!43227))

(declare-fun m!43229 () Bool)

(assert (=> b!29797 m!43229))

(declare-fun m!43231 () Bool)

(assert (=> d!8390 m!43231))

(assert (=> d!8390 m!42663))

(assert (=> d!8390 m!42837))

(assert (=> d!8390 m!42849))

(declare-fun m!43233 () Bool)

(assert (=> b!29802 m!43233))

(declare-fun m!43235 () Bool)

(assert (=> b!29802 m!43235))

(declare-fun m!43237 () Bool)

(assert (=> b!29802 m!43237))

(declare-fun m!43239 () Bool)

(assert (=> b!29802 m!43239))

(declare-fun m!43241 () Bool)

(assert (=> b!29802 m!43241))

(declare-fun m!43243 () Bool)

(assert (=> b!29801 m!43243))

(assert (=> b!29449 d!8390))

(declare-fun d!8492 () Bool)

(assert (=> d!8492 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2396 () Bool)

(assert (= bs!2396 d!8492))

(declare-fun m!43245 () Bool)

(assert (=> bs!2396 m!43245))

(assert (=> b!29449 d!8492))

(declare-fun d!8494 () Bool)

(declare-fun res!25674 () Bool)

(declare-fun e!19915 () Bool)

(assert (=> d!8494 (=> (not res!25674) (not e!19915))))

(assert (=> d!8494 (= res!25674 (= (size!770 (buf!1098 thiss!1379)) (size!770 (buf!1098 (_2!1656 lt!42147)))))))

(assert (=> d!8494 (= (isPrefixOf!0 thiss!1379 (_2!1656 lt!42147)) e!19915)))

(declare-fun b!29803 () Bool)

(declare-fun res!25672 () Bool)

(assert (=> b!29803 (=> (not res!25672) (not e!19915))))

(assert (=> b!29803 (= res!25672 (bvsle (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)) (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42147))) (currentByte!2435 (_2!1656 lt!42147)) (currentBit!2430 (_2!1656 lt!42147)))))))

(declare-fun b!29804 () Bool)

(declare-fun e!19916 () Bool)

(assert (=> b!29804 (= e!19915 e!19916)))

(declare-fun res!25673 () Bool)

(assert (=> b!29804 (=> res!25673 e!19916)))

(assert (=> b!29804 (= res!25673 (= (size!770 (buf!1098 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29805 () Bool)

(assert (=> b!29805 (= e!19916 (arrayBitRangesEq!0 (buf!1098 thiss!1379) (buf!1098 (_2!1656 lt!42147)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379))))))

(assert (= (and d!8494 res!25674) b!29803))

(assert (= (and b!29803 res!25672) b!29804))

(assert (= (and b!29804 (not res!25673)) b!29805))

(assert (=> b!29803 m!42647))

(assert (=> b!29803 m!42657))

(assert (=> b!29805 m!42647))

(assert (=> b!29805 m!42647))

(declare-fun m!43247 () Bool)

(assert (=> b!29805 m!43247))

(assert (=> b!29449 d!8494))

(declare-fun d!8496 () Bool)

(declare-fun res!25677 () Bool)

(declare-fun e!19917 () Bool)

(assert (=> d!8496 (=> (not res!25677) (not e!19917))))

(assert (=> d!8496 (= res!25677 (= (size!770 (buf!1098 (_2!1656 lt!42145))) (size!770 (buf!1098 (_2!1656 lt!42147)))))))

(assert (=> d!8496 (= (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42147)) e!19917)))

(declare-fun b!29806 () Bool)

(declare-fun res!25675 () Bool)

(assert (=> b!29806 (=> (not res!25675) (not e!19917))))

(assert (=> b!29806 (= res!25675 (bvsle (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))) (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42147))) (currentByte!2435 (_2!1656 lt!42147)) (currentBit!2430 (_2!1656 lt!42147)))))))

(declare-fun b!29807 () Bool)

(declare-fun e!19918 () Bool)

(assert (=> b!29807 (= e!19917 e!19918)))

(declare-fun res!25676 () Bool)

(assert (=> b!29807 (=> res!25676 e!19918)))

(assert (=> b!29807 (= res!25676 (= (size!770 (buf!1098 (_2!1656 lt!42145))) #b00000000000000000000000000000000))))

(declare-fun b!29808 () Bool)

(assert (=> b!29808 (= e!19918 (arrayBitRangesEq!0 (buf!1098 (_2!1656 lt!42145)) (buf!1098 (_2!1656 lt!42147)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145)))))))

(assert (= (and d!8496 res!25677) b!29806))

(assert (= (and b!29806 res!25675) b!29807))

(assert (= (and b!29807 (not res!25676)) b!29808))

(assert (=> b!29806 m!42663))

(assert (=> b!29806 m!42657))

(assert (=> b!29808 m!42663))

(assert (=> b!29808 m!42663))

(declare-fun m!43249 () Bool)

(assert (=> b!29808 m!43249))

(assert (=> b!29449 d!8496))

(declare-fun d!8498 () Bool)

(assert (=> d!8498 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42147))))

(declare-fun lt!42841 () Unit!2285)

(declare-fun choose!30 (BitStream!1362 BitStream!1362 BitStream!1362) Unit!2285)

(assert (=> d!8498 (= lt!42841 (choose!30 thiss!1379 (_2!1656 lt!42145) (_2!1656 lt!42147)))))

(assert (=> d!8498 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42145))))

(assert (=> d!8498 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1656 lt!42145) (_2!1656 lt!42147)) lt!42841)))

(declare-fun bs!2397 () Bool)

(assert (= bs!2397 d!8498))

(assert (=> bs!2397 m!42619))

(declare-fun m!43251 () Bool)

(assert (=> bs!2397 m!43251))

(assert (=> bs!2397 m!42681))

(assert (=> b!29449 d!8498))

(declare-fun d!8500 () Bool)

(assert (=> d!8500 (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42145)))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42842 () Unit!2285)

(assert (=> d!8500 (= lt!42842 (choose!9 thiss!1379 (buf!1098 (_2!1656 lt!42145)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1363 (buf!1098 (_2!1656 lt!42145)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379))))))

(assert (=> d!8500 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1098 (_2!1656 lt!42145)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42842)))

(declare-fun bs!2398 () Bool)

(assert (= bs!2398 d!8500))

(assert (=> bs!2398 m!42627))

(declare-fun m!43253 () Bool)

(assert (=> bs!2398 m!43253))

(assert (=> b!29449 d!8500))

(declare-fun b!29809 () Bool)

(declare-fun res!25678 () Bool)

(declare-fun e!19920 () Bool)

(assert (=> b!29809 (=> (not res!25678) (not e!19920))))

(declare-fun lt!42859 () tuple2!3140)

(assert (=> b!29809 (= res!25678 (isPrefixOf!0 (_1!1657 lt!42859) thiss!1379))))

(declare-fun d!8502 () Bool)

(assert (=> d!8502 e!19920))

(declare-fun res!25679 () Bool)

(assert (=> d!8502 (=> (not res!25679) (not e!19920))))

(assert (=> d!8502 (= res!25679 (isPrefixOf!0 (_1!1657 lt!42859) (_2!1657 lt!42859)))))

(declare-fun lt!42845 () BitStream!1362)

(assert (=> d!8502 (= lt!42859 (tuple2!3141 lt!42845 (_2!1656 lt!42145)))))

(declare-fun lt!42849 () Unit!2285)

(declare-fun lt!42856 () Unit!2285)

(assert (=> d!8502 (= lt!42849 lt!42856)))

(assert (=> d!8502 (isPrefixOf!0 lt!42845 (_2!1656 lt!42145))))

(assert (=> d!8502 (= lt!42856 (lemmaIsPrefixTransitive!0 lt!42845 (_2!1656 lt!42145) (_2!1656 lt!42145)))))

(declare-fun lt!42847 () Unit!2285)

(declare-fun lt!42850 () Unit!2285)

(assert (=> d!8502 (= lt!42847 lt!42850)))

(assert (=> d!8502 (isPrefixOf!0 lt!42845 (_2!1656 lt!42145))))

(assert (=> d!8502 (= lt!42850 (lemmaIsPrefixTransitive!0 lt!42845 thiss!1379 (_2!1656 lt!42145)))))

(declare-fun lt!42852 () Unit!2285)

(declare-fun e!19919 () Unit!2285)

(assert (=> d!8502 (= lt!42852 e!19919)))

(declare-fun c!1952 () Bool)

(assert (=> d!8502 (= c!1952 (not (= (size!770 (buf!1098 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!42848 () Unit!2285)

(declare-fun lt!42843 () Unit!2285)

(assert (=> d!8502 (= lt!42848 lt!42843)))

(assert (=> d!8502 (isPrefixOf!0 (_2!1656 lt!42145) (_2!1656 lt!42145))))

(assert (=> d!8502 (= lt!42843 (lemmaIsPrefixRefl!0 (_2!1656 lt!42145)))))

(declare-fun lt!42858 () Unit!2285)

(declare-fun lt!42860 () Unit!2285)

(assert (=> d!8502 (= lt!42858 lt!42860)))

(assert (=> d!8502 (= lt!42860 (lemmaIsPrefixRefl!0 (_2!1656 lt!42145)))))

(declare-fun lt!42844 () Unit!2285)

(declare-fun lt!42854 () Unit!2285)

(assert (=> d!8502 (= lt!42844 lt!42854)))

(assert (=> d!8502 (isPrefixOf!0 lt!42845 lt!42845)))

(assert (=> d!8502 (= lt!42854 (lemmaIsPrefixRefl!0 lt!42845))))

(declare-fun lt!42857 () Unit!2285)

(declare-fun lt!42846 () Unit!2285)

(assert (=> d!8502 (= lt!42857 lt!42846)))

(assert (=> d!8502 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8502 (= lt!42846 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8502 (= lt!42845 (BitStream!1363 (buf!1098 (_2!1656 lt!42145)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(assert (=> d!8502 (isPrefixOf!0 thiss!1379 (_2!1656 lt!42145))))

(assert (=> d!8502 (= (reader!0 thiss!1379 (_2!1656 lt!42145)) lt!42859)))

(declare-fun b!29810 () Bool)

(declare-fun Unit!2298 () Unit!2285)

(assert (=> b!29810 (= e!19919 Unit!2298)))

(declare-fun b!29811 () Bool)

(declare-fun res!25680 () Bool)

(assert (=> b!29811 (=> (not res!25680) (not e!19920))))

(assert (=> b!29811 (= res!25680 (isPrefixOf!0 (_2!1657 lt!42859) (_2!1656 lt!42145)))))

(declare-fun b!29812 () Bool)

(declare-fun lt!42855 () Unit!2285)

(assert (=> b!29812 (= e!19919 lt!42855)))

(declare-fun lt!42861 () (_ BitVec 64))

(assert (=> b!29812 (= lt!42861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42851 () (_ BitVec 64))

(assert (=> b!29812 (= lt!42851 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(assert (=> b!29812 (= lt!42855 (arrayBitRangesEqSymmetric!0 (buf!1098 thiss!1379) (buf!1098 (_2!1656 lt!42145)) lt!42861 lt!42851))))

(assert (=> b!29812 (arrayBitRangesEq!0 (buf!1098 (_2!1656 lt!42145)) (buf!1098 thiss!1379) lt!42861 lt!42851)))

(declare-fun lt!42862 () (_ BitVec 64))

(declare-fun lt!42853 () (_ BitVec 64))

(declare-fun b!29813 () Bool)

(assert (=> b!29813 (= e!19920 (= (_1!1657 lt!42859) (withMovedBitIndex!0 (_2!1657 lt!42859) (bvsub lt!42853 lt!42862))))))

(assert (=> b!29813 (or (= (bvand lt!42853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42853 lt!42862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29813 (= lt!42862 (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42145))) (currentByte!2435 (_2!1656 lt!42145)) (currentBit!2430 (_2!1656 lt!42145))))))

(assert (=> b!29813 (= lt!42853 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)))))

(assert (= (and d!8502 c!1952) b!29812))

(assert (= (and d!8502 (not c!1952)) b!29810))

(assert (= (and d!8502 res!25679) b!29809))

(assert (= (and b!29809 res!25678) b!29811))

(assert (= (and b!29811 res!25680) b!29813))

(declare-fun m!43255 () Bool)

(assert (=> b!29813 m!43255))

(assert (=> b!29813 m!42663))

(assert (=> b!29813 m!42647))

(assert (=> b!29812 m!42647))

(declare-fun m!43257 () Bool)

(assert (=> b!29812 m!43257))

(declare-fun m!43259 () Bool)

(assert (=> b!29812 m!43259))

(declare-fun m!43261 () Bool)

(assert (=> d!8502 m!43261))

(assert (=> d!8502 m!42643))

(declare-fun m!43263 () Bool)

(assert (=> d!8502 m!43263))

(declare-fun m!43265 () Bool)

(assert (=> d!8502 m!43265))

(assert (=> d!8502 m!42849))

(assert (=> d!8502 m!42837))

(declare-fun m!43267 () Bool)

(assert (=> d!8502 m!43267))

(declare-fun m!43269 () Bool)

(assert (=> d!8502 m!43269))

(declare-fun m!43271 () Bool)

(assert (=> d!8502 m!43271))

(assert (=> d!8502 m!42681))

(assert (=> d!8502 m!42645))

(declare-fun m!43273 () Bool)

(assert (=> b!29811 m!43273))

(declare-fun m!43275 () Bool)

(assert (=> b!29809 m!43275))

(assert (=> b!29449 d!8502))

(declare-fun d!8504 () Bool)

(assert (=> d!8504 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!770 (buf!1098 thiss!1379))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 thiss!1379))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2399 () Bool)

(assert (= bs!2399 d!8504))

(declare-fun m!43277 () Bool)

(assert (=> bs!2399 m!43277))

(assert (=> b!29451 d!8504))

(declare-fun d!8506 () Bool)

(assert (=> d!8506 (= (invariant!0 (currentBit!2430 (_2!1656 lt!42145)) (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42145)))) (and (bvsge (currentBit!2430 (_2!1656 lt!42145)) #b00000000000000000000000000000000) (bvslt (currentBit!2430 (_2!1656 lt!42145)) #b00000000000000000000000000001000) (bvsge (currentByte!2435 (_2!1656 lt!42145)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42145)))) (and (= (currentBit!2430 (_2!1656 lt!42145)) #b00000000000000000000000000000000) (= (currentByte!2435 (_2!1656 lt!42145)) (size!770 (buf!1098 (_2!1656 lt!42145))))))))))

(assert (=> b!29440 d!8506))

(declare-fun d!8508 () Bool)

(declare-fun res!25683 () Bool)

(declare-fun e!19921 () Bool)

(assert (=> d!8508 (=> (not res!25683) (not e!19921))))

(assert (=> d!8508 (= res!25683 (= (size!770 (buf!1098 thiss!1379)) (size!770 (buf!1098 thiss!1379))))))

(assert (=> d!8508 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19921)))

(declare-fun b!29814 () Bool)

(declare-fun res!25681 () Bool)

(assert (=> b!29814 (=> (not res!25681) (not e!19921))))

(assert (=> b!29814 (= res!25681 (bvsle (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)) (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379))))))

(declare-fun b!29815 () Bool)

(declare-fun e!19922 () Bool)

(assert (=> b!29815 (= e!19921 e!19922)))

(declare-fun res!25682 () Bool)

(assert (=> b!29815 (=> res!25682 e!19922)))

(assert (=> b!29815 (= res!25682 (= (size!770 (buf!1098 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29816 () Bool)

(assert (=> b!29816 (= e!19922 (arrayBitRangesEq!0 (buf!1098 thiss!1379) (buf!1098 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379))))))

(assert (= (and d!8508 res!25683) b!29814))

(assert (= (and b!29814 res!25681) b!29815))

(assert (= (and b!29815 (not res!25682)) b!29816))

(assert (=> b!29814 m!42647))

(assert (=> b!29814 m!42647))

(assert (=> b!29816 m!42647))

(assert (=> b!29816 m!42647))

(declare-fun m!43279 () Bool)

(assert (=> b!29816 m!43279))

(assert (=> b!29447 d!8508))

(declare-fun d!8510 () Bool)

(assert (=> d!8510 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!42865 () Unit!2285)

(declare-fun choose!11 (BitStream!1362) Unit!2285)

(assert (=> d!8510 (= lt!42865 (choose!11 thiss!1379))))

(assert (=> d!8510 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!42865)))

(declare-fun bs!2401 () Bool)

(assert (= bs!2401 d!8510))

(assert (=> bs!2401 m!42643))

(declare-fun m!43281 () Bool)

(assert (=> bs!2401 m!43281))

(assert (=> b!29447 d!8510))

(declare-fun d!8512 () Bool)

(declare-fun e!19923 () Bool)

(assert (=> d!8512 e!19923))

(declare-fun res!25685 () Bool)

(assert (=> d!8512 (=> (not res!25685) (not e!19923))))

(declare-fun lt!42868 () (_ BitVec 64))

(declare-fun lt!42866 () (_ BitVec 64))

(declare-fun lt!42869 () (_ BitVec 64))

(assert (=> d!8512 (= res!25685 (= lt!42866 (bvsub lt!42869 lt!42868)))))

(assert (=> d!8512 (or (= (bvand lt!42869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42869 lt!42868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8512 (= lt!42868 (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 thiss!1379))) ((_ sign_extend 32) (currentByte!2435 thiss!1379)) ((_ sign_extend 32) (currentBit!2430 thiss!1379))))))

(declare-fun lt!42867 () (_ BitVec 64))

(declare-fun lt!42870 () (_ BitVec 64))

(assert (=> d!8512 (= lt!42869 (bvmul lt!42867 lt!42870))))

(assert (=> d!8512 (or (= lt!42867 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42870 (bvsdiv (bvmul lt!42867 lt!42870) lt!42867)))))

(assert (=> d!8512 (= lt!42870 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8512 (= lt!42867 ((_ sign_extend 32) (size!770 (buf!1098 thiss!1379))))))

(assert (=> d!8512 (= lt!42866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2435 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2430 thiss!1379))))))

(assert (=> d!8512 (invariant!0 (currentBit!2430 thiss!1379) (currentByte!2435 thiss!1379) (size!770 (buf!1098 thiss!1379)))))

(assert (=> d!8512 (= (bitIndex!0 (size!770 (buf!1098 thiss!1379)) (currentByte!2435 thiss!1379) (currentBit!2430 thiss!1379)) lt!42866)))

(declare-fun b!29817 () Bool)

(declare-fun res!25684 () Bool)

(assert (=> b!29817 (=> (not res!25684) (not e!19923))))

(assert (=> b!29817 (= res!25684 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42866))))

(declare-fun b!29818 () Bool)

(declare-fun lt!42871 () (_ BitVec 64))

(assert (=> b!29818 (= e!19923 (bvsle lt!42866 (bvmul lt!42871 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29818 (or (= lt!42871 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42871 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42871)))))

(assert (=> b!29818 (= lt!42871 ((_ sign_extend 32) (size!770 (buf!1098 thiss!1379))))))

(assert (= (and d!8512 res!25685) b!29817))

(assert (= (and b!29817 res!25684) b!29818))

(assert (=> d!8512 m!43277))

(assert (=> d!8512 m!42867))

(assert (=> b!29447 d!8512))

(declare-fun d!8514 () Bool)

(declare-fun e!19924 () Bool)

(assert (=> d!8514 e!19924))

(declare-fun res!25687 () Bool)

(assert (=> d!8514 (=> (not res!25687) (not e!19924))))

(declare-fun lt!42875 () (_ BitVec 64))

(declare-fun lt!42872 () (_ BitVec 64))

(declare-fun lt!42874 () (_ BitVec 64))

(assert (=> d!8514 (= res!25687 (= lt!42872 (bvsub lt!42875 lt!42874)))))

(assert (=> d!8514 (or (= (bvand lt!42875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42875 lt!42874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8514 (= lt!42874 (remainingBits!0 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))) ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42147))) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42147)))))))

(declare-fun lt!42873 () (_ BitVec 64))

(declare-fun lt!42876 () (_ BitVec 64))

(assert (=> d!8514 (= lt!42875 (bvmul lt!42873 lt!42876))))

(assert (=> d!8514 (or (= lt!42873 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42876 (bvsdiv (bvmul lt!42873 lt!42876) lt!42873)))))

(assert (=> d!8514 (= lt!42876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8514 (= lt!42873 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))))))

(assert (=> d!8514 (= lt!42872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2435 (_2!1656 lt!42147))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2430 (_2!1656 lt!42147)))))))

(assert (=> d!8514 (invariant!0 (currentBit!2430 (_2!1656 lt!42147)) (currentByte!2435 (_2!1656 lt!42147)) (size!770 (buf!1098 (_2!1656 lt!42147))))))

(assert (=> d!8514 (= (bitIndex!0 (size!770 (buf!1098 (_2!1656 lt!42147))) (currentByte!2435 (_2!1656 lt!42147)) (currentBit!2430 (_2!1656 lt!42147))) lt!42872)))

(declare-fun b!29819 () Bool)

(declare-fun res!25686 () Bool)

(assert (=> b!29819 (=> (not res!25686) (not e!19924))))

(assert (=> b!29819 (= res!25686 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42872))))

(declare-fun b!29820 () Bool)

(declare-fun lt!42877 () (_ BitVec 64))

(assert (=> b!29820 (= e!19924 (bvsle lt!42872 (bvmul lt!42877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29820 (or (= lt!42877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42877)))))

(assert (=> b!29820 (= lt!42877 ((_ sign_extend 32) (size!770 (buf!1098 (_2!1656 lt!42147)))))))

(assert (= (and d!8514 res!25687) b!29819))

(assert (= (and b!29819 res!25686) b!29820))

(declare-fun m!43283 () Bool)

(assert (=> d!8514 m!43283))

(assert (=> d!8514 m!42639))

(assert (=> b!29448 d!8514))

(check-sat (not d!8492) (not b!29548) (not b!29529) (not b!29512) (not b!29558) (not d!8356) (not b!29570) (not d!8502) (not b!29803) (not b!29809) (not b!29554) (not d!8366) (not b!29801) (not b!29556) (not b!29813) (not bm!373) (not d!8388) (not b!29557) (not b!29589) (not b!29532) (not d!8386) (not d!8370) (not d!8510) (not b!29567) (not b!29552) (not b!29550) (not d!8346) (not d!8358) (not b!29806) (not b!29565) (not b!29533) (not b!29797) (not b!29593) (not d!8384) (not b!29594) (not b!29808) (not b!29591) (not d!8514) (not d!8342) (not d!8378) (not b!29816) (not b!29798) (not b!29811) (not b!29795) (not d!8500) (not b!29518) (not d!8504) (not b!29588) (not b!29805) (not b!29796) (not b!29595) (not d!8512) (not d!8368) (not d!8362) (not b!29590) (not d!8390) (not d!8498) (not b!29549) (not b!29545) (not b!29534) (not b!29812) (not b!29547) (not b!29802) (not b!29528) (not b!29553) (not d!8364) (not b!29814) (not b!29592) (not b!29530))
(check-sat)
