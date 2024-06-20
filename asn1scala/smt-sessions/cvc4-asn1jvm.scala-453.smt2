; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12016 () Bool)

(assert start!12016)

(declare-fun b!61278 () Bool)

(declare-fun e!40862 () Bool)

(declare-datatypes ((array!2774 0))(
  ( (array!2775 (arr!1828 (Array (_ BitVec 32) (_ BitVec 8))) (size!1264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2210 0))(
  ( (BitStream!2211 (buf!1645 array!2774) (currentByte!3269 (_ BitVec 32)) (currentBit!3264 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5566 0))(
  ( (tuple2!5567 (_1!2894 BitStream!2210) (_2!2894 BitStream!2210)) )
))
(declare-fun lt!95747 () tuple2!5566)

(declare-datatypes ((Unit!4175 0))(
  ( (Unit!4176) )
))
(declare-datatypes ((tuple2!5568 0))(
  ( (tuple2!5569 (_1!2895 Unit!4175) (_2!2895 BitStream!2210)) )
))
(declare-fun lt!95749 () tuple2!5568)

(declare-fun isPrefixOf!0 (BitStream!2210 BitStream!2210) Bool)

(assert (=> b!61278 (= e!40862 (isPrefixOf!0 (_1!2894 lt!95747) (_2!2895 lt!95749)))))

(declare-fun lt!95746 () tuple2!5568)

(declare-fun b!61279 () Bool)

(declare-fun e!40857 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!95743 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!61279 (= e!40857 (= lt!95743 (bvsub (bvsub (bvadd (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61280 () Bool)

(declare-fun res!51085 () Bool)

(assert (=> b!61280 (=> res!51085 e!40862)))

(declare-fun lt!95740 () tuple2!5566)

(assert (=> b!61280 (= res!51085 (not (isPrefixOf!0 (_1!2894 lt!95740) (_2!2895 lt!95749))))))

(declare-fun b!61281 () Bool)

(declare-fun e!40858 () Bool)

(declare-fun e!40864 () Bool)

(assert (=> b!61281 (= e!40858 e!40864)))

(declare-fun res!51092 () Bool)

(assert (=> b!61281 (=> res!51092 e!40864)))

(declare-fun thiss!1379 () BitStream!2210)

(assert (=> b!61281 (= res!51092 (not (isPrefixOf!0 thiss!1379 (_2!2895 lt!95746))))))

(declare-fun lt!95738 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61281 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!95738)))

(assert (=> b!61281 (= lt!95738 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95736 () Unit!4175)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2210 BitStream!2210 (_ BitVec 64) (_ BitVec 64)) Unit!4175)

(assert (=> b!61281 (= lt!95736 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2895 lt!95746) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2774)

(declare-fun appendBitFromByte!0 (BitStream!2210 (_ BitVec 8) (_ BitVec 32)) tuple2!5568)

(assert (=> b!61281 (= lt!95746 (appendBitFromByte!0 thiss!1379 (select (arr!1828 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!61282 () Bool)

(declare-fun e!40865 () Bool)

(declare-fun e!40859 () Bool)

(assert (=> b!61282 (= e!40865 e!40859)))

(declare-fun res!51088 () Bool)

(assert (=> b!61282 (=> res!51088 e!40859)))

(assert (=> b!61282 (= res!51088 (not (= (size!1264 (buf!1645 (_2!2895 lt!95746))) (size!1264 (buf!1645 (_2!2895 lt!95749))))))))

(assert (=> b!61282 e!40857))

(declare-fun res!51086 () Bool)

(assert (=> b!61282 (=> (not res!51086) (not e!40857))))

(assert (=> b!61282 (= res!51086 (= (size!1264 (buf!1645 (_2!2895 lt!95749))) (size!1264 (buf!1645 thiss!1379))))))

(declare-fun b!61283 () Bool)

(declare-fun res!51080 () Bool)

(assert (=> b!61283 (=> res!51080 e!40859)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!61283 (= res!51080 (not (invariant!0 (currentBit!3264 (_2!2895 lt!95746)) (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95749))))))))

(declare-fun b!61284 () Bool)

(declare-fun e!40855 () Bool)

(assert (=> b!61284 (= e!40855 e!40865)))

(declare-fun res!51081 () Bool)

(assert (=> b!61284 (=> res!51081 e!40865)))

(declare-fun lt!95735 () (_ BitVec 64))

(assert (=> b!61284 (= res!51081 (not (= lt!95743 (bvsub (bvadd lt!95735 to!314) i!635))))))

(assert (=> b!61284 (= lt!95743 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749))))))

(declare-fun b!61285 () Bool)

(declare-fun res!51089 () Bool)

(declare-fun e!40854 () Bool)

(assert (=> b!61285 (=> (not res!51089) (not e!40854))))

(assert (=> b!61285 (= res!51089 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 thiss!1379))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!61286 () Bool)

(declare-fun res!51078 () Bool)

(assert (=> b!61286 (=> res!51078 e!40865)))

(assert (=> b!61286 (= res!51078 (not (invariant!0 (currentBit!3264 (_2!2895 lt!95749)) (currentByte!3269 (_2!2895 lt!95749)) (size!1264 (buf!1645 (_2!2895 lt!95749))))))))

(declare-fun b!61287 () Bool)

(declare-fun res!51090 () Bool)

(assert (=> b!61287 (=> res!51090 e!40865)))

(assert (=> b!61287 (= res!51090 (not (= (size!1264 (buf!1645 thiss!1379)) (size!1264 (buf!1645 (_2!2895 lt!95749))))))))

(declare-fun b!61289 () Bool)

(declare-fun lt!95737 () tuple2!5566)

(declare-fun e!40861 () Bool)

(declare-datatypes ((List!680 0))(
  ( (Nil!677) (Cons!676 (h!795 Bool) (t!1430 List!680)) )
))
(declare-fun head!499 (List!680) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2210 array!2774 (_ BitVec 64) (_ BitVec 64)) List!680)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2210 BitStream!2210 (_ BitVec 64)) List!680)

(assert (=> b!61289 (= e!40861 (= (head!499 (byteArrayBitContentToList!0 (_2!2895 lt!95746) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!499 (bitStreamReadBitsIntoList!0 (_2!2895 lt!95746) (_1!2894 lt!95737) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!61290 () Bool)

(declare-fun res!51093 () Bool)

(assert (=> b!61290 (=> res!51093 e!40862)))

(declare-fun lt!95739 () List!680)

(declare-fun length!308 (List!680) Int)

(assert (=> b!61290 (= res!51093 (<= (length!308 lt!95739) 0))))

(declare-fun b!61291 () Bool)

(declare-fun res!51087 () Bool)

(assert (=> b!61291 (=> res!51087 e!40859)))

(assert (=> b!61291 (= res!51087 (not (invariant!0 (currentBit!3264 (_2!2895 lt!95746)) (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95746))))))))

(declare-fun b!61292 () Bool)

(assert (=> b!61292 (= e!40864 e!40855)))

(declare-fun res!51083 () Bool)

(assert (=> b!61292 (=> res!51083 e!40855)))

(assert (=> b!61292 (= res!51083 (not (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!95749))))))

(assert (=> b!61292 (isPrefixOf!0 thiss!1379 (_2!2895 lt!95749))))

(declare-fun lt!95744 () Unit!4175)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2210 BitStream!2210 BitStream!2210) Unit!4175)

(assert (=> b!61292 (= lt!95744 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2895 lt!95746) (_2!2895 lt!95749)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2210 array!2774 (_ BitVec 64) (_ BitVec 64)) tuple2!5568)

(assert (=> b!61292 (= lt!95749 (appendBitsMSBFirstLoop!0 (_2!2895 lt!95746) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!61292 e!40861))

(declare-fun res!51084 () Bool)

(assert (=> b!61292 (=> (not res!51084) (not e!40861))))

(assert (=> b!61292 (= res!51084 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95748 () Unit!4175)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2210 array!2774 (_ BitVec 64)) Unit!4175)

(assert (=> b!61292 (= lt!95748 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1645 (_2!2895 lt!95746)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2210 BitStream!2210) tuple2!5566)

(assert (=> b!61292 (= lt!95737 (reader!0 thiss!1379 (_2!2895 lt!95746)))))

(declare-fun b!61293 () Bool)

(assert (=> b!61293 (= e!40854 (not e!40858))))

(declare-fun res!51079 () Bool)

(assert (=> b!61293 (=> res!51079 e!40858)))

(assert (=> b!61293 (= res!51079 (bvsge i!635 to!314))))

(assert (=> b!61293 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!95741 () Unit!4175)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2210) Unit!4175)

(assert (=> b!61293 (= lt!95741 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!61293 (= lt!95735 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(declare-fun b!61294 () Bool)

(assert (=> b!61294 (= e!40859 e!40862)))

(declare-fun res!51082 () Bool)

(assert (=> b!61294 (=> res!51082 e!40862)))

(assert (=> b!61294 (= res!51082 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!95745 () List!680)

(assert (=> b!61294 (= lt!95745 (bitStreamReadBitsIntoList!0 (_2!2895 lt!95749) (_1!2894 lt!95747) lt!95738))))

(assert (=> b!61294 (= lt!95739 (bitStreamReadBitsIntoList!0 (_2!2895 lt!95749) (_1!2894 lt!95740) (bvsub to!314 i!635)))))

(assert (=> b!61294 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!95738)))

(declare-fun lt!95734 () Unit!4175)

(assert (=> b!61294 (= lt!95734 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2895 lt!95746) (buf!1645 (_2!2895 lt!95749)) lt!95738))))

(assert (=> b!61294 (= lt!95747 (reader!0 (_2!2895 lt!95746) (_2!2895 lt!95749)))))

(assert (=> b!61294 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95742 () Unit!4175)

(assert (=> b!61294 (= lt!95742 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1645 (_2!2895 lt!95749)) (bvsub to!314 i!635)))))

(assert (=> b!61294 (= lt!95740 (reader!0 thiss!1379 (_2!2895 lt!95749)))))

(declare-fun res!51091 () Bool)

(assert (=> start!12016 (=> (not res!51091) (not e!40854))))

(assert (=> start!12016 (= res!51091 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1264 srcBuffer!2))))))))

(assert (=> start!12016 e!40854))

(assert (=> start!12016 true))

(declare-fun array_inv!1164 (array!2774) Bool)

(assert (=> start!12016 (array_inv!1164 srcBuffer!2)))

(declare-fun e!40860 () Bool)

(declare-fun inv!12 (BitStream!2210) Bool)

(assert (=> start!12016 (and (inv!12 thiss!1379) e!40860)))

(declare-fun b!61288 () Bool)

(assert (=> b!61288 (= e!40860 (array_inv!1164 (buf!1645 thiss!1379)))))

(assert (= (and start!12016 res!51091) b!61285))

(assert (= (and b!61285 res!51089) b!61293))

(assert (= (and b!61293 (not res!51079)) b!61281))

(assert (= (and b!61281 (not res!51092)) b!61292))

(assert (= (and b!61292 res!51084) b!61289))

(assert (= (and b!61292 (not res!51083)) b!61284))

(assert (= (and b!61284 (not res!51081)) b!61286))

(assert (= (and b!61286 (not res!51078)) b!61287))

(assert (= (and b!61287 (not res!51090)) b!61282))

(assert (= (and b!61282 res!51086) b!61279))

(assert (= (and b!61282 (not res!51088)) b!61291))

(assert (= (and b!61291 (not res!51087)) b!61283))

(assert (= (and b!61283 (not res!51080)) b!61294))

(assert (= (and b!61294 (not res!51082)) b!61290))

(assert (= (and b!61290 (not res!51093)) b!61280))

(assert (= (and b!61280 (not res!51085)) b!61278))

(assert (= start!12016 b!61288))

(declare-fun m!96691 () Bool)

(assert (=> b!61294 m!96691))

(declare-fun m!96693 () Bool)

(assert (=> b!61294 m!96693))

(declare-fun m!96695 () Bool)

(assert (=> b!61294 m!96695))

(declare-fun m!96697 () Bool)

(assert (=> b!61294 m!96697))

(declare-fun m!96699 () Bool)

(assert (=> b!61294 m!96699))

(declare-fun m!96701 () Bool)

(assert (=> b!61294 m!96701))

(declare-fun m!96703 () Bool)

(assert (=> b!61294 m!96703))

(declare-fun m!96705 () Bool)

(assert (=> b!61294 m!96705))

(declare-fun m!96707 () Bool)

(assert (=> b!61293 m!96707))

(declare-fun m!96709 () Bool)

(assert (=> b!61293 m!96709))

(declare-fun m!96711 () Bool)

(assert (=> b!61293 m!96711))

(declare-fun m!96713 () Bool)

(assert (=> b!61283 m!96713))

(declare-fun m!96715 () Bool)

(assert (=> b!61281 m!96715))

(declare-fun m!96717 () Bool)

(assert (=> b!61281 m!96717))

(declare-fun m!96719 () Bool)

(assert (=> b!61281 m!96719))

(declare-fun m!96721 () Bool)

(assert (=> b!61281 m!96721))

(assert (=> b!61281 m!96717))

(declare-fun m!96723 () Bool)

(assert (=> b!61281 m!96723))

(declare-fun m!96725 () Bool)

(assert (=> b!61292 m!96725))

(declare-fun m!96727 () Bool)

(assert (=> b!61292 m!96727))

(declare-fun m!96729 () Bool)

(assert (=> b!61292 m!96729))

(declare-fun m!96731 () Bool)

(assert (=> b!61292 m!96731))

(declare-fun m!96733 () Bool)

(assert (=> b!61292 m!96733))

(declare-fun m!96735 () Bool)

(assert (=> b!61292 m!96735))

(declare-fun m!96737 () Bool)

(assert (=> b!61292 m!96737))

(declare-fun m!96739 () Bool)

(assert (=> b!61290 m!96739))

(declare-fun m!96741 () Bool)

(assert (=> b!61289 m!96741))

(assert (=> b!61289 m!96741))

(declare-fun m!96743 () Bool)

(assert (=> b!61289 m!96743))

(declare-fun m!96745 () Bool)

(assert (=> b!61289 m!96745))

(assert (=> b!61289 m!96745))

(declare-fun m!96747 () Bool)

(assert (=> b!61289 m!96747))

(declare-fun m!96749 () Bool)

(assert (=> b!61285 m!96749))

(declare-fun m!96751 () Bool)

(assert (=> b!61278 m!96751))

(declare-fun m!96753 () Bool)

(assert (=> start!12016 m!96753))

(declare-fun m!96755 () Bool)

(assert (=> start!12016 m!96755))

(declare-fun m!96757 () Bool)

(assert (=> b!61279 m!96757))

(declare-fun m!96759 () Bool)

(assert (=> b!61280 m!96759))

(declare-fun m!96761 () Bool)

(assert (=> b!61286 m!96761))

(declare-fun m!96763 () Bool)

(assert (=> b!61291 m!96763))

(declare-fun m!96765 () Bool)

(assert (=> b!61284 m!96765))

(declare-fun m!96767 () Bool)

(assert (=> b!61288 m!96767))

(push 1)

(assert (not start!12016))

(assert (not b!61278))

(assert (not b!61290))

(assert (not b!61286))

(assert (not b!61283))

(assert (not b!61293))

(assert (not b!61289))

(assert (not b!61284))

(assert (not b!61291))

(assert (not b!61292))

(assert (not b!61279))

(assert (not b!61280))

(assert (not b!61288))

(assert (not b!61294))

(assert (not b!61281))

(assert (not b!61285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18852 () Bool)

(declare-fun res!51127 () Bool)

(declare-fun e!40902 () Bool)

(assert (=> d!18852 (=> (not res!51127) (not e!40902))))

(assert (=> d!18852 (= res!51127 (= (size!1264 (buf!1645 (_1!2894 lt!95747))) (size!1264 (buf!1645 (_2!2895 lt!95749)))))))

(assert (=> d!18852 (= (isPrefixOf!0 (_1!2894 lt!95747) (_2!2895 lt!95749)) e!40902)))

(declare-fun b!61364 () Bool)

(declare-fun res!51129 () Bool)

(assert (=> b!61364 (=> (not res!51129) (not e!40902))))

(assert (=> b!61364 (= res!51129 (bvsle (bitIndex!0 (size!1264 (buf!1645 (_1!2894 lt!95747))) (currentByte!3269 (_1!2894 lt!95747)) (currentBit!3264 (_1!2894 lt!95747))) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749)))))))

(declare-fun b!61365 () Bool)

(declare-fun e!40901 () Bool)

(assert (=> b!61365 (= e!40902 e!40901)))

(declare-fun res!51128 () Bool)

(assert (=> b!61365 (=> res!51128 e!40901)))

(assert (=> b!61365 (= res!51128 (= (size!1264 (buf!1645 (_1!2894 lt!95747))) #b00000000000000000000000000000000))))

(declare-fun b!61366 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2774 array!2774 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61366 (= e!40901 (arrayBitRangesEq!0 (buf!1645 (_1!2894 lt!95747)) (buf!1645 (_2!2895 lt!95749)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1264 (buf!1645 (_1!2894 lt!95747))) (currentByte!3269 (_1!2894 lt!95747)) (currentBit!3264 (_1!2894 lt!95747)))))))

(assert (= (and d!18852 res!51127) b!61364))

(assert (= (and b!61364 res!51129) b!61365))

(assert (= (and b!61365 (not res!51128)) b!61366))

(declare-fun m!96865 () Bool)

(assert (=> b!61364 m!96865))

(assert (=> b!61364 m!96765))

(assert (=> b!61366 m!96865))

(assert (=> b!61366 m!96865))

(declare-fun m!96867 () Bool)

(assert (=> b!61366 m!96867))

(assert (=> b!61278 d!18852))

(declare-fun d!18854 () Bool)

(assert (=> d!18854 (= (array_inv!1164 (buf!1645 thiss!1379)) (bvsge (size!1264 (buf!1645 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!61288 d!18854))

(declare-fun d!18856 () Bool)

(declare-fun size!1266 (List!680) Int)

(assert (=> d!18856 (= (length!308 lt!95739) (size!1266 lt!95739))))

(declare-fun bs!4714 () Bool)

(assert (= bs!4714 d!18856))

(declare-fun m!96869 () Bool)

(assert (=> bs!4714 m!96869))

(assert (=> b!61290 d!18856))

(declare-fun d!18858 () Bool)

(declare-fun e!40905 () Bool)

(assert (=> d!18858 e!40905))

(declare-fun res!51134 () Bool)

(assert (=> d!18858 (=> (not res!51134) (not e!40905))))

(declare-fun lt!95891 () (_ BitVec 64))

(declare-fun lt!95889 () (_ BitVec 64))

(declare-fun lt!95892 () (_ BitVec 64))

(assert (=> d!18858 (= res!51134 (= lt!95892 (bvsub lt!95889 lt!95891)))))

(assert (=> d!18858 (or (= (bvand lt!95889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95889 lt!95891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18858 (= lt!95891 (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746)))))))

(declare-fun lt!95890 () (_ BitVec 64))

(declare-fun lt!95894 () (_ BitVec 64))

(assert (=> d!18858 (= lt!95889 (bvmul lt!95890 lt!95894))))

(assert (=> d!18858 (or (= lt!95890 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95894 (bvsdiv (bvmul lt!95890 lt!95894) lt!95890)))))

(assert (=> d!18858 (= lt!95894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18858 (= lt!95890 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))))))

(assert (=> d!18858 (= lt!95892 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746)))))))

(assert (=> d!18858 (invariant!0 (currentBit!3264 (_2!2895 lt!95746)) (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95746))))))

(assert (=> d!18858 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))) lt!95892)))

(declare-fun b!61371 () Bool)

(declare-fun res!51135 () Bool)

(assert (=> b!61371 (=> (not res!51135) (not e!40905))))

(assert (=> b!61371 (= res!51135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95892))))

(declare-fun b!61372 () Bool)

(declare-fun lt!95893 () (_ BitVec 64))

(assert (=> b!61372 (= e!40905 (bvsle lt!95892 (bvmul lt!95893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61372 (or (= lt!95893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95893)))))

(assert (=> b!61372 (= lt!95893 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))))))

(assert (= (and d!18858 res!51134) b!61371))

(assert (= (and b!61371 res!51135) b!61372))

(declare-fun m!96871 () Bool)

(assert (=> d!18858 m!96871))

(assert (=> d!18858 m!96763))

(assert (=> b!61279 d!18858))

(declare-fun d!18860 () Bool)

(assert (=> d!18860 (= (head!499 (byteArrayBitContentToList!0 (_2!2895 lt!95746) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!795 (byteArrayBitContentToList!0 (_2!2895 lt!95746) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61289 d!18860))

(declare-fun d!18862 () Bool)

(declare-fun c!4313 () Bool)

(assert (=> d!18862 (= c!4313 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40912 () List!680)

(assert (=> d!18862 (= (byteArrayBitContentToList!0 (_2!2895 lt!95746) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!40912)))

(declare-fun b!61387 () Bool)

(assert (=> b!61387 (= e!40912 Nil!677)))

(declare-fun b!61388 () Bool)

(assert (=> b!61388 (= e!40912 (Cons!676 (not (= (bvand ((_ sign_extend 24) (select (arr!1828 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2895 lt!95746) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18862 c!4313) b!61387))

(assert (= (and d!18862 (not c!4313)) b!61388))

(assert (=> b!61388 m!96717))

(declare-fun m!96873 () Bool)

(assert (=> b!61388 m!96873))

(declare-fun m!96875 () Bool)

(assert (=> b!61388 m!96875))

(assert (=> b!61289 d!18862))

(declare-fun d!18864 () Bool)

(assert (=> d!18864 (= (head!499 (bitStreamReadBitsIntoList!0 (_2!2895 lt!95746) (_1!2894 lt!95737) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!795 (bitStreamReadBitsIntoList!0 (_2!2895 lt!95746) (_1!2894 lt!95737) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61289 d!18864))

(declare-fun b!61423 () Bool)

(declare-fun e!40930 () Bool)

(declare-fun lt!95987 () List!680)

(assert (=> b!61423 (= e!40930 (> (length!308 lt!95987) 0))))

(declare-fun b!61420 () Bool)

(declare-datatypes ((tuple2!5582 0))(
  ( (tuple2!5583 (_1!2902 List!680) (_2!2902 BitStream!2210)) )
))
(declare-fun e!40929 () tuple2!5582)

(assert (=> b!61420 (= e!40929 (tuple2!5583 Nil!677 (_1!2894 lt!95737)))))

(declare-fun b!61421 () Bool)

(declare-datatypes ((tuple2!5584 0))(
  ( (tuple2!5585 (_1!2903 Bool) (_2!2903 BitStream!2210)) )
))
(declare-fun lt!95986 () tuple2!5584)

(declare-fun lt!95985 () (_ BitVec 64))

(assert (=> b!61421 (= e!40929 (tuple2!5583 (Cons!676 (_1!2903 lt!95986) (bitStreamReadBitsIntoList!0 (_2!2895 lt!95746) (_2!2903 lt!95986) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!95985))) (_2!2903 lt!95986)))))

(declare-fun readBit!0 (BitStream!2210) tuple2!5584)

(assert (=> b!61421 (= lt!95986 (readBit!0 (_1!2894 lt!95737)))))

(assert (=> b!61421 (= lt!95985 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!18866 () Bool)

(assert (=> d!18866 e!40930))

(declare-fun c!4322 () Bool)

(assert (=> d!18866 (= c!4322 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18866 (= lt!95987 (_1!2902 e!40929))))

(declare-fun c!4323 () Bool)

(assert (=> d!18866 (= c!4323 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18866 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18866 (= (bitStreamReadBitsIntoList!0 (_2!2895 lt!95746) (_1!2894 lt!95737) #b0000000000000000000000000000000000000000000000000000000000000001) lt!95987)))

(declare-fun b!61422 () Bool)

(declare-fun isEmpty!185 (List!680) Bool)

(assert (=> b!61422 (= e!40930 (isEmpty!185 lt!95987))))

(assert (= (and d!18866 c!4323) b!61420))

(assert (= (and d!18866 (not c!4323)) b!61421))

(assert (= (and d!18866 c!4322) b!61422))

(assert (= (and d!18866 (not c!4322)) b!61423))

(declare-fun m!96945 () Bool)

(assert (=> b!61423 m!96945))

(declare-fun m!96947 () Bool)

(assert (=> b!61421 m!96947))

(declare-fun m!96949 () Bool)

(assert (=> b!61421 m!96949))

(declare-fun m!96951 () Bool)

(assert (=> b!61422 m!96951))

(assert (=> b!61289 d!18866))

(declare-fun d!18880 () Bool)

(assert (=> d!18880 (= (invariant!0 (currentBit!3264 (_2!2895 lt!95746)) (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95746)))) (and (bvsge (currentBit!3264 (_2!2895 lt!95746)) #b00000000000000000000000000000000) (bvslt (currentBit!3264 (_2!2895 lt!95746)) #b00000000000000000000000000001000) (bvsge (currentByte!3269 (_2!2895 lt!95746)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95746)))) (and (= (currentBit!3264 (_2!2895 lt!95746)) #b00000000000000000000000000000000) (= (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95746))))))))))

(assert (=> b!61291 d!18880))

(declare-fun d!18886 () Bool)

(declare-fun res!51157 () Bool)

(declare-fun e!40932 () Bool)

(assert (=> d!18886 (=> (not res!51157) (not e!40932))))

(assert (=> d!18886 (= res!51157 (= (size!1264 (buf!1645 (_1!2894 lt!95740))) (size!1264 (buf!1645 (_2!2895 lt!95749)))))))

(assert (=> d!18886 (= (isPrefixOf!0 (_1!2894 lt!95740) (_2!2895 lt!95749)) e!40932)))

(declare-fun b!61424 () Bool)

(declare-fun res!51159 () Bool)

(assert (=> b!61424 (=> (not res!51159) (not e!40932))))

(assert (=> b!61424 (= res!51159 (bvsle (bitIndex!0 (size!1264 (buf!1645 (_1!2894 lt!95740))) (currentByte!3269 (_1!2894 lt!95740)) (currentBit!3264 (_1!2894 lt!95740))) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749)))))))

(declare-fun b!61425 () Bool)

(declare-fun e!40931 () Bool)

(assert (=> b!61425 (= e!40932 e!40931)))

(declare-fun res!51158 () Bool)

(assert (=> b!61425 (=> res!51158 e!40931)))

(assert (=> b!61425 (= res!51158 (= (size!1264 (buf!1645 (_1!2894 lt!95740))) #b00000000000000000000000000000000))))

(declare-fun b!61426 () Bool)

(assert (=> b!61426 (= e!40931 (arrayBitRangesEq!0 (buf!1645 (_1!2894 lt!95740)) (buf!1645 (_2!2895 lt!95749)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1264 (buf!1645 (_1!2894 lt!95740))) (currentByte!3269 (_1!2894 lt!95740)) (currentBit!3264 (_1!2894 lt!95740)))))))

(assert (= (and d!18886 res!51157) b!61424))

(assert (= (and b!61424 res!51159) b!61425))

(assert (= (and b!61425 (not res!51158)) b!61426))

(declare-fun m!96955 () Bool)

(assert (=> b!61424 m!96955))

(assert (=> b!61424 m!96765))

(assert (=> b!61426 m!96955))

(assert (=> b!61426 m!96955))

(declare-fun m!96957 () Bool)

(assert (=> b!61426 m!96957))

(assert (=> b!61280 d!18886))

(declare-fun d!18888 () Bool)

(assert (=> d!18888 (= (array_inv!1164 srcBuffer!2) (bvsge (size!1264 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12016 d!18888))

(declare-fun d!18890 () Bool)

(assert (=> d!18890 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3264 thiss!1379) (currentByte!3269 thiss!1379) (size!1264 (buf!1645 thiss!1379))))))

(declare-fun bs!4718 () Bool)

(assert (= bs!4718 d!18890))

(declare-fun m!96959 () Bool)

(assert (=> bs!4718 m!96959))

(assert (=> start!12016 d!18890))

(declare-fun d!18894 () Bool)

(declare-fun res!51160 () Bool)

(declare-fun e!40934 () Bool)

(assert (=> d!18894 (=> (not res!51160) (not e!40934))))

(assert (=> d!18894 (= res!51160 (= (size!1264 (buf!1645 thiss!1379)) (size!1264 (buf!1645 (_2!2895 lt!95749)))))))

(assert (=> d!18894 (= (isPrefixOf!0 thiss!1379 (_2!2895 lt!95749)) e!40934)))

(declare-fun b!61427 () Bool)

(declare-fun res!51162 () Bool)

(assert (=> b!61427 (=> (not res!51162) (not e!40934))))

(assert (=> b!61427 (= res!51162 (bvsle (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749)))))))

(declare-fun b!61428 () Bool)

(declare-fun e!40933 () Bool)

(assert (=> b!61428 (= e!40934 e!40933)))

(declare-fun res!51161 () Bool)

(assert (=> b!61428 (=> res!51161 e!40933)))

(assert (=> b!61428 (= res!51161 (= (size!1264 (buf!1645 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61429 () Bool)

(assert (=> b!61429 (= e!40933 (arrayBitRangesEq!0 (buf!1645 thiss!1379) (buf!1645 (_2!2895 lt!95749)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379))))))

(assert (= (and d!18894 res!51160) b!61427))

(assert (= (and b!61427 res!51162) b!61428))

(assert (= (and b!61428 (not res!51161)) b!61429))

(assert (=> b!61427 m!96711))

(assert (=> b!61427 m!96765))

(assert (=> b!61429 m!96711))

(assert (=> b!61429 m!96711))

(declare-fun m!96961 () Bool)

(assert (=> b!61429 m!96961))

(assert (=> b!61292 d!18894))

(declare-fun d!18896 () Bool)

(assert (=> d!18896 (isPrefixOf!0 thiss!1379 (_2!2895 lt!95749))))

(declare-fun lt!95990 () Unit!4175)

(declare-fun choose!30 (BitStream!2210 BitStream!2210 BitStream!2210) Unit!4175)

(assert (=> d!18896 (= lt!95990 (choose!30 thiss!1379 (_2!2895 lt!95746) (_2!2895 lt!95749)))))

(assert (=> d!18896 (isPrefixOf!0 thiss!1379 (_2!2895 lt!95746))))

(assert (=> d!18896 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2895 lt!95746) (_2!2895 lt!95749)) lt!95990)))

(declare-fun bs!4719 () Bool)

(assert (= bs!4719 d!18896))

(assert (=> bs!4719 m!96729))

(declare-fun m!96963 () Bool)

(assert (=> bs!4719 m!96963))

(assert (=> bs!4719 m!96715))

(assert (=> b!61292 d!18896))

(declare-fun d!18898 () Bool)

(assert (=> d!18898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4720 () Bool)

(assert (= bs!4720 d!18898))

(declare-fun m!96965 () Bool)

(assert (=> bs!4720 m!96965))

(assert (=> b!61292 d!18898))

(declare-fun b!61454 () Bool)

(declare-fun res!51183 () Bool)

(declare-fun e!40948 () Bool)

(assert (=> b!61454 (=> (not res!51183) (not e!40948))))

(declare-fun lt!96060 () tuple2!5566)

(assert (=> b!61454 (= res!51183 (isPrefixOf!0 (_1!2894 lt!96060) thiss!1379))))

(declare-fun b!61455 () Bool)

(declare-fun e!40949 () Unit!4175)

(declare-fun lt!96066 () Unit!4175)

(assert (=> b!61455 (= e!40949 lt!96066)))

(declare-fun lt!96074 () (_ BitVec 64))

(assert (=> b!61455 (= lt!96074 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96062 () (_ BitVec 64))

(assert (=> b!61455 (= lt!96062 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2774 array!2774 (_ BitVec 64) (_ BitVec 64)) Unit!4175)

(assert (=> b!61455 (= lt!96066 (arrayBitRangesEqSymmetric!0 (buf!1645 thiss!1379) (buf!1645 (_2!2895 lt!95746)) lt!96074 lt!96062))))

(assert (=> b!61455 (arrayBitRangesEq!0 (buf!1645 (_2!2895 lt!95746)) (buf!1645 thiss!1379) lt!96074 lt!96062)))

(declare-fun b!61456 () Bool)

(declare-fun Unit!4189 () Unit!4175)

(assert (=> b!61456 (= e!40949 Unit!4189)))

(declare-fun b!61457 () Bool)

(declare-fun res!51184 () Bool)

(assert (=> b!61457 (=> (not res!51184) (not e!40948))))

(assert (=> b!61457 (= res!51184 (isPrefixOf!0 (_2!2894 lt!96060) (_2!2895 lt!95746)))))

(declare-fun d!18900 () Bool)

(assert (=> d!18900 e!40948))

(declare-fun res!51185 () Bool)

(assert (=> d!18900 (=> (not res!51185) (not e!40948))))

(assert (=> d!18900 (= res!51185 (isPrefixOf!0 (_1!2894 lt!96060) (_2!2894 lt!96060)))))

(declare-fun lt!96065 () BitStream!2210)

(assert (=> d!18900 (= lt!96060 (tuple2!5567 lt!96065 (_2!2895 lt!95746)))))

(declare-fun lt!96063 () Unit!4175)

(declare-fun lt!96061 () Unit!4175)

(assert (=> d!18900 (= lt!96063 lt!96061)))

(assert (=> d!18900 (isPrefixOf!0 lt!96065 (_2!2895 lt!95746))))

(assert (=> d!18900 (= lt!96061 (lemmaIsPrefixTransitive!0 lt!96065 (_2!2895 lt!95746) (_2!2895 lt!95746)))))

(declare-fun lt!96071 () Unit!4175)

(declare-fun lt!96076 () Unit!4175)

(assert (=> d!18900 (= lt!96071 lt!96076)))

(assert (=> d!18900 (isPrefixOf!0 lt!96065 (_2!2895 lt!95746))))

(assert (=> d!18900 (= lt!96076 (lemmaIsPrefixTransitive!0 lt!96065 thiss!1379 (_2!2895 lt!95746)))))

(declare-fun lt!96059 () Unit!4175)

(assert (=> d!18900 (= lt!96059 e!40949)))

(declare-fun c!4326 () Bool)

(assert (=> d!18900 (= c!4326 (not (= (size!1264 (buf!1645 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!96075 () Unit!4175)

(declare-fun lt!96067 () Unit!4175)

(assert (=> d!18900 (= lt!96075 lt!96067)))

(assert (=> d!18900 (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!95746))))

(assert (=> d!18900 (= lt!96067 (lemmaIsPrefixRefl!0 (_2!2895 lt!95746)))))

(declare-fun lt!96077 () Unit!4175)

(declare-fun lt!96072 () Unit!4175)

(assert (=> d!18900 (= lt!96077 lt!96072)))

(assert (=> d!18900 (= lt!96072 (lemmaIsPrefixRefl!0 (_2!2895 lt!95746)))))

(declare-fun lt!96064 () Unit!4175)

(declare-fun lt!96058 () Unit!4175)

(assert (=> d!18900 (= lt!96064 lt!96058)))

(assert (=> d!18900 (isPrefixOf!0 lt!96065 lt!96065)))

(assert (=> d!18900 (= lt!96058 (lemmaIsPrefixRefl!0 lt!96065))))

(declare-fun lt!96073 () Unit!4175)

(declare-fun lt!96070 () Unit!4175)

(assert (=> d!18900 (= lt!96073 lt!96070)))

(assert (=> d!18900 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18900 (= lt!96070 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18900 (= lt!96065 (BitStream!2211 (buf!1645 (_2!2895 lt!95746)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(assert (=> d!18900 (isPrefixOf!0 thiss!1379 (_2!2895 lt!95746))))

(assert (=> d!18900 (= (reader!0 thiss!1379 (_2!2895 lt!95746)) lt!96060)))

(declare-fun lt!96069 () (_ BitVec 64))

(declare-fun lt!96068 () (_ BitVec 64))

(declare-fun b!61458 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2210 (_ BitVec 64)) BitStream!2210)

(assert (=> b!61458 (= e!40948 (= (_1!2894 lt!96060) (withMovedBitIndex!0 (_2!2894 lt!96060) (bvsub lt!96069 lt!96068))))))

(assert (=> b!61458 (or (= (bvand lt!96069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96069 lt!96068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61458 (= lt!96068 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))))))

(assert (=> b!61458 (= lt!96069 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(assert (= (and d!18900 c!4326) b!61455))

(assert (= (and d!18900 (not c!4326)) b!61456))

(assert (= (and d!18900 res!51185) b!61454))

(assert (= (and b!61454 res!51183) b!61457))

(assert (= (and b!61457 res!51184) b!61458))

(declare-fun m!96979 () Bool)

(assert (=> b!61458 m!96979))

(assert (=> b!61458 m!96757))

(assert (=> b!61458 m!96711))

(assert (=> b!61455 m!96711))

(declare-fun m!96981 () Bool)

(assert (=> b!61455 m!96981))

(declare-fun m!96983 () Bool)

(assert (=> b!61455 m!96983))

(declare-fun m!96985 () Bool)

(assert (=> b!61454 m!96985))

(declare-fun m!96987 () Bool)

(assert (=> b!61457 m!96987))

(declare-fun m!96989 () Bool)

(assert (=> d!18900 m!96989))

(declare-fun m!96991 () Bool)

(assert (=> d!18900 m!96991))

(assert (=> d!18900 m!96707))

(declare-fun m!96993 () Bool)

(assert (=> d!18900 m!96993))

(declare-fun m!96995 () Bool)

(assert (=> d!18900 m!96995))

(declare-fun m!96997 () Bool)

(assert (=> d!18900 m!96997))

(declare-fun m!96999 () Bool)

(assert (=> d!18900 m!96999))

(assert (=> d!18900 m!96715))

(assert (=> d!18900 m!96709))

(declare-fun m!97001 () Bool)

(assert (=> d!18900 m!97001))

(declare-fun m!97003 () Bool)

(assert (=> d!18900 m!97003))

(assert (=> b!61292 d!18900))

(declare-fun d!18918 () Bool)

(assert (=> d!18918 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96080 () Unit!4175)

(declare-fun choose!9 (BitStream!2210 array!2774 (_ BitVec 64) BitStream!2210) Unit!4175)

(assert (=> d!18918 (= lt!96080 (choose!9 thiss!1379 (buf!1645 (_2!2895 lt!95746)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2211 (buf!1645 (_2!2895 lt!95746)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379))))))

(assert (=> d!18918 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1645 (_2!2895 lt!95746)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96080)))

(declare-fun bs!4723 () Bool)

(assert (= bs!4723 d!18918))

(assert (=> bs!4723 m!96727))

(declare-fun m!97005 () Bool)

(assert (=> bs!4723 m!97005))

(assert (=> b!61292 d!18918))

(declare-fun d!18920 () Bool)

(declare-fun res!51186 () Bool)

(declare-fun e!40951 () Bool)

(assert (=> d!18920 (=> (not res!51186) (not e!40951))))

(assert (=> d!18920 (= res!51186 (= (size!1264 (buf!1645 (_2!2895 lt!95746))) (size!1264 (buf!1645 (_2!2895 lt!95749)))))))

(assert (=> d!18920 (= (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!95749)) e!40951)))

(declare-fun b!61459 () Bool)

(declare-fun res!51188 () Bool)

(assert (=> b!61459 (=> (not res!51188) (not e!40951))))

(assert (=> b!61459 (= res!51188 (bvsle (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749)))))))

(declare-fun b!61460 () Bool)

(declare-fun e!40950 () Bool)

(assert (=> b!61460 (= e!40951 e!40950)))

(declare-fun res!51187 () Bool)

(assert (=> b!61460 (=> res!51187 e!40950)))

(assert (=> b!61460 (= res!51187 (= (size!1264 (buf!1645 (_2!2895 lt!95746))) #b00000000000000000000000000000000))))

(declare-fun b!61461 () Bool)

(assert (=> b!61461 (= e!40950 (arrayBitRangesEq!0 (buf!1645 (_2!2895 lt!95746)) (buf!1645 (_2!2895 lt!95749)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746)))))))

(assert (= (and d!18920 res!51186) b!61459))

(assert (= (and b!61459 res!51188) b!61460))

(assert (= (and b!61460 (not res!51187)) b!61461))

(assert (=> b!61459 m!96757))

(assert (=> b!61459 m!96765))

(assert (=> b!61461 m!96757))

(assert (=> b!61461 m!96757))

(declare-fun m!97007 () Bool)

(assert (=> b!61461 m!97007))

(assert (=> b!61292 d!18920))

(declare-fun b!61612 () Bool)

(declare-fun e!41027 () tuple2!5568)

(declare-fun lt!96479 () tuple2!5568)

(declare-fun Unit!4190 () Unit!4175)

(assert (=> b!61612 (= e!41027 (tuple2!5569 Unit!4190 (_2!2895 lt!96479)))))

(declare-fun lt!96453 () tuple2!5568)

(assert (=> b!61612 (= lt!96453 (appendBitFromByte!0 (_2!2895 lt!95746) (select (arr!1828 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!96482 () (_ BitVec 64))

(assert (=> b!61612 (= lt!96482 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96472 () (_ BitVec 64))

(assert (=> b!61612 (= lt!96472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96480 () Unit!4175)

(assert (=> b!61612 (= lt!96480 (validateOffsetBitsIneqLemma!0 (_2!2895 lt!95746) (_2!2895 lt!96453) lt!96482 lt!96472))))

(assert (=> b!61612 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!96453)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!96453))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!96453))) (bvsub lt!96482 lt!96472))))

(declare-fun lt!96471 () Unit!4175)

(assert (=> b!61612 (= lt!96471 lt!96480)))

(declare-fun lt!96477 () tuple2!5566)

(assert (=> b!61612 (= lt!96477 (reader!0 (_2!2895 lt!95746) (_2!2895 lt!96453)))))

(declare-fun lt!96481 () (_ BitVec 64))

(assert (=> b!61612 (= lt!96481 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96478 () Unit!4175)

(assert (=> b!61612 (= lt!96478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2895 lt!95746) (buf!1645 (_2!2895 lt!96453)) lt!96481))))

(assert (=> b!61612 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!96453)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!96481)))

(declare-fun lt!96485 () Unit!4175)

(assert (=> b!61612 (= lt!96485 lt!96478)))

(assert (=> b!61612 (= (head!499 (byteArrayBitContentToList!0 (_2!2895 lt!96453) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!499 (bitStreamReadBitsIntoList!0 (_2!2895 lt!96453) (_1!2894 lt!96477) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96475 () Unit!4175)

(declare-fun Unit!4192 () Unit!4175)

(assert (=> b!61612 (= lt!96475 Unit!4192)))

(assert (=> b!61612 (= lt!96479 (appendBitsMSBFirstLoop!0 (_2!2895 lt!96453) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!96455 () Unit!4175)

(assert (=> b!61612 (= lt!96455 (lemmaIsPrefixTransitive!0 (_2!2895 lt!95746) (_2!2895 lt!96453) (_2!2895 lt!96479)))))

(assert (=> b!61612 (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!96479))))

(declare-fun lt!96458 () Unit!4175)

(assert (=> b!61612 (= lt!96458 lt!96455)))

(assert (=> b!61612 (= (size!1264 (buf!1645 (_2!2895 lt!96479))) (size!1264 (buf!1645 (_2!2895 lt!95746))))))

(declare-fun lt!96459 () Unit!4175)

(declare-fun Unit!4193 () Unit!4175)

(assert (=> b!61612 (= lt!96459 Unit!4193)))

(assert (=> b!61612 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96479))) (currentByte!3269 (_2!2895 lt!96479)) (currentBit!3264 (_2!2895 lt!96479))) (bvsub (bvadd (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96496 () Unit!4175)

(declare-fun Unit!4194 () Unit!4175)

(assert (=> b!61612 (= lt!96496 Unit!4194)))

(assert (=> b!61612 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96479))) (currentByte!3269 (_2!2895 lt!96479)) (currentBit!3264 (_2!2895 lt!96479))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96453))) (currentByte!3269 (_2!2895 lt!96453)) (currentBit!3264 (_2!2895 lt!96453))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96465 () Unit!4175)

(declare-fun Unit!4195 () Unit!4175)

(assert (=> b!61612 (= lt!96465 Unit!4195)))

(declare-fun lt!96494 () tuple2!5566)

(declare-fun call!778 () tuple2!5566)

(assert (=> b!61612 (= lt!96494 call!778)))

(declare-fun lt!96473 () (_ BitVec 64))

(assert (=> b!61612 (= lt!96473 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96467 () Unit!4175)

(assert (=> b!61612 (= lt!96467 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2895 lt!95746) (buf!1645 (_2!2895 lt!96479)) lt!96473))))

(assert (=> b!61612 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!96479)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!96473)))

(declare-fun lt!96492 () Unit!4175)

(assert (=> b!61612 (= lt!96492 lt!96467)))

(declare-fun lt!96462 () tuple2!5566)

(assert (=> b!61612 (= lt!96462 (reader!0 (_2!2895 lt!96453) (_2!2895 lt!96479)))))

(declare-fun lt!96493 () (_ BitVec 64))

(assert (=> b!61612 (= lt!96493 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96469 () Unit!4175)

(assert (=> b!61612 (= lt!96469 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2895 lt!96453) (buf!1645 (_2!2895 lt!96479)) lt!96493))))

(assert (=> b!61612 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!96479)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!96453))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!96453))) lt!96493)))

(declare-fun lt!96483 () Unit!4175)

(assert (=> b!61612 (= lt!96483 lt!96469)))

(declare-fun lt!96489 () List!680)

(assert (=> b!61612 (= lt!96489 (byteArrayBitContentToList!0 (_2!2895 lt!96479) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!96486 () List!680)

(assert (=> b!61612 (= lt!96486 (byteArrayBitContentToList!0 (_2!2895 lt!96479) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96474 () List!680)

(assert (=> b!61612 (= lt!96474 (bitStreamReadBitsIntoList!0 (_2!2895 lt!96479) (_1!2894 lt!96494) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!96476 () List!680)

(assert (=> b!61612 (= lt!96476 (bitStreamReadBitsIntoList!0 (_2!2895 lt!96479) (_1!2894 lt!96462) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96484 () (_ BitVec 64))

(assert (=> b!61612 (= lt!96484 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96487 () Unit!4175)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2210 BitStream!2210 BitStream!2210 BitStream!2210 (_ BitVec 64) List!680) Unit!4175)

(assert (=> b!61612 (= lt!96487 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2895 lt!96479) (_2!2895 lt!96479) (_1!2894 lt!96494) (_1!2894 lt!96462) lt!96484 lt!96474))))

(declare-fun tail!286 (List!680) List!680)

(assert (=> b!61612 (= (bitStreamReadBitsIntoList!0 (_2!2895 lt!96479) (_1!2894 lt!96462) (bvsub lt!96484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!286 lt!96474))))

(declare-fun lt!96490 () Unit!4175)

(assert (=> b!61612 (= lt!96490 lt!96487)))

(declare-fun lt!96468 () (_ BitVec 64))

(declare-fun lt!96454 () Unit!4175)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2774 array!2774 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4175)

(assert (=> b!61612 (= lt!96454 (arrayBitRangesEqImpliesEq!0 (buf!1645 (_2!2895 lt!96453)) (buf!1645 (_2!2895 lt!96479)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!96468 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96453))) (currentByte!3269 (_2!2895 lt!96453)) (currentBit!3264 (_2!2895 lt!96453)))))))

(declare-fun bitAt!0 (array!2774 (_ BitVec 64)) Bool)

(assert (=> b!61612 (= (bitAt!0 (buf!1645 (_2!2895 lt!96453)) lt!96468) (bitAt!0 (buf!1645 (_2!2895 lt!96479)) lt!96468))))

(declare-fun lt!96460 () Unit!4175)

(assert (=> b!61612 (= lt!96460 lt!96454)))

(declare-fun b!61613 () Bool)

(declare-fun res!51305 () Bool)

(declare-fun e!41026 () Bool)

(assert (=> b!61613 (=> (not res!51305) (not e!41026))))

(declare-fun lt!96488 () tuple2!5568)

(assert (=> b!61613 (= res!51305 (= (size!1264 (buf!1645 (_2!2895 lt!96488))) (size!1264 (buf!1645 (_2!2895 lt!95746)))))))

(declare-fun b!61614 () Bool)

(declare-fun lt!96456 () tuple2!5566)

(assert (=> b!61614 (= e!41026 (= (bitStreamReadBitsIntoList!0 (_2!2895 lt!96488) (_1!2894 lt!96456) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2895 lt!96488) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!61614 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61614 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!96457 () Unit!4175)

(declare-fun lt!96470 () Unit!4175)

(assert (=> b!61614 (= lt!96457 lt!96470)))

(declare-fun lt!96461 () (_ BitVec 64))

(assert (=> b!61614 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!96488)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!96461)))

(assert (=> b!61614 (= lt!96470 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2895 lt!95746) (buf!1645 (_2!2895 lt!96488)) lt!96461))))

(declare-fun e!41025 () Bool)

(assert (=> b!61614 e!41025))

(declare-fun res!51306 () Bool)

(assert (=> b!61614 (=> (not res!51306) (not e!41025))))

(assert (=> b!61614 (= res!51306 (and (= (size!1264 (buf!1645 (_2!2895 lt!95746))) (size!1264 (buf!1645 (_2!2895 lt!96488)))) (bvsge lt!96461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61614 (= lt!96461 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!61614 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61614 (= lt!96456 (reader!0 (_2!2895 lt!95746) (_2!2895 lt!96488)))))

(declare-fun bm!775 () Bool)

(declare-fun c!4344 () Bool)

(assert (=> bm!775 (= call!778 (reader!0 (_2!2895 lt!95746) (ite c!4344 (_2!2895 lt!96479) (_2!2895 lt!95746))))))

(declare-fun b!61615 () Bool)

(assert (=> b!61615 (= e!41025 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!96461))))

(declare-fun b!61616 () Bool)

(declare-fun res!51308 () Bool)

(assert (=> b!61616 (=> (not res!51308) (not e!41026))))

(assert (=> b!61616 (= res!51308 (= (size!1264 (buf!1645 (_2!2895 lt!95746))) (size!1264 (buf!1645 (_2!2895 lt!96488)))))))

(declare-fun b!61617 () Bool)

(declare-fun Unit!4200 () Unit!4175)

(assert (=> b!61617 (= e!41027 (tuple2!5569 Unit!4200 (_2!2895 lt!95746)))))

(assert (=> b!61617 (= (size!1264 (buf!1645 (_2!2895 lt!95746))) (size!1264 (buf!1645 (_2!2895 lt!95746))))))

(declare-fun lt!96495 () Unit!4175)

(declare-fun Unit!4202 () Unit!4175)

(assert (=> b!61617 (= lt!96495 Unit!4202)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2210 array!2774 array!2774 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5590 0))(
  ( (tuple2!5591 (_1!2906 array!2774) (_2!2906 BitStream!2210)) )
))
(declare-fun readBits!0 (BitStream!2210 (_ BitVec 64)) tuple2!5590)

(assert (=> b!61617 (checkByteArrayBitContent!0 (_2!2895 lt!95746) srcBuffer!2 (_1!2906 (readBits!0 (_1!2894 call!778) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!61618 () Bool)

(declare-fun res!51304 () Bool)

(assert (=> b!61618 (=> (not res!51304) (not e!41026))))

(assert (=> b!61618 (= res!51304 (invariant!0 (currentBit!3264 (_2!2895 lt!96488)) (currentByte!3269 (_2!2895 lt!96488)) (size!1264 (buf!1645 (_2!2895 lt!96488)))))))

(declare-fun b!61619 () Bool)

(declare-fun res!51303 () Bool)

(assert (=> b!61619 (=> (not res!51303) (not e!41026))))

(assert (=> b!61619 (= res!51303 (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!96488)))))

(declare-fun d!18922 () Bool)

(assert (=> d!18922 e!41026))

(declare-fun res!51307 () Bool)

(assert (=> d!18922 (=> (not res!51307) (not e!41026))))

(declare-fun lt!96464 () (_ BitVec 64))

(assert (=> d!18922 (= res!51307 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96488))) (currentByte!3269 (_2!2895 lt!96488)) (currentBit!3264 (_2!2895 lt!96488))) (bvsub lt!96464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18922 (or (= (bvand lt!96464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!96466 () (_ BitVec 64))

(assert (=> d!18922 (= lt!96464 (bvadd lt!96466 to!314))))

(assert (=> d!18922 (or (not (= (bvand lt!96466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96466 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18922 (= lt!96466 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))))))

(assert (=> d!18922 (= lt!96488 e!41027)))

(assert (=> d!18922 (= c!4344 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!96491 () Unit!4175)

(declare-fun lt!96463 () Unit!4175)

(assert (=> d!18922 (= lt!96491 lt!96463)))

(assert (=> d!18922 (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!95746))))

(assert (=> d!18922 (= lt!96463 (lemmaIsPrefixRefl!0 (_2!2895 lt!95746)))))

(assert (=> d!18922 (= lt!96468 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))))))

(assert (=> d!18922 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18922 (= (appendBitsMSBFirstLoop!0 (_2!2895 lt!95746) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!96488)))

(assert (= (and d!18922 c!4344) b!61612))

(assert (= (and d!18922 (not c!4344)) b!61617))

(assert (= (or b!61612 b!61617) bm!775))

(assert (= (and d!18922 res!51307) b!61618))

(assert (= (and b!61618 res!51304) b!61616))

(assert (= (and b!61616 res!51308) b!61619))

(assert (= (and b!61619 res!51303) b!61613))

(assert (= (and b!61613 res!51305) b!61614))

(assert (= (and b!61614 res!51306) b!61615))

(declare-fun m!97257 () Bool)

(assert (=> b!61614 m!97257))

(declare-fun m!97259 () Bool)

(assert (=> b!61614 m!97259))

(declare-fun m!97261 () Bool)

(assert (=> b!61614 m!97261))

(declare-fun m!97263 () Bool)

(assert (=> b!61614 m!97263))

(declare-fun m!97265 () Bool)

(assert (=> b!61614 m!97265))

(declare-fun m!97267 () Bool)

(assert (=> bm!775 m!97267))

(declare-fun m!97269 () Bool)

(assert (=> d!18922 m!97269))

(assert (=> d!18922 m!96757))

(assert (=> d!18922 m!96993))

(assert (=> d!18922 m!97001))

(declare-fun m!97271 () Bool)

(assert (=> b!61618 m!97271))

(declare-fun m!97273 () Bool)

(assert (=> b!61612 m!97273))

(declare-fun m!97275 () Bool)

(assert (=> b!61612 m!97275))

(declare-fun m!97277 () Bool)

(assert (=> b!61612 m!97277))

(declare-fun m!97279 () Bool)

(assert (=> b!61612 m!97279))

(declare-fun m!97281 () Bool)

(assert (=> b!61612 m!97281))

(declare-fun m!97283 () Bool)

(assert (=> b!61612 m!97283))

(declare-fun m!97285 () Bool)

(assert (=> b!61612 m!97285))

(declare-fun m!97287 () Bool)

(assert (=> b!61612 m!97287))

(declare-fun m!97289 () Bool)

(assert (=> b!61612 m!97289))

(declare-fun m!97291 () Bool)

(assert (=> b!61612 m!97291))

(declare-fun m!97293 () Bool)

(assert (=> b!61612 m!97293))

(declare-fun m!97295 () Bool)

(assert (=> b!61612 m!97295))

(declare-fun m!97297 () Bool)

(assert (=> b!61612 m!97297))

(declare-fun m!97299 () Bool)

(assert (=> b!61612 m!97299))

(declare-fun m!97301 () Bool)

(assert (=> b!61612 m!97301))

(declare-fun m!97303 () Bool)

(assert (=> b!61612 m!97303))

(declare-fun m!97305 () Bool)

(assert (=> b!61612 m!97305))

(assert (=> b!61612 m!97301))

(declare-fun m!97307 () Bool)

(assert (=> b!61612 m!97307))

(declare-fun m!97309 () Bool)

(assert (=> b!61612 m!97309))

(declare-fun m!97311 () Bool)

(assert (=> b!61612 m!97311))

(assert (=> b!61612 m!96757))

(declare-fun m!97313 () Bool)

(assert (=> b!61612 m!97313))

(assert (=> b!61612 m!97311))

(declare-fun m!97315 () Bool)

(assert (=> b!61612 m!97315))

(declare-fun m!97317 () Bool)

(assert (=> b!61612 m!97317))

(declare-fun m!97319 () Bool)

(assert (=> b!61612 m!97319))

(declare-fun m!97321 () Bool)

(assert (=> b!61612 m!97321))

(declare-fun m!97323 () Bool)

(assert (=> b!61612 m!97323))

(declare-fun m!97325 () Bool)

(assert (=> b!61612 m!97325))

(assert (=> b!61612 m!97287))

(declare-fun m!97327 () Bool)

(assert (=> b!61612 m!97327))

(declare-fun m!97329 () Bool)

(assert (=> b!61612 m!97329))

(assert (=> b!61612 m!97299))

(declare-fun m!97331 () Bool)

(assert (=> b!61612 m!97331))

(declare-fun m!97333 () Bool)

(assert (=> b!61612 m!97333))

(declare-fun m!97335 () Bool)

(assert (=> b!61617 m!97335))

(declare-fun m!97337 () Bool)

(assert (=> b!61617 m!97337))

(declare-fun m!97339 () Bool)

(assert (=> b!61615 m!97339))

(declare-fun m!97341 () Bool)

(assert (=> b!61619 m!97341))

(assert (=> b!61292 d!18922))

(declare-fun d!18998 () Bool)

(declare-fun res!51309 () Bool)

(declare-fun e!41029 () Bool)

(assert (=> d!18998 (=> (not res!51309) (not e!41029))))

(assert (=> d!18998 (= res!51309 (= (size!1264 (buf!1645 thiss!1379)) (size!1264 (buf!1645 (_2!2895 lt!95746)))))))

(assert (=> d!18998 (= (isPrefixOf!0 thiss!1379 (_2!2895 lt!95746)) e!41029)))

(declare-fun b!61620 () Bool)

(declare-fun res!51311 () Bool)

(assert (=> b!61620 (=> (not res!51311) (not e!41029))))

(assert (=> b!61620 (= res!51311 (bvsle (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746)))))))

(declare-fun b!61621 () Bool)

(declare-fun e!41028 () Bool)

(assert (=> b!61621 (= e!41029 e!41028)))

(declare-fun res!51310 () Bool)

(assert (=> b!61621 (=> res!51310 e!41028)))

(assert (=> b!61621 (= res!51310 (= (size!1264 (buf!1645 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61622 () Bool)

(assert (=> b!61622 (= e!41028 (arrayBitRangesEq!0 (buf!1645 thiss!1379) (buf!1645 (_2!2895 lt!95746)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379))))))

(assert (= (and d!18998 res!51309) b!61620))

(assert (= (and b!61620 res!51311) b!61621))

(assert (= (and b!61621 (not res!51310)) b!61622))

(assert (=> b!61620 m!96711))

(assert (=> b!61620 m!96757))

(assert (=> b!61622 m!96711))

(assert (=> b!61622 m!96711))

(declare-fun m!97343 () Bool)

(assert (=> b!61622 m!97343))

(assert (=> b!61281 d!18998))

(declare-fun d!19000 () Bool)

(assert (=> d!19000 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!95738) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746)))) lt!95738))))

(declare-fun bs!4737 () Bool)

(assert (= bs!4737 d!19000))

(assert (=> bs!4737 m!96871))

(assert (=> b!61281 d!19000))

(declare-fun d!19002 () Bool)

(declare-fun e!41032 () Bool)

(assert (=> d!19002 e!41032))

(declare-fun res!51314 () Bool)

(assert (=> d!19002 (=> (not res!51314) (not e!41032))))

(assert (=> d!19002 (= res!51314 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!96499 () Unit!4175)

(declare-fun choose!27 (BitStream!2210 BitStream!2210 (_ BitVec 64) (_ BitVec 64)) Unit!4175)

(assert (=> d!19002 (= lt!96499 (choose!27 thiss!1379 (_2!2895 lt!95746) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19002 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19002 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2895 lt!95746) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96499)))

(declare-fun b!61625 () Bool)

(assert (=> b!61625 (= e!41032 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95746)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19002 res!51314) b!61625))

(declare-fun m!97345 () Bool)

(assert (=> d!19002 m!97345))

(declare-fun m!97347 () Bool)

(assert (=> b!61625 m!97347))

(assert (=> b!61281 d!19002))

(declare-fun b!61673 () Bool)

(declare-fun e!41056 () Bool)

(declare-datatypes ((tuple2!5592 0))(
  ( (tuple2!5593 (_1!2907 BitStream!2210) (_2!2907 Bool)) )
))
(declare-fun lt!96656 () tuple2!5592)

(declare-fun lt!96659 () tuple2!5568)

(assert (=> b!61673 (= e!41056 (= (bitIndex!0 (size!1264 (buf!1645 (_1!2907 lt!96656))) (currentByte!3269 (_1!2907 lt!96656)) (currentBit!3264 (_1!2907 lt!96656))) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96659))) (currentByte!3269 (_2!2895 lt!96659)) (currentBit!3264 (_2!2895 lt!96659)))))))

(declare-fun b!61674 () Bool)

(declare-fun res!51362 () Bool)

(declare-fun e!41057 () Bool)

(assert (=> b!61674 (=> (not res!51362) (not e!41057))))

(assert (=> b!61674 (= res!51362 (isPrefixOf!0 thiss!1379 (_2!2895 lt!96659)))))

(declare-fun b!61675 () Bool)

(declare-fun res!51357 () Bool)

(declare-fun e!41055 () Bool)

(assert (=> b!61675 (=> (not res!51357) (not e!41055))))

(declare-fun lt!96662 () (_ BitVec 64))

(declare-fun lt!96658 () tuple2!5568)

(declare-fun lt!96657 () (_ BitVec 64))

(assert (=> b!61675 (= res!51357 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96658))) (currentByte!3269 (_2!2895 lt!96658)) (currentBit!3264 (_2!2895 lt!96658))) (bvadd lt!96657 lt!96662)))))

(assert (=> b!61675 (or (not (= (bvand lt!96657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96662 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96657 lt!96662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61675 (= lt!96662 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!61675 (= lt!96657 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(declare-fun b!61676 () Bool)

(declare-fun res!51359 () Bool)

(assert (=> b!61676 (=> (not res!51359) (not e!41055))))

(assert (=> b!61676 (= res!51359 (isPrefixOf!0 thiss!1379 (_2!2895 lt!96658)))))

(declare-fun b!61677 () Bool)

(declare-fun e!41054 () Bool)

(assert (=> b!61677 (= e!41055 e!41054)))

(declare-fun res!51356 () Bool)

(assert (=> b!61677 (=> (not res!51356) (not e!41054))))

(declare-fun lt!96660 () (_ BitVec 8))

(declare-fun lt!96661 () tuple2!5592)

(assert (=> b!61677 (= res!51356 (and (= (_2!2907 lt!96661) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1828 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!96660)) #b00000000000000000000000000000000))) (= (_1!2907 lt!96661) (_2!2895 lt!96658))))))

(declare-fun lt!96665 () tuple2!5590)

(declare-fun lt!96664 () BitStream!2210)

(assert (=> b!61677 (= lt!96665 (readBits!0 lt!96664 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2210) tuple2!5592)

(assert (=> b!61677 (= lt!96661 (readBitPure!0 lt!96664))))

(declare-fun readerFrom!0 (BitStream!2210 (_ BitVec 32) (_ BitVec 32)) BitStream!2210)

(assert (=> b!61677 (= lt!96664 (readerFrom!0 (_2!2895 lt!96658) (currentBit!3264 thiss!1379) (currentByte!3269 thiss!1379)))))

(declare-fun d!19004 () Bool)

(assert (=> d!19004 e!41055))

(declare-fun res!51360 () Bool)

(assert (=> d!19004 (=> (not res!51360) (not e!41055))))

(assert (=> d!19004 (= res!51360 (= (size!1264 (buf!1645 (_2!2895 lt!96658))) (size!1264 (buf!1645 thiss!1379))))))

(declare-fun lt!96663 () array!2774)

(assert (=> d!19004 (= lt!96660 (select (arr!1828 lt!96663) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19004 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1264 lt!96663)))))

(assert (=> d!19004 (= lt!96663 (array!2775 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!96666 () tuple2!5568)

(assert (=> d!19004 (= lt!96658 (tuple2!5569 (_1!2895 lt!96666) (_2!2895 lt!96666)))))

(assert (=> d!19004 (= lt!96666 lt!96659)))

(assert (=> d!19004 e!41057))

(declare-fun res!51355 () Bool)

(assert (=> d!19004 (=> (not res!51355) (not e!41057))))

(assert (=> d!19004 (= res!51355 (= (size!1264 (buf!1645 thiss!1379)) (size!1264 (buf!1645 (_2!2895 lt!96659)))))))

(declare-fun lt!96667 () Bool)

(declare-fun appendBit!0 (BitStream!2210 Bool) tuple2!5568)

(assert (=> d!19004 (= lt!96659 (appendBit!0 thiss!1379 lt!96667))))

(assert (=> d!19004 (= lt!96667 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1828 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19004 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19004 (= (appendBitFromByte!0 thiss!1379 (select (arr!1828 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!96658)))

(declare-fun b!61678 () Bool)

(assert (=> b!61678 (= e!41054 (= (bitIndex!0 (size!1264 (buf!1645 (_1!2907 lt!96661))) (currentByte!3269 (_1!2907 lt!96661)) (currentBit!3264 (_1!2907 lt!96661))) (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96658))) (currentByte!3269 (_2!2895 lt!96658)) (currentBit!3264 (_2!2895 lt!96658)))))))

(declare-fun b!61679 () Bool)

(assert (=> b!61679 (= e!41057 e!41056)))

(declare-fun res!51361 () Bool)

(assert (=> b!61679 (=> (not res!51361) (not e!41056))))

(assert (=> b!61679 (= res!51361 (and (= (_2!2907 lt!96656) lt!96667) (= (_1!2907 lt!96656) (_2!2895 lt!96659))))))

(assert (=> b!61679 (= lt!96656 (readBitPure!0 (readerFrom!0 (_2!2895 lt!96659) (currentBit!3264 thiss!1379) (currentByte!3269 thiss!1379))))))

(declare-fun b!61680 () Bool)

(declare-fun res!51358 () Bool)

(assert (=> b!61680 (=> (not res!51358) (not e!41057))))

(assert (=> b!61680 (= res!51358 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!96659))) (currentByte!3269 (_2!2895 lt!96659)) (currentBit!3264 (_2!2895 lt!96659))) (bvadd (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19004 res!51355) b!61680))

(assert (= (and b!61680 res!51358) b!61674))

(assert (= (and b!61674 res!51362) b!61679))

(assert (= (and b!61679 res!51361) b!61673))

(assert (= (and d!19004 res!51360) b!61675))

(assert (= (and b!61675 res!51357) b!61676))

(assert (= (and b!61676 res!51359) b!61677))

(assert (= (and b!61677 res!51356) b!61678))

(declare-fun m!97443 () Bool)

(assert (=> b!61673 m!97443))

(declare-fun m!97445 () Bool)

(assert (=> b!61673 m!97445))

(declare-fun m!97447 () Bool)

(assert (=> b!61679 m!97447))

(assert (=> b!61679 m!97447))

(declare-fun m!97449 () Bool)

(assert (=> b!61679 m!97449))

(declare-fun m!97451 () Bool)

(assert (=> b!61675 m!97451))

(assert (=> b!61675 m!96711))

(declare-fun m!97453 () Bool)

(assert (=> d!19004 m!97453))

(declare-fun m!97455 () Bool)

(assert (=> d!19004 m!97455))

(assert (=> d!19004 m!96873))

(declare-fun m!97457 () Bool)

(assert (=> b!61677 m!97457))

(declare-fun m!97459 () Bool)

(assert (=> b!61677 m!97459))

(declare-fun m!97461 () Bool)

(assert (=> b!61677 m!97461))

(assert (=> b!61680 m!97445))

(assert (=> b!61680 m!96711))

(declare-fun m!97463 () Bool)

(assert (=> b!61676 m!97463))

(declare-fun m!97465 () Bool)

(assert (=> b!61678 m!97465))

(assert (=> b!61678 m!97451))

(declare-fun m!97467 () Bool)

(assert (=> b!61674 m!97467))

(assert (=> b!61281 d!19004))

(declare-fun d!19014 () Bool)

(assert (=> d!19014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!95738)))

(declare-fun lt!96668 () Unit!4175)

(assert (=> d!19014 (= lt!96668 (choose!9 (_2!2895 lt!95746) (buf!1645 (_2!2895 lt!95749)) lt!95738 (BitStream!2211 (buf!1645 (_2!2895 lt!95749)) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746)))))))

(assert (=> d!19014 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2895 lt!95746) (buf!1645 (_2!2895 lt!95749)) lt!95738) lt!96668)))

(declare-fun bs!4739 () Bool)

(assert (= bs!4739 d!19014))

(assert (=> bs!4739 m!96695))

(declare-fun m!97469 () Bool)

(assert (=> bs!4739 m!97469))

(assert (=> b!61294 d!19014))

(declare-fun b!61681 () Bool)

(declare-fun res!51363 () Bool)

(declare-fun e!41058 () Bool)

(assert (=> b!61681 (=> (not res!51363) (not e!41058))))

(declare-fun lt!96671 () tuple2!5566)

(assert (=> b!61681 (= res!51363 (isPrefixOf!0 (_1!2894 lt!96671) thiss!1379))))

(declare-fun b!61682 () Bool)

(declare-fun e!41059 () Unit!4175)

(declare-fun lt!96677 () Unit!4175)

(assert (=> b!61682 (= e!41059 lt!96677)))

(declare-fun lt!96685 () (_ BitVec 64))

(assert (=> b!61682 (= lt!96685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96673 () (_ BitVec 64))

(assert (=> b!61682 (= lt!96673 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(assert (=> b!61682 (= lt!96677 (arrayBitRangesEqSymmetric!0 (buf!1645 thiss!1379) (buf!1645 (_2!2895 lt!95749)) lt!96685 lt!96673))))

(assert (=> b!61682 (arrayBitRangesEq!0 (buf!1645 (_2!2895 lt!95749)) (buf!1645 thiss!1379) lt!96685 lt!96673)))

(declare-fun b!61683 () Bool)

(declare-fun Unit!4205 () Unit!4175)

(assert (=> b!61683 (= e!41059 Unit!4205)))

(declare-fun b!61684 () Bool)

(declare-fun res!51364 () Bool)

(assert (=> b!61684 (=> (not res!51364) (not e!41058))))

(assert (=> b!61684 (= res!51364 (isPrefixOf!0 (_2!2894 lt!96671) (_2!2895 lt!95749)))))

(declare-fun d!19016 () Bool)

(assert (=> d!19016 e!41058))

(declare-fun res!51365 () Bool)

(assert (=> d!19016 (=> (not res!51365) (not e!41058))))

(assert (=> d!19016 (= res!51365 (isPrefixOf!0 (_1!2894 lt!96671) (_2!2894 lt!96671)))))

(declare-fun lt!96676 () BitStream!2210)

(assert (=> d!19016 (= lt!96671 (tuple2!5567 lt!96676 (_2!2895 lt!95749)))))

(declare-fun lt!96674 () Unit!4175)

(declare-fun lt!96672 () Unit!4175)

(assert (=> d!19016 (= lt!96674 lt!96672)))

(assert (=> d!19016 (isPrefixOf!0 lt!96676 (_2!2895 lt!95749))))

(assert (=> d!19016 (= lt!96672 (lemmaIsPrefixTransitive!0 lt!96676 (_2!2895 lt!95749) (_2!2895 lt!95749)))))

(declare-fun lt!96682 () Unit!4175)

(declare-fun lt!96687 () Unit!4175)

(assert (=> d!19016 (= lt!96682 lt!96687)))

(assert (=> d!19016 (isPrefixOf!0 lt!96676 (_2!2895 lt!95749))))

(assert (=> d!19016 (= lt!96687 (lemmaIsPrefixTransitive!0 lt!96676 thiss!1379 (_2!2895 lt!95749)))))

(declare-fun lt!96670 () Unit!4175)

(assert (=> d!19016 (= lt!96670 e!41059)))

(declare-fun c!4348 () Bool)

(assert (=> d!19016 (= c!4348 (not (= (size!1264 (buf!1645 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!96686 () Unit!4175)

(declare-fun lt!96678 () Unit!4175)

(assert (=> d!19016 (= lt!96686 lt!96678)))

(assert (=> d!19016 (isPrefixOf!0 (_2!2895 lt!95749) (_2!2895 lt!95749))))

(assert (=> d!19016 (= lt!96678 (lemmaIsPrefixRefl!0 (_2!2895 lt!95749)))))

(declare-fun lt!96688 () Unit!4175)

(declare-fun lt!96683 () Unit!4175)

(assert (=> d!19016 (= lt!96688 lt!96683)))

(assert (=> d!19016 (= lt!96683 (lemmaIsPrefixRefl!0 (_2!2895 lt!95749)))))

(declare-fun lt!96675 () Unit!4175)

(declare-fun lt!96669 () Unit!4175)

(assert (=> d!19016 (= lt!96675 lt!96669)))

(assert (=> d!19016 (isPrefixOf!0 lt!96676 lt!96676)))

(assert (=> d!19016 (= lt!96669 (lemmaIsPrefixRefl!0 lt!96676))))

(declare-fun lt!96684 () Unit!4175)

(declare-fun lt!96681 () Unit!4175)

(assert (=> d!19016 (= lt!96684 lt!96681)))

(assert (=> d!19016 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19016 (= lt!96681 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19016 (= lt!96676 (BitStream!2211 (buf!1645 (_2!2895 lt!95749)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(assert (=> d!19016 (isPrefixOf!0 thiss!1379 (_2!2895 lt!95749))))

(assert (=> d!19016 (= (reader!0 thiss!1379 (_2!2895 lt!95749)) lt!96671)))

(declare-fun lt!96679 () (_ BitVec 64))

(declare-fun lt!96680 () (_ BitVec 64))

(declare-fun b!61685 () Bool)

(assert (=> b!61685 (= e!41058 (= (_1!2894 lt!96671) (withMovedBitIndex!0 (_2!2894 lt!96671) (bvsub lt!96680 lt!96679))))))

(assert (=> b!61685 (or (= (bvand lt!96680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96680 lt!96679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61685 (= lt!96679 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749))))))

(assert (=> b!61685 (= lt!96680 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)))))

(assert (= (and d!19016 c!4348) b!61682))

(assert (= (and d!19016 (not c!4348)) b!61683))

(assert (= (and d!19016 res!51365) b!61681))

(assert (= (and b!61681 res!51363) b!61684))

(assert (= (and b!61684 res!51364) b!61685))

(declare-fun m!97471 () Bool)

(assert (=> b!61685 m!97471))

(assert (=> b!61685 m!96765))

(assert (=> b!61685 m!96711))

(assert (=> b!61682 m!96711))

(declare-fun m!97473 () Bool)

(assert (=> b!61682 m!97473))

(declare-fun m!97475 () Bool)

(assert (=> b!61682 m!97475))

(declare-fun m!97477 () Bool)

(assert (=> b!61681 m!97477))

(declare-fun m!97479 () Bool)

(assert (=> b!61684 m!97479))

(declare-fun m!97481 () Bool)

(assert (=> d!19016 m!97481))

(declare-fun m!97483 () Bool)

(assert (=> d!19016 m!97483))

(assert (=> d!19016 m!96707))

(declare-fun m!97485 () Bool)

(assert (=> d!19016 m!97485))

(declare-fun m!97487 () Bool)

(assert (=> d!19016 m!97487))

(declare-fun m!97489 () Bool)

(assert (=> d!19016 m!97489))

(declare-fun m!97491 () Bool)

(assert (=> d!19016 m!97491))

(assert (=> d!19016 m!96729))

(assert (=> d!19016 m!96709))

(declare-fun m!97493 () Bool)

(assert (=> d!19016 m!97493))

(declare-fun m!97495 () Bool)

(assert (=> d!19016 m!97495))

(assert (=> b!61294 d!19016))

(declare-fun b!61689 () Bool)

(declare-fun e!41061 () Bool)

(declare-fun lt!96691 () List!680)

(assert (=> b!61689 (= e!41061 (> (length!308 lt!96691) 0))))

(declare-fun b!61686 () Bool)

(declare-fun e!41060 () tuple2!5582)

(assert (=> b!61686 (= e!41060 (tuple2!5583 Nil!677 (_1!2894 lt!95747)))))

(declare-fun b!61687 () Bool)

(declare-fun lt!96690 () tuple2!5584)

(declare-fun lt!96689 () (_ BitVec 64))

(assert (=> b!61687 (= e!41060 (tuple2!5583 (Cons!676 (_1!2903 lt!96690) (bitStreamReadBitsIntoList!0 (_2!2895 lt!95749) (_2!2903 lt!96690) (bvsub lt!95738 lt!96689))) (_2!2903 lt!96690)))))

(assert (=> b!61687 (= lt!96690 (readBit!0 (_1!2894 lt!95747)))))

(assert (=> b!61687 (= lt!96689 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19018 () Bool)

(assert (=> d!19018 e!41061))

(declare-fun c!4349 () Bool)

(assert (=> d!19018 (= c!4349 (= lt!95738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19018 (= lt!96691 (_1!2902 e!41060))))

(declare-fun c!4350 () Bool)

(assert (=> d!19018 (= c!4350 (= lt!95738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19018 (bvsge lt!95738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19018 (= (bitStreamReadBitsIntoList!0 (_2!2895 lt!95749) (_1!2894 lt!95747) lt!95738) lt!96691)))

(declare-fun b!61688 () Bool)

(assert (=> b!61688 (= e!41061 (isEmpty!185 lt!96691))))

(assert (= (and d!19018 c!4350) b!61686))

(assert (= (and d!19018 (not c!4350)) b!61687))

(assert (= (and d!19018 c!4349) b!61688))

(assert (= (and d!19018 (not c!4349)) b!61689))

(declare-fun m!97497 () Bool)

(assert (=> b!61689 m!97497))

(declare-fun m!97499 () Bool)

(assert (=> b!61687 m!97499))

(declare-fun m!97501 () Bool)

(assert (=> b!61687 m!97501))

(declare-fun m!97503 () Bool)

(assert (=> b!61688 m!97503))

(assert (=> b!61294 d!19018))

(declare-fun d!19020 () Bool)

(assert (=> d!19020 (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!96692 () Unit!4175)

(assert (=> d!19020 (= lt!96692 (choose!9 thiss!1379 (buf!1645 (_2!2895 lt!95749)) (bvsub to!314 i!635) (BitStream!2211 (buf!1645 (_2!2895 lt!95749)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379))))))

(assert (=> d!19020 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1645 (_2!2895 lt!95749)) (bvsub to!314 i!635)) lt!96692)))

(declare-fun bs!4740 () Bool)

(assert (= bs!4740 d!19020))

(assert (=> bs!4740 m!96703))

(declare-fun m!97505 () Bool)

(assert (=> bs!4740 m!97505))

(assert (=> b!61294 d!19020))

(declare-fun b!61690 () Bool)

(declare-fun res!51366 () Bool)

(declare-fun e!41062 () Bool)

(assert (=> b!61690 (=> (not res!51366) (not e!41062))))

(declare-fun lt!96695 () tuple2!5566)

(assert (=> b!61690 (= res!51366 (isPrefixOf!0 (_1!2894 lt!96695) (_2!2895 lt!95746)))))

(declare-fun b!61691 () Bool)

(declare-fun e!41063 () Unit!4175)

(declare-fun lt!96701 () Unit!4175)

(assert (=> b!61691 (= e!41063 lt!96701)))

(declare-fun lt!96709 () (_ BitVec 64))

(assert (=> b!61691 (= lt!96709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96697 () (_ BitVec 64))

(assert (=> b!61691 (= lt!96697 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))))))

(assert (=> b!61691 (= lt!96701 (arrayBitRangesEqSymmetric!0 (buf!1645 (_2!2895 lt!95746)) (buf!1645 (_2!2895 lt!95749)) lt!96709 lt!96697))))

(assert (=> b!61691 (arrayBitRangesEq!0 (buf!1645 (_2!2895 lt!95749)) (buf!1645 (_2!2895 lt!95746)) lt!96709 lt!96697)))

(declare-fun b!61692 () Bool)

(declare-fun Unit!4206 () Unit!4175)

(assert (=> b!61692 (= e!41063 Unit!4206)))

(declare-fun b!61693 () Bool)

(declare-fun res!51367 () Bool)

(assert (=> b!61693 (=> (not res!51367) (not e!41062))))

(assert (=> b!61693 (= res!51367 (isPrefixOf!0 (_2!2894 lt!96695) (_2!2895 lt!95749)))))

(declare-fun d!19022 () Bool)

(assert (=> d!19022 e!41062))

(declare-fun res!51368 () Bool)

(assert (=> d!19022 (=> (not res!51368) (not e!41062))))

(assert (=> d!19022 (= res!51368 (isPrefixOf!0 (_1!2894 lt!96695) (_2!2894 lt!96695)))))

(declare-fun lt!96700 () BitStream!2210)

(assert (=> d!19022 (= lt!96695 (tuple2!5567 lt!96700 (_2!2895 lt!95749)))))

(declare-fun lt!96698 () Unit!4175)

(declare-fun lt!96696 () Unit!4175)

(assert (=> d!19022 (= lt!96698 lt!96696)))

(assert (=> d!19022 (isPrefixOf!0 lt!96700 (_2!2895 lt!95749))))

(assert (=> d!19022 (= lt!96696 (lemmaIsPrefixTransitive!0 lt!96700 (_2!2895 lt!95749) (_2!2895 lt!95749)))))

(declare-fun lt!96706 () Unit!4175)

(declare-fun lt!96711 () Unit!4175)

(assert (=> d!19022 (= lt!96706 lt!96711)))

(assert (=> d!19022 (isPrefixOf!0 lt!96700 (_2!2895 lt!95749))))

(assert (=> d!19022 (= lt!96711 (lemmaIsPrefixTransitive!0 lt!96700 (_2!2895 lt!95746) (_2!2895 lt!95749)))))

(declare-fun lt!96694 () Unit!4175)

(assert (=> d!19022 (= lt!96694 e!41063)))

(declare-fun c!4351 () Bool)

(assert (=> d!19022 (= c!4351 (not (= (size!1264 (buf!1645 (_2!2895 lt!95746))) #b00000000000000000000000000000000)))))

(declare-fun lt!96710 () Unit!4175)

(declare-fun lt!96702 () Unit!4175)

(assert (=> d!19022 (= lt!96710 lt!96702)))

(assert (=> d!19022 (isPrefixOf!0 (_2!2895 lt!95749) (_2!2895 lt!95749))))

(assert (=> d!19022 (= lt!96702 (lemmaIsPrefixRefl!0 (_2!2895 lt!95749)))))

(declare-fun lt!96712 () Unit!4175)

(declare-fun lt!96707 () Unit!4175)

(assert (=> d!19022 (= lt!96712 lt!96707)))

(assert (=> d!19022 (= lt!96707 (lemmaIsPrefixRefl!0 (_2!2895 lt!95749)))))

(declare-fun lt!96699 () Unit!4175)

(declare-fun lt!96693 () Unit!4175)

(assert (=> d!19022 (= lt!96699 lt!96693)))

(assert (=> d!19022 (isPrefixOf!0 lt!96700 lt!96700)))

(assert (=> d!19022 (= lt!96693 (lemmaIsPrefixRefl!0 lt!96700))))

(declare-fun lt!96708 () Unit!4175)

(declare-fun lt!96705 () Unit!4175)

(assert (=> d!19022 (= lt!96708 lt!96705)))

(assert (=> d!19022 (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!95746))))

(assert (=> d!19022 (= lt!96705 (lemmaIsPrefixRefl!0 (_2!2895 lt!95746)))))

(assert (=> d!19022 (= lt!96700 (BitStream!2211 (buf!1645 (_2!2895 lt!95749)) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))))))

(assert (=> d!19022 (isPrefixOf!0 (_2!2895 lt!95746) (_2!2895 lt!95749))))

(assert (=> d!19022 (= (reader!0 (_2!2895 lt!95746) (_2!2895 lt!95749)) lt!96695)))

(declare-fun lt!96703 () (_ BitVec 64))

(declare-fun b!61694 () Bool)

(declare-fun lt!96704 () (_ BitVec 64))

(assert (=> b!61694 (= e!41062 (= (_1!2894 lt!96695) (withMovedBitIndex!0 (_2!2894 lt!96695) (bvsub lt!96704 lt!96703))))))

(assert (=> b!61694 (or (= (bvand lt!96704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96704 lt!96703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61694 (= lt!96703 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749))))))

(assert (=> b!61694 (= lt!96704 (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95746))) (currentByte!3269 (_2!2895 lt!95746)) (currentBit!3264 (_2!2895 lt!95746))))))

(assert (= (and d!19022 c!4351) b!61691))

(assert (= (and d!19022 (not c!4351)) b!61692))

(assert (= (and d!19022 res!51368) b!61690))

(assert (= (and b!61690 res!51366) b!61693))

(assert (= (and b!61693 res!51367) b!61694))

(declare-fun m!97507 () Bool)

(assert (=> b!61694 m!97507))

(assert (=> b!61694 m!96765))

(assert (=> b!61694 m!96757))

(assert (=> b!61691 m!96757))

(declare-fun m!97509 () Bool)

(assert (=> b!61691 m!97509))

(declare-fun m!97511 () Bool)

(assert (=> b!61691 m!97511))

(declare-fun m!97513 () Bool)

(assert (=> b!61690 m!97513))

(declare-fun m!97515 () Bool)

(assert (=> b!61693 m!97515))

(declare-fun m!97517 () Bool)

(assert (=> d!19022 m!97517))

(declare-fun m!97519 () Bool)

(assert (=> d!19022 m!97519))

(assert (=> d!19022 m!96993))

(assert (=> d!19022 m!97485))

(declare-fun m!97521 () Bool)

(assert (=> d!19022 m!97521))

(declare-fun m!97523 () Bool)

(assert (=> d!19022 m!97523))

(declare-fun m!97525 () Bool)

(assert (=> d!19022 m!97525))

(assert (=> d!19022 m!96735))

(assert (=> d!19022 m!97001))

(assert (=> d!19022 m!97493))

(declare-fun m!97527 () Bool)

(assert (=> d!19022 m!97527))

(assert (=> b!61294 d!19022))

(declare-fun d!19024 () Bool)

(assert (=> d!19024 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746))) lt!95738) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95746))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95746)))) lt!95738))))

(declare-fun bs!4741 () Bool)

(assert (= bs!4741 d!19024))

(declare-fun m!97529 () Bool)

(assert (=> bs!4741 m!97529))

(assert (=> b!61294 d!19024))

(declare-fun b!61698 () Bool)

(declare-fun e!41065 () Bool)

(declare-fun lt!96715 () List!680)

(assert (=> b!61698 (= e!41065 (> (length!308 lt!96715) 0))))

(declare-fun b!61695 () Bool)

(declare-fun e!41064 () tuple2!5582)

(assert (=> b!61695 (= e!41064 (tuple2!5583 Nil!677 (_1!2894 lt!95740)))))

(declare-fun b!61696 () Bool)

(declare-fun lt!96714 () tuple2!5584)

(declare-fun lt!96713 () (_ BitVec 64))

(assert (=> b!61696 (= e!41064 (tuple2!5583 (Cons!676 (_1!2903 lt!96714) (bitStreamReadBitsIntoList!0 (_2!2895 lt!95749) (_2!2903 lt!96714) (bvsub (bvsub to!314 i!635) lt!96713))) (_2!2903 lt!96714)))))

(assert (=> b!61696 (= lt!96714 (readBit!0 (_1!2894 lt!95740)))))

(assert (=> b!61696 (= lt!96713 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19026 () Bool)

(assert (=> d!19026 e!41065))

(declare-fun c!4352 () Bool)

(assert (=> d!19026 (= c!4352 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19026 (= lt!96715 (_1!2902 e!41064))))

(declare-fun c!4353 () Bool)

(assert (=> d!19026 (= c!4353 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19026 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19026 (= (bitStreamReadBitsIntoList!0 (_2!2895 lt!95749) (_1!2894 lt!95740) (bvsub to!314 i!635)) lt!96715)))

(declare-fun b!61697 () Bool)

(assert (=> b!61697 (= e!41065 (isEmpty!185 lt!96715))))

(assert (= (and d!19026 c!4353) b!61695))

(assert (= (and d!19026 (not c!4353)) b!61696))

(assert (= (and d!19026 c!4352) b!61697))

(assert (= (and d!19026 (not c!4352)) b!61698))

(declare-fun m!97531 () Bool)

(assert (=> b!61698 m!97531))

(declare-fun m!97533 () Bool)

(assert (=> b!61696 m!97533))

(declare-fun m!97535 () Bool)

(assert (=> b!61696 m!97535))

(declare-fun m!97537 () Bool)

(assert (=> b!61697 m!97537))

(assert (=> b!61294 d!19026))

(declare-fun d!19028 () Bool)

(assert (=> d!19028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4742 () Bool)

(assert (= bs!4742 d!19028))

(declare-fun m!97539 () Bool)

(assert (=> bs!4742 m!97539))

(assert (=> b!61294 d!19028))

(declare-fun d!19030 () Bool)

(assert (=> d!19030 (= (invariant!0 (currentBit!3264 (_2!2895 lt!95746)) (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95749)))) (and (bvsge (currentBit!3264 (_2!2895 lt!95746)) #b00000000000000000000000000000000) (bvslt (currentBit!3264 (_2!2895 lt!95746)) #b00000000000000000000000000001000) (bvsge (currentByte!3269 (_2!2895 lt!95746)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95749)))) (and (= (currentBit!3264 (_2!2895 lt!95746)) #b00000000000000000000000000000000) (= (currentByte!3269 (_2!2895 lt!95746)) (size!1264 (buf!1645 (_2!2895 lt!95749))))))))))

(assert (=> b!61283 d!19030))

(declare-fun d!19032 () Bool)

(declare-fun res!51369 () Bool)

(declare-fun e!41067 () Bool)

(assert (=> d!19032 (=> (not res!51369) (not e!41067))))

(assert (=> d!19032 (= res!51369 (= (size!1264 (buf!1645 thiss!1379)) (size!1264 (buf!1645 thiss!1379))))))

(assert (=> d!19032 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41067)))

(declare-fun b!61699 () Bool)

(declare-fun res!51371 () Bool)

(assert (=> b!61699 (=> (not res!51371) (not e!41067))))

(assert (=> b!61699 (= res!51371 (bvsle (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)) (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379))))))

(declare-fun b!61700 () Bool)

(declare-fun e!41066 () Bool)

(assert (=> b!61700 (= e!41067 e!41066)))

(declare-fun res!51370 () Bool)

(assert (=> b!61700 (=> res!51370 e!41066)))

(assert (=> b!61700 (= res!51370 (= (size!1264 (buf!1645 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61701 () Bool)

(assert (=> b!61701 (= e!41066 (arrayBitRangesEq!0 (buf!1645 thiss!1379) (buf!1645 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379))))))

(assert (= (and d!19032 res!51369) b!61699))

(assert (= (and b!61699 res!51371) b!61700))

(assert (= (and b!61700 (not res!51370)) b!61701))

(assert (=> b!61699 m!96711))

(assert (=> b!61699 m!96711))

(assert (=> b!61701 m!96711))

(assert (=> b!61701 m!96711))

(declare-fun m!97541 () Bool)

(assert (=> b!61701 m!97541))

(assert (=> b!61293 d!19032))

(declare-fun d!19034 () Bool)

(assert (=> d!19034 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!96718 () Unit!4175)

(declare-fun choose!11 (BitStream!2210) Unit!4175)

(assert (=> d!19034 (= lt!96718 (choose!11 thiss!1379))))

(assert (=> d!19034 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!96718)))

(declare-fun bs!4744 () Bool)

(assert (= bs!4744 d!19034))

(assert (=> bs!4744 m!96707))

(declare-fun m!97543 () Bool)

(assert (=> bs!4744 m!97543))

(assert (=> b!61293 d!19034))

(declare-fun d!19036 () Bool)

(declare-fun e!41068 () Bool)

(assert (=> d!19036 e!41068))

(declare-fun res!51372 () Bool)

(assert (=> d!19036 (=> (not res!51372) (not e!41068))))

(declare-fun lt!96721 () (_ BitVec 64))

(declare-fun lt!96719 () (_ BitVec 64))

(declare-fun lt!96722 () (_ BitVec 64))

(assert (=> d!19036 (= res!51372 (= lt!96722 (bvsub lt!96719 lt!96721)))))

(assert (=> d!19036 (or (= (bvand lt!96719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96719 lt!96721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19036 (= lt!96721 (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 thiss!1379))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379))))))

(declare-fun lt!96720 () (_ BitVec 64))

(declare-fun lt!96724 () (_ BitVec 64))

(assert (=> d!19036 (= lt!96719 (bvmul lt!96720 lt!96724))))

(assert (=> d!19036 (or (= lt!96720 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96724 (bvsdiv (bvmul lt!96720 lt!96724) lt!96720)))))

(assert (=> d!19036 (= lt!96724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19036 (= lt!96720 ((_ sign_extend 32) (size!1264 (buf!1645 thiss!1379))))))

(assert (=> d!19036 (= lt!96722 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3269 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3264 thiss!1379))))))

(assert (=> d!19036 (invariant!0 (currentBit!3264 thiss!1379) (currentByte!3269 thiss!1379) (size!1264 (buf!1645 thiss!1379)))))

(assert (=> d!19036 (= (bitIndex!0 (size!1264 (buf!1645 thiss!1379)) (currentByte!3269 thiss!1379) (currentBit!3264 thiss!1379)) lt!96722)))

(declare-fun b!61702 () Bool)

(declare-fun res!51373 () Bool)

(assert (=> b!61702 (=> (not res!51373) (not e!41068))))

(assert (=> b!61702 (= res!51373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96722))))

(declare-fun b!61703 () Bool)

(declare-fun lt!96723 () (_ BitVec 64))

(assert (=> b!61703 (= e!41068 (bvsle lt!96722 (bvmul lt!96723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61703 (or (= lt!96723 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96723 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96723)))))

(assert (=> b!61703 (= lt!96723 ((_ sign_extend 32) (size!1264 (buf!1645 thiss!1379))))))

(assert (= (and d!19036 res!51372) b!61702))

(assert (= (and b!61702 res!51373) b!61703))

(declare-fun m!97545 () Bool)

(assert (=> d!19036 m!97545))

(assert (=> d!19036 m!96959))

(assert (=> b!61293 d!19036))

(declare-fun d!19038 () Bool)

(declare-fun e!41069 () Bool)

(assert (=> d!19038 e!41069))

(declare-fun res!51374 () Bool)

(assert (=> d!19038 (=> (not res!51374) (not e!41069))))

(declare-fun lt!96727 () (_ BitVec 64))

(declare-fun lt!96725 () (_ BitVec 64))

(declare-fun lt!96728 () (_ BitVec 64))

(assert (=> d!19038 (= res!51374 (= lt!96728 (bvsub lt!96725 lt!96727)))))

(assert (=> d!19038 (or (= (bvand lt!96725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96727 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96725 lt!96727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19038 (= lt!96727 (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))) ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95749))) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95749)))))))

(declare-fun lt!96726 () (_ BitVec 64))

(declare-fun lt!96730 () (_ BitVec 64))

(assert (=> d!19038 (= lt!96725 (bvmul lt!96726 lt!96730))))

(assert (=> d!19038 (or (= lt!96726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96730 (bvsdiv (bvmul lt!96726 lt!96730) lt!96726)))))

(assert (=> d!19038 (= lt!96730 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19038 (= lt!96726 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))))))

(assert (=> d!19038 (= lt!96728 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3269 (_2!2895 lt!95749))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3264 (_2!2895 lt!95749)))))))

(assert (=> d!19038 (invariant!0 (currentBit!3264 (_2!2895 lt!95749)) (currentByte!3269 (_2!2895 lt!95749)) (size!1264 (buf!1645 (_2!2895 lt!95749))))))

(assert (=> d!19038 (= (bitIndex!0 (size!1264 (buf!1645 (_2!2895 lt!95749))) (currentByte!3269 (_2!2895 lt!95749)) (currentBit!3264 (_2!2895 lt!95749))) lt!96728)))

(declare-fun b!61704 () Bool)

(declare-fun res!51375 () Bool)

(assert (=> b!61704 (=> (not res!51375) (not e!41069))))

(assert (=> b!61704 (= res!51375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96728))))

(declare-fun b!61705 () Bool)

(declare-fun lt!96729 () (_ BitVec 64))

(assert (=> b!61705 (= e!41069 (bvsle lt!96728 (bvmul lt!96729 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61705 (or (= lt!96729 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96729 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96729)))))

(assert (=> b!61705 (= lt!96729 ((_ sign_extend 32) (size!1264 (buf!1645 (_2!2895 lt!95749)))))))

(assert (= (and d!19038 res!51374) b!61704))

(assert (= (and b!61704 res!51375) b!61705))

(declare-fun m!97547 () Bool)

(assert (=> d!19038 m!97547))

(assert (=> d!19038 m!96761))

(assert (=> b!61284 d!19038))

(declare-fun d!19040 () Bool)

(assert (=> d!19040 (= (invariant!0 (currentBit!3264 (_2!2895 lt!95749)) (currentByte!3269 (_2!2895 lt!95749)) (size!1264 (buf!1645 (_2!2895 lt!95749)))) (and (bvsge (currentBit!3264 (_2!2895 lt!95749)) #b00000000000000000000000000000000) (bvslt (currentBit!3264 (_2!2895 lt!95749)) #b00000000000000000000000000001000) (bvsge (currentByte!3269 (_2!2895 lt!95749)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3269 (_2!2895 lt!95749)) (size!1264 (buf!1645 (_2!2895 lt!95749)))) (and (= (currentBit!3264 (_2!2895 lt!95749)) #b00000000000000000000000000000000) (= (currentByte!3269 (_2!2895 lt!95749)) (size!1264 (buf!1645 (_2!2895 lt!95749))))))))))

(assert (=> b!61286 d!19040))

(declare-fun d!19042 () Bool)

(assert (=> d!19042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1264 (buf!1645 thiss!1379))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1264 (buf!1645 thiss!1379))) ((_ sign_extend 32) (currentByte!3269 thiss!1379)) ((_ sign_extend 32) (currentBit!3264 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4745 () Bool)

(assert (= bs!4745 d!19042))

(assert (=> bs!4745 m!97545))

(assert (=> b!61285 d!19042))

(push 1)

