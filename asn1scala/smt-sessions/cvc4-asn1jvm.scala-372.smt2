; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8646 () Bool)

(assert start!8646)

(declare-fun b!43114 () Bool)

(declare-fun e!28830 () Bool)

(declare-fun e!28828 () Bool)

(assert (=> b!43114 (= e!28830 e!28828)))

(declare-fun res!36634 () Bool)

(assert (=> b!43114 (=> res!36634 e!28828)))

(declare-datatypes ((array!2210 0))(
  ( (array!2211 (arr!1501 (Array (_ BitVec 32) (_ BitVec 8))) (size!999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1742 0))(
  ( (BitStream!1743 (buf!1333 array!2210) (currentByte!2799 (_ BitVec 32)) (currentBit!2794 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1742)

(declare-datatypes ((Unit!3068 0))(
  ( (Unit!3069) )
))
(declare-datatypes ((tuple2!4234 0))(
  ( (tuple2!4235 (_1!2210 Unit!3068) (_2!2210 BitStream!1742)) )
))
(declare-fun lt!65030 () tuple2!4234)

(declare-fun isPrefixOf!0 (BitStream!1742 BitStream!1742) Bool)

(assert (=> b!43114 (= res!36634 (not (isPrefixOf!0 thiss!1379 (_2!2210 lt!65030))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43114 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65035 () Unit!3068)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1742 BitStream!1742 (_ BitVec 64) (_ BitVec 64)) Unit!3068)

(assert (=> b!43114 (= lt!65035 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2210 lt!65030) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2210)

(declare-fun appendBitFromByte!0 (BitStream!1742 (_ BitVec 8) (_ BitVec 32)) tuple2!4234)

(assert (=> b!43114 (= lt!65030 (appendBitFromByte!0 thiss!1379 (select (arr!1501 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43115 () Bool)

(declare-fun e!28829 () Bool)

(declare-fun lt!65032 () tuple2!4234)

(declare-fun lt!65033 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43115 (= e!28829 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65032))) (currentByte!2799 (_2!2210 lt!65032)) (currentBit!2794 (_2!2210 lt!65032))) (bvsub (bvadd lt!65033 to!314) i!635)))))

(declare-fun b!43116 () Bool)

(assert (=> b!43116 (= e!28828 e!28829)))

(declare-fun res!36635 () Bool)

(assert (=> b!43116 (=> res!36635 e!28829)))

(assert (=> b!43116 (= res!36635 (not (isPrefixOf!0 (_2!2210 lt!65030) (_2!2210 lt!65032))))))

(assert (=> b!43116 (isPrefixOf!0 thiss!1379 (_2!2210 lt!65032))))

(declare-fun lt!65029 () Unit!3068)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1742 BitStream!1742 BitStream!1742) Unit!3068)

(assert (=> b!43116 (= lt!65029 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2210 lt!65030) (_2!2210 lt!65032)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1742 array!2210 (_ BitVec 64) (_ BitVec 64)) tuple2!4234)

(assert (=> b!43116 (= lt!65032 (appendBitsMSBFirstLoop!0 (_2!2210 lt!65030) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!28831 () Bool)

(assert (=> b!43116 e!28831))

(declare-fun res!36632 () Bool)

(assert (=> b!43116 (=> (not res!36632) (not e!28831))))

(assert (=> b!43116 (= res!36632 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65034 () Unit!3068)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1742 array!2210 (_ BitVec 64)) Unit!3068)

(assert (=> b!43116 (= lt!65034 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1333 (_2!2210 lt!65030)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4236 0))(
  ( (tuple2!4237 (_1!2211 BitStream!1742) (_2!2211 BitStream!1742)) )
))
(declare-fun lt!65031 () tuple2!4236)

(declare-fun reader!0 (BitStream!1742 BitStream!1742) tuple2!4236)

(assert (=> b!43116 (= lt!65031 (reader!0 thiss!1379 (_2!2210 lt!65030)))))

(declare-fun b!43117 () Bool)

(declare-fun res!36633 () Bool)

(declare-fun e!28826 () Bool)

(assert (=> b!43117 (=> (not res!36633) (not e!28826))))

(assert (=> b!43117 (= res!36633 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 thiss!1379))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43118 () Bool)

(declare-fun e!28825 () Bool)

(declare-fun array_inv!924 (array!2210) Bool)

(assert (=> b!43118 (= e!28825 (array_inv!924 (buf!1333 thiss!1379)))))

(declare-fun res!36631 () Bool)

(assert (=> start!8646 (=> (not res!36631) (not e!28826))))

(assert (=> start!8646 (= res!36631 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!999 srcBuffer!2))))))))

(assert (=> start!8646 e!28826))

(assert (=> start!8646 true))

(assert (=> start!8646 (array_inv!924 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1742) Bool)

(assert (=> start!8646 (and (inv!12 thiss!1379) e!28825)))

(declare-fun b!43119 () Bool)

(declare-datatypes ((List!512 0))(
  ( (Nil!509) (Cons!508 (h!627 Bool) (t!1262 List!512)) )
))
(declare-fun head!331 (List!512) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1742 array!2210 (_ BitVec 64) (_ BitVec 64)) List!512)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1742 BitStream!1742 (_ BitVec 64)) List!512)

(assert (=> b!43119 (= e!28831 (= (head!331 (byteArrayBitContentToList!0 (_2!2210 lt!65030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!331 (bitStreamReadBitsIntoList!0 (_2!2210 lt!65030) (_1!2211 lt!65031) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43120 () Bool)

(assert (=> b!43120 (= e!28826 (not e!28830))))

(declare-fun res!36636 () Bool)

(assert (=> b!43120 (=> res!36636 e!28830)))

(assert (=> b!43120 (= res!36636 (bvsge i!635 to!314))))

(assert (=> b!43120 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65028 () Unit!3068)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1742) Unit!3068)

(assert (=> b!43120 (= lt!65028 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!43120 (= lt!65033 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)))))

(assert (= (and start!8646 res!36631) b!43117))

(assert (= (and b!43117 res!36633) b!43120))

(assert (= (and b!43120 (not res!36636)) b!43114))

(assert (= (and b!43114 (not res!36634)) b!43116))

(assert (= (and b!43116 res!36632) b!43119))

(assert (= (and b!43116 (not res!36635)) b!43115))

(assert (= start!8646 b!43118))

(declare-fun m!65551 () Bool)

(assert (=> b!43119 m!65551))

(assert (=> b!43119 m!65551))

(declare-fun m!65553 () Bool)

(assert (=> b!43119 m!65553))

(declare-fun m!65555 () Bool)

(assert (=> b!43119 m!65555))

(assert (=> b!43119 m!65555))

(declare-fun m!65557 () Bool)

(assert (=> b!43119 m!65557))

(declare-fun m!65559 () Bool)

(assert (=> b!43120 m!65559))

(declare-fun m!65561 () Bool)

(assert (=> b!43120 m!65561))

(declare-fun m!65563 () Bool)

(assert (=> b!43120 m!65563))

(declare-fun m!65565 () Bool)

(assert (=> start!8646 m!65565))

(declare-fun m!65567 () Bool)

(assert (=> start!8646 m!65567))

(declare-fun m!65569 () Bool)

(assert (=> b!43118 m!65569))

(declare-fun m!65571 () Bool)

(assert (=> b!43117 m!65571))

(declare-fun m!65573 () Bool)

(assert (=> b!43116 m!65573))

(declare-fun m!65575 () Bool)

(assert (=> b!43116 m!65575))

(declare-fun m!65577 () Bool)

(assert (=> b!43116 m!65577))

(declare-fun m!65579 () Bool)

(assert (=> b!43116 m!65579))

(declare-fun m!65581 () Bool)

(assert (=> b!43116 m!65581))

(declare-fun m!65583 () Bool)

(assert (=> b!43116 m!65583))

(declare-fun m!65585 () Bool)

(assert (=> b!43116 m!65585))

(declare-fun m!65587 () Bool)

(assert (=> b!43115 m!65587))

(declare-fun m!65589 () Bool)

(assert (=> b!43114 m!65589))

(declare-fun m!65591 () Bool)

(assert (=> b!43114 m!65591))

(declare-fun m!65593 () Bool)

(assert (=> b!43114 m!65593))

(declare-fun m!65595 () Bool)

(assert (=> b!43114 m!65595))

(assert (=> b!43114 m!65593))

(declare-fun m!65597 () Bool)

(assert (=> b!43114 m!65597))

(push 1)

(assert (not b!43119))

(assert (not b!43117))

(assert (not b!43116))

(assert (not start!8646))

(assert (not b!43114))

(assert (not b!43118))

(assert (not b!43120))

(assert (not b!43115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12492 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12492 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 thiss!1379))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!999 (buf!1333 thiss!1379))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3369 () Bool)

(assert (= bs!3369 d!12492))

(declare-fun m!65675 () Bool)

(assert (=> bs!3369 m!65675))

(assert (=> b!43117 d!12492))

(declare-fun d!12494 () Bool)

(assert (=> d!12494 (= (array_inv!924 (buf!1333 thiss!1379)) (bvsge (size!999 (buf!1333 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43118 d!12494))

(declare-fun d!12496 () Bool)

(assert (=> d!12496 (= (array_inv!924 srcBuffer!2) (bvsge (size!999 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8646 d!12496))

(declare-fun d!12498 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!12498 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2794 thiss!1379) (currentByte!2799 thiss!1379) (size!999 (buf!1333 thiss!1379))))))

(declare-fun bs!3370 () Bool)

(assert (= bs!3370 d!12498))

(declare-fun m!65677 () Bool)

(assert (=> bs!3370 m!65677))

(assert (=> start!8646 d!12498))

(declare-fun d!12500 () Bool)

(assert (=> d!12500 (= (head!331 (byteArrayBitContentToList!0 (_2!2210 lt!65030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!627 (byteArrayBitContentToList!0 (_2!2210 lt!65030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43119 d!12500))

(declare-fun d!12502 () Bool)

(declare-fun c!2832 () Bool)

(assert (=> d!12502 (= c!2832 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28855 () List!512)

(assert (=> d!12502 (= (byteArrayBitContentToList!0 (_2!2210 lt!65030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!28855)))

(declare-fun b!43167 () Bool)

(assert (=> b!43167 (= e!28855 Nil!509)))

(declare-fun b!43168 () Bool)

(assert (=> b!43168 (= e!28855 (Cons!508 (not (= (bvand ((_ sign_extend 24) (select (arr!1501 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2210 lt!65030) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12502 c!2832) b!43167))

(assert (= (and d!12502 (not c!2832)) b!43168))

(assert (=> b!43168 m!65593))

(declare-fun m!65679 () Bool)

(assert (=> b!43168 m!65679))

(declare-fun m!65681 () Bool)

(assert (=> b!43168 m!65681))

(assert (=> b!43119 d!12502))

(declare-fun d!12504 () Bool)

(assert (=> d!12504 (= (head!331 (bitStreamReadBitsIntoList!0 (_2!2210 lt!65030) (_1!2211 lt!65031) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!627 (bitStreamReadBitsIntoList!0 (_2!2210 lt!65030) (_1!2211 lt!65031) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43119 d!12504))

(declare-fun d!12506 () Bool)

(declare-fun e!28861 () Bool)

(assert (=> d!12506 e!28861))

(declare-fun c!2838 () Bool)

(assert (=> d!12506 (= c!2838 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65174 () List!512)

(declare-datatypes ((tuple2!4254 0))(
  ( (tuple2!4255 (_1!2220 List!512) (_2!2220 BitStream!1742)) )
))
(declare-fun e!28860 () tuple2!4254)

(assert (=> d!12506 (= lt!65174 (_1!2220 e!28860))))

(declare-fun c!2837 () Bool)

(assert (=> d!12506 (= c!2837 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12506 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12506 (= (bitStreamReadBitsIntoList!0 (_2!2210 lt!65030) (_1!2211 lt!65031) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65174)))

(declare-fun lt!65176 () (_ BitVec 64))

(declare-datatypes ((tuple2!4256 0))(
  ( (tuple2!4257 (_1!2221 Bool) (_2!2221 BitStream!1742)) )
))
(declare-fun lt!65175 () tuple2!4256)

(declare-fun b!43178 () Bool)

(assert (=> b!43178 (= e!28860 (tuple2!4255 (Cons!508 (_1!2221 lt!65175) (bitStreamReadBitsIntoList!0 (_2!2210 lt!65030) (_2!2221 lt!65175) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!65176))) (_2!2221 lt!65175)))))

(declare-fun readBit!0 (BitStream!1742) tuple2!4256)

(assert (=> b!43178 (= lt!65175 (readBit!0 (_1!2211 lt!65031)))))

(assert (=> b!43178 (= lt!65176 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!43179 () Bool)

(declare-fun isEmpty!118 (List!512) Bool)

(assert (=> b!43179 (= e!28861 (isEmpty!118 lt!65174))))

(declare-fun b!43180 () Bool)

(declare-fun length!216 (List!512) Int)

(assert (=> b!43180 (= e!28861 (> (length!216 lt!65174) 0))))

(declare-fun b!43177 () Bool)

(assert (=> b!43177 (= e!28860 (tuple2!4255 Nil!509 (_1!2211 lt!65031)))))

(assert (= (and d!12506 c!2837) b!43177))

(assert (= (and d!12506 (not c!2837)) b!43178))

(assert (= (and d!12506 c!2838) b!43179))

(assert (= (and d!12506 (not c!2838)) b!43180))

(declare-fun m!65683 () Bool)

(assert (=> b!43178 m!65683))

(declare-fun m!65685 () Bool)

(assert (=> b!43178 m!65685))

(declare-fun m!65687 () Bool)

(assert (=> b!43179 m!65687))

(declare-fun m!65689 () Bool)

(assert (=> b!43180 m!65689))

(assert (=> b!43119 d!12506))

(declare-fun d!12508 () Bool)

(declare-fun res!36674 () Bool)

(declare-fun e!28866 () Bool)

(assert (=> d!12508 (=> (not res!36674) (not e!28866))))

(assert (=> d!12508 (= res!36674 (= (size!999 (buf!1333 thiss!1379)) (size!999 (buf!1333 (_2!2210 lt!65030)))))))

(assert (=> d!12508 (= (isPrefixOf!0 thiss!1379 (_2!2210 lt!65030)) e!28866)))

(declare-fun b!43187 () Bool)

(declare-fun res!36675 () Bool)

(assert (=> b!43187 (=> (not res!36675) (not e!28866))))

(assert (=> b!43187 (= res!36675 (bvsle (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)) (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030)))))))

(declare-fun b!43188 () Bool)

(declare-fun e!28867 () Bool)

(assert (=> b!43188 (= e!28866 e!28867)))

(declare-fun res!36673 () Bool)

(assert (=> b!43188 (=> res!36673 e!28867)))

(assert (=> b!43188 (= res!36673 (= (size!999 (buf!1333 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43189 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2210 array!2210 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43189 (= e!28867 (arrayBitRangesEq!0 (buf!1333 thiss!1379) (buf!1333 (_2!2210 lt!65030)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379))))))

(assert (= (and d!12508 res!36674) b!43187))

(assert (= (and b!43187 res!36675) b!43188))

(assert (= (and b!43188 (not res!36673)) b!43189))

(assert (=> b!43187 m!65563))

(declare-fun m!65691 () Bool)

(assert (=> b!43187 m!65691))

(assert (=> b!43189 m!65563))

(assert (=> b!43189 m!65563))

(declare-fun m!65693 () Bool)

(assert (=> b!43189 m!65693))

(assert (=> b!43114 d!12508))

(declare-fun d!12510 () Bool)

(assert (=> d!12510 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3371 () Bool)

(assert (= bs!3371 d!12510))

(declare-fun m!65695 () Bool)

(assert (=> bs!3371 m!65695))

(assert (=> b!43114 d!12510))

(declare-fun d!12512 () Bool)

(declare-fun e!28870 () Bool)

(assert (=> d!12512 e!28870))

(declare-fun res!36678 () Bool)

(assert (=> d!12512 (=> (not res!36678) (not e!28870))))

(assert (=> d!12512 (= res!36678 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!65179 () Unit!3068)

(declare-fun choose!27 (BitStream!1742 BitStream!1742 (_ BitVec 64) (_ BitVec 64)) Unit!3068)

(assert (=> d!12512 (= lt!65179 (choose!27 thiss!1379 (_2!2210 lt!65030) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12512 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12512 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2210 lt!65030) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65179)))

(declare-fun b!43192 () Bool)

(assert (=> b!43192 (= e!28870 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12512 res!36678) b!43192))

(declare-fun m!65697 () Bool)

(assert (=> d!12512 m!65697))

(assert (=> b!43192 m!65595))

(assert (=> b!43114 d!12512))

(declare-fun b!43210 () Bool)

(declare-fun res!36699 () Bool)

(declare-fun e!28879 () Bool)

(assert (=> b!43210 (=> (not res!36699) (not e!28879))))

(declare-fun lt!65205 () tuple2!4234)

(assert (=> b!43210 (= res!36699 (isPrefixOf!0 thiss!1379 (_2!2210 lt!65205)))))

(declare-fun b!43211 () Bool)

(declare-fun e!28880 () Bool)

(assert (=> b!43211 (= e!28879 e!28880)))

(declare-fun res!36695 () Bool)

(assert (=> b!43211 (=> (not res!36695) (not e!28880))))

(declare-datatypes ((tuple2!4258 0))(
  ( (tuple2!4259 (_1!2222 BitStream!1742) (_2!2222 Bool)) )
))
(declare-fun lt!65206 () tuple2!4258)

(declare-fun lt!65210 () Bool)

(assert (=> b!43211 (= res!36695 (and (= (_2!2222 lt!65206) lt!65210) (= (_1!2222 lt!65206) (_2!2210 lt!65205))))))

(declare-fun readBitPure!0 (BitStream!1742) tuple2!4258)

(declare-fun readerFrom!0 (BitStream!1742 (_ BitVec 32) (_ BitVec 32)) BitStream!1742)

(assert (=> b!43211 (= lt!65206 (readBitPure!0 (readerFrom!0 (_2!2210 lt!65205) (currentBit!2794 thiss!1379) (currentByte!2799 thiss!1379))))))

(declare-fun d!12514 () Bool)

(declare-fun e!28881 () Bool)

(assert (=> d!12514 e!28881))

(declare-fun res!36696 () Bool)

(assert (=> d!12514 (=> (not res!36696) (not e!28881))))

(declare-fun lt!65211 () tuple2!4234)

(assert (=> d!12514 (= res!36696 (= (size!999 (buf!1333 (_2!2210 lt!65211))) (size!999 (buf!1333 thiss!1379))))))

(declare-fun lt!65214 () (_ BitVec 8))

(declare-fun lt!65209 () array!2210)

(assert (=> d!12514 (= lt!65214 (select (arr!1501 lt!65209) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12514 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!999 lt!65209)))))

(assert (=> d!12514 (= lt!65209 (array!2211 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!65207 () tuple2!4234)

(assert (=> d!12514 (= lt!65211 (tuple2!4235 (_1!2210 lt!65207) (_2!2210 lt!65207)))))

(assert (=> d!12514 (= lt!65207 lt!65205)))

(assert (=> d!12514 e!28879))

(declare-fun res!36702 () Bool)

(assert (=> d!12514 (=> (not res!36702) (not e!28879))))

(assert (=> d!12514 (= res!36702 (= (size!999 (buf!1333 thiss!1379)) (size!999 (buf!1333 (_2!2210 lt!65205)))))))

(declare-fun appendBit!0 (BitStream!1742 Bool) tuple2!4234)

(assert (=> d!12514 (= lt!65205 (appendBit!0 thiss!1379 lt!65210))))

(assert (=> d!12514 (= lt!65210 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1501 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12514 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12514 (= (appendBitFromByte!0 thiss!1379 (select (arr!1501 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!65211)))

(declare-fun b!43212 () Bool)

(declare-fun res!36701 () Bool)

(assert (=> b!43212 (=> (not res!36701) (not e!28881))))

(assert (=> b!43212 (= res!36701 (isPrefixOf!0 thiss!1379 (_2!2210 lt!65211)))))

(declare-fun b!43213 () Bool)

(declare-fun res!36700 () Bool)

(assert (=> b!43213 (=> (not res!36700) (not e!28879))))

(assert (=> b!43213 (= res!36700 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65205))) (currentByte!2799 (_2!2210 lt!65205)) (currentBit!2794 (_2!2210 lt!65205))) (bvadd (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!43214 () Bool)

(declare-fun e!28882 () Bool)

(assert (=> b!43214 (= e!28881 e!28882)))

(declare-fun res!36697 () Bool)

(assert (=> b!43214 (=> (not res!36697) (not e!28882))))

(declare-fun lt!65212 () tuple2!4258)

(assert (=> b!43214 (= res!36697 (and (= (_2!2222 lt!65212) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1501 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!65214)) #b00000000000000000000000000000000))) (= (_1!2222 lt!65212) (_2!2210 lt!65211))))))

(declare-datatypes ((tuple2!4260 0))(
  ( (tuple2!4261 (_1!2223 array!2210) (_2!2223 BitStream!1742)) )
))
(declare-fun lt!65215 () tuple2!4260)

(declare-fun lt!65213 () BitStream!1742)

(declare-fun readBits!0 (BitStream!1742 (_ BitVec 64)) tuple2!4260)

(assert (=> b!43214 (= lt!65215 (readBits!0 lt!65213 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!43214 (= lt!65212 (readBitPure!0 lt!65213))))

(assert (=> b!43214 (= lt!65213 (readerFrom!0 (_2!2210 lt!65211) (currentBit!2794 thiss!1379) (currentByte!2799 thiss!1379)))))

(declare-fun b!43215 () Bool)

(assert (=> b!43215 (= e!28880 (= (bitIndex!0 (size!999 (buf!1333 (_1!2222 lt!65206))) (currentByte!2799 (_1!2222 lt!65206)) (currentBit!2794 (_1!2222 lt!65206))) (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65205))) (currentByte!2799 (_2!2210 lt!65205)) (currentBit!2794 (_2!2210 lt!65205)))))))

(declare-fun b!43216 () Bool)

(assert (=> b!43216 (= e!28882 (= (bitIndex!0 (size!999 (buf!1333 (_1!2222 lt!65212))) (currentByte!2799 (_1!2222 lt!65212)) (currentBit!2794 (_1!2222 lt!65212))) (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65211))) (currentByte!2799 (_2!2210 lt!65211)) (currentBit!2794 (_2!2210 lt!65211)))))))

(declare-fun b!43217 () Bool)

(declare-fun res!36698 () Bool)

(assert (=> b!43217 (=> (not res!36698) (not e!28881))))

(declare-fun lt!65204 () (_ BitVec 64))

(declare-fun lt!65208 () (_ BitVec 64))

(assert (=> b!43217 (= res!36698 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65211))) (currentByte!2799 (_2!2210 lt!65211)) (currentBit!2794 (_2!2210 lt!65211))) (bvadd lt!65204 lt!65208)))))

(assert (=> b!43217 (or (not (= (bvand lt!65204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65208 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!65204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!65204 lt!65208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43217 (= lt!65208 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!43217 (= lt!65204 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)))))

(assert (= (and d!12514 res!36702) b!43213))

(assert (= (and b!43213 res!36700) b!43210))

(assert (= (and b!43210 res!36699) b!43211))

(assert (= (and b!43211 res!36695) b!43215))

(assert (= (and d!12514 res!36696) b!43217))

(assert (= (and b!43217 res!36698) b!43212))

(assert (= (and b!43212 res!36701) b!43214))

(assert (= (and b!43214 res!36697) b!43216))

(declare-fun m!65699 () Bool)

(assert (=> b!43210 m!65699))

(declare-fun m!65701 () Bool)

(assert (=> b!43215 m!65701))

(declare-fun m!65703 () Bool)

(assert (=> b!43215 m!65703))

(assert (=> b!43213 m!65703))

(assert (=> b!43213 m!65563))

(declare-fun m!65705 () Bool)

(assert (=> b!43217 m!65705))

(assert (=> b!43217 m!65563))

(declare-fun m!65707 () Bool)

(assert (=> b!43216 m!65707))

(assert (=> b!43216 m!65705))

(declare-fun m!65709 () Bool)

(assert (=> b!43211 m!65709))

(assert (=> b!43211 m!65709))

(declare-fun m!65711 () Bool)

(assert (=> b!43211 m!65711))

(declare-fun m!65713 () Bool)

(assert (=> b!43214 m!65713))

(declare-fun m!65715 () Bool)

(assert (=> b!43214 m!65715))

(declare-fun m!65717 () Bool)

(assert (=> b!43214 m!65717))

(declare-fun m!65719 () Bool)

(assert (=> d!12514 m!65719))

(declare-fun m!65721 () Bool)

(assert (=> d!12514 m!65721))

(assert (=> d!12514 m!65679))

(declare-fun m!65723 () Bool)

(assert (=> b!43212 m!65723))

(assert (=> b!43114 d!12514))

(declare-fun d!12516 () Bool)

(declare-fun res!36704 () Bool)

(declare-fun e!28883 () Bool)

(assert (=> d!12516 (=> (not res!36704) (not e!28883))))

(assert (=> d!12516 (= res!36704 (= (size!999 (buf!1333 thiss!1379)) (size!999 (buf!1333 thiss!1379))))))

(assert (=> d!12516 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28883)))

(declare-fun b!43218 () Bool)

(declare-fun res!36705 () Bool)

(assert (=> b!43218 (=> (not res!36705) (not e!28883))))

(assert (=> b!43218 (= res!36705 (bvsle (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)) (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379))))))

(declare-fun b!43219 () Bool)

(declare-fun e!28884 () Bool)

(assert (=> b!43219 (= e!28883 e!28884)))

(declare-fun res!36703 () Bool)

(assert (=> b!43219 (=> res!36703 e!28884)))

(assert (=> b!43219 (= res!36703 (= (size!999 (buf!1333 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43220 () Bool)

(assert (=> b!43220 (= e!28884 (arrayBitRangesEq!0 (buf!1333 thiss!1379) (buf!1333 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379))))))

(assert (= (and d!12516 res!36704) b!43218))

(assert (= (and b!43218 res!36705) b!43219))

(assert (= (and b!43219 (not res!36703)) b!43220))

(assert (=> b!43218 m!65563))

(assert (=> b!43218 m!65563))

(assert (=> b!43220 m!65563))

(assert (=> b!43220 m!65563))

(declare-fun m!65725 () Bool)

(assert (=> b!43220 m!65725))

(assert (=> b!43120 d!12516))

(declare-fun d!12518 () Bool)

(assert (=> d!12518 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65218 () Unit!3068)

(declare-fun choose!11 (BitStream!1742) Unit!3068)

(assert (=> d!12518 (= lt!65218 (choose!11 thiss!1379))))

(assert (=> d!12518 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!65218)))

(declare-fun bs!3373 () Bool)

(assert (= bs!3373 d!12518))

(assert (=> bs!3373 m!65559))

(declare-fun m!65727 () Bool)

(assert (=> bs!3373 m!65727))

(assert (=> b!43120 d!12518))

(declare-fun d!12520 () Bool)

(declare-fun e!28887 () Bool)

(assert (=> d!12520 e!28887))

(declare-fun res!36710 () Bool)

(assert (=> d!12520 (=> (not res!36710) (not e!28887))))

(declare-fun lt!65235 () (_ BitVec 64))

(declare-fun lt!65234 () (_ BitVec 64))

(declare-fun lt!65232 () (_ BitVec 64))

(assert (=> d!12520 (= res!36710 (= lt!65232 (bvsub lt!65235 lt!65234)))))

(assert (=> d!12520 (or (= (bvand lt!65235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65234 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65235 lt!65234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12520 (= lt!65234 (remainingBits!0 ((_ sign_extend 32) (size!999 (buf!1333 thiss!1379))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379))))))

(declare-fun lt!65231 () (_ BitVec 64))

(declare-fun lt!65236 () (_ BitVec 64))

(assert (=> d!12520 (= lt!65235 (bvmul lt!65231 lt!65236))))

(assert (=> d!12520 (or (= lt!65231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65236 (bvsdiv (bvmul lt!65231 lt!65236) lt!65231)))))

(assert (=> d!12520 (= lt!65236 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12520 (= lt!65231 ((_ sign_extend 32) (size!999 (buf!1333 thiss!1379))))))

(assert (=> d!12520 (= lt!65232 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2799 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2794 thiss!1379))))))

(assert (=> d!12520 (invariant!0 (currentBit!2794 thiss!1379) (currentByte!2799 thiss!1379) (size!999 (buf!1333 thiss!1379)))))

(assert (=> d!12520 (= (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)) lt!65232)))

(declare-fun b!43225 () Bool)

(declare-fun res!36711 () Bool)

(assert (=> b!43225 (=> (not res!36711) (not e!28887))))

(assert (=> b!43225 (= res!36711 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65232))))

(declare-fun b!43226 () Bool)

(declare-fun lt!65233 () (_ BitVec 64))

(assert (=> b!43226 (= e!28887 (bvsle lt!65232 (bvmul lt!65233 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43226 (or (= lt!65233 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65233 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65233)))))

(assert (=> b!43226 (= lt!65233 ((_ sign_extend 32) (size!999 (buf!1333 thiss!1379))))))

(assert (= (and d!12520 res!36710) b!43225))

(assert (= (and b!43225 res!36711) b!43226))

(assert (=> d!12520 m!65675))

(assert (=> d!12520 m!65677))

(assert (=> b!43120 d!12520))

(declare-fun d!12522 () Bool)

(declare-fun e!28888 () Bool)

(assert (=> d!12522 e!28888))

(declare-fun res!36712 () Bool)

(assert (=> d!12522 (=> (not res!36712) (not e!28888))))

(declare-fun lt!65241 () (_ BitVec 64))

(declare-fun lt!65240 () (_ BitVec 64))

(declare-fun lt!65238 () (_ BitVec 64))

(assert (=> d!12522 (= res!36712 (= lt!65238 (bvsub lt!65241 lt!65240)))))

(assert (=> d!12522 (or (= (bvand lt!65241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65241 lt!65240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12522 (= lt!65240 (remainingBits!0 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65032)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65032))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65032)))))))

(declare-fun lt!65237 () (_ BitVec 64))

(declare-fun lt!65242 () (_ BitVec 64))

(assert (=> d!12522 (= lt!65241 (bvmul lt!65237 lt!65242))))

(assert (=> d!12522 (or (= lt!65237 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65242 (bvsdiv (bvmul lt!65237 lt!65242) lt!65237)))))

(assert (=> d!12522 (= lt!65242 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12522 (= lt!65237 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65032)))))))

(assert (=> d!12522 (= lt!65238 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65032))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65032)))))))

(assert (=> d!12522 (invariant!0 (currentBit!2794 (_2!2210 lt!65032)) (currentByte!2799 (_2!2210 lt!65032)) (size!999 (buf!1333 (_2!2210 lt!65032))))))

(assert (=> d!12522 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65032))) (currentByte!2799 (_2!2210 lt!65032)) (currentBit!2794 (_2!2210 lt!65032))) lt!65238)))

(declare-fun b!43227 () Bool)

(declare-fun res!36713 () Bool)

(assert (=> b!43227 (=> (not res!36713) (not e!28888))))

(assert (=> b!43227 (= res!36713 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65238))))

(declare-fun b!43228 () Bool)

(declare-fun lt!65239 () (_ BitVec 64))

(assert (=> b!43228 (= e!28888 (bvsle lt!65238 (bvmul lt!65239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43228 (or (= lt!65239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65239)))))

(assert (=> b!43228 (= lt!65239 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65032)))))))

(assert (= (and d!12522 res!36712) b!43227))

(assert (= (and b!43227 res!36713) b!43228))

(declare-fun m!65729 () Bool)

(assert (=> d!12522 m!65729))

(declare-fun m!65731 () Bool)

(assert (=> d!12522 m!65731))

(assert (=> b!43115 d!12522))

(declare-fun d!12524 () Bool)

(declare-fun res!36715 () Bool)

(declare-fun e!28889 () Bool)

(assert (=> d!12524 (=> (not res!36715) (not e!28889))))

(assert (=> d!12524 (= res!36715 (= (size!999 (buf!1333 thiss!1379)) (size!999 (buf!1333 (_2!2210 lt!65032)))))))

(assert (=> d!12524 (= (isPrefixOf!0 thiss!1379 (_2!2210 lt!65032)) e!28889)))

(declare-fun b!43229 () Bool)

(declare-fun res!36716 () Bool)

(assert (=> b!43229 (=> (not res!36716) (not e!28889))))

(assert (=> b!43229 (= res!36716 (bvsle (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)) (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65032))) (currentByte!2799 (_2!2210 lt!65032)) (currentBit!2794 (_2!2210 lt!65032)))))))

(declare-fun b!43230 () Bool)

(declare-fun e!28890 () Bool)

(assert (=> b!43230 (= e!28889 e!28890)))

(declare-fun res!36714 () Bool)

(assert (=> b!43230 (=> res!36714 e!28890)))

(assert (=> b!43230 (= res!36714 (= (size!999 (buf!1333 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43231 () Bool)

(assert (=> b!43231 (= e!28890 (arrayBitRangesEq!0 (buf!1333 thiss!1379) (buf!1333 (_2!2210 lt!65032)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379))))))

(assert (= (and d!12524 res!36715) b!43229))

(assert (= (and b!43229 res!36716) b!43230))

(assert (= (and b!43230 (not res!36714)) b!43231))

(assert (=> b!43229 m!65563))

(assert (=> b!43229 m!65587))

(assert (=> b!43231 m!65563))

(assert (=> b!43231 m!65563))

(declare-fun m!65733 () Bool)

(assert (=> b!43231 m!65733))

(assert (=> b!43116 d!12524))

(declare-fun d!12526 () Bool)

(declare-fun res!36718 () Bool)

(declare-fun e!28891 () Bool)

(assert (=> d!12526 (=> (not res!36718) (not e!28891))))

(assert (=> d!12526 (= res!36718 (= (size!999 (buf!1333 (_2!2210 lt!65030))) (size!999 (buf!1333 (_2!2210 lt!65032)))))))

(assert (=> d!12526 (= (isPrefixOf!0 (_2!2210 lt!65030) (_2!2210 lt!65032)) e!28891)))

(declare-fun b!43232 () Bool)

(declare-fun res!36719 () Bool)

(assert (=> b!43232 (=> (not res!36719) (not e!28891))))

(assert (=> b!43232 (= res!36719 (bvsle (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030))) (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65032))) (currentByte!2799 (_2!2210 lt!65032)) (currentBit!2794 (_2!2210 lt!65032)))))))

(declare-fun b!43233 () Bool)

(declare-fun e!28892 () Bool)

(assert (=> b!43233 (= e!28891 e!28892)))

(declare-fun res!36717 () Bool)

(assert (=> b!43233 (=> res!36717 e!28892)))

(assert (=> b!43233 (= res!36717 (= (size!999 (buf!1333 (_2!2210 lt!65030))) #b00000000000000000000000000000000))))

(declare-fun b!43234 () Bool)

(assert (=> b!43234 (= e!28892 (arrayBitRangesEq!0 (buf!1333 (_2!2210 lt!65030)) (buf!1333 (_2!2210 lt!65032)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030)))))))

(assert (= (and d!12526 res!36718) b!43232))

(assert (= (and b!43232 res!36719) b!43233))

(assert (= (and b!43233 (not res!36717)) b!43234))

(assert (=> b!43232 m!65691))

(assert (=> b!43232 m!65587))

(assert (=> b!43234 m!65691))

(assert (=> b!43234 m!65691))

(declare-fun m!65735 () Bool)

(assert (=> b!43234 m!65735))

(assert (=> b!43116 d!12526))

(declare-fun b!43431 () Bool)

(declare-fun res!36864 () Bool)

(declare-fun e!28989 () Bool)

(assert (=> b!43431 (=> (not res!36864) (not e!28989))))

(declare-fun lt!65774 () tuple2!4234)

(assert (=> b!43431 (= res!36864 (isPrefixOf!0 (_2!2210 lt!65030) (_2!2210 lt!65774)))))

(declare-fun call!508 () tuple2!4236)

(declare-fun c!2865 () Bool)

(declare-fun lt!65777 () tuple2!4234)

(declare-fun bm!505 () Bool)

(assert (=> bm!505 (= call!508 (reader!0 (_2!2210 lt!65030) (ite c!2865 (_2!2210 lt!65777) (_2!2210 lt!65030))))))

(declare-fun b!43432 () Bool)

(declare-fun res!36867 () Bool)

(assert (=> b!43432 (=> (not res!36867) (not e!28989))))

(assert (=> b!43432 (= res!36867 (= (size!999 (buf!1333 (_2!2210 lt!65774))) (size!999 (buf!1333 (_2!2210 lt!65030)))))))

(declare-fun d!12528 () Bool)

(assert (=> d!12528 e!28989))

(declare-fun res!36862 () Bool)

(assert (=> d!12528 (=> (not res!36862) (not e!28989))))

(declare-fun lt!65753 () (_ BitVec 64))

(assert (=> d!12528 (= res!36862 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65774))) (currentByte!2799 (_2!2210 lt!65774)) (currentBit!2794 (_2!2210 lt!65774))) (bvsub lt!65753 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12528 (or (= (bvand lt!65753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65753 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!65771 () (_ BitVec 64))

(assert (=> d!12528 (= lt!65753 (bvadd lt!65771 to!314))))

(assert (=> d!12528 (or (not (= (bvand lt!65771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!65771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!65771 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12528 (= lt!65771 (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030))))))

(declare-fun e!28991 () tuple2!4234)

(assert (=> d!12528 (= lt!65774 e!28991)))

(assert (=> d!12528 (= c!2865 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!65783 () Unit!3068)

(declare-fun lt!65754 () Unit!3068)

(assert (=> d!12528 (= lt!65783 lt!65754)))

(assert (=> d!12528 (isPrefixOf!0 (_2!2210 lt!65030) (_2!2210 lt!65030))))

(assert (=> d!12528 (= lt!65754 (lemmaIsPrefixRefl!0 (_2!2210 lt!65030)))))

(declare-fun lt!65759 () (_ BitVec 64))

(assert (=> d!12528 (= lt!65759 (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030))))))

(assert (=> d!12528 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12528 (= (appendBitsMSBFirstLoop!0 (_2!2210 lt!65030) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!65774)))

(declare-fun b!43433 () Bool)

(declare-fun res!36863 () Bool)

(assert (=> b!43433 (=> (not res!36863) (not e!28989))))

(assert (=> b!43433 (= res!36863 (= (size!999 (buf!1333 (_2!2210 lt!65030))) (size!999 (buf!1333 (_2!2210 lt!65774)))))))

(declare-fun b!43434 () Bool)

(declare-fun lt!65776 () tuple2!4234)

(declare-fun Unit!3086 () Unit!3068)

(assert (=> b!43434 (= e!28991 (tuple2!4235 Unit!3086 (_2!2210 lt!65776)))))

(assert (=> b!43434 (= lt!65777 (appendBitFromByte!0 (_2!2210 lt!65030) (select (arr!1501 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!65762 () (_ BitVec 64))

(assert (=> b!43434 (= lt!65762 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65787 () (_ BitVec 64))

(assert (=> b!43434 (= lt!65787 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65782 () Unit!3068)

(assert (=> b!43434 (= lt!65782 (validateOffsetBitsIneqLemma!0 (_2!2210 lt!65030) (_2!2210 lt!65777) lt!65762 lt!65787))))

(assert (=> b!43434 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65777)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65777))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65777))) (bvsub lt!65762 lt!65787))))

(declare-fun lt!65763 () Unit!3068)

(assert (=> b!43434 (= lt!65763 lt!65782)))

(declare-fun lt!65778 () tuple2!4236)

(assert (=> b!43434 (= lt!65778 call!508)))

(declare-fun lt!65748 () (_ BitVec 64))

(assert (=> b!43434 (= lt!65748 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65752 () Unit!3068)

(assert (=> b!43434 (= lt!65752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2210 lt!65030) (buf!1333 (_2!2210 lt!65777)) lt!65748))))

(assert (=> b!43434 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65777)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) lt!65748)))

(declare-fun lt!65749 () Unit!3068)

(assert (=> b!43434 (= lt!65749 lt!65752)))

(assert (=> b!43434 (= (head!331 (byteArrayBitContentToList!0 (_2!2210 lt!65777) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!331 (bitStreamReadBitsIntoList!0 (_2!2210 lt!65777) (_1!2211 lt!65778) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65756 () Unit!3068)

(declare-fun Unit!3087 () Unit!3068)

(assert (=> b!43434 (= lt!65756 Unit!3087)))

(assert (=> b!43434 (= lt!65776 (appendBitsMSBFirstLoop!0 (_2!2210 lt!65777) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!65750 () Unit!3068)

(assert (=> b!43434 (= lt!65750 (lemmaIsPrefixTransitive!0 (_2!2210 lt!65030) (_2!2210 lt!65777) (_2!2210 lt!65776)))))

(assert (=> b!43434 (isPrefixOf!0 (_2!2210 lt!65030) (_2!2210 lt!65776))))

(declare-fun lt!65788 () Unit!3068)

(assert (=> b!43434 (= lt!65788 lt!65750)))

(assert (=> b!43434 (= (size!999 (buf!1333 (_2!2210 lt!65776))) (size!999 (buf!1333 (_2!2210 lt!65030))))))

(declare-fun lt!65786 () Unit!3068)

(declare-fun Unit!3088 () Unit!3068)

(assert (=> b!43434 (= lt!65786 Unit!3088)))

(assert (=> b!43434 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65776))) (currentByte!2799 (_2!2210 lt!65776)) (currentBit!2794 (_2!2210 lt!65776))) (bvsub (bvadd (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65768 () Unit!3068)

(declare-fun Unit!3089 () Unit!3068)

(assert (=> b!43434 (= lt!65768 Unit!3089)))

(assert (=> b!43434 (= (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65776))) (currentByte!2799 (_2!2210 lt!65776)) (currentBit!2794 (_2!2210 lt!65776))) (bvsub (bvsub (bvadd (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65777))) (currentByte!2799 (_2!2210 lt!65777)) (currentBit!2794 (_2!2210 lt!65777))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65745 () Unit!3068)

(declare-fun Unit!3090 () Unit!3068)

(assert (=> b!43434 (= lt!65745 Unit!3090)))

(declare-fun lt!65751 () tuple2!4236)

(assert (=> b!43434 (= lt!65751 (reader!0 (_2!2210 lt!65030) (_2!2210 lt!65776)))))

(declare-fun lt!65785 () (_ BitVec 64))

(assert (=> b!43434 (= lt!65785 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65765 () Unit!3068)

(assert (=> b!43434 (= lt!65765 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2210 lt!65030) (buf!1333 (_2!2210 lt!65776)) lt!65785))))

(assert (=> b!43434 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65776)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) lt!65785)))

(declare-fun lt!65764 () Unit!3068)

(assert (=> b!43434 (= lt!65764 lt!65765)))

(declare-fun lt!65746 () tuple2!4236)

(assert (=> b!43434 (= lt!65746 (reader!0 (_2!2210 lt!65777) (_2!2210 lt!65776)))))

(declare-fun lt!65779 () (_ BitVec 64))

(assert (=> b!43434 (= lt!65779 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65781 () Unit!3068)

(assert (=> b!43434 (= lt!65781 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2210 lt!65777) (buf!1333 (_2!2210 lt!65776)) lt!65779))))

(assert (=> b!43434 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65776)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65777))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65777))) lt!65779)))

(declare-fun lt!65775 () Unit!3068)

(assert (=> b!43434 (= lt!65775 lt!65781)))

(declare-fun lt!65766 () List!512)

(assert (=> b!43434 (= lt!65766 (byteArrayBitContentToList!0 (_2!2210 lt!65776) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!65761 () List!512)

(assert (=> b!43434 (= lt!65761 (byteArrayBitContentToList!0 (_2!2210 lt!65776) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65767 () List!512)

(assert (=> b!43434 (= lt!65767 (bitStreamReadBitsIntoList!0 (_2!2210 lt!65776) (_1!2211 lt!65751) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!65770 () List!512)

(assert (=> b!43434 (= lt!65770 (bitStreamReadBitsIntoList!0 (_2!2210 lt!65776) (_1!2211 lt!65746) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65760 () (_ BitVec 64))

(assert (=> b!43434 (= lt!65760 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65773 () Unit!3068)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1742 BitStream!1742 BitStream!1742 BitStream!1742 (_ BitVec 64) List!512) Unit!3068)

(assert (=> b!43434 (= lt!65773 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2210 lt!65776) (_2!2210 lt!65776) (_1!2211 lt!65751) (_1!2211 lt!65746) lt!65760 lt!65767))))

(declare-fun tail!207 (List!512) List!512)

(assert (=> b!43434 (= (bitStreamReadBitsIntoList!0 (_2!2210 lt!65776) (_1!2211 lt!65746) (bvsub lt!65760 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!207 lt!65767))))

(declare-fun lt!65769 () Unit!3068)

(assert (=> b!43434 (= lt!65769 lt!65773)))

(declare-fun lt!65758 () Unit!3068)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2210 array!2210 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3068)

(assert (=> b!43434 (= lt!65758 (arrayBitRangesEqImpliesEq!0 (buf!1333 (_2!2210 lt!65777)) (buf!1333 (_2!2210 lt!65776)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!65759 (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65777))) (currentByte!2799 (_2!2210 lt!65777)) (currentBit!2794 (_2!2210 lt!65777)))))))

(declare-fun bitAt!0 (array!2210 (_ BitVec 64)) Bool)

(assert (=> b!43434 (= (bitAt!0 (buf!1333 (_2!2210 lt!65777)) lt!65759) (bitAt!0 (buf!1333 (_2!2210 lt!65776)) lt!65759))))

(declare-fun lt!65757 () Unit!3068)

(assert (=> b!43434 (= lt!65757 lt!65758)))

(declare-fun b!43435 () Bool)

(declare-fun res!36866 () Bool)

(assert (=> b!43435 (=> (not res!36866) (not e!28989))))

(assert (=> b!43435 (= res!36866 (invariant!0 (currentBit!2794 (_2!2210 lt!65774)) (currentByte!2799 (_2!2210 lt!65774)) (size!999 (buf!1333 (_2!2210 lt!65774)))))))

(declare-fun b!43436 () Bool)

(declare-fun Unit!3091 () Unit!3068)

(assert (=> b!43436 (= e!28991 (tuple2!4235 Unit!3091 (_2!2210 lt!65030)))))

(assert (=> b!43436 (= (size!999 (buf!1333 (_2!2210 lt!65030))) (size!999 (buf!1333 (_2!2210 lt!65030))))))

(declare-fun lt!65755 () Unit!3068)

(declare-fun Unit!3092 () Unit!3068)

(assert (=> b!43436 (= lt!65755 Unit!3092)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1742 array!2210 array!2210 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43436 (checkByteArrayBitContent!0 (_2!2210 lt!65030) srcBuffer!2 (_1!2223 (readBits!0 (_1!2211 call!508) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!43437 () Bool)

(declare-fun e!28990 () Bool)

(declare-fun lt!65772 () (_ BitVec 64))

(assert (=> b!43437 (= e!28990 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) lt!65772))))

(declare-fun b!43438 () Bool)

(declare-fun lt!65784 () tuple2!4236)

(assert (=> b!43438 (= e!28989 (= (bitStreamReadBitsIntoList!0 (_2!2210 lt!65774) (_1!2211 lt!65784) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2210 lt!65774) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!43438 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43438 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!65747 () Unit!3068)

(declare-fun lt!65780 () Unit!3068)

(assert (=> b!43438 (= lt!65747 lt!65780)))

(assert (=> b!43438 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65774)))) ((_ sign_extend 32) (currentByte!2799 (_2!2210 lt!65030))) ((_ sign_extend 32) (currentBit!2794 (_2!2210 lt!65030))) lt!65772)))

(assert (=> b!43438 (= lt!65780 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2210 lt!65030) (buf!1333 (_2!2210 lt!65774)) lt!65772))))

(assert (=> b!43438 e!28990))

(declare-fun res!36865 () Bool)

(assert (=> b!43438 (=> (not res!36865) (not e!28990))))

(assert (=> b!43438 (= res!36865 (and (= (size!999 (buf!1333 (_2!2210 lt!65030))) (size!999 (buf!1333 (_2!2210 lt!65774)))) (bvsge lt!65772 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43438 (= lt!65772 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!43438 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43438 (= lt!65784 (reader!0 (_2!2210 lt!65030) (_2!2210 lt!65774)))))

(assert (= (and d!12528 c!2865) b!43434))

(assert (= (and d!12528 (not c!2865)) b!43436))

(assert (= (or b!43434 b!43436) bm!505))

(assert (= (and d!12528 res!36862) b!43435))

(assert (= (and b!43435 res!36866) b!43433))

(assert (= (and b!43433 res!36863) b!43431))

(assert (= (and b!43431 res!36864) b!43432))

(assert (= (and b!43432 res!36867) b!43438))

(assert (= (and b!43438 res!36865) b!43437))

(declare-fun m!66021 () Bool)

(assert (=> b!43431 m!66021))

(declare-fun m!66023 () Bool)

(assert (=> b!43435 m!66023))

(declare-fun m!66025 () Bool)

(assert (=> b!43438 m!66025))

(declare-fun m!66027 () Bool)

(assert (=> b!43438 m!66027))

(declare-fun m!66029 () Bool)

(assert (=> b!43438 m!66029))

(declare-fun m!66031 () Bool)

(assert (=> b!43438 m!66031))

(declare-fun m!66033 () Bool)

(assert (=> b!43438 m!66033))

(declare-fun m!66035 () Bool)

(assert (=> d!12528 m!66035))

(assert (=> d!12528 m!65691))

(declare-fun m!66037 () Bool)

(assert (=> d!12528 m!66037))

(declare-fun m!66039 () Bool)

(assert (=> d!12528 m!66039))

(declare-fun m!66041 () Bool)

(assert (=> b!43436 m!66041))

(declare-fun m!66043 () Bool)

(assert (=> b!43436 m!66043))

(declare-fun m!66045 () Bool)

(assert (=> b!43437 m!66045))

(declare-fun m!66047 () Bool)

(assert (=> bm!505 m!66047))

(declare-fun m!66049 () Bool)

(assert (=> b!43434 m!66049))

(declare-fun m!66051 () Bool)

(assert (=> b!43434 m!66051))

(declare-fun m!66053 () Bool)

(assert (=> b!43434 m!66053))

(declare-fun m!66055 () Bool)

(assert (=> b!43434 m!66055))

(declare-fun m!66057 () Bool)

(assert (=> b!43434 m!66057))

(declare-fun m!66059 () Bool)

(assert (=> b!43434 m!66059))

(declare-fun m!66061 () Bool)

(assert (=> b!43434 m!66061))

(declare-fun m!66063 () Bool)

(assert (=> b!43434 m!66063))

(declare-fun m!66065 () Bool)

(assert (=> b!43434 m!66065))

(assert (=> b!43434 m!66061))

(declare-fun m!66067 () Bool)

(assert (=> b!43434 m!66067))

(declare-fun m!66069 () Bool)

(assert (=> b!43434 m!66069))

(declare-fun m!66071 () Bool)

(assert (=> b!43434 m!66071))

(declare-fun m!66073 () Bool)

(assert (=> b!43434 m!66073))

(assert (=> b!43434 m!66069))

(declare-fun m!66075 () Bool)

(assert (=> b!43434 m!66075))

(declare-fun m!66077 () Bool)

(assert (=> b!43434 m!66077))

(declare-fun m!66079 () Bool)

(assert (=> b!43434 m!66079))

(assert (=> b!43434 m!65691))

(declare-fun m!66081 () Bool)

(assert (=> b!43434 m!66081))

(declare-fun m!66083 () Bool)

(assert (=> b!43434 m!66083))

(declare-fun m!66085 () Bool)

(assert (=> b!43434 m!66085))

(declare-fun m!66087 () Bool)

(assert (=> b!43434 m!66087))

(declare-fun m!66089 () Bool)

(assert (=> b!43434 m!66089))

(declare-fun m!66091 () Bool)

(assert (=> b!43434 m!66091))

(declare-fun m!66093 () Bool)

(assert (=> b!43434 m!66093))

(declare-fun m!66095 () Bool)

(assert (=> b!43434 m!66095))

(declare-fun m!66097 () Bool)

(assert (=> b!43434 m!66097))

(declare-fun m!66099 () Bool)

(assert (=> b!43434 m!66099))

(declare-fun m!66101 () Bool)

(assert (=> b!43434 m!66101))

(assert (=> b!43434 m!66097))

(declare-fun m!66103 () Bool)

(assert (=> b!43434 m!66103))

(declare-fun m!66105 () Bool)

(assert (=> b!43434 m!66105))

(assert (=> b!43434 m!66089))

(declare-fun m!66107 () Bool)

(assert (=> b!43434 m!66107))

(declare-fun m!66109 () Bool)

(assert (=> b!43434 m!66109))

(assert (=> b!43116 d!12528))

(declare-fun d!12594 () Bool)

(assert (=> d!12594 (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65791 () Unit!3068)

(declare-fun choose!9 (BitStream!1742 array!2210 (_ BitVec 64) BitStream!1742) Unit!3068)

(assert (=> d!12594 (= lt!65791 (choose!9 thiss!1379 (buf!1333 (_2!2210 lt!65030)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1743 (buf!1333 (_2!2210 lt!65030)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379))))))

(assert (=> d!12594 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1333 (_2!2210 lt!65030)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65791)))

(declare-fun bs!3382 () Bool)

(assert (= bs!3382 d!12594))

(assert (=> bs!3382 m!65581))

(declare-fun m!66111 () Bool)

(assert (=> bs!3382 m!66111))

(assert (=> b!43116 d!12594))

(declare-fun b!43449 () Bool)

(declare-fun res!36874 () Bool)

(declare-fun e!28996 () Bool)

(assert (=> b!43449 (=> (not res!36874) (not e!28996))))

(declare-fun lt!65842 () tuple2!4236)

(assert (=> b!43449 (= res!36874 (isPrefixOf!0 (_1!2211 lt!65842) thiss!1379))))

(declare-fun b!43450 () Bool)

(declare-fun e!28997 () Unit!3068)

(declare-fun lt!65838 () Unit!3068)

(assert (=> b!43450 (= e!28997 lt!65838)))

(declare-fun lt!65834 () (_ BitVec 64))

(assert (=> b!43450 (= lt!65834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65844 () (_ BitVec 64))

(assert (=> b!43450 (= lt!65844 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2210 array!2210 (_ BitVec 64) (_ BitVec 64)) Unit!3068)

(assert (=> b!43450 (= lt!65838 (arrayBitRangesEqSymmetric!0 (buf!1333 thiss!1379) (buf!1333 (_2!2210 lt!65030)) lt!65834 lt!65844))))

(assert (=> b!43450 (arrayBitRangesEq!0 (buf!1333 (_2!2210 lt!65030)) (buf!1333 thiss!1379) lt!65834 lt!65844)))

(declare-fun lt!65846 () (_ BitVec 64))

(declare-fun b!43451 () Bool)

(declare-fun lt!65850 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1742 (_ BitVec 64)) BitStream!1742)

(assert (=> b!43451 (= e!28996 (= (_1!2211 lt!65842) (withMovedBitIndex!0 (_2!2211 lt!65842) (bvsub lt!65846 lt!65850))))))

(assert (=> b!43451 (or (= (bvand lt!65846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65846 lt!65850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43451 (= lt!65850 (bitIndex!0 (size!999 (buf!1333 (_2!2210 lt!65030))) (currentByte!2799 (_2!2210 lt!65030)) (currentBit!2794 (_2!2210 lt!65030))))))

(assert (=> b!43451 (= lt!65846 (bitIndex!0 (size!999 (buf!1333 thiss!1379)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)))))

(declare-fun d!12596 () Bool)

(assert (=> d!12596 e!28996))

(declare-fun res!36875 () Bool)

(assert (=> d!12596 (=> (not res!36875) (not e!28996))))

(assert (=> d!12596 (= res!36875 (isPrefixOf!0 (_1!2211 lt!65842) (_2!2211 lt!65842)))))

(declare-fun lt!65843 () BitStream!1742)

(assert (=> d!12596 (= lt!65842 (tuple2!4237 lt!65843 (_2!2210 lt!65030)))))

(declare-fun lt!65849 () Unit!3068)

(declare-fun lt!65836 () Unit!3068)

(assert (=> d!12596 (= lt!65849 lt!65836)))

(assert (=> d!12596 (isPrefixOf!0 lt!65843 (_2!2210 lt!65030))))

(assert (=> d!12596 (= lt!65836 (lemmaIsPrefixTransitive!0 lt!65843 (_2!2210 lt!65030) (_2!2210 lt!65030)))))

(declare-fun lt!65841 () Unit!3068)

(declare-fun lt!65837 () Unit!3068)

(assert (=> d!12596 (= lt!65841 lt!65837)))

(assert (=> d!12596 (isPrefixOf!0 lt!65843 (_2!2210 lt!65030))))

(assert (=> d!12596 (= lt!65837 (lemmaIsPrefixTransitive!0 lt!65843 thiss!1379 (_2!2210 lt!65030)))))

(declare-fun lt!65833 () Unit!3068)

(assert (=> d!12596 (= lt!65833 e!28997)))

(declare-fun c!2868 () Bool)

(assert (=> d!12596 (= c!2868 (not (= (size!999 (buf!1333 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!65840 () Unit!3068)

(declare-fun lt!65839 () Unit!3068)

(assert (=> d!12596 (= lt!65840 lt!65839)))

(assert (=> d!12596 (isPrefixOf!0 (_2!2210 lt!65030) (_2!2210 lt!65030))))

(assert (=> d!12596 (= lt!65839 (lemmaIsPrefixRefl!0 (_2!2210 lt!65030)))))

(declare-fun lt!65845 () Unit!3068)

(declare-fun lt!65832 () Unit!3068)

(assert (=> d!12596 (= lt!65845 lt!65832)))

(assert (=> d!12596 (= lt!65832 (lemmaIsPrefixRefl!0 (_2!2210 lt!65030)))))

(declare-fun lt!65851 () Unit!3068)

(declare-fun lt!65835 () Unit!3068)

(assert (=> d!12596 (= lt!65851 lt!65835)))

(assert (=> d!12596 (isPrefixOf!0 lt!65843 lt!65843)))

(assert (=> d!12596 (= lt!65835 (lemmaIsPrefixRefl!0 lt!65843))))

(declare-fun lt!65848 () Unit!3068)

(declare-fun lt!65847 () Unit!3068)

(assert (=> d!12596 (= lt!65848 lt!65847)))

(assert (=> d!12596 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12596 (= lt!65847 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12596 (= lt!65843 (BitStream!1743 (buf!1333 (_2!2210 lt!65030)) (currentByte!2799 thiss!1379) (currentBit!2794 thiss!1379)))))

(assert (=> d!12596 (isPrefixOf!0 thiss!1379 (_2!2210 lt!65030))))

(assert (=> d!12596 (= (reader!0 thiss!1379 (_2!2210 lt!65030)) lt!65842)))

(declare-fun b!43452 () Bool)

(declare-fun Unit!3093 () Unit!3068)

(assert (=> b!43452 (= e!28997 Unit!3093)))

(declare-fun b!43453 () Bool)

(declare-fun res!36876 () Bool)

(assert (=> b!43453 (=> (not res!36876) (not e!28996))))

(assert (=> b!43453 (= res!36876 (isPrefixOf!0 (_2!2211 lt!65842) (_2!2210 lt!65030)))))

(assert (= (and d!12596 c!2868) b!43450))

(assert (= (and d!12596 (not c!2868)) b!43452))

(assert (= (and d!12596 res!36875) b!43449))

(assert (= (and b!43449 res!36874) b!43453))

(assert (= (and b!43453 res!36876) b!43451))

(declare-fun m!66113 () Bool)

(assert (=> b!43453 m!66113))

(declare-fun m!66115 () Bool)

(assert (=> b!43451 m!66115))

(assert (=> b!43451 m!65691))

(assert (=> b!43451 m!65563))

(declare-fun m!66117 () Bool)

(assert (=> b!43449 m!66117))

(declare-fun m!66119 () Bool)

(assert (=> d!12596 m!66119))

(assert (=> d!12596 m!65591))

(assert (=> d!12596 m!65559))

(declare-fun m!66121 () Bool)

(assert (=> d!12596 m!66121))

(assert (=> d!12596 m!66039))

(declare-fun m!66123 () Bool)

(assert (=> d!12596 m!66123))

(declare-fun m!66125 () Bool)

(assert (=> d!12596 m!66125))

(assert (=> d!12596 m!66037))

(declare-fun m!66127 () Bool)

(assert (=> d!12596 m!66127))

(declare-fun m!66129 () Bool)

(assert (=> d!12596 m!66129))

(assert (=> d!12596 m!65561))

(assert (=> b!43450 m!65563))

(declare-fun m!66131 () Bool)

(assert (=> b!43450 m!66131))

(declare-fun m!66133 () Bool)

(assert (=> b!43450 m!66133))

(assert (=> b!43116 d!12596))

(declare-fun d!12598 () Bool)

(assert (=> d!12598 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!999 (buf!1333 (_2!2210 lt!65030)))) ((_ sign_extend 32) (currentByte!2799 thiss!1379)) ((_ sign_extend 32) (currentBit!2794 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3383 () Bool)

(assert (= bs!3383 d!12598))

(declare-fun m!66135 () Bool)

(assert (=> bs!3383 m!66135))

(assert (=> b!43116 d!12598))

(declare-fun d!12600 () Bool)

(assert (=> d!12600 (isPrefixOf!0 thiss!1379 (_2!2210 lt!65032))))

(declare-fun lt!65854 () Unit!3068)

(declare-fun choose!30 (BitStream!1742 BitStream!1742 BitStream!1742) Unit!3068)

(assert (=> d!12600 (= lt!65854 (choose!30 thiss!1379 (_2!2210 lt!65030) (_2!2210 lt!65032)))))

(assert (=> d!12600 (isPrefixOf!0 thiss!1379 (_2!2210 lt!65030))))

(assert (=> d!12600 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2210 lt!65030) (_2!2210 lt!65032)) lt!65854)))

(declare-fun bs!3384 () Bool)

(assert (= bs!3384 d!12600))

(assert (=> bs!3384 m!65573))

(declare-fun m!66137 () Bool)

(assert (=> bs!3384 m!66137))

(assert (=> bs!3384 m!65591))

(assert (=> b!43116 d!12600))

(push 1)

(assert (not b!43231))

(assert (not b!43214))

(assert (not bm!505))

(assert (not b!43220))

(assert (not d!12520))

(assert (not d!12598))

(assert (not b!43210))

(assert (not d!12512))

(assert (not b!43217))

(assert (not d!12498))

(assert (not b!43187))

(assert (not d!12596))

(assert (not d!12492))

(assert (not b!43211))

(assert (not b!43179))

(assert (not d!12594))

(assert (not b!43437))

(assert (not b!43212))

(assert (not b!43189))

(assert (not b!43436))

(assert (not b!43453))

(assert (not d!12510))

(assert (not b!43216))

(assert (not d!12518))

(assert (not b!43438))

(assert (not b!43434))

(assert (not b!43168))

(assert (not d!12522))

(assert (not b!43178))

(assert (not b!43218))

(assert (not b!43229))

(assert (not b!43192))

(assert (not b!43180))

(assert (not b!43451))

(assert (not d!12600))

(assert (not d!12528))

(assert (not b!43213))

(assert (not b!43232))

(assert (not b!43435))

(assert (not d!12514))

(assert (not b!43215))

(assert (not b!43449))

(assert (not b!43431))

(assert (not b!43450))

(assert (not b!43234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

