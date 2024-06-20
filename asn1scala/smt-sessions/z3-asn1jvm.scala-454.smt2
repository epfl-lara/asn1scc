; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12122 () Bool)

(assert start!12122)

(declare-fun b!61796 () Bool)

(declare-fun e!41132 () Bool)

(declare-datatypes ((array!2781 0))(
  ( (array!2782 (arr!1833 (Array (_ BitVec 32) (_ BitVec 8))) (size!1269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2214 0))(
  ( (BitStream!2215 (buf!1650 array!2781) (currentByte!3280 (_ BitVec 32)) (currentBit!3275 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2214)

(declare-fun array_inv!1166 (array!2781) Bool)

(assert (=> b!61796 (= e!41132 (array_inv!1166 (buf!1650 thiss!1379)))))

(declare-fun b!61797 () Bool)

(declare-fun e!41140 () Bool)

(declare-datatypes ((tuple2!5598 0))(
  ( (tuple2!5599 (_1!2910 BitStream!2214) (_2!2910 BitStream!2214)) )
))
(declare-fun lt!96822 () tuple2!5598)

(declare-fun lt!96814 () tuple2!5598)

(declare-fun isPrefixOf!0 (BitStream!2214 BitStream!2214) Bool)

(assert (=> b!61797 (= e!41140 (isPrefixOf!0 (_1!2910 lt!96822) (_1!2910 lt!96814)))))

(declare-fun b!61798 () Bool)

(declare-fun e!41135 () Bool)

(declare-fun e!41137 () Bool)

(assert (=> b!61798 (= e!41135 (not e!41137))))

(declare-fun res!51477 () Bool)

(assert (=> b!61798 (=> res!51477 e!41137)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!61798 (= res!51477 (bvsge i!635 to!314))))

(assert (=> b!61798 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4209 0))(
  ( (Unit!4210) )
))
(declare-fun lt!96825 () Unit!4209)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2214) Unit!4209)

(assert (=> b!61798 (= lt!96825 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!96818 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!61798 (= lt!96818 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(declare-fun b!61799 () Bool)

(declare-fun e!41139 () Bool)

(assert (=> b!61799 (= e!41137 e!41139)))

(declare-fun res!51462 () Bool)

(assert (=> b!61799 (=> res!51462 e!41139)))

(declare-datatypes ((tuple2!5600 0))(
  ( (tuple2!5601 (_1!2911 Unit!4209) (_2!2911 BitStream!2214)) )
))
(declare-fun lt!96821 () tuple2!5600)

(assert (=> b!61799 (= res!51462 (not (isPrefixOf!0 thiss!1379 (_2!2911 lt!96821))))))

(declare-fun lt!96813 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61799 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!96813)))

(assert (=> b!61799 (= lt!96813 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96820 () Unit!4209)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2214 BitStream!2214 (_ BitVec 64) (_ BitVec 64)) Unit!4209)

(assert (=> b!61799 (= lt!96820 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2911 lt!96821) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2781)

(declare-fun appendBitFromByte!0 (BitStream!2214 (_ BitVec 8) (_ BitVec 32)) tuple2!5600)

(assert (=> b!61799 (= lt!96821 (appendBitFromByte!0 thiss!1379 (select (arr!1833 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!61800 () Bool)

(declare-fun e!41134 () Bool)

(declare-fun e!41131 () Bool)

(assert (=> b!61800 (= e!41134 e!41131)))

(declare-fun res!51471 () Bool)

(assert (=> b!61800 (=> res!51471 e!41131)))

(declare-fun lt!96826 () tuple2!5600)

(assert (=> b!61800 (= res!51471 (not (= (size!1269 (buf!1650 (_2!2911 lt!96821))) (size!1269 (buf!1650 (_2!2911 lt!96826))))))))

(declare-fun e!41130 () Bool)

(assert (=> b!61800 e!41130))

(declare-fun res!51474 () Bool)

(assert (=> b!61800 (=> (not res!51474) (not e!41130))))

(assert (=> b!61800 (= res!51474 (= (size!1269 (buf!1650 (_2!2911 lt!96826))) (size!1269 (buf!1650 thiss!1379))))))

(declare-fun b!61801 () Bool)

(declare-fun res!51470 () Bool)

(assert (=> b!61801 (=> res!51470 e!41134)))

(assert (=> b!61801 (= res!51470 (not (= (size!1269 (buf!1650 thiss!1379)) (size!1269 (buf!1650 (_2!2911 lt!96826))))))))

(declare-fun b!61802 () Bool)

(declare-fun e!41138 () Bool)

(assert (=> b!61802 (= e!41139 e!41138)))

(declare-fun res!51463 () Bool)

(assert (=> b!61802 (=> res!51463 e!41138)))

(assert (=> b!61802 (= res!51463 (not (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!96826))))))

(assert (=> b!61802 (isPrefixOf!0 thiss!1379 (_2!2911 lt!96826))))

(declare-fun lt!96824 () Unit!4209)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2214 BitStream!2214 BitStream!2214) Unit!4209)

(assert (=> b!61802 (= lt!96824 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2911 lt!96821) (_2!2911 lt!96826)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2214 array!2781 (_ BitVec 64) (_ BitVec 64)) tuple2!5600)

(assert (=> b!61802 (= lt!96826 (appendBitsMSBFirstLoop!0 (_2!2911 lt!96821) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!41133 () Bool)

(assert (=> b!61802 e!41133))

(declare-fun res!51469 () Bool)

(assert (=> b!61802 (=> (not res!51469) (not e!41133))))

(assert (=> b!61802 (= res!51469 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96812 () Unit!4209)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2214 array!2781 (_ BitVec 64)) Unit!4209)

(assert (=> b!61802 (= lt!96812 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1650 (_2!2911 lt!96821)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96817 () tuple2!5598)

(declare-fun reader!0 (BitStream!2214 BitStream!2214) tuple2!5598)

(assert (=> b!61802 (= lt!96817 (reader!0 thiss!1379 (_2!2911 lt!96821)))))

(declare-fun b!61803 () Bool)

(declare-fun res!51468 () Bool)

(assert (=> b!61803 (=> res!51468 e!41134)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!61803 (= res!51468 (not (invariant!0 (currentBit!3275 (_2!2911 lt!96826)) (currentByte!3280 (_2!2911 lt!96826)) (size!1269 (buf!1650 (_2!2911 lt!96826))))))))

(declare-fun res!51467 () Bool)

(assert (=> start!12122 (=> (not res!51467) (not e!41135))))

(assert (=> start!12122 (= res!51467 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1269 srcBuffer!2))))))))

(assert (=> start!12122 e!41135))

(assert (=> start!12122 true))

(assert (=> start!12122 (array_inv!1166 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2214) Bool)

(assert (=> start!12122 (and (inv!12 thiss!1379) e!41132)))

(declare-fun b!61804 () Bool)

(declare-fun res!51475 () Bool)

(assert (=> b!61804 (=> res!51475 e!41140)))

(declare-datatypes ((List!682 0))(
  ( (Nil!679) (Cons!678 (h!797 Bool) (t!1432 List!682)) )
))
(declare-fun lt!96815 () List!682)

(declare-fun length!310 (List!682) Int)

(assert (=> b!61804 (= res!51475 (<= (length!310 lt!96815) 0))))

(declare-fun b!61805 () Bool)

(declare-fun res!51461 () Bool)

(assert (=> b!61805 (=> res!51461 e!41140)))

(assert (=> b!61805 (= res!51461 (not (isPrefixOf!0 (_1!2910 lt!96822) (_2!2911 lt!96826))))))

(declare-fun b!61806 () Bool)

(assert (=> b!61806 (= e!41131 e!41140)))

(declare-fun res!51473 () Bool)

(assert (=> b!61806 (=> res!51473 e!41140)))

(assert (=> b!61806 (= res!51473 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!96823 () List!682)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2214 BitStream!2214 (_ BitVec 64)) List!682)

(assert (=> b!61806 (= lt!96823 (bitStreamReadBitsIntoList!0 (_2!2911 lt!96826) (_1!2910 lt!96814) lt!96813))))

(assert (=> b!61806 (= lt!96815 (bitStreamReadBitsIntoList!0 (_2!2911 lt!96826) (_1!2910 lt!96822) (bvsub to!314 i!635)))))

(assert (=> b!61806 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!96813)))

(declare-fun lt!96811 () Unit!4209)

(assert (=> b!61806 (= lt!96811 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2911 lt!96821) (buf!1650 (_2!2911 lt!96826)) lt!96813))))

(assert (=> b!61806 (= lt!96814 (reader!0 (_2!2911 lt!96821) (_2!2911 lt!96826)))))

(assert (=> b!61806 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!96819 () Unit!4209)

(assert (=> b!61806 (= lt!96819 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1650 (_2!2911 lt!96826)) (bvsub to!314 i!635)))))

(assert (=> b!61806 (= lt!96822 (reader!0 thiss!1379 (_2!2911 lt!96826)))))

(declare-fun b!61807 () Bool)

(declare-fun res!51465 () Bool)

(assert (=> b!61807 (=> res!51465 e!41131)))

(assert (=> b!61807 (= res!51465 (not (invariant!0 (currentBit!3275 (_2!2911 lt!96821)) (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96821))))))))

(declare-fun b!61808 () Bool)

(declare-fun res!51464 () Bool)

(assert (=> b!61808 (=> res!51464 e!41131)))

(assert (=> b!61808 (= res!51464 (not (invariant!0 (currentBit!3275 (_2!2911 lt!96821)) (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96826))))))))

(declare-fun b!61809 () Bool)

(declare-fun res!51472 () Bool)

(assert (=> b!61809 (=> (not res!51472) (not e!41135))))

(assert (=> b!61809 (= res!51472 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 thiss!1379))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!61810 () Bool)

(declare-fun res!51476 () Bool)

(assert (=> b!61810 (=> res!51476 e!41140)))

(assert (=> b!61810 (= res!51476 (not (isPrefixOf!0 (_1!2910 lt!96814) (_2!2911 lt!96826))))))

(declare-fun b!61811 () Bool)

(declare-fun head!501 (List!682) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2214 array!2781 (_ BitVec 64) (_ BitVec 64)) List!682)

(assert (=> b!61811 (= e!41133 (= (head!501 (byteArrayBitContentToList!0 (_2!2911 lt!96821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!501 (bitStreamReadBitsIntoList!0 (_2!2911 lt!96821) (_1!2910 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!61812 () Bool)

(declare-fun lt!96816 () (_ BitVec 64))

(assert (=> b!61812 (= e!41130 (= lt!96816 (bvsub (bvsub (bvadd (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61813 () Bool)

(assert (=> b!61813 (= e!41138 e!41134)))

(declare-fun res!51466 () Bool)

(assert (=> b!61813 (=> res!51466 e!41134)))

(assert (=> b!61813 (= res!51466 (not (= lt!96816 (bvsub (bvadd lt!96818 to!314) i!635))))))

(assert (=> b!61813 (= lt!96816 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826))))))

(assert (= (and start!12122 res!51467) b!61809))

(assert (= (and b!61809 res!51472) b!61798))

(assert (= (and b!61798 (not res!51477)) b!61799))

(assert (= (and b!61799 (not res!51462)) b!61802))

(assert (= (and b!61802 res!51469) b!61811))

(assert (= (and b!61802 (not res!51463)) b!61813))

(assert (= (and b!61813 (not res!51466)) b!61803))

(assert (= (and b!61803 (not res!51468)) b!61801))

(assert (= (and b!61801 (not res!51470)) b!61800))

(assert (= (and b!61800 res!51474) b!61812))

(assert (= (and b!61800 (not res!51471)) b!61807))

(assert (= (and b!61807 (not res!51465)) b!61808))

(assert (= (and b!61808 (not res!51464)) b!61806))

(assert (= (and b!61806 (not res!51473)) b!61804))

(assert (= (and b!61804 (not res!51475)) b!61805))

(assert (= (and b!61805 (not res!51461)) b!61810))

(assert (= (and b!61810 (not res!51476)) b!61797))

(assert (= start!12122 b!61796))

(declare-fun m!97629 () Bool)

(assert (=> b!61813 m!97629))

(declare-fun m!97631 () Bool)

(assert (=> b!61804 m!97631))

(declare-fun m!97633 () Bool)

(assert (=> b!61798 m!97633))

(declare-fun m!97635 () Bool)

(assert (=> b!61798 m!97635))

(declare-fun m!97637 () Bool)

(assert (=> b!61798 m!97637))

(declare-fun m!97639 () Bool)

(assert (=> b!61802 m!97639))

(declare-fun m!97641 () Bool)

(assert (=> b!61802 m!97641))

(declare-fun m!97643 () Bool)

(assert (=> b!61802 m!97643))

(declare-fun m!97645 () Bool)

(assert (=> b!61802 m!97645))

(declare-fun m!97647 () Bool)

(assert (=> b!61802 m!97647))

(declare-fun m!97649 () Bool)

(assert (=> b!61802 m!97649))

(declare-fun m!97651 () Bool)

(assert (=> b!61802 m!97651))

(declare-fun m!97653 () Bool)

(assert (=> b!61807 m!97653))

(declare-fun m!97655 () Bool)

(assert (=> b!61810 m!97655))

(declare-fun m!97657 () Bool)

(assert (=> b!61803 m!97657))

(declare-fun m!97659 () Bool)

(assert (=> start!12122 m!97659))

(declare-fun m!97661 () Bool)

(assert (=> start!12122 m!97661))

(declare-fun m!97663 () Bool)

(assert (=> b!61796 m!97663))

(declare-fun m!97665 () Bool)

(assert (=> b!61799 m!97665))

(declare-fun m!97667 () Bool)

(assert (=> b!61799 m!97667))

(declare-fun m!97669 () Bool)

(assert (=> b!61799 m!97669))

(assert (=> b!61799 m!97665))

(declare-fun m!97671 () Bool)

(assert (=> b!61799 m!97671))

(declare-fun m!97673 () Bool)

(assert (=> b!61799 m!97673))

(declare-fun m!97675 () Bool)

(assert (=> b!61806 m!97675))

(declare-fun m!97677 () Bool)

(assert (=> b!61806 m!97677))

(declare-fun m!97679 () Bool)

(assert (=> b!61806 m!97679))

(declare-fun m!97681 () Bool)

(assert (=> b!61806 m!97681))

(declare-fun m!97683 () Bool)

(assert (=> b!61806 m!97683))

(declare-fun m!97685 () Bool)

(assert (=> b!61806 m!97685))

(declare-fun m!97687 () Bool)

(assert (=> b!61806 m!97687))

(declare-fun m!97689 () Bool)

(assert (=> b!61806 m!97689))

(declare-fun m!97691 () Bool)

(assert (=> b!61808 m!97691))

(declare-fun m!97693 () Bool)

(assert (=> b!61805 m!97693))

(declare-fun m!97695 () Bool)

(assert (=> b!61797 m!97695))

(declare-fun m!97697 () Bool)

(assert (=> b!61812 m!97697))

(declare-fun m!97699 () Bool)

(assert (=> b!61809 m!97699))

(declare-fun m!97701 () Bool)

(assert (=> b!61811 m!97701))

(assert (=> b!61811 m!97701))

(declare-fun m!97703 () Bool)

(assert (=> b!61811 m!97703))

(declare-fun m!97705 () Bool)

(assert (=> b!61811 m!97705))

(assert (=> b!61811 m!97705))

(declare-fun m!97707 () Bool)

(assert (=> b!61811 m!97707))

(check-sat (not b!61809) (not b!61805) (not b!61806) (not b!61810) (not b!61804) (not b!61811) (not b!61812) (not b!61808) (not b!61797) (not b!61813) (not b!61799) (not b!61798) (not b!61807) (not b!61796) (not start!12122) (not b!61803) (not b!61802))
(check-sat)
(get-model)

(declare-fun d!19046 () Bool)

(declare-fun size!1271 (List!682) Int)

(assert (=> d!19046 (= (length!310 lt!96815) (size!1271 lt!96815))))

(declare-fun bs!4749 () Bool)

(assert (= bs!4749 d!19046))

(declare-fun m!97789 () Bool)

(assert (=> bs!4749 m!97789))

(assert (=> b!61804 d!19046))

(declare-fun d!19048 () Bool)

(assert (=> d!19048 (= (invariant!0 (currentBit!3275 (_2!2911 lt!96826)) (currentByte!3280 (_2!2911 lt!96826)) (size!1269 (buf!1650 (_2!2911 lt!96826)))) (and (bvsge (currentBit!3275 (_2!2911 lt!96826)) #b00000000000000000000000000000000) (bvslt (currentBit!3275 (_2!2911 lt!96826)) #b00000000000000000000000000001000) (bvsge (currentByte!3280 (_2!2911 lt!96826)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3280 (_2!2911 lt!96826)) (size!1269 (buf!1650 (_2!2911 lt!96826)))) (and (= (currentBit!3275 (_2!2911 lt!96826)) #b00000000000000000000000000000000) (= (currentByte!3280 (_2!2911 lt!96826)) (size!1269 (buf!1650 (_2!2911 lt!96826))))))))))

(assert (=> b!61803 d!19048))

(declare-fun d!19050 () Bool)

(declare-fun e!41180 () Bool)

(assert (=> d!19050 e!41180))

(declare-fun res!51534 () Bool)

(assert (=> d!19050 (=> (not res!51534) (not e!41180))))

(declare-fun lt!96889 () (_ BitVec 64))

(declare-fun lt!96892 () (_ BitVec 64))

(declare-fun lt!96890 () (_ BitVec 64))

(assert (=> d!19050 (= res!51534 (= lt!96889 (bvsub lt!96890 lt!96892)))))

(assert (=> d!19050 (or (= (bvand lt!96890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96890 lt!96892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19050 (= lt!96892 (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96826))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96826)))))))

(declare-fun lt!96891 () (_ BitVec 64))

(declare-fun lt!96887 () (_ BitVec 64))

(assert (=> d!19050 (= lt!96890 (bvmul lt!96891 lt!96887))))

(assert (=> d!19050 (or (= lt!96891 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96887 (bvsdiv (bvmul lt!96891 lt!96887) lt!96891)))))

(assert (=> d!19050 (= lt!96887 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19050 (= lt!96891 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))))))

(assert (=> d!19050 (= lt!96889 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96826)))))))

(assert (=> d!19050 (invariant!0 (currentBit!3275 (_2!2911 lt!96826)) (currentByte!3280 (_2!2911 lt!96826)) (size!1269 (buf!1650 (_2!2911 lt!96826))))))

(assert (=> d!19050 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826))) lt!96889)))

(declare-fun b!61872 () Bool)

(declare-fun res!51533 () Bool)

(assert (=> b!61872 (=> (not res!51533) (not e!41180))))

(assert (=> b!61872 (= res!51533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96889))))

(declare-fun b!61873 () Bool)

(declare-fun lt!96888 () (_ BitVec 64))

(assert (=> b!61873 (= e!41180 (bvsle lt!96889 (bvmul lt!96888 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61873 (or (= lt!96888 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96888 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96888)))))

(assert (=> b!61873 (= lt!96888 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))))))

(assert (= (and d!19050 res!51534) b!61872))

(assert (= (and b!61872 res!51533) b!61873))

(declare-fun m!97791 () Bool)

(assert (=> d!19050 m!97791))

(assert (=> d!19050 m!97657))

(assert (=> b!61813 d!19050))

(declare-fun b!61980 () Bool)

(declare-fun e!41235 () tuple2!5600)

(declare-fun lt!97163 () tuple2!5600)

(declare-fun Unit!4213 () Unit!4209)

(assert (=> b!61980 (= e!41235 (tuple2!5601 Unit!4213 (_2!2911 lt!97163)))))

(declare-fun lt!97181 () tuple2!5600)

(assert (=> b!61980 (= lt!97181 (appendBitFromByte!0 (_2!2911 lt!96821) (select (arr!1833 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!97144 () (_ BitVec 64))

(assert (=> b!61980 (= lt!97144 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97147 () (_ BitVec 64))

(assert (=> b!61980 (= lt!97147 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97185 () Unit!4209)

(assert (=> b!61980 (= lt!97185 (validateOffsetBitsIneqLemma!0 (_2!2911 lt!96821) (_2!2911 lt!97181) lt!97144 lt!97147))))

(assert (=> b!61980 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!97181)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!97181))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!97181))) (bvsub lt!97144 lt!97147))))

(declare-fun lt!97149 () Unit!4209)

(assert (=> b!61980 (= lt!97149 lt!97185)))

(declare-fun lt!97160 () tuple2!5598)

(assert (=> b!61980 (= lt!97160 (reader!0 (_2!2911 lt!96821) (_2!2911 lt!97181)))))

(declare-fun lt!97186 () (_ BitVec 64))

(assert (=> b!61980 (= lt!97186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97175 () Unit!4209)

(assert (=> b!61980 (= lt!97175 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2911 lt!96821) (buf!1650 (_2!2911 lt!97181)) lt!97186))))

(assert (=> b!61980 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!97181)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!97186)))

(declare-fun lt!97152 () Unit!4209)

(assert (=> b!61980 (= lt!97152 lt!97175)))

(assert (=> b!61980 (= (head!501 (byteArrayBitContentToList!0 (_2!2911 lt!97181) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!501 (bitStreamReadBitsIntoList!0 (_2!2911 lt!97181) (_1!2910 lt!97160) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97143 () Unit!4209)

(declare-fun Unit!4214 () Unit!4209)

(assert (=> b!61980 (= lt!97143 Unit!4214)))

(assert (=> b!61980 (= lt!97163 (appendBitsMSBFirstLoop!0 (_2!2911 lt!97181) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!97165 () Unit!4209)

(assert (=> b!61980 (= lt!97165 (lemmaIsPrefixTransitive!0 (_2!2911 lt!96821) (_2!2911 lt!97181) (_2!2911 lt!97163)))))

(assert (=> b!61980 (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!97163))))

(declare-fun lt!97177 () Unit!4209)

(assert (=> b!61980 (= lt!97177 lt!97165)))

(assert (=> b!61980 (= (size!1269 (buf!1650 (_2!2911 lt!97163))) (size!1269 (buf!1650 (_2!2911 lt!96821))))))

(declare-fun lt!97159 () Unit!4209)

(declare-fun Unit!4215 () Unit!4209)

(assert (=> b!61980 (= lt!97159 Unit!4215)))

(assert (=> b!61980 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97163))) (currentByte!3280 (_2!2911 lt!97163)) (currentBit!3275 (_2!2911 lt!97163))) (bvsub (bvadd (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97172 () Unit!4209)

(declare-fun Unit!4216 () Unit!4209)

(assert (=> b!61980 (= lt!97172 Unit!4216)))

(assert (=> b!61980 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97163))) (currentByte!3280 (_2!2911 lt!97163)) (currentBit!3275 (_2!2911 lt!97163))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97181))) (currentByte!3280 (_2!2911 lt!97181)) (currentBit!3275 (_2!2911 lt!97181))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97182 () Unit!4209)

(declare-fun Unit!4217 () Unit!4209)

(assert (=> b!61980 (= lt!97182 Unit!4217)))

(declare-fun lt!97183 () tuple2!5598)

(declare-fun call!784 () tuple2!5598)

(assert (=> b!61980 (= lt!97183 call!784)))

(declare-fun lt!97150 () (_ BitVec 64))

(assert (=> b!61980 (= lt!97150 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97180 () Unit!4209)

(assert (=> b!61980 (= lt!97180 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2911 lt!96821) (buf!1650 (_2!2911 lt!97163)) lt!97150))))

(assert (=> b!61980 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!97163)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!97150)))

(declare-fun lt!97168 () Unit!4209)

(assert (=> b!61980 (= lt!97168 lt!97180)))

(declare-fun lt!97164 () tuple2!5598)

(assert (=> b!61980 (= lt!97164 (reader!0 (_2!2911 lt!97181) (_2!2911 lt!97163)))))

(declare-fun lt!97184 () (_ BitVec 64))

(assert (=> b!61980 (= lt!97184 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97169 () Unit!4209)

(assert (=> b!61980 (= lt!97169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2911 lt!97181) (buf!1650 (_2!2911 lt!97163)) lt!97184))))

(assert (=> b!61980 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!97163)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!97181))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!97181))) lt!97184)))

(declare-fun lt!97154 () Unit!4209)

(assert (=> b!61980 (= lt!97154 lt!97169)))

(declare-fun lt!97179 () List!682)

(assert (=> b!61980 (= lt!97179 (byteArrayBitContentToList!0 (_2!2911 lt!97163) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!97155 () List!682)

(assert (=> b!61980 (= lt!97155 (byteArrayBitContentToList!0 (_2!2911 lt!97163) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97170 () List!682)

(assert (=> b!61980 (= lt!97170 (bitStreamReadBitsIntoList!0 (_2!2911 lt!97163) (_1!2910 lt!97183) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!97153 () List!682)

(assert (=> b!61980 (= lt!97153 (bitStreamReadBitsIntoList!0 (_2!2911 lt!97163) (_1!2910 lt!97164) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97157 () (_ BitVec 64))

(assert (=> b!61980 (= lt!97157 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97158 () Unit!4209)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2214 BitStream!2214 BitStream!2214 BitStream!2214 (_ BitVec 64) List!682) Unit!4209)

(assert (=> b!61980 (= lt!97158 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2911 lt!97163) (_2!2911 lt!97163) (_1!2910 lt!97183) (_1!2910 lt!97164) lt!97157 lt!97170))))

(declare-fun tail!288 (List!682) List!682)

(assert (=> b!61980 (= (bitStreamReadBitsIntoList!0 (_2!2911 lt!97163) (_1!2910 lt!97164) (bvsub lt!97157 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!288 lt!97170))))

(declare-fun lt!97171 () Unit!4209)

(assert (=> b!61980 (= lt!97171 lt!97158)))

(declare-fun lt!97176 () Unit!4209)

(declare-fun lt!97156 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2781 array!2781 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4209)

(assert (=> b!61980 (= lt!97176 (arrayBitRangesEqImpliesEq!0 (buf!1650 (_2!2911 lt!97181)) (buf!1650 (_2!2911 lt!97163)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!97156 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97181))) (currentByte!3280 (_2!2911 lt!97181)) (currentBit!3275 (_2!2911 lt!97181)))))))

(declare-fun bitAt!0 (array!2781 (_ BitVec 64)) Bool)

(assert (=> b!61980 (= (bitAt!0 (buf!1650 (_2!2911 lt!97181)) lt!97156) (bitAt!0 (buf!1650 (_2!2911 lt!97163)) lt!97156))))

(declare-fun lt!97151 () Unit!4209)

(assert (=> b!61980 (= lt!97151 lt!97176)))

(declare-fun d!19052 () Bool)

(declare-fun e!41236 () Bool)

(assert (=> d!19052 e!41236))

(declare-fun res!51617 () Bool)

(assert (=> d!19052 (=> (not res!51617) (not e!41236))))

(declare-fun lt!97148 () tuple2!5600)

(declare-fun lt!97161 () (_ BitVec 64))

(assert (=> d!19052 (= res!51617 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97148))) (currentByte!3280 (_2!2911 lt!97148)) (currentBit!3275 (_2!2911 lt!97148))) (bvsub lt!97161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19052 (or (= (bvand lt!97161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!97167 () (_ BitVec 64))

(assert (=> d!19052 (= lt!97161 (bvadd lt!97167 to!314))))

(assert (=> d!19052 (or (not (= (bvand lt!97167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!97167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!97167 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19052 (= lt!97167 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))))))

(assert (=> d!19052 (= lt!97148 e!41235)))

(declare-fun c!4368 () Bool)

(assert (=> d!19052 (= c!4368 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!97174 () Unit!4209)

(declare-fun lt!97162 () Unit!4209)

(assert (=> d!19052 (= lt!97174 lt!97162)))

(assert (=> d!19052 (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!96821))))

(assert (=> d!19052 (= lt!97162 (lemmaIsPrefixRefl!0 (_2!2911 lt!96821)))))

(assert (=> d!19052 (= lt!97156 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))))))

(assert (=> d!19052 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19052 (= (appendBitsMSBFirstLoop!0 (_2!2911 lt!96821) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!97148)))

(declare-fun b!61981 () Bool)

(declare-fun lt!97146 () tuple2!5598)

(assert (=> b!61981 (= e!41236 (= (bitStreamReadBitsIntoList!0 (_2!2911 lt!97148) (_1!2910 lt!97146) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2911 lt!97148) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!61981 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61981 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!97145 () Unit!4209)

(declare-fun lt!97166 () Unit!4209)

(assert (=> b!61981 (= lt!97145 lt!97166)))

(declare-fun lt!97178 () (_ BitVec 64))

(assert (=> b!61981 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!97148)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!97178)))

(assert (=> b!61981 (= lt!97166 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2911 lt!96821) (buf!1650 (_2!2911 lt!97148)) lt!97178))))

(declare-fun e!41234 () Bool)

(assert (=> b!61981 e!41234))

(declare-fun res!51615 () Bool)

(assert (=> b!61981 (=> (not res!51615) (not e!41234))))

(assert (=> b!61981 (= res!51615 (and (= (size!1269 (buf!1650 (_2!2911 lt!96821))) (size!1269 (buf!1650 (_2!2911 lt!97148)))) (bvsge lt!97178 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61981 (= lt!97178 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!61981 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61981 (= lt!97146 (reader!0 (_2!2911 lt!96821) (_2!2911 lt!97148)))))

(declare-fun b!61982 () Bool)

(declare-fun Unit!4218 () Unit!4209)

(assert (=> b!61982 (= e!41235 (tuple2!5601 Unit!4218 (_2!2911 lt!96821)))))

(assert (=> b!61982 (= (size!1269 (buf!1650 (_2!2911 lt!96821))) (size!1269 (buf!1650 (_2!2911 lt!96821))))))

(declare-fun lt!97173 () Unit!4209)

(declare-fun Unit!4219 () Unit!4209)

(assert (=> b!61982 (= lt!97173 Unit!4219)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2214 array!2781 array!2781 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5606 0))(
  ( (tuple2!5607 (_1!2914 array!2781) (_2!2914 BitStream!2214)) )
))
(declare-fun readBits!0 (BitStream!2214 (_ BitVec 64)) tuple2!5606)

(assert (=> b!61982 (checkByteArrayBitContent!0 (_2!2911 lt!96821) srcBuffer!2 (_1!2914 (readBits!0 (_1!2910 call!784) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!61983 () Bool)

(assert (=> b!61983 (= e!41234 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!97178))))

(declare-fun bm!781 () Bool)

(assert (=> bm!781 (= call!784 (reader!0 (_2!2911 lt!96821) (ite c!4368 (_2!2911 lt!97163) (_2!2911 lt!96821))))))

(declare-fun b!61984 () Bool)

(declare-fun res!51614 () Bool)

(assert (=> b!61984 (=> (not res!51614) (not e!41236))))

(assert (=> b!61984 (= res!51614 (= (size!1269 (buf!1650 (_2!2911 lt!96821))) (size!1269 (buf!1650 (_2!2911 lt!97148)))))))

(declare-fun b!61985 () Bool)

(declare-fun res!51616 () Bool)

(assert (=> b!61985 (=> (not res!51616) (not e!41236))))

(assert (=> b!61985 (= res!51616 (= (size!1269 (buf!1650 (_2!2911 lt!97148))) (size!1269 (buf!1650 (_2!2911 lt!96821)))))))

(declare-fun b!61986 () Bool)

(declare-fun res!51612 () Bool)

(assert (=> b!61986 (=> (not res!51612) (not e!41236))))

(assert (=> b!61986 (= res!51612 (invariant!0 (currentBit!3275 (_2!2911 lt!97148)) (currentByte!3280 (_2!2911 lt!97148)) (size!1269 (buf!1650 (_2!2911 lt!97148)))))))

(declare-fun b!61987 () Bool)

(declare-fun res!51613 () Bool)

(assert (=> b!61987 (=> (not res!51613) (not e!41236))))

(assert (=> b!61987 (= res!51613 (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!97148)))))

(assert (= (and d!19052 c!4368) b!61980))

(assert (= (and d!19052 (not c!4368)) b!61982))

(assert (= (or b!61980 b!61982) bm!781))

(assert (= (and d!19052 res!51617) b!61986))

(assert (= (and b!61986 res!51612) b!61984))

(assert (= (and b!61984 res!51614) b!61987))

(assert (= (and b!61987 res!51613) b!61985))

(assert (= (and b!61985 res!51616) b!61981))

(assert (= (and b!61981 res!51615) b!61983))

(declare-fun m!97929 () Bool)

(assert (=> bm!781 m!97929))

(declare-fun m!97931 () Bool)

(assert (=> b!61981 m!97931))

(declare-fun m!97933 () Bool)

(assert (=> b!61981 m!97933))

(declare-fun m!97935 () Bool)

(assert (=> b!61981 m!97935))

(declare-fun m!97937 () Bool)

(assert (=> b!61981 m!97937))

(declare-fun m!97939 () Bool)

(assert (=> b!61981 m!97939))

(declare-fun m!97941 () Bool)

(assert (=> b!61987 m!97941))

(declare-fun m!97943 () Bool)

(assert (=> b!61983 m!97943))

(declare-fun m!97945 () Bool)

(assert (=> b!61982 m!97945))

(declare-fun m!97947 () Bool)

(assert (=> b!61982 m!97947))

(declare-fun m!97949 () Bool)

(assert (=> d!19052 m!97949))

(assert (=> d!19052 m!97697))

(declare-fun m!97951 () Bool)

(assert (=> d!19052 m!97951))

(declare-fun m!97953 () Bool)

(assert (=> d!19052 m!97953))

(declare-fun m!97955 () Bool)

(assert (=> b!61980 m!97955))

(declare-fun m!97957 () Bool)

(assert (=> b!61980 m!97957))

(declare-fun m!97959 () Bool)

(assert (=> b!61980 m!97959))

(declare-fun m!97961 () Bool)

(assert (=> b!61980 m!97961))

(declare-fun m!97963 () Bool)

(assert (=> b!61980 m!97963))

(declare-fun m!97965 () Bool)

(assert (=> b!61980 m!97965))

(declare-fun m!97967 () Bool)

(assert (=> b!61980 m!97967))

(declare-fun m!97969 () Bool)

(assert (=> b!61980 m!97969))

(assert (=> b!61980 m!97957))

(declare-fun m!97971 () Bool)

(assert (=> b!61980 m!97971))

(declare-fun m!97973 () Bool)

(assert (=> b!61980 m!97973))

(declare-fun m!97975 () Bool)

(assert (=> b!61980 m!97975))

(declare-fun m!97977 () Bool)

(assert (=> b!61980 m!97977))

(declare-fun m!97979 () Bool)

(assert (=> b!61980 m!97979))

(declare-fun m!97981 () Bool)

(assert (=> b!61980 m!97981))

(declare-fun m!97983 () Bool)

(assert (=> b!61980 m!97983))

(assert (=> b!61980 m!97967))

(declare-fun m!97985 () Bool)

(assert (=> b!61980 m!97985))

(declare-fun m!97987 () Bool)

(assert (=> b!61980 m!97987))

(declare-fun m!97989 () Bool)

(assert (=> b!61980 m!97989))

(declare-fun m!97991 () Bool)

(assert (=> b!61980 m!97991))

(declare-fun m!97993 () Bool)

(assert (=> b!61980 m!97993))

(declare-fun m!97995 () Bool)

(assert (=> b!61980 m!97995))

(declare-fun m!97997 () Bool)

(assert (=> b!61980 m!97997))

(declare-fun m!97999 () Bool)

(assert (=> b!61980 m!97999))

(assert (=> b!61980 m!97959))

(declare-fun m!98001 () Bool)

(assert (=> b!61980 m!98001))

(declare-fun m!98003 () Bool)

(assert (=> b!61980 m!98003))

(assert (=> b!61980 m!97999))

(declare-fun m!98005 () Bool)

(assert (=> b!61980 m!98005))

(declare-fun m!98007 () Bool)

(assert (=> b!61980 m!98007))

(declare-fun m!98009 () Bool)

(assert (=> b!61980 m!98009))

(assert (=> b!61980 m!97697))

(declare-fun m!98011 () Bool)

(assert (=> b!61980 m!98011))

(declare-fun m!98013 () Bool)

(assert (=> b!61980 m!98013))

(declare-fun m!98015 () Bool)

(assert (=> b!61980 m!98015))

(declare-fun m!98017 () Bool)

(assert (=> b!61986 m!98017))

(assert (=> b!61802 d!19052))

(declare-fun lt!97238 () tuple2!5598)

(declare-fun e!41241 () Bool)

(declare-fun b!61998 () Bool)

(declare-fun lt!97236 () (_ BitVec 64))

(declare-fun lt!97241 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2214 (_ BitVec 64)) BitStream!2214)

(assert (=> b!61998 (= e!41241 (= (_1!2910 lt!97238) (withMovedBitIndex!0 (_2!2910 lt!97238) (bvsub lt!97241 lt!97236))))))

(assert (=> b!61998 (or (= (bvand lt!97241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97241 lt!97236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61998 (= lt!97236 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))))))

(assert (=> b!61998 (= lt!97241 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(declare-fun b!61999 () Bool)

(declare-fun e!41242 () Unit!4209)

(declare-fun lt!97227 () Unit!4209)

(assert (=> b!61999 (= e!41242 lt!97227)))

(declare-fun lt!97245 () (_ BitVec 64))

(assert (=> b!61999 (= lt!97245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97240 () (_ BitVec 64))

(assert (=> b!61999 (= lt!97240 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2781 array!2781 (_ BitVec 64) (_ BitVec 64)) Unit!4209)

(assert (=> b!61999 (= lt!97227 (arrayBitRangesEqSymmetric!0 (buf!1650 thiss!1379) (buf!1650 (_2!2911 lt!96821)) lt!97245 lt!97240))))

(declare-fun arrayBitRangesEq!0 (array!2781 array!2781 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61999 (arrayBitRangesEq!0 (buf!1650 (_2!2911 lt!96821)) (buf!1650 thiss!1379) lt!97245 lt!97240)))

(declare-fun b!62000 () Bool)

(declare-fun res!51624 () Bool)

(assert (=> b!62000 (=> (not res!51624) (not e!41241))))

(assert (=> b!62000 (= res!51624 (isPrefixOf!0 (_2!2910 lt!97238) (_2!2911 lt!96821)))))

(declare-fun b!62001 () Bool)

(declare-fun res!51626 () Bool)

(assert (=> b!62001 (=> (not res!51626) (not e!41241))))

(assert (=> b!62001 (= res!51626 (isPrefixOf!0 (_1!2910 lt!97238) thiss!1379))))

(declare-fun d!19112 () Bool)

(assert (=> d!19112 e!41241))

(declare-fun res!51625 () Bool)

(assert (=> d!19112 (=> (not res!51625) (not e!41241))))

(assert (=> d!19112 (= res!51625 (isPrefixOf!0 (_1!2910 lt!97238) (_2!2910 lt!97238)))))

(declare-fun lt!97231 () BitStream!2214)

(assert (=> d!19112 (= lt!97238 (tuple2!5599 lt!97231 (_2!2911 lt!96821)))))

(declare-fun lt!97242 () Unit!4209)

(declare-fun lt!97237 () Unit!4209)

(assert (=> d!19112 (= lt!97242 lt!97237)))

(assert (=> d!19112 (isPrefixOf!0 lt!97231 (_2!2911 lt!96821))))

(assert (=> d!19112 (= lt!97237 (lemmaIsPrefixTransitive!0 lt!97231 (_2!2911 lt!96821) (_2!2911 lt!96821)))))

(declare-fun lt!97229 () Unit!4209)

(declare-fun lt!97244 () Unit!4209)

(assert (=> d!19112 (= lt!97229 lt!97244)))

(assert (=> d!19112 (isPrefixOf!0 lt!97231 (_2!2911 lt!96821))))

(assert (=> d!19112 (= lt!97244 (lemmaIsPrefixTransitive!0 lt!97231 thiss!1379 (_2!2911 lt!96821)))))

(declare-fun lt!97239 () Unit!4209)

(assert (=> d!19112 (= lt!97239 e!41242)))

(declare-fun c!4371 () Bool)

(assert (=> d!19112 (= c!4371 (not (= (size!1269 (buf!1650 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!97243 () Unit!4209)

(declare-fun lt!97233 () Unit!4209)

(assert (=> d!19112 (= lt!97243 lt!97233)))

(assert (=> d!19112 (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!96821))))

(assert (=> d!19112 (= lt!97233 (lemmaIsPrefixRefl!0 (_2!2911 lt!96821)))))

(declare-fun lt!97235 () Unit!4209)

(declare-fun lt!97246 () Unit!4209)

(assert (=> d!19112 (= lt!97235 lt!97246)))

(assert (=> d!19112 (= lt!97246 (lemmaIsPrefixRefl!0 (_2!2911 lt!96821)))))

(declare-fun lt!97232 () Unit!4209)

(declare-fun lt!97228 () Unit!4209)

(assert (=> d!19112 (= lt!97232 lt!97228)))

(assert (=> d!19112 (isPrefixOf!0 lt!97231 lt!97231)))

(assert (=> d!19112 (= lt!97228 (lemmaIsPrefixRefl!0 lt!97231))))

(declare-fun lt!97230 () Unit!4209)

(declare-fun lt!97234 () Unit!4209)

(assert (=> d!19112 (= lt!97230 lt!97234)))

(assert (=> d!19112 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19112 (= lt!97234 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19112 (= lt!97231 (BitStream!2215 (buf!1650 (_2!2911 lt!96821)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(assert (=> d!19112 (isPrefixOf!0 thiss!1379 (_2!2911 lt!96821))))

(assert (=> d!19112 (= (reader!0 thiss!1379 (_2!2911 lt!96821)) lt!97238)))

(declare-fun b!62002 () Bool)

(declare-fun Unit!4220 () Unit!4209)

(assert (=> b!62002 (= e!41242 Unit!4220)))

(assert (= (and d!19112 c!4371) b!61999))

(assert (= (and d!19112 (not c!4371)) b!62002))

(assert (= (and d!19112 res!51625) b!62001))

(assert (= (and b!62001 res!51626) b!62000))

(assert (= (and b!62000 res!51624) b!61998))

(declare-fun m!98019 () Bool)

(assert (=> b!62000 m!98019))

(assert (=> b!61999 m!97637))

(declare-fun m!98021 () Bool)

(assert (=> b!61999 m!98021))

(declare-fun m!98023 () Bool)

(assert (=> b!61999 m!98023))

(declare-fun m!98025 () Bool)

(assert (=> b!62001 m!98025))

(declare-fun m!98027 () Bool)

(assert (=> d!19112 m!98027))

(assert (=> d!19112 m!97953))

(assert (=> d!19112 m!97633))

(declare-fun m!98029 () Bool)

(assert (=> d!19112 m!98029))

(assert (=> d!19112 m!97667))

(declare-fun m!98031 () Bool)

(assert (=> d!19112 m!98031))

(assert (=> d!19112 m!97635))

(declare-fun m!98033 () Bool)

(assert (=> d!19112 m!98033))

(assert (=> d!19112 m!97951))

(declare-fun m!98035 () Bool)

(assert (=> d!19112 m!98035))

(declare-fun m!98037 () Bool)

(assert (=> d!19112 m!98037))

(declare-fun m!98039 () Bool)

(assert (=> b!61998 m!98039))

(assert (=> b!61998 m!97697))

(assert (=> b!61998 m!97637))

(assert (=> b!61802 d!19112))

(declare-fun d!19114 () Bool)

(assert (=> d!19114 (isPrefixOf!0 thiss!1379 (_2!2911 lt!96826))))

(declare-fun lt!97249 () Unit!4209)

(declare-fun choose!30 (BitStream!2214 BitStream!2214 BitStream!2214) Unit!4209)

(assert (=> d!19114 (= lt!97249 (choose!30 thiss!1379 (_2!2911 lt!96821) (_2!2911 lt!96826)))))

(assert (=> d!19114 (isPrefixOf!0 thiss!1379 (_2!2911 lt!96821))))

(assert (=> d!19114 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2911 lt!96821) (_2!2911 lt!96826)) lt!97249)))

(declare-fun bs!4761 () Bool)

(assert (= bs!4761 d!19114))

(assert (=> bs!4761 m!97643))

(declare-fun m!98041 () Bool)

(assert (=> bs!4761 m!98041))

(assert (=> bs!4761 m!97667))

(assert (=> b!61802 d!19114))

(declare-fun d!19116 () Bool)

(declare-fun res!51635 () Bool)

(declare-fun e!41248 () Bool)

(assert (=> d!19116 (=> (not res!51635) (not e!41248))))

(assert (=> d!19116 (= res!51635 (= (size!1269 (buf!1650 (_2!2911 lt!96821))) (size!1269 (buf!1650 (_2!2911 lt!96826)))))))

(assert (=> d!19116 (= (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!96826)) e!41248)))

(declare-fun b!62009 () Bool)

(declare-fun res!51633 () Bool)

(assert (=> b!62009 (=> (not res!51633) (not e!41248))))

(assert (=> b!62009 (= res!51633 (bvsle (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826)))))))

(declare-fun b!62010 () Bool)

(declare-fun e!41247 () Bool)

(assert (=> b!62010 (= e!41248 e!41247)))

(declare-fun res!51634 () Bool)

(assert (=> b!62010 (=> res!51634 e!41247)))

(assert (=> b!62010 (= res!51634 (= (size!1269 (buf!1650 (_2!2911 lt!96821))) #b00000000000000000000000000000000))))

(declare-fun b!62011 () Bool)

(assert (=> b!62011 (= e!41247 (arrayBitRangesEq!0 (buf!1650 (_2!2911 lt!96821)) (buf!1650 (_2!2911 lt!96826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821)))))))

(assert (= (and d!19116 res!51635) b!62009))

(assert (= (and b!62009 res!51633) b!62010))

(assert (= (and b!62010 (not res!51634)) b!62011))

(assert (=> b!62009 m!97697))

(assert (=> b!62009 m!97629))

(assert (=> b!62011 m!97697))

(assert (=> b!62011 m!97697))

(declare-fun m!98043 () Bool)

(assert (=> b!62011 m!98043))

(assert (=> b!61802 d!19116))

(declare-fun d!19118 () Bool)

(declare-fun res!51638 () Bool)

(declare-fun e!41250 () Bool)

(assert (=> d!19118 (=> (not res!51638) (not e!41250))))

(assert (=> d!19118 (= res!51638 (= (size!1269 (buf!1650 thiss!1379)) (size!1269 (buf!1650 (_2!2911 lt!96826)))))))

(assert (=> d!19118 (= (isPrefixOf!0 thiss!1379 (_2!2911 lt!96826)) e!41250)))

(declare-fun b!62012 () Bool)

(declare-fun res!51636 () Bool)

(assert (=> b!62012 (=> (not res!51636) (not e!41250))))

(assert (=> b!62012 (= res!51636 (bvsle (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826)))))))

(declare-fun b!62013 () Bool)

(declare-fun e!41249 () Bool)

(assert (=> b!62013 (= e!41250 e!41249)))

(declare-fun res!51637 () Bool)

(assert (=> b!62013 (=> res!51637 e!41249)))

(assert (=> b!62013 (= res!51637 (= (size!1269 (buf!1650 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62014 () Bool)

(assert (=> b!62014 (= e!41249 (arrayBitRangesEq!0 (buf!1650 thiss!1379) (buf!1650 (_2!2911 lt!96826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379))))))

(assert (= (and d!19118 res!51638) b!62012))

(assert (= (and b!62012 res!51636) b!62013))

(assert (= (and b!62013 (not res!51637)) b!62014))

(assert (=> b!62012 m!97637))

(assert (=> b!62012 m!97629))

(assert (=> b!62014 m!97637))

(assert (=> b!62014 m!97637))

(declare-fun m!98045 () Bool)

(assert (=> b!62014 m!98045))

(assert (=> b!61802 d!19118))

(declare-fun d!19120 () Bool)

(assert (=> d!19120 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97252 () Unit!4209)

(declare-fun choose!9 (BitStream!2214 array!2781 (_ BitVec 64) BitStream!2214) Unit!4209)

(assert (=> d!19120 (= lt!97252 (choose!9 thiss!1379 (buf!1650 (_2!2911 lt!96821)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2215 (buf!1650 (_2!2911 lt!96821)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379))))))

(assert (=> d!19120 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1650 (_2!2911 lt!96821)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97252)))

(declare-fun bs!4762 () Bool)

(assert (= bs!4762 d!19120))

(assert (=> bs!4762 m!97639))

(declare-fun m!98047 () Bool)

(assert (=> bs!4762 m!98047))

(assert (=> b!61802 d!19120))

(declare-fun d!19122 () Bool)

(assert (=> d!19122 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4763 () Bool)

(assert (= bs!4763 d!19122))

(declare-fun m!98049 () Bool)

(assert (=> bs!4763 m!98049))

(assert (=> b!61802 d!19122))

(declare-fun d!19124 () Bool)

(declare-fun e!41251 () Bool)

(assert (=> d!19124 e!41251))

(declare-fun res!51640 () Bool)

(assert (=> d!19124 (=> (not res!51640) (not e!41251))))

(declare-fun lt!97258 () (_ BitVec 64))

(declare-fun lt!97256 () (_ BitVec 64))

(declare-fun lt!97255 () (_ BitVec 64))

(assert (=> d!19124 (= res!51640 (= lt!97255 (bvsub lt!97256 lt!97258)))))

(assert (=> d!19124 (or (= (bvand lt!97256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97258 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97256 lt!97258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19124 (= lt!97258 (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821)))))))

(declare-fun lt!97257 () (_ BitVec 64))

(declare-fun lt!97253 () (_ BitVec 64))

(assert (=> d!19124 (= lt!97256 (bvmul lt!97257 lt!97253))))

(assert (=> d!19124 (or (= lt!97257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97253 (bvsdiv (bvmul lt!97257 lt!97253) lt!97257)))))

(assert (=> d!19124 (= lt!97253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19124 (= lt!97257 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))))))

(assert (=> d!19124 (= lt!97255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821)))))))

(assert (=> d!19124 (invariant!0 (currentBit!3275 (_2!2911 lt!96821)) (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96821))))))

(assert (=> d!19124 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))) lt!97255)))

(declare-fun b!62015 () Bool)

(declare-fun res!51639 () Bool)

(assert (=> b!62015 (=> (not res!51639) (not e!41251))))

(assert (=> b!62015 (= res!51639 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97255))))

(declare-fun b!62016 () Bool)

(declare-fun lt!97254 () (_ BitVec 64))

(assert (=> b!62016 (= e!41251 (bvsle lt!97255 (bvmul lt!97254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62016 (or (= lt!97254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97254)))))

(assert (=> b!62016 (= lt!97254 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))))))

(assert (= (and d!19124 res!51640) b!62015))

(assert (= (and b!62015 res!51639) b!62016))

(declare-fun m!98051 () Bool)

(assert (=> d!19124 m!98051))

(assert (=> d!19124 m!97653))

(assert (=> b!61812 d!19124))

(declare-fun d!19126 () Bool)

(assert (=> d!19126 (= (head!501 (byteArrayBitContentToList!0 (_2!2911 lt!96821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!797 (byteArrayBitContentToList!0 (_2!2911 lt!96821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61811 d!19126))

(declare-fun d!19128 () Bool)

(declare-fun c!4374 () Bool)

(assert (=> d!19128 (= c!4374 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41254 () List!682)

(assert (=> d!19128 (= (byteArrayBitContentToList!0 (_2!2911 lt!96821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41254)))

(declare-fun b!62021 () Bool)

(assert (=> b!62021 (= e!41254 Nil!679)))

(declare-fun b!62022 () Bool)

(assert (=> b!62022 (= e!41254 (Cons!678 (not (= (bvand ((_ sign_extend 24) (select (arr!1833 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2911 lt!96821) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19128 c!4374) b!62021))

(assert (= (and d!19128 (not c!4374)) b!62022))

(assert (=> b!62022 m!97665))

(declare-fun m!98053 () Bool)

(assert (=> b!62022 m!98053))

(declare-fun m!98055 () Bool)

(assert (=> b!62022 m!98055))

(assert (=> b!61811 d!19128))

(declare-fun d!19130 () Bool)

(assert (=> d!19130 (= (head!501 (bitStreamReadBitsIntoList!0 (_2!2911 lt!96821) (_1!2910 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!797 (bitStreamReadBitsIntoList!0 (_2!2911 lt!96821) (_1!2910 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61811 d!19130))

(declare-fun b!62031 () Bool)

(declare-datatypes ((tuple2!5608 0))(
  ( (tuple2!5609 (_1!2915 List!682) (_2!2915 BitStream!2214)) )
))
(declare-fun e!41260 () tuple2!5608)

(assert (=> b!62031 (= e!41260 (tuple2!5609 Nil!679 (_1!2910 lt!96817)))))

(declare-fun b!62032 () Bool)

(declare-datatypes ((tuple2!5610 0))(
  ( (tuple2!5611 (_1!2916 Bool) (_2!2916 BitStream!2214)) )
))
(declare-fun lt!97265 () tuple2!5610)

(declare-fun lt!97267 () (_ BitVec 64))

(assert (=> b!62032 (= e!41260 (tuple2!5609 (Cons!678 (_1!2916 lt!97265) (bitStreamReadBitsIntoList!0 (_2!2911 lt!96821) (_2!2916 lt!97265) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!97267))) (_2!2916 lt!97265)))))

(declare-fun readBit!0 (BitStream!2214) tuple2!5610)

(assert (=> b!62032 (= lt!97265 (readBit!0 (_1!2910 lt!96817)))))

(assert (=> b!62032 (= lt!97267 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62034 () Bool)

(declare-fun e!41259 () Bool)

(declare-fun lt!97266 () List!682)

(assert (=> b!62034 (= e!41259 (> (length!310 lt!97266) 0))))

(declare-fun b!62033 () Bool)

(declare-fun isEmpty!186 (List!682) Bool)

(assert (=> b!62033 (= e!41259 (isEmpty!186 lt!97266))))

(declare-fun d!19132 () Bool)

(assert (=> d!19132 e!41259))

(declare-fun c!4380 () Bool)

(assert (=> d!19132 (= c!4380 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19132 (= lt!97266 (_1!2915 e!41260))))

(declare-fun c!4379 () Bool)

(assert (=> d!19132 (= c!4379 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19132 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19132 (= (bitStreamReadBitsIntoList!0 (_2!2911 lt!96821) (_1!2910 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97266)))

(assert (= (and d!19132 c!4379) b!62031))

(assert (= (and d!19132 (not c!4379)) b!62032))

(assert (= (and d!19132 c!4380) b!62033))

(assert (= (and d!19132 (not c!4380)) b!62034))

(declare-fun m!98057 () Bool)

(assert (=> b!62032 m!98057))

(declare-fun m!98059 () Bool)

(assert (=> b!62032 m!98059))

(declare-fun m!98061 () Bool)

(assert (=> b!62034 m!98061))

(declare-fun m!98063 () Bool)

(assert (=> b!62033 m!98063))

(assert (=> b!61811 d!19132))

(declare-fun d!19134 () Bool)

(declare-fun res!51643 () Bool)

(declare-fun e!41262 () Bool)

(assert (=> d!19134 (=> (not res!51643) (not e!41262))))

(assert (=> d!19134 (= res!51643 (= (size!1269 (buf!1650 (_1!2910 lt!96814))) (size!1269 (buf!1650 (_2!2911 lt!96826)))))))

(assert (=> d!19134 (= (isPrefixOf!0 (_1!2910 lt!96814) (_2!2911 lt!96826)) e!41262)))

(declare-fun b!62035 () Bool)

(declare-fun res!51641 () Bool)

(assert (=> b!62035 (=> (not res!51641) (not e!41262))))

(assert (=> b!62035 (= res!51641 (bvsle (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96814))) (currentByte!3280 (_1!2910 lt!96814)) (currentBit!3275 (_1!2910 lt!96814))) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826)))))))

(declare-fun b!62036 () Bool)

(declare-fun e!41261 () Bool)

(assert (=> b!62036 (= e!41262 e!41261)))

(declare-fun res!51642 () Bool)

(assert (=> b!62036 (=> res!51642 e!41261)))

(assert (=> b!62036 (= res!51642 (= (size!1269 (buf!1650 (_1!2910 lt!96814))) #b00000000000000000000000000000000))))

(declare-fun b!62037 () Bool)

(assert (=> b!62037 (= e!41261 (arrayBitRangesEq!0 (buf!1650 (_1!2910 lt!96814)) (buf!1650 (_2!2911 lt!96826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96814))) (currentByte!3280 (_1!2910 lt!96814)) (currentBit!3275 (_1!2910 lt!96814)))))))

(assert (= (and d!19134 res!51643) b!62035))

(assert (= (and b!62035 res!51641) b!62036))

(assert (= (and b!62036 (not res!51642)) b!62037))

(declare-fun m!98065 () Bool)

(assert (=> b!62035 m!98065))

(assert (=> b!62035 m!97629))

(assert (=> b!62037 m!98065))

(assert (=> b!62037 m!98065))

(declare-fun m!98067 () Bool)

(assert (=> b!62037 m!98067))

(assert (=> b!61810 d!19134))

(declare-fun d!19136 () Bool)

(declare-fun res!51646 () Bool)

(declare-fun e!41264 () Bool)

(assert (=> d!19136 (=> (not res!51646) (not e!41264))))

(assert (=> d!19136 (= res!51646 (= (size!1269 (buf!1650 thiss!1379)) (size!1269 (buf!1650 (_2!2911 lt!96821)))))))

(assert (=> d!19136 (= (isPrefixOf!0 thiss!1379 (_2!2911 lt!96821)) e!41264)))

(declare-fun b!62038 () Bool)

(declare-fun res!51644 () Bool)

(assert (=> b!62038 (=> (not res!51644) (not e!41264))))

(assert (=> b!62038 (= res!51644 (bvsle (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821)))))))

(declare-fun b!62039 () Bool)

(declare-fun e!41263 () Bool)

(assert (=> b!62039 (= e!41264 e!41263)))

(declare-fun res!51645 () Bool)

(assert (=> b!62039 (=> res!51645 e!41263)))

(assert (=> b!62039 (= res!51645 (= (size!1269 (buf!1650 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62040 () Bool)

(assert (=> b!62040 (= e!41263 (arrayBitRangesEq!0 (buf!1650 thiss!1379) (buf!1650 (_2!2911 lt!96821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379))))))

(assert (= (and d!19136 res!51646) b!62038))

(assert (= (and b!62038 res!51644) b!62039))

(assert (= (and b!62039 (not res!51645)) b!62040))

(assert (=> b!62038 m!97637))

(assert (=> b!62038 m!97697))

(assert (=> b!62040 m!97637))

(assert (=> b!62040 m!97637))

(declare-fun m!98069 () Bool)

(assert (=> b!62040 m!98069))

(assert (=> b!61799 d!19136))

(declare-fun d!19138 () Bool)

(assert (=> d!19138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!96813) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821)))) lt!96813))))

(declare-fun bs!4764 () Bool)

(assert (= bs!4764 d!19138))

(assert (=> bs!4764 m!98051))

(assert (=> b!61799 d!19138))

(declare-fun d!19140 () Bool)

(declare-fun e!41267 () Bool)

(assert (=> d!19140 e!41267))

(declare-fun res!51649 () Bool)

(assert (=> d!19140 (=> (not res!51649) (not e!41267))))

(assert (=> d!19140 (= res!51649 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!97270 () Unit!4209)

(declare-fun choose!27 (BitStream!2214 BitStream!2214 (_ BitVec 64) (_ BitVec 64)) Unit!4209)

(assert (=> d!19140 (= lt!97270 (choose!27 thiss!1379 (_2!2911 lt!96821) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19140 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19140 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2911 lt!96821) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97270)))

(declare-fun b!62043 () Bool)

(assert (=> b!62043 (= e!41267 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96821)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19140 res!51649) b!62043))

(declare-fun m!98071 () Bool)

(assert (=> d!19140 m!98071))

(declare-fun m!98073 () Bool)

(assert (=> b!62043 m!98073))

(assert (=> b!61799 d!19140))

(declare-fun b!62061 () Bool)

(declare-fun res!51673 () Bool)

(declare-fun e!41278 () Bool)

(assert (=> b!62061 (=> (not res!51673) (not e!41278))))

(declare-fun lt!97297 () tuple2!5600)

(assert (=> b!62061 (= res!51673 (isPrefixOf!0 thiss!1379 (_2!2911 lt!97297)))))

(declare-fun b!62062 () Bool)

(declare-fun e!41277 () Bool)

(declare-datatypes ((tuple2!5612 0))(
  ( (tuple2!5613 (_1!2917 BitStream!2214) (_2!2917 Bool)) )
))
(declare-fun lt!97295 () tuple2!5612)

(assert (=> b!62062 (= e!41277 (= (bitIndex!0 (size!1269 (buf!1650 (_1!2917 lt!97295))) (currentByte!3280 (_1!2917 lt!97295)) (currentBit!3275 (_1!2917 lt!97295))) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97297))) (currentByte!3280 (_2!2911 lt!97297)) (currentBit!3275 (_2!2911 lt!97297)))))))

(declare-fun b!62063 () Bool)

(assert (=> b!62063 (= e!41278 e!41277)))

(declare-fun res!51670 () Bool)

(assert (=> b!62063 (=> (not res!51670) (not e!41277))))

(declare-fun lt!97300 () Bool)

(assert (=> b!62063 (= res!51670 (and (= (_2!2917 lt!97295) lt!97300) (= (_1!2917 lt!97295) (_2!2911 lt!97297))))))

(declare-fun readBitPure!0 (BitStream!2214) tuple2!5612)

(declare-fun readerFrom!0 (BitStream!2214 (_ BitVec 32) (_ BitVec 32)) BitStream!2214)

(assert (=> b!62063 (= lt!97295 (readBitPure!0 (readerFrom!0 (_2!2911 lt!97297) (currentBit!3275 thiss!1379) (currentByte!3280 thiss!1379))))))

(declare-fun b!62064 () Bool)

(declare-fun res!51669 () Bool)

(declare-fun e!41279 () Bool)

(assert (=> b!62064 (=> (not res!51669) (not e!41279))))

(declare-fun lt!97303 () (_ BitVec 64))

(declare-fun lt!97296 () tuple2!5600)

(declare-fun lt!97298 () (_ BitVec 64))

(assert (=> b!62064 (= res!51669 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97296))) (currentByte!3280 (_2!2911 lt!97296)) (currentBit!3275 (_2!2911 lt!97296))) (bvadd lt!97303 lt!97298)))))

(assert (=> b!62064 (or (not (= (bvand lt!97303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97298 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!97303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!97303 lt!97298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62064 (= lt!97298 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!62064 (= lt!97303 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(declare-fun d!19142 () Bool)

(assert (=> d!19142 e!41279))

(declare-fun res!51668 () Bool)

(assert (=> d!19142 (=> (not res!51668) (not e!41279))))

(assert (=> d!19142 (= res!51668 (= (size!1269 (buf!1650 (_2!2911 lt!97296))) (size!1269 (buf!1650 thiss!1379))))))

(declare-fun lt!97302 () (_ BitVec 8))

(declare-fun lt!97304 () array!2781)

(assert (=> d!19142 (= lt!97302 (select (arr!1833 lt!97304) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19142 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1269 lt!97304)))))

(assert (=> d!19142 (= lt!97304 (array!2782 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!97305 () tuple2!5600)

(assert (=> d!19142 (= lt!97296 (tuple2!5601 (_1!2911 lt!97305) (_2!2911 lt!97305)))))

(assert (=> d!19142 (= lt!97305 lt!97297)))

(assert (=> d!19142 e!41278))

(declare-fun res!51667 () Bool)

(assert (=> d!19142 (=> (not res!51667) (not e!41278))))

(assert (=> d!19142 (= res!51667 (= (size!1269 (buf!1650 thiss!1379)) (size!1269 (buf!1650 (_2!2911 lt!97297)))))))

(declare-fun appendBit!0 (BitStream!2214 Bool) tuple2!5600)

(assert (=> d!19142 (= lt!97297 (appendBit!0 thiss!1379 lt!97300))))

(assert (=> d!19142 (= lt!97300 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1833 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19142 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19142 (= (appendBitFromByte!0 thiss!1379 (select (arr!1833 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!97296)))

(declare-fun b!62065 () Bool)

(declare-fun e!41276 () Bool)

(declare-fun lt!97301 () tuple2!5612)

(assert (=> b!62065 (= e!41276 (= (bitIndex!0 (size!1269 (buf!1650 (_1!2917 lt!97301))) (currentByte!3280 (_1!2917 lt!97301)) (currentBit!3275 (_1!2917 lt!97301))) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97296))) (currentByte!3280 (_2!2911 lt!97296)) (currentBit!3275 (_2!2911 lt!97296)))))))

(declare-fun b!62066 () Bool)

(declare-fun res!51671 () Bool)

(assert (=> b!62066 (=> (not res!51671) (not e!41278))))

(assert (=> b!62066 (= res!51671 (= (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!97297))) (currentByte!3280 (_2!2911 lt!97297)) (currentBit!3275 (_2!2911 lt!97297))) (bvadd (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62067 () Bool)

(assert (=> b!62067 (= e!41279 e!41276)))

(declare-fun res!51672 () Bool)

(assert (=> b!62067 (=> (not res!51672) (not e!41276))))

(assert (=> b!62067 (= res!51672 (and (= (_2!2917 lt!97301) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1833 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!97302)) #b00000000000000000000000000000000))) (= (_1!2917 lt!97301) (_2!2911 lt!97296))))))

(declare-fun lt!97299 () tuple2!5606)

(declare-fun lt!97306 () BitStream!2214)

(assert (=> b!62067 (= lt!97299 (readBits!0 lt!97306 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62067 (= lt!97301 (readBitPure!0 lt!97306))))

(assert (=> b!62067 (= lt!97306 (readerFrom!0 (_2!2911 lt!97296) (currentBit!3275 thiss!1379) (currentByte!3280 thiss!1379)))))

(declare-fun b!62068 () Bool)

(declare-fun res!51666 () Bool)

(assert (=> b!62068 (=> (not res!51666) (not e!41279))))

(assert (=> b!62068 (= res!51666 (isPrefixOf!0 thiss!1379 (_2!2911 lt!97296)))))

(assert (= (and d!19142 res!51667) b!62066))

(assert (= (and b!62066 res!51671) b!62061))

(assert (= (and b!62061 res!51673) b!62063))

(assert (= (and b!62063 res!51670) b!62062))

(assert (= (and d!19142 res!51668) b!62064))

(assert (= (and b!62064 res!51669) b!62068))

(assert (= (and b!62068 res!51666) b!62067))

(assert (= (and b!62067 res!51672) b!62065))

(declare-fun m!98075 () Bool)

(assert (=> b!62066 m!98075))

(assert (=> b!62066 m!97637))

(declare-fun m!98077 () Bool)

(assert (=> b!62063 m!98077))

(assert (=> b!62063 m!98077))

(declare-fun m!98079 () Bool)

(assert (=> b!62063 m!98079))

(declare-fun m!98081 () Bool)

(assert (=> b!62062 m!98081))

(assert (=> b!62062 m!98075))

(declare-fun m!98083 () Bool)

(assert (=> b!62065 m!98083))

(declare-fun m!98085 () Bool)

(assert (=> b!62065 m!98085))

(declare-fun m!98087 () Bool)

(assert (=> b!62061 m!98087))

(declare-fun m!98089 () Bool)

(assert (=> d!19142 m!98089))

(declare-fun m!98091 () Bool)

(assert (=> d!19142 m!98091))

(assert (=> d!19142 m!98053))

(declare-fun m!98093 () Bool)

(assert (=> b!62068 m!98093))

(assert (=> b!62064 m!98085))

(assert (=> b!62064 m!97637))

(declare-fun m!98095 () Bool)

(assert (=> b!62067 m!98095))

(declare-fun m!98097 () Bool)

(assert (=> b!62067 m!98097))

(declare-fun m!98099 () Bool)

(assert (=> b!62067 m!98099))

(assert (=> b!61799 d!19142))

(declare-fun d!19144 () Bool)

(assert (=> d!19144 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 thiss!1379))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 thiss!1379))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4765 () Bool)

(assert (= bs!4765 d!19144))

(declare-fun m!98101 () Bool)

(assert (=> bs!4765 m!98101))

(assert (=> b!61809 d!19144))

(declare-fun d!19146 () Bool)

(declare-fun res!51676 () Bool)

(declare-fun e!41281 () Bool)

(assert (=> d!19146 (=> (not res!51676) (not e!41281))))

(assert (=> d!19146 (= res!51676 (= (size!1269 (buf!1650 thiss!1379)) (size!1269 (buf!1650 thiss!1379))))))

(assert (=> d!19146 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41281)))

(declare-fun b!62069 () Bool)

(declare-fun res!51674 () Bool)

(assert (=> b!62069 (=> (not res!51674) (not e!41281))))

(assert (=> b!62069 (= res!51674 (bvsle (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)) (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379))))))

(declare-fun b!62070 () Bool)

(declare-fun e!41280 () Bool)

(assert (=> b!62070 (= e!41281 e!41280)))

(declare-fun res!51675 () Bool)

(assert (=> b!62070 (=> res!51675 e!41280)))

(assert (=> b!62070 (= res!51675 (= (size!1269 (buf!1650 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62071 () Bool)

(assert (=> b!62071 (= e!41280 (arrayBitRangesEq!0 (buf!1650 thiss!1379) (buf!1650 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379))))))

(assert (= (and d!19146 res!51676) b!62069))

(assert (= (and b!62069 res!51674) b!62070))

(assert (= (and b!62070 (not res!51675)) b!62071))

(assert (=> b!62069 m!97637))

(assert (=> b!62069 m!97637))

(assert (=> b!62071 m!97637))

(assert (=> b!62071 m!97637))

(declare-fun m!98103 () Bool)

(assert (=> b!62071 m!98103))

(assert (=> b!61798 d!19146))

(declare-fun d!19148 () Bool)

(assert (=> d!19148 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!97309 () Unit!4209)

(declare-fun choose!11 (BitStream!2214) Unit!4209)

(assert (=> d!19148 (= lt!97309 (choose!11 thiss!1379))))

(assert (=> d!19148 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!97309)))

(declare-fun bs!4767 () Bool)

(assert (= bs!4767 d!19148))

(assert (=> bs!4767 m!97633))

(declare-fun m!98105 () Bool)

(assert (=> bs!4767 m!98105))

(assert (=> b!61798 d!19148))

(declare-fun d!19150 () Bool)

(declare-fun e!41282 () Bool)

(assert (=> d!19150 e!41282))

(declare-fun res!51678 () Bool)

(assert (=> d!19150 (=> (not res!51678) (not e!41282))))

(declare-fun lt!97312 () (_ BitVec 64))

(declare-fun lt!97313 () (_ BitVec 64))

(declare-fun lt!97315 () (_ BitVec 64))

(assert (=> d!19150 (= res!51678 (= lt!97312 (bvsub lt!97313 lt!97315)))))

(assert (=> d!19150 (or (= (bvand lt!97313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97313 lt!97315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19150 (= lt!97315 (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 thiss!1379))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379))))))

(declare-fun lt!97314 () (_ BitVec 64))

(declare-fun lt!97310 () (_ BitVec 64))

(assert (=> d!19150 (= lt!97313 (bvmul lt!97314 lt!97310))))

(assert (=> d!19150 (or (= lt!97314 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97310 (bvsdiv (bvmul lt!97314 lt!97310) lt!97314)))))

(assert (=> d!19150 (= lt!97310 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19150 (= lt!97314 ((_ sign_extend 32) (size!1269 (buf!1650 thiss!1379))))))

(assert (=> d!19150 (= lt!97312 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3275 thiss!1379))))))

(assert (=> d!19150 (invariant!0 (currentBit!3275 thiss!1379) (currentByte!3280 thiss!1379) (size!1269 (buf!1650 thiss!1379)))))

(assert (=> d!19150 (= (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)) lt!97312)))

(declare-fun b!62072 () Bool)

(declare-fun res!51677 () Bool)

(assert (=> b!62072 (=> (not res!51677) (not e!41282))))

(assert (=> b!62072 (= res!51677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97312))))

(declare-fun b!62073 () Bool)

(declare-fun lt!97311 () (_ BitVec 64))

(assert (=> b!62073 (= e!41282 (bvsle lt!97312 (bvmul lt!97311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62073 (or (= lt!97311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97311)))))

(assert (=> b!62073 (= lt!97311 ((_ sign_extend 32) (size!1269 (buf!1650 thiss!1379))))))

(assert (= (and d!19150 res!51678) b!62072))

(assert (= (and b!62072 res!51677) b!62073))

(assert (=> d!19150 m!98101))

(declare-fun m!98107 () Bool)

(assert (=> d!19150 m!98107))

(assert (=> b!61798 d!19150))

(declare-fun d!19152 () Bool)

(assert (=> d!19152 (= (invariant!0 (currentBit!3275 (_2!2911 lt!96821)) (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96826)))) (and (bvsge (currentBit!3275 (_2!2911 lt!96821)) #b00000000000000000000000000000000) (bvslt (currentBit!3275 (_2!2911 lt!96821)) #b00000000000000000000000000001000) (bvsge (currentByte!3280 (_2!2911 lt!96821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96826)))) (and (= (currentBit!3275 (_2!2911 lt!96821)) #b00000000000000000000000000000000) (= (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96826))))))))))

(assert (=> b!61808 d!19152))

(declare-fun d!19154 () Bool)

(declare-fun res!51681 () Bool)

(declare-fun e!41284 () Bool)

(assert (=> d!19154 (=> (not res!51681) (not e!41284))))

(assert (=> d!19154 (= res!51681 (= (size!1269 (buf!1650 (_1!2910 lt!96822))) (size!1269 (buf!1650 (_1!2910 lt!96814)))))))

(assert (=> d!19154 (= (isPrefixOf!0 (_1!2910 lt!96822) (_1!2910 lt!96814)) e!41284)))

(declare-fun b!62074 () Bool)

(declare-fun res!51679 () Bool)

(assert (=> b!62074 (=> (not res!51679) (not e!41284))))

(assert (=> b!62074 (= res!51679 (bvsle (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96822))) (currentByte!3280 (_1!2910 lt!96822)) (currentBit!3275 (_1!2910 lt!96822))) (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96814))) (currentByte!3280 (_1!2910 lt!96814)) (currentBit!3275 (_1!2910 lt!96814)))))))

(declare-fun b!62075 () Bool)

(declare-fun e!41283 () Bool)

(assert (=> b!62075 (= e!41284 e!41283)))

(declare-fun res!51680 () Bool)

(assert (=> b!62075 (=> res!51680 e!41283)))

(assert (=> b!62075 (= res!51680 (= (size!1269 (buf!1650 (_1!2910 lt!96822))) #b00000000000000000000000000000000))))

(declare-fun b!62076 () Bool)

(assert (=> b!62076 (= e!41283 (arrayBitRangesEq!0 (buf!1650 (_1!2910 lt!96822)) (buf!1650 (_1!2910 lt!96814)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96822))) (currentByte!3280 (_1!2910 lt!96822)) (currentBit!3275 (_1!2910 lt!96822)))))))

(assert (= (and d!19154 res!51681) b!62074))

(assert (= (and b!62074 res!51679) b!62075))

(assert (= (and b!62075 (not res!51680)) b!62076))

(declare-fun m!98109 () Bool)

(assert (=> b!62074 m!98109))

(assert (=> b!62074 m!98065))

(assert (=> b!62076 m!98109))

(assert (=> b!62076 m!98109))

(declare-fun m!98111 () Bool)

(assert (=> b!62076 m!98111))

(assert (=> b!61797 d!19154))

(declare-fun d!19156 () Bool)

(assert (=> d!19156 (= (invariant!0 (currentBit!3275 (_2!2911 lt!96821)) (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96821)))) (and (bvsge (currentBit!3275 (_2!2911 lt!96821)) #b00000000000000000000000000000000) (bvslt (currentBit!3275 (_2!2911 lt!96821)) #b00000000000000000000000000001000) (bvsge (currentByte!3280 (_2!2911 lt!96821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96821)))) (and (= (currentBit!3275 (_2!2911 lt!96821)) #b00000000000000000000000000000000) (= (currentByte!3280 (_2!2911 lt!96821)) (size!1269 (buf!1650 (_2!2911 lt!96821))))))))))

(assert (=> b!61807 d!19156))

(declare-fun d!19158 () Bool)

(assert (=> d!19158 (= (array_inv!1166 (buf!1650 thiss!1379)) (bvsge (size!1269 (buf!1650 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!61796 d!19158))

(declare-fun d!19160 () Bool)

(assert (=> d!19160 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!97316 () Unit!4209)

(assert (=> d!19160 (= lt!97316 (choose!9 thiss!1379 (buf!1650 (_2!2911 lt!96826)) (bvsub to!314 i!635) (BitStream!2215 (buf!1650 (_2!2911 lt!96826)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379))))))

(assert (=> d!19160 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1650 (_2!2911 lt!96826)) (bvsub to!314 i!635)) lt!97316)))

(declare-fun bs!4768 () Bool)

(assert (= bs!4768 d!19160))

(assert (=> bs!4768 m!97685))

(declare-fun m!98113 () Bool)

(assert (=> bs!4768 m!98113))

(assert (=> b!61806 d!19160))

(declare-fun b!62077 () Bool)

(declare-fun e!41286 () tuple2!5608)

(assert (=> b!62077 (= e!41286 (tuple2!5609 Nil!679 (_1!2910 lt!96822)))))

(declare-fun lt!97317 () tuple2!5610)

(declare-fun b!62078 () Bool)

(declare-fun lt!97319 () (_ BitVec 64))

(assert (=> b!62078 (= e!41286 (tuple2!5609 (Cons!678 (_1!2916 lt!97317) (bitStreamReadBitsIntoList!0 (_2!2911 lt!96826) (_2!2916 lt!97317) (bvsub (bvsub to!314 i!635) lt!97319))) (_2!2916 lt!97317)))))

(assert (=> b!62078 (= lt!97317 (readBit!0 (_1!2910 lt!96822)))))

(assert (=> b!62078 (= lt!97319 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62080 () Bool)

(declare-fun e!41285 () Bool)

(declare-fun lt!97318 () List!682)

(assert (=> b!62080 (= e!41285 (> (length!310 lt!97318) 0))))

(declare-fun b!62079 () Bool)

(assert (=> b!62079 (= e!41285 (isEmpty!186 lt!97318))))

(declare-fun d!19162 () Bool)

(assert (=> d!19162 e!41285))

(declare-fun c!4382 () Bool)

(assert (=> d!19162 (= c!4382 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19162 (= lt!97318 (_1!2915 e!41286))))

(declare-fun c!4381 () Bool)

(assert (=> d!19162 (= c!4381 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19162 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19162 (= (bitStreamReadBitsIntoList!0 (_2!2911 lt!96826) (_1!2910 lt!96822) (bvsub to!314 i!635)) lt!97318)))

(assert (= (and d!19162 c!4381) b!62077))

(assert (= (and d!19162 (not c!4381)) b!62078))

(assert (= (and d!19162 c!4382) b!62079))

(assert (= (and d!19162 (not c!4382)) b!62080))

(declare-fun m!98115 () Bool)

(assert (=> b!62078 m!98115))

(declare-fun m!98117 () Bool)

(assert (=> b!62078 m!98117))

(declare-fun m!98119 () Bool)

(assert (=> b!62080 m!98119))

(declare-fun m!98121 () Bool)

(assert (=> b!62079 m!98121))

(assert (=> b!61806 d!19162))

(declare-fun b!62081 () Bool)

(declare-fun e!41287 () Bool)

(declare-fun lt!97331 () tuple2!5598)

(declare-fun lt!97329 () (_ BitVec 64))

(declare-fun lt!97334 () (_ BitVec 64))

(assert (=> b!62081 (= e!41287 (= (_1!2910 lt!97331) (withMovedBitIndex!0 (_2!2910 lt!97331) (bvsub lt!97334 lt!97329))))))

(assert (=> b!62081 (or (= (bvand lt!97334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97334 lt!97329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62081 (= lt!97329 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826))))))

(assert (=> b!62081 (= lt!97334 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))))))

(declare-fun b!62082 () Bool)

(declare-fun e!41288 () Unit!4209)

(declare-fun lt!97320 () Unit!4209)

(assert (=> b!62082 (= e!41288 lt!97320)))

(declare-fun lt!97338 () (_ BitVec 64))

(assert (=> b!62082 (= lt!97338 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97333 () (_ BitVec 64))

(assert (=> b!62082 (= lt!97333 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96821))) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))))))

(assert (=> b!62082 (= lt!97320 (arrayBitRangesEqSymmetric!0 (buf!1650 (_2!2911 lt!96821)) (buf!1650 (_2!2911 lt!96826)) lt!97338 lt!97333))))

(assert (=> b!62082 (arrayBitRangesEq!0 (buf!1650 (_2!2911 lt!96826)) (buf!1650 (_2!2911 lt!96821)) lt!97338 lt!97333)))

(declare-fun b!62083 () Bool)

(declare-fun res!51682 () Bool)

(assert (=> b!62083 (=> (not res!51682) (not e!41287))))

(assert (=> b!62083 (= res!51682 (isPrefixOf!0 (_2!2910 lt!97331) (_2!2911 lt!96826)))))

(declare-fun b!62084 () Bool)

(declare-fun res!51684 () Bool)

(assert (=> b!62084 (=> (not res!51684) (not e!41287))))

(assert (=> b!62084 (= res!51684 (isPrefixOf!0 (_1!2910 lt!97331) (_2!2911 lt!96821)))))

(declare-fun d!19164 () Bool)

(assert (=> d!19164 e!41287))

(declare-fun res!51683 () Bool)

(assert (=> d!19164 (=> (not res!51683) (not e!41287))))

(assert (=> d!19164 (= res!51683 (isPrefixOf!0 (_1!2910 lt!97331) (_2!2910 lt!97331)))))

(declare-fun lt!97324 () BitStream!2214)

(assert (=> d!19164 (= lt!97331 (tuple2!5599 lt!97324 (_2!2911 lt!96826)))))

(declare-fun lt!97335 () Unit!4209)

(declare-fun lt!97330 () Unit!4209)

(assert (=> d!19164 (= lt!97335 lt!97330)))

(assert (=> d!19164 (isPrefixOf!0 lt!97324 (_2!2911 lt!96826))))

(assert (=> d!19164 (= lt!97330 (lemmaIsPrefixTransitive!0 lt!97324 (_2!2911 lt!96826) (_2!2911 lt!96826)))))

(declare-fun lt!97322 () Unit!4209)

(declare-fun lt!97337 () Unit!4209)

(assert (=> d!19164 (= lt!97322 lt!97337)))

(assert (=> d!19164 (isPrefixOf!0 lt!97324 (_2!2911 lt!96826))))

(assert (=> d!19164 (= lt!97337 (lemmaIsPrefixTransitive!0 lt!97324 (_2!2911 lt!96821) (_2!2911 lt!96826)))))

(declare-fun lt!97332 () Unit!4209)

(assert (=> d!19164 (= lt!97332 e!41288)))

(declare-fun c!4383 () Bool)

(assert (=> d!19164 (= c!4383 (not (= (size!1269 (buf!1650 (_2!2911 lt!96821))) #b00000000000000000000000000000000)))))

(declare-fun lt!97336 () Unit!4209)

(declare-fun lt!97326 () Unit!4209)

(assert (=> d!19164 (= lt!97336 lt!97326)))

(assert (=> d!19164 (isPrefixOf!0 (_2!2911 lt!96826) (_2!2911 lt!96826))))

(assert (=> d!19164 (= lt!97326 (lemmaIsPrefixRefl!0 (_2!2911 lt!96826)))))

(declare-fun lt!97328 () Unit!4209)

(declare-fun lt!97339 () Unit!4209)

(assert (=> d!19164 (= lt!97328 lt!97339)))

(assert (=> d!19164 (= lt!97339 (lemmaIsPrefixRefl!0 (_2!2911 lt!96826)))))

(declare-fun lt!97325 () Unit!4209)

(declare-fun lt!97321 () Unit!4209)

(assert (=> d!19164 (= lt!97325 lt!97321)))

(assert (=> d!19164 (isPrefixOf!0 lt!97324 lt!97324)))

(assert (=> d!19164 (= lt!97321 (lemmaIsPrefixRefl!0 lt!97324))))

(declare-fun lt!97323 () Unit!4209)

(declare-fun lt!97327 () Unit!4209)

(assert (=> d!19164 (= lt!97323 lt!97327)))

(assert (=> d!19164 (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!96821))))

(assert (=> d!19164 (= lt!97327 (lemmaIsPrefixRefl!0 (_2!2911 lt!96821)))))

(assert (=> d!19164 (= lt!97324 (BitStream!2215 (buf!1650 (_2!2911 lt!96826)) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821))))))

(assert (=> d!19164 (isPrefixOf!0 (_2!2911 lt!96821) (_2!2911 lt!96826))))

(assert (=> d!19164 (= (reader!0 (_2!2911 lt!96821) (_2!2911 lt!96826)) lt!97331)))

(declare-fun b!62085 () Bool)

(declare-fun Unit!4221 () Unit!4209)

(assert (=> b!62085 (= e!41288 Unit!4221)))

(assert (= (and d!19164 c!4383) b!62082))

(assert (= (and d!19164 (not c!4383)) b!62085))

(assert (= (and d!19164 res!51683) b!62084))

(assert (= (and b!62084 res!51684) b!62083))

(assert (= (and b!62083 res!51682) b!62081))

(declare-fun m!98123 () Bool)

(assert (=> b!62083 m!98123))

(assert (=> b!62082 m!97697))

(declare-fun m!98125 () Bool)

(assert (=> b!62082 m!98125))

(declare-fun m!98127 () Bool)

(assert (=> b!62082 m!98127))

(declare-fun m!98129 () Bool)

(assert (=> b!62084 m!98129))

(declare-fun m!98131 () Bool)

(assert (=> d!19164 m!98131))

(declare-fun m!98133 () Bool)

(assert (=> d!19164 m!98133))

(assert (=> d!19164 m!97951))

(declare-fun m!98135 () Bool)

(assert (=> d!19164 m!98135))

(assert (=> d!19164 m!97651))

(declare-fun m!98137 () Bool)

(assert (=> d!19164 m!98137))

(assert (=> d!19164 m!97953))

(declare-fun m!98139 () Bool)

(assert (=> d!19164 m!98139))

(declare-fun m!98141 () Bool)

(assert (=> d!19164 m!98141))

(declare-fun m!98143 () Bool)

(assert (=> d!19164 m!98143))

(declare-fun m!98145 () Bool)

(assert (=> d!19164 m!98145))

(declare-fun m!98147 () Bool)

(assert (=> b!62081 m!98147))

(assert (=> b!62081 m!97629))

(assert (=> b!62081 m!97697))

(assert (=> b!61806 d!19164))

(declare-fun lt!97351 () tuple2!5598)

(declare-fun lt!97354 () (_ BitVec 64))

(declare-fun b!62086 () Bool)

(declare-fun lt!97349 () (_ BitVec 64))

(declare-fun e!41289 () Bool)

(assert (=> b!62086 (= e!41289 (= (_1!2910 lt!97351) (withMovedBitIndex!0 (_2!2910 lt!97351) (bvsub lt!97354 lt!97349))))))

(assert (=> b!62086 (or (= (bvand lt!97354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97354 lt!97349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62086 (= lt!97349 (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826))))))

(assert (=> b!62086 (= lt!97354 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(declare-fun b!62087 () Bool)

(declare-fun e!41290 () Unit!4209)

(declare-fun lt!97340 () Unit!4209)

(assert (=> b!62087 (= e!41290 lt!97340)))

(declare-fun lt!97358 () (_ BitVec 64))

(assert (=> b!62087 (= lt!97358 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97353 () (_ BitVec 64))

(assert (=> b!62087 (= lt!97353 (bitIndex!0 (size!1269 (buf!1650 thiss!1379)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(assert (=> b!62087 (= lt!97340 (arrayBitRangesEqSymmetric!0 (buf!1650 thiss!1379) (buf!1650 (_2!2911 lt!96826)) lt!97358 lt!97353))))

(assert (=> b!62087 (arrayBitRangesEq!0 (buf!1650 (_2!2911 lt!96826)) (buf!1650 thiss!1379) lt!97358 lt!97353)))

(declare-fun b!62088 () Bool)

(declare-fun res!51685 () Bool)

(assert (=> b!62088 (=> (not res!51685) (not e!41289))))

(assert (=> b!62088 (= res!51685 (isPrefixOf!0 (_2!2910 lt!97351) (_2!2911 lt!96826)))))

(declare-fun b!62089 () Bool)

(declare-fun res!51687 () Bool)

(assert (=> b!62089 (=> (not res!51687) (not e!41289))))

(assert (=> b!62089 (= res!51687 (isPrefixOf!0 (_1!2910 lt!97351) thiss!1379))))

(declare-fun d!19166 () Bool)

(assert (=> d!19166 e!41289))

(declare-fun res!51686 () Bool)

(assert (=> d!19166 (=> (not res!51686) (not e!41289))))

(assert (=> d!19166 (= res!51686 (isPrefixOf!0 (_1!2910 lt!97351) (_2!2910 lt!97351)))))

(declare-fun lt!97344 () BitStream!2214)

(assert (=> d!19166 (= lt!97351 (tuple2!5599 lt!97344 (_2!2911 lt!96826)))))

(declare-fun lt!97355 () Unit!4209)

(declare-fun lt!97350 () Unit!4209)

(assert (=> d!19166 (= lt!97355 lt!97350)))

(assert (=> d!19166 (isPrefixOf!0 lt!97344 (_2!2911 lt!96826))))

(assert (=> d!19166 (= lt!97350 (lemmaIsPrefixTransitive!0 lt!97344 (_2!2911 lt!96826) (_2!2911 lt!96826)))))

(declare-fun lt!97342 () Unit!4209)

(declare-fun lt!97357 () Unit!4209)

(assert (=> d!19166 (= lt!97342 lt!97357)))

(assert (=> d!19166 (isPrefixOf!0 lt!97344 (_2!2911 lt!96826))))

(assert (=> d!19166 (= lt!97357 (lemmaIsPrefixTransitive!0 lt!97344 thiss!1379 (_2!2911 lt!96826)))))

(declare-fun lt!97352 () Unit!4209)

(assert (=> d!19166 (= lt!97352 e!41290)))

(declare-fun c!4384 () Bool)

(assert (=> d!19166 (= c!4384 (not (= (size!1269 (buf!1650 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!97356 () Unit!4209)

(declare-fun lt!97346 () Unit!4209)

(assert (=> d!19166 (= lt!97356 lt!97346)))

(assert (=> d!19166 (isPrefixOf!0 (_2!2911 lt!96826) (_2!2911 lt!96826))))

(assert (=> d!19166 (= lt!97346 (lemmaIsPrefixRefl!0 (_2!2911 lt!96826)))))

(declare-fun lt!97348 () Unit!4209)

(declare-fun lt!97359 () Unit!4209)

(assert (=> d!19166 (= lt!97348 lt!97359)))

(assert (=> d!19166 (= lt!97359 (lemmaIsPrefixRefl!0 (_2!2911 lt!96826)))))

(declare-fun lt!97345 () Unit!4209)

(declare-fun lt!97341 () Unit!4209)

(assert (=> d!19166 (= lt!97345 lt!97341)))

(assert (=> d!19166 (isPrefixOf!0 lt!97344 lt!97344)))

(assert (=> d!19166 (= lt!97341 (lemmaIsPrefixRefl!0 lt!97344))))

(declare-fun lt!97343 () Unit!4209)

(declare-fun lt!97347 () Unit!4209)

(assert (=> d!19166 (= lt!97343 lt!97347)))

(assert (=> d!19166 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19166 (= lt!97347 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19166 (= lt!97344 (BitStream!2215 (buf!1650 (_2!2911 lt!96826)) (currentByte!3280 thiss!1379) (currentBit!3275 thiss!1379)))))

(assert (=> d!19166 (isPrefixOf!0 thiss!1379 (_2!2911 lt!96826))))

(assert (=> d!19166 (= (reader!0 thiss!1379 (_2!2911 lt!96826)) lt!97351)))

(declare-fun b!62090 () Bool)

(declare-fun Unit!4222 () Unit!4209)

(assert (=> b!62090 (= e!41290 Unit!4222)))

(assert (= (and d!19166 c!4384) b!62087))

(assert (= (and d!19166 (not c!4384)) b!62090))

(assert (= (and d!19166 res!51686) b!62089))

(assert (= (and b!62089 res!51687) b!62088))

(assert (= (and b!62088 res!51685) b!62086))

(declare-fun m!98149 () Bool)

(assert (=> b!62088 m!98149))

(assert (=> b!62087 m!97637))

(declare-fun m!98151 () Bool)

(assert (=> b!62087 m!98151))

(declare-fun m!98153 () Bool)

(assert (=> b!62087 m!98153))

(declare-fun m!98155 () Bool)

(assert (=> b!62089 m!98155))

(declare-fun m!98157 () Bool)

(assert (=> d!19166 m!98157))

(assert (=> d!19166 m!98133))

(assert (=> d!19166 m!97633))

(declare-fun m!98159 () Bool)

(assert (=> d!19166 m!98159))

(assert (=> d!19166 m!97643))

(declare-fun m!98161 () Bool)

(assert (=> d!19166 m!98161))

(assert (=> d!19166 m!97635))

(declare-fun m!98163 () Bool)

(assert (=> d!19166 m!98163))

(assert (=> d!19166 m!98141))

(declare-fun m!98165 () Bool)

(assert (=> d!19166 m!98165))

(declare-fun m!98167 () Bool)

(assert (=> d!19166 m!98167))

(declare-fun m!98169 () Bool)

(assert (=> b!62086 m!98169))

(assert (=> b!62086 m!97629))

(assert (=> b!62086 m!97637))

(assert (=> b!61806 d!19166))

(declare-fun d!19168 () Bool)

(assert (=> d!19168 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 thiss!1379)) ((_ sign_extend 32) (currentBit!3275 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4769 () Bool)

(assert (= bs!4769 d!19168))

(declare-fun m!98171 () Bool)

(assert (=> bs!4769 m!98171))

(assert (=> b!61806 d!19168))

(declare-fun b!62091 () Bool)

(declare-fun e!41292 () tuple2!5608)

(assert (=> b!62091 (= e!41292 (tuple2!5609 Nil!679 (_1!2910 lt!96814)))))

(declare-fun b!62092 () Bool)

(declare-fun lt!97362 () (_ BitVec 64))

(declare-fun lt!97360 () tuple2!5610)

(assert (=> b!62092 (= e!41292 (tuple2!5609 (Cons!678 (_1!2916 lt!97360) (bitStreamReadBitsIntoList!0 (_2!2911 lt!96826) (_2!2916 lt!97360) (bvsub lt!96813 lt!97362))) (_2!2916 lt!97360)))))

(assert (=> b!62092 (= lt!97360 (readBit!0 (_1!2910 lt!96814)))))

(assert (=> b!62092 (= lt!97362 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62094 () Bool)

(declare-fun e!41291 () Bool)

(declare-fun lt!97361 () List!682)

(assert (=> b!62094 (= e!41291 (> (length!310 lt!97361) 0))))

(declare-fun b!62093 () Bool)

(assert (=> b!62093 (= e!41291 (isEmpty!186 lt!97361))))

(declare-fun d!19170 () Bool)

(assert (=> d!19170 e!41291))

(declare-fun c!4386 () Bool)

(assert (=> d!19170 (= c!4386 (= lt!96813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19170 (= lt!97361 (_1!2915 e!41292))))

(declare-fun c!4385 () Bool)

(assert (=> d!19170 (= c!4385 (= lt!96813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19170 (bvsge lt!96813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19170 (= (bitStreamReadBitsIntoList!0 (_2!2911 lt!96826) (_1!2910 lt!96814) lt!96813) lt!97361)))

(assert (= (and d!19170 c!4385) b!62091))

(assert (= (and d!19170 (not c!4385)) b!62092))

(assert (= (and d!19170 c!4386) b!62093))

(assert (= (and d!19170 (not c!4386)) b!62094))

(declare-fun m!98173 () Bool)

(assert (=> b!62092 m!98173))

(declare-fun m!98175 () Bool)

(assert (=> b!62092 m!98175))

(declare-fun m!98177 () Bool)

(assert (=> b!62094 m!98177))

(declare-fun m!98179 () Bool)

(assert (=> b!62093 m!98179))

(assert (=> b!61806 d!19170))

(declare-fun d!19172 () Bool)

(assert (=> d!19172 (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!96813)))

(declare-fun lt!97363 () Unit!4209)

(assert (=> d!19172 (= lt!97363 (choose!9 (_2!2911 lt!96821) (buf!1650 (_2!2911 lt!96826)) lt!96813 (BitStream!2215 (buf!1650 (_2!2911 lt!96826)) (currentByte!3280 (_2!2911 lt!96821)) (currentBit!3275 (_2!2911 lt!96821)))))))

(assert (=> d!19172 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2911 lt!96821) (buf!1650 (_2!2911 lt!96826)) lt!96813) lt!97363)))

(declare-fun bs!4770 () Bool)

(assert (= bs!4770 d!19172))

(assert (=> bs!4770 m!97683))

(declare-fun m!98181 () Bool)

(assert (=> bs!4770 m!98181))

(assert (=> b!61806 d!19172))

(declare-fun d!19174 () Bool)

(assert (=> d!19174 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821))) lt!96813) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1269 (buf!1650 (_2!2911 lt!96826)))) ((_ sign_extend 32) (currentByte!3280 (_2!2911 lt!96821))) ((_ sign_extend 32) (currentBit!3275 (_2!2911 lt!96821)))) lt!96813))))

(declare-fun bs!4771 () Bool)

(assert (= bs!4771 d!19174))

(declare-fun m!98183 () Bool)

(assert (=> bs!4771 m!98183))

(assert (=> b!61806 d!19174))

(declare-fun d!19176 () Bool)

(assert (=> d!19176 (= (array_inv!1166 srcBuffer!2) (bvsge (size!1269 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12122 d!19176))

(declare-fun d!19178 () Bool)

(assert (=> d!19178 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3275 thiss!1379) (currentByte!3280 thiss!1379) (size!1269 (buf!1650 thiss!1379))))))

(declare-fun bs!4772 () Bool)

(assert (= bs!4772 d!19178))

(assert (=> bs!4772 m!98107))

(assert (=> start!12122 d!19178))

(declare-fun d!19180 () Bool)

(declare-fun res!51690 () Bool)

(declare-fun e!41294 () Bool)

(assert (=> d!19180 (=> (not res!51690) (not e!41294))))

(assert (=> d!19180 (= res!51690 (= (size!1269 (buf!1650 (_1!2910 lt!96822))) (size!1269 (buf!1650 (_2!2911 lt!96826)))))))

(assert (=> d!19180 (= (isPrefixOf!0 (_1!2910 lt!96822) (_2!2911 lt!96826)) e!41294)))

(declare-fun b!62095 () Bool)

(declare-fun res!51688 () Bool)

(assert (=> b!62095 (=> (not res!51688) (not e!41294))))

(assert (=> b!62095 (= res!51688 (bvsle (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96822))) (currentByte!3280 (_1!2910 lt!96822)) (currentBit!3275 (_1!2910 lt!96822))) (bitIndex!0 (size!1269 (buf!1650 (_2!2911 lt!96826))) (currentByte!3280 (_2!2911 lt!96826)) (currentBit!3275 (_2!2911 lt!96826)))))))

(declare-fun b!62096 () Bool)

(declare-fun e!41293 () Bool)

(assert (=> b!62096 (= e!41294 e!41293)))

(declare-fun res!51689 () Bool)

(assert (=> b!62096 (=> res!51689 e!41293)))

(assert (=> b!62096 (= res!51689 (= (size!1269 (buf!1650 (_1!2910 lt!96822))) #b00000000000000000000000000000000))))

(declare-fun b!62097 () Bool)

(assert (=> b!62097 (= e!41293 (arrayBitRangesEq!0 (buf!1650 (_1!2910 lt!96822)) (buf!1650 (_2!2911 lt!96826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1269 (buf!1650 (_1!2910 lt!96822))) (currentByte!3280 (_1!2910 lt!96822)) (currentBit!3275 (_1!2910 lt!96822)))))))

(assert (= (and d!19180 res!51690) b!62095))

(assert (= (and b!62095 res!51688) b!62096))

(assert (= (and b!62096 (not res!51689)) b!62097))

(assert (=> b!62095 m!98109))

(assert (=> b!62095 m!97629))

(assert (=> b!62097 m!98109))

(assert (=> b!62097 m!98109))

(declare-fun m!98185 () Bool)

(assert (=> b!62097 m!98185))

(assert (=> b!61805 d!19180))

(check-sat (not b!62074) (not d!19164) (not b!62071) (not b!62040) (not d!19142) (not d!19120) (not b!62076) (not b!62087) (not b!62079) (not b!62093) (not b!62037) (not b!62032) (not b!61986) (not b!62081) (not b!62078) (not b!62080) (not b!62067) (not d!19138) (not b!62097) (not b!61999) (not b!61987) (not d!19112) (not b!62000) (not b!62043) (not b!62009) (not b!61982) (not d!19140) (not b!62084) (not b!62088) (not b!62083) (not d!19124) (not b!62063) (not b!62092) (not b!62035) (not b!62089) (not b!62022) (not b!62011) (not d!19050) (not d!19172) (not d!19144) (not d!19046) (not d!19114) (not b!61983) (not d!19148) (not bm!781) (not d!19150) (not b!61981) (not b!62034) (not d!19166) (not b!61998) (not b!62086) (not b!62069) (not b!62064) (not b!62062) (not d!19168) (not b!62095) (not d!19178) (not b!62012) (not b!62014) (not d!19122) (not b!62001) (not b!61980) (not d!19160) (not d!19174) (not b!62094) (not b!62065) (not d!19052) (not b!62068) (not b!62033) (not b!62082) (not b!62066) (not b!62061) (not b!62038))
(check-sat)
