; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10682 () Bool)

(assert start!10682)

(declare-fun b!53397 () Bool)

(declare-fun e!35590 () Bool)

(declare-fun e!35587 () Bool)

(assert (=> b!53397 (= e!35590 e!35587)))

(declare-fun res!44615 () Bool)

(assert (=> b!53397 (=> res!44615 e!35587)))

(declare-datatypes ((array!2523 0))(
  ( (array!2524 (arr!1686 (Array (_ BitVec 32) (_ BitVec 8))) (size!1150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1992 0))(
  ( (BitStream!1993 (buf!1500 array!2523) (currentByte!3067 (_ BitVec 32)) (currentBit!3062 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1992)

(declare-datatypes ((Unit!3710 0))(
  ( (Unit!3711) )
))
(declare-datatypes ((tuple2!4870 0))(
  ( (tuple2!4871 (_1!2540 Unit!3710) (_2!2540 BitStream!1992)) )
))
(declare-fun lt!82793 () tuple2!4870)

(declare-fun isPrefixOf!0 (BitStream!1992 BitStream!1992) Bool)

(assert (=> b!53397 (= res!44615 (not (isPrefixOf!0 thiss!1379 (_2!2540 lt!82793))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53397 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82792 () Unit!3710)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1992 BitStream!1992 (_ BitVec 64) (_ BitVec 64)) Unit!3710)

(assert (=> b!53397 (= lt!82792 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2540 lt!82793) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2523)

(declare-fun appendBitFromByte!0 (BitStream!1992 (_ BitVec 8) (_ BitVec 32)) tuple2!4870)

(assert (=> b!53397 (= lt!82793 (appendBitFromByte!0 thiss!1379 (select (arr!1686 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53398 () Bool)

(declare-datatypes ((tuple2!4872 0))(
  ( (tuple2!4873 (_1!2541 BitStream!1992) (_2!2541 BitStream!1992)) )
))
(declare-fun lt!82794 () tuple2!4872)

(declare-datatypes ((List!571 0))(
  ( (Nil!568) (Cons!567 (h!686 Bool) (t!1321 List!571)) )
))
(declare-fun head!390 (List!571) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1992 array!2523 (_ BitVec 64) (_ BitVec 64)) List!571)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1992 BitStream!1992 (_ BitVec 64)) List!571)

(assert (=> b!53398 (= e!35587 (= (head!390 (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!390 (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_1!2541 lt!82794) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!53398 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!82791 () Unit!3710)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1992 array!2523 (_ BitVec 64)) Unit!3710)

(assert (=> b!53398 (= lt!82791 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1992 BitStream!1992) tuple2!4872)

(assert (=> b!53398 (= lt!82794 (reader!0 thiss!1379 (_2!2540 lt!82793)))))

(declare-fun b!53399 () Bool)

(declare-fun res!44616 () Bool)

(declare-fun e!35586 () Bool)

(assert (=> b!53399 (=> (not res!44616) (not e!35586))))

(assert (=> b!53399 (= res!44616 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!44614 () Bool)

(assert (=> start!10682 (=> (not res!44614) (not e!35586))))

(assert (=> start!10682 (= res!44614 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1150 srcBuffer!2))))))))

(assert (=> start!10682 e!35586))

(assert (=> start!10682 true))

(declare-fun array_inv!1055 (array!2523) Bool)

(assert (=> start!10682 (array_inv!1055 srcBuffer!2)))

(declare-fun e!35589 () Bool)

(declare-fun inv!12 (BitStream!1992) Bool)

(assert (=> start!10682 (and (inv!12 thiss!1379) e!35589)))

(declare-fun b!53400 () Bool)

(assert (=> b!53400 (= e!35589 (array_inv!1055 (buf!1500 thiss!1379)))))

(declare-fun b!53401 () Bool)

(assert (=> b!53401 (= e!35586 (not e!35590))))

(declare-fun res!44613 () Bool)

(assert (=> b!53401 (=> res!44613 e!35590)))

(assert (=> b!53401 (= res!44613 (bvsge i!635 to!314))))

(assert (=> b!53401 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82795 () Unit!3710)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1992) Unit!3710)

(assert (=> b!53401 (= lt!82795 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82790 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53401 (= lt!82790 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(assert (= (and start!10682 res!44614) b!53399))

(assert (= (and b!53399 res!44616) b!53401))

(assert (= (and b!53401 (not res!44613)) b!53397))

(assert (= (and b!53397 (not res!44615)) b!53398))

(assert (= start!10682 b!53400))

(declare-fun m!83979 () Bool)

(assert (=> b!53400 m!83979))

(declare-fun m!83981 () Bool)

(assert (=> start!10682 m!83981))

(declare-fun m!83983 () Bool)

(assert (=> start!10682 m!83983))

(declare-fun m!83985 () Bool)

(assert (=> b!53397 m!83985))

(declare-fun m!83987 () Bool)

(assert (=> b!53397 m!83987))

(declare-fun m!83989 () Bool)

(assert (=> b!53397 m!83989))

(declare-fun m!83991 () Bool)

(assert (=> b!53397 m!83991))

(assert (=> b!53397 m!83985))

(declare-fun m!83993 () Bool)

(assert (=> b!53397 m!83993))

(declare-fun m!83995 () Bool)

(assert (=> b!53398 m!83995))

(declare-fun m!83997 () Bool)

(assert (=> b!53398 m!83997))

(declare-fun m!83999 () Bool)

(assert (=> b!53398 m!83999))

(declare-fun m!84001 () Bool)

(assert (=> b!53398 m!84001))

(declare-fun m!84003 () Bool)

(assert (=> b!53398 m!84003))

(assert (=> b!53398 m!83997))

(declare-fun m!84005 () Bool)

(assert (=> b!53398 m!84005))

(assert (=> b!53398 m!83999))

(declare-fun m!84007 () Bool)

(assert (=> b!53398 m!84007))

(declare-fun m!84009 () Bool)

(assert (=> b!53399 m!84009))

(declare-fun m!84011 () Bool)

(assert (=> b!53401 m!84011))

(declare-fun m!84013 () Bool)

(assert (=> b!53401 m!84013))

(declare-fun m!84015 () Bool)

(assert (=> b!53401 m!84015))

(check-sat (not start!10682) (not b!53401) (not b!53397) (not b!53399) (not b!53400) (not b!53398))
(check-sat)
(get-model)

(declare-fun d!16902 () Bool)

(assert (=> d!16902 (= (array_inv!1055 (buf!1500 thiss!1379)) (bvsge (size!1150 (buf!1500 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!53400 d!16902))

(declare-fun d!16904 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16904 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4290 () Bool)

(assert (= bs!4290 d!16904))

(declare-fun m!84055 () Bool)

(assert (=> bs!4290 m!84055))

(assert (=> b!53399 d!16904))

(declare-fun d!16906 () Bool)

(declare-fun res!44636 () Bool)

(declare-fun e!35614 () Bool)

(assert (=> d!16906 (=> (not res!44636) (not e!35614))))

(assert (=> d!16906 (= res!44636 (= (size!1150 (buf!1500 thiss!1379)) (size!1150 (buf!1500 thiss!1379))))))

(assert (=> d!16906 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35614)))

(declare-fun b!53423 () Bool)

(declare-fun res!44635 () Bool)

(assert (=> b!53423 (=> (not res!44635) (not e!35614))))

(assert (=> b!53423 (= res!44635 (bvsle (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(declare-fun b!53424 () Bool)

(declare-fun e!35615 () Bool)

(assert (=> b!53424 (= e!35614 e!35615)))

(declare-fun res!44637 () Bool)

(assert (=> b!53424 (=> res!44637 e!35615)))

(assert (=> b!53424 (= res!44637 (= (size!1150 (buf!1500 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53425 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2523 array!2523 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53425 (= e!35615 (arrayBitRangesEq!0 (buf!1500 thiss!1379) (buf!1500 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(assert (= (and d!16906 res!44636) b!53423))

(assert (= (and b!53423 res!44635) b!53424))

(assert (= (and b!53424 (not res!44637)) b!53425))

(assert (=> b!53423 m!84015))

(assert (=> b!53423 m!84015))

(assert (=> b!53425 m!84015))

(assert (=> b!53425 m!84015))

(declare-fun m!84057 () Bool)

(assert (=> b!53425 m!84057))

(assert (=> b!53401 d!16906))

(declare-fun d!16908 () Bool)

(assert (=> d!16908 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82816 () Unit!3710)

(declare-fun choose!11 (BitStream!1992) Unit!3710)

(assert (=> d!16908 (= lt!82816 (choose!11 thiss!1379))))

(assert (=> d!16908 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82816)))

(declare-fun bs!4292 () Bool)

(assert (= bs!4292 d!16908))

(assert (=> bs!4292 m!84011))

(declare-fun m!84059 () Bool)

(assert (=> bs!4292 m!84059))

(assert (=> b!53401 d!16908))

(declare-fun d!16912 () Bool)

(declare-fun e!35618 () Bool)

(assert (=> d!16912 e!35618))

(declare-fun res!44643 () Bool)

(assert (=> d!16912 (=> (not res!44643) (not e!35618))))

(declare-fun lt!82835 () (_ BitVec 64))

(declare-fun lt!82834 () (_ BitVec 64))

(declare-fun lt!82836 () (_ BitVec 64))

(assert (=> d!16912 (= res!44643 (= lt!82836 (bvsub lt!82834 lt!82835)))))

(assert (=> d!16912 (or (= (bvand lt!82834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82834 lt!82835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16912 (= lt!82835 (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379))))))

(declare-fun lt!82833 () (_ BitVec 64))

(declare-fun lt!82837 () (_ BitVec 64))

(assert (=> d!16912 (= lt!82834 (bvmul lt!82833 lt!82837))))

(assert (=> d!16912 (or (= lt!82833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!82837 (bvsdiv (bvmul lt!82833 lt!82837) lt!82833)))))

(assert (=> d!16912 (= lt!82837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16912 (= lt!82833 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))))))

(assert (=> d!16912 (= lt!82836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16912 (invariant!0 (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379) (size!1150 (buf!1500 thiss!1379)))))

(assert (=> d!16912 (= (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) lt!82836)))

(declare-fun b!53430 () Bool)

(declare-fun res!44642 () Bool)

(assert (=> b!53430 (=> (not res!44642) (not e!35618))))

(assert (=> b!53430 (= res!44642 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82836))))

(declare-fun b!53431 () Bool)

(declare-fun lt!82832 () (_ BitVec 64))

(assert (=> b!53431 (= e!35618 (bvsle lt!82836 (bvmul lt!82832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53431 (or (= lt!82832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!82832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!82832)))))

(assert (=> b!53431 (= lt!82832 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))))))

(assert (= (and d!16912 res!44643) b!53430))

(assert (= (and b!53430 res!44642) b!53431))

(assert (=> d!16912 m!84055))

(declare-fun m!84065 () Bool)

(assert (=> d!16912 m!84065))

(assert (=> b!53401 d!16912))

(declare-fun d!16918 () Bool)

(declare-fun res!44645 () Bool)

(declare-fun e!35619 () Bool)

(assert (=> d!16918 (=> (not res!44645) (not e!35619))))

(assert (=> d!16918 (= res!44645 (= (size!1150 (buf!1500 thiss!1379)) (size!1150 (buf!1500 (_2!2540 lt!82793)))))))

(assert (=> d!16918 (= (isPrefixOf!0 thiss!1379 (_2!2540 lt!82793)) e!35619)))

(declare-fun b!53432 () Bool)

(declare-fun res!44644 () Bool)

(assert (=> b!53432 (=> (not res!44644) (not e!35619))))

(assert (=> b!53432 (= res!44644 (bvsle (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793)))))))

(declare-fun b!53433 () Bool)

(declare-fun e!35620 () Bool)

(assert (=> b!53433 (= e!35619 e!35620)))

(declare-fun res!44646 () Bool)

(assert (=> b!53433 (=> res!44646 e!35620)))

(assert (=> b!53433 (= res!44646 (= (size!1150 (buf!1500 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53434 () Bool)

(assert (=> b!53434 (= e!35620 (arrayBitRangesEq!0 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(assert (= (and d!16918 res!44645) b!53432))

(assert (= (and b!53432 res!44644) b!53433))

(assert (= (and b!53433 (not res!44646)) b!53434))

(assert (=> b!53432 m!84015))

(declare-fun m!84067 () Bool)

(assert (=> b!53432 m!84067))

(assert (=> b!53434 m!84015))

(assert (=> b!53434 m!84015))

(declare-fun m!84069 () Bool)

(assert (=> b!53434 m!84069))

(assert (=> b!53397 d!16918))

(declare-fun d!16920 () Bool)

(assert (=> d!16920 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4295 () Bool)

(assert (= bs!4295 d!16920))

(declare-fun m!84071 () Bool)

(assert (=> bs!4295 m!84071))

(assert (=> b!53397 d!16920))

(declare-fun d!16922 () Bool)

(declare-fun e!35629 () Bool)

(assert (=> d!16922 e!35629))

(declare-fun res!44649 () Bool)

(assert (=> d!16922 (=> (not res!44649) (not e!35629))))

(assert (=> d!16922 (= res!44649 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!82849 () Unit!3710)

(declare-fun choose!27 (BitStream!1992 BitStream!1992 (_ BitVec 64) (_ BitVec 64)) Unit!3710)

(assert (=> d!16922 (= lt!82849 (choose!27 thiss!1379 (_2!2540 lt!82793) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16922 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16922 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2540 lt!82793) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82849)))

(declare-fun b!53449 () Bool)

(assert (=> b!53449 (= e!35629 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16922 res!44649) b!53449))

(declare-fun m!84081 () Bool)

(assert (=> d!16922 m!84081))

(assert (=> b!53449 m!83987))

(assert (=> b!53397 d!16922))

(declare-fun b!53560 () Bool)

(declare-fun e!35688 () Bool)

(declare-datatypes ((tuple2!4882 0))(
  ( (tuple2!4883 (_1!2546 BitStream!1992) (_2!2546 Bool)) )
))
(declare-fun lt!83062 () tuple2!4882)

(declare-fun lt!83057 () tuple2!4870)

(assert (=> b!53560 (= e!35688 (= (bitIndex!0 (size!1150 (buf!1500 (_1!2546 lt!83062))) (currentByte!3067 (_1!2546 lt!83062)) (currentBit!3062 (_1!2546 lt!83062))) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83057))) (currentByte!3067 (_2!2540 lt!83057)) (currentBit!3062 (_2!2540 lt!83057)))))))

(declare-fun b!53561 () Bool)

(declare-fun e!35687 () Bool)

(assert (=> b!53561 (= e!35687 e!35688)))

(declare-fun res!44724 () Bool)

(assert (=> b!53561 (=> (not res!44724) (not e!35688))))

(declare-fun lt!83051 () Bool)

(assert (=> b!53561 (= res!44724 (and (= (_2!2546 lt!83062) lt!83051) (= (_1!2546 lt!83062) (_2!2540 lt!83057))))))

(declare-fun readBitPure!0 (BitStream!1992) tuple2!4882)

(declare-fun readerFrom!0 (BitStream!1992 (_ BitVec 32) (_ BitVec 32)) BitStream!1992)

(assert (=> b!53561 (= lt!83062 (readBitPure!0 (readerFrom!0 (_2!2540 lt!83057) (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379))))))

(declare-fun b!53562 () Bool)

(declare-fun res!44725 () Bool)

(declare-fun e!35690 () Bool)

(assert (=> b!53562 (=> (not res!44725) (not e!35690))))

(declare-fun lt!83052 () tuple2!4870)

(assert (=> b!53562 (= res!44725 (isPrefixOf!0 thiss!1379 (_2!2540 lt!83052)))))

(declare-fun b!53563 () Bool)

(declare-fun e!35689 () Bool)

(assert (=> b!53563 (= e!35690 e!35689)))

(declare-fun res!44729 () Bool)

(assert (=> b!53563 (=> (not res!44729) (not e!35689))))

(declare-fun lt!83056 () tuple2!4882)

(declare-fun lt!83055 () (_ BitVec 8))

(assert (=> b!53563 (= res!44729 (and (= (_2!2546 lt!83056) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1686 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!83055)) #b00000000000000000000000000000000))) (= (_1!2546 lt!83056) (_2!2540 lt!83052))))))

(declare-datatypes ((tuple2!4884 0))(
  ( (tuple2!4885 (_1!2547 array!2523) (_2!2547 BitStream!1992)) )
))
(declare-fun lt!83059 () tuple2!4884)

(declare-fun lt!83058 () BitStream!1992)

(declare-fun readBits!0 (BitStream!1992 (_ BitVec 64)) tuple2!4884)

(assert (=> b!53563 (= lt!83059 (readBits!0 lt!83058 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!53563 (= lt!83056 (readBitPure!0 lt!83058))))

(assert (=> b!53563 (= lt!83058 (readerFrom!0 (_2!2540 lt!83052) (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379)))))

(declare-fun d!16930 () Bool)

(assert (=> d!16930 e!35690))

(declare-fun res!44726 () Bool)

(assert (=> d!16930 (=> (not res!44726) (not e!35690))))

(assert (=> d!16930 (= res!44726 (= (size!1150 (buf!1500 (_2!2540 lt!83052))) (size!1150 (buf!1500 thiss!1379))))))

(declare-fun lt!83054 () array!2523)

(assert (=> d!16930 (= lt!83055 (select (arr!1686 lt!83054) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16930 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1150 lt!83054)))))

(assert (=> d!16930 (= lt!83054 (array!2524 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!83060 () tuple2!4870)

(assert (=> d!16930 (= lt!83052 (tuple2!4871 (_1!2540 lt!83060) (_2!2540 lt!83060)))))

(assert (=> d!16930 (= lt!83060 lt!83057)))

(assert (=> d!16930 e!35687))

(declare-fun res!44730 () Bool)

(assert (=> d!16930 (=> (not res!44730) (not e!35687))))

(assert (=> d!16930 (= res!44730 (= (size!1150 (buf!1500 thiss!1379)) (size!1150 (buf!1500 (_2!2540 lt!83057)))))))

(declare-fun appendBit!0 (BitStream!1992 Bool) tuple2!4870)

(assert (=> d!16930 (= lt!83057 (appendBit!0 thiss!1379 lt!83051))))

(assert (=> d!16930 (= lt!83051 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1686 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16930 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16930 (= (appendBitFromByte!0 thiss!1379 (select (arr!1686 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!83052)))

(declare-fun b!53564 () Bool)

(declare-fun res!44728 () Bool)

(assert (=> b!53564 (=> (not res!44728) (not e!35687))))

(assert (=> b!53564 (= res!44728 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83057))) (currentByte!3067 (_2!2540 lt!83057)) (currentBit!3062 (_2!2540 lt!83057))) (bvadd (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53565 () Bool)

(declare-fun res!44727 () Bool)

(assert (=> b!53565 (=> (not res!44727) (not e!35690))))

(declare-fun lt!83053 () (_ BitVec 64))

(declare-fun lt!83061 () (_ BitVec 64))

(assert (=> b!53565 (= res!44727 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83052))) (currentByte!3067 (_2!2540 lt!83052)) (currentBit!3062 (_2!2540 lt!83052))) (bvadd lt!83053 lt!83061)))))

(assert (=> b!53565 (or (not (= (bvand lt!83053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83061 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83053 lt!83061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53565 (= lt!83061 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53565 (= lt!83053 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(declare-fun b!53566 () Bool)

(assert (=> b!53566 (= e!35689 (= (bitIndex!0 (size!1150 (buf!1500 (_1!2546 lt!83056))) (currentByte!3067 (_1!2546 lt!83056)) (currentBit!3062 (_1!2546 lt!83056))) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83052))) (currentByte!3067 (_2!2540 lt!83052)) (currentBit!3062 (_2!2540 lt!83052)))))))

(declare-fun b!53567 () Bool)

(declare-fun res!44723 () Bool)

(assert (=> b!53567 (=> (not res!44723) (not e!35687))))

(assert (=> b!53567 (= res!44723 (isPrefixOf!0 thiss!1379 (_2!2540 lt!83057)))))

(assert (= (and d!16930 res!44730) b!53564))

(assert (= (and b!53564 res!44728) b!53567))

(assert (= (and b!53567 res!44723) b!53561))

(assert (= (and b!53561 res!44724) b!53560))

(assert (= (and d!16930 res!44726) b!53565))

(assert (= (and b!53565 res!44727) b!53562))

(assert (= (and b!53562 res!44725) b!53563))

(assert (= (and b!53563 res!44729) b!53566))

(declare-fun m!84185 () Bool)

(assert (=> b!53561 m!84185))

(assert (=> b!53561 m!84185))

(declare-fun m!84187 () Bool)

(assert (=> b!53561 m!84187))

(declare-fun m!84189 () Bool)

(assert (=> b!53560 m!84189))

(declare-fun m!84191 () Bool)

(assert (=> b!53560 m!84191))

(declare-fun m!84193 () Bool)

(assert (=> b!53567 m!84193))

(declare-fun m!84195 () Bool)

(assert (=> b!53565 m!84195))

(assert (=> b!53565 m!84015))

(declare-fun m!84197 () Bool)

(assert (=> b!53563 m!84197))

(declare-fun m!84199 () Bool)

(assert (=> b!53563 m!84199))

(declare-fun m!84201 () Bool)

(assert (=> b!53563 m!84201))

(declare-fun m!84203 () Bool)

(assert (=> b!53566 m!84203))

(assert (=> b!53566 m!84195))

(declare-fun m!84205 () Bool)

(assert (=> d!16930 m!84205))

(declare-fun m!84207 () Bool)

(assert (=> d!16930 m!84207))

(declare-fun m!84209 () Bool)

(assert (=> d!16930 m!84209))

(assert (=> b!53564 m!84191))

(assert (=> b!53564 m!84015))

(declare-fun m!84211 () Bool)

(assert (=> b!53562 m!84211))

(assert (=> b!53397 d!16930))

(declare-fun d!16986 () Bool)

(assert (=> d!16986 (= (array_inv!1055 srcBuffer!2) (bvsge (size!1150 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10682 d!16986))

(declare-fun d!16988 () Bool)

(assert (=> d!16988 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379) (size!1150 (buf!1500 thiss!1379))))))

(declare-fun bs!4307 () Bool)

(assert (= bs!4307 d!16988))

(assert (=> bs!4307 m!84065))

(assert (=> start!10682 d!16988))

(declare-fun d!16992 () Bool)

(declare-fun c!3789 () Bool)

(assert (=> d!16992 (= c!3789 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!35696 () List!571)

(assert (=> d!16992 (= (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!35696)))

(declare-fun b!53575 () Bool)

(assert (=> b!53575 (= e!35696 Nil!568)))

(declare-fun b!53576 () Bool)

(assert (=> b!53576 (= e!35696 (Cons!567 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16992 c!3789) b!53575))

(assert (= (and d!16992 (not c!3789)) b!53576))

(assert (=> b!53576 m!83985))

(assert (=> b!53576 m!84209))

(declare-fun m!84215 () Bool)

(assert (=> b!53576 m!84215))

(assert (=> b!53398 d!16992))

(declare-fun b!53587 () Bool)

(declare-fun e!35702 () Bool)

(declare-fun lt!83072 () List!571)

(declare-fun isEmpty!152 (List!571) Bool)

(assert (=> b!53587 (= e!35702 (isEmpty!152 lt!83072))))

(declare-fun b!53588 () Bool)

(declare-fun length!266 (List!571) Int)

(assert (=> b!53588 (= e!35702 (> (length!266 lt!83072) 0))))

(declare-fun b!53585 () Bool)

(declare-datatypes ((tuple2!4886 0))(
  ( (tuple2!4887 (_1!2548 List!571) (_2!2548 BitStream!1992)) )
))
(declare-fun e!35701 () tuple2!4886)

(assert (=> b!53585 (= e!35701 (tuple2!4887 Nil!568 (_1!2541 lt!82794)))))

(declare-fun d!16994 () Bool)

(assert (=> d!16994 e!35702))

(declare-fun c!3794 () Bool)

(assert (=> d!16994 (= c!3794 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16994 (= lt!83072 (_1!2548 e!35701))))

(declare-fun c!3795 () Bool)

(assert (=> d!16994 (= c!3795 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16994 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16994 (= (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_1!2541 lt!82794) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83072)))

(declare-fun b!53586 () Bool)

(declare-datatypes ((tuple2!4888 0))(
  ( (tuple2!4889 (_1!2549 Bool) (_2!2549 BitStream!1992)) )
))
(declare-fun lt!83074 () tuple2!4888)

(declare-fun lt!83073 () (_ BitVec 64))

(assert (=> b!53586 (= e!35701 (tuple2!4887 (Cons!567 (_1!2549 lt!83074) (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_2!2549 lt!83074) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83073))) (_2!2549 lt!83074)))))

(declare-fun readBit!0 (BitStream!1992) tuple2!4888)

(assert (=> b!53586 (= lt!83074 (readBit!0 (_1!2541 lt!82794)))))

(assert (=> b!53586 (= lt!83073 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16994 c!3795) b!53585))

(assert (= (and d!16994 (not c!3795)) b!53586))

(assert (= (and d!16994 c!3794) b!53587))

(assert (= (and d!16994 (not c!3794)) b!53588))

(declare-fun m!84217 () Bool)

(assert (=> b!53587 m!84217))

(declare-fun m!84219 () Bool)

(assert (=> b!53588 m!84219))

(declare-fun m!84221 () Bool)

(assert (=> b!53586 m!84221))

(declare-fun m!84223 () Bool)

(assert (=> b!53586 m!84223))

(assert (=> b!53398 d!16994))

(declare-fun d!16996 () Bool)

(assert (=> d!16996 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4308 () Bool)

(assert (= bs!4308 d!16996))

(declare-fun m!84225 () Bool)

(assert (=> bs!4308 m!84225))

(assert (=> b!53398 d!16996))

(declare-fun d!16998 () Bool)

(assert (=> d!16998 (= (head!390 (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!686 (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!53398 d!16998))

(declare-fun d!17000 () Bool)

(assert (=> d!17000 (= (head!390 (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_1!2541 lt!82794) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!686 (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_1!2541 lt!82794) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!53398 d!17000))

(declare-fun lt!83130 () (_ BitVec 64))

(declare-fun e!35708 () Bool)

(declare-fun lt!83126 () (_ BitVec 64))

(declare-fun b!53599 () Bool)

(declare-fun lt!83117 () tuple2!4872)

(declare-fun withMovedBitIndex!0 (BitStream!1992 (_ BitVec 64)) BitStream!1992)

(assert (=> b!53599 (= e!35708 (= (_1!2541 lt!83117) (withMovedBitIndex!0 (_2!2541 lt!83117) (bvsub lt!83130 lt!83126))))))

(assert (=> b!53599 (or (= (bvand lt!83130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83130 lt!83126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53599 (= lt!83126 (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793))))))

(assert (=> b!53599 (= lt!83130 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(declare-fun b!53600 () Bool)

(declare-fun res!44742 () Bool)

(assert (=> b!53600 (=> (not res!44742) (not e!35708))))

(assert (=> b!53600 (= res!44742 (isPrefixOf!0 (_1!2541 lt!83117) thiss!1379))))

(declare-fun b!53601 () Bool)

(declare-fun e!35707 () Unit!3710)

(declare-fun Unit!3715 () Unit!3710)

(assert (=> b!53601 (= e!35707 Unit!3715)))

(declare-fun d!17002 () Bool)

(assert (=> d!17002 e!35708))

(declare-fun res!44741 () Bool)

(assert (=> d!17002 (=> (not res!44741) (not e!35708))))

(assert (=> d!17002 (= res!44741 (isPrefixOf!0 (_1!2541 lt!83117) (_2!2541 lt!83117)))))

(declare-fun lt!83132 () BitStream!1992)

(assert (=> d!17002 (= lt!83117 (tuple2!4873 lt!83132 (_2!2540 lt!82793)))))

(declare-fun lt!83124 () Unit!3710)

(declare-fun lt!83116 () Unit!3710)

(assert (=> d!17002 (= lt!83124 lt!83116)))

(assert (=> d!17002 (isPrefixOf!0 lt!83132 (_2!2540 lt!82793))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1992 BitStream!1992 BitStream!1992) Unit!3710)

(assert (=> d!17002 (= lt!83116 (lemmaIsPrefixTransitive!0 lt!83132 (_2!2540 lt!82793) (_2!2540 lt!82793)))))

(declare-fun lt!83122 () Unit!3710)

(declare-fun lt!83134 () Unit!3710)

(assert (=> d!17002 (= lt!83122 lt!83134)))

(assert (=> d!17002 (isPrefixOf!0 lt!83132 (_2!2540 lt!82793))))

(assert (=> d!17002 (= lt!83134 (lemmaIsPrefixTransitive!0 lt!83132 thiss!1379 (_2!2540 lt!82793)))))

(declare-fun lt!83128 () Unit!3710)

(assert (=> d!17002 (= lt!83128 e!35707)))

(declare-fun c!3798 () Bool)

(assert (=> d!17002 (= c!3798 (not (= (size!1150 (buf!1500 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!83129 () Unit!3710)

(declare-fun lt!83123 () Unit!3710)

(assert (=> d!17002 (= lt!83129 lt!83123)))

(assert (=> d!17002 (isPrefixOf!0 (_2!2540 lt!82793) (_2!2540 lt!82793))))

(assert (=> d!17002 (= lt!83123 (lemmaIsPrefixRefl!0 (_2!2540 lt!82793)))))

(declare-fun lt!83118 () Unit!3710)

(declare-fun lt!83119 () Unit!3710)

(assert (=> d!17002 (= lt!83118 lt!83119)))

(assert (=> d!17002 (= lt!83119 (lemmaIsPrefixRefl!0 (_2!2540 lt!82793)))))

(declare-fun lt!83133 () Unit!3710)

(declare-fun lt!83115 () Unit!3710)

(assert (=> d!17002 (= lt!83133 lt!83115)))

(assert (=> d!17002 (isPrefixOf!0 lt!83132 lt!83132)))

(assert (=> d!17002 (= lt!83115 (lemmaIsPrefixRefl!0 lt!83132))))

(declare-fun lt!83125 () Unit!3710)

(declare-fun lt!83127 () Unit!3710)

(assert (=> d!17002 (= lt!83125 lt!83127)))

(assert (=> d!17002 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17002 (= lt!83127 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17002 (= lt!83132 (BitStream!1993 (buf!1500 (_2!2540 lt!82793)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(assert (=> d!17002 (isPrefixOf!0 thiss!1379 (_2!2540 lt!82793))))

(assert (=> d!17002 (= (reader!0 thiss!1379 (_2!2540 lt!82793)) lt!83117)))

(declare-fun b!53602 () Bool)

(declare-fun lt!83121 () Unit!3710)

(assert (=> b!53602 (= e!35707 lt!83121)))

(declare-fun lt!83120 () (_ BitVec 64))

(assert (=> b!53602 (= lt!83120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!83131 () (_ BitVec 64))

(assert (=> b!53602 (= lt!83131 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2523 array!2523 (_ BitVec 64) (_ BitVec 64)) Unit!3710)

(assert (=> b!53602 (= lt!83121 (arrayBitRangesEqSymmetric!0 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!82793)) lt!83120 lt!83131))))

(assert (=> b!53602 (arrayBitRangesEq!0 (buf!1500 (_2!2540 lt!82793)) (buf!1500 thiss!1379) lt!83120 lt!83131)))

(declare-fun b!53603 () Bool)

(declare-fun res!44740 () Bool)

(assert (=> b!53603 (=> (not res!44740) (not e!35708))))

(assert (=> b!53603 (= res!44740 (isPrefixOf!0 (_2!2541 lt!83117) (_2!2540 lt!82793)))))

(assert (= (and d!17002 c!3798) b!53602))

(assert (= (and d!17002 (not c!3798)) b!53601))

(assert (= (and d!17002 res!44741) b!53600))

(assert (= (and b!53600 res!44742) b!53603))

(assert (= (and b!53603 res!44740) b!53599))

(assert (=> d!17002 m!84013))

(declare-fun m!84227 () Bool)

(assert (=> d!17002 m!84227))

(declare-fun m!84229 () Bool)

(assert (=> d!17002 m!84229))

(declare-fun m!84231 () Bool)

(assert (=> d!17002 m!84231))

(declare-fun m!84233 () Bool)

(assert (=> d!17002 m!84233))

(assert (=> d!17002 m!83989))

(declare-fun m!84235 () Bool)

(assert (=> d!17002 m!84235))

(declare-fun m!84237 () Bool)

(assert (=> d!17002 m!84237))

(assert (=> d!17002 m!84011))

(declare-fun m!84239 () Bool)

(assert (=> d!17002 m!84239))

(declare-fun m!84241 () Bool)

(assert (=> d!17002 m!84241))

(declare-fun m!84243 () Bool)

(assert (=> b!53600 m!84243))

(declare-fun m!84245 () Bool)

(assert (=> b!53603 m!84245))

(declare-fun m!84247 () Bool)

(assert (=> b!53599 m!84247))

(assert (=> b!53599 m!84067))

(assert (=> b!53599 m!84015))

(assert (=> b!53602 m!84015))

(declare-fun m!84249 () Bool)

(assert (=> b!53602 m!84249))

(declare-fun m!84251 () Bool)

(assert (=> b!53602 m!84251))

(assert (=> b!53398 d!17002))

(declare-fun d!17004 () Bool)

(assert (=> d!17004 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!83147 () Unit!3710)

(declare-fun choose!9 (BitStream!1992 array!2523 (_ BitVec 64) BitStream!1992) Unit!3710)

(assert (=> d!17004 (= lt!83147 (choose!9 thiss!1379 (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1993 (buf!1500 (_2!2540 lt!82793)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(assert (=> d!17004 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83147)))

(declare-fun bs!4309 () Bool)

(assert (= bs!4309 d!17004))

(assert (=> bs!4309 m!83995))

(declare-fun m!84253 () Bool)

(assert (=> bs!4309 m!84253))

(assert (=> b!53398 d!17004))

(check-sat (not b!53602) (not b!53565) (not b!53567) (not b!53434) (not b!53449) (not d!16920) (not b!53432) (not b!53425) (not b!53603) (not b!53576) (not d!16996) (not d!16930) (not d!17002) (not b!53599) (not d!16908) (not b!53587) (not d!16922) (not b!53423) (not b!53588) (not b!53600) (not d!17004) (not b!53561) (not b!53562) (not b!53563) (not d!16988) (not d!16904) (not d!16912) (not b!53566) (not b!53560) (not b!53564) (not b!53586))
(check-sat)
(get-model)

(declare-fun d!17152 () Bool)

(assert (=> d!17152 (= (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 thiss!1379)))))))

(assert (=> d!16996 d!17152))

(declare-fun d!17164 () Bool)

(declare-fun res!44996 () Bool)

(declare-fun e!35903 () Bool)

(assert (=> d!17164 (=> res!44996 e!35903)))

(assert (=> d!17164 (= res!44996 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(assert (=> d!17164 (= (arrayBitRangesEq!0 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))) e!35903)))

(declare-fun b!53894 () Bool)

(declare-fun e!35899 () Bool)

(declare-fun e!35901 () Bool)

(assert (=> b!53894 (= e!35899 e!35901)))

(declare-fun c!3817 () Bool)

(declare-datatypes ((tuple4!30 0))(
  ( (tuple4!31 (_1!2560 (_ BitVec 32)) (_2!2560 (_ BitVec 32)) (_3!109 (_ BitVec 32)) (_4!15 (_ BitVec 32))) )
))
(declare-fun lt!83472 () tuple4!30)

(assert (=> b!53894 (= c!3817 (= (_3!109 lt!83472) (_4!15 lt!83472)))))

(declare-fun b!53895 () Bool)

(declare-fun e!35900 () Bool)

(assert (=> b!53895 (= e!35901 e!35900)))

(declare-fun res!44997 () Bool)

(declare-fun lt!83470 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!53895 (= res!44997 (byteRangesEq!0 (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83472)) (select (arr!1686 (buf!1500 (_2!2540 lt!82793))) (_3!109 lt!83472)) lt!83470 #b00000000000000000000000000001000))))

(assert (=> b!53895 (=> (not res!44997) (not e!35900))))

(declare-fun b!53896 () Bool)

(declare-fun call!680 () Bool)

(assert (=> b!53896 (= e!35901 call!680)))

(declare-fun bm!677 () Bool)

(declare-fun lt!83471 () (_ BitVec 32))

(assert (=> bm!677 (= call!680 (byteRangesEq!0 (ite c!3817 (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83472)) (select (arr!1686 (buf!1500 thiss!1379)) (_4!15 lt!83472))) (ite c!3817 (select (arr!1686 (buf!1500 (_2!2540 lt!82793))) (_3!109 lt!83472)) (select (arr!1686 (buf!1500 (_2!2540 lt!82793))) (_4!15 lt!83472))) (ite c!3817 lt!83470 #b00000000000000000000000000000000) lt!83471))))

(declare-fun b!53897 () Bool)

(assert (=> b!53897 (= e!35903 e!35899)))

(declare-fun res!44999 () Bool)

(assert (=> b!53897 (=> (not res!44999) (not e!35899))))

(declare-fun e!35902 () Bool)

(assert (=> b!53897 (= res!44999 e!35902)))

(declare-fun res!44995 () Bool)

(assert (=> b!53897 (=> res!44995 e!35902)))

(assert (=> b!53897 (= res!44995 (bvsge (_1!2560 lt!83472) (_2!2560 lt!83472)))))

(assert (=> b!53897 (= lt!83471 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53897 (= lt!83470 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!30)

(assert (=> b!53897 (= lt!83472 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(declare-fun b!53898 () Bool)

(declare-fun e!35904 () Bool)

(assert (=> b!53898 (= e!35904 call!680)))

(declare-fun b!53899 () Bool)

(declare-fun res!44998 () Bool)

(assert (=> b!53899 (= res!44998 (= lt!83471 #b00000000000000000000000000000000))))

(assert (=> b!53899 (=> res!44998 e!35904)))

(assert (=> b!53899 (= e!35900 e!35904)))

(declare-fun b!53900 () Bool)

(declare-fun arrayRangesEq!16 (array!2523 array!2523 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!53900 (= e!35902 (arrayRangesEq!16 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!82793)) (_1!2560 lt!83472) (_2!2560 lt!83472)))))

(assert (= (and d!17164 (not res!44996)) b!53897))

(assert (= (and b!53897 (not res!44995)) b!53900))

(assert (= (and b!53897 res!44999) b!53894))

(assert (= (and b!53894 c!3817) b!53896))

(assert (= (and b!53894 (not c!3817)) b!53895))

(assert (= (and b!53895 res!44997) b!53899))

(assert (= (and b!53899 (not res!44998)) b!53898))

(assert (= (or b!53896 b!53898) bm!677))

(declare-fun m!84631 () Bool)

(assert (=> b!53895 m!84631))

(declare-fun m!84633 () Bool)

(assert (=> b!53895 m!84633))

(assert (=> b!53895 m!84631))

(assert (=> b!53895 m!84633))

(declare-fun m!84635 () Bool)

(assert (=> b!53895 m!84635))

(assert (=> bm!677 m!84633))

(assert (=> bm!677 m!84631))

(declare-fun m!84637 () Bool)

(assert (=> bm!677 m!84637))

(declare-fun m!84639 () Bool)

(assert (=> bm!677 m!84639))

(declare-fun m!84641 () Bool)

(assert (=> bm!677 m!84641))

(assert (=> b!53897 m!84015))

(declare-fun m!84643 () Bool)

(assert (=> b!53897 m!84643))

(declare-fun m!84645 () Bool)

(assert (=> b!53900 m!84645))

(assert (=> b!53434 d!17164))

(assert (=> b!53434 d!16912))

(declare-fun d!17174 () Bool)

(declare-fun e!35907 () Bool)

(assert (=> d!17174 e!35907))

(declare-fun res!45002 () Bool)

(assert (=> d!17174 (=> (not res!45002) (not e!35907))))

(declare-fun lt!83477 () BitStream!1992)

(declare-fun lt!83478 () (_ BitVec 64))

(assert (=> d!17174 (= res!45002 (= (bvadd lt!83478 (bvsub lt!83130 lt!83126)) (bitIndex!0 (size!1150 (buf!1500 lt!83477)) (currentByte!3067 lt!83477) (currentBit!3062 lt!83477))))))

(assert (=> d!17174 (or (not (= (bvand lt!83478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83130 lt!83126) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83478 (bvsub lt!83130 lt!83126)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17174 (= lt!83478 (bitIndex!0 (size!1150 (buf!1500 (_2!2541 lt!83117))) (currentByte!3067 (_2!2541 lt!83117)) (currentBit!3062 (_2!2541 lt!83117))))))

(declare-fun moveBitIndex!0 (BitStream!1992 (_ BitVec 64)) tuple2!4870)

(assert (=> d!17174 (= lt!83477 (_2!2540 (moveBitIndex!0 (_2!2541 lt!83117) (bvsub lt!83130 lt!83126))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1992 (_ BitVec 64)) Bool)

(assert (=> d!17174 (moveBitIndexPrecond!0 (_2!2541 lt!83117) (bvsub lt!83130 lt!83126))))

(assert (=> d!17174 (= (withMovedBitIndex!0 (_2!2541 lt!83117) (bvsub lt!83130 lt!83126)) lt!83477)))

(declare-fun b!53903 () Bool)

(assert (=> b!53903 (= e!35907 (= (size!1150 (buf!1500 (_2!2541 lt!83117))) (size!1150 (buf!1500 lt!83477))))))

(assert (= (and d!17174 res!45002) b!53903))

(declare-fun m!84647 () Bool)

(assert (=> d!17174 m!84647))

(declare-fun m!84649 () Bool)

(assert (=> d!17174 m!84649))

(declare-fun m!84651 () Bool)

(assert (=> d!17174 m!84651))

(declare-fun m!84653 () Bool)

(assert (=> d!17174 m!84653))

(assert (=> b!53599 d!17174))

(declare-fun d!17176 () Bool)

(declare-fun e!35908 () Bool)

(assert (=> d!17176 e!35908))

(declare-fun res!45004 () Bool)

(assert (=> d!17176 (=> (not res!45004) (not e!35908))))

(declare-fun lt!83482 () (_ BitVec 64))

(declare-fun lt!83483 () (_ BitVec 64))

(declare-fun lt!83481 () (_ BitVec 64))

(assert (=> d!17176 (= res!45004 (= lt!83483 (bvsub lt!83481 lt!83482)))))

(assert (=> d!17176 (or (= (bvand lt!83481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83482 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83481 lt!83482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17176 (= lt!83482 (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793)))))))

(declare-fun lt!83480 () (_ BitVec 64))

(declare-fun lt!83484 () (_ BitVec 64))

(assert (=> d!17176 (= lt!83481 (bvmul lt!83480 lt!83484))))

(assert (=> d!17176 (or (= lt!83480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83484 (bvsdiv (bvmul lt!83480 lt!83484) lt!83480)))))

(assert (=> d!17176 (= lt!83484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17176 (= lt!83480 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))))))

(assert (=> d!17176 (= lt!83483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793)))))))

(assert (=> d!17176 (invariant!0 (currentBit!3062 (_2!2540 lt!82793)) (currentByte!3067 (_2!2540 lt!82793)) (size!1150 (buf!1500 (_2!2540 lt!82793))))))

(assert (=> d!17176 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793))) lt!83483)))

(declare-fun b!53904 () Bool)

(declare-fun res!45003 () Bool)

(assert (=> b!53904 (=> (not res!45003) (not e!35908))))

(assert (=> b!53904 (= res!45003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83483))))

(declare-fun b!53905 () Bool)

(declare-fun lt!83479 () (_ BitVec 64))

(assert (=> b!53905 (= e!35908 (bvsle lt!83483 (bvmul lt!83479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53905 (or (= lt!83479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83479)))))

(assert (=> b!53905 (= lt!83479 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))))))

(assert (= (and d!17176 res!45004) b!53904))

(assert (= (and b!53904 res!45003) b!53905))

(assert (=> d!17176 m!84071))

(declare-fun m!84655 () Bool)

(assert (=> d!17176 m!84655))

(assert (=> b!53599 d!17176))

(assert (=> b!53599 d!16912))

(assert (=> b!53449 d!16920))

(declare-fun d!17178 () Bool)

(declare-fun e!35909 () Bool)

(assert (=> d!17178 e!35909))

(declare-fun res!45006 () Bool)

(assert (=> d!17178 (=> (not res!45006) (not e!35909))))

(declare-fun lt!83487 () (_ BitVec 64))

(declare-fun lt!83488 () (_ BitVec 64))

(declare-fun lt!83489 () (_ BitVec 64))

(assert (=> d!17178 (= res!45006 (= lt!83489 (bvsub lt!83487 lt!83488)))))

(assert (=> d!17178 (or (= (bvand lt!83487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83488 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83487 lt!83488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17178 (= lt!83488 (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_1!2546 lt!83056)))) ((_ sign_extend 32) (currentByte!3067 (_1!2546 lt!83056))) ((_ sign_extend 32) (currentBit!3062 (_1!2546 lt!83056)))))))

(declare-fun lt!83486 () (_ BitVec 64))

(declare-fun lt!83490 () (_ BitVec 64))

(assert (=> d!17178 (= lt!83487 (bvmul lt!83486 lt!83490))))

(assert (=> d!17178 (or (= lt!83486 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83490 (bvsdiv (bvmul lt!83486 lt!83490) lt!83486)))))

(assert (=> d!17178 (= lt!83490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17178 (= lt!83486 ((_ sign_extend 32) (size!1150 (buf!1500 (_1!2546 lt!83056)))))))

(assert (=> d!17178 (= lt!83489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 (_1!2546 lt!83056))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 (_1!2546 lt!83056)))))))

(assert (=> d!17178 (invariant!0 (currentBit!3062 (_1!2546 lt!83056)) (currentByte!3067 (_1!2546 lt!83056)) (size!1150 (buf!1500 (_1!2546 lt!83056))))))

(assert (=> d!17178 (= (bitIndex!0 (size!1150 (buf!1500 (_1!2546 lt!83056))) (currentByte!3067 (_1!2546 lt!83056)) (currentBit!3062 (_1!2546 lt!83056))) lt!83489)))

(declare-fun b!53906 () Bool)

(declare-fun res!45005 () Bool)

(assert (=> b!53906 (=> (not res!45005) (not e!35909))))

(assert (=> b!53906 (= res!45005 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83489))))

(declare-fun b!53907 () Bool)

(declare-fun lt!83485 () (_ BitVec 64))

(assert (=> b!53907 (= e!35909 (bvsle lt!83489 (bvmul lt!83485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53907 (or (= lt!83485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83485)))))

(assert (=> b!53907 (= lt!83485 ((_ sign_extend 32) (size!1150 (buf!1500 (_1!2546 lt!83056)))))))

(assert (= (and d!17178 res!45006) b!53906))

(assert (= (and b!53906 res!45005) b!53907))

(declare-fun m!84657 () Bool)

(assert (=> d!17178 m!84657))

(declare-fun m!84659 () Bool)

(assert (=> d!17178 m!84659))

(assert (=> b!53566 d!17178))

(declare-fun d!17180 () Bool)

(declare-fun e!35910 () Bool)

(assert (=> d!17180 e!35910))

(declare-fun res!45008 () Bool)

(assert (=> d!17180 (=> (not res!45008) (not e!35910))))

(declare-fun lt!83495 () (_ BitVec 64))

(declare-fun lt!83494 () (_ BitVec 64))

(declare-fun lt!83493 () (_ BitVec 64))

(assert (=> d!17180 (= res!45008 (= lt!83495 (bvsub lt!83493 lt!83494)))))

(assert (=> d!17180 (or (= (bvand lt!83493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83493 lt!83494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17180 (= lt!83494 (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!83052)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!83052))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!83052)))))))

(declare-fun lt!83492 () (_ BitVec 64))

(declare-fun lt!83496 () (_ BitVec 64))

(assert (=> d!17180 (= lt!83493 (bvmul lt!83492 lt!83496))))

(assert (=> d!17180 (or (= lt!83492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83496 (bvsdiv (bvmul lt!83492 lt!83496) lt!83492)))))

(assert (=> d!17180 (= lt!83496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17180 (= lt!83492 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!83052)))))))

(assert (=> d!17180 (= lt!83495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!83052))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!83052)))))))

(assert (=> d!17180 (invariant!0 (currentBit!3062 (_2!2540 lt!83052)) (currentByte!3067 (_2!2540 lt!83052)) (size!1150 (buf!1500 (_2!2540 lt!83052))))))

(assert (=> d!17180 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83052))) (currentByte!3067 (_2!2540 lt!83052)) (currentBit!3062 (_2!2540 lt!83052))) lt!83495)))

(declare-fun b!53908 () Bool)

(declare-fun res!45007 () Bool)

(assert (=> b!53908 (=> (not res!45007) (not e!35910))))

(assert (=> b!53908 (= res!45007 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83495))))

(declare-fun b!53909 () Bool)

(declare-fun lt!83491 () (_ BitVec 64))

(assert (=> b!53909 (= e!35910 (bvsle lt!83495 (bvmul lt!83491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53909 (or (= lt!83491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83491)))))

(assert (=> b!53909 (= lt!83491 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!83052)))))))

(assert (= (and d!17180 res!45008) b!53908))

(assert (= (and b!53908 res!45007) b!53909))

(declare-fun m!84661 () Bool)

(assert (=> d!17180 m!84661))

(declare-fun m!84663 () Bool)

(assert (=> d!17180 m!84663))

(assert (=> b!53566 d!17180))

(assert (=> b!53565 d!17180))

(assert (=> b!53565 d!16912))

(assert (=> d!16908 d!16906))

(declare-fun d!17182 () Bool)

(assert (=> d!17182 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17182 true))

(declare-fun _$14!253 () Unit!3710)

(assert (=> d!17182 (= (choose!11 thiss!1379) _$14!253)))

(declare-fun bs!4336 () Bool)

(assert (= bs!4336 d!17182))

(assert (=> bs!4336 m!84011))

(assert (=> d!16908 d!17182))

(declare-fun d!17184 () Bool)

(declare-fun res!45010 () Bool)

(declare-fun e!35911 () Bool)

(assert (=> d!17184 (=> (not res!45010) (not e!35911))))

(assert (=> d!17184 (= res!45010 (= (size!1150 (buf!1500 thiss!1379)) (size!1150 (buf!1500 (_2!2540 lt!83057)))))))

(assert (=> d!17184 (= (isPrefixOf!0 thiss!1379 (_2!2540 lt!83057)) e!35911)))

(declare-fun b!53910 () Bool)

(declare-fun res!45009 () Bool)

(assert (=> b!53910 (=> (not res!45009) (not e!35911))))

(assert (=> b!53910 (= res!45009 (bvsle (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83057))) (currentByte!3067 (_2!2540 lt!83057)) (currentBit!3062 (_2!2540 lt!83057)))))))

(declare-fun b!53911 () Bool)

(declare-fun e!35912 () Bool)

(assert (=> b!53911 (= e!35911 e!35912)))

(declare-fun res!45011 () Bool)

(assert (=> b!53911 (=> res!45011 e!35912)))

(assert (=> b!53911 (= res!45011 (= (size!1150 (buf!1500 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53912 () Bool)

(assert (=> b!53912 (= e!35912 (arrayBitRangesEq!0 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!83057)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(assert (= (and d!17184 res!45010) b!53910))

(assert (= (and b!53910 res!45009) b!53911))

(assert (= (and b!53911 (not res!45011)) b!53912))

(assert (=> b!53910 m!84015))

(assert (=> b!53910 m!84191))

(assert (=> b!53912 m!84015))

(assert (=> b!53912 m!84015))

(declare-fun m!84665 () Bool)

(assert (=> b!53912 m!84665))

(assert (=> b!53567 d!17184))

(assert (=> b!53432 d!16912))

(assert (=> b!53432 d!17176))

(declare-fun d!17186 () Bool)

(assert (=> d!17186 (= (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 thiss!1379)))))))

(assert (=> d!16904 d!17186))

(declare-fun d!17188 () Bool)

(declare-fun res!45013 () Bool)

(declare-fun e!35913 () Bool)

(assert (=> d!17188 (=> (not res!45013) (not e!35913))))

(assert (=> d!17188 (= res!45013 (= (size!1150 (buf!1500 (_2!2541 lt!83117))) (size!1150 (buf!1500 (_2!2540 lt!82793)))))))

(assert (=> d!17188 (= (isPrefixOf!0 (_2!2541 lt!83117) (_2!2540 lt!82793)) e!35913)))

(declare-fun b!53913 () Bool)

(declare-fun res!45012 () Bool)

(assert (=> b!53913 (=> (not res!45012) (not e!35913))))

(assert (=> b!53913 (= res!45012 (bvsle (bitIndex!0 (size!1150 (buf!1500 (_2!2541 lt!83117))) (currentByte!3067 (_2!2541 lt!83117)) (currentBit!3062 (_2!2541 lt!83117))) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793)))))))

(declare-fun b!53914 () Bool)

(declare-fun e!35914 () Bool)

(assert (=> b!53914 (= e!35913 e!35914)))

(declare-fun res!45014 () Bool)

(assert (=> b!53914 (=> res!45014 e!35914)))

(assert (=> b!53914 (= res!45014 (= (size!1150 (buf!1500 (_2!2541 lt!83117))) #b00000000000000000000000000000000))))

(declare-fun b!53915 () Bool)

(assert (=> b!53915 (= e!35914 (arrayBitRangesEq!0 (buf!1500 (_2!2541 lt!83117)) (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 (_2!2541 lt!83117))) (currentByte!3067 (_2!2541 lt!83117)) (currentBit!3062 (_2!2541 lt!83117)))))))

(assert (= (and d!17188 res!45013) b!53913))

(assert (= (and b!53913 res!45012) b!53914))

(assert (= (and b!53914 (not res!45014)) b!53915))

(assert (=> b!53913 m!84649))

(assert (=> b!53913 m!84067))

(assert (=> b!53915 m!84649))

(assert (=> b!53915 m!84649))

(declare-fun m!84667 () Bool)

(assert (=> b!53915 m!84667))

(assert (=> b!53603 d!17188))

(declare-fun d!17190 () Bool)

(assert (=> d!17190 (= (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793)))) (bvsub (bvmul ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793))))))))

(assert (=> d!16920 d!17190))

(declare-fun d!17192 () Bool)

(assert (=> d!17192 (= (invariant!0 (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379) (size!1150 (buf!1500 thiss!1379))) (and (bvsge (currentBit!3062 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3062 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3067 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3067 thiss!1379) (size!1150 (buf!1500 thiss!1379))) (and (= (currentBit!3062 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3067 thiss!1379) (size!1150 (buf!1500 thiss!1379)))))))))

(assert (=> d!16988 d!17192))

(declare-fun d!17194 () Bool)

(declare-fun res!45016 () Bool)

(declare-fun e!35915 () Bool)

(assert (=> d!17194 (=> (not res!45016) (not e!35915))))

(assert (=> d!17194 (= res!45016 (= (size!1150 (buf!1500 (_1!2541 lt!83117))) (size!1150 (buf!1500 thiss!1379))))))

(assert (=> d!17194 (= (isPrefixOf!0 (_1!2541 lt!83117) thiss!1379) e!35915)))

(declare-fun b!53916 () Bool)

(declare-fun res!45015 () Bool)

(assert (=> b!53916 (=> (not res!45015) (not e!35915))))

(assert (=> b!53916 (= res!45015 (bvsle (bitIndex!0 (size!1150 (buf!1500 (_1!2541 lt!83117))) (currentByte!3067 (_1!2541 lt!83117)) (currentBit!3062 (_1!2541 lt!83117))) (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(declare-fun b!53917 () Bool)

(declare-fun e!35916 () Bool)

(assert (=> b!53917 (= e!35915 e!35916)))

(declare-fun res!45017 () Bool)

(assert (=> b!53917 (=> res!45017 e!35916)))

(assert (=> b!53917 (= res!45017 (= (size!1150 (buf!1500 (_1!2541 lt!83117))) #b00000000000000000000000000000000))))

(declare-fun b!53918 () Bool)

(assert (=> b!53918 (= e!35916 (arrayBitRangesEq!0 (buf!1500 (_1!2541 lt!83117)) (buf!1500 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 (_1!2541 lt!83117))) (currentByte!3067 (_1!2541 lt!83117)) (currentBit!3062 (_1!2541 lt!83117)))))))

(assert (= (and d!17194 res!45016) b!53916))

(assert (= (and b!53916 res!45015) b!53917))

(assert (= (and b!53917 (not res!45017)) b!53918))

(declare-fun m!84669 () Bool)

(assert (=> b!53916 m!84669))

(assert (=> b!53916 m!84015))

(assert (=> b!53918 m!84669))

(assert (=> b!53918 m!84669))

(declare-fun m!84671 () Bool)

(assert (=> b!53918 m!84671))

(assert (=> b!53600 d!17194))

(assert (=> b!53602 d!16912))

(declare-fun d!17196 () Bool)

(assert (=> d!17196 (arrayBitRangesEq!0 (buf!1500 (_2!2540 lt!82793)) (buf!1500 thiss!1379) lt!83120 lt!83131)))

(declare-fun lt!83499 () Unit!3710)

(declare-fun choose!8 (array!2523 array!2523 (_ BitVec 64) (_ BitVec 64)) Unit!3710)

(assert (=> d!17196 (= lt!83499 (choose!8 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!82793)) lt!83120 lt!83131))))

(assert (=> d!17196 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83120) (bvsle lt!83120 lt!83131))))

(assert (=> d!17196 (= (arrayBitRangesEqSymmetric!0 (buf!1500 thiss!1379) (buf!1500 (_2!2540 lt!82793)) lt!83120 lt!83131) lt!83499)))

(declare-fun bs!4337 () Bool)

(assert (= bs!4337 d!17196))

(assert (=> bs!4337 m!84251))

(declare-fun m!84673 () Bool)

(assert (=> bs!4337 m!84673))

(assert (=> b!53602 d!17196))

(declare-fun d!17198 () Bool)

(declare-fun res!45019 () Bool)

(declare-fun e!35921 () Bool)

(assert (=> d!17198 (=> res!45019 e!35921)))

(assert (=> d!17198 (= res!45019 (bvsge lt!83120 lt!83131))))

(assert (=> d!17198 (= (arrayBitRangesEq!0 (buf!1500 (_2!2540 lt!82793)) (buf!1500 thiss!1379) lt!83120 lt!83131) e!35921)))

(declare-fun b!53919 () Bool)

(declare-fun e!35917 () Bool)

(declare-fun e!35919 () Bool)

(assert (=> b!53919 (= e!35917 e!35919)))

(declare-fun c!3818 () Bool)

(declare-fun lt!83502 () tuple4!30)

(assert (=> b!53919 (= c!3818 (= (_3!109 lt!83502) (_4!15 lt!83502)))))

(declare-fun b!53920 () Bool)

(declare-fun e!35918 () Bool)

(assert (=> b!53920 (= e!35919 e!35918)))

(declare-fun res!45020 () Bool)

(declare-fun lt!83500 () (_ BitVec 32))

(assert (=> b!53920 (= res!45020 (byteRangesEq!0 (select (arr!1686 (buf!1500 (_2!2540 lt!82793))) (_3!109 lt!83502)) (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83502)) lt!83500 #b00000000000000000000000000001000))))

(assert (=> b!53920 (=> (not res!45020) (not e!35918))))

(declare-fun b!53921 () Bool)

(declare-fun call!681 () Bool)

(assert (=> b!53921 (= e!35919 call!681)))

(declare-fun bm!678 () Bool)

(declare-fun lt!83501 () (_ BitVec 32))

(assert (=> bm!678 (= call!681 (byteRangesEq!0 (ite c!3818 (select (arr!1686 (buf!1500 (_2!2540 lt!82793))) (_3!109 lt!83502)) (select (arr!1686 (buf!1500 (_2!2540 lt!82793))) (_4!15 lt!83502))) (ite c!3818 (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83502)) (select (arr!1686 (buf!1500 thiss!1379)) (_4!15 lt!83502))) (ite c!3818 lt!83500 #b00000000000000000000000000000000) lt!83501))))

(declare-fun b!53922 () Bool)

(assert (=> b!53922 (= e!35921 e!35917)))

(declare-fun res!45022 () Bool)

(assert (=> b!53922 (=> (not res!45022) (not e!35917))))

(declare-fun e!35920 () Bool)

(assert (=> b!53922 (= res!45022 e!35920)))

(declare-fun res!45018 () Bool)

(assert (=> b!53922 (=> res!45018 e!35920)))

(assert (=> b!53922 (= res!45018 (bvsge (_1!2560 lt!83502) (_2!2560 lt!83502)))))

(assert (=> b!53922 (= lt!83501 ((_ extract 31 0) (bvsrem lt!83131 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53922 (= lt!83500 ((_ extract 31 0) (bvsrem lt!83120 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53922 (= lt!83502 (arrayBitIndices!0 lt!83120 lt!83131))))

(declare-fun b!53923 () Bool)

(declare-fun e!35922 () Bool)

(assert (=> b!53923 (= e!35922 call!681)))

(declare-fun b!53924 () Bool)

(declare-fun res!45021 () Bool)

(assert (=> b!53924 (= res!45021 (= lt!83501 #b00000000000000000000000000000000))))

(assert (=> b!53924 (=> res!45021 e!35922)))

(assert (=> b!53924 (= e!35918 e!35922)))

(declare-fun b!53925 () Bool)

(assert (=> b!53925 (= e!35920 (arrayRangesEq!16 (buf!1500 (_2!2540 lt!82793)) (buf!1500 thiss!1379) (_1!2560 lt!83502) (_2!2560 lt!83502)))))

(assert (= (and d!17198 (not res!45019)) b!53922))

(assert (= (and b!53922 (not res!45018)) b!53925))

(assert (= (and b!53922 res!45022) b!53919))

(assert (= (and b!53919 c!3818) b!53921))

(assert (= (and b!53919 (not c!3818)) b!53920))

(assert (= (and b!53920 res!45020) b!53924))

(assert (= (and b!53924 (not res!45021)) b!53923))

(assert (= (or b!53921 b!53923) bm!678))

(declare-fun m!84675 () Bool)

(assert (=> b!53920 m!84675))

(declare-fun m!84677 () Bool)

(assert (=> b!53920 m!84677))

(assert (=> b!53920 m!84675))

(assert (=> b!53920 m!84677))

(declare-fun m!84679 () Bool)

(assert (=> b!53920 m!84679))

(assert (=> bm!678 m!84677))

(assert (=> bm!678 m!84675))

(declare-fun m!84681 () Bool)

(assert (=> bm!678 m!84681))

(declare-fun m!84683 () Bool)

(assert (=> bm!678 m!84683))

(declare-fun m!84685 () Bool)

(assert (=> bm!678 m!84685))

(declare-fun m!84687 () Bool)

(assert (=> b!53922 m!84687))

(declare-fun m!84689 () Bool)

(assert (=> b!53925 m!84689))

(assert (=> b!53602 d!17198))

(declare-fun b!53936 () Bool)

(declare-fun res!45033 () Bool)

(declare-fun e!35927 () Bool)

(assert (=> b!53936 (=> (not res!45033) (not e!35927))))

(declare-fun lt!83513 () tuple2!4870)

(assert (=> b!53936 (= res!45033 (isPrefixOf!0 thiss!1379 (_2!2540 lt!83513)))))

(declare-fun d!17200 () Bool)

(assert (=> d!17200 e!35927))

(declare-fun res!45031 () Bool)

(assert (=> d!17200 (=> (not res!45031) (not e!35927))))

(assert (=> d!17200 (= res!45031 (= (size!1150 (buf!1500 thiss!1379)) (size!1150 (buf!1500 (_2!2540 lt!83513)))))))

(declare-fun choose!16 (BitStream!1992 Bool) tuple2!4870)

(assert (=> d!17200 (= lt!83513 (choose!16 thiss!1379 lt!83051))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!17200 (validate_offset_bit!0 ((_ sign_extend 32) (size!1150 (buf!1500 thiss!1379))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)))))

(assert (=> d!17200 (= (appendBit!0 thiss!1379 lt!83051) lt!83513)))

(declare-fun b!53938 () Bool)

(declare-fun e!35928 () Bool)

(declare-fun lt!83512 () tuple2!4882)

(assert (=> b!53938 (= e!35928 (= (bitIndex!0 (size!1150 (buf!1500 (_1!2546 lt!83512))) (currentByte!3067 (_1!2546 lt!83512)) (currentBit!3062 (_1!2546 lt!83512))) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83513))) (currentByte!3067 (_2!2540 lt!83513)) (currentBit!3062 (_2!2540 lt!83513)))))))

(declare-fun b!53935 () Bool)

(declare-fun res!45032 () Bool)

(assert (=> b!53935 (=> (not res!45032) (not e!35927))))

(declare-fun lt!83514 () (_ BitVec 64))

(declare-fun lt!83511 () (_ BitVec 64))

(assert (=> b!53935 (= res!45032 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83513))) (currentByte!3067 (_2!2540 lt!83513)) (currentBit!3062 (_2!2540 lt!83513))) (bvadd lt!83514 lt!83511)))))

(assert (=> b!53935 (or (not (= (bvand lt!83514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83511 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83514 lt!83511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53935 (= lt!83511 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53935 (= lt!83514 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(declare-fun b!53937 () Bool)

(assert (=> b!53937 (= e!35927 e!35928)))

(declare-fun res!45034 () Bool)

(assert (=> b!53937 (=> (not res!45034) (not e!35928))))

(assert (=> b!53937 (= res!45034 (and (= (_2!2546 lt!83512) lt!83051) (= (_1!2546 lt!83512) (_2!2540 lt!83513))))))

(assert (=> b!53937 (= lt!83512 (readBitPure!0 (readerFrom!0 (_2!2540 lt!83513) (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379))))))

(assert (= (and d!17200 res!45031) b!53935))

(assert (= (and b!53935 res!45032) b!53936))

(assert (= (and b!53936 res!45033) b!53937))

(assert (= (and b!53937 res!45034) b!53938))

(declare-fun m!84691 () Bool)

(assert (=> d!17200 m!84691))

(declare-fun m!84693 () Bool)

(assert (=> d!17200 m!84693))

(declare-fun m!84695 () Bool)

(assert (=> b!53937 m!84695))

(assert (=> b!53937 m!84695))

(declare-fun m!84697 () Bool)

(assert (=> b!53937 m!84697))

(declare-fun m!84699 () Bool)

(assert (=> b!53935 m!84699))

(assert (=> b!53935 m!84015))

(declare-fun m!84701 () Bool)

(assert (=> b!53936 m!84701))

(declare-fun m!84703 () Bool)

(assert (=> b!53938 m!84703))

(assert (=> b!53938 m!84699))

(assert (=> d!16930 d!17200))

(declare-fun b!53941 () Bool)

(declare-fun e!35930 () Bool)

(declare-fun lt!83515 () List!571)

(assert (=> b!53941 (= e!35930 (isEmpty!152 lt!83515))))

(declare-fun b!53942 () Bool)

(assert (=> b!53942 (= e!35930 (> (length!266 lt!83515) 0))))

(declare-fun b!53939 () Bool)

(declare-fun e!35929 () tuple2!4886)

(assert (=> b!53939 (= e!35929 (tuple2!4887 Nil!568 (_2!2549 lt!83074)))))

(declare-fun d!17202 () Bool)

(assert (=> d!17202 e!35930))

(declare-fun c!3819 () Bool)

(assert (=> d!17202 (= c!3819 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83073) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17202 (= lt!83515 (_1!2548 e!35929))))

(declare-fun c!3820 () Bool)

(assert (=> d!17202 (= c!3820 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83073) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17202 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83073) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17202 (= (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_2!2549 lt!83074) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83073)) lt!83515)))

(declare-fun lt!83517 () tuple2!4888)

(declare-fun b!53940 () Bool)

(declare-fun lt!83516 () (_ BitVec 64))

(assert (=> b!53940 (= e!35929 (tuple2!4887 (Cons!567 (_1!2549 lt!83517) (bitStreamReadBitsIntoList!0 (_2!2540 lt!82793) (_2!2549 lt!83517) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83073) lt!83516))) (_2!2549 lt!83517)))))

(assert (=> b!53940 (= lt!83517 (readBit!0 (_2!2549 lt!83074)))))

(assert (=> b!53940 (= lt!83516 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!17202 c!3820) b!53939))

(assert (= (and d!17202 (not c!3820)) b!53940))

(assert (= (and d!17202 c!3819) b!53941))

(assert (= (and d!17202 (not c!3819)) b!53942))

(declare-fun m!84705 () Bool)

(assert (=> b!53941 m!84705))

(declare-fun m!84707 () Bool)

(assert (=> b!53942 m!84707))

(declare-fun m!84709 () Bool)

(assert (=> b!53940 m!84709))

(declare-fun m!84711 () Bool)

(assert (=> b!53940 m!84711))

(assert (=> b!53586 d!17202))

(declare-fun d!17204 () Bool)

(declare-fun e!35937 () Bool)

(assert (=> d!17204 e!35937))

(declare-fun res!45037 () Bool)

(assert (=> d!17204 (=> (not res!45037) (not e!35937))))

(declare-fun increaseBitIndex!0 (BitStream!1992) tuple2!4870)

(assert (=> d!17204 (= res!45037 (= (buf!1500 (_2!2540 (increaseBitIndex!0 (_1!2541 lt!82794)))) (buf!1500 (_1!2541 lt!82794))))))

(declare-fun lt!83536 () Bool)

(assert (=> d!17204 (= lt!83536 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 (buf!1500 (_1!2541 lt!82794))) (currentByte!3067 (_1!2541 lt!82794)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3062 (_1!2541 lt!82794))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83533 () tuple2!4888)

(assert (=> d!17204 (= lt!83533 (tuple2!4889 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 (buf!1500 (_1!2541 lt!82794))) (currentByte!3067 (_1!2541 lt!82794)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3062 (_1!2541 lt!82794))))) #b00000000000000000000000000000000)) (_2!2540 (increaseBitIndex!0 (_1!2541 lt!82794)))))))

(assert (=> d!17204 (validate_offset_bit!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_1!2541 lt!82794)))) ((_ sign_extend 32) (currentByte!3067 (_1!2541 lt!82794))) ((_ sign_extend 32) (currentBit!3062 (_1!2541 lt!82794))))))

(assert (=> d!17204 (= (readBit!0 (_1!2541 lt!82794)) lt!83533)))

(declare-fun b!53945 () Bool)

(declare-fun lt!83532 () (_ BitVec 64))

(declare-fun lt!83537 () (_ BitVec 64))

(assert (=> b!53945 (= e!35937 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 (increaseBitIndex!0 (_1!2541 lt!82794))))) (currentByte!3067 (_2!2540 (increaseBitIndex!0 (_1!2541 lt!82794)))) (currentBit!3062 (_2!2540 (increaseBitIndex!0 (_1!2541 lt!82794))))) (bvadd lt!83537 lt!83532)))))

(assert (=> b!53945 (or (not (= (bvand lt!83537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83532 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83537 lt!83532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53945 (= lt!83532 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53945 (= lt!83537 (bitIndex!0 (size!1150 (buf!1500 (_1!2541 lt!82794))) (currentByte!3067 (_1!2541 lt!82794)) (currentBit!3062 (_1!2541 lt!82794))))))

(declare-fun lt!83535 () Bool)

(assert (=> b!53945 (= lt!83535 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 (buf!1500 (_1!2541 lt!82794))) (currentByte!3067 (_1!2541 lt!82794)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3062 (_1!2541 lt!82794))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83534 () Bool)

(assert (=> b!53945 (= lt!83534 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 (buf!1500 (_1!2541 lt!82794))) (currentByte!3067 (_1!2541 lt!82794)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3062 (_1!2541 lt!82794))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83538 () Bool)

(assert (=> b!53945 (= lt!83538 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 (buf!1500 (_1!2541 lt!82794))) (currentByte!3067 (_1!2541 lt!82794)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3062 (_1!2541 lt!82794))))) #b00000000000000000000000000000000)))))

(assert (= (and d!17204 res!45037) b!53945))

(declare-fun m!84713 () Bool)

(assert (=> d!17204 m!84713))

(declare-fun m!84715 () Bool)

(assert (=> d!17204 m!84715))

(declare-fun m!84717 () Bool)

(assert (=> d!17204 m!84717))

(declare-fun m!84719 () Bool)

(assert (=> d!17204 m!84719))

(assert (=> b!53945 m!84715))

(assert (=> b!53945 m!84713))

(declare-fun m!84721 () Bool)

(assert (=> b!53945 m!84721))

(assert (=> b!53945 m!84717))

(declare-fun m!84723 () Bool)

(assert (=> b!53945 m!84723))

(assert (=> b!53586 d!17204))

(declare-fun d!17206 () Bool)

(get-info :version)

(assert (=> d!17206 (= (isEmpty!152 lt!83072) ((_ is Nil!568) lt!83072))))

(assert (=> b!53587 d!17206))

(assert (=> d!16912 d!17186))

(assert (=> d!16912 d!17192))

(declare-fun d!17208 () Bool)

(assert (=> d!17208 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!82793))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!82793))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17208 true))

(declare-fun _$1!315 () Unit!3710)

(assert (=> d!17208 (= (choose!27 thiss!1379 (_2!2540 lt!82793) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!315)))

(declare-fun bs!4338 () Bool)

(assert (= bs!4338 d!17208))

(assert (=> bs!4338 m!83987))

(assert (=> d!16922 d!17208))

(assert (=> d!17004 d!16996))

(declare-fun d!17210 () Bool)

(assert (=> d!17210 (validate_offset_bits!1 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!82793)))) ((_ sign_extend 32) (currentByte!3067 thiss!1379)) ((_ sign_extend 32) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!17210 true))

(declare-fun _$6!216 () Unit!3710)

(assert (=> d!17210 (= (choose!9 thiss!1379 (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1993 (buf!1500 (_2!2540 lt!82793)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))) _$6!216)))

(declare-fun bs!4339 () Bool)

(assert (= bs!4339 d!17210))

(assert (=> bs!4339 m!83995))

(assert (=> d!17004 d!17210))

(declare-fun d!17212 () Bool)

(declare-fun res!45039 () Bool)

(declare-fun e!35942 () Bool)

(assert (=> d!17212 (=> res!45039 e!35942)))

(assert (=> d!17212 (= res!45039 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(assert (=> d!17212 (= (arrayBitRangesEq!0 (buf!1500 thiss!1379) (buf!1500 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))) e!35942)))

(declare-fun b!53946 () Bool)

(declare-fun e!35938 () Bool)

(declare-fun e!35940 () Bool)

(assert (=> b!53946 (= e!35938 e!35940)))

(declare-fun c!3821 () Bool)

(declare-fun lt!83541 () tuple4!30)

(assert (=> b!53946 (= c!3821 (= (_3!109 lt!83541) (_4!15 lt!83541)))))

(declare-fun b!53947 () Bool)

(declare-fun e!35939 () Bool)

(assert (=> b!53947 (= e!35940 e!35939)))

(declare-fun lt!83539 () (_ BitVec 32))

(declare-fun res!45040 () Bool)

(assert (=> b!53947 (= res!45040 (byteRangesEq!0 (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83541)) (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83541)) lt!83539 #b00000000000000000000000000001000))))

(assert (=> b!53947 (=> (not res!45040) (not e!35939))))

(declare-fun b!53948 () Bool)

(declare-fun call!682 () Bool)

(assert (=> b!53948 (= e!35940 call!682)))

(declare-fun bm!679 () Bool)

(declare-fun lt!83540 () (_ BitVec 32))

(assert (=> bm!679 (= call!682 (byteRangesEq!0 (ite c!3821 (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83541)) (select (arr!1686 (buf!1500 thiss!1379)) (_4!15 lt!83541))) (ite c!3821 (select (arr!1686 (buf!1500 thiss!1379)) (_3!109 lt!83541)) (select (arr!1686 (buf!1500 thiss!1379)) (_4!15 lt!83541))) (ite c!3821 lt!83539 #b00000000000000000000000000000000) lt!83540))))

(declare-fun b!53949 () Bool)

(assert (=> b!53949 (= e!35942 e!35938)))

(declare-fun res!45042 () Bool)

(assert (=> b!53949 (=> (not res!45042) (not e!35938))))

(declare-fun e!35941 () Bool)

(assert (=> b!53949 (= res!45042 e!35941)))

(declare-fun res!45038 () Bool)

(assert (=> b!53949 (=> res!45038 e!35941)))

(assert (=> b!53949 (= res!45038 (bvsge (_1!2560 lt!83541) (_2!2560 lt!83541)))))

(assert (=> b!53949 (= lt!83540 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53949 (= lt!83539 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53949 (= lt!83541 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 thiss!1379)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379))))))

(declare-fun b!53950 () Bool)

(declare-fun e!35943 () Bool)

(assert (=> b!53950 (= e!35943 call!682)))

(declare-fun b!53951 () Bool)

(declare-fun res!45041 () Bool)

(assert (=> b!53951 (= res!45041 (= lt!83540 #b00000000000000000000000000000000))))

(assert (=> b!53951 (=> res!45041 e!35943)))

(assert (=> b!53951 (= e!35939 e!35943)))

(declare-fun b!53952 () Bool)

(assert (=> b!53952 (= e!35941 (arrayRangesEq!16 (buf!1500 thiss!1379) (buf!1500 thiss!1379) (_1!2560 lt!83541) (_2!2560 lt!83541)))))

(assert (= (and d!17212 (not res!45039)) b!53949))

(assert (= (and b!53949 (not res!45038)) b!53952))

(assert (= (and b!53949 res!45042) b!53946))

(assert (= (and b!53946 c!3821) b!53948))

(assert (= (and b!53946 (not c!3821)) b!53947))

(assert (= (and b!53947 res!45040) b!53951))

(assert (= (and b!53951 (not res!45041)) b!53950))

(assert (= (or b!53948 b!53950) bm!679))

(declare-fun m!84725 () Bool)

(assert (=> b!53947 m!84725))

(assert (=> b!53947 m!84725))

(assert (=> b!53947 m!84725))

(assert (=> b!53947 m!84725))

(declare-fun m!84727 () Bool)

(assert (=> b!53947 m!84727))

(assert (=> bm!679 m!84725))

(assert (=> bm!679 m!84725))

(declare-fun m!84729 () Bool)

(assert (=> bm!679 m!84729))

(assert (=> bm!679 m!84729))

(declare-fun m!84731 () Bool)

(assert (=> bm!679 m!84731))

(assert (=> b!53949 m!84015))

(assert (=> b!53949 m!84643))

(declare-fun m!84733 () Bool)

(assert (=> b!53952 m!84733))

(assert (=> b!53425 d!17212))

(assert (=> b!53425 d!16912))

(declare-fun b!53963 () Bool)

(declare-fun res!45056 () Bool)

(declare-fun e!35946 () Bool)

(assert (=> b!53963 (=> (not res!45056) (not e!35946))))

(declare-fun lt!83560 () tuple2!4884)

(declare-fun lt!83566 () (_ BitVec 64))

(assert (=> b!53963 (= res!45056 (= (size!1150 (_1!2547 lt!83560)) ((_ extract 31 0) lt!83566)))))

(assert (=> b!53963 (and (bvslt lt!83566 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!83566 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!83563 () (_ BitVec 64))

(declare-fun lt!83562 () (_ BitVec 64))

(assert (=> b!53963 (= lt!83566 (bvsdiv lt!83563 lt!83562))))

(assert (=> b!53963 (and (not (= lt!83562 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!83563 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!83562 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!53963 (= lt!83562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!83565 () (_ BitVec 64))

(declare-fun lt!83564 () (_ BitVec 64))

(assert (=> b!53963 (= lt!83563 (bvsub lt!83565 lt!83564))))

(assert (=> b!53963 (or (= (bvand lt!83565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83564 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83565 lt!83564) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53963 (= lt!83564 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!83561 () (_ BitVec 64))

(assert (=> b!53963 (= lt!83565 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!83561))))

(assert (=> b!53963 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83561 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!83561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53963 (= lt!83561 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!53964 () Bool)

(declare-fun res!45054 () Bool)

(assert (=> b!53964 (=> (not res!45054) (not e!35946))))

(assert (=> b!53964 (= res!45054 (bvsle (currentByte!3067 lt!83058) (currentByte!3067 (_2!2547 lt!83560))))))

(declare-fun b!53965 () Bool)

(declare-fun res!45057 () Bool)

(assert (=> b!53965 (=> (not res!45057) (not e!35946))))

(declare-fun lt!83568 () (_ BitVec 64))

(assert (=> b!53965 (= res!45057 (= (bvadd lt!83568 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1150 (buf!1500 (_2!2547 lt!83560))) (currentByte!3067 (_2!2547 lt!83560)) (currentBit!3062 (_2!2547 lt!83560)))))))

(assert (=> b!53965 (or (not (= (bvand lt!83568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83568 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53965 (= lt!83568 (bitIndex!0 (size!1150 (buf!1500 lt!83058)) (currentByte!3067 lt!83058) (currentBit!3062 lt!83058)))))

(declare-fun d!17214 () Bool)

(assert (=> d!17214 e!35946))

(declare-fun res!45053 () Bool)

(assert (=> d!17214 (=> (not res!45053) (not e!35946))))

(assert (=> d!17214 (= res!45053 (= (buf!1500 (_2!2547 lt!83560)) (buf!1500 lt!83058)))))

(declare-datatypes ((tuple3!188 0))(
  ( (tuple3!189 (_1!2561 Unit!3710) (_2!2561 BitStream!1992) (_3!110 array!2523)) )
))
(declare-fun lt!83567 () tuple3!188)

(assert (=> d!17214 (= lt!83560 (tuple2!4885 (_3!110 lt!83567) (_2!2561 lt!83567)))))

(declare-fun readBitsLoop!0 (BitStream!1992 (_ BitVec 64) array!2523 (_ BitVec 64) (_ BitVec 64)) tuple3!188)

(assert (=> d!17214 (= lt!83567 (readBitsLoop!0 lt!83058 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2524 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17214 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!17214 (= (readBits!0 lt!83058 #b0000000000000000000000000000000000000000000000000000000000000001) lt!83560)))

(declare-fun b!53966 () Bool)

(declare-fun res!45055 () Bool)

(assert (=> b!53966 (=> (not res!45055) (not e!35946))))

(assert (=> b!53966 (= res!45055 (invariant!0 (currentBit!3062 (_2!2547 lt!83560)) (currentByte!3067 (_2!2547 lt!83560)) (size!1150 (buf!1500 (_2!2547 lt!83560)))))))

(declare-fun b!53967 () Bool)

(assert (=> b!53967 (= e!35946 (= (byteArrayBitContentToList!0 (_2!2547 lt!83560) (_1!2547 lt!83560) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2547 lt!83560) lt!83058 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17214 res!45053) b!53965))

(assert (= (and b!53965 res!45057) b!53966))

(assert (= (and b!53966 res!45055) b!53963))

(assert (= (and b!53963 res!45056) b!53964))

(assert (= (and b!53964 res!45054) b!53967))

(declare-fun m!84735 () Bool)

(assert (=> b!53965 m!84735))

(declare-fun m!84737 () Bool)

(assert (=> b!53965 m!84737))

(declare-fun m!84739 () Bool)

(assert (=> d!17214 m!84739))

(declare-fun m!84741 () Bool)

(assert (=> b!53966 m!84741))

(declare-fun m!84743 () Bool)

(assert (=> b!53967 m!84743))

(declare-fun m!84745 () Bool)

(assert (=> b!53967 m!84745))

(assert (=> b!53563 d!17214))

(declare-fun d!17216 () Bool)

(declare-fun lt!83571 () tuple2!4888)

(assert (=> d!17216 (= lt!83571 (readBit!0 lt!83058))))

(assert (=> d!17216 (= (readBitPure!0 lt!83058) (tuple2!4883 (_2!2549 lt!83571) (_1!2549 lt!83571)))))

(declare-fun bs!4340 () Bool)

(assert (= bs!4340 d!17216))

(declare-fun m!84747 () Bool)

(assert (=> bs!4340 m!84747))

(assert (=> b!53563 d!17216))

(declare-fun d!17218 () Bool)

(declare-fun e!35949 () Bool)

(assert (=> d!17218 e!35949))

(declare-fun res!45061 () Bool)

(assert (=> d!17218 (=> (not res!45061) (not e!35949))))

(assert (=> d!17218 (= res!45061 (invariant!0 (currentBit!3062 (_2!2540 lt!83052)) (currentByte!3067 (_2!2540 lt!83052)) (size!1150 (buf!1500 (_2!2540 lt!83052)))))))

(assert (=> d!17218 (= (readerFrom!0 (_2!2540 lt!83052) (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379)) (BitStream!1993 (buf!1500 (_2!2540 lt!83052)) (currentByte!3067 thiss!1379) (currentBit!3062 thiss!1379)))))

(declare-fun b!53970 () Bool)

(assert (=> b!53970 (= e!35949 (invariant!0 (currentBit!3062 thiss!1379) (currentByte!3067 thiss!1379) (size!1150 (buf!1500 (_2!2540 lt!83052)))))))

(assert (= (and d!17218 res!45061) b!53970))

(assert (=> d!17218 m!84663))

(declare-fun m!84749 () Bool)

(assert (=> b!53970 m!84749))

(assert (=> b!53563 d!17218))

(declare-fun d!17220 () Bool)

(declare-fun e!35950 () Bool)

(assert (=> d!17220 e!35950))

(declare-fun res!45063 () Bool)

(assert (=> d!17220 (=> (not res!45063) (not e!35950))))

(declare-fun lt!83576 () (_ BitVec 64))

(declare-fun lt!83574 () (_ BitVec 64))

(declare-fun lt!83575 () (_ BitVec 64))

(assert (=> d!17220 (= res!45063 (= lt!83576 (bvsub lt!83574 lt!83575)))))

(assert (=> d!17220 (or (= (bvand lt!83574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83575 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83574 lt!83575) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17220 (= lt!83575 (remainingBits!0 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!83057)))) ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!83057))) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!83057)))))))

(declare-fun lt!83573 () (_ BitVec 64))

(declare-fun lt!83577 () (_ BitVec 64))

(assert (=> d!17220 (= lt!83574 (bvmul lt!83573 lt!83577))))

(assert (=> d!17220 (or (= lt!83573 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83577 (bvsdiv (bvmul lt!83573 lt!83577) lt!83573)))))

(assert (=> d!17220 (= lt!83577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17220 (= lt!83573 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!83057)))))))

(assert (=> d!17220 (= lt!83576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3067 (_2!2540 lt!83057))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3062 (_2!2540 lt!83057)))))))

(assert (=> d!17220 (invariant!0 (currentBit!3062 (_2!2540 lt!83057)) (currentByte!3067 (_2!2540 lt!83057)) (size!1150 (buf!1500 (_2!2540 lt!83057))))))

(assert (=> d!17220 (= (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!83057))) (currentByte!3067 (_2!2540 lt!83057)) (currentBit!3062 (_2!2540 lt!83057))) lt!83576)))

(declare-fun b!53971 () Bool)

(declare-fun res!45062 () Bool)

(assert (=> b!53971 (=> (not res!45062) (not e!35950))))

(assert (=> b!53971 (= res!45062 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83576))))

(declare-fun b!53972 () Bool)

(declare-fun lt!83572 () (_ BitVec 64))

(assert (=> b!53972 (= e!35950 (bvsle lt!83576 (bvmul lt!83572 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53972 (or (= lt!83572 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83572 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83572)))))

(assert (=> b!53972 (= lt!83572 ((_ sign_extend 32) (size!1150 (buf!1500 (_2!2540 lt!83057)))))))

(assert (= (and d!17220 res!45063) b!53971))

(assert (= (and b!53971 res!45062) b!53972))

(declare-fun m!84751 () Bool)

(assert (=> d!17220 m!84751))

(declare-fun m!84753 () Bool)

(assert (=> d!17220 m!84753))

(assert (=> b!53564 d!17220))

(assert (=> b!53564 d!16912))

(declare-fun d!17222 () Bool)

(declare-fun c!3822 () Bool)

(assert (=> d!17222 (= c!3822 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!35951 () List!571)

(assert (=> d!17222 (= (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!35951)))

(declare-fun b!53973 () Bool)

(assert (=> b!53973 (= e!35951 Nil!568)))

(declare-fun b!53974 () Bool)

(assert (=> b!53974 (= e!35951 (Cons!567 (not (= (bvand ((_ sign_extend 24) (select (arr!1686 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2540 lt!82793) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17222 c!3822) b!53973))

(assert (= (and d!17222 (not c!3822)) b!53974))

(declare-fun m!84755 () Bool)

(assert (=> b!53974 m!84755))

(declare-fun m!84757 () Bool)

(assert (=> b!53974 m!84757))

(declare-fun m!84759 () Bool)

(assert (=> b!53974 m!84759))

(assert (=> b!53576 d!17222))

(declare-fun d!17224 () Bool)

(assert (=> d!17224 (isPrefixOf!0 lt!83132 (_2!2540 lt!82793))))

(declare-fun lt!83580 () Unit!3710)

(declare-fun choose!30 (BitStream!1992 BitStream!1992 BitStream!1992) Unit!3710)

(assert (=> d!17224 (= lt!83580 (choose!30 lt!83132 thiss!1379 (_2!2540 lt!82793)))))

(assert (=> d!17224 (isPrefixOf!0 lt!83132 thiss!1379)))

(assert (=> d!17224 (= (lemmaIsPrefixTransitive!0 lt!83132 thiss!1379 (_2!2540 lt!82793)) lt!83580)))

(declare-fun bs!4341 () Bool)

(assert (= bs!4341 d!17224))

(assert (=> bs!4341 m!84233))

(declare-fun m!84761 () Bool)

(assert (=> bs!4341 m!84761))

(declare-fun m!84763 () Bool)

(assert (=> bs!4341 m!84763))

(assert (=> d!17002 d!17224))

(assert (=> d!17002 d!16906))

(declare-fun d!17226 () Bool)

(declare-fun res!45065 () Bool)

(declare-fun e!35952 () Bool)

(assert (=> d!17226 (=> (not res!45065) (not e!35952))))

(assert (=> d!17226 (= res!45065 (= (size!1150 (buf!1500 lt!83132)) (size!1150 (buf!1500 lt!83132))))))

(assert (=> d!17226 (= (isPrefixOf!0 lt!83132 lt!83132) e!35952)))

(declare-fun b!53975 () Bool)

(declare-fun res!45064 () Bool)

(assert (=> b!53975 (=> (not res!45064) (not e!35952))))

(assert (=> b!53975 (= res!45064 (bvsle (bitIndex!0 (size!1150 (buf!1500 lt!83132)) (currentByte!3067 lt!83132) (currentBit!3062 lt!83132)) (bitIndex!0 (size!1150 (buf!1500 lt!83132)) (currentByte!3067 lt!83132) (currentBit!3062 lt!83132))))))

(declare-fun b!53976 () Bool)

(declare-fun e!35953 () Bool)

(assert (=> b!53976 (= e!35952 e!35953)))

(declare-fun res!45066 () Bool)

(assert (=> b!53976 (=> res!45066 e!35953)))

(assert (=> b!53976 (= res!45066 (= (size!1150 (buf!1500 lt!83132)) #b00000000000000000000000000000000))))

(declare-fun b!53977 () Bool)

(assert (=> b!53977 (= e!35953 (arrayBitRangesEq!0 (buf!1500 lt!83132) (buf!1500 lt!83132) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 lt!83132)) (currentByte!3067 lt!83132) (currentBit!3062 lt!83132))))))

(assert (= (and d!17226 res!45065) b!53975))

(assert (= (and b!53975 res!45064) b!53976))

(assert (= (and b!53976 (not res!45066)) b!53977))

(declare-fun m!84765 () Bool)

(assert (=> b!53975 m!84765))

(assert (=> b!53975 m!84765))

(assert (=> b!53977 m!84765))

(assert (=> b!53977 m!84765))

(declare-fun m!84767 () Bool)

(assert (=> b!53977 m!84767))

(assert (=> d!17002 d!17226))

(declare-fun d!17228 () Bool)

(declare-fun res!45068 () Bool)

(declare-fun e!35954 () Bool)

(assert (=> d!17228 (=> (not res!45068) (not e!35954))))

(assert (=> d!17228 (= res!45068 (= (size!1150 (buf!1500 (_2!2540 lt!82793))) (size!1150 (buf!1500 (_2!2540 lt!82793)))))))

(assert (=> d!17228 (= (isPrefixOf!0 (_2!2540 lt!82793) (_2!2540 lt!82793)) e!35954)))

(declare-fun b!53978 () Bool)

(declare-fun res!45067 () Bool)

(assert (=> b!53978 (=> (not res!45067) (not e!35954))))

(assert (=> b!53978 (= res!45067 (bvsle (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793))) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793)))))))

(declare-fun b!53979 () Bool)

(declare-fun e!35955 () Bool)

(assert (=> b!53979 (= e!35954 e!35955)))

(declare-fun res!45069 () Bool)

(assert (=> b!53979 (=> res!45069 e!35955)))

(assert (=> b!53979 (= res!45069 (= (size!1150 (buf!1500 (_2!2540 lt!82793))) #b00000000000000000000000000000000))))

(declare-fun b!53980 () Bool)

(assert (=> b!53980 (= e!35955 (arrayBitRangesEq!0 (buf!1500 (_2!2540 lt!82793)) (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793)))))))

(assert (= (and d!17228 res!45068) b!53978))

(assert (= (and b!53978 res!45067) b!53979))

(assert (= (and b!53979 (not res!45069)) b!53980))

(assert (=> b!53978 m!84067))

(assert (=> b!53978 m!84067))

(assert (=> b!53980 m!84067))

(assert (=> b!53980 m!84067))

(declare-fun m!84769 () Bool)

(assert (=> b!53980 m!84769))

(assert (=> d!17002 d!17228))

(declare-fun d!17230 () Bool)

(assert (=> d!17230 (isPrefixOf!0 (_2!2540 lt!82793) (_2!2540 lt!82793))))

(declare-fun lt!83581 () Unit!3710)

(assert (=> d!17230 (= lt!83581 (choose!11 (_2!2540 lt!82793)))))

(assert (=> d!17230 (= (lemmaIsPrefixRefl!0 (_2!2540 lt!82793)) lt!83581)))

(declare-fun bs!4342 () Bool)

(assert (= bs!4342 d!17230))

(assert (=> bs!4342 m!84237))

(declare-fun m!84771 () Bool)

(assert (=> bs!4342 m!84771))

(assert (=> d!17002 d!17230))

(declare-fun d!17232 () Bool)

(assert (=> d!17232 (isPrefixOf!0 lt!83132 lt!83132)))

(declare-fun lt!83582 () Unit!3710)

(assert (=> d!17232 (= lt!83582 (choose!11 lt!83132))))

(assert (=> d!17232 (= (lemmaIsPrefixRefl!0 lt!83132) lt!83582)))

(declare-fun bs!4343 () Bool)

(assert (= bs!4343 d!17232))

(assert (=> bs!4343 m!84227))

(declare-fun m!84773 () Bool)

(assert (=> bs!4343 m!84773))

(assert (=> d!17002 d!17232))

(assert (=> d!17002 d!16918))

(assert (=> d!17002 d!16908))

(declare-fun d!17234 () Bool)

(declare-fun res!45071 () Bool)

(declare-fun e!35956 () Bool)

(assert (=> d!17234 (=> (not res!45071) (not e!35956))))

(assert (=> d!17234 (= res!45071 (= (size!1150 (buf!1500 lt!83132)) (size!1150 (buf!1500 (_2!2540 lt!82793)))))))

(assert (=> d!17234 (= (isPrefixOf!0 lt!83132 (_2!2540 lt!82793)) e!35956)))

(declare-fun b!53981 () Bool)

(declare-fun res!45070 () Bool)

(assert (=> b!53981 (=> (not res!45070) (not e!35956))))

(assert (=> b!53981 (= res!45070 (bvsle (bitIndex!0 (size!1150 (buf!1500 lt!83132)) (currentByte!3067 lt!83132) (currentBit!3062 lt!83132)) (bitIndex!0 (size!1150 (buf!1500 (_2!2540 lt!82793))) (currentByte!3067 (_2!2540 lt!82793)) (currentBit!3062 (_2!2540 lt!82793)))))))

(declare-fun b!53982 () Bool)

(declare-fun e!35957 () Bool)

(assert (=> b!53982 (= e!35956 e!35957)))

(declare-fun res!45072 () Bool)

(assert (=> b!53982 (=> res!45072 e!35957)))

(assert (=> b!53982 (= res!45072 (= (size!1150 (buf!1500 lt!83132)) #b00000000000000000000000000000000))))

(declare-fun b!53983 () Bool)

(assert (=> b!53983 (= e!35957 (arrayBitRangesEq!0 (buf!1500 lt!83132) (buf!1500 (_2!2540 lt!82793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 lt!83132)) (currentByte!3067 lt!83132) (currentBit!3062 lt!83132))))))

(assert (= (and d!17234 res!45071) b!53981))

(assert (= (and b!53981 res!45070) b!53982))

(assert (= (and b!53982 (not res!45072)) b!53983))

(assert (=> b!53981 m!84765))

(assert (=> b!53981 m!84067))

(assert (=> b!53983 m!84765))

(assert (=> b!53983 m!84765))

(declare-fun m!84775 () Bool)

(assert (=> b!53983 m!84775))

(assert (=> d!17002 d!17234))

(declare-fun d!17236 () Bool)

(declare-fun res!45074 () Bool)

(declare-fun e!35958 () Bool)

(assert (=> d!17236 (=> (not res!45074) (not e!35958))))

(assert (=> d!17236 (= res!45074 (= (size!1150 (buf!1500 (_1!2541 lt!83117))) (size!1150 (buf!1500 (_2!2541 lt!83117)))))))

(assert (=> d!17236 (= (isPrefixOf!0 (_1!2541 lt!83117) (_2!2541 lt!83117)) e!35958)))

(declare-fun b!53984 () Bool)

(declare-fun res!45073 () Bool)

(assert (=> b!53984 (=> (not res!45073) (not e!35958))))

(assert (=> b!53984 (= res!45073 (bvsle (bitIndex!0 (size!1150 (buf!1500 (_1!2541 lt!83117))) (currentByte!3067 (_1!2541 lt!83117)) (currentBit!3062 (_1!2541 lt!83117))) (bitIndex!0 (size!1150 (buf!1500 (_2!2541 lt!83117))) (currentByte!3067 (_2!2541 lt!83117)) (currentBit!3062 (_2!2541 lt!83117)))))))

(declare-fun b!53985 () Bool)

(declare-fun e!35959 () Bool)

(assert (=> b!53985 (= e!35958 e!35959)))

(declare-fun res!45075 () Bool)

(assert (=> b!53985 (=> res!45075 e!35959)))

(assert (=> b!53985 (= res!45075 (= (size!1150 (buf!1500 (_1!2541 lt!83117))) #b00000000000000000000000000000000))))

(declare-fun b!53986 () Bool)

(assert (=> b!53986 (= e!35959 (arrayBitRangesEq!0 (buf!1500 (_1!2541 lt!83117)) (buf!1500 (_2!2541 lt!83117)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1150 (buf!1500 (_1!2541 lt!83117))) (currentByte!3067 (_1!2541 lt!83117)) (currentBit!3062 (_1!2541 lt!83117)))))))

(assert (= (and d!17236 res!45074) b!53984))

(assert (= (and b!53984 res!45073) b!53985))

(assert (= (and b!53985 (not res!45075)) b!53986))

(assert (=> b!53984 m!84669))

(assert (=> b!53984 m!84649))

(assert (=> b!53986 m!84669))

(assert (=> b!53986 m!84669))

(declare-fun m!84777 () Bool)

(assert (=> b!53986 m!84777))

(assert (=> d!17002 d!17236))

(declare-fun d!17238 () Bool)

