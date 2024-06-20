; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13914 () Bool)

(assert start!13914)

(declare-fun b!71086 () Bool)

(declare-fun e!46286 () Bool)

(declare-datatypes ((array!2926 0))(
  ( (array!2927 (arr!1952 (Array (_ BitVec 32) (_ BitVec 8))) (size!1364 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2314 0))(
  ( (BitStream!2315 (buf!1745 array!2926) (currentByte!3465 (_ BitVec 32)) (currentBit!3460 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2314)

(declare-fun array_inv!1216 (array!2926) Bool)

(assert (=> b!71086 (= e!46286 (array_inv!1216 (buf!1745 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2926)

(declare-fun e!46289 () Bool)

(declare-datatypes ((Unit!4757 0))(
  ( (Unit!4758) )
))
(declare-datatypes ((tuple2!6156 0))(
  ( (tuple2!6157 (_1!3192 Unit!4757) (_2!3192 BitStream!2314)) )
))
(declare-fun lt!114744 () tuple2!6156)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!71087 () Bool)

(declare-datatypes ((tuple2!6158 0))(
  ( (tuple2!6159 (_1!3193 BitStream!2314) (_2!3193 BitStream!2314)) )
))
(declare-fun lt!114761 () tuple2!6158)

(declare-datatypes ((List!732 0))(
  ( (Nil!729) (Cons!728 (h!847 Bool) (t!1482 List!732)) )
))
(declare-fun head!551 (List!732) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2314 array!2926 (_ BitVec 64) (_ BitVec 64)) List!732)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2314 BitStream!2314 (_ BitVec 64)) List!732)

(assert (=> b!71087 (= e!46289 (= (head!551 (byteArrayBitContentToList!0 (_2!3192 lt!114744) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!551 (bitStreamReadBitsIntoList!0 (_2!3192 lt!114744) (_1!3193 lt!114761) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!71088 () Bool)

(declare-fun res!58600 () Bool)

(declare-fun e!46288 () Bool)

(assert (=> b!71088 (=> res!58600 e!46288)))

(declare-fun lt!114769 () tuple2!6156)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!71088 (= res!58600 (not (invariant!0 (currentBit!3460 (_2!3192 lt!114769)) (currentByte!3465 (_2!3192 lt!114769)) (size!1364 (buf!1745 (_2!3192 lt!114769))))))))

(declare-fun b!71089 () Bool)

(declare-fun e!46301 () Bool)

(assert (=> b!71089 (= e!46288 e!46301)))

(declare-fun res!58601 () Bool)

(assert (=> b!71089 (=> res!58601 e!46301)))

(assert (=> b!71089 (= res!58601 (not (= (size!1364 (buf!1745 (_2!3192 lt!114744))) (size!1364 (buf!1745 (_2!3192 lt!114769))))))))

(declare-fun lt!114745 () (_ BitVec 64))

(declare-fun lt!114765 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!71089 (= lt!114745 (bvsub (bvsub (bvadd lt!114765 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!71089 (= lt!114765 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(assert (=> b!71089 (= (size!1364 (buf!1745 (_2!3192 lt!114769))) (size!1364 (buf!1745 thiss!1379)))))

(declare-fun b!71090 () Bool)

(declare-fun e!46291 () Bool)

(declare-fun e!46287 () Bool)

(assert (=> b!71090 (= e!46291 e!46287)))

(declare-fun res!58612 () Bool)

(assert (=> b!71090 (=> res!58612 e!46287)))

(declare-fun lt!114747 () Bool)

(declare-fun lt!114768 () Bool)

(assert (=> b!71090 (= res!58612 (not (= lt!114747 lt!114768)))))

(declare-fun lt!114762 () List!732)

(assert (=> b!71090 (= lt!114747 (head!551 lt!114762))))

(declare-fun lt!114766 () (_ BitVec 64))

(declare-fun lt!114754 () (_ BitVec 64))

(declare-fun b!71091 () Bool)

(declare-fun lt!114746 () Bool)

(declare-fun e!46294 () Bool)

(assert (=> b!71091 (= e!46294 (or (not (= lt!114747 lt!114746)) (let ((bdg!3338 (bvand lt!114766 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!3338 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!3338 (bvand lt!114754 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!71093 () Bool)

(declare-fun e!46296 () Bool)

(declare-fun e!46285 () Bool)

(assert (=> b!71093 (= e!46296 e!46285)))

(declare-fun res!58618 () Bool)

(assert (=> b!71093 (=> res!58618 e!46285)))

(declare-fun lt!114763 () Bool)

(declare-fun lt!114752 () Bool)

(assert (=> b!71093 (= res!58618 (not (= lt!114763 lt!114752)))))

(declare-fun lt!114743 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2926 (_ BitVec 64)) Bool)

(assert (=> b!71093 (= lt!114763 (bitAt!0 (buf!1745 (_2!3192 lt!114744)) lt!114743))))

(declare-fun b!71094 () Bool)

(declare-fun e!46295 () Bool)

(declare-fun e!46293 () Bool)

(assert (=> b!71094 (= e!46295 e!46293)))

(declare-fun res!58609 () Bool)

(assert (=> b!71094 (=> res!58609 e!46293)))

(declare-fun lt!114767 () List!732)

(declare-fun lt!114753 () List!732)

(assert (=> b!71094 (= res!58609 (not (= lt!114767 lt!114753)))))

(assert (=> b!71094 (= lt!114753 lt!114767)))

(declare-fun tail!336 (List!732) List!732)

(assert (=> b!71094 (= lt!114767 (tail!336 lt!114762))))

(declare-fun lt!114751 () tuple2!6158)

(declare-fun lt!114757 () tuple2!6158)

(declare-fun lt!114749 () Unit!4757)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2314 BitStream!2314 BitStream!2314 BitStream!2314 (_ BitVec 64) List!732) Unit!4757)

(assert (=> b!71094 (= lt!114749 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3192 lt!114769) (_2!3192 lt!114769) (_1!3193 lt!114757) (_1!3193 lt!114751) (bvsub to!314 i!635) lt!114762))))

(declare-fun b!71095 () Bool)

(declare-fun res!58613 () Bool)

(assert (=> b!71095 (=> res!58613 e!46295)))

(declare-fun length!360 (List!732) Int)

(assert (=> b!71095 (= res!58613 (<= (length!360 lt!114762) 0))))

(declare-fun b!71096 () Bool)

(assert (=> b!71096 (= e!46285 e!46294)))

(declare-fun res!58619 () Bool)

(assert (=> b!71096 (=> res!58619 e!46294)))

(declare-fun lt!114760 () Bool)

(assert (=> b!71096 (= res!58619 (not (= lt!114760 lt!114752)))))

(assert (=> b!71096 (= lt!114763 lt!114760)))

(assert (=> b!71096 (= lt!114760 (bitAt!0 (buf!1745 (_2!3192 lt!114769)) lt!114743))))

(declare-fun lt!114756 () Unit!4757)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2926 array!2926 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4757)

(assert (=> b!71096 (= lt!114756 (arrayBitRangesEqImpliesEq!0 (buf!1745 (_2!3192 lt!114744)) (buf!1745 (_2!3192 lt!114769)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114743 lt!114765))))

(declare-fun b!71097 () Bool)

(declare-fun res!58610 () Bool)

(declare-fun e!46298 () Bool)

(assert (=> b!71097 (=> (not res!58610) (not e!46298))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71097 (= res!58610 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 thiss!1379))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!71098 () Bool)

(declare-fun res!58616 () Bool)

(assert (=> b!71098 (=> res!58616 e!46301)))

(assert (=> b!71098 (= res!58616 (not (invariant!0 (currentBit!3460 (_2!3192 lt!114744)) (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114744))))))))

(declare-fun b!71099 () Bool)

(assert (=> b!71099 (= e!46287 e!46296)))

(declare-fun res!58607 () Bool)

(assert (=> b!71099 (=> res!58607 e!46296)))

(assert (=> b!71099 (= res!58607 (not (= lt!114746 lt!114752)))))

(assert (=> b!71099 (= lt!114752 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!71099 (= lt!114746 (head!551 (byteArrayBitContentToList!0 (_2!3192 lt!114769) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!71100 () Bool)

(declare-fun e!46297 () Bool)

(assert (=> b!71100 (= e!46298 (not e!46297))))

(declare-fun res!58606 () Bool)

(assert (=> b!71100 (=> res!58606 e!46297)))

(assert (=> b!71100 (= res!58606 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2314 BitStream!2314) Bool)

(assert (=> b!71100 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!114764 () Unit!4757)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2314) Unit!4757)

(assert (=> b!71100 (= lt!114764 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!71100 (= lt!114743 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(declare-fun b!71101 () Bool)

(declare-fun res!58611 () Bool)

(assert (=> b!71101 (=> res!58611 e!46301)))

(assert (=> b!71101 (= res!58611 (not (invariant!0 (currentBit!3460 (_2!3192 lt!114744)) (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114769))))))))

(declare-fun b!71102 () Bool)

(declare-fun e!46300 () Bool)

(assert (=> b!71102 (= e!46300 e!46288)))

(declare-fun res!58602 () Bool)

(assert (=> b!71102 (=> res!58602 e!46288)))

(assert (=> b!71102 (= res!58602 (not (= lt!114745 lt!114754)))))

(assert (=> b!71102 (= lt!114754 (bvsub lt!114766 i!635))))

(assert (=> b!71102 (= lt!114745 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114769))) (currentByte!3465 (_2!3192 lt!114769)) (currentBit!3460 (_2!3192 lt!114769))))))

(assert (=> b!71102 (= lt!114766 (bvadd lt!114743 to!314))))

(declare-fun b!71103 () Bool)

(assert (=> b!71103 (= e!46301 e!46295)))

(declare-fun res!58608 () Bool)

(assert (=> b!71103 (=> res!58608 e!46295)))

(assert (=> b!71103 (= res!58608 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!114759 () (_ BitVec 64))

(assert (=> b!71103 (= lt!114753 (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_1!3193 lt!114751) lt!114759))))

(assert (=> b!71103 (= lt!114762 (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_1!3193 lt!114757) (bvsub to!314 i!635)))))

(assert (=> b!71103 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!114759)))

(declare-fun lt!114750 () Unit!4757)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2314 array!2926 (_ BitVec 64)) Unit!4757)

(assert (=> b!71103 (= lt!114750 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3192 lt!114744) (buf!1745 (_2!3192 lt!114769)) lt!114759))))

(declare-fun reader!0 (BitStream!2314 BitStream!2314) tuple2!6158)

(assert (=> b!71103 (= lt!114751 (reader!0 (_2!3192 lt!114744) (_2!3192 lt!114769)))))

(assert (=> b!71103 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!114742 () Unit!4757)

(assert (=> b!71103 (= lt!114742 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1745 (_2!3192 lt!114769)) (bvsub to!314 i!635)))))

(assert (=> b!71103 (= lt!114757 (reader!0 thiss!1379 (_2!3192 lt!114769)))))

(declare-fun b!71104 () Bool)

(assert (=> b!71104 (= e!46293 e!46291)))

(declare-fun res!58614 () Bool)

(assert (=> b!71104 (=> res!58614 e!46291)))

(assert (=> b!71104 (= res!58614 (not (= lt!114768 (bitAt!0 (buf!1745 (_1!3193 lt!114751)) lt!114743))))))

(assert (=> b!71104 (= lt!114768 (bitAt!0 (buf!1745 (_1!3193 lt!114757)) lt!114743))))

(declare-fun b!71105 () Bool)

(declare-fun e!46299 () Bool)

(assert (=> b!71105 (= e!46297 e!46299)))

(declare-fun res!58615 () Bool)

(assert (=> b!71105 (=> res!58615 e!46299)))

(assert (=> b!71105 (= res!58615 (not (isPrefixOf!0 thiss!1379 (_2!3192 lt!114744))))))

(assert (=> b!71105 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!114759)))

(assert (=> b!71105 (= lt!114759 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114758 () Unit!4757)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2314 BitStream!2314 (_ BitVec 64) (_ BitVec 64)) Unit!4757)

(assert (=> b!71105 (= lt!114758 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3192 lt!114744) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2314 (_ BitVec 8) (_ BitVec 32)) tuple2!6156)

(assert (=> b!71105 (= lt!114744 (appendBitFromByte!0 thiss!1379 (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!71092 () Bool)

(declare-fun res!58604 () Bool)

(assert (=> b!71092 (=> res!58604 e!46288)))

(assert (=> b!71092 (= res!58604 (not (= (size!1364 (buf!1745 thiss!1379)) (size!1364 (buf!1745 (_2!3192 lt!114769))))))))

(declare-fun res!58617 () Bool)

(assert (=> start!13914 (=> (not res!58617) (not e!46298))))

(assert (=> start!13914 (= res!58617 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1364 srcBuffer!2))))))))

(assert (=> start!13914 e!46298))

(assert (=> start!13914 true))

(assert (=> start!13914 (array_inv!1216 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2314) Bool)

(assert (=> start!13914 (and (inv!12 thiss!1379) e!46286)))

(declare-fun b!71106 () Bool)

(declare-fun res!58603 () Bool)

(assert (=> b!71106 (=> res!58603 e!46294)))

(declare-datatypes ((tuple2!6160 0))(
  ( (tuple2!6161 (_1!3194 BitStream!2314) (_2!3194 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2314) tuple2!6160)

(assert (=> b!71106 (= res!58603 (not (= (_2!3194 (readBitPure!0 (_1!3193 lt!114757))) lt!114752)))))

(declare-fun b!71107 () Bool)

(assert (=> b!71107 (= e!46299 e!46300)))

(declare-fun res!58620 () Bool)

(assert (=> b!71107 (=> res!58620 e!46300)))

(assert (=> b!71107 (= res!58620 (not (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!114769))))))

(assert (=> b!71107 (isPrefixOf!0 thiss!1379 (_2!3192 lt!114769))))

(declare-fun lt!114755 () Unit!4757)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2314 BitStream!2314 BitStream!2314) Unit!4757)

(assert (=> b!71107 (= lt!114755 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3192 lt!114744) (_2!3192 lt!114769)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2314 array!2926 (_ BitVec 64) (_ BitVec 64)) tuple2!6156)

(assert (=> b!71107 (= lt!114769 (appendBitsMSBFirstLoop!0 (_2!3192 lt!114744) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!71107 e!46289))

(declare-fun res!58605 () Bool)

(assert (=> b!71107 (=> (not res!58605) (not e!46289))))

(assert (=> b!71107 (= res!58605 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114748 () Unit!4757)

(assert (=> b!71107 (= lt!114748 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1745 (_2!3192 lt!114744)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71107 (= lt!114761 (reader!0 thiss!1379 (_2!3192 lt!114744)))))

(assert (= (and start!13914 res!58617) b!71097))

(assert (= (and b!71097 res!58610) b!71100))

(assert (= (and b!71100 (not res!58606)) b!71105))

(assert (= (and b!71105 (not res!58615)) b!71107))

(assert (= (and b!71107 res!58605) b!71087))

(assert (= (and b!71107 (not res!58620)) b!71102))

(assert (= (and b!71102 (not res!58602)) b!71088))

(assert (= (and b!71088 (not res!58600)) b!71092))

(assert (= (and b!71092 (not res!58604)) b!71089))

(assert (= (and b!71089 (not res!58601)) b!71098))

(assert (= (and b!71098 (not res!58616)) b!71101))

(assert (= (and b!71101 (not res!58611)) b!71103))

(assert (= (and b!71103 (not res!58608)) b!71095))

(assert (= (and b!71095 (not res!58613)) b!71094))

(assert (= (and b!71094 (not res!58609)) b!71104))

(assert (= (and b!71104 (not res!58614)) b!71090))

(assert (= (and b!71090 (not res!58612)) b!71099))

(assert (= (and b!71099 (not res!58607)) b!71093))

(assert (= (and b!71093 (not res!58618)) b!71096))

(assert (= (and b!71096 (not res!58619)) b!71106))

(assert (= (and b!71106 (not res!58603)) b!71091))

(assert (= start!13914 b!71086))

(declare-fun m!113983 () Bool)

(assert (=> b!71104 m!113983))

(declare-fun m!113985 () Bool)

(assert (=> b!71104 m!113985))

(declare-fun m!113987 () Bool)

(assert (=> b!71101 m!113987))

(declare-fun m!113989 () Bool)

(assert (=> b!71086 m!113989))

(declare-fun m!113991 () Bool)

(assert (=> b!71107 m!113991))

(declare-fun m!113993 () Bool)

(assert (=> b!71107 m!113993))

(declare-fun m!113995 () Bool)

(assert (=> b!71107 m!113995))

(declare-fun m!113997 () Bool)

(assert (=> b!71107 m!113997))

(declare-fun m!113999 () Bool)

(assert (=> b!71107 m!113999))

(declare-fun m!114001 () Bool)

(assert (=> b!71107 m!114001))

(declare-fun m!114003 () Bool)

(assert (=> b!71107 m!114003))

(declare-fun m!114005 () Bool)

(assert (=> b!71102 m!114005))

(declare-fun m!114007 () Bool)

(assert (=> b!71106 m!114007))

(declare-fun m!114009 () Bool)

(assert (=> b!71090 m!114009))

(declare-fun m!114011 () Bool)

(assert (=> start!13914 m!114011))

(declare-fun m!114013 () Bool)

(assert (=> start!13914 m!114013))

(declare-fun m!114015 () Bool)

(assert (=> b!71098 m!114015))

(declare-fun m!114017 () Bool)

(assert (=> b!71103 m!114017))

(declare-fun m!114019 () Bool)

(assert (=> b!71103 m!114019))

(declare-fun m!114021 () Bool)

(assert (=> b!71103 m!114021))

(declare-fun m!114023 () Bool)

(assert (=> b!71103 m!114023))

(declare-fun m!114025 () Bool)

(assert (=> b!71103 m!114025))

(declare-fun m!114027 () Bool)

(assert (=> b!71103 m!114027))

(declare-fun m!114029 () Bool)

(assert (=> b!71103 m!114029))

(declare-fun m!114031 () Bool)

(assert (=> b!71103 m!114031))

(declare-fun m!114033 () Bool)

(assert (=> b!71093 m!114033))

(declare-fun m!114035 () Bool)

(assert (=> b!71097 m!114035))

(declare-fun m!114037 () Bool)

(assert (=> b!71094 m!114037))

(declare-fun m!114039 () Bool)

(assert (=> b!71094 m!114039))

(declare-fun m!114041 () Bool)

(assert (=> b!71099 m!114041))

(declare-fun m!114043 () Bool)

(assert (=> b!71099 m!114043))

(assert (=> b!71099 m!114043))

(declare-fun m!114045 () Bool)

(assert (=> b!71099 m!114045))

(declare-fun m!114047 () Bool)

(assert (=> b!71100 m!114047))

(declare-fun m!114049 () Bool)

(assert (=> b!71100 m!114049))

(declare-fun m!114051 () Bool)

(assert (=> b!71100 m!114051))

(declare-fun m!114053 () Bool)

(assert (=> b!71105 m!114053))

(declare-fun m!114055 () Bool)

(assert (=> b!71105 m!114055))

(declare-fun m!114057 () Bool)

(assert (=> b!71105 m!114057))

(declare-fun m!114059 () Bool)

(assert (=> b!71105 m!114059))

(assert (=> b!71105 m!114057))

(declare-fun m!114061 () Bool)

(assert (=> b!71105 m!114061))

(declare-fun m!114063 () Bool)

(assert (=> b!71087 m!114063))

(assert (=> b!71087 m!114063))

(declare-fun m!114065 () Bool)

(assert (=> b!71087 m!114065))

(declare-fun m!114067 () Bool)

(assert (=> b!71087 m!114067))

(assert (=> b!71087 m!114067))

(declare-fun m!114069 () Bool)

(assert (=> b!71087 m!114069))

(declare-fun m!114071 () Bool)

(assert (=> b!71095 m!114071))

(declare-fun m!114073 () Bool)

(assert (=> b!71096 m!114073))

(declare-fun m!114075 () Bool)

(assert (=> b!71096 m!114075))

(declare-fun m!114077 () Bool)

(assert (=> b!71089 m!114077))

(declare-fun m!114079 () Bool)

(assert (=> b!71088 m!114079))

(push 1)

(assert (not b!71096))

(assert (not b!71086))

(assert (not b!71105))

(assert (not b!71104))

(assert (not start!13914))

(assert (not b!71101))

(assert (not b!71099))

(assert (not b!71100))

(assert (not b!71089))

(assert (not b!71107))

(assert (not b!71088))

(assert (not b!71102))

(assert (not b!71097))

(assert (not b!71106))

(assert (not b!71090))

(assert (not b!71098))

(assert (not b!71103))

(assert (not b!71087))

(assert (not b!71095))

(assert (not b!71093))

(assert (not b!71094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23038 () Bool)

(declare-fun size!1368 (List!732) Int)

(assert (=> d!23038 (= (length!360 lt!114762) (size!1368 lt!114762))))

(declare-fun bs!5517 () Bool)

(assert (= bs!5517 d!23038))

(declare-fun m!114449 () Bool)

(assert (=> bs!5517 m!114449))

(assert (=> b!71095 d!23038))

(declare-fun d!23040 () Bool)

(declare-datatypes ((tuple2!6182 0))(
  ( (tuple2!6183 (_1!3205 Bool) (_2!3205 BitStream!2314)) )
))
(declare-fun lt!115156 () tuple2!6182)

(declare-fun readBit!0 (BitStream!2314) tuple2!6182)

(assert (=> d!23040 (= lt!115156 (readBit!0 (_1!3193 lt!114757)))))

(assert (=> d!23040 (= (readBitPure!0 (_1!3193 lt!114757)) (tuple2!6161 (_2!3205 lt!115156) (_1!3205 lt!115156)))))

(declare-fun bs!5518 () Bool)

(assert (= bs!5518 d!23040))

(declare-fun m!114451 () Bool)

(assert (=> bs!5518 m!114451))

(assert (=> b!71106 d!23040))

(declare-fun d!23042 () Bool)

(assert (=> d!23042 (= (bitAt!0 (buf!1745 (_1!3193 lt!114751)) lt!114743) (not (= (bvand ((_ sign_extend 24) (select (arr!1952 (buf!1745 (_1!3193 lt!114751))) ((_ extract 31 0) (bvsdiv lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5519 () Bool)

(assert (= bs!5519 d!23042))

(declare-fun m!114481 () Bool)

(assert (=> bs!5519 m!114481))

(declare-fun m!114483 () Bool)

(assert (=> bs!5519 m!114483))

(assert (=> b!71104 d!23042))

(declare-fun d!23046 () Bool)

(assert (=> d!23046 (= (bitAt!0 (buf!1745 (_1!3193 lt!114757)) lt!114743) (not (= (bvand ((_ sign_extend 24) (select (arr!1952 (buf!1745 (_1!3193 lt!114757))) ((_ extract 31 0) (bvsdiv lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5520 () Bool)

(assert (= bs!5520 d!23046))

(declare-fun m!114485 () Bool)

(assert (=> bs!5520 m!114485))

(assert (=> bs!5520 m!114483))

(assert (=> b!71104 d!23046))

(declare-fun d!23048 () Bool)

(declare-fun res!58856 () Bool)

(declare-fun e!46482 () Bool)

(assert (=> d!23048 (=> (not res!58856) (not e!46482))))

(assert (=> d!23048 (= res!58856 (= (size!1364 (buf!1745 thiss!1379)) (size!1364 (buf!1745 (_2!3192 lt!114744)))))))

(assert (=> d!23048 (= (isPrefixOf!0 thiss!1379 (_2!3192 lt!114744)) e!46482)))

(declare-fun b!71387 () Bool)

(declare-fun res!58854 () Bool)

(assert (=> b!71387 (=> (not res!58854) (not e!46482))))

(assert (=> b!71387 (= res!58854 (bvsle (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)) (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744)))))))

(declare-fun b!71388 () Bool)

(declare-fun e!46483 () Bool)

(assert (=> b!71388 (= e!46482 e!46483)))

(declare-fun res!58855 () Bool)

(assert (=> b!71388 (=> res!58855 e!46483)))

(assert (=> b!71388 (= res!58855 (= (size!1364 (buf!1745 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71389 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2926 array!2926 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71389 (= e!46483 (arrayBitRangesEq!0 (buf!1745 thiss!1379) (buf!1745 (_2!3192 lt!114744)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379))))))

(assert (= (and d!23048 res!58856) b!71387))

(assert (= (and b!71387 res!58854) b!71388))

(assert (= (and b!71388 (not res!58855)) b!71389))

(assert (=> b!71387 m!114051))

(assert (=> b!71387 m!114077))

(assert (=> b!71389 m!114051))

(assert (=> b!71389 m!114051))

(declare-fun m!114489 () Bool)

(assert (=> b!71389 m!114489))

(assert (=> b!71105 d!23048))

(declare-fun d!23058 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!114759) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744)))) lt!114759))))

(declare-fun bs!5522 () Bool)

(assert (= bs!5522 d!23058))

(declare-fun m!114491 () Bool)

(assert (=> bs!5522 m!114491))

(assert (=> b!71105 d!23058))

(declare-fun d!23060 () Bool)

(declare-fun e!46488 () Bool)

(assert (=> d!23060 e!46488))

(declare-fun res!58861 () Bool)

(assert (=> d!23060 (=> (not res!58861) (not e!46488))))

(assert (=> d!23060 (= res!58861 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!115175 () Unit!4757)

(declare-fun choose!27 (BitStream!2314 BitStream!2314 (_ BitVec 64) (_ BitVec 64)) Unit!4757)

(assert (=> d!23060 (= lt!115175 (choose!27 thiss!1379 (_2!3192 lt!114744) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!23060 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!23060 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3192 lt!114744) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115175)))

(declare-fun b!71394 () Bool)

(assert (=> b!71394 (= e!46488 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23060 res!58861) b!71394))

(declare-fun m!114493 () Bool)

(assert (=> d!23060 m!114493))

(declare-fun m!114495 () Bool)

(assert (=> b!71394 m!114495))

(assert (=> b!71105 d!23060))

(declare-fun d!23062 () Bool)

(declare-fun e!46507 () Bool)

(assert (=> d!23062 e!46507))

(declare-fun res!58897 () Bool)

(assert (=> d!23062 (=> (not res!58897) (not e!46507))))

(declare-fun lt!115278 () tuple2!6156)

(assert (=> d!23062 (= res!58897 (= (size!1364 (buf!1745 (_2!3192 lt!115278))) (size!1364 (buf!1745 thiss!1379))))))

(declare-fun lt!115272 () (_ BitVec 8))

(declare-fun lt!115282 () array!2926)

(assert (=> d!23062 (= lt!115272 (select (arr!1952 lt!115282) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!23062 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1364 lt!115282)))))

(assert (=> d!23062 (= lt!115282 (array!2927 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!115277 () tuple2!6156)

(assert (=> d!23062 (= lt!115278 (tuple2!6157 (_1!3192 lt!115277) (_2!3192 lt!115277)))))

(declare-fun lt!115279 () tuple2!6156)

(assert (=> d!23062 (= lt!115277 lt!115279)))

(declare-fun e!46508 () Bool)

(assert (=> d!23062 e!46508))

(declare-fun res!58892 () Bool)

(assert (=> d!23062 (=> (not res!58892) (not e!46508))))

(assert (=> d!23062 (= res!58892 (= (size!1364 (buf!1745 thiss!1379)) (size!1364 (buf!1745 (_2!3192 lt!115279)))))))

(declare-fun lt!115273 () Bool)

(declare-fun appendBit!0 (BitStream!2314 Bool) tuple2!6156)

(assert (=> d!23062 (= lt!115279 (appendBit!0 thiss!1379 lt!115273))))

(assert (=> d!23062 (= lt!115273 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!23062 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!23062 (= (appendBitFromByte!0 thiss!1379 (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!115278)))

(declare-fun b!71431 () Bool)

(declare-fun e!46509 () Bool)

(declare-fun lt!115271 () tuple2!6160)

(assert (=> b!71431 (= e!46509 (= (bitIndex!0 (size!1364 (buf!1745 (_1!3194 lt!115271))) (currentByte!3465 (_1!3194 lt!115271)) (currentBit!3460 (_1!3194 lt!115271))) (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115279))) (currentByte!3465 (_2!3192 lt!115279)) (currentBit!3460 (_2!3192 lt!115279)))))))

(declare-fun b!71432 () Bool)

(declare-fun res!58893 () Bool)

(assert (=> b!71432 (=> (not res!58893) (not e!46507))))

(declare-fun lt!115275 () (_ BitVec 64))

(declare-fun lt!115281 () (_ BitVec 64))

(assert (=> b!71432 (= res!58893 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115278))) (currentByte!3465 (_2!3192 lt!115278)) (currentBit!3460 (_2!3192 lt!115278))) (bvadd lt!115275 lt!115281)))))

(assert (=> b!71432 (or (not (= (bvand lt!115275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115281 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!115275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!115275 lt!115281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71432 (= lt!115281 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!71432 (= lt!115275 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(declare-fun b!71433 () Bool)

(declare-fun res!58891 () Bool)

(assert (=> b!71433 (=> (not res!58891) (not e!46508))))

(assert (=> b!71433 (= res!58891 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115279))) (currentByte!3465 (_2!3192 lt!115279)) (currentBit!3460 (_2!3192 lt!115279))) (bvadd (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!71434 () Bool)

(declare-fun res!58896 () Bool)

(assert (=> b!71434 (=> (not res!58896) (not e!46507))))

(assert (=> b!71434 (= res!58896 (isPrefixOf!0 thiss!1379 (_2!3192 lt!115278)))))

(declare-fun b!71435 () Bool)

(assert (=> b!71435 (= e!46508 e!46509)))

(declare-fun res!58894 () Bool)

(assert (=> b!71435 (=> (not res!58894) (not e!46509))))

(assert (=> b!71435 (= res!58894 (and (= (_2!3194 lt!115271) lt!115273) (= (_1!3194 lt!115271) (_2!3192 lt!115279))))))

(declare-fun readerFrom!0 (BitStream!2314 (_ BitVec 32) (_ BitVec 32)) BitStream!2314)

(assert (=> b!71435 (= lt!115271 (readBitPure!0 (readerFrom!0 (_2!3192 lt!115279) (currentBit!3460 thiss!1379) (currentByte!3465 thiss!1379))))))

(declare-fun b!71436 () Bool)

(declare-fun res!58898 () Bool)

(assert (=> b!71436 (=> (not res!58898) (not e!46508))))

(assert (=> b!71436 (= res!58898 (isPrefixOf!0 thiss!1379 (_2!3192 lt!115279)))))

(declare-fun b!71437 () Bool)

(declare-fun e!46506 () Bool)

(declare-fun lt!115274 () tuple2!6160)

(assert (=> b!71437 (= e!46506 (= (bitIndex!0 (size!1364 (buf!1745 (_1!3194 lt!115274))) (currentByte!3465 (_1!3194 lt!115274)) (currentBit!3460 (_1!3194 lt!115274))) (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115278))) (currentByte!3465 (_2!3192 lt!115278)) (currentBit!3460 (_2!3192 lt!115278)))))))

(declare-fun b!71438 () Bool)

(assert (=> b!71438 (= e!46507 e!46506)))

(declare-fun res!58895 () Bool)

(assert (=> b!71438 (=> (not res!58895) (not e!46506))))

(assert (=> b!71438 (= res!58895 (and (= (_2!3194 lt!115274) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!115272)) #b00000000000000000000000000000000))) (= (_1!3194 lt!115274) (_2!3192 lt!115278))))))

(declare-datatypes ((tuple2!6184 0))(
  ( (tuple2!6185 (_1!3206 array!2926) (_2!3206 BitStream!2314)) )
))
(declare-fun lt!115280 () tuple2!6184)

(declare-fun lt!115276 () BitStream!2314)

(declare-fun readBits!0 (BitStream!2314 (_ BitVec 64)) tuple2!6184)

(assert (=> b!71438 (= lt!115280 (readBits!0 lt!115276 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71438 (= lt!115274 (readBitPure!0 lt!115276))))

(assert (=> b!71438 (= lt!115276 (readerFrom!0 (_2!3192 lt!115278) (currentBit!3460 thiss!1379) (currentByte!3465 thiss!1379)))))

(assert (= (and d!23062 res!58892) b!71433))

(assert (= (and b!71433 res!58891) b!71436))

(assert (= (and b!71436 res!58898) b!71435))

(assert (= (and b!71435 res!58894) b!71431))

(assert (= (and d!23062 res!58897) b!71432))

(assert (= (and b!71432 res!58893) b!71434))

(assert (= (and b!71434 res!58896) b!71438))

(assert (= (and b!71438 res!58895) b!71437))

(declare-fun m!114541 () Bool)

(assert (=> d!23062 m!114541))

(declare-fun m!114543 () Bool)

(assert (=> d!23062 m!114543))

(declare-fun m!114545 () Bool)

(assert (=> d!23062 m!114545))

(declare-fun m!114547 () Bool)

(assert (=> b!71434 m!114547))

(declare-fun m!114549 () Bool)

(assert (=> b!71436 m!114549))

(declare-fun m!114551 () Bool)

(assert (=> b!71432 m!114551))

(assert (=> b!71432 m!114051))

(declare-fun m!114553 () Bool)

(assert (=> b!71438 m!114553))

(declare-fun m!114555 () Bool)

(assert (=> b!71438 m!114555))

(declare-fun m!114557 () Bool)

(assert (=> b!71438 m!114557))

(declare-fun m!114559 () Bool)

(assert (=> b!71437 m!114559))

(assert (=> b!71437 m!114551))

(declare-fun m!114561 () Bool)

(assert (=> b!71433 m!114561))

(assert (=> b!71433 m!114051))

(declare-fun m!114563 () Bool)

(assert (=> b!71431 m!114563))

(assert (=> b!71431 m!114561))

(declare-fun m!114565 () Bool)

(assert (=> b!71435 m!114565))

(assert (=> b!71435 m!114565))

(declare-fun m!114567 () Bool)

(assert (=> b!71435 m!114567))

(assert (=> b!71105 d!23062))

(declare-fun d!23084 () Bool)

(assert (=> d!23084 (= (tail!336 lt!114762) (t!1482 lt!114762))))

(assert (=> b!71094 d!23084))

(declare-fun d!23086 () Bool)

(declare-fun e!46512 () Bool)

(assert (=> d!23086 e!46512))

(declare-fun res!58901 () Bool)

(assert (=> d!23086 (=> (not res!58901) (not e!46512))))

(declare-fun lt!115288 () (_ BitVec 64))

(assert (=> d!23086 (= res!58901 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!115288) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23086 (= lt!115288 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115287 () Unit!4757)

(declare-fun choose!42 (BitStream!2314 BitStream!2314 BitStream!2314 BitStream!2314 (_ BitVec 64) List!732) Unit!4757)

(assert (=> d!23086 (= lt!115287 (choose!42 (_2!3192 lt!114769) (_2!3192 lt!114769) (_1!3193 lt!114757) (_1!3193 lt!114751) (bvsub to!314 i!635) lt!114762))))

(assert (=> d!23086 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23086 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3192 lt!114769) (_2!3192 lt!114769) (_1!3193 lt!114757) (_1!3193 lt!114751) (bvsub to!314 i!635) lt!114762) lt!115287)))

(declare-fun b!71441 () Bool)

(assert (=> b!71441 (= e!46512 (= (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_1!3193 lt!114751) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!336 lt!114762)))))

(assert (= (and d!23086 res!58901) b!71441))

(declare-fun m!114569 () Bool)

(assert (=> d!23086 m!114569))

(declare-fun m!114571 () Bool)

(assert (=> b!71441 m!114571))

(assert (=> b!71441 m!114037))

(assert (=> b!71094 d!23086))

(declare-fun d!23088 () Bool)

(assert (=> d!23088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!115291 () Unit!4757)

(declare-fun choose!9 (BitStream!2314 array!2926 (_ BitVec 64) BitStream!2314) Unit!4757)

(assert (=> d!23088 (= lt!115291 (choose!9 thiss!1379 (buf!1745 (_2!3192 lt!114769)) (bvsub to!314 i!635) (BitStream!2315 (buf!1745 (_2!3192 lt!114769)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379))))))

(assert (=> d!23088 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1745 (_2!3192 lt!114769)) (bvsub to!314 i!635)) lt!115291)))

(declare-fun bs!5528 () Bool)

(assert (= bs!5528 d!23088))

(assert (=> bs!5528 m!114017))

(declare-fun m!114573 () Bool)

(assert (=> bs!5528 m!114573))

(assert (=> b!71103 d!23088))

(declare-fun b!71452 () Bool)

(declare-fun e!46517 () Unit!4757)

(declare-fun lt!115342 () Unit!4757)

(assert (=> b!71452 (= e!46517 lt!115342)))

(declare-fun lt!115335 () (_ BitVec 64))

(assert (=> b!71452 (= lt!115335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115345 () (_ BitVec 64))

(assert (=> b!71452 (= lt!115345 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2926 array!2926 (_ BitVec 64) (_ BitVec 64)) Unit!4757)

(assert (=> b!71452 (= lt!115342 (arrayBitRangesEqSymmetric!0 (buf!1745 thiss!1379) (buf!1745 (_2!3192 lt!114769)) lt!115335 lt!115345))))

(assert (=> b!71452 (arrayBitRangesEq!0 (buf!1745 (_2!3192 lt!114769)) (buf!1745 thiss!1379) lt!115335 lt!115345)))

(declare-fun d!23090 () Bool)

(declare-fun e!46518 () Bool)

(assert (=> d!23090 e!46518))

(declare-fun res!58909 () Bool)

(assert (=> d!23090 (=> (not res!58909) (not e!46518))))

(declare-fun lt!115333 () tuple2!6158)

(assert (=> d!23090 (= res!58909 (isPrefixOf!0 (_1!3193 lt!115333) (_2!3193 lt!115333)))))

(declare-fun lt!115340 () BitStream!2314)

(assert (=> d!23090 (= lt!115333 (tuple2!6159 lt!115340 (_2!3192 lt!114769)))))

(declare-fun lt!115343 () Unit!4757)

(declare-fun lt!115341 () Unit!4757)

(assert (=> d!23090 (= lt!115343 lt!115341)))

(assert (=> d!23090 (isPrefixOf!0 lt!115340 (_2!3192 lt!114769))))

(assert (=> d!23090 (= lt!115341 (lemmaIsPrefixTransitive!0 lt!115340 (_2!3192 lt!114769) (_2!3192 lt!114769)))))

(declare-fun lt!115339 () Unit!4757)

(declare-fun lt!115334 () Unit!4757)

(assert (=> d!23090 (= lt!115339 lt!115334)))

(assert (=> d!23090 (isPrefixOf!0 lt!115340 (_2!3192 lt!114769))))

(assert (=> d!23090 (= lt!115334 (lemmaIsPrefixTransitive!0 lt!115340 thiss!1379 (_2!3192 lt!114769)))))

(declare-fun lt!115338 () Unit!4757)

(assert (=> d!23090 (= lt!115338 e!46517)))

(declare-fun c!5356 () Bool)

(assert (=> d!23090 (= c!5356 (not (= (size!1364 (buf!1745 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!115348 () Unit!4757)

(declare-fun lt!115337 () Unit!4757)

(assert (=> d!23090 (= lt!115348 lt!115337)))

(assert (=> d!23090 (isPrefixOf!0 (_2!3192 lt!114769) (_2!3192 lt!114769))))

(assert (=> d!23090 (= lt!115337 (lemmaIsPrefixRefl!0 (_2!3192 lt!114769)))))

(declare-fun lt!115347 () Unit!4757)

(declare-fun lt!115349 () Unit!4757)

(assert (=> d!23090 (= lt!115347 lt!115349)))

(assert (=> d!23090 (= lt!115349 (lemmaIsPrefixRefl!0 (_2!3192 lt!114769)))))

(declare-fun lt!115346 () Unit!4757)

(declare-fun lt!115332 () Unit!4757)

(assert (=> d!23090 (= lt!115346 lt!115332)))

(assert (=> d!23090 (isPrefixOf!0 lt!115340 lt!115340)))

(assert (=> d!23090 (= lt!115332 (lemmaIsPrefixRefl!0 lt!115340))))

(declare-fun lt!115344 () Unit!4757)

(declare-fun lt!115336 () Unit!4757)

(assert (=> d!23090 (= lt!115344 lt!115336)))

(assert (=> d!23090 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23090 (= lt!115336 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23090 (= lt!115340 (BitStream!2315 (buf!1745 (_2!3192 lt!114769)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(assert (=> d!23090 (isPrefixOf!0 thiss!1379 (_2!3192 lt!114769))))

(assert (=> d!23090 (= (reader!0 thiss!1379 (_2!3192 lt!114769)) lt!115333)))

(declare-fun b!71453 () Bool)

(declare-fun Unit!4781 () Unit!4757)

(assert (=> b!71453 (= e!46517 Unit!4781)))

(declare-fun b!71454 () Bool)

(declare-fun res!58908 () Bool)

(assert (=> b!71454 (=> (not res!58908) (not e!46518))))

(assert (=> b!71454 (= res!58908 (isPrefixOf!0 (_1!3193 lt!115333) thiss!1379))))

(declare-fun b!71455 () Bool)

(declare-fun res!58910 () Bool)

(assert (=> b!71455 (=> (not res!58910) (not e!46518))))

(assert (=> b!71455 (= res!58910 (isPrefixOf!0 (_2!3193 lt!115333) (_2!3192 lt!114769)))))

(declare-fun b!71456 () Bool)

(declare-fun lt!115350 () (_ BitVec 64))

(declare-fun lt!115351 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2314 (_ BitVec 64)) BitStream!2314)

(assert (=> b!71456 (= e!46518 (= (_1!3193 lt!115333) (withMovedBitIndex!0 (_2!3193 lt!115333) (bvsub lt!115350 lt!115351))))))

(assert (=> b!71456 (or (= (bvand lt!115350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115351 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115350 lt!115351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71456 (= lt!115351 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114769))) (currentByte!3465 (_2!3192 lt!114769)) (currentBit!3460 (_2!3192 lt!114769))))))

(assert (=> b!71456 (= lt!115350 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(assert (= (and d!23090 c!5356) b!71452))

(assert (= (and d!23090 (not c!5356)) b!71453))

(assert (= (and d!23090 res!58909) b!71454))

(assert (= (and b!71454 res!58908) b!71455))

(assert (= (and b!71455 res!58910) b!71456))

(declare-fun m!114575 () Bool)

(assert (=> b!71454 m!114575))

(declare-fun m!114577 () Bool)

(assert (=> b!71456 m!114577))

(assert (=> b!71456 m!114005))

(assert (=> b!71456 m!114051))

(declare-fun m!114579 () Bool)

(assert (=> d!23090 m!114579))

(assert (=> d!23090 m!114049))

(declare-fun m!114581 () Bool)

(assert (=> d!23090 m!114581))

(declare-fun m!114583 () Bool)

(assert (=> d!23090 m!114583))

(declare-fun m!114585 () Bool)

(assert (=> d!23090 m!114585))

(declare-fun m!114587 () Bool)

(assert (=> d!23090 m!114587))

(declare-fun m!114589 () Bool)

(assert (=> d!23090 m!114589))

(assert (=> d!23090 m!114001))

(assert (=> d!23090 m!114047))

(declare-fun m!114591 () Bool)

(assert (=> d!23090 m!114591))

(declare-fun m!114593 () Bool)

(assert (=> d!23090 m!114593))

(assert (=> b!71452 m!114051))

(declare-fun m!114595 () Bool)

(assert (=> b!71452 m!114595))

(declare-fun m!114597 () Bool)

(assert (=> b!71452 m!114597))

(declare-fun m!114599 () Bool)

(assert (=> b!71455 m!114599))

(assert (=> b!71103 d!23090))

(declare-fun d!23092 () Bool)

(declare-fun e!46524 () Bool)

(assert (=> d!23092 e!46524))

(declare-fun c!5361 () Bool)

(assert (=> d!23092 (= c!5361 (= lt!114759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!115360 () List!732)

(declare-datatypes ((tuple2!6186 0))(
  ( (tuple2!6187 (_1!3207 List!732) (_2!3207 BitStream!2314)) )
))
(declare-fun e!46523 () tuple2!6186)

(assert (=> d!23092 (= lt!115360 (_1!3207 e!46523))))

(declare-fun c!5362 () Bool)

(assert (=> d!23092 (= c!5362 (= lt!114759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23092 (bvsge lt!114759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23092 (= (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_1!3193 lt!114751) lt!114759) lt!115360)))

(declare-fun b!71465 () Bool)

(assert (=> b!71465 (= e!46523 (tuple2!6187 Nil!729 (_1!3193 lt!114751)))))

(declare-fun b!71467 () Bool)

(declare-fun isEmpty!232 (List!732) Bool)

(assert (=> b!71467 (= e!46524 (isEmpty!232 lt!115360))))

(declare-fun lt!115358 () (_ BitVec 64))

(declare-fun lt!115359 () tuple2!6182)

(declare-fun b!71466 () Bool)

(assert (=> b!71466 (= e!46523 (tuple2!6187 (Cons!728 (_1!3205 lt!115359) (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_2!3205 lt!115359) (bvsub lt!114759 lt!115358))) (_2!3205 lt!115359)))))

(assert (=> b!71466 (= lt!115359 (readBit!0 (_1!3193 lt!114751)))))

(assert (=> b!71466 (= lt!115358 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71468 () Bool)

(assert (=> b!71468 (= e!46524 (> (length!360 lt!115360) 0))))

(assert (= (and d!23092 c!5362) b!71465))

(assert (= (and d!23092 (not c!5362)) b!71466))

(assert (= (and d!23092 c!5361) b!71467))

(assert (= (and d!23092 (not c!5361)) b!71468))

(declare-fun m!114601 () Bool)

(assert (=> b!71467 m!114601))

(declare-fun m!114603 () Bool)

(assert (=> b!71466 m!114603))

(declare-fun m!114605 () Bool)

(assert (=> b!71466 m!114605))

(declare-fun m!114607 () Bool)

(assert (=> b!71468 m!114607))

(assert (=> b!71103 d!23092))

(declare-fun d!23094 () Bool)

(assert (=> d!23094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!114759) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744)))) lt!114759))))

(declare-fun bs!5529 () Bool)

(assert (= bs!5529 d!23094))

(declare-fun m!114609 () Bool)

(assert (=> bs!5529 m!114609))

(assert (=> b!71103 d!23094))

(declare-fun d!23096 () Bool)

(assert (=> d!23096 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5530 () Bool)

(assert (= bs!5530 d!23096))

(declare-fun m!114611 () Bool)

(assert (=> bs!5530 m!114611))

(assert (=> b!71103 d!23096))

(declare-fun d!23098 () Bool)

(declare-fun e!46526 () Bool)

(assert (=> d!23098 e!46526))

(declare-fun c!5363 () Bool)

(assert (=> d!23098 (= c!5363 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!115363 () List!732)

(declare-fun e!46525 () tuple2!6186)

(assert (=> d!23098 (= lt!115363 (_1!3207 e!46525))))

(declare-fun c!5364 () Bool)

(assert (=> d!23098 (= c!5364 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23098 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23098 (= (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_1!3193 lt!114757) (bvsub to!314 i!635)) lt!115363)))

(declare-fun b!71469 () Bool)

(assert (=> b!71469 (= e!46525 (tuple2!6187 Nil!729 (_1!3193 lt!114757)))))

(declare-fun b!71471 () Bool)

(assert (=> b!71471 (= e!46526 (isEmpty!232 lt!115363))))

(declare-fun b!71470 () Bool)

(declare-fun lt!115362 () tuple2!6182)

(declare-fun lt!115361 () (_ BitVec 64))

(assert (=> b!71470 (= e!46525 (tuple2!6187 (Cons!728 (_1!3205 lt!115362) (bitStreamReadBitsIntoList!0 (_2!3192 lt!114769) (_2!3205 lt!115362) (bvsub (bvsub to!314 i!635) lt!115361))) (_2!3205 lt!115362)))))

(assert (=> b!71470 (= lt!115362 (readBit!0 (_1!3193 lt!114757)))))

(assert (=> b!71470 (= lt!115361 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71472 () Bool)

(assert (=> b!71472 (= e!46526 (> (length!360 lt!115363) 0))))

(assert (= (and d!23098 c!5364) b!71469))

(assert (= (and d!23098 (not c!5364)) b!71470))

(assert (= (and d!23098 c!5363) b!71471))

(assert (= (and d!23098 (not c!5363)) b!71472))

(declare-fun m!114613 () Bool)

(assert (=> b!71471 m!114613))

(declare-fun m!114615 () Bool)

(assert (=> b!71470 m!114615))

(assert (=> b!71470 m!114451))

(declare-fun m!114617 () Bool)

(assert (=> b!71472 m!114617))

(assert (=> b!71103 d!23098))

(declare-fun d!23100 () Bool)

(assert (=> d!23100 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!114759)))

(declare-fun lt!115364 () Unit!4757)

(assert (=> d!23100 (= lt!115364 (choose!9 (_2!3192 lt!114744) (buf!1745 (_2!3192 lt!114769)) lt!114759 (BitStream!2315 (buf!1745 (_2!3192 lt!114769)) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744)))))))

(assert (=> d!23100 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3192 lt!114744) (buf!1745 (_2!3192 lt!114769)) lt!114759) lt!115364)))

(declare-fun bs!5531 () Bool)

(assert (= bs!5531 d!23100))

(assert (=> bs!5531 m!114023))

(declare-fun m!114619 () Bool)

(assert (=> bs!5531 m!114619))

(assert (=> b!71103 d!23100))

(declare-fun b!71473 () Bool)

(declare-fun e!46527 () Unit!4757)

(declare-fun lt!115375 () Unit!4757)

(assert (=> b!71473 (= e!46527 lt!115375)))

(declare-fun lt!115368 () (_ BitVec 64))

(assert (=> b!71473 (= lt!115368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115378 () (_ BitVec 64))

(assert (=> b!71473 (= lt!115378 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(assert (=> b!71473 (= lt!115375 (arrayBitRangesEqSymmetric!0 (buf!1745 (_2!3192 lt!114744)) (buf!1745 (_2!3192 lt!114769)) lt!115368 lt!115378))))

(assert (=> b!71473 (arrayBitRangesEq!0 (buf!1745 (_2!3192 lt!114769)) (buf!1745 (_2!3192 lt!114744)) lt!115368 lt!115378)))

(declare-fun d!23102 () Bool)

(declare-fun e!46528 () Bool)

(assert (=> d!23102 e!46528))

(declare-fun res!58912 () Bool)

(assert (=> d!23102 (=> (not res!58912) (not e!46528))))

(declare-fun lt!115366 () tuple2!6158)

(assert (=> d!23102 (= res!58912 (isPrefixOf!0 (_1!3193 lt!115366) (_2!3193 lt!115366)))))

(declare-fun lt!115373 () BitStream!2314)

(assert (=> d!23102 (= lt!115366 (tuple2!6159 lt!115373 (_2!3192 lt!114769)))))

(declare-fun lt!115376 () Unit!4757)

(declare-fun lt!115374 () Unit!4757)

(assert (=> d!23102 (= lt!115376 lt!115374)))

(assert (=> d!23102 (isPrefixOf!0 lt!115373 (_2!3192 lt!114769))))

(assert (=> d!23102 (= lt!115374 (lemmaIsPrefixTransitive!0 lt!115373 (_2!3192 lt!114769) (_2!3192 lt!114769)))))

(declare-fun lt!115372 () Unit!4757)

(declare-fun lt!115367 () Unit!4757)

(assert (=> d!23102 (= lt!115372 lt!115367)))

(assert (=> d!23102 (isPrefixOf!0 lt!115373 (_2!3192 lt!114769))))

(assert (=> d!23102 (= lt!115367 (lemmaIsPrefixTransitive!0 lt!115373 (_2!3192 lt!114744) (_2!3192 lt!114769)))))

(declare-fun lt!115371 () Unit!4757)

(assert (=> d!23102 (= lt!115371 e!46527)))

(declare-fun c!5365 () Bool)

(assert (=> d!23102 (= c!5365 (not (= (size!1364 (buf!1745 (_2!3192 lt!114744))) #b00000000000000000000000000000000)))))

(declare-fun lt!115381 () Unit!4757)

(declare-fun lt!115370 () Unit!4757)

(assert (=> d!23102 (= lt!115381 lt!115370)))

(assert (=> d!23102 (isPrefixOf!0 (_2!3192 lt!114769) (_2!3192 lt!114769))))

(assert (=> d!23102 (= lt!115370 (lemmaIsPrefixRefl!0 (_2!3192 lt!114769)))))

(declare-fun lt!115380 () Unit!4757)

(declare-fun lt!115382 () Unit!4757)

(assert (=> d!23102 (= lt!115380 lt!115382)))

(assert (=> d!23102 (= lt!115382 (lemmaIsPrefixRefl!0 (_2!3192 lt!114769)))))

(declare-fun lt!115379 () Unit!4757)

(declare-fun lt!115365 () Unit!4757)

(assert (=> d!23102 (= lt!115379 lt!115365)))

(assert (=> d!23102 (isPrefixOf!0 lt!115373 lt!115373)))

(assert (=> d!23102 (= lt!115365 (lemmaIsPrefixRefl!0 lt!115373))))

(declare-fun lt!115377 () Unit!4757)

(declare-fun lt!115369 () Unit!4757)

(assert (=> d!23102 (= lt!115377 lt!115369)))

(assert (=> d!23102 (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!114744))))

(assert (=> d!23102 (= lt!115369 (lemmaIsPrefixRefl!0 (_2!3192 lt!114744)))))

(assert (=> d!23102 (= lt!115373 (BitStream!2315 (buf!1745 (_2!3192 lt!114769)) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(assert (=> d!23102 (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!114769))))

(assert (=> d!23102 (= (reader!0 (_2!3192 lt!114744) (_2!3192 lt!114769)) lt!115366)))

(declare-fun b!71474 () Bool)

(declare-fun Unit!4782 () Unit!4757)

(assert (=> b!71474 (= e!46527 Unit!4782)))

(declare-fun b!71475 () Bool)

(declare-fun res!58911 () Bool)

(assert (=> b!71475 (=> (not res!58911) (not e!46528))))

(assert (=> b!71475 (= res!58911 (isPrefixOf!0 (_1!3193 lt!115366) (_2!3192 lt!114744)))))

(declare-fun b!71476 () Bool)

(declare-fun res!58913 () Bool)

(assert (=> b!71476 (=> (not res!58913) (not e!46528))))

(assert (=> b!71476 (= res!58913 (isPrefixOf!0 (_2!3193 lt!115366) (_2!3192 lt!114769)))))

(declare-fun lt!115383 () (_ BitVec 64))

(declare-fun lt!115384 () (_ BitVec 64))

(declare-fun b!71477 () Bool)

(assert (=> b!71477 (= e!46528 (= (_1!3193 lt!115366) (withMovedBitIndex!0 (_2!3193 lt!115366) (bvsub lt!115383 lt!115384))))))

(assert (=> b!71477 (or (= (bvand lt!115383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115383 lt!115384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71477 (= lt!115384 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114769))) (currentByte!3465 (_2!3192 lt!114769)) (currentBit!3460 (_2!3192 lt!114769))))))

(assert (=> b!71477 (= lt!115383 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(assert (= (and d!23102 c!5365) b!71473))

(assert (= (and d!23102 (not c!5365)) b!71474))

(assert (= (and d!23102 res!58912) b!71475))

(assert (= (and b!71475 res!58911) b!71476))

(assert (= (and b!71476 res!58913) b!71477))

(declare-fun m!114621 () Bool)

(assert (=> b!71475 m!114621))

(declare-fun m!114623 () Bool)

(assert (=> b!71477 m!114623))

(assert (=> b!71477 m!114005))

(assert (=> b!71477 m!114077))

(declare-fun m!114625 () Bool)

(assert (=> d!23102 m!114625))

(declare-fun m!114627 () Bool)

(assert (=> d!23102 m!114627))

(declare-fun m!114629 () Bool)

(assert (=> d!23102 m!114629))

(declare-fun m!114631 () Bool)

(assert (=> d!23102 m!114631))

(declare-fun m!114633 () Bool)

(assert (=> d!23102 m!114633))

(declare-fun m!114635 () Bool)

(assert (=> d!23102 m!114635))

(declare-fun m!114637 () Bool)

(assert (=> d!23102 m!114637))

(assert (=> d!23102 m!113997))

(declare-fun m!114639 () Bool)

(assert (=> d!23102 m!114639))

(assert (=> d!23102 m!114591))

(assert (=> d!23102 m!114593))

(assert (=> b!71473 m!114077))

(declare-fun m!114641 () Bool)

(assert (=> b!71473 m!114641))

(declare-fun m!114643 () Bool)

(assert (=> b!71473 m!114643))

(declare-fun m!114645 () Bool)

(assert (=> b!71476 m!114645))

(assert (=> b!71103 d!23102))

(declare-fun d!23104 () Bool)

(assert (=> d!23104 (= (bitAt!0 (buf!1745 (_2!3192 lt!114744)) lt!114743) (not (= (bvand ((_ sign_extend 24) (select (arr!1952 (buf!1745 (_2!3192 lt!114744))) ((_ extract 31 0) (bvsdiv lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5532 () Bool)

(assert (= bs!5532 d!23104))

(declare-fun m!114647 () Bool)

(assert (=> bs!5532 m!114647))

(assert (=> bs!5532 m!114483))

(assert (=> b!71093 d!23104))

(declare-fun d!23106 () Bool)

(declare-fun e!46531 () Bool)

(assert (=> d!23106 e!46531))

(declare-fun res!58919 () Bool)

(assert (=> d!23106 (=> (not res!58919) (not e!46531))))

(declare-fun lt!115400 () (_ BitVec 64))

(declare-fun lt!115398 () (_ BitVec 64))

(declare-fun lt!115402 () (_ BitVec 64))

(assert (=> d!23106 (= res!58919 (= lt!115400 (bvsub lt!115402 lt!115398)))))

(assert (=> d!23106 (or (= (bvand lt!115402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115402 lt!115398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23106 (= lt!115398 (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114769))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114769)))))))

(declare-fun lt!115401 () (_ BitVec 64))

(declare-fun lt!115397 () (_ BitVec 64))

(assert (=> d!23106 (= lt!115402 (bvmul lt!115401 lt!115397))))

(assert (=> d!23106 (or (= lt!115401 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115397 (bvsdiv (bvmul lt!115401 lt!115397) lt!115401)))))

(assert (=> d!23106 (= lt!115397 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23106 (= lt!115401 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))))))

(assert (=> d!23106 (= lt!115400 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114769)))))))

(assert (=> d!23106 (invariant!0 (currentBit!3460 (_2!3192 lt!114769)) (currentByte!3465 (_2!3192 lt!114769)) (size!1364 (buf!1745 (_2!3192 lt!114769))))))

(assert (=> d!23106 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114769))) (currentByte!3465 (_2!3192 lt!114769)) (currentBit!3460 (_2!3192 lt!114769))) lt!115400)))

(declare-fun b!71482 () Bool)

(declare-fun res!58918 () Bool)

(assert (=> b!71482 (=> (not res!58918) (not e!46531))))

(assert (=> b!71482 (= res!58918 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115400))))

(declare-fun b!71483 () Bool)

(declare-fun lt!115399 () (_ BitVec 64))

(assert (=> b!71483 (= e!46531 (bvsle lt!115400 (bvmul lt!115399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71483 (or (= lt!115399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115399)))))

(assert (=> b!71483 (= lt!115399 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114769)))))))

(assert (= (and d!23106 res!58919) b!71482))

(assert (= (and b!71482 res!58918) b!71483))

(declare-fun m!114649 () Bool)

(assert (=> d!23106 m!114649))

(assert (=> d!23106 m!114079))

(assert (=> b!71102 d!23106))

(declare-fun d!23108 () Bool)

(declare-fun res!58922 () Bool)

(declare-fun e!46532 () Bool)

(assert (=> d!23108 (=> (not res!58922) (not e!46532))))

(assert (=> d!23108 (= res!58922 (= (size!1364 (buf!1745 thiss!1379)) (size!1364 (buf!1745 thiss!1379))))))

(assert (=> d!23108 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!46532)))

(declare-fun b!71484 () Bool)

(declare-fun res!58920 () Bool)

(assert (=> b!71484 (=> (not res!58920) (not e!46532))))

(assert (=> b!71484 (= res!58920 (bvsle (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)) (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379))))))

(declare-fun b!71485 () Bool)

(declare-fun e!46533 () Bool)

(assert (=> b!71485 (= e!46532 e!46533)))

(declare-fun res!58921 () Bool)

(assert (=> b!71485 (=> res!58921 e!46533)))

(assert (=> b!71485 (= res!58921 (= (size!1364 (buf!1745 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71486 () Bool)

(assert (=> b!71486 (= e!46533 (arrayBitRangesEq!0 (buf!1745 thiss!1379) (buf!1745 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379))))))

(assert (= (and d!23108 res!58922) b!71484))

(assert (= (and b!71484 res!58920) b!71485))

(assert (= (and b!71485 (not res!58921)) b!71486))

(assert (=> b!71484 m!114051))

(assert (=> b!71484 m!114051))

(assert (=> b!71486 m!114051))

(assert (=> b!71486 m!114051))

(declare-fun m!114651 () Bool)

(assert (=> b!71486 m!114651))

(assert (=> b!71100 d!23108))

(declare-fun d!23110 () Bool)

(assert (=> d!23110 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!115405 () Unit!4757)

(declare-fun choose!11 (BitStream!2314) Unit!4757)

(assert (=> d!23110 (= lt!115405 (choose!11 thiss!1379))))

(assert (=> d!23110 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!115405)))

(declare-fun bs!5534 () Bool)

(assert (= bs!5534 d!23110))

(assert (=> bs!5534 m!114047))

(declare-fun m!114653 () Bool)

(assert (=> bs!5534 m!114653))

(assert (=> b!71100 d!23110))

(declare-fun d!23112 () Bool)

(declare-fun e!46534 () Bool)

(assert (=> d!23112 e!46534))

(declare-fun res!58924 () Bool)

(assert (=> d!23112 (=> (not res!58924) (not e!46534))))

(declare-fun lt!115407 () (_ BitVec 64))

(declare-fun lt!115411 () (_ BitVec 64))

(declare-fun lt!115409 () (_ BitVec 64))

(assert (=> d!23112 (= res!58924 (= lt!115409 (bvsub lt!115411 lt!115407)))))

(assert (=> d!23112 (or (= (bvand lt!115411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115411 lt!115407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23112 (= lt!115407 (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 thiss!1379))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379))))))

(declare-fun lt!115410 () (_ BitVec 64))

(declare-fun lt!115406 () (_ BitVec 64))

(assert (=> d!23112 (= lt!115411 (bvmul lt!115410 lt!115406))))

(assert (=> d!23112 (or (= lt!115410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115406 (bvsdiv (bvmul lt!115410 lt!115406) lt!115410)))))

(assert (=> d!23112 (= lt!115406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23112 (= lt!115410 ((_ sign_extend 32) (size!1364 (buf!1745 thiss!1379))))))

(assert (=> d!23112 (= lt!115409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3465 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3460 thiss!1379))))))

(assert (=> d!23112 (invariant!0 (currentBit!3460 thiss!1379) (currentByte!3465 thiss!1379) (size!1364 (buf!1745 thiss!1379)))))

(assert (=> d!23112 (= (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)) lt!115409)))

(declare-fun b!71487 () Bool)

(declare-fun res!58923 () Bool)

(assert (=> b!71487 (=> (not res!58923) (not e!46534))))

(assert (=> b!71487 (= res!58923 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115409))))

(declare-fun b!71488 () Bool)

(declare-fun lt!115408 () (_ BitVec 64))

(assert (=> b!71488 (= e!46534 (bvsle lt!115409 (bvmul lt!115408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71488 (or (= lt!115408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115408)))))

(assert (=> b!71488 (= lt!115408 ((_ sign_extend 32) (size!1364 (buf!1745 thiss!1379))))))

(assert (= (and d!23112 res!58924) b!71487))

(assert (= (and b!71487 res!58923) b!71488))

(declare-fun m!114655 () Bool)

(assert (=> d!23112 m!114655))

(declare-fun m!114657 () Bool)

(assert (=> d!23112 m!114657))

(assert (=> b!71100 d!23112))

(declare-fun d!23114 () Bool)

(assert (=> d!23114 (= (invariant!0 (currentBit!3460 (_2!3192 lt!114744)) (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114769)))) (and (bvsge (currentBit!3460 (_2!3192 lt!114744)) #b00000000000000000000000000000000) (bvslt (currentBit!3460 (_2!3192 lt!114744)) #b00000000000000000000000000001000) (bvsge (currentByte!3465 (_2!3192 lt!114744)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114769)))) (and (= (currentBit!3460 (_2!3192 lt!114744)) #b00000000000000000000000000000000) (= (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114769))))))))))

(assert (=> b!71101 d!23114))

(declare-fun d!23116 () Bool)

(assert (=> d!23116 (= (head!551 lt!114762) (h!847 lt!114762))))

(assert (=> b!71090 d!23116))

(declare-fun d!23118 () Bool)

(assert (=> d!23118 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5535 () Bool)

(assert (= bs!5535 d!23118))

(assert (=> bs!5535 m!114057))

(assert (=> bs!5535 m!114545))

(assert (=> b!71099 d!23118))

(declare-fun d!23120 () Bool)

(assert (=> d!23120 (= (head!551 (byteArrayBitContentToList!0 (_2!3192 lt!114769) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!847 (byteArrayBitContentToList!0 (_2!3192 lt!114769) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!71099 d!23120))

(declare-fun d!23122 () Bool)

(declare-fun c!5368 () Bool)

(assert (=> d!23122 (= c!5368 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46537 () List!732)

(assert (=> d!23122 (= (byteArrayBitContentToList!0 (_2!3192 lt!114769) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!46537)))

(declare-fun b!71493 () Bool)

(assert (=> b!71493 (= e!46537 Nil!729)))

(declare-fun b!71494 () Bool)

(assert (=> b!71494 (= e!46537 (Cons!728 (not (= (bvand ((_ sign_extend 24) (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3192 lt!114769) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23122 c!5368) b!71493))

(assert (= (and d!23122 (not c!5368)) b!71494))

(assert (=> b!71494 m!114057))

(assert (=> b!71494 m!114545))

(declare-fun m!114659 () Bool)

(assert (=> b!71494 m!114659))

(assert (=> b!71099 d!23122))

(declare-fun d!23124 () Bool)

(assert (=> d!23124 (= (array_inv!1216 srcBuffer!2) (bvsge (size!1364 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13914 d!23124))

(declare-fun d!23126 () Bool)

(assert (=> d!23126 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3460 thiss!1379) (currentByte!3465 thiss!1379) (size!1364 (buf!1745 thiss!1379))))))

(declare-fun bs!5536 () Bool)

(assert (= bs!5536 d!23126))

(assert (=> bs!5536 m!114657))

(assert (=> start!13914 d!23126))

(declare-fun d!23128 () Bool)

(assert (=> d!23128 (= (invariant!0 (currentBit!3460 (_2!3192 lt!114769)) (currentByte!3465 (_2!3192 lt!114769)) (size!1364 (buf!1745 (_2!3192 lt!114769)))) (and (bvsge (currentBit!3460 (_2!3192 lt!114769)) #b00000000000000000000000000000000) (bvslt (currentBit!3460 (_2!3192 lt!114769)) #b00000000000000000000000000001000) (bvsge (currentByte!3465 (_2!3192 lt!114769)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3465 (_2!3192 lt!114769)) (size!1364 (buf!1745 (_2!3192 lt!114769)))) (and (= (currentBit!3460 (_2!3192 lt!114769)) #b00000000000000000000000000000000) (= (currentByte!3465 (_2!3192 lt!114769)) (size!1364 (buf!1745 (_2!3192 lt!114769))))))))))

(assert (=> b!71088 d!23128))

(declare-fun d!23130 () Bool)

(declare-fun e!46538 () Bool)

(assert (=> d!23130 e!46538))

(declare-fun res!58926 () Bool)

(assert (=> d!23130 (=> (not res!58926) (not e!46538))))

(declare-fun lt!115413 () (_ BitVec 64))

(declare-fun lt!115415 () (_ BitVec 64))

(declare-fun lt!115417 () (_ BitVec 64))

(assert (=> d!23130 (= res!58926 (= lt!115415 (bvsub lt!115417 lt!115413)))))

(assert (=> d!23130 (or (= (bvand lt!115417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115413 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115417 lt!115413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23130 (= lt!115413 (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744)))))))

(declare-fun lt!115416 () (_ BitVec 64))

(declare-fun lt!115412 () (_ BitVec 64))

(assert (=> d!23130 (= lt!115417 (bvmul lt!115416 lt!115412))))

(assert (=> d!23130 (or (= lt!115416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115412 (bvsdiv (bvmul lt!115416 lt!115412) lt!115416)))))

(assert (=> d!23130 (= lt!115412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23130 (= lt!115416 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))))))

(assert (=> d!23130 (= lt!115415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744)))))))

(assert (=> d!23130 (invariant!0 (currentBit!3460 (_2!3192 lt!114744)) (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114744))))))

(assert (=> d!23130 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))) lt!115415)))

(declare-fun b!71495 () Bool)

(declare-fun res!58925 () Bool)

(assert (=> b!71495 (=> (not res!58925) (not e!46538))))

(assert (=> b!71495 (= res!58925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115415))))

(declare-fun b!71496 () Bool)

(declare-fun lt!115414 () (_ BitVec 64))

(assert (=> b!71496 (= e!46538 (bvsle lt!115415 (bvmul lt!115414 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71496 (or (= lt!115414 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115414 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115414)))))

(assert (=> b!71496 (= lt!115414 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))))))

(assert (= (and d!23130 res!58926) b!71495))

(assert (= (and b!71495 res!58925) b!71496))

(assert (=> d!23130 m!114491))

(assert (=> d!23130 m!114015))

(assert (=> b!71089 d!23130))

(declare-fun d!23132 () Bool)

(assert (=> d!23132 (= (head!551 (byteArrayBitContentToList!0 (_2!3192 lt!114744) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!847 (byteArrayBitContentToList!0 (_2!3192 lt!114744) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!71087 d!23132))

(declare-fun d!23134 () Bool)

(declare-fun c!5369 () Bool)

(assert (=> d!23134 (= c!5369 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46539 () List!732)

(assert (=> d!23134 (= (byteArrayBitContentToList!0 (_2!3192 lt!114744) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!46539)))

(declare-fun b!71497 () Bool)

(assert (=> b!71497 (= e!46539 Nil!729)))

(declare-fun b!71498 () Bool)

(assert (=> b!71498 (= e!46539 (Cons!728 (not (= (bvand ((_ sign_extend 24) (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3192 lt!114744) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23134 c!5369) b!71497))

(assert (= (and d!23134 (not c!5369)) b!71498))

(assert (=> b!71498 m!114057))

(assert (=> b!71498 m!114545))

(declare-fun m!114661 () Bool)

(assert (=> b!71498 m!114661))

(assert (=> b!71087 d!23134))

(declare-fun d!23136 () Bool)

(assert (=> d!23136 (= (head!551 (bitStreamReadBitsIntoList!0 (_2!3192 lt!114744) (_1!3193 lt!114761) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!847 (bitStreamReadBitsIntoList!0 (_2!3192 lt!114744) (_1!3193 lt!114761) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!71087 d!23136))

(declare-fun d!23138 () Bool)

(declare-fun e!46541 () Bool)

(assert (=> d!23138 e!46541))

(declare-fun c!5370 () Bool)

(assert (=> d!23138 (= c!5370 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!115420 () List!732)

(declare-fun e!46540 () tuple2!6186)

(assert (=> d!23138 (= lt!115420 (_1!3207 e!46540))))

(declare-fun c!5371 () Bool)

(assert (=> d!23138 (= c!5371 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23138 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23138 (= (bitStreamReadBitsIntoList!0 (_2!3192 lt!114744) (_1!3193 lt!114761) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115420)))

(declare-fun b!71499 () Bool)

(assert (=> b!71499 (= e!46540 (tuple2!6187 Nil!729 (_1!3193 lt!114761)))))

(declare-fun b!71501 () Bool)

(assert (=> b!71501 (= e!46541 (isEmpty!232 lt!115420))))

(declare-fun lt!115418 () (_ BitVec 64))

(declare-fun lt!115419 () tuple2!6182)

(declare-fun b!71500 () Bool)

(assert (=> b!71500 (= e!46540 (tuple2!6187 (Cons!728 (_1!3205 lt!115419) (bitStreamReadBitsIntoList!0 (_2!3192 lt!114744) (_2!3205 lt!115419) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!115418))) (_2!3205 lt!115419)))))

(assert (=> b!71500 (= lt!115419 (readBit!0 (_1!3193 lt!114761)))))

(assert (=> b!71500 (= lt!115418 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71502 () Bool)

(assert (=> b!71502 (= e!46541 (> (length!360 lt!115420) 0))))

(assert (= (and d!23138 c!5371) b!71499))

(assert (= (and d!23138 (not c!5371)) b!71500))

(assert (= (and d!23138 c!5370) b!71501))

(assert (= (and d!23138 (not c!5370)) b!71502))

(declare-fun m!114663 () Bool)

(assert (=> b!71501 m!114663))

(declare-fun m!114665 () Bool)

(assert (=> b!71500 m!114665))

(declare-fun m!114667 () Bool)

(assert (=> b!71500 m!114667))

(declare-fun m!114669 () Bool)

(assert (=> b!71502 m!114669))

(assert (=> b!71087 d!23138))

(declare-fun d!23140 () Bool)

(assert (=> d!23140 (= (invariant!0 (currentBit!3460 (_2!3192 lt!114744)) (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114744)))) (and (bvsge (currentBit!3460 (_2!3192 lt!114744)) #b00000000000000000000000000000000) (bvslt (currentBit!3460 (_2!3192 lt!114744)) #b00000000000000000000000000001000) (bvsge (currentByte!3465 (_2!3192 lt!114744)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114744)))) (and (= (currentBit!3460 (_2!3192 lt!114744)) #b00000000000000000000000000000000) (= (currentByte!3465 (_2!3192 lt!114744)) (size!1364 (buf!1745 (_2!3192 lt!114744))))))))))

(assert (=> b!71098 d!23140))

(declare-fun b!71503 () Bool)

(declare-fun e!46542 () Unit!4757)

(declare-fun lt!115431 () Unit!4757)

(assert (=> b!71503 (= e!46542 lt!115431)))

(declare-fun lt!115424 () (_ BitVec 64))

(assert (=> b!71503 (= lt!115424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115434 () (_ BitVec 64))

(assert (=> b!71503 (= lt!115434 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(assert (=> b!71503 (= lt!115431 (arrayBitRangesEqSymmetric!0 (buf!1745 thiss!1379) (buf!1745 (_2!3192 lt!114744)) lt!115424 lt!115434))))

(assert (=> b!71503 (arrayBitRangesEq!0 (buf!1745 (_2!3192 lt!114744)) (buf!1745 thiss!1379) lt!115424 lt!115434)))

(declare-fun d!23142 () Bool)

(declare-fun e!46543 () Bool)

(assert (=> d!23142 e!46543))

(declare-fun res!58928 () Bool)

(assert (=> d!23142 (=> (not res!58928) (not e!46543))))

(declare-fun lt!115422 () tuple2!6158)

(assert (=> d!23142 (= res!58928 (isPrefixOf!0 (_1!3193 lt!115422) (_2!3193 lt!115422)))))

(declare-fun lt!115429 () BitStream!2314)

(assert (=> d!23142 (= lt!115422 (tuple2!6159 lt!115429 (_2!3192 lt!114744)))))

(declare-fun lt!115432 () Unit!4757)

(declare-fun lt!115430 () Unit!4757)

(assert (=> d!23142 (= lt!115432 lt!115430)))

(assert (=> d!23142 (isPrefixOf!0 lt!115429 (_2!3192 lt!114744))))

(assert (=> d!23142 (= lt!115430 (lemmaIsPrefixTransitive!0 lt!115429 (_2!3192 lt!114744) (_2!3192 lt!114744)))))

(declare-fun lt!115428 () Unit!4757)

(declare-fun lt!115423 () Unit!4757)

(assert (=> d!23142 (= lt!115428 lt!115423)))

(assert (=> d!23142 (isPrefixOf!0 lt!115429 (_2!3192 lt!114744))))

(assert (=> d!23142 (= lt!115423 (lemmaIsPrefixTransitive!0 lt!115429 thiss!1379 (_2!3192 lt!114744)))))

(declare-fun lt!115427 () Unit!4757)

(assert (=> d!23142 (= lt!115427 e!46542)))

(declare-fun c!5372 () Bool)

(assert (=> d!23142 (= c!5372 (not (= (size!1364 (buf!1745 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!115437 () Unit!4757)

(declare-fun lt!115426 () Unit!4757)

(assert (=> d!23142 (= lt!115437 lt!115426)))

(assert (=> d!23142 (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!114744))))

(assert (=> d!23142 (= lt!115426 (lemmaIsPrefixRefl!0 (_2!3192 lt!114744)))))

(declare-fun lt!115436 () Unit!4757)

(declare-fun lt!115438 () Unit!4757)

(assert (=> d!23142 (= lt!115436 lt!115438)))

(assert (=> d!23142 (= lt!115438 (lemmaIsPrefixRefl!0 (_2!3192 lt!114744)))))

(declare-fun lt!115435 () Unit!4757)

(declare-fun lt!115421 () Unit!4757)

(assert (=> d!23142 (= lt!115435 lt!115421)))

(assert (=> d!23142 (isPrefixOf!0 lt!115429 lt!115429)))

(assert (=> d!23142 (= lt!115421 (lemmaIsPrefixRefl!0 lt!115429))))

(declare-fun lt!115433 () Unit!4757)

(declare-fun lt!115425 () Unit!4757)

(assert (=> d!23142 (= lt!115433 lt!115425)))

(assert (=> d!23142 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23142 (= lt!115425 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23142 (= lt!115429 (BitStream!2315 (buf!1745 (_2!3192 lt!114744)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(assert (=> d!23142 (isPrefixOf!0 thiss!1379 (_2!3192 lt!114744))))

(assert (=> d!23142 (= (reader!0 thiss!1379 (_2!3192 lt!114744)) lt!115422)))

(declare-fun b!71504 () Bool)

(declare-fun Unit!4785 () Unit!4757)

(assert (=> b!71504 (= e!46542 Unit!4785)))

(declare-fun b!71505 () Bool)

(declare-fun res!58927 () Bool)

(assert (=> b!71505 (=> (not res!58927) (not e!46543))))

(assert (=> b!71505 (= res!58927 (isPrefixOf!0 (_1!3193 lt!115422) thiss!1379))))

(declare-fun b!71506 () Bool)

(declare-fun res!58929 () Bool)

(assert (=> b!71506 (=> (not res!58929) (not e!46543))))

(assert (=> b!71506 (= res!58929 (isPrefixOf!0 (_2!3193 lt!115422) (_2!3192 lt!114744)))))

(declare-fun b!71507 () Bool)

(declare-fun lt!115439 () (_ BitVec 64))

(declare-fun lt!115440 () (_ BitVec 64))

(assert (=> b!71507 (= e!46543 (= (_1!3193 lt!115422) (withMovedBitIndex!0 (_2!3193 lt!115422) (bvsub lt!115439 lt!115440))))))

(assert (=> b!71507 (or (= (bvand lt!115439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115439 lt!115440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71507 (= lt!115440 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(assert (=> b!71507 (= lt!115439 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)))))

(assert (= (and d!23142 c!5372) b!71503))

(assert (= (and d!23142 (not c!5372)) b!71504))

(assert (= (and d!23142 res!58928) b!71505))

(assert (= (and b!71505 res!58927) b!71506))

(assert (= (and b!71506 res!58929) b!71507))

(declare-fun m!114671 () Bool)

(assert (=> b!71505 m!114671))

(declare-fun m!114673 () Bool)

(assert (=> b!71507 m!114673))

(assert (=> b!71507 m!114077))

(assert (=> b!71507 m!114051))

(declare-fun m!114675 () Bool)

(assert (=> d!23142 m!114675))

(assert (=> d!23142 m!114049))

(declare-fun m!114677 () Bool)

(assert (=> d!23142 m!114677))

(declare-fun m!114679 () Bool)

(assert (=> d!23142 m!114679))

(declare-fun m!114681 () Bool)

(assert (=> d!23142 m!114681))

(declare-fun m!114683 () Bool)

(assert (=> d!23142 m!114683))

(declare-fun m!114685 () Bool)

(assert (=> d!23142 m!114685))

(assert (=> d!23142 m!114055))

(assert (=> d!23142 m!114047))

(assert (=> d!23142 m!114639))

(assert (=> d!23142 m!114627))

(assert (=> b!71503 m!114051))

(declare-fun m!114687 () Bool)

(assert (=> b!71503 m!114687))

(declare-fun m!114689 () Bool)

(assert (=> b!71503 m!114689))

(declare-fun m!114691 () Bool)

(assert (=> b!71506 m!114691))

(assert (=> b!71107 d!23142))

(declare-fun d!23144 () Bool)

(declare-fun e!46603 () Bool)

(assert (=> d!23144 e!46603))

(declare-fun res!59013 () Bool)

(assert (=> d!23144 (=> (not res!59013) (not e!46603))))

(declare-fun lt!115911 () (_ BitVec 64))

(declare-fun lt!115910 () tuple2!6156)

(assert (=> d!23144 (= res!59013 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115910))) (currentByte!3465 (_2!3192 lt!115910)) (currentBit!3460 (_2!3192 lt!115910))) (bvsub lt!115911 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!23144 (or (= (bvand lt!115911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115911 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!115928 () (_ BitVec 64))

(assert (=> d!23144 (= lt!115911 (bvadd lt!115928 to!314))))

(assert (=> d!23144 (or (not (= (bvand lt!115928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!115928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!115928 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23144 (= lt!115928 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(declare-fun e!46601 () tuple2!6156)

(assert (=> d!23144 (= lt!115910 e!46601)))

(declare-fun c!5397 () Bool)

(assert (=> d!23144 (= c!5397 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!115932 () Unit!4757)

(declare-fun lt!115943 () Unit!4757)

(assert (=> d!23144 (= lt!115932 lt!115943)))

(assert (=> d!23144 (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!114744))))

(assert (=> d!23144 (= lt!115943 (lemmaIsPrefixRefl!0 (_2!3192 lt!114744)))))

(declare-fun lt!115919 () (_ BitVec 64))

(assert (=> d!23144 (= lt!115919 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))))))

(assert (=> d!23144 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23144 (= (appendBitsMSBFirstLoop!0 (_2!3192 lt!114744) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!115910)))

(declare-fun lt!115912 () tuple2!6158)

(declare-fun b!71634 () Bool)

(assert (=> b!71634 (= e!46603 (= (bitStreamReadBitsIntoList!0 (_2!3192 lt!115910) (_1!3193 lt!115912) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3192 lt!115910) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!71634 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71634 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!115920 () Unit!4757)

(declare-fun lt!115905 () Unit!4757)

(assert (=> b!71634 (= lt!115920 lt!115905)))

(declare-fun lt!115917 () (_ BitVec 64))

(assert (=> b!71634 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!115910)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!115917)))

(assert (=> b!71634 (= lt!115905 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3192 lt!114744) (buf!1745 (_2!3192 lt!115910)) lt!115917))))

(declare-fun e!46602 () Bool)

(assert (=> b!71634 e!46602))

(declare-fun res!59012 () Bool)

(assert (=> b!71634 (=> (not res!59012) (not e!46602))))

(assert (=> b!71634 (= res!59012 (and (= (size!1364 (buf!1745 (_2!3192 lt!114744))) (size!1364 (buf!1745 (_2!3192 lt!115910)))) (bvsge lt!115917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71634 (= lt!115917 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!71634 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71634 (= lt!115912 (reader!0 (_2!3192 lt!114744) (_2!3192 lt!115910)))))

(declare-fun lt!115929 () tuple2!6156)

(declare-fun bm!931 () Bool)

(declare-fun call!934 () tuple2!6158)

(declare-fun lt!115946 () tuple2!6156)

(assert (=> bm!931 (= call!934 (reader!0 (ite c!5397 (_2!3192 lt!115929) (_2!3192 lt!114744)) (ite c!5397 (_2!3192 lt!115946) (_2!3192 lt!114744))))))

(declare-fun b!71635 () Bool)

(declare-fun res!59008 () Bool)

(assert (=> b!71635 (=> (not res!59008) (not e!46603))))

(assert (=> b!71635 (= res!59008 (invariant!0 (currentBit!3460 (_2!3192 lt!115910)) (currentByte!3465 (_2!3192 lt!115910)) (size!1364 (buf!1745 (_2!3192 lt!115910)))))))

(declare-fun b!71636 () Bool)

(declare-fun Unit!4786 () Unit!4757)

(assert (=> b!71636 (= e!46601 (tuple2!6157 Unit!4786 (_2!3192 lt!115946)))))

(assert (=> b!71636 (= lt!115929 (appendBitFromByte!0 (_2!3192 lt!114744) (select (arr!1952 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!115918 () (_ BitVec 64))

(assert (=> b!71636 (= lt!115918 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115933 () (_ BitVec 64))

(assert (=> b!71636 (= lt!115933 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115923 () Unit!4757)

(assert (=> b!71636 (= lt!115923 (validateOffsetBitsIneqLemma!0 (_2!3192 lt!114744) (_2!3192 lt!115929) lt!115918 lt!115933))))

(assert (=> b!71636 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!115929)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!115929))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!115929))) (bvsub lt!115918 lt!115933))))

(declare-fun lt!115925 () Unit!4757)

(assert (=> b!71636 (= lt!115925 lt!115923)))

(declare-fun lt!115926 () tuple2!6158)

(assert (=> b!71636 (= lt!115926 (reader!0 (_2!3192 lt!114744) (_2!3192 lt!115929)))))

(declare-fun lt!115909 () (_ BitVec 64))

(assert (=> b!71636 (= lt!115909 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115931 () Unit!4757)

(assert (=> b!71636 (= lt!115931 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3192 lt!114744) (buf!1745 (_2!3192 lt!115929)) lt!115909))))

(assert (=> b!71636 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!115929)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!115909)))

(declare-fun lt!115941 () Unit!4757)

(assert (=> b!71636 (= lt!115941 lt!115931)))

(assert (=> b!71636 (= (head!551 (byteArrayBitContentToList!0 (_2!3192 lt!115929) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!551 (bitStreamReadBitsIntoList!0 (_2!3192 lt!115929) (_1!3193 lt!115926) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115934 () Unit!4757)

(declare-fun Unit!4787 () Unit!4757)

(assert (=> b!71636 (= lt!115934 Unit!4787)))

(assert (=> b!71636 (= lt!115946 (appendBitsMSBFirstLoop!0 (_2!3192 lt!115929) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!115916 () Unit!4757)

(assert (=> b!71636 (= lt!115916 (lemmaIsPrefixTransitive!0 (_2!3192 lt!114744) (_2!3192 lt!115929) (_2!3192 lt!115946)))))

(assert (=> b!71636 (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!115946))))

(declare-fun lt!115945 () Unit!4757)

(assert (=> b!71636 (= lt!115945 lt!115916)))

(assert (=> b!71636 (= (size!1364 (buf!1745 (_2!3192 lt!115946))) (size!1364 (buf!1745 (_2!3192 lt!114744))))))

(declare-fun lt!115906 () Unit!4757)

(declare-fun Unit!4788 () Unit!4757)

(assert (=> b!71636 (= lt!115906 Unit!4788)))

(assert (=> b!71636 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115946))) (currentByte!3465 (_2!3192 lt!115946)) (currentBit!3460 (_2!3192 lt!115946))) (bvsub (bvadd (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115944 () Unit!4757)

(declare-fun Unit!4789 () Unit!4757)

(assert (=> b!71636 (= lt!115944 Unit!4789)))

(assert (=> b!71636 (= (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115946))) (currentByte!3465 (_2!3192 lt!115946)) (currentBit!3460 (_2!3192 lt!115946))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115929))) (currentByte!3465 (_2!3192 lt!115929)) (currentBit!3460 (_2!3192 lt!115929))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!115936 () Unit!4757)

(declare-fun Unit!4790 () Unit!4757)

(assert (=> b!71636 (= lt!115936 Unit!4790)))

(declare-fun lt!115904 () tuple2!6158)

(assert (=> b!71636 (= lt!115904 (reader!0 (_2!3192 lt!114744) (_2!3192 lt!115946)))))

(declare-fun lt!115921 () (_ BitVec 64))

(assert (=> b!71636 (= lt!115921 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115914 () Unit!4757)

(assert (=> b!71636 (= lt!115914 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3192 lt!114744) (buf!1745 (_2!3192 lt!115946)) lt!115921))))

(assert (=> b!71636 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!115946)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!115921)))

(declare-fun lt!115939 () Unit!4757)

(assert (=> b!71636 (= lt!115939 lt!115914)))

(declare-fun lt!115913 () tuple2!6158)

(assert (=> b!71636 (= lt!115913 call!934)))

(declare-fun lt!115907 () (_ BitVec 64))

(assert (=> b!71636 (= lt!115907 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!115922 () Unit!4757)

(assert (=> b!71636 (= lt!115922 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3192 lt!115929) (buf!1745 (_2!3192 lt!115946)) lt!115907))))

(assert (=> b!71636 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!115946)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!115929))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!115929))) lt!115907)))

(declare-fun lt!115937 () Unit!4757)

(assert (=> b!71636 (= lt!115937 lt!115922)))

(declare-fun lt!115908 () List!732)

(assert (=> b!71636 (= lt!115908 (byteArrayBitContentToList!0 (_2!3192 lt!115946) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!115947 () List!732)

(assert (=> b!71636 (= lt!115947 (byteArrayBitContentToList!0 (_2!3192 lt!115946) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115935 () List!732)

(assert (=> b!71636 (= lt!115935 (bitStreamReadBitsIntoList!0 (_2!3192 lt!115946) (_1!3193 lt!115904) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!115927 () List!732)

(assert (=> b!71636 (= lt!115927 (bitStreamReadBitsIntoList!0 (_2!3192 lt!115946) (_1!3193 lt!115913) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115915 () (_ BitVec 64))

(assert (=> b!71636 (= lt!115915 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115942 () Unit!4757)

(assert (=> b!71636 (= lt!115942 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3192 lt!115946) (_2!3192 lt!115946) (_1!3193 lt!115904) (_1!3193 lt!115913) lt!115915 lt!115935))))

(assert (=> b!71636 (= (bitStreamReadBitsIntoList!0 (_2!3192 lt!115946) (_1!3193 lt!115913) (bvsub lt!115915 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!336 lt!115935))))

(declare-fun lt!115924 () Unit!4757)

(assert (=> b!71636 (= lt!115924 lt!115942)))

(declare-fun lt!115940 () Unit!4757)

(assert (=> b!71636 (= lt!115940 (arrayBitRangesEqImpliesEq!0 (buf!1745 (_2!3192 lt!115929)) (buf!1745 (_2!3192 lt!115946)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!115919 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!115929))) (currentByte!3465 (_2!3192 lt!115929)) (currentBit!3460 (_2!3192 lt!115929)))))))

(assert (=> b!71636 (= (bitAt!0 (buf!1745 (_2!3192 lt!115929)) lt!115919) (bitAt!0 (buf!1745 (_2!3192 lt!115946)) lt!115919))))

(declare-fun lt!115930 () Unit!4757)

(assert (=> b!71636 (= lt!115930 lt!115940)))

(declare-fun b!71637 () Bool)

(declare-fun Unit!4791 () Unit!4757)

(assert (=> b!71637 (= e!46601 (tuple2!6157 Unit!4791 (_2!3192 lt!114744)))))

(assert (=> b!71637 (= (size!1364 (buf!1745 (_2!3192 lt!114744))) (size!1364 (buf!1745 (_2!3192 lt!114744))))))

(declare-fun lt!115938 () Unit!4757)

(declare-fun Unit!4792 () Unit!4757)

(assert (=> b!71637 (= lt!115938 Unit!4792)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2314 array!2926 array!2926 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71637 (checkByteArrayBitContent!0 (_2!3192 lt!114744) srcBuffer!2 (_1!3206 (readBits!0 (_1!3193 call!934) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!71638 () Bool)

(assert (=> b!71638 (= e!46602 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 (_2!3192 lt!114744))) ((_ sign_extend 32) (currentBit!3460 (_2!3192 lt!114744))) lt!115917))))

(declare-fun b!71639 () Bool)

(declare-fun res!59009 () Bool)

(assert (=> b!71639 (=> (not res!59009) (not e!46603))))

(assert (=> b!71639 (= res!59009 (= (size!1364 (buf!1745 (_2!3192 lt!115910))) (size!1364 (buf!1745 (_2!3192 lt!114744)))))))

(declare-fun b!71640 () Bool)

(declare-fun res!59010 () Bool)

(assert (=> b!71640 (=> (not res!59010) (not e!46603))))

(assert (=> b!71640 (= res!59010 (= (size!1364 (buf!1745 (_2!3192 lt!114744))) (size!1364 (buf!1745 (_2!3192 lt!115910)))))))

(declare-fun b!71641 () Bool)

(declare-fun res!59011 () Bool)

(assert (=> b!71641 (=> (not res!59011) (not e!46603))))

(assert (=> b!71641 (= res!59011 (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!115910)))))

(assert (= (and d!23144 c!5397) b!71636))

(assert (= (and d!23144 (not c!5397)) b!71637))

(assert (= (or b!71636 b!71637) bm!931))

(assert (= (and d!23144 res!59013) b!71635))

(assert (= (and b!71635 res!59008) b!71640))

(assert (= (and b!71640 res!59010) b!71641))

(assert (= (and b!71641 res!59011) b!71639))

(assert (= (and b!71639 res!59009) b!71634))

(assert (= (and b!71634 res!59012) b!71638))

(declare-fun m!114987 () Bool)

(assert (=> b!71634 m!114987))

(declare-fun m!114989 () Bool)

(assert (=> b!71634 m!114989))

(declare-fun m!114991 () Bool)

(assert (=> b!71634 m!114991))

(declare-fun m!114993 () Bool)

(assert (=> b!71634 m!114993))

(declare-fun m!114995 () Bool)

(assert (=> b!71634 m!114995))

(declare-fun m!114997 () Bool)

(assert (=> b!71637 m!114997))

(declare-fun m!114999 () Bool)

(assert (=> b!71637 m!114999))

(declare-fun m!115001 () Bool)

(assert (=> b!71641 m!115001))

(declare-fun m!115003 () Bool)

(assert (=> b!71638 m!115003))

(declare-fun m!115005 () Bool)

(assert (=> b!71636 m!115005))

(declare-fun m!115007 () Bool)

(assert (=> b!71636 m!115007))

(declare-fun m!115009 () Bool)

(assert (=> b!71636 m!115009))

(declare-fun m!115011 () Bool)

(assert (=> b!71636 m!115011))

(declare-fun m!115013 () Bool)

(assert (=> b!71636 m!115013))

(declare-fun m!115015 () Bool)

(assert (=> b!71636 m!115015))

(assert (=> b!71636 m!114077))

(declare-fun m!115017 () Bool)

(assert (=> b!71636 m!115017))

(declare-fun m!115019 () Bool)

(assert (=> b!71636 m!115019))

(declare-fun m!115021 () Bool)

(assert (=> b!71636 m!115021))

(declare-fun m!115023 () Bool)

(assert (=> b!71636 m!115023))

(assert (=> b!71636 m!115007))

(declare-fun m!115025 () Bool)

(assert (=> b!71636 m!115025))

(declare-fun m!115027 () Bool)

(assert (=> b!71636 m!115027))

(declare-fun m!115029 () Bool)

(assert (=> b!71636 m!115029))

(declare-fun m!115031 () Bool)

(assert (=> b!71636 m!115031))

(declare-fun m!115033 () Bool)

(assert (=> b!71636 m!115033))

(declare-fun m!115035 () Bool)

(assert (=> b!71636 m!115035))

(declare-fun m!115037 () Bool)

(assert (=> b!71636 m!115037))

(declare-fun m!115039 () Bool)

(assert (=> b!71636 m!115039))

(declare-fun m!115041 () Bool)

(assert (=> b!71636 m!115041))

(declare-fun m!115043 () Bool)

(assert (=> b!71636 m!115043))

(declare-fun m!115045 () Bool)

(assert (=> b!71636 m!115045))

(declare-fun m!115047 () Bool)

(assert (=> b!71636 m!115047))

(declare-fun m!115049 () Bool)

(assert (=> b!71636 m!115049))

(declare-fun m!115051 () Bool)

(assert (=> b!71636 m!115051))

(declare-fun m!115053 () Bool)

(assert (=> b!71636 m!115053))

(declare-fun m!115055 () Bool)

(assert (=> b!71636 m!115055))

(declare-fun m!115057 () Bool)

(assert (=> b!71636 m!115057))

(assert (=> b!71636 m!115039))

(declare-fun m!115059 () Bool)

(assert (=> b!71636 m!115059))

(declare-fun m!115061 () Bool)

(assert (=> b!71636 m!115061))

(declare-fun m!115063 () Bool)

(assert (=> b!71636 m!115063))

(declare-fun m!115065 () Bool)

(assert (=> b!71636 m!115065))

(assert (=> b!71636 m!115017))

(assert (=> b!71636 m!115053))

(declare-fun m!115067 () Bool)

(assert (=> d!23144 m!115067))

(assert (=> d!23144 m!114077))

(assert (=> d!23144 m!114639))

(assert (=> d!23144 m!114627))

(declare-fun m!115069 () Bool)

(assert (=> b!71635 m!115069))

(declare-fun m!115071 () Bool)

(assert (=> bm!931 m!115071))

(assert (=> b!71107 d!23144))

(declare-fun d!23226 () Bool)

(assert (=> d!23226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5553 () Bool)

(assert (= bs!5553 d!23226))

(declare-fun m!115073 () Bool)

(assert (=> bs!5553 m!115073))

(assert (=> b!71107 d!23226))

(declare-fun d!23228 () Bool)

(assert (=> d!23228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 (_2!3192 lt!114744)))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115948 () Unit!4757)

(assert (=> d!23228 (= lt!115948 (choose!9 thiss!1379 (buf!1745 (_2!3192 lt!114744)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2315 (buf!1745 (_2!3192 lt!114744)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379))))))

(assert (=> d!23228 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1745 (_2!3192 lt!114744)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115948)))

(declare-fun bs!5554 () Bool)

(assert (= bs!5554 d!23228))

(assert (=> bs!5554 m!113993))

(declare-fun m!115075 () Bool)

(assert (=> bs!5554 m!115075))

(assert (=> b!71107 d!23228))

(declare-fun d!23230 () Bool)

(declare-fun res!59016 () Bool)

(declare-fun e!46604 () Bool)

(assert (=> d!23230 (=> (not res!59016) (not e!46604))))

(assert (=> d!23230 (= res!59016 (= (size!1364 (buf!1745 (_2!3192 lt!114744))) (size!1364 (buf!1745 (_2!3192 lt!114769)))))))

(assert (=> d!23230 (= (isPrefixOf!0 (_2!3192 lt!114744) (_2!3192 lt!114769)) e!46604)))

(declare-fun b!71642 () Bool)

(declare-fun res!59014 () Bool)

(assert (=> b!71642 (=> (not res!59014) (not e!46604))))

(assert (=> b!71642 (= res!59014 (bvsle (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744))) (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114769))) (currentByte!3465 (_2!3192 lt!114769)) (currentBit!3460 (_2!3192 lt!114769)))))))

(declare-fun b!71643 () Bool)

(declare-fun e!46605 () Bool)

(assert (=> b!71643 (= e!46604 e!46605)))

(declare-fun res!59015 () Bool)

(assert (=> b!71643 (=> res!59015 e!46605)))

(assert (=> b!71643 (= res!59015 (= (size!1364 (buf!1745 (_2!3192 lt!114744))) #b00000000000000000000000000000000))))

(declare-fun b!71644 () Bool)

(assert (=> b!71644 (= e!46605 (arrayBitRangesEq!0 (buf!1745 (_2!3192 lt!114744)) (buf!1745 (_2!3192 lt!114769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114744))) (currentByte!3465 (_2!3192 lt!114744)) (currentBit!3460 (_2!3192 lt!114744)))))))

(assert (= (and d!23230 res!59016) b!71642))

(assert (= (and b!71642 res!59014) b!71643))

(assert (= (and b!71643 (not res!59015)) b!71644))

(assert (=> b!71642 m!114077))

(assert (=> b!71642 m!114005))

(assert (=> b!71644 m!114077))

(assert (=> b!71644 m!114077))

(declare-fun m!115077 () Bool)

(assert (=> b!71644 m!115077))

(assert (=> b!71107 d!23230))

(declare-fun d!23232 () Bool)

(assert (=> d!23232 (isPrefixOf!0 thiss!1379 (_2!3192 lt!114769))))

(declare-fun lt!115951 () Unit!4757)

(declare-fun choose!30 (BitStream!2314 BitStream!2314 BitStream!2314) Unit!4757)

(assert (=> d!23232 (= lt!115951 (choose!30 thiss!1379 (_2!3192 lt!114744) (_2!3192 lt!114769)))))

(assert (=> d!23232 (isPrefixOf!0 thiss!1379 (_2!3192 lt!114744))))

(assert (=> d!23232 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3192 lt!114744) (_2!3192 lt!114769)) lt!115951)))

(declare-fun bs!5555 () Bool)

(assert (= bs!5555 d!23232))

(assert (=> bs!5555 m!114001))

(declare-fun m!115079 () Bool)

(assert (=> bs!5555 m!115079))

(assert (=> bs!5555 m!114055))

(assert (=> b!71107 d!23232))

(declare-fun d!23234 () Bool)

(declare-fun res!59019 () Bool)

(declare-fun e!46606 () Bool)

(assert (=> d!23234 (=> (not res!59019) (not e!46606))))

(assert (=> d!23234 (= res!59019 (= (size!1364 (buf!1745 thiss!1379)) (size!1364 (buf!1745 (_2!3192 lt!114769)))))))

(assert (=> d!23234 (= (isPrefixOf!0 thiss!1379 (_2!3192 lt!114769)) e!46606)))

(declare-fun b!71645 () Bool)

(declare-fun res!59017 () Bool)

(assert (=> b!71645 (=> (not res!59017) (not e!46606))))

(assert (=> b!71645 (= res!59017 (bvsle (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379)) (bitIndex!0 (size!1364 (buf!1745 (_2!3192 lt!114769))) (currentByte!3465 (_2!3192 lt!114769)) (currentBit!3460 (_2!3192 lt!114769)))))))

(declare-fun b!71646 () Bool)

(declare-fun e!46607 () Bool)

(assert (=> b!71646 (= e!46606 e!46607)))

(declare-fun res!59018 () Bool)

(assert (=> b!71646 (=> res!59018 e!46607)))

(assert (=> b!71646 (= res!59018 (= (size!1364 (buf!1745 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71647 () Bool)

(assert (=> b!71647 (= e!46607 (arrayBitRangesEq!0 (buf!1745 thiss!1379) (buf!1745 (_2!3192 lt!114769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1364 (buf!1745 thiss!1379)) (currentByte!3465 thiss!1379) (currentBit!3460 thiss!1379))))))

(assert (= (and d!23234 res!59019) b!71645))

(assert (= (and b!71645 res!59017) b!71646))

(assert (= (and b!71646 (not res!59018)) b!71647))

(assert (=> b!71645 m!114051))

(assert (=> b!71645 m!114005))

(assert (=> b!71647 m!114051))

(assert (=> b!71647 m!114051))

(declare-fun m!115081 () Bool)

(assert (=> b!71647 m!115081))

(assert (=> b!71107 d!23234))

(declare-fun d!23236 () Bool)

(assert (=> d!23236 (= (bitAt!0 (buf!1745 (_2!3192 lt!114769)) lt!114743) (not (= (bvand ((_ sign_extend 24) (select (arr!1952 (buf!1745 (_2!3192 lt!114769))) ((_ extract 31 0) (bvsdiv lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114743 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5556 () Bool)

(assert (= bs!5556 d!23236))

(declare-fun m!115083 () Bool)

(assert (=> bs!5556 m!115083))

(assert (=> bs!5556 m!114483))

(assert (=> b!71096 d!23236))

(declare-fun d!23238 () Bool)

(assert (=> d!23238 (= (bitAt!0 (buf!1745 (_2!3192 lt!114744)) lt!114743) (bitAt!0 (buf!1745 (_2!3192 lt!114769)) lt!114743))))

(declare-fun lt!115954 () Unit!4757)

(declare-fun choose!31 (array!2926 array!2926 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4757)

(assert (=> d!23238 (= lt!115954 (choose!31 (buf!1745 (_2!3192 lt!114744)) (buf!1745 (_2!3192 lt!114769)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114743 lt!114765))))

(assert (=> d!23238 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114765))))

(assert (=> d!23238 (= (arrayBitRangesEqImpliesEq!0 (buf!1745 (_2!3192 lt!114744)) (buf!1745 (_2!3192 lt!114769)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114743 lt!114765) lt!115954)))

(declare-fun bs!5557 () Bool)

(assert (= bs!5557 d!23238))

(assert (=> bs!5557 m!114033))

(assert (=> bs!5557 m!114073))

(declare-fun m!115085 () Bool)

(assert (=> bs!5557 m!115085))

(assert (=> b!71096 d!23238))

(declare-fun d!23240 () Bool)

(assert (=> d!23240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1364 (buf!1745 thiss!1379))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1364 (buf!1745 thiss!1379))) ((_ sign_extend 32) (currentByte!3465 thiss!1379)) ((_ sign_extend 32) (currentBit!3460 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5558 () Bool)

(assert (= bs!5558 d!23240))

(assert (=> bs!5558 m!114655))

(assert (=> b!71097 d!23240))

(declare-fun d!23242 () Bool)

(assert (=> d!23242 (= (array_inv!1216 (buf!1745 thiss!1379)) (bvsge (size!1364 (buf!1745 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!71086 d!23242))

(push 1)

(assert (not b!71494))

(assert (not b!71477))

(assert (not d!23232))

(assert (not d!23102))

(assert (not b!71435))

(assert (not d!23094))

(assert (not b!71475))

(assert (not b!71473))

(assert (not b!71507))

(assert (not d!23144))

(assert (not d!23126))

(assert (not b!71455))

(assert (not b!71638))

(assert (not d!23142))

(assert (not b!71456))

(assert (not b!71634))

(assert (not b!71466))

(assert (not b!71647))

(assert (not d!23240))

(assert (not b!71454))

(assert (not b!71500))

(assert (not d!23038))

(assert (not b!71394))

(assert (not b!71642))

(assert (not b!71484))

(assert (not d!23040))

(assert (not b!71476))

(assert (not b!71636))

(assert (not d!23110))

(assert (not b!71503))

(assert (not b!71436))

(assert (not b!71637))

(assert (not b!71486))

(assert (not d!23130))

(assert (not d!23062))

(assert (not b!71452))

(assert (not b!71502))

(assert (not b!71437))

(assert (not d!23096))

(assert (not d!23228))

(assert (not bm!931))

(assert (not d!23226))

(assert (not b!71431))

(assert (not b!71434))

(assert (not b!71472))

(assert (not d!23088))

(assert (not b!71635))

(assert (not d!23090))

(assert (not b!71501))

(assert (not b!71644))

(assert (not b!71467))

(assert (not b!71438))

(assert (not b!71498))

(assert (not b!71441))

(assert (not d!23112))

(assert (not d!23238))

(assert (not d!23060))

(assert (not b!71645))

(assert (not d!23106))

(assert (not b!71468))

(assert (not b!71387))

(assert (not b!71470))

(assert (not d!23086))

(assert (not b!71432))

(assert (not b!71506))

(assert (not b!71641))

(assert (not d!23100))

(assert (not d!23058))

(assert (not b!71505))

(assert (not b!71471))

(assert (not b!71433))

(assert (not b!71389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

