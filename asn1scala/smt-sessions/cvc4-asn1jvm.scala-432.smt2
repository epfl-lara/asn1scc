; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11788 () Bool)

(assert start!11788)

(declare-fun b!58152 () Bool)

(declare-fun res!48273 () Bool)

(declare-fun e!38540 () Bool)

(assert (=> b!58152 (=> res!48273 e!38540)))

(declare-datatypes ((array!2645 0))(
  ( (array!2646 (arr!1762 (Array (_ BitVec 32) (_ BitVec 8))) (size!1198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2084 0))(
  ( (BitStream!2085 (buf!1579 array!2645) (currentByte!3197 (_ BitVec 32)) (currentBit!3192 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4019 0))(
  ( (Unit!4020) )
))
(declare-datatypes ((tuple2!5290 0))(
  ( (tuple2!5291 (_1!2756 Unit!4019) (_2!2756 BitStream!2084)) )
))
(declare-fun lt!92132 () tuple2!5290)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58152 (= res!48273 (not (invariant!0 (currentBit!3192 (_2!2756 lt!92132)) (currentByte!3197 (_2!2756 lt!92132)) (size!1198 (buf!1579 (_2!2756 lt!92132))))))))

(declare-fun srcBuffer!2 () array!2645)

(declare-fun e!38539 () Bool)

(declare-fun b!58153 () Bool)

(declare-fun lt!92136 () tuple2!5290)

(declare-datatypes ((tuple2!5292 0))(
  ( (tuple2!5293 (_1!2757 BitStream!2084) (_2!2757 BitStream!2084)) )
))
(declare-fun lt!92135 () tuple2!5292)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((List!617 0))(
  ( (Nil!614) (Cons!613 (h!732 Bool) (t!1367 List!617)) )
))
(declare-fun head!436 (List!617) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2084 array!2645 (_ BitVec 64) (_ BitVec 64)) List!617)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2084 BitStream!2084 (_ BitVec 64)) List!617)

(assert (=> b!58153 (= e!38539 (= (head!436 (byteArrayBitContentToList!0 (_2!2756 lt!92136) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!436 (bitStreamReadBitsIntoList!0 (_2!2756 lt!92136) (_1!2757 lt!92135) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58154 () Bool)

(declare-fun e!38536 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!92138 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58154 (= e!38536 (= lt!92138 (bvsub (bvsub (bvadd (bitIndex!0 (size!1198 (buf!1579 (_2!2756 lt!92136))) (currentByte!3197 (_2!2756 lt!92136)) (currentBit!3192 (_2!2756 lt!92136))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58155 () Bool)

(declare-fun e!38541 () Bool)

(assert (=> b!58155 (= e!38541 e!38540)))

(declare-fun res!48271 () Bool)

(assert (=> b!58155 (=> res!48271 e!38540)))

(declare-fun lt!92140 () (_ BitVec 64))

(assert (=> b!58155 (= res!48271 (not (= lt!92138 (bvsub (bvadd lt!92140 to!314) i!635))))))

(assert (=> b!58155 (= lt!92138 (bitIndex!0 (size!1198 (buf!1579 (_2!2756 lt!92132))) (currentByte!3197 (_2!2756 lt!92132)) (currentBit!3192 (_2!2756 lt!92132))))))

(declare-fun b!58156 () Bool)

(declare-fun res!48278 () Bool)

(declare-fun e!38535 () Bool)

(assert (=> b!58156 (=> res!48278 e!38535)))

(assert (=> b!58156 (= res!48278 (not (invariant!0 (currentBit!3192 (_2!2756 lt!92136)) (currentByte!3197 (_2!2756 lt!92136)) (size!1198 (buf!1579 (_2!2756 lt!92136))))))))

(declare-fun res!48276 () Bool)

(declare-fun e!38543 () Bool)

(assert (=> start!11788 (=> (not res!48276) (not e!38543))))

(assert (=> start!11788 (= res!48276 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1198 srcBuffer!2))))))))

(assert (=> start!11788 e!38543))

(assert (=> start!11788 true))

(declare-fun array_inv!1101 (array!2645) Bool)

(assert (=> start!11788 (array_inv!1101 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2084)

(declare-fun e!38533 () Bool)

(declare-fun inv!12 (BitStream!2084) Bool)

(assert (=> start!11788 (and (inv!12 thiss!1379) e!38533)))

(declare-fun b!58157 () Bool)

(assert (=> b!58157 (= e!38535 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!92133 () tuple2!5292)

(declare-fun reader!0 (BitStream!2084 BitStream!2084) tuple2!5292)

(assert (=> b!58157 (= lt!92133 (reader!0 thiss!1379 (_2!2756 lt!92132)))))

(declare-fun b!58158 () Bool)

(assert (=> b!58158 (= e!38533 (array_inv!1101 (buf!1579 thiss!1379)))))

(declare-fun b!58159 () Bool)

(declare-fun e!38542 () Bool)

(assert (=> b!58159 (= e!38543 (not e!38542))))

(declare-fun res!48274 () Bool)

(assert (=> b!58159 (=> res!48274 e!38542)))

(assert (=> b!58159 (= res!48274 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2084 BitStream!2084) Bool)

(assert (=> b!58159 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92137 () Unit!4019)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2084) Unit!4019)

(assert (=> b!58159 (= lt!92137 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58159 (= lt!92140 (bitIndex!0 (size!1198 (buf!1579 thiss!1379)) (currentByte!3197 thiss!1379) (currentBit!3192 thiss!1379)))))

(declare-fun b!58160 () Bool)

(declare-fun res!48281 () Bool)

(assert (=> b!58160 (=> res!48281 e!38535)))

(assert (=> b!58160 (= res!48281 (not (invariant!0 (currentBit!3192 (_2!2756 lt!92136)) (currentByte!3197 (_2!2756 lt!92136)) (size!1198 (buf!1579 (_2!2756 lt!92132))))))))

(declare-fun b!58161 () Bool)

(declare-fun e!38534 () Bool)

(assert (=> b!58161 (= e!38534 e!38541)))

(declare-fun res!48280 () Bool)

(assert (=> b!58161 (=> res!48280 e!38541)))

(assert (=> b!58161 (= res!48280 (not (isPrefixOf!0 (_2!2756 lt!92136) (_2!2756 lt!92132))))))

(assert (=> b!58161 (isPrefixOf!0 thiss!1379 (_2!2756 lt!92132))))

(declare-fun lt!92139 () Unit!4019)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2084 BitStream!2084 BitStream!2084) Unit!4019)

(assert (=> b!58161 (= lt!92139 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2756 lt!92136) (_2!2756 lt!92132)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2084 array!2645 (_ BitVec 64) (_ BitVec 64)) tuple2!5290)

(assert (=> b!58161 (= lt!92132 (appendBitsMSBFirstLoop!0 (_2!2756 lt!92136) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58161 e!38539))

(declare-fun res!48277 () Bool)

(assert (=> b!58161 (=> (not res!48277) (not e!38539))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58161 (= res!48277 (validate_offset_bits!1 ((_ sign_extend 32) (size!1198 (buf!1579 (_2!2756 lt!92136)))) ((_ sign_extend 32) (currentByte!3197 thiss!1379)) ((_ sign_extend 32) (currentBit!3192 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92131 () Unit!4019)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2084 array!2645 (_ BitVec 64)) Unit!4019)

(assert (=> b!58161 (= lt!92131 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1579 (_2!2756 lt!92136)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58161 (= lt!92135 (reader!0 thiss!1379 (_2!2756 lt!92136)))))

(declare-fun b!58162 () Bool)

(declare-fun res!48279 () Bool)

(assert (=> b!58162 (=> (not res!48279) (not e!38543))))

(assert (=> b!58162 (= res!48279 (validate_offset_bits!1 ((_ sign_extend 32) (size!1198 (buf!1579 thiss!1379))) ((_ sign_extend 32) (currentByte!3197 thiss!1379)) ((_ sign_extend 32) (currentBit!3192 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58163 () Bool)

(declare-fun res!48275 () Bool)

(assert (=> b!58163 (=> res!48275 e!38540)))

(assert (=> b!58163 (= res!48275 (not (= (size!1198 (buf!1579 thiss!1379)) (size!1198 (buf!1579 (_2!2756 lt!92132))))))))

(declare-fun b!58164 () Bool)

(assert (=> b!58164 (= e!38540 e!38535)))

(declare-fun res!48282 () Bool)

(assert (=> b!58164 (=> res!48282 e!38535)))

(assert (=> b!58164 (= res!48282 (not (= (size!1198 (buf!1579 (_2!2756 lt!92136))) (size!1198 (buf!1579 (_2!2756 lt!92132))))))))

(assert (=> b!58164 e!38536))

(declare-fun res!48272 () Bool)

(assert (=> b!58164 (=> (not res!48272) (not e!38536))))

(assert (=> b!58164 (= res!48272 (= (size!1198 (buf!1579 (_2!2756 lt!92132))) (size!1198 (buf!1579 thiss!1379))))))

(declare-fun b!58165 () Bool)

(assert (=> b!58165 (= e!38542 e!38534)))

(declare-fun res!48270 () Bool)

(assert (=> b!58165 (=> res!48270 e!38534)))

(assert (=> b!58165 (= res!48270 (not (isPrefixOf!0 thiss!1379 (_2!2756 lt!92136))))))

(assert (=> b!58165 (validate_offset_bits!1 ((_ sign_extend 32) (size!1198 (buf!1579 (_2!2756 lt!92136)))) ((_ sign_extend 32) (currentByte!3197 (_2!2756 lt!92136))) ((_ sign_extend 32) (currentBit!3192 (_2!2756 lt!92136))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92134 () Unit!4019)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2084 BitStream!2084 (_ BitVec 64) (_ BitVec 64)) Unit!4019)

(assert (=> b!58165 (= lt!92134 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2756 lt!92136) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2084 (_ BitVec 8) (_ BitVec 32)) tuple2!5290)

(assert (=> b!58165 (= lt!92136 (appendBitFromByte!0 thiss!1379 (select (arr!1762 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11788 res!48276) b!58162))

(assert (= (and b!58162 res!48279) b!58159))

(assert (= (and b!58159 (not res!48274)) b!58165))

(assert (= (and b!58165 (not res!48270)) b!58161))

(assert (= (and b!58161 res!48277) b!58153))

(assert (= (and b!58161 (not res!48280)) b!58155))

(assert (= (and b!58155 (not res!48271)) b!58152))

(assert (= (and b!58152 (not res!48273)) b!58163))

(assert (= (and b!58163 (not res!48275)) b!58164))

(assert (= (and b!58164 res!48272) b!58154))

(assert (= (and b!58164 (not res!48282)) b!58156))

(assert (= (and b!58156 (not res!48278)) b!58160))

(assert (= (and b!58160 (not res!48281)) b!58157))

(assert (= start!11788 b!58158))

(declare-fun m!91677 () Bool)

(assert (=> b!58157 m!91677))

(declare-fun m!91679 () Bool)

(assert (=> b!58161 m!91679))

(declare-fun m!91681 () Bool)

(assert (=> b!58161 m!91681))

(declare-fun m!91683 () Bool)

(assert (=> b!58161 m!91683))

(declare-fun m!91685 () Bool)

(assert (=> b!58161 m!91685))

(declare-fun m!91687 () Bool)

(assert (=> b!58161 m!91687))

(declare-fun m!91689 () Bool)

(assert (=> b!58161 m!91689))

(declare-fun m!91691 () Bool)

(assert (=> b!58161 m!91691))

(declare-fun m!91693 () Bool)

(assert (=> b!58156 m!91693))

(declare-fun m!91695 () Bool)

(assert (=> b!58153 m!91695))

(assert (=> b!58153 m!91695))

(declare-fun m!91697 () Bool)

(assert (=> b!58153 m!91697))

(declare-fun m!91699 () Bool)

(assert (=> b!58153 m!91699))

(assert (=> b!58153 m!91699))

(declare-fun m!91701 () Bool)

(assert (=> b!58153 m!91701))

(declare-fun m!91703 () Bool)

(assert (=> b!58162 m!91703))

(declare-fun m!91705 () Bool)

(assert (=> b!58155 m!91705))

(declare-fun m!91707 () Bool)

(assert (=> b!58152 m!91707))

(declare-fun m!91709 () Bool)

(assert (=> b!58160 m!91709))

(declare-fun m!91711 () Bool)

(assert (=> b!58165 m!91711))

(declare-fun m!91713 () Bool)

(assert (=> b!58165 m!91713))

(declare-fun m!91715 () Bool)

(assert (=> b!58165 m!91715))

(declare-fun m!91717 () Bool)

(assert (=> b!58165 m!91717))

(assert (=> b!58165 m!91713))

(declare-fun m!91719 () Bool)

(assert (=> b!58165 m!91719))

(declare-fun m!91721 () Bool)

(assert (=> b!58159 m!91721))

(declare-fun m!91723 () Bool)

(assert (=> b!58159 m!91723))

(declare-fun m!91725 () Bool)

(assert (=> b!58159 m!91725))

(declare-fun m!91727 () Bool)

(assert (=> b!58158 m!91727))

(declare-fun m!91729 () Bool)

(assert (=> start!11788 m!91729))

(declare-fun m!91731 () Bool)

(assert (=> start!11788 m!91731))

(declare-fun m!91733 () Bool)

(assert (=> b!58154 m!91733))

(push 1)

(assert (not b!58160))

(assert (not b!58157))

(assert (not start!11788))

(assert (not b!58165))

(assert (not b!58152))

(assert (not b!58162))

(assert (not b!58155))

(assert (not b!58154))

(assert (not b!58153))

(assert (not b!58161))

(assert (not b!58158))

(assert (not b!58156))

(assert (not b!58159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

