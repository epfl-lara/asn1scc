; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6904 () Bool)

(assert start!6904)

(declare-fun b!32938 () Bool)

(declare-fun e!21811 () Bool)

(declare-datatypes ((array!1840 0))(
  ( (array!1841 (arr!1287 (Array (_ BitVec 32) (_ BitVec 8))) (size!812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1416 0))(
  ( (BitStream!1417 (buf!1140 array!1840) (currentByte!2507 (_ BitVec 32)) (currentBit!2502 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1416)

(declare-fun array_inv!761 (array!1840) Bool)

(assert (=> b!32938 (= e!21811 (array_inv!761 (buf!1140 thiss!1379)))))

(declare-fun b!32939 () Bool)

(declare-fun e!21813 () Bool)

(assert (=> b!32939 (= e!21813 true)))

(declare-datatypes ((List!409 0))(
  ( (Nil!406) (Cons!405 (h!524 Bool) (t!1159 List!409)) )
))
(declare-fun lt!48633 () List!409)

(declare-fun lt!48626 () List!409)

(declare-fun tail!126 (List!409) List!409)

(assert (=> b!32939 (= lt!48633 (tail!126 lt!48626))))

(declare-datatypes ((tuple2!3362 0))(
  ( (tuple2!3363 (_1!1768 BitStream!1416) (_2!1768 BitStream!1416)) )
))
(declare-fun lt!48621 () tuple2!3362)

(declare-datatypes ((Unit!2479 0))(
  ( (Unit!2480) )
))
(declare-fun lt!48634 () Unit!2479)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!3364 0))(
  ( (tuple2!3365 (_1!1769 Unit!2479) (_2!1769 BitStream!1416)) )
))
(declare-fun lt!48629 () tuple2!3364)

(declare-fun lt!48631 () tuple2!3362)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1416 BitStream!1416 BitStream!1416 BitStream!1416 (_ BitVec 64) List!409) Unit!2479)

(assert (=> b!32939 (= lt!48634 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1769 lt!48629) (_2!1769 lt!48629) (_1!1768 lt!48631) (_1!1768 lt!48621) (bvsub to!314 i!635) lt!48626))))

(declare-fun res!28187 () Bool)

(declare-fun e!21807 () Bool)

(assert (=> start!6904 (=> (not res!28187) (not e!21807))))

(declare-fun srcBuffer!2 () array!1840)

(assert (=> start!6904 (= res!28187 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!812 srcBuffer!2))))))))

(assert (=> start!6904 e!21807))

(assert (=> start!6904 true))

(assert (=> start!6904 (array_inv!761 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1416) Bool)

(assert (=> start!6904 (and (inv!12 thiss!1379) e!21811)))

(declare-fun b!32940 () Bool)

(declare-fun e!21812 () Bool)

(declare-fun e!21808 () Bool)

(assert (=> b!32940 (= e!21812 e!21808)))

(declare-fun res!28182 () Bool)

(assert (=> b!32940 (=> res!28182 e!21808)))

(declare-fun lt!48628 () tuple2!3364)

(declare-fun isPrefixOf!0 (BitStream!1416 BitStream!1416) Bool)

(assert (=> b!32940 (= res!28182 (not (isPrefixOf!0 (_2!1769 lt!48628) (_2!1769 lt!48629))))))

(assert (=> b!32940 (isPrefixOf!0 thiss!1379 (_2!1769 lt!48629))))

(declare-fun lt!48622 () Unit!2479)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1416 BitStream!1416 BitStream!1416) Unit!2479)

(assert (=> b!32940 (= lt!48622 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1769 lt!48628) (_2!1769 lt!48629)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1416 array!1840 (_ BitVec 64) (_ BitVec 64)) tuple2!3364)

(assert (=> b!32940 (= lt!48629 (appendBitsMSBFirstLoop!0 (_2!1769 lt!48628) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21816 () Bool)

(assert (=> b!32940 e!21816))

(declare-fun res!28174 () Bool)

(assert (=> b!32940 (=> (not res!28174) (not e!21816))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32940 (= res!28174 (validate_offset_bits!1 ((_ sign_extend 32) (size!812 (buf!1140 (_2!1769 lt!48628)))) ((_ sign_extend 32) (currentByte!2507 thiss!1379)) ((_ sign_extend 32) (currentBit!2502 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48632 () Unit!2479)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1416 array!1840 (_ BitVec 64)) Unit!2479)

(assert (=> b!32940 (= lt!48632 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1140 (_2!1769 lt!48628)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48619 () tuple2!3362)

(declare-fun reader!0 (BitStream!1416 BitStream!1416) tuple2!3362)

(assert (=> b!32940 (= lt!48619 (reader!0 thiss!1379 (_2!1769 lt!48628)))))

(declare-fun b!32941 () Bool)

(declare-fun res!28186 () Bool)

(declare-fun e!21810 () Bool)

(assert (=> b!32941 (=> res!28186 e!21810)))

(assert (=> b!32941 (= res!28186 (not (= (size!812 (buf!1140 thiss!1379)) (size!812 (buf!1140 (_2!1769 lt!48629))))))))

(declare-fun b!32942 () Bool)

(declare-fun e!21815 () Bool)

(assert (=> b!32942 (= e!21807 (not e!21815))))

(declare-fun res!28181 () Bool)

(assert (=> b!32942 (=> res!28181 e!21815)))

(assert (=> b!32942 (= res!28181 (bvsge i!635 to!314))))

(assert (=> b!32942 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48630 () Unit!2479)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1416) Unit!2479)

(assert (=> b!32942 (= lt!48630 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48620 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32942 (= lt!48620 (bitIndex!0 (size!812 (buf!1140 thiss!1379)) (currentByte!2507 thiss!1379) (currentBit!2502 thiss!1379)))))

(declare-fun b!32943 () Bool)

(declare-fun res!28188 () Bool)

(assert (=> b!32943 (=> res!28188 e!21810)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32943 (= res!28188 (not (invariant!0 (currentBit!2502 (_2!1769 lt!48629)) (currentByte!2507 (_2!1769 lt!48629)) (size!812 (buf!1140 (_2!1769 lt!48629))))))))

(declare-fun b!32944 () Bool)

(assert (=> b!32944 (= e!21815 e!21812)))

(declare-fun res!28184 () Bool)

(assert (=> b!32944 (=> res!28184 e!21812)))

(assert (=> b!32944 (= res!28184 (not (isPrefixOf!0 thiss!1379 (_2!1769 lt!48628))))))

(declare-fun lt!48624 () (_ BitVec 64))

(assert (=> b!32944 (validate_offset_bits!1 ((_ sign_extend 32) (size!812 (buf!1140 (_2!1769 lt!48628)))) ((_ sign_extend 32) (currentByte!2507 (_2!1769 lt!48628))) ((_ sign_extend 32) (currentBit!2502 (_2!1769 lt!48628))) lt!48624)))

(assert (=> b!32944 (= lt!48624 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48627 () Unit!2479)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1416 BitStream!1416 (_ BitVec 64) (_ BitVec 64)) Unit!2479)

(assert (=> b!32944 (= lt!48627 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1769 lt!48628) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1416 (_ BitVec 8) (_ BitVec 32)) tuple2!3364)

(assert (=> b!32944 (= lt!48628 (appendBitFromByte!0 thiss!1379 (select (arr!1287 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32945 () Bool)

(declare-fun res!28178 () Bool)

(assert (=> b!32945 (=> (not res!28178) (not e!21807))))

(assert (=> b!32945 (= res!28178 (validate_offset_bits!1 ((_ sign_extend 32) (size!812 (buf!1140 thiss!1379))) ((_ sign_extend 32) (currentByte!2507 thiss!1379)) ((_ sign_extend 32) (currentBit!2502 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32946 () Bool)

(assert (=> b!32946 (= e!21808 e!21810)))

(declare-fun res!28177 () Bool)

(assert (=> b!32946 (=> res!28177 e!21810)))

(declare-fun lt!48625 () (_ BitVec 64))

(assert (=> b!32946 (= res!28177 (not (= lt!48625 (bvsub (bvadd lt!48620 to!314) i!635))))))

(assert (=> b!32946 (= lt!48625 (bitIndex!0 (size!812 (buf!1140 (_2!1769 lt!48629))) (currentByte!2507 (_2!1769 lt!48629)) (currentBit!2502 (_2!1769 lt!48629))))))

(declare-fun b!32947 () Bool)

(declare-fun head!246 (List!409) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1416 array!1840 (_ BitVec 64) (_ BitVec 64)) List!409)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1416 BitStream!1416 (_ BitVec 64)) List!409)

(assert (=> b!32947 (= e!21816 (= (head!246 (byteArrayBitContentToList!0 (_2!1769 lt!48628) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!246 (bitStreamReadBitsIntoList!0 (_2!1769 lt!48628) (_1!1768 lt!48619) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32948 () Bool)

(declare-fun res!28185 () Bool)

(assert (=> b!32948 (=> res!28185 e!21813)))

(declare-fun length!135 (List!409) Int)

(assert (=> b!32948 (= res!28185 (<= (length!135 lt!48626) 0))))

(declare-fun b!32949 () Bool)

(declare-fun e!21814 () Bool)

(assert (=> b!32949 (= e!21814 e!21813)))

(declare-fun res!28180 () Bool)

(assert (=> b!32949 (=> res!28180 e!21813)))

(assert (=> b!32949 (= res!28180 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!32949 (= lt!48633 (bitStreamReadBitsIntoList!0 (_2!1769 lt!48629) (_1!1768 lt!48621) lt!48624))))

(assert (=> b!32949 (= lt!48626 (bitStreamReadBitsIntoList!0 (_2!1769 lt!48629) (_1!1768 lt!48631) (bvsub to!314 i!635)))))

(assert (=> b!32949 (validate_offset_bits!1 ((_ sign_extend 32) (size!812 (buf!1140 (_2!1769 lt!48629)))) ((_ sign_extend 32) (currentByte!2507 (_2!1769 lt!48628))) ((_ sign_extend 32) (currentBit!2502 (_2!1769 lt!48628))) lt!48624)))

(declare-fun lt!48618 () Unit!2479)

(assert (=> b!32949 (= lt!48618 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1769 lt!48628) (buf!1140 (_2!1769 lt!48629)) lt!48624))))

(assert (=> b!32949 (= lt!48621 (reader!0 (_2!1769 lt!48628) (_2!1769 lt!48629)))))

(assert (=> b!32949 (validate_offset_bits!1 ((_ sign_extend 32) (size!812 (buf!1140 (_2!1769 lt!48629)))) ((_ sign_extend 32) (currentByte!2507 thiss!1379)) ((_ sign_extend 32) (currentBit!2502 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48623 () Unit!2479)

(assert (=> b!32949 (= lt!48623 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1140 (_2!1769 lt!48629)) (bvsub to!314 i!635)))))

(assert (=> b!32949 (= lt!48631 (reader!0 thiss!1379 (_2!1769 lt!48629)))))

(declare-fun b!32950 () Bool)

(declare-fun res!28175 () Bool)

(assert (=> b!32950 (=> res!28175 e!21814)))

(assert (=> b!32950 (= res!28175 (not (invariant!0 (currentBit!2502 (_2!1769 lt!48628)) (currentByte!2507 (_2!1769 lt!48628)) (size!812 (buf!1140 (_2!1769 lt!48629))))))))

(declare-fun e!21806 () Bool)

(declare-fun b!32951 () Bool)

(assert (=> b!32951 (= e!21806 (= lt!48625 (bvsub (bvsub (bvadd (bitIndex!0 (size!812 (buf!1140 (_2!1769 lt!48628))) (currentByte!2507 (_2!1769 lt!48628)) (currentBit!2502 (_2!1769 lt!48628))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32952 () Bool)

(assert (=> b!32952 (= e!21810 e!21814)))

(declare-fun res!28176 () Bool)

(assert (=> b!32952 (=> res!28176 e!21814)))

(assert (=> b!32952 (= res!28176 (not (= (size!812 (buf!1140 (_2!1769 lt!48628))) (size!812 (buf!1140 (_2!1769 lt!48629))))))))

(assert (=> b!32952 e!21806))

(declare-fun res!28179 () Bool)

(assert (=> b!32952 (=> (not res!28179) (not e!21806))))

(assert (=> b!32952 (= res!28179 (= (size!812 (buf!1140 (_2!1769 lt!48629))) (size!812 (buf!1140 thiss!1379))))))

(declare-fun b!32953 () Bool)

(declare-fun res!28183 () Bool)

(assert (=> b!32953 (=> res!28183 e!21814)))

(assert (=> b!32953 (= res!28183 (not (invariant!0 (currentBit!2502 (_2!1769 lt!48628)) (currentByte!2507 (_2!1769 lt!48628)) (size!812 (buf!1140 (_2!1769 lt!48628))))))))

(assert (= (and start!6904 res!28187) b!32945))

(assert (= (and b!32945 res!28178) b!32942))

(assert (= (and b!32942 (not res!28181)) b!32944))

(assert (= (and b!32944 (not res!28184)) b!32940))

(assert (= (and b!32940 res!28174) b!32947))

(assert (= (and b!32940 (not res!28182)) b!32946))

(assert (= (and b!32946 (not res!28177)) b!32943))

(assert (= (and b!32943 (not res!28188)) b!32941))

(assert (= (and b!32941 (not res!28186)) b!32952))

(assert (= (and b!32952 res!28179) b!32951))

(assert (= (and b!32952 (not res!28176)) b!32953))

(assert (= (and b!32953 (not res!28183)) b!32950))

(assert (= (and b!32950 (not res!28175)) b!32949))

(assert (= (and b!32949 (not res!28180)) b!32948))

(assert (= (and b!32948 (not res!28185)) b!32939))

(assert (= start!6904 b!32938))

(declare-fun m!48783 () Bool)

(assert (=> b!32940 m!48783))

(declare-fun m!48785 () Bool)

(assert (=> b!32940 m!48785))

(declare-fun m!48787 () Bool)

(assert (=> b!32940 m!48787))

(declare-fun m!48789 () Bool)

(assert (=> b!32940 m!48789))

(declare-fun m!48791 () Bool)

(assert (=> b!32940 m!48791))

(declare-fun m!48793 () Bool)

(assert (=> b!32940 m!48793))

(declare-fun m!48795 () Bool)

(assert (=> b!32940 m!48795))

(declare-fun m!48797 () Bool)

(assert (=> b!32944 m!48797))

(declare-fun m!48799 () Bool)

(assert (=> b!32944 m!48799))

(declare-fun m!48801 () Bool)

(assert (=> b!32944 m!48801))

(assert (=> b!32944 m!48797))

(declare-fun m!48803 () Bool)

(assert (=> b!32944 m!48803))

(declare-fun m!48805 () Bool)

(assert (=> b!32944 m!48805))

(declare-fun m!48807 () Bool)

(assert (=> b!32953 m!48807))

(declare-fun m!48809 () Bool)

(assert (=> b!32946 m!48809))

(declare-fun m!48811 () Bool)

(assert (=> b!32947 m!48811))

(assert (=> b!32947 m!48811))

(declare-fun m!48813 () Bool)

(assert (=> b!32947 m!48813))

(declare-fun m!48815 () Bool)

(assert (=> b!32947 m!48815))

(assert (=> b!32947 m!48815))

(declare-fun m!48817 () Bool)

(assert (=> b!32947 m!48817))

(declare-fun m!48819 () Bool)

(assert (=> b!32951 m!48819))

(declare-fun m!48821 () Bool)

(assert (=> b!32949 m!48821))

(declare-fun m!48823 () Bool)

(assert (=> b!32949 m!48823))

(declare-fun m!48825 () Bool)

(assert (=> b!32949 m!48825))

(declare-fun m!48827 () Bool)

(assert (=> b!32949 m!48827))

(declare-fun m!48829 () Bool)

(assert (=> b!32949 m!48829))

(declare-fun m!48831 () Bool)

(assert (=> b!32949 m!48831))

(declare-fun m!48833 () Bool)

(assert (=> b!32949 m!48833))

(declare-fun m!48835 () Bool)

(assert (=> b!32949 m!48835))

(declare-fun m!48837 () Bool)

(assert (=> b!32950 m!48837))

(declare-fun m!48839 () Bool)

(assert (=> b!32939 m!48839))

(declare-fun m!48841 () Bool)

(assert (=> b!32939 m!48841))

(declare-fun m!48843 () Bool)

(assert (=> b!32942 m!48843))

(declare-fun m!48845 () Bool)

(assert (=> b!32942 m!48845))

(declare-fun m!48847 () Bool)

(assert (=> b!32942 m!48847))

(declare-fun m!48849 () Bool)

(assert (=> b!32948 m!48849))

(declare-fun m!48851 () Bool)

(assert (=> b!32943 m!48851))

(declare-fun m!48853 () Bool)

(assert (=> b!32945 m!48853))

(declare-fun m!48855 () Bool)

(assert (=> start!6904 m!48855))

(declare-fun m!48857 () Bool)

(assert (=> start!6904 m!48857))

(declare-fun m!48859 () Bool)

(assert (=> b!32938 m!48859))

(check-sat (not b!32946) (not b!32948) (not start!6904) (not b!32938) (not b!32951) (not b!32944) (not b!32942) (not b!32943) (not b!32940) (not b!32953) (not b!32947) (not b!32950) (not b!32949) (not b!32939) (not b!32945))
