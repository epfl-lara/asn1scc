; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12230 () Bool)

(assert start!12230)

(declare-fun b!62383 () Bool)

(declare-fun res!51916 () Bool)

(declare-fun e!41450 () Bool)

(assert (=> b!62383 (=> res!51916 e!41450)))

(declare-datatypes ((array!2790 0))(
  ( (array!2791 (arr!1839 (Array (_ BitVec 32) (_ BitVec 8))) (size!1275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2220 0))(
  ( (BitStream!2221 (buf!1656 array!2790) (currentByte!3292 (_ BitVec 32)) (currentBit!3287 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4245 0))(
  ( (Unit!4246) )
))
(declare-datatypes ((tuple2!5634 0))(
  ( (tuple2!5635 (_1!2928 Unit!4245) (_2!2928 BitStream!2220)) )
))
(declare-fun lt!97936 () tuple2!5634)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!62383 (= res!51916 (not (invariant!0 (currentBit!3287 (_2!2928 lt!97936)) (currentByte!3292 (_2!2928 lt!97936)) (size!1275 (buf!1656 (_2!2928 lt!97936))))))))

(declare-fun b!62384 () Bool)

(declare-fun res!51926 () Bool)

(declare-fun e!41455 () Bool)

(assert (=> b!62384 (=> (not res!51926) (not e!41455))))

(declare-fun thiss!1379 () BitStream!2220)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62384 (= res!51926 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 thiss!1379))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!62385 () Bool)

(declare-fun e!41458 () Bool)

(declare-fun array_inv!1169 (array!2790) Bool)

(assert (=> b!62385 (= e!41458 (array_inv!1169 (buf!1656 thiss!1379)))))

(declare-fun b!62386 () Bool)

(declare-fun res!51912 () Bool)

(declare-fun e!41449 () Bool)

(assert (=> b!62386 (=> res!51912 e!41449)))

(declare-datatypes ((tuple2!5636 0))(
  ( (tuple2!5637 (_1!2929 BitStream!2220) (_2!2929 BitStream!2220)) )
))
(declare-fun lt!97941 () tuple2!5636)

(declare-fun isPrefixOf!0 (BitStream!2220 BitStream!2220) Bool)

(assert (=> b!62386 (= res!51912 (not (isPrefixOf!0 (_1!2929 lt!97941) (_2!2928 lt!97936))))))

(declare-fun b!62388 () Bool)

(declare-fun e!41453 () Bool)

(assert (=> b!62388 (= e!41450 e!41453)))

(declare-fun res!51911 () Bool)

(assert (=> b!62388 (=> res!51911 e!41453)))

(declare-fun lt!97945 () tuple2!5634)

(assert (=> b!62388 (= res!51911 (not (= (size!1275 (buf!1656 (_2!2928 lt!97945))) (size!1275 (buf!1656 (_2!2928 lt!97936))))))))

(declare-fun e!41459 () Bool)

(assert (=> b!62388 e!41459))

(declare-fun res!51922 () Bool)

(assert (=> b!62388 (=> (not res!51922) (not e!41459))))

(assert (=> b!62388 (= res!51922 (= (size!1275 (buf!1656 (_2!2928 lt!97936))) (size!1275 (buf!1656 thiss!1379))))))

(declare-fun srcBuffer!2 () array!2790)

(declare-fun b!62389 () Bool)

(declare-fun e!41448 () Bool)

(declare-fun lt!97944 () tuple2!5636)

(declare-datatypes ((List!685 0))(
  ( (Nil!682) (Cons!681 (h!800 Bool) (t!1435 List!685)) )
))
(declare-fun head!504 (List!685) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2220 array!2790 (_ BitVec 64) (_ BitVec 64)) List!685)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2220 BitStream!2220 (_ BitVec 64)) List!685)

(assert (=> b!62389 (= e!41448 (= (head!504 (byteArrayBitContentToList!0 (_2!2928 lt!97945) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!504 (bitStreamReadBitsIntoList!0 (_2!2928 lt!97945) (_1!2929 lt!97944) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!62390 () Bool)

(declare-fun res!51918 () Bool)

(assert (=> b!62390 (=> res!51918 e!41449)))

(declare-fun lt!97951 () tuple2!5636)

(assert (=> b!62390 (= res!51918 (not (isPrefixOf!0 (_1!2929 lt!97951) (_2!2928 lt!97936))))))

(declare-fun b!62391 () Bool)

(declare-fun e!41456 () Bool)

(declare-fun e!41451 () Bool)

(assert (=> b!62391 (= e!41456 e!41451)))

(declare-fun res!51927 () Bool)

(assert (=> b!62391 (=> res!51927 e!41451)))

(assert (=> b!62391 (= res!51927 (not (isPrefixOf!0 thiss!1379 (_2!2928 lt!97945))))))

(declare-fun lt!97947 () (_ BitVec 64))

(assert (=> b!62391 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!97947)))

(assert (=> b!62391 (= lt!97947 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97946 () Unit!4245)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2220 BitStream!2220 (_ BitVec 64) (_ BitVec 64)) Unit!4245)

(assert (=> b!62391 (= lt!97946 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2928 lt!97945) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2220 (_ BitVec 8) (_ BitVec 32)) tuple2!5634)

(assert (=> b!62391 (= lt!97945 (appendBitFromByte!0 thiss!1379 (select (arr!1839 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!62392 () Bool)

(declare-fun res!51923 () Bool)

(assert (=> b!62392 (=> res!51923 e!41453)))

(assert (=> b!62392 (= res!51923 (not (invariant!0 (currentBit!3287 (_2!2928 lt!97945)) (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97936))))))))

(declare-fun b!62393 () Bool)

(declare-fun res!51925 () Bool)

(assert (=> b!62393 (=> res!51925 e!41449)))

(declare-fun lt!97943 () List!685)

(declare-fun length!313 (List!685) Int)

(assert (=> b!62393 (= res!51925 (<= (length!313 lt!97943) 0))))

(declare-fun b!62394 () Bool)

(declare-fun e!41457 () Bool)

(assert (=> b!62394 (= e!41451 e!41457)))

(declare-fun res!51915 () Bool)

(assert (=> b!62394 (=> res!51915 e!41457)))

(assert (=> b!62394 (= res!51915 (not (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!97936))))))

(assert (=> b!62394 (isPrefixOf!0 thiss!1379 (_2!2928 lt!97936))))

(declare-fun lt!97939 () Unit!4245)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2220 BitStream!2220 BitStream!2220) Unit!4245)

(assert (=> b!62394 (= lt!97939 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2928 lt!97945) (_2!2928 lt!97936)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2220 array!2790 (_ BitVec 64) (_ BitVec 64)) tuple2!5634)

(assert (=> b!62394 (= lt!97936 (appendBitsMSBFirstLoop!0 (_2!2928 lt!97945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!62394 e!41448))

(declare-fun res!51921 () Bool)

(assert (=> b!62394 (=> (not res!51921) (not e!41448))))

(assert (=> b!62394 (= res!51921 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97950 () Unit!4245)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2220 array!2790 (_ BitVec 64)) Unit!4245)

(assert (=> b!62394 (= lt!97950 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1656 (_2!2928 lt!97945)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2220 BitStream!2220) tuple2!5636)

(assert (=> b!62394 (= lt!97944 (reader!0 thiss!1379 (_2!2928 lt!97945)))))

(declare-fun b!62395 () Bool)

(assert (=> b!62395 (= e!41455 (not e!41456))))

(declare-fun res!51914 () Bool)

(assert (=> b!62395 (=> res!51914 e!41456)))

(assert (=> b!62395 (= res!51914 (bvsge i!635 to!314))))

(assert (=> b!62395 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!97942 () Unit!4245)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2220) Unit!4245)

(assert (=> b!62395 (= lt!97942 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!97938 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!62395 (= lt!97938 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(declare-fun b!62387 () Bool)

(declare-fun res!51920 () Bool)

(assert (=> b!62387 (=> res!51920 e!41453)))

(assert (=> b!62387 (= res!51920 (not (invariant!0 (currentBit!3287 (_2!2928 lt!97945)) (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97945))))))))

(declare-fun res!51919 () Bool)

(assert (=> start!12230 (=> (not res!51919) (not e!41455))))

(assert (=> start!12230 (= res!51919 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1275 srcBuffer!2))))))))

(assert (=> start!12230 e!41455))

(assert (=> start!12230 true))

(assert (=> start!12230 (array_inv!1169 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2220) Bool)

(assert (=> start!12230 (and (inv!12 thiss!1379) e!41458)))

(declare-fun b!62396 () Bool)

(declare-fun res!51910 () Bool)

(assert (=> b!62396 (=> res!51910 e!41450)))

(assert (=> b!62396 (= res!51910 (not (= (size!1275 (buf!1656 thiss!1379)) (size!1275 (buf!1656 (_2!2928 lt!97936))))))))

(declare-fun b!62397 () Bool)

(assert (=> b!62397 (= e!41449 (= (buf!1656 (_1!2929 lt!97941)) (buf!1656 (_1!2929 lt!97951))))))

(declare-fun lt!97937 () (_ BitVec 64))

(declare-fun b!62398 () Bool)

(assert (=> b!62398 (= e!41459 (= lt!97937 (bvsub (bvsub (bvadd (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62399 () Bool)

(assert (=> b!62399 (= e!41453 e!41449)))

(declare-fun res!51917 () Bool)

(assert (=> b!62399 (=> res!51917 e!41449)))

(assert (=> b!62399 (= res!51917 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97948 () List!685)

(assert (=> b!62399 (= lt!97948 (bitStreamReadBitsIntoList!0 (_2!2928 lt!97936) (_1!2929 lt!97951) lt!97947))))

(assert (=> b!62399 (= lt!97943 (bitStreamReadBitsIntoList!0 (_2!2928 lt!97936) (_1!2929 lt!97941) (bvsub to!314 i!635)))))

(assert (=> b!62399 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!97947)))

(declare-fun lt!97949 () Unit!4245)

(assert (=> b!62399 (= lt!97949 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2928 lt!97945) (buf!1656 (_2!2928 lt!97936)) lt!97947))))

(assert (=> b!62399 (= lt!97951 (reader!0 (_2!2928 lt!97945) (_2!2928 lt!97936)))))

(assert (=> b!62399 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!97940 () Unit!4245)

(assert (=> b!62399 (= lt!97940 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1656 (_2!2928 lt!97936)) (bvsub to!314 i!635)))))

(assert (=> b!62399 (= lt!97941 (reader!0 thiss!1379 (_2!2928 lt!97936)))))

(declare-fun b!62400 () Bool)

(declare-fun res!51913 () Bool)

(assert (=> b!62400 (=> res!51913 e!41449)))

(assert (=> b!62400 (= res!51913 (not (isPrefixOf!0 (_1!2929 lt!97941) (_1!2929 lt!97951))))))

(declare-fun b!62401 () Bool)

(assert (=> b!62401 (= e!41457 e!41450)))

(declare-fun res!51924 () Bool)

(assert (=> b!62401 (=> res!51924 e!41450)))

(assert (=> b!62401 (= res!51924 (not (= lt!97937 (bvsub (bvadd lt!97938 to!314) i!635))))))

(assert (=> b!62401 (= lt!97937 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936))))))

(assert (= (and start!12230 res!51919) b!62384))

(assert (= (and b!62384 res!51926) b!62395))

(assert (= (and b!62395 (not res!51914)) b!62391))

(assert (= (and b!62391 (not res!51927)) b!62394))

(assert (= (and b!62394 res!51921) b!62389))

(assert (= (and b!62394 (not res!51915)) b!62401))

(assert (= (and b!62401 (not res!51924)) b!62383))

(assert (= (and b!62383 (not res!51916)) b!62396))

(assert (= (and b!62396 (not res!51910)) b!62388))

(assert (= (and b!62388 res!51922) b!62398))

(assert (= (and b!62388 (not res!51911)) b!62387))

(assert (= (and b!62387 (not res!51920)) b!62392))

(assert (= (and b!62392 (not res!51923)) b!62399))

(assert (= (and b!62399 (not res!51917)) b!62393))

(assert (= (and b!62393 (not res!51925)) b!62386))

(assert (= (and b!62386 (not res!51912)) b!62390))

(assert (= (and b!62390 (not res!51918)) b!62400))

(assert (= (and b!62400 (not res!51913)) b!62397))

(assert (= start!12230 b!62385))

(declare-fun m!98655 () Bool)

(assert (=> b!62389 m!98655))

(assert (=> b!62389 m!98655))

(declare-fun m!98657 () Bool)

(assert (=> b!62389 m!98657))

(declare-fun m!98659 () Bool)

(assert (=> b!62389 m!98659))

(assert (=> b!62389 m!98659))

(declare-fun m!98661 () Bool)

(assert (=> b!62389 m!98661))

(declare-fun m!98663 () Bool)

(assert (=> start!12230 m!98663))

(declare-fun m!98665 () Bool)

(assert (=> start!12230 m!98665))

(declare-fun m!98667 () Bool)

(assert (=> b!62391 m!98667))

(declare-fun m!98669 () Bool)

(assert (=> b!62391 m!98669))

(declare-fun m!98671 () Bool)

(assert (=> b!62391 m!98671))

(declare-fun m!98673 () Bool)

(assert (=> b!62391 m!98673))

(assert (=> b!62391 m!98667))

(declare-fun m!98675 () Bool)

(assert (=> b!62391 m!98675))

(declare-fun m!98677 () Bool)

(assert (=> b!62383 m!98677))

(declare-fun m!98679 () Bool)

(assert (=> b!62385 m!98679))

(declare-fun m!98681 () Bool)

(assert (=> b!62390 m!98681))

(declare-fun m!98683 () Bool)

(assert (=> b!62395 m!98683))

(declare-fun m!98685 () Bool)

(assert (=> b!62395 m!98685))

(declare-fun m!98687 () Bool)

(assert (=> b!62395 m!98687))

(declare-fun m!98689 () Bool)

(assert (=> b!62394 m!98689))

(declare-fun m!98691 () Bool)

(assert (=> b!62394 m!98691))

(declare-fun m!98693 () Bool)

(assert (=> b!62394 m!98693))

(declare-fun m!98695 () Bool)

(assert (=> b!62394 m!98695))

(declare-fun m!98697 () Bool)

(assert (=> b!62394 m!98697))

(declare-fun m!98699 () Bool)

(assert (=> b!62394 m!98699))

(declare-fun m!98701 () Bool)

(assert (=> b!62394 m!98701))

(declare-fun m!98703 () Bool)

(assert (=> b!62393 m!98703))

(declare-fun m!98705 () Bool)

(assert (=> b!62384 m!98705))

(declare-fun m!98707 () Bool)

(assert (=> b!62386 m!98707))

(declare-fun m!98709 () Bool)

(assert (=> b!62398 m!98709))

(declare-fun m!98711 () Bool)

(assert (=> b!62392 m!98711))

(declare-fun m!98713 () Bool)

(assert (=> b!62387 m!98713))

(declare-fun m!98715 () Bool)

(assert (=> b!62399 m!98715))

(declare-fun m!98717 () Bool)

(assert (=> b!62399 m!98717))

(declare-fun m!98719 () Bool)

(assert (=> b!62399 m!98719))

(declare-fun m!98721 () Bool)

(assert (=> b!62399 m!98721))

(declare-fun m!98723 () Bool)

(assert (=> b!62399 m!98723))

(declare-fun m!98725 () Bool)

(assert (=> b!62399 m!98725))

(declare-fun m!98727 () Bool)

(assert (=> b!62399 m!98727))

(declare-fun m!98729 () Bool)

(assert (=> b!62399 m!98729))

(declare-fun m!98731 () Bool)

(assert (=> b!62401 m!98731))

(declare-fun m!98733 () Bool)

(assert (=> b!62400 m!98733))

(check-sat (not b!62389) (not b!62398) (not b!62399) (not b!62386) (not b!62400) (not b!62392) (not b!62394) (not b!62393) (not b!62391) (not b!62395) (not b!62383) (not b!62384) (not b!62401) (not b!62385) (not b!62387) (not start!12230) (not b!62390))
(check-sat)
(get-model)

(declare-fun d!19282 () Bool)

(declare-fun res!51990 () Bool)

(declare-fun e!41501 () Bool)

(assert (=> d!19282 (=> (not res!51990) (not e!41501))))

(assert (=> d!19282 (= res!51990 (= (size!1275 (buf!1656 thiss!1379)) (size!1275 (buf!1656 thiss!1379))))))

(assert (=> d!19282 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41501)))

(declare-fun b!62465 () Bool)

(declare-fun res!51989 () Bool)

(assert (=> b!62465 (=> (not res!51989) (not e!41501))))

(assert (=> b!62465 (= res!51989 (bvsle (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)) (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379))))))

(declare-fun b!62466 () Bool)

(declare-fun e!41500 () Bool)

(assert (=> b!62466 (= e!41501 e!41500)))

(declare-fun res!51988 () Bool)

(assert (=> b!62466 (=> res!51988 e!41500)))

(assert (=> b!62466 (= res!51988 (= (size!1275 (buf!1656 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62467 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2790 array!2790 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62467 (= e!41500 (arrayBitRangesEq!0 (buf!1656 thiss!1379) (buf!1656 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379))))))

(assert (= (and d!19282 res!51990) b!62465))

(assert (= (and b!62465 res!51989) b!62466))

(assert (= (and b!62466 (not res!51988)) b!62467))

(assert (=> b!62465 m!98687))

(assert (=> b!62465 m!98687))

(assert (=> b!62467 m!98687))

(assert (=> b!62467 m!98687))

(declare-fun m!98815 () Bool)

(assert (=> b!62467 m!98815))

(assert (=> b!62395 d!19282))

(declare-fun d!19284 () Bool)

(assert (=> d!19284 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!98002 () Unit!4245)

(declare-fun choose!11 (BitStream!2220) Unit!4245)

(assert (=> d!19284 (= lt!98002 (choose!11 thiss!1379))))

(assert (=> d!19284 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!98002)))

(declare-fun bs!4792 () Bool)

(assert (= bs!4792 d!19284))

(assert (=> bs!4792 m!98683))

(declare-fun m!98817 () Bool)

(assert (=> bs!4792 m!98817))

(assert (=> b!62395 d!19284))

(declare-fun d!19286 () Bool)

(declare-fun e!41504 () Bool)

(assert (=> d!19286 e!41504))

(declare-fun res!51995 () Bool)

(assert (=> d!19286 (=> (not res!51995) (not e!41504))))

(declare-fun lt!98018 () (_ BitVec 64))

(declare-fun lt!98017 () (_ BitVec 64))

(declare-fun lt!98019 () (_ BitVec 64))

(assert (=> d!19286 (= res!51995 (= lt!98018 (bvsub lt!98019 lt!98017)))))

(assert (=> d!19286 (or (= (bvand lt!98019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98019 lt!98017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19286 (= lt!98017 (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 thiss!1379))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379))))))

(declare-fun lt!98020 () (_ BitVec 64))

(declare-fun lt!98016 () (_ BitVec 64))

(assert (=> d!19286 (= lt!98019 (bvmul lt!98020 lt!98016))))

(assert (=> d!19286 (or (= lt!98020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98016 (bvsdiv (bvmul lt!98020 lt!98016) lt!98020)))))

(assert (=> d!19286 (= lt!98016 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19286 (= lt!98020 ((_ sign_extend 32) (size!1275 (buf!1656 thiss!1379))))))

(assert (=> d!19286 (= lt!98018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3292 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3287 thiss!1379))))))

(assert (=> d!19286 (invariant!0 (currentBit!3287 thiss!1379) (currentByte!3292 thiss!1379) (size!1275 (buf!1656 thiss!1379)))))

(assert (=> d!19286 (= (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)) lt!98018)))

(declare-fun b!62472 () Bool)

(declare-fun res!51996 () Bool)

(assert (=> b!62472 (=> (not res!51996) (not e!41504))))

(assert (=> b!62472 (= res!51996 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98018))))

(declare-fun b!62473 () Bool)

(declare-fun lt!98015 () (_ BitVec 64))

(assert (=> b!62473 (= e!41504 (bvsle lt!98018 (bvmul lt!98015 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62473 (or (= lt!98015 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98015 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98015)))))

(assert (=> b!62473 (= lt!98015 ((_ sign_extend 32) (size!1275 (buf!1656 thiss!1379))))))

(assert (= (and d!19286 res!51995) b!62472))

(assert (= (and b!62472 res!51996) b!62473))

(declare-fun m!98819 () Bool)

(assert (=> d!19286 m!98819))

(declare-fun m!98821 () Bool)

(assert (=> d!19286 m!98821))

(assert (=> b!62395 d!19286))

(declare-fun d!19288 () Bool)

(assert (=> d!19288 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 thiss!1379))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 thiss!1379))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4793 () Bool)

(assert (= bs!4793 d!19288))

(assert (=> bs!4793 m!98819))

(assert (=> b!62384 d!19288))

(declare-fun d!19290 () Bool)

(declare-fun e!41586 () Bool)

(assert (=> d!19290 e!41586))

(declare-fun res!52107 () Bool)

(assert (=> d!19290 (=> (not res!52107) (not e!41586))))

(declare-fun lt!98356 () tuple2!5634)

(declare-fun lt!98345 () (_ BitVec 64))

(assert (=> d!19290 (= res!52107 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98356))) (currentByte!3292 (_2!2928 lt!98356)) (currentBit!3287 (_2!2928 lt!98356))) (bvsub lt!98345 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19290 (or (= (bvand lt!98345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98345 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!98368 () (_ BitVec 64))

(assert (=> d!19290 (= lt!98345 (bvadd lt!98368 to!314))))

(assert (=> d!19290 (or (not (= (bvand lt!98368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!98368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!98368 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19290 (= lt!98368 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))))))

(declare-fun e!41584 () tuple2!5634)

(assert (=> d!19290 (= lt!98356 e!41584)))

(declare-fun c!4439 () Bool)

(assert (=> d!19290 (= c!4439 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!98369 () Unit!4245)

(declare-fun lt!98366 () Unit!4245)

(assert (=> d!19290 (= lt!98369 lt!98366)))

(assert (=> d!19290 (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!97945))))

(assert (=> d!19290 (= lt!98366 (lemmaIsPrefixRefl!0 (_2!2928 lt!97945)))))

(declare-fun lt!98351 () (_ BitVec 64))

(assert (=> d!19290 (= lt!98351 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))))))

(assert (=> d!19290 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19290 (= (appendBitsMSBFirstLoop!0 (_2!2928 lt!97945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!98356)))

(declare-fun b!62628 () Bool)

(declare-fun res!52110 () Bool)

(assert (=> b!62628 (=> (not res!52110) (not e!41586))))

(assert (=> b!62628 (= res!52110 (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!98356)))))

(declare-fun call!793 () tuple2!5636)

(declare-fun lt!98376 () tuple2!5634)

(declare-fun lt!98382 () tuple2!5634)

(declare-fun bm!790 () Bool)

(assert (=> bm!790 (= call!793 (reader!0 (ite c!4439 (_2!2928 lt!98376) (_2!2928 lt!97945)) (ite c!4439 (_2!2928 lt!98382) (_2!2928 lt!97945))))))

(declare-fun b!62629 () Bool)

(declare-fun res!52108 () Bool)

(assert (=> b!62629 (=> (not res!52108) (not e!41586))))

(assert (=> b!62629 (= res!52108 (= (size!1275 (buf!1656 (_2!2928 lt!98356))) (size!1275 (buf!1656 (_2!2928 lt!97945)))))))

(declare-fun lt!98360 () tuple2!5636)

(declare-fun b!62630 () Bool)

(assert (=> b!62630 (= e!41586 (= (bitStreamReadBitsIntoList!0 (_2!2928 lt!98356) (_1!2929 lt!98360) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2928 lt!98356) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!62630 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62630 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!98352 () Unit!4245)

(declare-fun lt!98387 () Unit!4245)

(assert (=> b!62630 (= lt!98352 lt!98387)))

(declare-fun lt!98353 () (_ BitVec 64))

(assert (=> b!62630 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!98356)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!98353)))

(assert (=> b!62630 (= lt!98387 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2928 lt!97945) (buf!1656 (_2!2928 lt!98356)) lt!98353))))

(declare-fun e!41585 () Bool)

(assert (=> b!62630 e!41585))

(declare-fun res!52111 () Bool)

(assert (=> b!62630 (=> (not res!52111) (not e!41585))))

(assert (=> b!62630 (= res!52111 (and (= (size!1275 (buf!1656 (_2!2928 lt!97945))) (size!1275 (buf!1656 (_2!2928 lt!98356)))) (bvsge lt!98353 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62630 (= lt!98353 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!62630 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62630 (= lt!98360 (reader!0 (_2!2928 lt!97945) (_2!2928 lt!98356)))))

(declare-fun b!62631 () Bool)

(assert (=> b!62631 (= e!41585 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!98353))))

(declare-fun b!62632 () Bool)

(declare-fun Unit!4249 () Unit!4245)

(assert (=> b!62632 (= e!41584 (tuple2!5635 Unit!4249 (_2!2928 lt!97945)))))

(assert (=> b!62632 (= (size!1275 (buf!1656 (_2!2928 lt!97945))) (size!1275 (buf!1656 (_2!2928 lt!97945))))))

(declare-fun lt!98386 () Unit!4245)

(declare-fun Unit!4250 () Unit!4245)

(assert (=> b!62632 (= lt!98386 Unit!4250)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2220 array!2790 array!2790 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5642 0))(
  ( (tuple2!5643 (_1!2932 array!2790) (_2!2932 BitStream!2220)) )
))
(declare-fun readBits!0 (BitStream!2220 (_ BitVec 64)) tuple2!5642)

(assert (=> b!62632 (checkByteArrayBitContent!0 (_2!2928 lt!97945) srcBuffer!2 (_1!2932 (readBits!0 (_1!2929 call!793) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!62633 () Bool)

(declare-fun res!52109 () Bool)

(assert (=> b!62633 (=> (not res!52109) (not e!41586))))

(assert (=> b!62633 (= res!52109 (= (size!1275 (buf!1656 (_2!2928 lt!97945))) (size!1275 (buf!1656 (_2!2928 lt!98356)))))))

(declare-fun b!62634 () Bool)

(declare-fun Unit!4251 () Unit!4245)

(assert (=> b!62634 (= e!41584 (tuple2!5635 Unit!4251 (_2!2928 lt!98382)))))

(assert (=> b!62634 (= lt!98376 (appendBitFromByte!0 (_2!2928 lt!97945) (select (arr!1839 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!98350 () (_ BitVec 64))

(assert (=> b!62634 (= lt!98350 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98374 () (_ BitVec 64))

(assert (=> b!62634 (= lt!98374 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98365 () Unit!4245)

(assert (=> b!62634 (= lt!98365 (validateOffsetBitsIneqLemma!0 (_2!2928 lt!97945) (_2!2928 lt!98376) lt!98350 lt!98374))))

(assert (=> b!62634 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!98376)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!98376))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!98376))) (bvsub lt!98350 lt!98374))))

(declare-fun lt!98383 () Unit!4245)

(assert (=> b!62634 (= lt!98383 lt!98365)))

(declare-fun lt!98348 () tuple2!5636)

(assert (=> b!62634 (= lt!98348 (reader!0 (_2!2928 lt!97945) (_2!2928 lt!98376)))))

(declare-fun lt!98381 () (_ BitVec 64))

(assert (=> b!62634 (= lt!98381 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98379 () Unit!4245)

(assert (=> b!62634 (= lt!98379 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2928 lt!97945) (buf!1656 (_2!2928 lt!98376)) lt!98381))))

(assert (=> b!62634 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!98376)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!98381)))

(declare-fun lt!98378 () Unit!4245)

(assert (=> b!62634 (= lt!98378 lt!98379)))

(assert (=> b!62634 (= (head!504 (byteArrayBitContentToList!0 (_2!2928 lt!98376) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!504 (bitStreamReadBitsIntoList!0 (_2!2928 lt!98376) (_1!2929 lt!98348) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98377 () Unit!4245)

(declare-fun Unit!4252 () Unit!4245)

(assert (=> b!62634 (= lt!98377 Unit!4252)))

(assert (=> b!62634 (= lt!98382 (appendBitsMSBFirstLoop!0 (_2!2928 lt!98376) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!98355 () Unit!4245)

(assert (=> b!62634 (= lt!98355 (lemmaIsPrefixTransitive!0 (_2!2928 lt!97945) (_2!2928 lt!98376) (_2!2928 lt!98382)))))

(assert (=> b!62634 (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!98382))))

(declare-fun lt!98358 () Unit!4245)

(assert (=> b!62634 (= lt!98358 lt!98355)))

(assert (=> b!62634 (= (size!1275 (buf!1656 (_2!2928 lt!98382))) (size!1275 (buf!1656 (_2!2928 lt!97945))))))

(declare-fun lt!98362 () Unit!4245)

(declare-fun Unit!4253 () Unit!4245)

(assert (=> b!62634 (= lt!98362 Unit!4253)))

(assert (=> b!62634 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98382))) (currentByte!3292 (_2!2928 lt!98382)) (currentBit!3287 (_2!2928 lt!98382))) (bvsub (bvadd (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98372 () Unit!4245)

(declare-fun Unit!4254 () Unit!4245)

(assert (=> b!62634 (= lt!98372 Unit!4254)))

(assert (=> b!62634 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98382))) (currentByte!3292 (_2!2928 lt!98382)) (currentBit!3287 (_2!2928 lt!98382))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98376))) (currentByte!3292 (_2!2928 lt!98376)) (currentBit!3287 (_2!2928 lt!98376))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!98347 () Unit!4245)

(declare-fun Unit!4255 () Unit!4245)

(assert (=> b!62634 (= lt!98347 Unit!4255)))

(declare-fun lt!98380 () tuple2!5636)

(assert (=> b!62634 (= lt!98380 (reader!0 (_2!2928 lt!97945) (_2!2928 lt!98382)))))

(declare-fun lt!98363 () (_ BitVec 64))

(assert (=> b!62634 (= lt!98363 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98364 () Unit!4245)

(assert (=> b!62634 (= lt!98364 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2928 lt!97945) (buf!1656 (_2!2928 lt!98382)) lt!98363))))

(assert (=> b!62634 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!98382)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!98363)))

(declare-fun lt!98385 () Unit!4245)

(assert (=> b!62634 (= lt!98385 lt!98364)))

(declare-fun lt!98357 () tuple2!5636)

(assert (=> b!62634 (= lt!98357 call!793)))

(declare-fun lt!98344 () (_ BitVec 64))

(assert (=> b!62634 (= lt!98344 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!98371 () Unit!4245)

(assert (=> b!62634 (= lt!98371 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2928 lt!98376) (buf!1656 (_2!2928 lt!98382)) lt!98344))))

(assert (=> b!62634 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!98382)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!98376))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!98376))) lt!98344)))

(declare-fun lt!98346 () Unit!4245)

(assert (=> b!62634 (= lt!98346 lt!98371)))

(declare-fun lt!98349 () List!685)

(assert (=> b!62634 (= lt!98349 (byteArrayBitContentToList!0 (_2!2928 lt!98382) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!98354 () List!685)

(assert (=> b!62634 (= lt!98354 (byteArrayBitContentToList!0 (_2!2928 lt!98382) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98384 () List!685)

(assert (=> b!62634 (= lt!98384 (bitStreamReadBitsIntoList!0 (_2!2928 lt!98382) (_1!2929 lt!98380) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!98373 () List!685)

(assert (=> b!62634 (= lt!98373 (bitStreamReadBitsIntoList!0 (_2!2928 lt!98382) (_1!2929 lt!98357) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98361 () (_ BitVec 64))

(assert (=> b!62634 (= lt!98361 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98367 () Unit!4245)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2220 BitStream!2220 BitStream!2220 BitStream!2220 (_ BitVec 64) List!685) Unit!4245)

(assert (=> b!62634 (= lt!98367 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2928 lt!98382) (_2!2928 lt!98382) (_1!2929 lt!98380) (_1!2929 lt!98357) lt!98361 lt!98384))))

(declare-fun tail!291 (List!685) List!685)

(assert (=> b!62634 (= (bitStreamReadBitsIntoList!0 (_2!2928 lt!98382) (_1!2929 lt!98357) (bvsub lt!98361 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!291 lt!98384))))

(declare-fun lt!98359 () Unit!4245)

(assert (=> b!62634 (= lt!98359 lt!98367)))

(declare-fun lt!98370 () Unit!4245)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2790 array!2790 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4245)

(assert (=> b!62634 (= lt!98370 (arrayBitRangesEqImpliesEq!0 (buf!1656 (_2!2928 lt!98376)) (buf!1656 (_2!2928 lt!98382)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!98351 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98376))) (currentByte!3292 (_2!2928 lt!98376)) (currentBit!3287 (_2!2928 lt!98376)))))))

(declare-fun bitAt!0 (array!2790 (_ BitVec 64)) Bool)

(assert (=> b!62634 (= (bitAt!0 (buf!1656 (_2!2928 lt!98376)) lt!98351) (bitAt!0 (buf!1656 (_2!2928 lt!98382)) lt!98351))))

(declare-fun lt!98375 () Unit!4245)

(assert (=> b!62634 (= lt!98375 lt!98370)))

(declare-fun b!62635 () Bool)

(declare-fun res!52106 () Bool)

(assert (=> b!62635 (=> (not res!52106) (not e!41586))))

(assert (=> b!62635 (= res!52106 (invariant!0 (currentBit!3287 (_2!2928 lt!98356)) (currentByte!3292 (_2!2928 lt!98356)) (size!1275 (buf!1656 (_2!2928 lt!98356)))))))

(assert (= (and d!19290 c!4439) b!62634))

(assert (= (and d!19290 (not c!4439)) b!62632))

(assert (= (or b!62634 b!62632) bm!790))

(assert (= (and d!19290 res!52107) b!62635))

(assert (= (and b!62635 res!52106) b!62633))

(assert (= (and b!62633 res!52109) b!62628))

(assert (= (and b!62628 res!52110) b!62629))

(assert (= (and b!62629 res!52108) b!62630))

(assert (= (and b!62630 res!52111) b!62631))

(declare-fun m!99011 () Bool)

(assert (=> bm!790 m!99011))

(declare-fun m!99013 () Bool)

(assert (=> b!62634 m!99013))

(declare-fun m!99015 () Bool)

(assert (=> b!62634 m!99015))

(declare-fun m!99017 () Bool)

(assert (=> b!62634 m!99017))

(declare-fun m!99019 () Bool)

(assert (=> b!62634 m!99019))

(declare-fun m!99021 () Bool)

(assert (=> b!62634 m!99021))

(declare-fun m!99023 () Bool)

(assert (=> b!62634 m!99023))

(declare-fun m!99025 () Bool)

(assert (=> b!62634 m!99025))

(declare-fun m!99027 () Bool)

(assert (=> b!62634 m!99027))

(declare-fun m!99029 () Bool)

(assert (=> b!62634 m!99029))

(declare-fun m!99031 () Bool)

(assert (=> b!62634 m!99031))

(assert (=> b!62634 m!99029))

(declare-fun m!99033 () Bool)

(assert (=> b!62634 m!99033))

(declare-fun m!99035 () Bool)

(assert (=> b!62634 m!99035))

(declare-fun m!99037 () Bool)

(assert (=> b!62634 m!99037))

(declare-fun m!99039 () Bool)

(assert (=> b!62634 m!99039))

(declare-fun m!99041 () Bool)

(assert (=> b!62634 m!99041))

(declare-fun m!99043 () Bool)

(assert (=> b!62634 m!99043))

(declare-fun m!99045 () Bool)

(assert (=> b!62634 m!99045))

(declare-fun m!99047 () Bool)

(assert (=> b!62634 m!99047))

(declare-fun m!99049 () Bool)

(assert (=> b!62634 m!99049))

(assert (=> b!62634 m!99039))

(declare-fun m!99051 () Bool)

(assert (=> b!62634 m!99051))

(declare-fun m!99053 () Bool)

(assert (=> b!62634 m!99053))

(declare-fun m!99055 () Bool)

(assert (=> b!62634 m!99055))

(declare-fun m!99057 () Bool)

(assert (=> b!62634 m!99057))

(assert (=> b!62634 m!99023))

(assert (=> b!62634 m!98709))

(declare-fun m!99059 () Bool)

(assert (=> b!62634 m!99059))

(declare-fun m!99061 () Bool)

(assert (=> b!62634 m!99061))

(declare-fun m!99063 () Bool)

(assert (=> b!62634 m!99063))

(declare-fun m!99065 () Bool)

(assert (=> b!62634 m!99065))

(declare-fun m!99067 () Bool)

(assert (=> b!62634 m!99067))

(assert (=> b!62634 m!99045))

(declare-fun m!99069 () Bool)

(assert (=> b!62634 m!99069))

(declare-fun m!99071 () Bool)

(assert (=> b!62634 m!99071))

(declare-fun m!99073 () Bool)

(assert (=> b!62634 m!99073))

(declare-fun m!99075 () Bool)

(assert (=> b!62628 m!99075))

(declare-fun m!99077 () Bool)

(assert (=> b!62635 m!99077))

(declare-fun m!99079 () Bool)

(assert (=> b!62632 m!99079))

(declare-fun m!99081 () Bool)

(assert (=> b!62632 m!99081))

(declare-fun m!99083 () Bool)

(assert (=> b!62631 m!99083))

(declare-fun m!99085 () Bool)

(assert (=> d!19290 m!99085))

(assert (=> d!19290 m!98709))

(declare-fun m!99087 () Bool)

(assert (=> d!19290 m!99087))

(declare-fun m!99089 () Bool)

(assert (=> d!19290 m!99089))

(declare-fun m!99091 () Bool)

(assert (=> b!62630 m!99091))

(declare-fun m!99093 () Bool)

(assert (=> b!62630 m!99093))

(declare-fun m!99095 () Bool)

(assert (=> b!62630 m!99095))

(declare-fun m!99097 () Bool)

(assert (=> b!62630 m!99097))

(declare-fun m!99099 () Bool)

(assert (=> b!62630 m!99099))

(assert (=> b!62394 d!19290))

(declare-fun d!19378 () Bool)

(assert (=> d!19378 (isPrefixOf!0 thiss!1379 (_2!2928 lt!97936))))

(declare-fun lt!98390 () Unit!4245)

(declare-fun choose!30 (BitStream!2220 BitStream!2220 BitStream!2220) Unit!4245)

(assert (=> d!19378 (= lt!98390 (choose!30 thiss!1379 (_2!2928 lt!97945) (_2!2928 lt!97936)))))

(assert (=> d!19378 (isPrefixOf!0 thiss!1379 (_2!2928 lt!97945))))

(assert (=> d!19378 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2928 lt!97945) (_2!2928 lt!97936)) lt!98390)))

(declare-fun bs!4808 () Bool)

(assert (= bs!4808 d!19378))

(assert (=> bs!4808 m!98689))

(declare-fun m!99101 () Bool)

(assert (=> bs!4808 m!99101))

(assert (=> bs!4808 m!98671))

(assert (=> b!62394 d!19378))

(declare-fun d!19380 () Bool)

(declare-fun res!52114 () Bool)

(declare-fun e!41588 () Bool)

(assert (=> d!19380 (=> (not res!52114) (not e!41588))))

(assert (=> d!19380 (= res!52114 (= (size!1275 (buf!1656 thiss!1379)) (size!1275 (buf!1656 (_2!2928 lt!97936)))))))

(assert (=> d!19380 (= (isPrefixOf!0 thiss!1379 (_2!2928 lt!97936)) e!41588)))

(declare-fun b!62636 () Bool)

(declare-fun res!52113 () Bool)

(assert (=> b!62636 (=> (not res!52113) (not e!41588))))

(assert (=> b!62636 (= res!52113 (bvsle (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936)))))))

(declare-fun b!62637 () Bool)

(declare-fun e!41587 () Bool)

(assert (=> b!62637 (= e!41588 e!41587)))

(declare-fun res!52112 () Bool)

(assert (=> b!62637 (=> res!52112 e!41587)))

(assert (=> b!62637 (= res!52112 (= (size!1275 (buf!1656 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62638 () Bool)

(assert (=> b!62638 (= e!41587 (arrayBitRangesEq!0 (buf!1656 thiss!1379) (buf!1656 (_2!2928 lt!97936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379))))))

(assert (= (and d!19380 res!52114) b!62636))

(assert (= (and b!62636 res!52113) b!62637))

(assert (= (and b!62637 (not res!52112)) b!62638))

(assert (=> b!62636 m!98687))

(assert (=> b!62636 m!98731))

(assert (=> b!62638 m!98687))

(assert (=> b!62638 m!98687))

(declare-fun m!99103 () Bool)

(assert (=> b!62638 m!99103))

(assert (=> b!62394 d!19380))

(declare-fun d!19382 () Bool)

(assert (=> d!19382 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4809 () Bool)

(assert (= bs!4809 d!19382))

(declare-fun m!99105 () Bool)

(assert (=> bs!4809 m!99105))

(assert (=> b!62394 d!19382))

(declare-fun d!19384 () Bool)

(assert (=> d!19384 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98393 () Unit!4245)

(declare-fun choose!9 (BitStream!2220 array!2790 (_ BitVec 64) BitStream!2220) Unit!4245)

(assert (=> d!19384 (= lt!98393 (choose!9 thiss!1379 (buf!1656 (_2!2928 lt!97945)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2221 (buf!1656 (_2!2928 lt!97945)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379))))))

(assert (=> d!19384 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1656 (_2!2928 lt!97945)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98393)))

(declare-fun bs!4810 () Bool)

(assert (= bs!4810 d!19384))

(assert (=> bs!4810 m!98691))

(declare-fun m!99107 () Bool)

(assert (=> bs!4810 m!99107))

(assert (=> b!62394 d!19384))

(declare-fun d!19386 () Bool)

(declare-fun res!52117 () Bool)

(declare-fun e!41590 () Bool)

(assert (=> d!19386 (=> (not res!52117) (not e!41590))))

(assert (=> d!19386 (= res!52117 (= (size!1275 (buf!1656 (_2!2928 lt!97945))) (size!1275 (buf!1656 (_2!2928 lt!97936)))))))

(assert (=> d!19386 (= (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!97936)) e!41590)))

(declare-fun b!62639 () Bool)

(declare-fun res!52116 () Bool)

(assert (=> b!62639 (=> (not res!52116) (not e!41590))))

(assert (=> b!62639 (= res!52116 (bvsle (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936)))))))

(declare-fun b!62640 () Bool)

(declare-fun e!41589 () Bool)

(assert (=> b!62640 (= e!41590 e!41589)))

(declare-fun res!52115 () Bool)

(assert (=> b!62640 (=> res!52115 e!41589)))

(assert (=> b!62640 (= res!52115 (= (size!1275 (buf!1656 (_2!2928 lt!97945))) #b00000000000000000000000000000000))))

(declare-fun b!62641 () Bool)

(assert (=> b!62641 (= e!41589 (arrayBitRangesEq!0 (buf!1656 (_2!2928 lt!97945)) (buf!1656 (_2!2928 lt!97936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945)))))))

(assert (= (and d!19386 res!52117) b!62639))

(assert (= (and b!62639 res!52116) b!62640))

(assert (= (and b!62640 (not res!52115)) b!62641))

(assert (=> b!62639 m!98709))

(assert (=> b!62639 m!98731))

(assert (=> b!62641 m!98709))

(assert (=> b!62641 m!98709))

(declare-fun m!99109 () Bool)

(assert (=> b!62641 m!99109))

(assert (=> b!62394 d!19386))

(declare-fun b!62652 () Bool)

(declare-fun res!52126 () Bool)

(declare-fun e!41595 () Bool)

(assert (=> b!62652 (=> (not res!52126) (not e!41595))))

(declare-fun lt!98452 () tuple2!5636)

(assert (=> b!62652 (= res!52126 (isPrefixOf!0 (_2!2929 lt!98452) (_2!2928 lt!97945)))))

(declare-fun d!19388 () Bool)

(assert (=> d!19388 e!41595))

(declare-fun res!52125 () Bool)

(assert (=> d!19388 (=> (not res!52125) (not e!41595))))

(assert (=> d!19388 (= res!52125 (isPrefixOf!0 (_1!2929 lt!98452) (_2!2929 lt!98452)))))

(declare-fun lt!98438 () BitStream!2220)

(assert (=> d!19388 (= lt!98452 (tuple2!5637 lt!98438 (_2!2928 lt!97945)))))

(declare-fun lt!98448 () Unit!4245)

(declare-fun lt!98443 () Unit!4245)

(assert (=> d!19388 (= lt!98448 lt!98443)))

(assert (=> d!19388 (isPrefixOf!0 lt!98438 (_2!2928 lt!97945))))

(assert (=> d!19388 (= lt!98443 (lemmaIsPrefixTransitive!0 lt!98438 (_2!2928 lt!97945) (_2!2928 lt!97945)))))

(declare-fun lt!98436 () Unit!4245)

(declare-fun lt!98435 () Unit!4245)

(assert (=> d!19388 (= lt!98436 lt!98435)))

(assert (=> d!19388 (isPrefixOf!0 lt!98438 (_2!2928 lt!97945))))

(assert (=> d!19388 (= lt!98435 (lemmaIsPrefixTransitive!0 lt!98438 thiss!1379 (_2!2928 lt!97945)))))

(declare-fun lt!98441 () Unit!4245)

(declare-fun e!41596 () Unit!4245)

(assert (=> d!19388 (= lt!98441 e!41596)))

(declare-fun c!4442 () Bool)

(assert (=> d!19388 (= c!4442 (not (= (size!1275 (buf!1656 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!98440 () Unit!4245)

(declare-fun lt!98450 () Unit!4245)

(assert (=> d!19388 (= lt!98440 lt!98450)))

(assert (=> d!19388 (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!97945))))

(assert (=> d!19388 (= lt!98450 (lemmaIsPrefixRefl!0 (_2!2928 lt!97945)))))

(declare-fun lt!98444 () Unit!4245)

(declare-fun lt!98449 () Unit!4245)

(assert (=> d!19388 (= lt!98444 lt!98449)))

(assert (=> d!19388 (= lt!98449 (lemmaIsPrefixRefl!0 (_2!2928 lt!97945)))))

(declare-fun lt!98447 () Unit!4245)

(declare-fun lt!98453 () Unit!4245)

(assert (=> d!19388 (= lt!98447 lt!98453)))

(assert (=> d!19388 (isPrefixOf!0 lt!98438 lt!98438)))

(assert (=> d!19388 (= lt!98453 (lemmaIsPrefixRefl!0 lt!98438))))

(declare-fun lt!98445 () Unit!4245)

(declare-fun lt!98434 () Unit!4245)

(assert (=> d!19388 (= lt!98445 lt!98434)))

(assert (=> d!19388 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19388 (= lt!98434 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19388 (= lt!98438 (BitStream!2221 (buf!1656 (_2!2928 lt!97945)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(assert (=> d!19388 (isPrefixOf!0 thiss!1379 (_2!2928 lt!97945))))

(assert (=> d!19388 (= (reader!0 thiss!1379 (_2!2928 lt!97945)) lt!98452)))

(declare-fun b!62653 () Bool)

(declare-fun lt!98451 () Unit!4245)

(assert (=> b!62653 (= e!41596 lt!98451)))

(declare-fun lt!98437 () (_ BitVec 64))

(assert (=> b!62653 (= lt!98437 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98442 () (_ BitVec 64))

(assert (=> b!62653 (= lt!98442 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2790 array!2790 (_ BitVec 64) (_ BitVec 64)) Unit!4245)

(assert (=> b!62653 (= lt!98451 (arrayBitRangesEqSymmetric!0 (buf!1656 thiss!1379) (buf!1656 (_2!2928 lt!97945)) lt!98437 lt!98442))))

(assert (=> b!62653 (arrayBitRangesEq!0 (buf!1656 (_2!2928 lt!97945)) (buf!1656 thiss!1379) lt!98437 lt!98442)))

(declare-fun lt!98446 () (_ BitVec 64))

(declare-fun b!62654 () Bool)

(declare-fun lt!98439 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2220 (_ BitVec 64)) BitStream!2220)

(assert (=> b!62654 (= e!41595 (= (_1!2929 lt!98452) (withMovedBitIndex!0 (_2!2929 lt!98452) (bvsub lt!98439 lt!98446))))))

(assert (=> b!62654 (or (= (bvand lt!98439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98439 lt!98446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62654 (= lt!98446 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))))))

(assert (=> b!62654 (= lt!98439 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(declare-fun b!62655 () Bool)

(declare-fun res!52124 () Bool)

(assert (=> b!62655 (=> (not res!52124) (not e!41595))))

(assert (=> b!62655 (= res!52124 (isPrefixOf!0 (_1!2929 lt!98452) thiss!1379))))

(declare-fun b!62656 () Bool)

(declare-fun Unit!4256 () Unit!4245)

(assert (=> b!62656 (= e!41596 Unit!4256)))

(assert (= (and d!19388 c!4442) b!62653))

(assert (= (and d!19388 (not c!4442)) b!62656))

(assert (= (and d!19388 res!52125) b!62655))

(assert (= (and b!62655 res!52124) b!62652))

(assert (= (and b!62652 res!52126) b!62654))

(declare-fun m!99111 () Bool)

(assert (=> b!62652 m!99111))

(declare-fun m!99113 () Bool)

(assert (=> b!62655 m!99113))

(assert (=> d!19388 m!99089))

(assert (=> d!19388 m!99087))

(declare-fun m!99115 () Bool)

(assert (=> d!19388 m!99115))

(assert (=> d!19388 m!98671))

(assert (=> d!19388 m!98683))

(assert (=> d!19388 m!98685))

(declare-fun m!99117 () Bool)

(assert (=> d!19388 m!99117))

(declare-fun m!99119 () Bool)

(assert (=> d!19388 m!99119))

(declare-fun m!99121 () Bool)

(assert (=> d!19388 m!99121))

(declare-fun m!99123 () Bool)

(assert (=> d!19388 m!99123))

(declare-fun m!99125 () Bool)

(assert (=> d!19388 m!99125))

(assert (=> b!62653 m!98687))

(declare-fun m!99127 () Bool)

(assert (=> b!62653 m!99127))

(declare-fun m!99129 () Bool)

(assert (=> b!62653 m!99129))

(declare-fun m!99131 () Bool)

(assert (=> b!62654 m!99131))

(assert (=> b!62654 m!98709))

(assert (=> b!62654 m!98687))

(assert (=> b!62394 d!19388))

(declare-fun d!19390 () Bool)

(assert (=> d!19390 (= (array_inv!1169 (buf!1656 thiss!1379)) (bvsge (size!1275 (buf!1656 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!62385 d!19390))

(declare-fun d!19392 () Bool)

(assert (=> d!19392 (= (invariant!0 (currentBit!3287 (_2!2928 lt!97945)) (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97936)))) (and (bvsge (currentBit!3287 (_2!2928 lt!97945)) #b00000000000000000000000000000000) (bvslt (currentBit!3287 (_2!2928 lt!97945)) #b00000000000000000000000000001000) (bvsge (currentByte!3292 (_2!2928 lt!97945)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97936)))) (and (= (currentBit!3287 (_2!2928 lt!97945)) #b00000000000000000000000000000000) (= (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97936))))))))))

(assert (=> b!62392 d!19392))

(declare-fun d!19394 () Bool)

(assert (=> d!19394 (= (invariant!0 (currentBit!3287 (_2!2928 lt!97936)) (currentByte!3292 (_2!2928 lt!97936)) (size!1275 (buf!1656 (_2!2928 lt!97936)))) (and (bvsge (currentBit!3287 (_2!2928 lt!97936)) #b00000000000000000000000000000000) (bvslt (currentBit!3287 (_2!2928 lt!97936)) #b00000000000000000000000000001000) (bvsge (currentByte!3292 (_2!2928 lt!97936)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3292 (_2!2928 lt!97936)) (size!1275 (buf!1656 (_2!2928 lt!97936)))) (and (= (currentBit!3287 (_2!2928 lt!97936)) #b00000000000000000000000000000000) (= (currentByte!3292 (_2!2928 lt!97936)) (size!1275 (buf!1656 (_2!2928 lt!97936))))))))))

(assert (=> b!62383 d!19394))

(declare-fun d!19396 () Bool)

(declare-fun size!1277 (List!685) Int)

(assert (=> d!19396 (= (length!313 lt!97943) (size!1277 lt!97943))))

(declare-fun bs!4811 () Bool)

(assert (= bs!4811 d!19396))

(declare-fun m!99133 () Bool)

(assert (=> bs!4811 m!99133))

(assert (=> b!62393 d!19396))

(declare-fun d!19398 () Bool)

(declare-fun res!52129 () Bool)

(declare-fun e!41598 () Bool)

(assert (=> d!19398 (=> (not res!52129) (not e!41598))))

(assert (=> d!19398 (= res!52129 (= (size!1275 (buf!1656 (_1!2929 lt!97941))) (size!1275 (buf!1656 (_1!2929 lt!97951)))))))

(assert (=> d!19398 (= (isPrefixOf!0 (_1!2929 lt!97941) (_1!2929 lt!97951)) e!41598)))

(declare-fun b!62657 () Bool)

(declare-fun res!52128 () Bool)

(assert (=> b!62657 (=> (not res!52128) (not e!41598))))

(assert (=> b!62657 (= res!52128 (bvsle (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97941))) (currentByte!3292 (_1!2929 lt!97941)) (currentBit!3287 (_1!2929 lt!97941))) (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97951))) (currentByte!3292 (_1!2929 lt!97951)) (currentBit!3287 (_1!2929 lt!97951)))))))

(declare-fun b!62658 () Bool)

(declare-fun e!41597 () Bool)

(assert (=> b!62658 (= e!41598 e!41597)))

(declare-fun res!52127 () Bool)

(assert (=> b!62658 (=> res!52127 e!41597)))

(assert (=> b!62658 (= res!52127 (= (size!1275 (buf!1656 (_1!2929 lt!97941))) #b00000000000000000000000000000000))))

(declare-fun b!62659 () Bool)

(assert (=> b!62659 (= e!41597 (arrayBitRangesEq!0 (buf!1656 (_1!2929 lt!97941)) (buf!1656 (_1!2929 lt!97951)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97941))) (currentByte!3292 (_1!2929 lt!97941)) (currentBit!3287 (_1!2929 lt!97941)))))))

(assert (= (and d!19398 res!52129) b!62657))

(assert (= (and b!62657 res!52128) b!62658))

(assert (= (and b!62658 (not res!52127)) b!62659))

(declare-fun m!99135 () Bool)

(assert (=> b!62657 m!99135))

(declare-fun m!99137 () Bool)

(assert (=> b!62657 m!99137))

(assert (=> b!62659 m!99135))

(assert (=> b!62659 m!99135))

(declare-fun m!99139 () Bool)

(assert (=> b!62659 m!99139))

(assert (=> b!62400 d!19398))

(declare-fun d!19400 () Bool)

(assert (=> d!19400 (= (head!504 (byteArrayBitContentToList!0 (_2!2928 lt!97945) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!800 (byteArrayBitContentToList!0 (_2!2928 lt!97945) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62389 d!19400))

(declare-fun d!19402 () Bool)

(declare-fun c!4445 () Bool)

(assert (=> d!19402 (= c!4445 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41601 () List!685)

(assert (=> d!19402 (= (byteArrayBitContentToList!0 (_2!2928 lt!97945) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41601)))

(declare-fun b!62664 () Bool)

(assert (=> b!62664 (= e!41601 Nil!682)))

(declare-fun b!62665 () Bool)

(assert (=> b!62665 (= e!41601 (Cons!681 (not (= (bvand ((_ sign_extend 24) (select (arr!1839 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2928 lt!97945) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19402 c!4445) b!62664))

(assert (= (and d!19402 (not c!4445)) b!62665))

(assert (=> b!62665 m!98667))

(declare-fun m!99141 () Bool)

(assert (=> b!62665 m!99141))

(declare-fun m!99143 () Bool)

(assert (=> b!62665 m!99143))

(assert (=> b!62389 d!19402))

(declare-fun d!19404 () Bool)

(assert (=> d!19404 (= (head!504 (bitStreamReadBitsIntoList!0 (_2!2928 lt!97945) (_1!2929 lt!97944) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!800 (bitStreamReadBitsIntoList!0 (_2!2928 lt!97945) (_1!2929 lt!97944) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62389 d!19404))

(declare-fun b!62674 () Bool)

(declare-datatypes ((tuple2!5644 0))(
  ( (tuple2!5645 (_1!2933 List!685) (_2!2933 BitStream!2220)) )
))
(declare-fun e!41607 () tuple2!5644)

(assert (=> b!62674 (= e!41607 (tuple2!5645 Nil!682 (_1!2929 lt!97944)))))

(declare-fun b!62676 () Bool)

(declare-fun e!41606 () Bool)

(declare-fun lt!98462 () List!685)

(declare-fun isEmpty!189 (List!685) Bool)

(assert (=> b!62676 (= e!41606 (isEmpty!189 lt!98462))))

(declare-fun b!62677 () Bool)

(assert (=> b!62677 (= e!41606 (> (length!313 lt!98462) 0))))

(declare-fun b!62675 () Bool)

(declare-fun lt!98460 () (_ BitVec 64))

(declare-datatypes ((tuple2!5646 0))(
  ( (tuple2!5647 (_1!2934 Bool) (_2!2934 BitStream!2220)) )
))
(declare-fun lt!98461 () tuple2!5646)

(assert (=> b!62675 (= e!41607 (tuple2!5645 (Cons!681 (_1!2934 lt!98461) (bitStreamReadBitsIntoList!0 (_2!2928 lt!97945) (_2!2934 lt!98461) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!98460))) (_2!2934 lt!98461)))))

(declare-fun readBit!0 (BitStream!2220) tuple2!5646)

(assert (=> b!62675 (= lt!98461 (readBit!0 (_1!2929 lt!97944)))))

(assert (=> b!62675 (= lt!98460 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19406 () Bool)

(assert (=> d!19406 e!41606))

(declare-fun c!4450 () Bool)

(assert (=> d!19406 (= c!4450 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19406 (= lt!98462 (_1!2933 e!41607))))

(declare-fun c!4451 () Bool)

(assert (=> d!19406 (= c!4451 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19406 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19406 (= (bitStreamReadBitsIntoList!0 (_2!2928 lt!97945) (_1!2929 lt!97944) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98462)))

(assert (= (and d!19406 c!4451) b!62674))

(assert (= (and d!19406 (not c!4451)) b!62675))

(assert (= (and d!19406 c!4450) b!62676))

(assert (= (and d!19406 (not c!4450)) b!62677))

(declare-fun m!99145 () Bool)

(assert (=> b!62676 m!99145))

(declare-fun m!99147 () Bool)

(assert (=> b!62677 m!99147))

(declare-fun m!99149 () Bool)

(assert (=> b!62675 m!99149))

(declare-fun m!99151 () Bool)

(assert (=> b!62675 m!99151))

(assert (=> b!62389 d!19406))

(declare-fun d!19408 () Bool)

(declare-fun res!52132 () Bool)

(declare-fun e!41609 () Bool)

(assert (=> d!19408 (=> (not res!52132) (not e!41609))))

(assert (=> d!19408 (= res!52132 (= (size!1275 (buf!1656 thiss!1379)) (size!1275 (buf!1656 (_2!2928 lt!97945)))))))

(assert (=> d!19408 (= (isPrefixOf!0 thiss!1379 (_2!2928 lt!97945)) e!41609)))

(declare-fun b!62678 () Bool)

(declare-fun res!52131 () Bool)

(assert (=> b!62678 (=> (not res!52131) (not e!41609))))

(assert (=> b!62678 (= res!52131 (bvsle (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945)))))))

(declare-fun b!62679 () Bool)

(declare-fun e!41608 () Bool)

(assert (=> b!62679 (= e!41609 e!41608)))

(declare-fun res!52130 () Bool)

(assert (=> b!62679 (=> res!52130 e!41608)))

(assert (=> b!62679 (= res!52130 (= (size!1275 (buf!1656 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62680 () Bool)

(assert (=> b!62680 (= e!41608 (arrayBitRangesEq!0 (buf!1656 thiss!1379) (buf!1656 (_2!2928 lt!97945)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379))))))

(assert (= (and d!19408 res!52132) b!62678))

(assert (= (and b!62678 res!52131) b!62679))

(assert (= (and b!62679 (not res!52130)) b!62680))

(assert (=> b!62678 m!98687))

(assert (=> b!62678 m!98709))

(assert (=> b!62680 m!98687))

(assert (=> b!62680 m!98687))

(declare-fun m!99153 () Bool)

(assert (=> b!62680 m!99153))

(assert (=> b!62391 d!19408))

(declare-fun d!19410 () Bool)

(assert (=> d!19410 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!97947) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945)))) lt!97947))))

(declare-fun bs!4812 () Bool)

(assert (= bs!4812 d!19410))

(declare-fun m!99155 () Bool)

(assert (=> bs!4812 m!99155))

(assert (=> b!62391 d!19410))

(declare-fun d!19412 () Bool)

(declare-fun e!41612 () Bool)

(assert (=> d!19412 e!41612))

(declare-fun res!52135 () Bool)

(assert (=> d!19412 (=> (not res!52135) (not e!41612))))

(assert (=> d!19412 (= res!52135 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!98465 () Unit!4245)

(declare-fun choose!27 (BitStream!2220 BitStream!2220 (_ BitVec 64) (_ BitVec 64)) Unit!4245)

(assert (=> d!19412 (= lt!98465 (choose!27 thiss!1379 (_2!2928 lt!97945) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19412 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19412 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2928 lt!97945) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98465)))

(declare-fun b!62683 () Bool)

(assert (=> b!62683 (= e!41612 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19412 res!52135) b!62683))

(declare-fun m!99157 () Bool)

(assert (=> d!19412 m!99157))

(declare-fun m!99159 () Bool)

(assert (=> b!62683 m!99159))

(assert (=> b!62391 d!19412))

(declare-fun b!62730 () Bool)

(declare-fun e!41633 () Bool)

(declare-datatypes ((tuple2!5648 0))(
  ( (tuple2!5649 (_1!2935 BitStream!2220) (_2!2935 Bool)) )
))
(declare-fun lt!98651 () tuple2!5648)

(declare-fun lt!98656 () tuple2!5634)

(assert (=> b!62730 (= e!41633 (= (bitIndex!0 (size!1275 (buf!1656 (_1!2935 lt!98651))) (currentByte!3292 (_1!2935 lt!98651)) (currentBit!3287 (_1!2935 lt!98651))) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98656))) (currentByte!3292 (_2!2928 lt!98656)) (currentBit!3287 (_2!2928 lt!98656)))))))

(declare-fun b!62731 () Bool)

(declare-fun res!52173 () Bool)

(declare-fun e!41632 () Bool)

(assert (=> b!62731 (=> (not res!52173) (not e!41632))))

(declare-fun lt!98653 () (_ BitVec 64))

(declare-fun lt!98649 () (_ BitVec 64))

(assert (=> b!62731 (= res!52173 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98656))) (currentByte!3292 (_2!2928 lt!98656)) (currentBit!3287 (_2!2928 lt!98656))) (bvadd lt!98653 lt!98649)))))

(assert (=> b!62731 (or (not (= (bvand lt!98653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98649 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!98653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!98653 lt!98649) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62731 (= lt!98649 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!62731 (= lt!98653 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(declare-fun b!62732 () Bool)

(declare-fun res!52175 () Bool)

(assert (=> b!62732 (=> (not res!52175) (not e!41632))))

(assert (=> b!62732 (= res!52175 (isPrefixOf!0 thiss!1379 (_2!2928 lt!98656)))))

(declare-fun b!62733 () Bool)

(declare-fun e!41634 () Bool)

(declare-fun lt!98648 () tuple2!5648)

(declare-fun lt!98646 () tuple2!5634)

(assert (=> b!62733 (= e!41634 (= (bitIndex!0 (size!1275 (buf!1656 (_1!2935 lt!98648))) (currentByte!3292 (_1!2935 lt!98648)) (currentBit!3287 (_1!2935 lt!98648))) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98646))) (currentByte!3292 (_2!2928 lt!98646)) (currentBit!3287 (_2!2928 lt!98646)))))))

(declare-fun d!19414 () Bool)

(assert (=> d!19414 e!41632))

(declare-fun res!52177 () Bool)

(assert (=> d!19414 (=> (not res!52177) (not e!41632))))

(assert (=> d!19414 (= res!52177 (= (size!1275 (buf!1656 (_2!2928 lt!98656))) (size!1275 (buf!1656 thiss!1379))))))

(declare-fun lt!98655 () (_ BitVec 8))

(declare-fun lt!98647 () array!2790)

(assert (=> d!19414 (= lt!98655 (select (arr!1839 lt!98647) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19414 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1275 lt!98647)))))

(assert (=> d!19414 (= lt!98647 (array!2791 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!98654 () tuple2!5634)

(assert (=> d!19414 (= lt!98656 (tuple2!5635 (_1!2928 lt!98654) (_2!2928 lt!98654)))))

(assert (=> d!19414 (= lt!98654 lt!98646)))

(declare-fun e!41635 () Bool)

(assert (=> d!19414 e!41635))

(declare-fun res!52178 () Bool)

(assert (=> d!19414 (=> (not res!52178) (not e!41635))))

(assert (=> d!19414 (= res!52178 (= (size!1275 (buf!1656 thiss!1379)) (size!1275 (buf!1656 (_2!2928 lt!98646)))))))

(declare-fun lt!98657 () Bool)

(declare-fun appendBit!0 (BitStream!2220 Bool) tuple2!5634)

(assert (=> d!19414 (= lt!98646 (appendBit!0 thiss!1379 lt!98657))))

(assert (=> d!19414 (= lt!98657 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1839 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19414 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19414 (= (appendBitFromByte!0 thiss!1379 (select (arr!1839 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!98656)))

(declare-fun b!62734 () Bool)

(assert (=> b!62734 (= e!41635 e!41634)))

(declare-fun res!52179 () Bool)

(assert (=> b!62734 (=> (not res!52179) (not e!41634))))

(assert (=> b!62734 (= res!52179 (and (= (_2!2935 lt!98648) lt!98657) (= (_1!2935 lt!98648) (_2!2928 lt!98646))))))

(declare-fun readBitPure!0 (BitStream!2220) tuple2!5648)

(declare-fun readerFrom!0 (BitStream!2220 (_ BitVec 32) (_ BitVec 32)) BitStream!2220)

(assert (=> b!62734 (= lt!98648 (readBitPure!0 (readerFrom!0 (_2!2928 lt!98646) (currentBit!3287 thiss!1379) (currentByte!3292 thiss!1379))))))

(declare-fun b!62735 () Bool)

(assert (=> b!62735 (= e!41632 e!41633)))

(declare-fun res!52176 () Bool)

(assert (=> b!62735 (=> (not res!52176) (not e!41633))))

(assert (=> b!62735 (= res!52176 (and (= (_2!2935 lt!98651) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1839 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!98655)) #b00000000000000000000000000000000))) (= (_1!2935 lt!98651) (_2!2928 lt!98656))))))

(declare-fun lt!98650 () tuple2!5642)

(declare-fun lt!98652 () BitStream!2220)

(assert (=> b!62735 (= lt!98650 (readBits!0 lt!98652 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62735 (= lt!98651 (readBitPure!0 lt!98652))))

(assert (=> b!62735 (= lt!98652 (readerFrom!0 (_2!2928 lt!98656) (currentBit!3287 thiss!1379) (currentByte!3292 thiss!1379)))))

(declare-fun b!62736 () Bool)

(declare-fun res!52180 () Bool)

(assert (=> b!62736 (=> (not res!52180) (not e!41635))))

(assert (=> b!62736 (= res!52180 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!98646))) (currentByte!3292 (_2!2928 lt!98646)) (currentBit!3287 (_2!2928 lt!98646))) (bvadd (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62737 () Bool)

(declare-fun res!52174 () Bool)

(assert (=> b!62737 (=> (not res!52174) (not e!41635))))

(assert (=> b!62737 (= res!52174 (isPrefixOf!0 thiss!1379 (_2!2928 lt!98646)))))

(assert (= (and d!19414 res!52178) b!62736))

(assert (= (and b!62736 res!52180) b!62737))

(assert (= (and b!62737 res!52174) b!62734))

(assert (= (and b!62734 res!52179) b!62733))

(assert (= (and d!19414 res!52177) b!62731))

(assert (= (and b!62731 res!52173) b!62732))

(assert (= (and b!62732 res!52175) b!62735))

(assert (= (and b!62735 res!52176) b!62730))

(declare-fun m!99279 () Bool)

(assert (=> b!62731 m!99279))

(assert (=> b!62731 m!98687))

(declare-fun m!99281 () Bool)

(assert (=> b!62734 m!99281))

(assert (=> b!62734 m!99281))

(declare-fun m!99283 () Bool)

(assert (=> b!62734 m!99283))

(declare-fun m!99285 () Bool)

(assert (=> b!62737 m!99285))

(declare-fun m!99287 () Bool)

(assert (=> d!19414 m!99287))

(declare-fun m!99289 () Bool)

(assert (=> d!19414 m!99289))

(assert (=> d!19414 m!99141))

(declare-fun m!99291 () Bool)

(assert (=> b!62730 m!99291))

(assert (=> b!62730 m!99279))

(declare-fun m!99293 () Bool)

(assert (=> b!62735 m!99293))

(declare-fun m!99295 () Bool)

(assert (=> b!62735 m!99295))

(declare-fun m!99297 () Bool)

(assert (=> b!62735 m!99297))

(declare-fun m!99299 () Bool)

(assert (=> b!62733 m!99299))

(declare-fun m!99301 () Bool)

(assert (=> b!62733 m!99301))

(declare-fun m!99303 () Bool)

(assert (=> b!62732 m!99303))

(assert (=> b!62736 m!99301))

(assert (=> b!62736 m!98687))

(assert (=> b!62391 d!19414))

(declare-fun d!19428 () Bool)

(declare-fun e!41636 () Bool)

(assert (=> d!19428 e!41636))

(declare-fun res!52181 () Bool)

(assert (=> d!19428 (=> (not res!52181) (not e!41636))))

(declare-fun lt!98661 () (_ BitVec 64))

(declare-fun lt!98660 () (_ BitVec 64))

(declare-fun lt!98662 () (_ BitVec 64))

(assert (=> d!19428 (= res!52181 (= lt!98661 (bvsub lt!98662 lt!98660)))))

(assert (=> d!19428 (or (= (bvand lt!98662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98662 lt!98660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19428 (= lt!98660 (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97936))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97936)))))))

(declare-fun lt!98663 () (_ BitVec 64))

(declare-fun lt!98659 () (_ BitVec 64))

(assert (=> d!19428 (= lt!98662 (bvmul lt!98663 lt!98659))))

(assert (=> d!19428 (or (= lt!98663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98659 (bvsdiv (bvmul lt!98663 lt!98659) lt!98663)))))

(assert (=> d!19428 (= lt!98659 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19428 (= lt!98663 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))))))

(assert (=> d!19428 (= lt!98661 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97936))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97936)))))))

(assert (=> d!19428 (invariant!0 (currentBit!3287 (_2!2928 lt!97936)) (currentByte!3292 (_2!2928 lt!97936)) (size!1275 (buf!1656 (_2!2928 lt!97936))))))

(assert (=> d!19428 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936))) lt!98661)))

(declare-fun b!62738 () Bool)

(declare-fun res!52182 () Bool)

(assert (=> b!62738 (=> (not res!52182) (not e!41636))))

(assert (=> b!62738 (= res!52182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98661))))

(declare-fun b!62739 () Bool)

(declare-fun lt!98658 () (_ BitVec 64))

(assert (=> b!62739 (= e!41636 (bvsle lt!98661 (bvmul lt!98658 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62739 (or (= lt!98658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98658)))))

(assert (=> b!62739 (= lt!98658 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))))))

(assert (= (and d!19428 res!52181) b!62738))

(assert (= (and b!62738 res!52182) b!62739))

(declare-fun m!99305 () Bool)

(assert (=> d!19428 m!99305))

(assert (=> d!19428 m!98677))

(assert (=> b!62401 d!19428))

(declare-fun d!19430 () Bool)

(declare-fun res!52185 () Bool)

(declare-fun e!41638 () Bool)

(assert (=> d!19430 (=> (not res!52185) (not e!41638))))

(assert (=> d!19430 (= res!52185 (= (size!1275 (buf!1656 (_1!2929 lt!97951))) (size!1275 (buf!1656 (_2!2928 lt!97936)))))))

(assert (=> d!19430 (= (isPrefixOf!0 (_1!2929 lt!97951) (_2!2928 lt!97936)) e!41638)))

(declare-fun b!62740 () Bool)

(declare-fun res!52184 () Bool)

(assert (=> b!62740 (=> (not res!52184) (not e!41638))))

(assert (=> b!62740 (= res!52184 (bvsle (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97951))) (currentByte!3292 (_1!2929 lt!97951)) (currentBit!3287 (_1!2929 lt!97951))) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936)))))))

(declare-fun b!62741 () Bool)

(declare-fun e!41637 () Bool)

(assert (=> b!62741 (= e!41638 e!41637)))

(declare-fun res!52183 () Bool)

(assert (=> b!62741 (=> res!52183 e!41637)))

(assert (=> b!62741 (= res!52183 (= (size!1275 (buf!1656 (_1!2929 lt!97951))) #b00000000000000000000000000000000))))

(declare-fun b!62742 () Bool)

(assert (=> b!62742 (= e!41637 (arrayBitRangesEq!0 (buf!1656 (_1!2929 lt!97951)) (buf!1656 (_2!2928 lt!97936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97951))) (currentByte!3292 (_1!2929 lt!97951)) (currentBit!3287 (_1!2929 lt!97951)))))))

(assert (= (and d!19430 res!52185) b!62740))

(assert (= (and b!62740 res!52184) b!62741))

(assert (= (and b!62741 (not res!52183)) b!62742))

(assert (=> b!62740 m!99137))

(assert (=> b!62740 m!98731))

(assert (=> b!62742 m!99137))

(assert (=> b!62742 m!99137))

(declare-fun m!99307 () Bool)

(assert (=> b!62742 m!99307))

(assert (=> b!62390 d!19430))

(declare-fun d!19432 () Bool)

(assert (=> d!19432 (= (invariant!0 (currentBit!3287 (_2!2928 lt!97945)) (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97945)))) (and (bvsge (currentBit!3287 (_2!2928 lt!97945)) #b00000000000000000000000000000000) (bvslt (currentBit!3287 (_2!2928 lt!97945)) #b00000000000000000000000000001000) (bvsge (currentByte!3292 (_2!2928 lt!97945)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97945)))) (and (= (currentBit!3287 (_2!2928 lt!97945)) #b00000000000000000000000000000000) (= (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97945))))))))))

(assert (=> b!62387 d!19432))

(declare-fun d!19434 () Bool)

(declare-fun res!52188 () Bool)

(declare-fun e!41640 () Bool)

(assert (=> d!19434 (=> (not res!52188) (not e!41640))))

(assert (=> d!19434 (= res!52188 (= (size!1275 (buf!1656 (_1!2929 lt!97941))) (size!1275 (buf!1656 (_2!2928 lt!97936)))))))

(assert (=> d!19434 (= (isPrefixOf!0 (_1!2929 lt!97941) (_2!2928 lt!97936)) e!41640)))

(declare-fun b!62743 () Bool)

(declare-fun res!52187 () Bool)

(assert (=> b!62743 (=> (not res!52187) (not e!41640))))

(assert (=> b!62743 (= res!52187 (bvsle (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97941))) (currentByte!3292 (_1!2929 lt!97941)) (currentBit!3287 (_1!2929 lt!97941))) (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936)))))))

(declare-fun b!62744 () Bool)

(declare-fun e!41639 () Bool)

(assert (=> b!62744 (= e!41640 e!41639)))

(declare-fun res!52186 () Bool)

(assert (=> b!62744 (=> res!52186 e!41639)))

(assert (=> b!62744 (= res!52186 (= (size!1275 (buf!1656 (_1!2929 lt!97941))) #b00000000000000000000000000000000))))

(declare-fun b!62745 () Bool)

(assert (=> b!62745 (= e!41639 (arrayBitRangesEq!0 (buf!1656 (_1!2929 lt!97941)) (buf!1656 (_2!2928 lt!97936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1275 (buf!1656 (_1!2929 lt!97941))) (currentByte!3292 (_1!2929 lt!97941)) (currentBit!3287 (_1!2929 lt!97941)))))))

(assert (= (and d!19434 res!52188) b!62743))

(assert (= (and b!62743 res!52187) b!62744))

(assert (= (and b!62744 (not res!52186)) b!62745))

(assert (=> b!62743 m!99135))

(assert (=> b!62743 m!98731))

(assert (=> b!62745 m!99135))

(assert (=> b!62745 m!99135))

(declare-fun m!99309 () Bool)

(assert (=> b!62745 m!99309))

(assert (=> b!62386 d!19434))

(declare-fun d!19436 () Bool)

(assert (=> d!19436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!97947) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945)))) lt!97947))))

(declare-fun bs!4816 () Bool)

(assert (= bs!4816 d!19436))

(declare-fun m!99311 () Bool)

(assert (=> bs!4816 m!99311))

(assert (=> b!62399 d!19436))

(declare-fun b!62746 () Bool)

(declare-fun res!52191 () Bool)

(declare-fun e!41641 () Bool)

(assert (=> b!62746 (=> (not res!52191) (not e!41641))))

(declare-fun lt!98682 () tuple2!5636)

(assert (=> b!62746 (= res!52191 (isPrefixOf!0 (_2!2929 lt!98682) (_2!2928 lt!97936)))))

(declare-fun d!19438 () Bool)

(assert (=> d!19438 e!41641))

(declare-fun res!52190 () Bool)

(assert (=> d!19438 (=> (not res!52190) (not e!41641))))

(assert (=> d!19438 (= res!52190 (isPrefixOf!0 (_1!2929 lt!98682) (_2!2929 lt!98682)))))

(declare-fun lt!98668 () BitStream!2220)

(assert (=> d!19438 (= lt!98682 (tuple2!5637 lt!98668 (_2!2928 lt!97936)))))

(declare-fun lt!98678 () Unit!4245)

(declare-fun lt!98673 () Unit!4245)

(assert (=> d!19438 (= lt!98678 lt!98673)))

(assert (=> d!19438 (isPrefixOf!0 lt!98668 (_2!2928 lt!97936))))

(assert (=> d!19438 (= lt!98673 (lemmaIsPrefixTransitive!0 lt!98668 (_2!2928 lt!97936) (_2!2928 lt!97936)))))

(declare-fun lt!98666 () Unit!4245)

(declare-fun lt!98665 () Unit!4245)

(assert (=> d!19438 (= lt!98666 lt!98665)))

(assert (=> d!19438 (isPrefixOf!0 lt!98668 (_2!2928 lt!97936))))

(assert (=> d!19438 (= lt!98665 (lemmaIsPrefixTransitive!0 lt!98668 thiss!1379 (_2!2928 lt!97936)))))

(declare-fun lt!98671 () Unit!4245)

(declare-fun e!41642 () Unit!4245)

(assert (=> d!19438 (= lt!98671 e!41642)))

(declare-fun c!4456 () Bool)

(assert (=> d!19438 (= c!4456 (not (= (size!1275 (buf!1656 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!98670 () Unit!4245)

(declare-fun lt!98680 () Unit!4245)

(assert (=> d!19438 (= lt!98670 lt!98680)))

(assert (=> d!19438 (isPrefixOf!0 (_2!2928 lt!97936) (_2!2928 lt!97936))))

(assert (=> d!19438 (= lt!98680 (lemmaIsPrefixRefl!0 (_2!2928 lt!97936)))))

(declare-fun lt!98674 () Unit!4245)

(declare-fun lt!98679 () Unit!4245)

(assert (=> d!19438 (= lt!98674 lt!98679)))

(assert (=> d!19438 (= lt!98679 (lemmaIsPrefixRefl!0 (_2!2928 lt!97936)))))

(declare-fun lt!98677 () Unit!4245)

(declare-fun lt!98683 () Unit!4245)

(assert (=> d!19438 (= lt!98677 lt!98683)))

(assert (=> d!19438 (isPrefixOf!0 lt!98668 lt!98668)))

(assert (=> d!19438 (= lt!98683 (lemmaIsPrefixRefl!0 lt!98668))))

(declare-fun lt!98675 () Unit!4245)

(declare-fun lt!98664 () Unit!4245)

(assert (=> d!19438 (= lt!98675 lt!98664)))

(assert (=> d!19438 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19438 (= lt!98664 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19438 (= lt!98668 (BitStream!2221 (buf!1656 (_2!2928 lt!97936)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(assert (=> d!19438 (isPrefixOf!0 thiss!1379 (_2!2928 lt!97936))))

(assert (=> d!19438 (= (reader!0 thiss!1379 (_2!2928 lt!97936)) lt!98682)))

(declare-fun b!62747 () Bool)

(declare-fun lt!98681 () Unit!4245)

(assert (=> b!62747 (= e!41642 lt!98681)))

(declare-fun lt!98667 () (_ BitVec 64))

(assert (=> b!62747 (= lt!98667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98672 () (_ BitVec 64))

(assert (=> b!62747 (= lt!98672 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(assert (=> b!62747 (= lt!98681 (arrayBitRangesEqSymmetric!0 (buf!1656 thiss!1379) (buf!1656 (_2!2928 lt!97936)) lt!98667 lt!98672))))

(assert (=> b!62747 (arrayBitRangesEq!0 (buf!1656 (_2!2928 lt!97936)) (buf!1656 thiss!1379) lt!98667 lt!98672)))

(declare-fun lt!98676 () (_ BitVec 64))

(declare-fun b!62748 () Bool)

(declare-fun lt!98669 () (_ BitVec 64))

(assert (=> b!62748 (= e!41641 (= (_1!2929 lt!98682) (withMovedBitIndex!0 (_2!2929 lt!98682) (bvsub lt!98669 lt!98676))))))

(assert (=> b!62748 (or (= (bvand lt!98669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98676 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98669 lt!98676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62748 (= lt!98676 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936))))))

(assert (=> b!62748 (= lt!98669 (bitIndex!0 (size!1275 (buf!1656 thiss!1379)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379)))))

(declare-fun b!62749 () Bool)

(declare-fun res!52189 () Bool)

(assert (=> b!62749 (=> (not res!52189) (not e!41641))))

(assert (=> b!62749 (= res!52189 (isPrefixOf!0 (_1!2929 lt!98682) thiss!1379))))

(declare-fun b!62750 () Bool)

(declare-fun Unit!4257 () Unit!4245)

(assert (=> b!62750 (= e!41642 Unit!4257)))

(assert (= (and d!19438 c!4456) b!62747))

(assert (= (and d!19438 (not c!4456)) b!62750))

(assert (= (and d!19438 res!52190) b!62749))

(assert (= (and b!62749 res!52189) b!62746))

(assert (= (and b!62746 res!52191) b!62748))

(declare-fun m!99313 () Bool)

(assert (=> b!62746 m!99313))

(declare-fun m!99315 () Bool)

(assert (=> b!62749 m!99315))

(declare-fun m!99317 () Bool)

(assert (=> d!19438 m!99317))

(declare-fun m!99319 () Bool)

(assert (=> d!19438 m!99319))

(declare-fun m!99321 () Bool)

(assert (=> d!19438 m!99321))

(assert (=> d!19438 m!98689))

(assert (=> d!19438 m!98683))

(assert (=> d!19438 m!98685))

(declare-fun m!99323 () Bool)

(assert (=> d!19438 m!99323))

(declare-fun m!99325 () Bool)

(assert (=> d!19438 m!99325))

(declare-fun m!99327 () Bool)

(assert (=> d!19438 m!99327))

(declare-fun m!99329 () Bool)

(assert (=> d!19438 m!99329))

(declare-fun m!99331 () Bool)

(assert (=> d!19438 m!99331))

(assert (=> b!62747 m!98687))

(declare-fun m!99333 () Bool)

(assert (=> b!62747 m!99333))

(declare-fun m!99335 () Bool)

(assert (=> b!62747 m!99335))

(declare-fun m!99337 () Bool)

(assert (=> b!62748 m!99337))

(assert (=> b!62748 m!98731))

(assert (=> b!62748 m!98687))

(assert (=> b!62399 d!19438))

(declare-fun d!19440 () Bool)

(assert (=> d!19440 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4817 () Bool)

(assert (= bs!4817 d!19440))

(declare-fun m!99339 () Bool)

(assert (=> bs!4817 m!99339))

(assert (=> b!62399 d!19440))

(declare-fun d!19442 () Bool)

(assert (=> d!19442 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 thiss!1379)) ((_ sign_extend 32) (currentBit!3287 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!98684 () Unit!4245)

(assert (=> d!19442 (= lt!98684 (choose!9 thiss!1379 (buf!1656 (_2!2928 lt!97936)) (bvsub to!314 i!635) (BitStream!2221 (buf!1656 (_2!2928 lt!97936)) (currentByte!3292 thiss!1379) (currentBit!3287 thiss!1379))))))

(assert (=> d!19442 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1656 (_2!2928 lt!97936)) (bvsub to!314 i!635)) lt!98684)))

(declare-fun bs!4818 () Bool)

(assert (= bs!4818 d!19442))

(assert (=> bs!4818 m!98721))

(declare-fun m!99341 () Bool)

(assert (=> bs!4818 m!99341))

(assert (=> b!62399 d!19442))

(declare-fun b!62751 () Bool)

(declare-fun res!52194 () Bool)

(declare-fun e!41643 () Bool)

(assert (=> b!62751 (=> (not res!52194) (not e!41643))))

(declare-fun lt!98703 () tuple2!5636)

(assert (=> b!62751 (= res!52194 (isPrefixOf!0 (_2!2929 lt!98703) (_2!2928 lt!97936)))))

(declare-fun d!19444 () Bool)

(assert (=> d!19444 e!41643))

(declare-fun res!52193 () Bool)

(assert (=> d!19444 (=> (not res!52193) (not e!41643))))

(assert (=> d!19444 (= res!52193 (isPrefixOf!0 (_1!2929 lt!98703) (_2!2929 lt!98703)))))

(declare-fun lt!98689 () BitStream!2220)

(assert (=> d!19444 (= lt!98703 (tuple2!5637 lt!98689 (_2!2928 lt!97936)))))

(declare-fun lt!98699 () Unit!4245)

(declare-fun lt!98694 () Unit!4245)

(assert (=> d!19444 (= lt!98699 lt!98694)))

(assert (=> d!19444 (isPrefixOf!0 lt!98689 (_2!2928 lt!97936))))

(assert (=> d!19444 (= lt!98694 (lemmaIsPrefixTransitive!0 lt!98689 (_2!2928 lt!97936) (_2!2928 lt!97936)))))

(declare-fun lt!98687 () Unit!4245)

(declare-fun lt!98686 () Unit!4245)

(assert (=> d!19444 (= lt!98687 lt!98686)))

(assert (=> d!19444 (isPrefixOf!0 lt!98689 (_2!2928 lt!97936))))

(assert (=> d!19444 (= lt!98686 (lemmaIsPrefixTransitive!0 lt!98689 (_2!2928 lt!97945) (_2!2928 lt!97936)))))

(declare-fun lt!98692 () Unit!4245)

(declare-fun e!41644 () Unit!4245)

(assert (=> d!19444 (= lt!98692 e!41644)))

(declare-fun c!4457 () Bool)

(assert (=> d!19444 (= c!4457 (not (= (size!1275 (buf!1656 (_2!2928 lt!97945))) #b00000000000000000000000000000000)))))

(declare-fun lt!98691 () Unit!4245)

(declare-fun lt!98701 () Unit!4245)

(assert (=> d!19444 (= lt!98691 lt!98701)))

(assert (=> d!19444 (isPrefixOf!0 (_2!2928 lt!97936) (_2!2928 lt!97936))))

(assert (=> d!19444 (= lt!98701 (lemmaIsPrefixRefl!0 (_2!2928 lt!97936)))))

(declare-fun lt!98695 () Unit!4245)

(declare-fun lt!98700 () Unit!4245)

(assert (=> d!19444 (= lt!98695 lt!98700)))

(assert (=> d!19444 (= lt!98700 (lemmaIsPrefixRefl!0 (_2!2928 lt!97936)))))

(declare-fun lt!98698 () Unit!4245)

(declare-fun lt!98704 () Unit!4245)

(assert (=> d!19444 (= lt!98698 lt!98704)))

(assert (=> d!19444 (isPrefixOf!0 lt!98689 lt!98689)))

(assert (=> d!19444 (= lt!98704 (lemmaIsPrefixRefl!0 lt!98689))))

(declare-fun lt!98696 () Unit!4245)

(declare-fun lt!98685 () Unit!4245)

(assert (=> d!19444 (= lt!98696 lt!98685)))

(assert (=> d!19444 (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!97945))))

(assert (=> d!19444 (= lt!98685 (lemmaIsPrefixRefl!0 (_2!2928 lt!97945)))))

(assert (=> d!19444 (= lt!98689 (BitStream!2221 (buf!1656 (_2!2928 lt!97936)) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))))))

(assert (=> d!19444 (isPrefixOf!0 (_2!2928 lt!97945) (_2!2928 lt!97936))))

(assert (=> d!19444 (= (reader!0 (_2!2928 lt!97945) (_2!2928 lt!97936)) lt!98703)))

(declare-fun b!62752 () Bool)

(declare-fun lt!98702 () Unit!4245)

(assert (=> b!62752 (= e!41644 lt!98702)))

(declare-fun lt!98688 () (_ BitVec 64))

(assert (=> b!62752 (= lt!98688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98693 () (_ BitVec 64))

(assert (=> b!62752 (= lt!98693 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))))))

(assert (=> b!62752 (= lt!98702 (arrayBitRangesEqSymmetric!0 (buf!1656 (_2!2928 lt!97945)) (buf!1656 (_2!2928 lt!97936)) lt!98688 lt!98693))))

(assert (=> b!62752 (arrayBitRangesEq!0 (buf!1656 (_2!2928 lt!97936)) (buf!1656 (_2!2928 lt!97945)) lt!98688 lt!98693)))

(declare-fun b!62753 () Bool)

(declare-fun lt!98690 () (_ BitVec 64))

(declare-fun lt!98697 () (_ BitVec 64))

(assert (=> b!62753 (= e!41643 (= (_1!2929 lt!98703) (withMovedBitIndex!0 (_2!2929 lt!98703) (bvsub lt!98690 lt!98697))))))

(assert (=> b!62753 (or (= (bvand lt!98690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98690 lt!98697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62753 (= lt!98697 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97936))) (currentByte!3292 (_2!2928 lt!97936)) (currentBit!3287 (_2!2928 lt!97936))))))

(assert (=> b!62753 (= lt!98690 (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))))))

(declare-fun b!62754 () Bool)

(declare-fun res!52192 () Bool)

(assert (=> b!62754 (=> (not res!52192) (not e!41643))))

(assert (=> b!62754 (= res!52192 (isPrefixOf!0 (_1!2929 lt!98703) (_2!2928 lt!97945)))))

(declare-fun b!62755 () Bool)

(declare-fun Unit!4258 () Unit!4245)

(assert (=> b!62755 (= e!41644 Unit!4258)))

(assert (= (and d!19444 c!4457) b!62752))

(assert (= (and d!19444 (not c!4457)) b!62755))

(assert (= (and d!19444 res!52193) b!62754))

(assert (= (and b!62754 res!52192) b!62751))

(assert (= (and b!62751 res!52194) b!62753))

(declare-fun m!99343 () Bool)

(assert (=> b!62751 m!99343))

(declare-fun m!99345 () Bool)

(assert (=> b!62754 m!99345))

(assert (=> d!19444 m!99317))

(assert (=> d!19444 m!99319))

(declare-fun m!99347 () Bool)

(assert (=> d!19444 m!99347))

(assert (=> d!19444 m!98701))

(assert (=> d!19444 m!99087))

(assert (=> d!19444 m!99089))

(declare-fun m!99349 () Bool)

(assert (=> d!19444 m!99349))

(declare-fun m!99351 () Bool)

(assert (=> d!19444 m!99351))

(declare-fun m!99353 () Bool)

(assert (=> d!19444 m!99353))

(declare-fun m!99355 () Bool)

(assert (=> d!19444 m!99355))

(declare-fun m!99357 () Bool)

(assert (=> d!19444 m!99357))

(assert (=> b!62752 m!98709))

(declare-fun m!99359 () Bool)

(assert (=> b!62752 m!99359))

(declare-fun m!99361 () Bool)

(assert (=> b!62752 m!99361))

(declare-fun m!99363 () Bool)

(assert (=> b!62753 m!99363))

(assert (=> b!62753 m!98731))

(assert (=> b!62753 m!98709))

(assert (=> b!62399 d!19444))

(declare-fun d!19446 () Bool)

(assert (=> d!19446 (validate_offset_bits!1 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97936)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945))) lt!97947)))

(declare-fun lt!98705 () Unit!4245)

(assert (=> d!19446 (= lt!98705 (choose!9 (_2!2928 lt!97945) (buf!1656 (_2!2928 lt!97936)) lt!97947 (BitStream!2221 (buf!1656 (_2!2928 lt!97936)) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945)))))))

(assert (=> d!19446 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2928 lt!97945) (buf!1656 (_2!2928 lt!97936)) lt!97947) lt!98705)))

(declare-fun bs!4819 () Bool)

(assert (= bs!4819 d!19446))

(assert (=> bs!4819 m!98715))

(declare-fun m!99365 () Bool)

(assert (=> bs!4819 m!99365))

(assert (=> b!62399 d!19446))

(declare-fun b!62760 () Bool)

(declare-fun e!41648 () tuple2!5644)

(assert (=> b!62760 (= e!41648 (tuple2!5645 Nil!682 (_1!2929 lt!97941)))))

(declare-fun b!62762 () Bool)

(declare-fun e!41647 () Bool)

(declare-fun lt!98710 () List!685)

(assert (=> b!62762 (= e!41647 (isEmpty!189 lt!98710))))

(declare-fun b!62763 () Bool)

(assert (=> b!62763 (= e!41647 (> (length!313 lt!98710) 0))))

(declare-fun lt!98709 () tuple2!5646)

(declare-fun b!62761 () Bool)

(declare-fun lt!98708 () (_ BitVec 64))

(assert (=> b!62761 (= e!41648 (tuple2!5645 (Cons!681 (_1!2934 lt!98709) (bitStreamReadBitsIntoList!0 (_2!2928 lt!97936) (_2!2934 lt!98709) (bvsub (bvsub to!314 i!635) lt!98708))) (_2!2934 lt!98709)))))

(assert (=> b!62761 (= lt!98709 (readBit!0 (_1!2929 lt!97941)))))

(assert (=> b!62761 (= lt!98708 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19448 () Bool)

(assert (=> d!19448 e!41647))

(declare-fun c!4460 () Bool)

(assert (=> d!19448 (= c!4460 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19448 (= lt!98710 (_1!2933 e!41648))))

(declare-fun c!4461 () Bool)

(assert (=> d!19448 (= c!4461 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19448 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19448 (= (bitStreamReadBitsIntoList!0 (_2!2928 lt!97936) (_1!2929 lt!97941) (bvsub to!314 i!635)) lt!98710)))

(assert (= (and d!19448 c!4461) b!62760))

(assert (= (and d!19448 (not c!4461)) b!62761))

(assert (= (and d!19448 c!4460) b!62762))

(assert (= (and d!19448 (not c!4460)) b!62763))

(declare-fun m!99367 () Bool)

(assert (=> b!62762 m!99367))

(declare-fun m!99369 () Bool)

(assert (=> b!62763 m!99369))

(declare-fun m!99371 () Bool)

(assert (=> b!62761 m!99371))

(declare-fun m!99373 () Bool)

(assert (=> b!62761 m!99373))

(assert (=> b!62399 d!19448))

(declare-fun b!62768 () Bool)

(declare-fun e!41652 () tuple2!5644)

(assert (=> b!62768 (= e!41652 (tuple2!5645 Nil!682 (_1!2929 lt!97951)))))

(declare-fun b!62770 () Bool)

(declare-fun e!41651 () Bool)

(declare-fun lt!98717 () List!685)

(assert (=> b!62770 (= e!41651 (isEmpty!189 lt!98717))))

(declare-fun b!62771 () Bool)

(assert (=> b!62771 (= e!41651 (> (length!313 lt!98717) 0))))

(declare-fun b!62769 () Bool)

(declare-fun lt!98715 () (_ BitVec 64))

(declare-fun lt!98716 () tuple2!5646)

(assert (=> b!62769 (= e!41652 (tuple2!5645 (Cons!681 (_1!2934 lt!98716) (bitStreamReadBitsIntoList!0 (_2!2928 lt!97936) (_2!2934 lt!98716) (bvsub lt!97947 lt!98715))) (_2!2934 lt!98716)))))

(assert (=> b!62769 (= lt!98716 (readBit!0 (_1!2929 lt!97951)))))

(assert (=> b!62769 (= lt!98715 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19450 () Bool)

(assert (=> d!19450 e!41651))

(declare-fun c!4464 () Bool)

(assert (=> d!19450 (= c!4464 (= lt!97947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19450 (= lt!98717 (_1!2933 e!41652))))

(declare-fun c!4465 () Bool)

(assert (=> d!19450 (= c!4465 (= lt!97947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19450 (bvsge lt!97947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19450 (= (bitStreamReadBitsIntoList!0 (_2!2928 lt!97936) (_1!2929 lt!97951) lt!97947) lt!98717)))

(assert (= (and d!19450 c!4465) b!62768))

(assert (= (and d!19450 (not c!4465)) b!62769))

(assert (= (and d!19450 c!4464) b!62770))

(assert (= (and d!19450 (not c!4464)) b!62771))

(declare-fun m!99375 () Bool)

(assert (=> b!62770 m!99375))

(declare-fun m!99377 () Bool)

(assert (=> b!62771 m!99377))

(declare-fun m!99379 () Bool)

(assert (=> b!62769 m!99379))

(declare-fun m!99381 () Bool)

(assert (=> b!62769 m!99381))

(assert (=> b!62399 d!19450))

(declare-fun d!19452 () Bool)

(declare-fun e!41653 () Bool)

(assert (=> d!19452 e!41653))

(declare-fun res!52195 () Bool)

(assert (=> d!19452 (=> (not res!52195) (not e!41653))))

(declare-fun lt!98721 () (_ BitVec 64))

(declare-fun lt!98722 () (_ BitVec 64))

(declare-fun lt!98720 () (_ BitVec 64))

(assert (=> d!19452 (= res!52195 (= lt!98721 (bvsub lt!98722 lt!98720)))))

(assert (=> d!19452 (or (= (bvand lt!98722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98722 lt!98720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19452 (= lt!98720 (remainingBits!0 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))) ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945)))))))

(declare-fun lt!98723 () (_ BitVec 64))

(declare-fun lt!98719 () (_ BitVec 64))

(assert (=> d!19452 (= lt!98722 (bvmul lt!98723 lt!98719))))

(assert (=> d!19452 (or (= lt!98723 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98719 (bvsdiv (bvmul lt!98723 lt!98719) lt!98723)))))

(assert (=> d!19452 (= lt!98719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19452 (= lt!98723 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))))))

(assert (=> d!19452 (= lt!98721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3292 (_2!2928 lt!97945))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3287 (_2!2928 lt!97945)))))))

(assert (=> d!19452 (invariant!0 (currentBit!3287 (_2!2928 lt!97945)) (currentByte!3292 (_2!2928 lt!97945)) (size!1275 (buf!1656 (_2!2928 lt!97945))))))

(assert (=> d!19452 (= (bitIndex!0 (size!1275 (buf!1656 (_2!2928 lt!97945))) (currentByte!3292 (_2!2928 lt!97945)) (currentBit!3287 (_2!2928 lt!97945))) lt!98721)))

(declare-fun b!62772 () Bool)

(declare-fun res!52196 () Bool)

(assert (=> b!62772 (=> (not res!52196) (not e!41653))))

(assert (=> b!62772 (= res!52196 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98721))))

(declare-fun b!62773 () Bool)

(declare-fun lt!98718 () (_ BitVec 64))

(assert (=> b!62773 (= e!41653 (bvsle lt!98721 (bvmul lt!98718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62773 (or (= lt!98718 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98718 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98718)))))

(assert (=> b!62773 (= lt!98718 ((_ sign_extend 32) (size!1275 (buf!1656 (_2!2928 lt!97945)))))))

(assert (= (and d!19452 res!52195) b!62772))

(assert (= (and b!62772 res!52196) b!62773))

(assert (=> d!19452 m!99155))

(assert (=> d!19452 m!98713))

(assert (=> b!62398 d!19452))

(declare-fun d!19454 () Bool)

(assert (=> d!19454 (= (array_inv!1169 srcBuffer!2) (bvsge (size!1275 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12230 d!19454))

(declare-fun d!19456 () Bool)

(assert (=> d!19456 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3287 thiss!1379) (currentByte!3292 thiss!1379) (size!1275 (buf!1656 thiss!1379))))))

(declare-fun bs!4820 () Bool)

(assert (= bs!4820 d!19456))

(assert (=> bs!4820 m!98821))

(assert (=> start!12230 d!19456))

(check-sat (not d!19440) (not b!62762) (not b!62736) (not b!62769) (not b!62653) (not b!62631) (not b!62652) (not d!19384) (not d!19396) (not b!62654) (not b!62467) (not d!19284) (not d!19438) (not d!19412) (not b!62735) (not b!62635) (not b!62732) (not b!62745) (not b!62754) (not d!19290) (not d!19414) (not d!19446) (not b!62678) (not d!19378) (not d!19410) (not b!62639) (not b!62636) (not b!62665) (not b!62632) (not b!62737) (not b!62657) (not b!62628) (not b!62630) (not b!62761) (not b!62748) (not d!19442) (not b!62676) (not b!62746) (not b!62752) (not d!19388) (not b!62733) (not b!62763) (not b!62641) (not b!62675) (not b!62465) (not b!62747) (not b!62655) (not b!62634) (not b!62731) (not b!62753) (not bm!790) (not b!62677) (not d!19428) (not b!62743) (not d!19436) (not d!19456) (not d!19452) (not b!62749) (not b!62751) (not b!62683) (not b!62730) (not d!19382) (not d!19444) (not b!62771) (not b!62680) (not d!19286) (not b!62740) (not b!62638) (not b!62770) (not d!19288) (not b!62734) (not b!62742) (not b!62659))
