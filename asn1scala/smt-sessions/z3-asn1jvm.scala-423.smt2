; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11066 () Bool)

(assert start!11066)

(declare-fun res!45806 () Bool)

(declare-fun e!36648 () Bool)

(assert (=> start!11066 (=> (not res!45806) (not e!36648))))

(declare-datatypes ((array!2568 0))(
  ( (array!2569 (arr!1713 (Array (_ BitVec 32) (_ BitVec 8))) (size!1170 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2568)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11066 (= res!45806 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1170 srcBuffer!2))))))))

(assert (=> start!11066 e!36648))

(assert (=> start!11066 true))

(declare-fun array_inv!1073 (array!2568) Bool)

(assert (=> start!11066 (array_inv!1073 srcBuffer!2)))

(declare-datatypes ((BitStream!2028 0))(
  ( (BitStream!2029 (buf!1530 array!2568) (currentByte!3109 (_ BitVec 32)) (currentBit!3104 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2028)

(declare-fun e!36646 () Bool)

(declare-fun inv!12 (BitStream!2028) Bool)

(assert (=> start!11066 (and (inv!12 thiss!1379) e!36646)))

(declare-fun b!54952 () Bool)

(declare-fun e!36647 () Bool)

(declare-fun e!36652 () Bool)

(assert (=> b!54952 (= e!36647 e!36652)))

(declare-fun res!45805 () Bool)

(assert (=> b!54952 (=> res!45805 e!36652)))

(declare-datatypes ((Unit!3795 0))(
  ( (Unit!3796) )
))
(declare-datatypes ((tuple2!5010 0))(
  ( (tuple2!5011 (_1!2616 Unit!3795) (_2!2616 BitStream!2028)) )
))
(declare-fun lt!85549 () tuple2!5010)

(declare-fun lt!85545 () tuple2!5010)

(declare-fun isPrefixOf!0 (BitStream!2028 BitStream!2028) Bool)

(assert (=> b!54952 (= res!45805 (not (isPrefixOf!0 (_2!2616 lt!85549) (_2!2616 lt!85545))))))

(assert (=> b!54952 (isPrefixOf!0 thiss!1379 (_2!2616 lt!85545))))

(declare-fun lt!85543 () Unit!3795)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2028 BitStream!2028 BitStream!2028) Unit!3795)

(assert (=> b!54952 (= lt!85543 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2616 lt!85549) (_2!2616 lt!85545)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2028 array!2568 (_ BitVec 64) (_ BitVec 64)) tuple2!5010)

(assert (=> b!54952 (= lt!85545 (appendBitsMSBFirstLoop!0 (_2!2616 lt!85549) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36649 () Bool)

(assert (=> b!54952 e!36649))

(declare-fun res!45808 () Bool)

(assert (=> b!54952 (=> (not res!45808) (not e!36649))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54952 (= res!45808 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85548 () Unit!3795)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2028 array!2568 (_ BitVec 64)) Unit!3795)

(assert (=> b!54952 (= lt!85548 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1530 (_2!2616 lt!85549)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5012 0))(
  ( (tuple2!5013 (_1!2617 BitStream!2028) (_2!2617 BitStream!2028)) )
))
(declare-fun lt!85546 () tuple2!5012)

(declare-fun reader!0 (BitStream!2028 BitStream!2028) tuple2!5012)

(assert (=> b!54952 (= lt!85546 (reader!0 thiss!1379 (_2!2616 lt!85549)))))

(declare-fun b!54953 () Bool)

(declare-fun lt!85544 () (_ BitVec 64))

(declare-fun lt!85540 () (_ BitVec 64))

(assert (=> b!54953 (= e!36652 (or (= lt!85540 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!85540 (bvand (bvsub lt!85544 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54953 (= lt!85540 (bvand lt!85544 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85542 () (_ BitVec 64))

(assert (=> b!54953 (= lt!85544 (bvadd lt!85542 to!314))))

(declare-fun b!54954 () Bool)

(declare-fun e!36650 () Bool)

(assert (=> b!54954 (= e!36650 e!36647)))

(declare-fun res!45809 () Bool)

(assert (=> b!54954 (=> res!45809 e!36647)))

(assert (=> b!54954 (= res!45809 (not (isPrefixOf!0 thiss!1379 (_2!2616 lt!85549))))))

(assert (=> b!54954 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85541 () Unit!3795)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2028 BitStream!2028 (_ BitVec 64) (_ BitVec 64)) Unit!3795)

(assert (=> b!54954 (= lt!85541 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2616 lt!85549) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2028 (_ BitVec 8) (_ BitVec 32)) tuple2!5010)

(assert (=> b!54954 (= lt!85549 (appendBitFromByte!0 thiss!1379 (select (arr!1713 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54955 () Bool)

(declare-fun res!45810 () Bool)

(assert (=> b!54955 (=> (not res!45810) (not e!36648))))

(assert (=> b!54955 (= res!45810 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 thiss!1379))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54956 () Bool)

(assert (=> b!54956 (= e!36646 (array_inv!1073 (buf!1530 thiss!1379)))))

(declare-fun b!54957 () Bool)

(declare-datatypes ((List!589 0))(
  ( (Nil!586) (Cons!585 (h!704 Bool) (t!1339 List!589)) )
))
(declare-fun head!408 (List!589) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2028 array!2568 (_ BitVec 64) (_ BitVec 64)) List!589)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2028 BitStream!2028 (_ BitVec 64)) List!589)

(assert (=> b!54957 (= e!36649 (= (head!408 (byteArrayBitContentToList!0 (_2!2616 lt!85549) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!408 (bitStreamReadBitsIntoList!0 (_2!2616 lt!85549) (_1!2617 lt!85546) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54958 () Bool)

(assert (=> b!54958 (= e!36648 (not e!36650))))

(declare-fun res!45807 () Bool)

(assert (=> b!54958 (=> res!45807 e!36650)))

(assert (=> b!54958 (= res!45807 (bvsge i!635 to!314))))

(assert (=> b!54958 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85547 () Unit!3795)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2028) Unit!3795)

(assert (=> b!54958 (= lt!85547 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54958 (= lt!85542 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)))))

(assert (= (and start!11066 res!45806) b!54955))

(assert (= (and b!54955 res!45810) b!54958))

(assert (= (and b!54958 (not res!45807)) b!54954))

(assert (= (and b!54954 (not res!45809)) b!54952))

(assert (= (and b!54952 res!45808) b!54957))

(assert (= (and b!54952 (not res!45805)) b!54953))

(assert (= start!11066 b!54956))

(declare-fun m!86507 () Bool)

(assert (=> start!11066 m!86507))

(declare-fun m!86509 () Bool)

(assert (=> start!11066 m!86509))

(declare-fun m!86511 () Bool)

(assert (=> b!54954 m!86511))

(declare-fun m!86513 () Bool)

(assert (=> b!54954 m!86513))

(declare-fun m!86515 () Bool)

(assert (=> b!54954 m!86515))

(assert (=> b!54954 m!86511))

(declare-fun m!86517 () Bool)

(assert (=> b!54954 m!86517))

(declare-fun m!86519 () Bool)

(assert (=> b!54954 m!86519))

(declare-fun m!86521 () Bool)

(assert (=> b!54958 m!86521))

(declare-fun m!86523 () Bool)

(assert (=> b!54958 m!86523))

(declare-fun m!86525 () Bool)

(assert (=> b!54958 m!86525))

(declare-fun m!86527 () Bool)

(assert (=> b!54955 m!86527))

(declare-fun m!86529 () Bool)

(assert (=> b!54952 m!86529))

(declare-fun m!86531 () Bool)

(assert (=> b!54952 m!86531))

(declare-fun m!86533 () Bool)

(assert (=> b!54952 m!86533))

(declare-fun m!86535 () Bool)

(assert (=> b!54952 m!86535))

(declare-fun m!86537 () Bool)

(assert (=> b!54952 m!86537))

(declare-fun m!86539 () Bool)

(assert (=> b!54952 m!86539))

(declare-fun m!86541 () Bool)

(assert (=> b!54952 m!86541))

(declare-fun m!86543 () Bool)

(assert (=> b!54957 m!86543))

(assert (=> b!54957 m!86543))

(declare-fun m!86545 () Bool)

(assert (=> b!54957 m!86545))

(declare-fun m!86547 () Bool)

(assert (=> b!54957 m!86547))

(assert (=> b!54957 m!86547))

(declare-fun m!86549 () Bool)

(assert (=> b!54957 m!86549))

(declare-fun m!86551 () Bool)

(assert (=> b!54956 m!86551))

(check-sat (not b!54956) (not b!54952) (not start!11066) (not b!54957) (not b!54954) (not b!54955) (not b!54958))
(check-sat)
(get-model)

(declare-fun d!17514 () Bool)

(declare-fun res!45835 () Bool)

(declare-fun e!36682 () Bool)

(assert (=> d!17514 (=> (not res!45835) (not e!36682))))

(assert (=> d!17514 (= res!45835 (= (size!1170 (buf!1530 thiss!1379)) (size!1170 (buf!1530 thiss!1379))))))

(assert (=> d!17514 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36682)))

(declare-fun b!54986 () Bool)

(declare-fun res!45837 () Bool)

(assert (=> b!54986 (=> (not res!45837) (not e!36682))))

(assert (=> b!54986 (= res!45837 (bvsle (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)) (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379))))))

(declare-fun b!54987 () Bool)

(declare-fun e!36683 () Bool)

(assert (=> b!54987 (= e!36682 e!36683)))

(declare-fun res!45836 () Bool)

(assert (=> b!54987 (=> res!45836 e!36683)))

(assert (=> b!54987 (= res!45836 (= (size!1170 (buf!1530 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54988 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2568 array!2568 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54988 (= e!36683 (arrayBitRangesEq!0 (buf!1530 thiss!1379) (buf!1530 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379))))))

(assert (= (and d!17514 res!45835) b!54986))

(assert (= (and b!54986 res!45837) b!54987))

(assert (= (and b!54987 (not res!45836)) b!54988))

(assert (=> b!54986 m!86525))

(assert (=> b!54986 m!86525))

(assert (=> b!54988 m!86525))

(assert (=> b!54988 m!86525))

(declare-fun m!86599 () Bool)

(assert (=> b!54988 m!86599))

(assert (=> b!54958 d!17514))

(declare-fun d!17516 () Bool)

(assert (=> d!17516 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85582 () Unit!3795)

(declare-fun choose!11 (BitStream!2028) Unit!3795)

(assert (=> d!17516 (= lt!85582 (choose!11 thiss!1379))))

(assert (=> d!17516 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!85582)))

(declare-fun bs!4411 () Bool)

(assert (= bs!4411 d!17516))

(assert (=> bs!4411 m!86521))

(declare-fun m!86601 () Bool)

(assert (=> bs!4411 m!86601))

(assert (=> b!54958 d!17516))

(declare-fun d!17518 () Bool)

(declare-fun e!36686 () Bool)

(assert (=> d!17518 e!36686))

(declare-fun res!45843 () Bool)

(assert (=> d!17518 (=> (not res!45843) (not e!36686))))

(declare-fun lt!85600 () (_ BitVec 64))

(declare-fun lt!85596 () (_ BitVec 64))

(declare-fun lt!85598 () (_ BitVec 64))

(assert (=> d!17518 (= res!45843 (= lt!85598 (bvsub lt!85596 lt!85600)))))

(assert (=> d!17518 (or (= (bvand lt!85596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85596 lt!85600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17518 (= lt!85600 (remainingBits!0 ((_ sign_extend 32) (size!1170 (buf!1530 thiss!1379))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379))))))

(declare-fun lt!85595 () (_ BitVec 64))

(declare-fun lt!85597 () (_ BitVec 64))

(assert (=> d!17518 (= lt!85596 (bvmul lt!85595 lt!85597))))

(assert (=> d!17518 (or (= lt!85595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!85597 (bvsdiv (bvmul lt!85595 lt!85597) lt!85595)))))

(assert (=> d!17518 (= lt!85597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17518 (= lt!85595 ((_ sign_extend 32) (size!1170 (buf!1530 thiss!1379))))))

(assert (=> d!17518 (= lt!85598 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3109 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3104 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17518 (invariant!0 (currentBit!3104 thiss!1379) (currentByte!3109 thiss!1379) (size!1170 (buf!1530 thiss!1379)))))

(assert (=> d!17518 (= (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)) lt!85598)))

(declare-fun b!54993 () Bool)

(declare-fun res!45842 () Bool)

(assert (=> b!54993 (=> (not res!45842) (not e!36686))))

(assert (=> b!54993 (= res!45842 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!85598))))

(declare-fun b!54994 () Bool)

(declare-fun lt!85599 () (_ BitVec 64))

(assert (=> b!54994 (= e!36686 (bvsle lt!85598 (bvmul lt!85599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54994 (or (= lt!85599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!85599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!85599)))))

(assert (=> b!54994 (= lt!85599 ((_ sign_extend 32) (size!1170 (buf!1530 thiss!1379))))))

(assert (= (and d!17518 res!45843) b!54993))

(assert (= (and b!54993 res!45842) b!54994))

(declare-fun m!86603 () Bool)

(assert (=> d!17518 m!86603))

(declare-fun m!86605 () Bool)

(assert (=> d!17518 m!86605))

(assert (=> b!54958 d!17518))

(declare-fun b!55014 () Bool)

(declare-fun res!45859 () Bool)

(declare-fun e!36697 () Bool)

(assert (=> b!55014 (=> (not res!45859) (not e!36697))))

(declare-fun lt!85652 () tuple2!5012)

(assert (=> b!55014 (= res!45859 (isPrefixOf!0 (_2!2617 lt!85652) (_2!2616 lt!85549)))))

(declare-fun b!55015 () Bool)

(declare-fun res!45860 () Bool)

(assert (=> b!55015 (=> (not res!45860) (not e!36697))))

(assert (=> b!55015 (= res!45860 (isPrefixOf!0 (_1!2617 lt!85652) thiss!1379))))

(declare-fun b!55016 () Bool)

(declare-fun e!36698 () Unit!3795)

(declare-fun Unit!3799 () Unit!3795)

(assert (=> b!55016 (= e!36698 Unit!3799)))

(declare-fun b!55017 () Bool)

(declare-fun lt!85649 () (_ BitVec 64))

(declare-fun lt!85659 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2028 (_ BitVec 64)) BitStream!2028)

(assert (=> b!55017 (= e!36697 (= (_1!2617 lt!85652) (withMovedBitIndex!0 (_2!2617 lt!85652) (bvsub lt!85659 lt!85649))))))

(assert (=> b!55017 (or (= (bvand lt!85659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85649 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85659 lt!85649) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55017 (= lt!85649 (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549))))))

(assert (=> b!55017 (= lt!85659 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)))))

(declare-fun b!55018 () Bool)

(declare-fun lt!85647 () Unit!3795)

(assert (=> b!55018 (= e!36698 lt!85647)))

(declare-fun lt!85645 () (_ BitVec 64))

(assert (=> b!55018 (= lt!85645 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85653 () (_ BitVec 64))

(assert (=> b!55018 (= lt!85653 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2568 array!2568 (_ BitVec 64) (_ BitVec 64)) Unit!3795)

(assert (=> b!55018 (= lt!85647 (arrayBitRangesEqSymmetric!0 (buf!1530 thiss!1379) (buf!1530 (_2!2616 lt!85549)) lt!85645 lt!85653))))

(assert (=> b!55018 (arrayBitRangesEq!0 (buf!1530 (_2!2616 lt!85549)) (buf!1530 thiss!1379) lt!85645 lt!85653)))

(declare-fun d!17520 () Bool)

(assert (=> d!17520 e!36697))

(declare-fun res!45861 () Bool)

(assert (=> d!17520 (=> (not res!45861) (not e!36697))))

(assert (=> d!17520 (= res!45861 (isPrefixOf!0 (_1!2617 lt!85652) (_2!2617 lt!85652)))))

(declare-fun lt!85658 () BitStream!2028)

(assert (=> d!17520 (= lt!85652 (tuple2!5013 lt!85658 (_2!2616 lt!85549)))))

(declare-fun lt!85655 () Unit!3795)

(declare-fun lt!85644 () Unit!3795)

(assert (=> d!17520 (= lt!85655 lt!85644)))

(assert (=> d!17520 (isPrefixOf!0 lt!85658 (_2!2616 lt!85549))))

(assert (=> d!17520 (= lt!85644 (lemmaIsPrefixTransitive!0 lt!85658 (_2!2616 lt!85549) (_2!2616 lt!85549)))))

(declare-fun lt!85648 () Unit!3795)

(declare-fun lt!85646 () Unit!3795)

(assert (=> d!17520 (= lt!85648 lt!85646)))

(assert (=> d!17520 (isPrefixOf!0 lt!85658 (_2!2616 lt!85549))))

(assert (=> d!17520 (= lt!85646 (lemmaIsPrefixTransitive!0 lt!85658 thiss!1379 (_2!2616 lt!85549)))))

(declare-fun lt!85663 () Unit!3795)

(assert (=> d!17520 (= lt!85663 e!36698)))

(declare-fun c!3915 () Bool)

(assert (=> d!17520 (= c!3915 (not (= (size!1170 (buf!1530 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!85651 () Unit!3795)

(declare-fun lt!85656 () Unit!3795)

(assert (=> d!17520 (= lt!85651 lt!85656)))

(assert (=> d!17520 (isPrefixOf!0 (_2!2616 lt!85549) (_2!2616 lt!85549))))

(assert (=> d!17520 (= lt!85656 (lemmaIsPrefixRefl!0 (_2!2616 lt!85549)))))

(declare-fun lt!85661 () Unit!3795)

(declare-fun lt!85660 () Unit!3795)

(assert (=> d!17520 (= lt!85661 lt!85660)))

(assert (=> d!17520 (= lt!85660 (lemmaIsPrefixRefl!0 (_2!2616 lt!85549)))))

(declare-fun lt!85657 () Unit!3795)

(declare-fun lt!85650 () Unit!3795)

(assert (=> d!17520 (= lt!85657 lt!85650)))

(assert (=> d!17520 (isPrefixOf!0 lt!85658 lt!85658)))

(assert (=> d!17520 (= lt!85650 (lemmaIsPrefixRefl!0 lt!85658))))

(declare-fun lt!85662 () Unit!3795)

(declare-fun lt!85654 () Unit!3795)

(assert (=> d!17520 (= lt!85662 lt!85654)))

(assert (=> d!17520 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17520 (= lt!85654 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17520 (= lt!85658 (BitStream!2029 (buf!1530 (_2!2616 lt!85549)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)))))

(assert (=> d!17520 (isPrefixOf!0 thiss!1379 (_2!2616 lt!85549))))

(assert (=> d!17520 (= (reader!0 thiss!1379 (_2!2616 lt!85549)) lt!85652)))

(assert (= (and d!17520 c!3915) b!55018))

(assert (= (and d!17520 (not c!3915)) b!55016))

(assert (= (and d!17520 res!45861) b!55015))

(assert (= (and b!55015 res!45860) b!55014))

(assert (= (and b!55014 res!45859) b!55017))

(assert (=> b!55018 m!86525))

(declare-fun m!86611 () Bool)

(assert (=> b!55018 m!86611))

(declare-fun m!86613 () Bool)

(assert (=> b!55018 m!86613))

(declare-fun m!86615 () Bool)

(assert (=> d!17520 m!86615))

(assert (=> d!17520 m!86523))

(declare-fun m!86617 () Bool)

(assert (=> d!17520 m!86617))

(declare-fun m!86619 () Bool)

(assert (=> d!17520 m!86619))

(declare-fun m!86621 () Bool)

(assert (=> d!17520 m!86621))

(declare-fun m!86623 () Bool)

(assert (=> d!17520 m!86623))

(declare-fun m!86625 () Bool)

(assert (=> d!17520 m!86625))

(assert (=> d!17520 m!86521))

(declare-fun m!86627 () Bool)

(assert (=> d!17520 m!86627))

(assert (=> d!17520 m!86513))

(declare-fun m!86629 () Bool)

(assert (=> d!17520 m!86629))

(declare-fun m!86631 () Bool)

(assert (=> b!55014 m!86631))

(declare-fun m!86633 () Bool)

(assert (=> b!55015 m!86633))

(declare-fun m!86635 () Bool)

(assert (=> b!55017 m!86635))

(declare-fun m!86637 () Bool)

(assert (=> b!55017 m!86637))

(assert (=> b!55017 m!86525))

(assert (=> b!54952 d!17520))

(declare-fun d!17528 () Bool)

(assert (=> d!17528 (isPrefixOf!0 thiss!1379 (_2!2616 lt!85545))))

(declare-fun lt!85666 () Unit!3795)

(declare-fun choose!30 (BitStream!2028 BitStream!2028 BitStream!2028) Unit!3795)

(assert (=> d!17528 (= lt!85666 (choose!30 thiss!1379 (_2!2616 lt!85549) (_2!2616 lt!85545)))))

(assert (=> d!17528 (isPrefixOf!0 thiss!1379 (_2!2616 lt!85549))))

(assert (=> d!17528 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2616 lt!85549) (_2!2616 lt!85545)) lt!85666)))

(declare-fun bs!4414 () Bool)

(assert (= bs!4414 d!17528))

(assert (=> bs!4414 m!86535))

(declare-fun m!86639 () Bool)

(assert (=> bs!4414 m!86639))

(assert (=> bs!4414 m!86513))

(assert (=> b!54952 d!17528))

(declare-fun d!17530 () Bool)

(assert (=> d!17530 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85669 () Unit!3795)

(declare-fun choose!9 (BitStream!2028 array!2568 (_ BitVec 64) BitStream!2028) Unit!3795)

(assert (=> d!17530 (= lt!85669 (choose!9 thiss!1379 (buf!1530 (_2!2616 lt!85549)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2029 (buf!1530 (_2!2616 lt!85549)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379))))))

(assert (=> d!17530 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1530 (_2!2616 lt!85549)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!85669)))

(declare-fun bs!4415 () Bool)

(assert (= bs!4415 d!17530))

(assert (=> bs!4415 m!86529))

(declare-fun m!86641 () Bool)

(assert (=> bs!4415 m!86641))

(assert (=> b!54952 d!17530))

(declare-fun d!17532 () Bool)

(declare-fun res!45864 () Bool)

(declare-fun e!36701 () Bool)

(assert (=> d!17532 (=> (not res!45864) (not e!36701))))

(assert (=> d!17532 (= res!45864 (= (size!1170 (buf!1530 thiss!1379)) (size!1170 (buf!1530 (_2!2616 lt!85545)))))))

(assert (=> d!17532 (= (isPrefixOf!0 thiss!1379 (_2!2616 lt!85545)) e!36701)))

(declare-fun b!55019 () Bool)

(declare-fun res!45866 () Bool)

(assert (=> b!55019 (=> (not res!45866) (not e!36701))))

(assert (=> b!55019 (= res!45866 (bvsle (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)) (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85545))) (currentByte!3109 (_2!2616 lt!85545)) (currentBit!3104 (_2!2616 lt!85545)))))))

(declare-fun b!55020 () Bool)

(declare-fun e!36702 () Bool)

(assert (=> b!55020 (= e!36701 e!36702)))

(declare-fun res!45865 () Bool)

(assert (=> b!55020 (=> res!45865 e!36702)))

(assert (=> b!55020 (= res!45865 (= (size!1170 (buf!1530 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55021 () Bool)

(assert (=> b!55021 (= e!36702 (arrayBitRangesEq!0 (buf!1530 thiss!1379) (buf!1530 (_2!2616 lt!85545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379))))))

(assert (= (and d!17532 res!45864) b!55019))

(assert (= (and b!55019 res!45866) b!55020))

(assert (= (and b!55020 (not res!45865)) b!55021))

(assert (=> b!55019 m!86525))

(declare-fun m!86643 () Bool)

(assert (=> b!55019 m!86643))

(assert (=> b!55021 m!86525))

(assert (=> b!55021 m!86525))

(declare-fun m!86645 () Bool)

(assert (=> b!55021 m!86645))

(assert (=> b!54952 d!17532))

(declare-fun d!17534 () Bool)

(assert (=> d!17534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4416 () Bool)

(assert (= bs!4416 d!17534))

(declare-fun m!86647 () Bool)

(assert (=> bs!4416 m!86647))

(assert (=> b!54952 d!17534))

(declare-fun d!17536 () Bool)

(declare-fun res!45869 () Bool)

(declare-fun e!36703 () Bool)

(assert (=> d!17536 (=> (not res!45869) (not e!36703))))

(assert (=> d!17536 (= res!45869 (= (size!1170 (buf!1530 (_2!2616 lt!85549))) (size!1170 (buf!1530 (_2!2616 lt!85545)))))))

(assert (=> d!17536 (= (isPrefixOf!0 (_2!2616 lt!85549) (_2!2616 lt!85545)) e!36703)))

(declare-fun b!55026 () Bool)

(declare-fun res!45871 () Bool)

(assert (=> b!55026 (=> (not res!45871) (not e!36703))))

(assert (=> b!55026 (= res!45871 (bvsle (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549))) (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85545))) (currentByte!3109 (_2!2616 lt!85545)) (currentBit!3104 (_2!2616 lt!85545)))))))

(declare-fun b!55027 () Bool)

(declare-fun e!36704 () Bool)

(assert (=> b!55027 (= e!36703 e!36704)))

(declare-fun res!45870 () Bool)

(assert (=> b!55027 (=> res!45870 e!36704)))

(assert (=> b!55027 (= res!45870 (= (size!1170 (buf!1530 (_2!2616 lt!85549))) #b00000000000000000000000000000000))))

(declare-fun b!55028 () Bool)

(assert (=> b!55028 (= e!36704 (arrayBitRangesEq!0 (buf!1530 (_2!2616 lt!85549)) (buf!1530 (_2!2616 lt!85545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549)))))))

(assert (= (and d!17536 res!45869) b!55026))

(assert (= (and b!55026 res!45871) b!55027))

(assert (= (and b!55027 (not res!45870)) b!55028))

(assert (=> b!55026 m!86637))

(assert (=> b!55026 m!86643))

(assert (=> b!55028 m!86637))

(assert (=> b!55028 m!86637))

(declare-fun m!86651 () Bool)

(assert (=> b!55028 m!86651))

(assert (=> b!54952 d!17536))

(declare-fun lt!85968 () tuple2!5010)

(declare-fun bm!700 () Bool)

(declare-fun c!3924 () Bool)

(declare-fun call!703 () tuple2!5012)

(assert (=> bm!700 (= call!703 (reader!0 (_2!2616 lt!85549) (ite c!3924 (_2!2616 lt!85968) (_2!2616 lt!85549))))))

(declare-fun b!55135 () Bool)

(declare-fun e!36758 () tuple2!5010)

(declare-fun lt!85985 () tuple2!5010)

(declare-fun Unit!3800 () Unit!3795)

(assert (=> b!55135 (= e!36758 (tuple2!5011 Unit!3800 (_2!2616 lt!85985)))))

(assert (=> b!55135 (= lt!85968 (appendBitFromByte!0 (_2!2616 lt!85549) (select (arr!1713 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!85972 () (_ BitVec 64))

(assert (=> b!55135 (= lt!85972 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85969 () (_ BitVec 64))

(assert (=> b!55135 (= lt!85969 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85965 () Unit!3795)

(assert (=> b!55135 (= lt!85965 (validateOffsetBitsIneqLemma!0 (_2!2616 lt!85549) (_2!2616 lt!85968) lt!85972 lt!85969))))

(assert (=> b!55135 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85968)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85968))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85968))) (bvsub lt!85972 lt!85969))))

(declare-fun lt!85999 () Unit!3795)

(assert (=> b!55135 (= lt!85999 lt!85965)))

(declare-fun lt!85994 () tuple2!5012)

(assert (=> b!55135 (= lt!85994 call!703)))

(declare-fun lt!86005 () (_ BitVec 64))

(assert (=> b!55135 (= lt!86005 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85973 () Unit!3795)

(assert (=> b!55135 (= lt!85973 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2616 lt!85549) (buf!1530 (_2!2616 lt!85968)) lt!86005))))

(assert (=> b!55135 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85968)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) lt!86005)))

(declare-fun lt!85967 () Unit!3795)

(assert (=> b!55135 (= lt!85967 lt!85973)))

(assert (=> b!55135 (= (head!408 (byteArrayBitContentToList!0 (_2!2616 lt!85968) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!408 (bitStreamReadBitsIntoList!0 (_2!2616 lt!85968) (_1!2617 lt!85994) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85990 () Unit!3795)

(declare-fun Unit!3801 () Unit!3795)

(assert (=> b!55135 (= lt!85990 Unit!3801)))

(assert (=> b!55135 (= lt!85985 (appendBitsMSBFirstLoop!0 (_2!2616 lt!85968) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!86000 () Unit!3795)

(assert (=> b!55135 (= lt!86000 (lemmaIsPrefixTransitive!0 (_2!2616 lt!85549) (_2!2616 lt!85968) (_2!2616 lt!85985)))))

(assert (=> b!55135 (isPrefixOf!0 (_2!2616 lt!85549) (_2!2616 lt!85985))))

(declare-fun lt!86002 () Unit!3795)

(assert (=> b!55135 (= lt!86002 lt!86000)))

(assert (=> b!55135 (= (size!1170 (buf!1530 (_2!2616 lt!85985))) (size!1170 (buf!1530 (_2!2616 lt!85549))))))

(declare-fun lt!85997 () Unit!3795)

(declare-fun Unit!3802 () Unit!3795)

(assert (=> b!55135 (= lt!85997 Unit!3802)))

(assert (=> b!55135 (= (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85985))) (currentByte!3109 (_2!2616 lt!85985)) (currentBit!3104 (_2!2616 lt!85985))) (bvsub (bvadd (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86001 () Unit!3795)

(declare-fun Unit!3803 () Unit!3795)

(assert (=> b!55135 (= lt!86001 Unit!3803)))

(assert (=> b!55135 (= (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85985))) (currentByte!3109 (_2!2616 lt!85985)) (currentBit!3104 (_2!2616 lt!85985))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85968))) (currentByte!3109 (_2!2616 lt!85968)) (currentBit!3104 (_2!2616 lt!85968))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85963 () Unit!3795)

(declare-fun Unit!3804 () Unit!3795)

(assert (=> b!55135 (= lt!85963 Unit!3804)))

(declare-fun lt!86004 () tuple2!5012)

(assert (=> b!55135 (= lt!86004 (reader!0 (_2!2616 lt!85549) (_2!2616 lt!85985)))))

(declare-fun lt!85976 () (_ BitVec 64))

(assert (=> b!55135 (= lt!85976 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85987 () Unit!3795)

(assert (=> b!55135 (= lt!85987 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2616 lt!85549) (buf!1530 (_2!2616 lt!85985)) lt!85976))))

(assert (=> b!55135 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85985)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) lt!85976)))

(declare-fun lt!85996 () Unit!3795)

(assert (=> b!55135 (= lt!85996 lt!85987)))

(declare-fun lt!85983 () tuple2!5012)

(assert (=> b!55135 (= lt!85983 (reader!0 (_2!2616 lt!85968) (_2!2616 lt!85985)))))

(declare-fun lt!85998 () (_ BitVec 64))

(assert (=> b!55135 (= lt!85998 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85992 () Unit!3795)

(assert (=> b!55135 (= lt!85992 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2616 lt!85968) (buf!1530 (_2!2616 lt!85985)) lt!85998))))

(assert (=> b!55135 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85985)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85968))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85968))) lt!85998)))

(declare-fun lt!85991 () Unit!3795)

(assert (=> b!55135 (= lt!85991 lt!85992)))

(declare-fun lt!85980 () List!589)

(assert (=> b!55135 (= lt!85980 (byteArrayBitContentToList!0 (_2!2616 lt!85985) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85971 () List!589)

(assert (=> b!55135 (= lt!85971 (byteArrayBitContentToList!0 (_2!2616 lt!85985) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85964 () List!589)

(assert (=> b!55135 (= lt!85964 (bitStreamReadBitsIntoList!0 (_2!2616 lt!85985) (_1!2617 lt!86004) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85993 () List!589)

(assert (=> b!55135 (= lt!85993 (bitStreamReadBitsIntoList!0 (_2!2616 lt!85985) (_1!2617 lt!85983) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85989 () (_ BitVec 64))

(assert (=> b!55135 (= lt!85989 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85970 () Unit!3795)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2028 BitStream!2028 BitStream!2028 BitStream!2028 (_ BitVec 64) List!589) Unit!3795)

(assert (=> b!55135 (= lt!85970 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2616 lt!85985) (_2!2616 lt!85985) (_1!2617 lt!86004) (_1!2617 lt!85983) lt!85989 lt!85964))))

(declare-fun tail!261 (List!589) List!589)

(assert (=> b!55135 (= (bitStreamReadBitsIntoList!0 (_2!2616 lt!85985) (_1!2617 lt!85983) (bvsub lt!85989 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!261 lt!85964))))

(declare-fun lt!85984 () Unit!3795)

(assert (=> b!55135 (= lt!85984 lt!85970)))

(declare-fun lt!85978 () Unit!3795)

(declare-fun lt!85995 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2568 array!2568 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3795)

(assert (=> b!55135 (= lt!85978 (arrayBitRangesEqImpliesEq!0 (buf!1530 (_2!2616 lt!85968)) (buf!1530 (_2!2616 lt!85985)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!85995 (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85968))) (currentByte!3109 (_2!2616 lt!85968)) (currentBit!3104 (_2!2616 lt!85968)))))))

(declare-fun bitAt!0 (array!2568 (_ BitVec 64)) Bool)

(assert (=> b!55135 (= (bitAt!0 (buf!1530 (_2!2616 lt!85968)) lt!85995) (bitAt!0 (buf!1530 (_2!2616 lt!85985)) lt!85995))))

(declare-fun lt!85986 () Unit!3795)

(assert (=> b!55135 (= lt!85986 lt!85978)))

(declare-fun b!55136 () Bool)

(declare-fun res!45961 () Bool)

(declare-fun e!36759 () Bool)

(assert (=> b!55136 (=> (not res!45961) (not e!36759))))

(declare-fun lt!85966 () tuple2!5010)

(assert (=> b!55136 (= res!45961 (= (size!1170 (buf!1530 (_2!2616 lt!85549))) (size!1170 (buf!1530 (_2!2616 lt!85966)))))))

(declare-fun b!55137 () Bool)

(declare-fun res!45966 () Bool)

(assert (=> b!55137 (=> (not res!45966) (not e!36759))))

(assert (=> b!55137 (= res!45966 (isPrefixOf!0 (_2!2616 lt!85549) (_2!2616 lt!85966)))))

(declare-fun lt!85982 () tuple2!5012)

(declare-fun b!55138 () Bool)

(assert (=> b!55138 (= e!36759 (= (bitStreamReadBitsIntoList!0 (_2!2616 lt!85966) (_1!2617 lt!85982) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2616 lt!85966) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!55138 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55138 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85988 () Unit!3795)

(declare-fun lt!85975 () Unit!3795)

(assert (=> b!55138 (= lt!85988 lt!85975)))

(declare-fun lt!85979 () (_ BitVec 64))

(assert (=> b!55138 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85966)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) lt!85979)))

(assert (=> b!55138 (= lt!85975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2616 lt!85549) (buf!1530 (_2!2616 lt!85966)) lt!85979))))

(declare-fun e!36760 () Bool)

(assert (=> b!55138 e!36760))

(declare-fun res!45962 () Bool)

(assert (=> b!55138 (=> (not res!45962) (not e!36760))))

(assert (=> b!55138 (= res!45962 (and (= (size!1170 (buf!1530 (_2!2616 lt!85549))) (size!1170 (buf!1530 (_2!2616 lt!85966)))) (bvsge lt!85979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55138 (= lt!85979 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!55138 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55138 (= lt!85982 (reader!0 (_2!2616 lt!85549) (_2!2616 lt!85966)))))

(declare-fun b!55139 () Bool)

(declare-fun res!45963 () Bool)

(assert (=> b!55139 (=> (not res!45963) (not e!36759))))

(assert (=> b!55139 (= res!45963 (invariant!0 (currentBit!3104 (_2!2616 lt!85966)) (currentByte!3109 (_2!2616 lt!85966)) (size!1170 (buf!1530 (_2!2616 lt!85966)))))))

(declare-fun b!55140 () Bool)

(declare-fun Unit!3806 () Unit!3795)

(assert (=> b!55140 (= e!36758 (tuple2!5011 Unit!3806 (_2!2616 lt!85549)))))

(assert (=> b!55140 (= (size!1170 (buf!1530 (_2!2616 lt!85549))) (size!1170 (buf!1530 (_2!2616 lt!85549))))))

(declare-fun lt!85962 () Unit!3795)

(declare-fun Unit!3807 () Unit!3795)

(assert (=> b!55140 (= lt!85962 Unit!3807)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2028 array!2568 array!2568 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5018 0))(
  ( (tuple2!5019 (_1!2620 array!2568) (_2!2620 BitStream!2028)) )
))
(declare-fun readBits!0 (BitStream!2028 (_ BitVec 64)) tuple2!5018)

(assert (=> b!55140 (checkByteArrayBitContent!0 (_2!2616 lt!85549) srcBuffer!2 (_1!2620 (readBits!0 (_1!2617 call!703) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!17538 () Bool)

(assert (=> d!17538 e!36759))

(declare-fun res!45965 () Bool)

(assert (=> d!17538 (=> (not res!45965) (not e!36759))))

(declare-fun lt!85977 () (_ BitVec 64))

(assert (=> d!17538 (= res!45965 (= (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85966))) (currentByte!3109 (_2!2616 lt!85966)) (currentBit!3104 (_2!2616 lt!85966))) (bvsub lt!85977 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17538 (or (= (bvand lt!85977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85977 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85974 () (_ BitVec 64))

(assert (=> d!17538 (= lt!85977 (bvadd lt!85974 to!314))))

(assert (=> d!17538 (or (not (= (bvand lt!85974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!85974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!85974 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17538 (= lt!85974 (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549))))))

(assert (=> d!17538 (= lt!85966 e!36758)))

(assert (=> d!17538 (= c!3924 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!85981 () Unit!3795)

(declare-fun lt!86003 () Unit!3795)

(assert (=> d!17538 (= lt!85981 lt!86003)))

(assert (=> d!17538 (isPrefixOf!0 (_2!2616 lt!85549) (_2!2616 lt!85549))))

(assert (=> d!17538 (= lt!86003 (lemmaIsPrefixRefl!0 (_2!2616 lt!85549)))))

(assert (=> d!17538 (= lt!85995 (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549))))))

(assert (=> d!17538 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17538 (= (appendBitsMSBFirstLoop!0 (_2!2616 lt!85549) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!85966)))

(declare-fun b!55141 () Bool)

(assert (=> b!55141 (= e!36760 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) lt!85979))))

(declare-fun b!55142 () Bool)

(declare-fun res!45964 () Bool)

(assert (=> b!55142 (=> (not res!45964) (not e!36759))))

(assert (=> b!55142 (= res!45964 (= (size!1170 (buf!1530 (_2!2616 lt!85966))) (size!1170 (buf!1530 (_2!2616 lt!85549)))))))

(assert (= (and d!17538 c!3924) b!55135))

(assert (= (and d!17538 (not c!3924)) b!55140))

(assert (= (or b!55135 b!55140) bm!700))

(assert (= (and d!17538 res!45965) b!55139))

(assert (= (and b!55139 res!45963) b!55136))

(assert (= (and b!55136 res!45961) b!55137))

(assert (= (and b!55137 res!45966) b!55142))

(assert (= (and b!55142 res!45964) b!55138))

(assert (= (and b!55138 res!45962) b!55141))

(declare-fun m!86771 () Bool)

(assert (=> b!55141 m!86771))

(declare-fun m!86773 () Bool)

(assert (=> b!55138 m!86773))

(declare-fun m!86775 () Bool)

(assert (=> b!55138 m!86775))

(declare-fun m!86777 () Bool)

(assert (=> b!55138 m!86777))

(declare-fun m!86779 () Bool)

(assert (=> b!55138 m!86779))

(declare-fun m!86781 () Bool)

(assert (=> b!55138 m!86781))

(declare-fun m!86783 () Bool)

(assert (=> d!17538 m!86783))

(assert (=> d!17538 m!86637))

(assert (=> d!17538 m!86623))

(assert (=> d!17538 m!86627))

(declare-fun m!86785 () Bool)

(assert (=> b!55140 m!86785))

(declare-fun m!86787 () Bool)

(assert (=> b!55140 m!86787))

(declare-fun m!86789 () Bool)

(assert (=> bm!700 m!86789))

(declare-fun m!86791 () Bool)

(assert (=> b!55137 m!86791))

(declare-fun m!86793 () Bool)

(assert (=> b!55139 m!86793))

(declare-fun m!86795 () Bool)

(assert (=> b!55135 m!86795))

(declare-fun m!86797 () Bool)

(assert (=> b!55135 m!86797))

(declare-fun m!86799 () Bool)

(assert (=> b!55135 m!86799))

(declare-fun m!86801 () Bool)

(assert (=> b!55135 m!86801))

(declare-fun m!86803 () Bool)

(assert (=> b!55135 m!86803))

(declare-fun m!86805 () Bool)

(assert (=> b!55135 m!86805))

(declare-fun m!86807 () Bool)

(assert (=> b!55135 m!86807))

(declare-fun m!86809 () Bool)

(assert (=> b!55135 m!86809))

(declare-fun m!86811 () Bool)

(assert (=> b!55135 m!86811))

(declare-fun m!86813 () Bool)

(assert (=> b!55135 m!86813))

(declare-fun m!86815 () Bool)

(assert (=> b!55135 m!86815))

(declare-fun m!86817 () Bool)

(assert (=> b!55135 m!86817))

(declare-fun m!86819 () Bool)

(assert (=> b!55135 m!86819))

(declare-fun m!86821 () Bool)

(assert (=> b!55135 m!86821))

(declare-fun m!86823 () Bool)

(assert (=> b!55135 m!86823))

(assert (=> b!55135 m!86637))

(declare-fun m!86825 () Bool)

(assert (=> b!55135 m!86825))

(assert (=> b!55135 m!86805))

(declare-fun m!86827 () Bool)

(assert (=> b!55135 m!86827))

(declare-fun m!86829 () Bool)

(assert (=> b!55135 m!86829))

(declare-fun m!86831 () Bool)

(assert (=> b!55135 m!86831))

(declare-fun m!86833 () Bool)

(assert (=> b!55135 m!86833))

(declare-fun m!86835 () Bool)

(assert (=> b!55135 m!86835))

(declare-fun m!86837 () Bool)

(assert (=> b!55135 m!86837))

(declare-fun m!86839 () Bool)

(assert (=> b!55135 m!86839))

(assert (=> b!55135 m!86815))

(declare-fun m!86841 () Bool)

(assert (=> b!55135 m!86841))

(declare-fun m!86843 () Bool)

(assert (=> b!55135 m!86843))

(assert (=> b!55135 m!86843))

(declare-fun m!86845 () Bool)

(assert (=> b!55135 m!86845))

(declare-fun m!86847 () Bool)

(assert (=> b!55135 m!86847))

(assert (=> b!55135 m!86837))

(declare-fun m!86849 () Bool)

(assert (=> b!55135 m!86849))

(declare-fun m!86851 () Bool)

(assert (=> b!55135 m!86851))

(declare-fun m!86853 () Bool)

(assert (=> b!55135 m!86853))

(declare-fun m!86855 () Bool)

(assert (=> b!55135 m!86855))

(assert (=> b!54952 d!17538))

(declare-fun d!17586 () Bool)

(assert (=> d!17586 (= (head!408 (byteArrayBitContentToList!0 (_2!2616 lt!85549) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!704 (byteArrayBitContentToList!0 (_2!2616 lt!85549) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54957 d!17586))

(declare-fun d!17588 () Bool)

(declare-fun c!3929 () Bool)

(assert (=> d!17588 (= c!3929 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36765 () List!589)

(assert (=> d!17588 (= (byteArrayBitContentToList!0 (_2!2616 lt!85549) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36765)))

(declare-fun b!55151 () Bool)

(assert (=> b!55151 (= e!36765 Nil!586)))

(declare-fun b!55152 () Bool)

(assert (=> b!55152 (= e!36765 (Cons!585 (not (= (bvand ((_ sign_extend 24) (select (arr!1713 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2616 lt!85549) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17588 c!3929) b!55151))

(assert (= (and d!17588 (not c!3929)) b!55152))

(assert (=> b!55152 m!86511))

(declare-fun m!86857 () Bool)

(assert (=> b!55152 m!86857))

(declare-fun m!86859 () Bool)

(assert (=> b!55152 m!86859))

(assert (=> b!54957 d!17588))

(declare-fun d!17590 () Bool)

(assert (=> d!17590 (= (head!408 (bitStreamReadBitsIntoList!0 (_2!2616 lt!85549) (_1!2617 lt!85546) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!704 (bitStreamReadBitsIntoList!0 (_2!2616 lt!85549) (_1!2617 lt!85546) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54957 d!17590))

(declare-fun b!55173 () Bool)

(declare-datatypes ((tuple2!5022 0))(
  ( (tuple2!5023 (_1!2622 List!589) (_2!2622 BitStream!2028)) )
))
(declare-fun e!36774 () tuple2!5022)

(assert (=> b!55173 (= e!36774 (tuple2!5023 Nil!586 (_1!2617 lt!85546)))))

(declare-fun d!17592 () Bool)

(declare-fun e!36775 () Bool)

(assert (=> d!17592 e!36775))

(declare-fun c!3935 () Bool)

(assert (=> d!17592 (= c!3935 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86102 () List!589)

(assert (=> d!17592 (= lt!86102 (_1!2622 e!36774))))

(declare-fun c!3934 () Bool)

(assert (=> d!17592 (= c!3934 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17592 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17592 (= (bitStreamReadBitsIntoList!0 (_2!2616 lt!85549) (_1!2617 lt!85546) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86102)))

(declare-fun b!55176 () Bool)

(declare-fun length!273 (List!589) Int)

(assert (=> b!55176 (= e!36775 (> (length!273 lt!86102) 0))))

(declare-fun b!55174 () Bool)

(declare-fun lt!86100 () (_ BitVec 64))

(declare-datatypes ((tuple2!5024 0))(
  ( (tuple2!5025 (_1!2623 Bool) (_2!2623 BitStream!2028)) )
))
(declare-fun lt!86101 () tuple2!5024)

(assert (=> b!55174 (= e!36774 (tuple2!5023 (Cons!585 (_1!2623 lt!86101) (bitStreamReadBitsIntoList!0 (_2!2616 lt!85549) (_2!2623 lt!86101) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!86100))) (_2!2623 lt!86101)))))

(declare-fun readBit!0 (BitStream!2028) tuple2!5024)

(assert (=> b!55174 (= lt!86101 (readBit!0 (_1!2617 lt!85546)))))

(assert (=> b!55174 (= lt!86100 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!55175 () Bool)

(declare-fun isEmpty!159 (List!589) Bool)

(assert (=> b!55175 (= e!36775 (isEmpty!159 lt!86102))))

(assert (= (and d!17592 c!3934) b!55173))

(assert (= (and d!17592 (not c!3934)) b!55174))

(assert (= (and d!17592 c!3935) b!55175))

(assert (= (and d!17592 (not c!3935)) b!55176))

(declare-fun m!86861 () Bool)

(assert (=> b!55176 m!86861))

(declare-fun m!86863 () Bool)

(assert (=> b!55174 m!86863))

(declare-fun m!86865 () Bool)

(assert (=> b!55174 m!86865))

(declare-fun m!86867 () Bool)

(assert (=> b!55175 m!86867))

(assert (=> b!54957 d!17592))

(declare-fun d!17594 () Bool)

(assert (=> d!17594 (= (array_inv!1073 (buf!1530 thiss!1379)) (bvsge (size!1170 (buf!1530 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54956 d!17594))

(declare-fun d!17596 () Bool)

(assert (=> d!17596 (= (array_inv!1073 srcBuffer!2) (bvsge (size!1170 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11066 d!17596))

(declare-fun d!17598 () Bool)

(assert (=> d!17598 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3104 thiss!1379) (currentByte!3109 thiss!1379) (size!1170 (buf!1530 thiss!1379))))))

(declare-fun bs!4425 () Bool)

(assert (= bs!4425 d!17598))

(assert (=> bs!4425 m!86605))

(assert (=> start!11066 d!17598))

(declare-fun d!17600 () Bool)

(assert (=> d!17600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 thiss!1379))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1170 (buf!1530 thiss!1379))) ((_ sign_extend 32) (currentByte!3109 thiss!1379)) ((_ sign_extend 32) (currentBit!3104 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4426 () Bool)

(assert (= bs!4426 d!17600))

(assert (=> bs!4426 m!86603))

(assert (=> b!54955 d!17600))

(declare-fun d!17602 () Bool)

(declare-fun res!45979 () Bool)

(declare-fun e!36776 () Bool)

(assert (=> d!17602 (=> (not res!45979) (not e!36776))))

(assert (=> d!17602 (= res!45979 (= (size!1170 (buf!1530 thiss!1379)) (size!1170 (buf!1530 (_2!2616 lt!85549)))))))

(assert (=> d!17602 (= (isPrefixOf!0 thiss!1379 (_2!2616 lt!85549)) e!36776)))

(declare-fun b!55177 () Bool)

(declare-fun res!45981 () Bool)

(assert (=> b!55177 (=> (not res!45981) (not e!36776))))

(assert (=> b!55177 (= res!45981 (bvsle (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)) (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!85549))) (currentByte!3109 (_2!2616 lt!85549)) (currentBit!3104 (_2!2616 lt!85549)))))))

(declare-fun b!55178 () Bool)

(declare-fun e!36777 () Bool)

(assert (=> b!55178 (= e!36776 e!36777)))

(declare-fun res!45980 () Bool)

(assert (=> b!55178 (=> res!45980 e!36777)))

(assert (=> b!55178 (= res!45980 (= (size!1170 (buf!1530 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55179 () Bool)

(assert (=> b!55179 (= e!36777 (arrayBitRangesEq!0 (buf!1530 thiss!1379) (buf!1530 (_2!2616 lt!85549)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379))))))

(assert (= (and d!17602 res!45979) b!55177))

(assert (= (and b!55177 res!45981) b!55178))

(assert (= (and b!55178 (not res!45980)) b!55179))

(assert (=> b!55177 m!86525))

(assert (=> b!55177 m!86637))

(assert (=> b!55179 m!86525))

(assert (=> b!55179 m!86525))

(declare-fun m!86869 () Bool)

(assert (=> b!55179 m!86869))

(assert (=> b!54954 d!17602))

(declare-fun d!17604 () Bool)

(assert (=> d!17604 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4427 () Bool)

(assert (= bs!4427 d!17604))

(declare-fun m!86871 () Bool)

(assert (=> bs!4427 m!86871))

(assert (=> b!54954 d!17604))

(declare-fun d!17606 () Bool)

(declare-fun e!36783 () Bool)

(assert (=> d!17606 e!36783))

(declare-fun res!45990 () Bool)

(assert (=> d!17606 (=> (not res!45990) (not e!36783))))

(assert (=> d!17606 (= res!45990 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!86149 () Unit!3795)

(declare-fun choose!27 (BitStream!2028 BitStream!2028 (_ BitVec 64) (_ BitVec 64)) Unit!3795)

(assert (=> d!17606 (= lt!86149 (choose!27 thiss!1379 (_2!2616 lt!85549) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17606 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17606 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2616 lt!85549) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86149)))

(declare-fun b!55190 () Bool)

(assert (=> b!55190 (= e!36783 (validate_offset_bits!1 ((_ sign_extend 32) (size!1170 (buf!1530 (_2!2616 lt!85549)))) ((_ sign_extend 32) (currentByte!3109 (_2!2616 lt!85549))) ((_ sign_extend 32) (currentBit!3104 (_2!2616 lt!85549))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17606 res!45990) b!55190))

(declare-fun m!86873 () Bool)

(assert (=> d!17606 m!86873))

(assert (=> b!55190 m!86515))

(assert (=> b!54954 d!17606))

(declare-fun b!55232 () Bool)

(declare-fun e!36806 () Bool)

(declare-datatypes ((tuple2!5030 0))(
  ( (tuple2!5031 (_1!2626 BitStream!2028) (_2!2626 Bool)) )
))
(declare-fun lt!86189 () tuple2!5030)

(declare-fun lt!86200 () tuple2!5010)

(assert (=> b!55232 (= e!36806 (= (bitIndex!0 (size!1170 (buf!1530 (_1!2626 lt!86189))) (currentByte!3109 (_1!2626 lt!86189)) (currentBit!3104 (_1!2626 lt!86189))) (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!86200))) (currentByte!3109 (_2!2616 lt!86200)) (currentBit!3104 (_2!2616 lt!86200)))))))

(declare-fun b!55233 () Bool)

(declare-fun e!36808 () Bool)

(declare-fun lt!86197 () tuple2!5030)

(declare-fun lt!86193 () tuple2!5010)

(assert (=> b!55233 (= e!36808 (= (bitIndex!0 (size!1170 (buf!1530 (_1!2626 lt!86197))) (currentByte!3109 (_1!2626 lt!86197)) (currentBit!3104 (_1!2626 lt!86197))) (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!86193))) (currentByte!3109 (_2!2616 lt!86193)) (currentBit!3104 (_2!2616 lt!86193)))))))

(declare-fun b!55234 () Bool)

(declare-fun res!46016 () Bool)

(declare-fun e!36807 () Bool)

(assert (=> b!55234 (=> (not res!46016) (not e!36807))))

(assert (=> b!55234 (= res!46016 (= (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!86193))) (currentByte!3109 (_2!2616 lt!86193)) (currentBit!3104 (_2!2616 lt!86193))) (bvadd (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!55235 () Bool)

(declare-fun res!46015 () Bool)

(assert (=> b!55235 (=> (not res!46015) (not e!36807))))

(assert (=> b!55235 (= res!46015 (isPrefixOf!0 thiss!1379 (_2!2616 lt!86193)))))

(declare-fun b!55236 () Bool)

(declare-fun e!36809 () Bool)

(assert (=> b!55236 (= e!36809 e!36806)))

(declare-fun res!46018 () Bool)

(assert (=> b!55236 (=> (not res!46018) (not e!36806))))

(declare-fun lt!86196 () (_ BitVec 8))

(assert (=> b!55236 (= res!46018 (and (= (_2!2626 lt!86189) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1713 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!86196)) #b00000000000000000000000000000000))) (= (_1!2626 lt!86189) (_2!2616 lt!86200))))))

(declare-fun lt!86198 () tuple2!5018)

(declare-fun lt!86192 () BitStream!2028)

(assert (=> b!55236 (= lt!86198 (readBits!0 lt!86192 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2028) tuple2!5030)

(assert (=> b!55236 (= lt!86189 (readBitPure!0 lt!86192))))

(declare-fun readerFrom!0 (BitStream!2028 (_ BitVec 32) (_ BitVec 32)) BitStream!2028)

(assert (=> b!55236 (= lt!86192 (readerFrom!0 (_2!2616 lt!86200) (currentBit!3104 thiss!1379) (currentByte!3109 thiss!1379)))))

(declare-fun b!55237 () Bool)

(declare-fun res!46014 () Bool)

(assert (=> b!55237 (=> (not res!46014) (not e!36809))))

(declare-fun lt!86191 () (_ BitVec 64))

(declare-fun lt!86199 () (_ BitVec 64))

(assert (=> b!55237 (= res!46014 (= (bitIndex!0 (size!1170 (buf!1530 (_2!2616 lt!86200))) (currentByte!3109 (_2!2616 lt!86200)) (currentBit!3104 (_2!2616 lt!86200))) (bvadd lt!86191 lt!86199)))))

(assert (=> b!55237 (or (not (= (bvand lt!86191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86199 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86191 lt!86199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55237 (= lt!86199 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55237 (= lt!86191 (bitIndex!0 (size!1170 (buf!1530 thiss!1379)) (currentByte!3109 thiss!1379) (currentBit!3104 thiss!1379)))))

(declare-fun b!55238 () Bool)

(declare-fun res!46017 () Bool)

(assert (=> b!55238 (=> (not res!46017) (not e!36809))))

(assert (=> b!55238 (= res!46017 (isPrefixOf!0 thiss!1379 (_2!2616 lt!86200)))))

(declare-fun d!17608 () Bool)

(assert (=> d!17608 e!36809))

(declare-fun res!46019 () Bool)

(assert (=> d!17608 (=> (not res!46019) (not e!36809))))

(assert (=> d!17608 (= res!46019 (= (size!1170 (buf!1530 (_2!2616 lt!86200))) (size!1170 (buf!1530 thiss!1379))))))

(declare-fun lt!86190 () array!2568)

(assert (=> d!17608 (= lt!86196 (select (arr!1713 lt!86190) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17608 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1170 lt!86190)))))

(assert (=> d!17608 (= lt!86190 (array!2569 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!86194 () tuple2!5010)

(assert (=> d!17608 (= lt!86200 (tuple2!5011 (_1!2616 lt!86194) (_2!2616 lt!86194)))))

(assert (=> d!17608 (= lt!86194 lt!86193)))

(assert (=> d!17608 e!36807))

(declare-fun res!46013 () Bool)

(assert (=> d!17608 (=> (not res!46013) (not e!36807))))

(assert (=> d!17608 (= res!46013 (= (size!1170 (buf!1530 thiss!1379)) (size!1170 (buf!1530 (_2!2616 lt!86193)))))))

(declare-fun lt!86195 () Bool)

(declare-fun appendBit!0 (BitStream!2028 Bool) tuple2!5010)

(assert (=> d!17608 (= lt!86193 (appendBit!0 thiss!1379 lt!86195))))

(assert (=> d!17608 (= lt!86195 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1713 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17608 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17608 (= (appendBitFromByte!0 thiss!1379 (select (arr!1713 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!86200)))

(declare-fun b!55239 () Bool)

(assert (=> b!55239 (= e!36807 e!36808)))

(declare-fun res!46020 () Bool)

(assert (=> b!55239 (=> (not res!46020) (not e!36808))))

(assert (=> b!55239 (= res!46020 (and (= (_2!2626 lt!86197) lt!86195) (= (_1!2626 lt!86197) (_2!2616 lt!86193))))))

(assert (=> b!55239 (= lt!86197 (readBitPure!0 (readerFrom!0 (_2!2616 lt!86193) (currentBit!3104 thiss!1379) (currentByte!3109 thiss!1379))))))

(assert (= (and d!17608 res!46013) b!55234))

(assert (= (and b!55234 res!46016) b!55235))

(assert (= (and b!55235 res!46015) b!55239))

(assert (= (and b!55239 res!46020) b!55233))

(assert (= (and d!17608 res!46019) b!55237))

(assert (= (and b!55237 res!46014) b!55238))

(assert (= (and b!55238 res!46017) b!55236))

(assert (= (and b!55236 res!46018) b!55232))

(declare-fun m!86983 () Bool)

(assert (=> b!55233 m!86983))

(declare-fun m!86985 () Bool)

(assert (=> b!55233 m!86985))

(assert (=> b!55234 m!86985))

(assert (=> b!55234 m!86525))

(declare-fun m!86987 () Bool)

(assert (=> b!55232 m!86987))

(declare-fun m!86989 () Bool)

(assert (=> b!55232 m!86989))

(assert (=> b!55237 m!86989))

(assert (=> b!55237 m!86525))

(declare-fun m!86991 () Bool)

(assert (=> b!55236 m!86991))

(declare-fun m!86993 () Bool)

(assert (=> b!55236 m!86993))

(declare-fun m!86995 () Bool)

(assert (=> b!55236 m!86995))

(declare-fun m!86997 () Bool)

(assert (=> b!55235 m!86997))

(declare-fun m!86999 () Bool)

(assert (=> b!55238 m!86999))

(declare-fun m!87001 () Bool)

(assert (=> b!55239 m!87001))

(assert (=> b!55239 m!87001))

(declare-fun m!87003 () Bool)

(assert (=> b!55239 m!87003))

(declare-fun m!87005 () Bool)

(assert (=> d!17608 m!87005))

(declare-fun m!87007 () Bool)

(assert (=> d!17608 m!87007))

(assert (=> d!17608 m!86857))

(assert (=> b!54954 d!17608))

(check-sat (not b!55028) (not b!55237) (not d!17606) (not d!17528) (not bm!700) (not b!55176) (not d!17598) (not b!55026) (not b!55235) (not b!55140) (not d!17516) (not b!55239) (not b!55234) (not b!55236) (not d!17534) (not b!55019) (not d!17538) (not b!55135) (not b!55174) (not d!17604) (not d!17600) (not b!55233) (not b!55179) (not d!17518) (not b!55015) (not b!55238) (not d!17608) (not b!54988) (not b!55177) (not b!55175) (not b!55139) (not b!55152) (not b!55138) (not b!55190) (not b!55014) (not b!55137) (not b!54986) (not b!55141) (not b!55021) (not b!55018) (not b!55017) (not d!17520) (not b!55232) (not d!17530))
