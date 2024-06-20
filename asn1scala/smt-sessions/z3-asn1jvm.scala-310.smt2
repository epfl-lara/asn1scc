; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6376 () Bool)

(assert start!6376)

(declare-fun b!29996 () Bool)

(declare-fun e!20035 () Bool)

(declare-fun e!20033 () Bool)

(assert (=> b!29996 (= e!20035 e!20033)))

(declare-fun res!25837 () Bool)

(assert (=> b!29996 (=> res!25837 e!20033)))

(declare-datatypes ((array!1780 0))(
  ( (array!1781 (arr!1239 (Array (_ BitVec 32) (_ BitVec 8))) (size!776 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1368 0))(
  ( (BitStream!1369 (buf!1104 array!1780) (currentByte!2447 (_ BitVec 32)) (currentBit!2442 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2321 0))(
  ( (Unit!2322) )
))
(declare-datatypes ((tuple2!3174 0))(
  ( (tuple2!3175 (_1!1674 Unit!2321) (_2!1674 BitStream!1368)) )
))
(declare-fun lt!43305 () tuple2!3174)

(declare-fun lt!43312 () tuple2!3174)

(assert (=> b!29996 (= res!25837 (not (= (size!776 (buf!1104 (_2!1674 lt!43305))) (size!776 (buf!1104 (_2!1674 lt!43312))))))))

(declare-fun e!20030 () Bool)

(assert (=> b!29996 e!20030))

(declare-fun res!25848 () Bool)

(assert (=> b!29996 (=> (not res!25848) (not e!20030))))

(declare-fun thiss!1379 () BitStream!1368)

(assert (=> b!29996 (= res!25848 (= (size!776 (buf!1104 (_2!1674 lt!43312))) (size!776 (buf!1104 thiss!1379))))))

(declare-fun b!29997 () Bool)

(declare-fun e!20037 () Bool)

(declare-fun e!20031 () Bool)

(assert (=> b!29997 (= e!20037 e!20031)))

(declare-fun res!25847 () Bool)

(assert (=> b!29997 (=> res!25847 e!20031)))

(declare-datatypes ((List!385 0))(
  ( (Nil!382) (Cons!381 (h!500 Bool) (t!1135 List!385)) )
))
(declare-fun lt!43295 () List!385)

(declare-fun lt!43296 () List!385)

(assert (=> b!29997 (= res!25847 (not (= lt!43295 lt!43296)))))

(assert (=> b!29997 (= lt!43296 lt!43295)))

(declare-fun lt!43297 () List!385)

(declare-fun tail!102 (List!385) List!385)

(assert (=> b!29997 (= lt!43295 (tail!102 lt!43297))))

(declare-datatypes ((tuple2!3176 0))(
  ( (tuple2!3177 (_1!1675 BitStream!1368) (_2!1675 BitStream!1368)) )
))
(declare-fun lt!43306 () tuple2!3176)

(declare-fun lt!43299 () Unit!2321)

(declare-fun lt!43311 () tuple2!3176)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1368 BitStream!1368 BitStream!1368 BitStream!1368 (_ BitVec 64) List!385) Unit!2321)

(assert (=> b!29997 (= lt!43299 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1674 lt!43312) (_2!1674 lt!43312) (_1!1675 lt!43306) (_1!1675 lt!43311) (bvsub to!314 i!635) lt!43297))))

(declare-fun b!29998 () Bool)

(declare-fun res!25835 () Bool)

(assert (=> b!29998 (=> res!25835 e!20031)))

(declare-fun lt!43301 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1780 (_ BitVec 64)) Bool)

(assert (=> b!29998 (= res!25835 (not (= (bitAt!0 (buf!1104 (_1!1675 lt!43306)) lt!43301) (bitAt!0 (buf!1104 (_1!1675 lt!43311)) lt!43301))))))

(declare-fun b!29999 () Bool)

(declare-fun res!25844 () Bool)

(assert (=> b!29999 (=> res!25844 e!20037)))

(declare-fun length!111 (List!385) Int)

(assert (=> b!29999 (= res!25844 (<= (length!111 lt!43297) 0))))

(declare-fun b!30000 () Bool)

(declare-fun e!20039 () Bool)

(declare-fun e!20029 () Bool)

(assert (=> b!30000 (= e!20039 (not e!20029))))

(declare-fun res!25840 () Bool)

(assert (=> b!30000 (=> res!25840 e!20029)))

(assert (=> b!30000 (= res!25840 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1368 BitStream!1368) Bool)

(assert (=> b!30000 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!43307 () Unit!2321)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1368) Unit!2321)

(assert (=> b!30000 (= lt!43307 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!30000 (= lt!43301 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(declare-fun b!30001 () Bool)

(declare-fun res!25836 () Bool)

(assert (=> b!30001 (=> res!25836 e!20033)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!30001 (= res!25836 (not (invariant!0 (currentBit!2442 (_2!1674 lt!43305)) (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43312))))))))

(declare-fun b!30002 () Bool)

(assert (=> b!30002 (= e!20031 (not (= lt!43297 Nil!382)))))

(declare-fun lt!43302 () (_ BitVec 64))

(declare-fun b!30003 () Bool)

(assert (=> b!30003 (= e!20030 (= lt!43302 (bvsub (bvsub (bvadd (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30004 () Bool)

(declare-fun res!25839 () Bool)

(assert (=> b!30004 (=> res!25839 e!20033)))

(assert (=> b!30004 (= res!25839 (not (invariant!0 (currentBit!2442 (_2!1674 lt!43305)) (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43305))))))))

(declare-fun b!30005 () Bool)

(declare-fun res!25834 () Bool)

(assert (=> b!30005 (=> res!25834 e!20035)))

(assert (=> b!30005 (= res!25834 (not (invariant!0 (currentBit!2442 (_2!1674 lt!43312)) (currentByte!2447 (_2!1674 lt!43312)) (size!776 (buf!1104 (_2!1674 lt!43312))))))))

(declare-fun res!25843 () Bool)

(assert (=> start!6376 (=> (not res!25843) (not e!20039))))

(declare-fun srcBuffer!2 () array!1780)

(assert (=> start!6376 (= res!25843 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!776 srcBuffer!2))))))))

(assert (=> start!6376 e!20039))

(assert (=> start!6376 true))

(declare-fun array_inv!737 (array!1780) Bool)

(assert (=> start!6376 (array_inv!737 srcBuffer!2)))

(declare-fun e!20034 () Bool)

(declare-fun inv!12 (BitStream!1368) Bool)

(assert (=> start!6376 (and (inv!12 thiss!1379) e!20034)))

(declare-fun b!30006 () Bool)

(assert (=> b!30006 (= e!20033 e!20037)))

(declare-fun res!25833 () Bool)

(assert (=> b!30006 (=> res!25833 e!20037)))

(assert (=> b!30006 (= res!25833 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!43298 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1368 BitStream!1368 (_ BitVec 64)) List!385)

(assert (=> b!30006 (= lt!43296 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_1!1675 lt!43311) lt!43298))))

(assert (=> b!30006 (= lt!43297 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_1!1675 lt!43306) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30006 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43298)))

(declare-fun lt!43304 () Unit!2321)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1368 array!1780 (_ BitVec 64)) Unit!2321)

(assert (=> b!30006 (= lt!43304 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1674 lt!43305) (buf!1104 (_2!1674 lt!43312)) lt!43298))))

(declare-fun reader!0 (BitStream!1368 BitStream!1368) tuple2!3176)

(assert (=> b!30006 (= lt!43311 (reader!0 (_2!1674 lt!43305) (_2!1674 lt!43312)))))

(assert (=> b!30006 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!43303 () Unit!2321)

(assert (=> b!30006 (= lt!43303 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1104 (_2!1674 lt!43312)) (bvsub to!314 i!635)))))

(assert (=> b!30006 (= lt!43306 (reader!0 thiss!1379 (_2!1674 lt!43312)))))

(declare-fun b!30007 () Bool)

(declare-fun res!25842 () Bool)

(assert (=> b!30007 (=> (not res!25842) (not e!20039))))

(assert (=> b!30007 (= res!25842 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 thiss!1379))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!30008 () Bool)

(assert (=> b!30008 (= e!20034 (array_inv!737 (buf!1104 thiss!1379)))))

(declare-fun b!30009 () Bool)

(declare-fun res!25841 () Bool)

(assert (=> b!30009 (=> res!25841 e!20035)))

(assert (=> b!30009 (= res!25841 (not (= (size!776 (buf!1104 thiss!1379)) (size!776 (buf!1104 (_2!1674 lt!43312))))))))

(declare-fun lt!43300 () tuple2!3176)

(declare-fun b!30010 () Bool)

(declare-fun e!20040 () Bool)

(declare-fun head!222 (List!385) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1368 array!1780 (_ BitVec 64) (_ BitVec 64)) List!385)

(assert (=> b!30010 (= e!20040 (= (head!222 (byteArrayBitContentToList!0 (_2!1674 lt!43305) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!222 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43305) (_1!1675 lt!43300) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!30011 () Bool)

(declare-fun e!20038 () Bool)

(declare-fun e!20032 () Bool)

(assert (=> b!30011 (= e!20038 e!20032)))

(declare-fun res!25838 () Bool)

(assert (=> b!30011 (=> res!25838 e!20032)))

(assert (=> b!30011 (= res!25838 (not (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43312))))))

(assert (=> b!30011 (isPrefixOf!0 thiss!1379 (_2!1674 lt!43312))))

(declare-fun lt!43308 () Unit!2321)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1368 BitStream!1368 BitStream!1368) Unit!2321)

(assert (=> b!30011 (= lt!43308 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1674 lt!43305) (_2!1674 lt!43312)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1368 array!1780 (_ BitVec 64) (_ BitVec 64)) tuple2!3174)

(assert (=> b!30011 (= lt!43312 (appendBitsMSBFirstLoop!0 (_2!1674 lt!43305) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!30011 e!20040))

(declare-fun res!25832 () Bool)

(assert (=> b!30011 (=> (not res!25832) (not e!20040))))

(assert (=> b!30011 (= res!25832 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43310 () Unit!2321)

(assert (=> b!30011 (= lt!43310 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1104 (_2!1674 lt!43305)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!30011 (= lt!43300 (reader!0 thiss!1379 (_2!1674 lt!43305)))))

(declare-fun b!30012 () Bool)

(assert (=> b!30012 (= e!20029 e!20038)))

(declare-fun res!25845 () Bool)

(assert (=> b!30012 (=> res!25845 e!20038)))

(assert (=> b!30012 (= res!25845 (not (isPrefixOf!0 thiss!1379 (_2!1674 lt!43305))))))

(assert (=> b!30012 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43298)))

(assert (=> b!30012 (= lt!43298 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43309 () Unit!2321)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1368 BitStream!1368 (_ BitVec 64) (_ BitVec 64)) Unit!2321)

(assert (=> b!30012 (= lt!43309 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1674 lt!43305) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1368 (_ BitVec 8) (_ BitVec 32)) tuple2!3174)

(assert (=> b!30012 (= lt!43305 (appendBitFromByte!0 thiss!1379 (select (arr!1239 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!30013 () Bool)

(assert (=> b!30013 (= e!20032 e!20035)))

(declare-fun res!25846 () Bool)

(assert (=> b!30013 (=> res!25846 e!20035)))

(assert (=> b!30013 (= res!25846 (not (= lt!43302 (bvsub (bvadd lt!43301 to!314) i!635))))))

(assert (=> b!30013 (= lt!43302 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43312))) (currentByte!2447 (_2!1674 lt!43312)) (currentBit!2442 (_2!1674 lt!43312))))))

(assert (= (and start!6376 res!25843) b!30007))

(assert (= (and b!30007 res!25842) b!30000))

(assert (= (and b!30000 (not res!25840)) b!30012))

(assert (= (and b!30012 (not res!25845)) b!30011))

(assert (= (and b!30011 res!25832) b!30010))

(assert (= (and b!30011 (not res!25838)) b!30013))

(assert (= (and b!30013 (not res!25846)) b!30005))

(assert (= (and b!30005 (not res!25834)) b!30009))

(assert (= (and b!30009 (not res!25841)) b!29996))

(assert (= (and b!29996 res!25848) b!30003))

(assert (= (and b!29996 (not res!25837)) b!30004))

(assert (= (and b!30004 (not res!25839)) b!30001))

(assert (= (and b!30001 (not res!25836)) b!30006))

(assert (= (and b!30006 (not res!25833)) b!29999))

(assert (= (and b!29999 (not res!25844)) b!29997))

(assert (= (and b!29997 (not res!25847)) b!29998))

(assert (= (and b!29998 (not res!25835)) b!30002))

(assert (= start!6376 b!30008))

(declare-fun m!43621 () Bool)

(assert (=> b!30001 m!43621))

(declare-fun m!43623 () Bool)

(assert (=> b!30003 m!43623))

(declare-fun m!43625 () Bool)

(assert (=> b!30006 m!43625))

(declare-fun m!43627 () Bool)

(assert (=> b!30006 m!43627))

(declare-fun m!43629 () Bool)

(assert (=> b!30006 m!43629))

(declare-fun m!43631 () Bool)

(assert (=> b!30006 m!43631))

(declare-fun m!43633 () Bool)

(assert (=> b!30006 m!43633))

(declare-fun m!43635 () Bool)

(assert (=> b!30006 m!43635))

(declare-fun m!43637 () Bool)

(assert (=> b!30006 m!43637))

(declare-fun m!43639 () Bool)

(assert (=> b!30006 m!43639))

(declare-fun m!43641 () Bool)

(assert (=> b!29998 m!43641))

(declare-fun m!43643 () Bool)

(assert (=> b!29998 m!43643))

(declare-fun m!43645 () Bool)

(assert (=> b!30007 m!43645))

(declare-fun m!43647 () Bool)

(assert (=> b!30013 m!43647))

(declare-fun m!43649 () Bool)

(assert (=> b!30012 m!43649))

(declare-fun m!43651 () Bool)

(assert (=> b!30012 m!43651))

(declare-fun m!43653 () Bool)

(assert (=> b!30012 m!43653))

(assert (=> b!30012 m!43651))

(declare-fun m!43655 () Bool)

(assert (=> b!30012 m!43655))

(declare-fun m!43657 () Bool)

(assert (=> b!30012 m!43657))

(declare-fun m!43659 () Bool)

(assert (=> b!30011 m!43659))

(declare-fun m!43661 () Bool)

(assert (=> b!30011 m!43661))

(declare-fun m!43663 () Bool)

(assert (=> b!30011 m!43663))

(declare-fun m!43665 () Bool)

(assert (=> b!30011 m!43665))

(declare-fun m!43667 () Bool)

(assert (=> b!30011 m!43667))

(declare-fun m!43669 () Bool)

(assert (=> b!30011 m!43669))

(declare-fun m!43671 () Bool)

(assert (=> b!30011 m!43671))

(declare-fun m!43673 () Bool)

(assert (=> b!29999 m!43673))

(declare-fun m!43675 () Bool)

(assert (=> b!30004 m!43675))

(declare-fun m!43677 () Bool)

(assert (=> start!6376 m!43677))

(declare-fun m!43679 () Bool)

(assert (=> start!6376 m!43679))

(declare-fun m!43681 () Bool)

(assert (=> b!30005 m!43681))

(declare-fun m!43683 () Bool)

(assert (=> b!30000 m!43683))

(declare-fun m!43685 () Bool)

(assert (=> b!30000 m!43685))

(declare-fun m!43687 () Bool)

(assert (=> b!30000 m!43687))

(declare-fun m!43689 () Bool)

(assert (=> b!30010 m!43689))

(assert (=> b!30010 m!43689))

(declare-fun m!43691 () Bool)

(assert (=> b!30010 m!43691))

(declare-fun m!43693 () Bool)

(assert (=> b!30010 m!43693))

(assert (=> b!30010 m!43693))

(declare-fun m!43695 () Bool)

(assert (=> b!30010 m!43695))

(declare-fun m!43697 () Bool)

(assert (=> b!29997 m!43697))

(declare-fun m!43699 () Bool)

(assert (=> b!29997 m!43699))

(declare-fun m!43701 () Bool)

(assert (=> b!30008 m!43701))

(check-sat (not start!6376) (not b!30005) (not b!29997) (not b!30004) (not b!30003) (not b!29998) (not b!30007) (not b!29999) (not b!30013) (not b!30000) (not b!30012) (not b!30006) (not b!30010) (not b!30001) (not b!30008) (not b!30011))
(check-sat)
(get-model)

(declare-fun d!8570 () Bool)

(assert (=> d!8570 (= (array_inv!737 (buf!1104 thiss!1379)) (bvsge (size!776 (buf!1104 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!30008 d!8570))

(declare-fun d!8572 () Bool)

(assert (=> d!8572 (= (tail!102 lt!43297) (t!1135 lt!43297))))

(assert (=> b!29997 d!8572))

(declare-fun d!8574 () Bool)

(declare-fun e!20083 () Bool)

(assert (=> d!8574 e!20083))

(declare-fun res!25902 () Bool)

(assert (=> d!8574 (=> (not res!25902) (not e!20083))))

(declare-fun lt!43372 () (_ BitVec 64))

(assert (=> d!8574 (= res!25902 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43372 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!43372) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8574 (= lt!43372 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43371 () Unit!2321)

(declare-fun choose!42 (BitStream!1368 BitStream!1368 BitStream!1368 BitStream!1368 (_ BitVec 64) List!385) Unit!2321)

(assert (=> d!8574 (= lt!43371 (choose!42 (_2!1674 lt!43312) (_2!1674 lt!43312) (_1!1675 lt!43306) (_1!1675 lt!43311) (bvsub to!314 i!635) lt!43297))))

(assert (=> d!8574 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8574 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1674 lt!43312) (_2!1674 lt!43312) (_1!1675 lt!43306) (_1!1675 lt!43311) (bvsub to!314 i!635) lt!43297) lt!43371)))

(declare-fun b!30070 () Bool)

(assert (=> b!30070 (= e!20083 (= (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_1!1675 lt!43311) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!102 lt!43297)))))

(assert (= (and d!8574 res!25902) b!30070))

(declare-fun m!43785 () Bool)

(assert (=> d!8574 m!43785))

(declare-fun m!43787 () Bool)

(assert (=> b!30070 m!43787))

(assert (=> b!30070 m!43697))

(assert (=> b!29997 d!8574))

(declare-fun d!8576 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8576 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 thiss!1379))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 thiss!1379))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2414 () Bool)

(assert (= bs!2414 d!8576))

(declare-fun m!43789 () Bool)

(assert (=> bs!2414 m!43789))

(assert (=> b!30007 d!8576))

(declare-fun d!8578 () Bool)

(assert (=> d!8578 (= (array_inv!737 srcBuffer!2) (bvsge (size!776 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6376 d!8578))

(declare-fun d!8580 () Bool)

(assert (=> d!8580 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2442 thiss!1379) (currentByte!2447 thiss!1379) (size!776 (buf!1104 thiss!1379))))))

(declare-fun bs!2415 () Bool)

(assert (= bs!2415 d!8580))

(declare-fun m!43791 () Bool)

(assert (=> bs!2415 m!43791))

(assert (=> start!6376 d!8580))

(declare-fun d!8582 () Bool)

(assert (=> d!8582 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2416 () Bool)

(assert (= bs!2416 d!8582))

(declare-fun m!43793 () Bool)

(assert (=> bs!2416 m!43793))

(assert (=> b!30006 d!8582))

(declare-fun b!30081 () Bool)

(declare-fun e!20089 () Unit!2321)

(declare-fun lt!43429 () Unit!2321)

(assert (=> b!30081 (= e!20089 lt!43429)))

(declare-fun lt!43418 () (_ BitVec 64))

(assert (=> b!30081 (= lt!43418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43419 () (_ BitVec 64))

(assert (=> b!30081 (= lt!43419 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1780 array!1780 (_ BitVec 64) (_ BitVec 64)) Unit!2321)

(assert (=> b!30081 (= lt!43429 (arrayBitRangesEqSymmetric!0 (buf!1104 thiss!1379) (buf!1104 (_2!1674 lt!43312)) lt!43418 lt!43419))))

(declare-fun arrayBitRangesEq!0 (array!1780 array!1780 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30081 (arrayBitRangesEq!0 (buf!1104 (_2!1674 lt!43312)) (buf!1104 thiss!1379) lt!43418 lt!43419)))

(declare-fun b!30082 () Bool)

(declare-fun res!25910 () Bool)

(declare-fun e!20088 () Bool)

(assert (=> b!30082 (=> (not res!25910) (not e!20088))))

(declare-fun lt!43431 () tuple2!3176)

(assert (=> b!30082 (= res!25910 (isPrefixOf!0 (_2!1675 lt!43431) (_2!1674 lt!43312)))))

(declare-fun lt!43417 () (_ BitVec 64))

(declare-fun lt!43425 () (_ BitVec 64))

(declare-fun b!30083 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1368 (_ BitVec 64)) BitStream!1368)

(assert (=> b!30083 (= e!20088 (= (_1!1675 lt!43431) (withMovedBitIndex!0 (_2!1675 lt!43431) (bvsub lt!43417 lt!43425))))))

(assert (=> b!30083 (or (= (bvand lt!43417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43417 lt!43425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30083 (= lt!43425 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43312))) (currentByte!2447 (_2!1674 lt!43312)) (currentBit!2442 (_2!1674 lt!43312))))))

(assert (=> b!30083 (= lt!43417 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(declare-fun d!8584 () Bool)

(assert (=> d!8584 e!20088))

(declare-fun res!25911 () Bool)

(assert (=> d!8584 (=> (not res!25911) (not e!20088))))

(assert (=> d!8584 (= res!25911 (isPrefixOf!0 (_1!1675 lt!43431) (_2!1675 lt!43431)))))

(declare-fun lt!43421 () BitStream!1368)

(assert (=> d!8584 (= lt!43431 (tuple2!3177 lt!43421 (_2!1674 lt!43312)))))

(declare-fun lt!43430 () Unit!2321)

(declare-fun lt!43414 () Unit!2321)

(assert (=> d!8584 (= lt!43430 lt!43414)))

(assert (=> d!8584 (isPrefixOf!0 lt!43421 (_2!1674 lt!43312))))

(assert (=> d!8584 (= lt!43414 (lemmaIsPrefixTransitive!0 lt!43421 (_2!1674 lt!43312) (_2!1674 lt!43312)))))

(declare-fun lt!43432 () Unit!2321)

(declare-fun lt!43422 () Unit!2321)

(assert (=> d!8584 (= lt!43432 lt!43422)))

(assert (=> d!8584 (isPrefixOf!0 lt!43421 (_2!1674 lt!43312))))

(assert (=> d!8584 (= lt!43422 (lemmaIsPrefixTransitive!0 lt!43421 thiss!1379 (_2!1674 lt!43312)))))

(declare-fun lt!43428 () Unit!2321)

(assert (=> d!8584 (= lt!43428 e!20089)))

(declare-fun c!1968 () Bool)

(assert (=> d!8584 (= c!1968 (not (= (size!776 (buf!1104 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!43416 () Unit!2321)

(declare-fun lt!43413 () Unit!2321)

(assert (=> d!8584 (= lt!43416 lt!43413)))

(assert (=> d!8584 (isPrefixOf!0 (_2!1674 lt!43312) (_2!1674 lt!43312))))

(assert (=> d!8584 (= lt!43413 (lemmaIsPrefixRefl!0 (_2!1674 lt!43312)))))

(declare-fun lt!43427 () Unit!2321)

(declare-fun lt!43420 () Unit!2321)

(assert (=> d!8584 (= lt!43427 lt!43420)))

(assert (=> d!8584 (= lt!43420 (lemmaIsPrefixRefl!0 (_2!1674 lt!43312)))))

(declare-fun lt!43423 () Unit!2321)

(declare-fun lt!43415 () Unit!2321)

(assert (=> d!8584 (= lt!43423 lt!43415)))

(assert (=> d!8584 (isPrefixOf!0 lt!43421 lt!43421)))

(assert (=> d!8584 (= lt!43415 (lemmaIsPrefixRefl!0 lt!43421))))

(declare-fun lt!43426 () Unit!2321)

(declare-fun lt!43424 () Unit!2321)

(assert (=> d!8584 (= lt!43426 lt!43424)))

(assert (=> d!8584 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8584 (= lt!43424 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8584 (= lt!43421 (BitStream!1369 (buf!1104 (_2!1674 lt!43312)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(assert (=> d!8584 (isPrefixOf!0 thiss!1379 (_2!1674 lt!43312))))

(assert (=> d!8584 (= (reader!0 thiss!1379 (_2!1674 lt!43312)) lt!43431)))

(declare-fun b!30084 () Bool)

(declare-fun res!25909 () Bool)

(assert (=> b!30084 (=> (not res!25909) (not e!20088))))

(assert (=> b!30084 (= res!25909 (isPrefixOf!0 (_1!1675 lt!43431) thiss!1379))))

(declare-fun b!30085 () Bool)

(declare-fun Unit!2325 () Unit!2321)

(assert (=> b!30085 (= e!20089 Unit!2325)))

(assert (= (and d!8584 c!1968) b!30081))

(assert (= (and d!8584 (not c!1968)) b!30085))

(assert (= (and d!8584 res!25911) b!30084))

(assert (= (and b!30084 res!25909) b!30082))

(assert (= (and b!30082 res!25910) b!30083))

(declare-fun m!43795 () Bool)

(assert (=> b!30083 m!43795))

(assert (=> b!30083 m!43647))

(assert (=> b!30083 m!43687))

(declare-fun m!43797 () Bool)

(assert (=> b!30082 m!43797))

(assert (=> b!30081 m!43687))

(declare-fun m!43799 () Bool)

(assert (=> b!30081 m!43799))

(declare-fun m!43801 () Bool)

(assert (=> b!30081 m!43801))

(declare-fun m!43803 () Bool)

(assert (=> b!30084 m!43803))

(assert (=> d!8584 m!43685))

(declare-fun m!43805 () Bool)

(assert (=> d!8584 m!43805))

(declare-fun m!43807 () Bool)

(assert (=> d!8584 m!43807))

(declare-fun m!43809 () Bool)

(assert (=> d!8584 m!43809))

(assert (=> d!8584 m!43669))

(declare-fun m!43811 () Bool)

(assert (=> d!8584 m!43811))

(assert (=> d!8584 m!43683))

(declare-fun m!43813 () Bool)

(assert (=> d!8584 m!43813))

(declare-fun m!43815 () Bool)

(assert (=> d!8584 m!43815))

(declare-fun m!43817 () Bool)

(assert (=> d!8584 m!43817))

(declare-fun m!43819 () Bool)

(assert (=> d!8584 m!43819))

(assert (=> b!30006 d!8584))

(declare-fun d!8586 () Bool)

(declare-fun e!20095 () Bool)

(assert (=> d!8586 e!20095))

(declare-fun c!1973 () Bool)

(assert (=> d!8586 (= c!1973 (= lt!43298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!43441 () List!385)

(declare-datatypes ((tuple2!3182 0))(
  ( (tuple2!3183 (_1!1678 List!385) (_2!1678 BitStream!1368)) )
))
(declare-fun e!20094 () tuple2!3182)

(assert (=> d!8586 (= lt!43441 (_1!1678 e!20094))))

(declare-fun c!1974 () Bool)

(assert (=> d!8586 (= c!1974 (= lt!43298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8586 (bvsge lt!43298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8586 (= (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_1!1675 lt!43311) lt!43298) lt!43441)))

(declare-fun b!30097 () Bool)

(assert (=> b!30097 (= e!20095 (> (length!111 lt!43441) 0))))

(declare-datatypes ((tuple2!3184 0))(
  ( (tuple2!3185 (_1!1679 Bool) (_2!1679 BitStream!1368)) )
))
(declare-fun lt!43439 () tuple2!3184)

(declare-fun lt!43440 () (_ BitVec 64))

(declare-fun b!30095 () Bool)

(assert (=> b!30095 (= e!20094 (tuple2!3183 (Cons!381 (_1!1679 lt!43439) (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_2!1679 lt!43439) (bvsub lt!43298 lt!43440))) (_2!1679 lt!43439)))))

(declare-fun readBit!0 (BitStream!1368) tuple2!3184)

(assert (=> b!30095 (= lt!43439 (readBit!0 (_1!1675 lt!43311)))))

(assert (=> b!30095 (= lt!43440 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30096 () Bool)

(declare-fun isEmpty!79 (List!385) Bool)

(assert (=> b!30096 (= e!20095 (isEmpty!79 lt!43441))))

(declare-fun b!30094 () Bool)

(assert (=> b!30094 (= e!20094 (tuple2!3183 Nil!382 (_1!1675 lt!43311)))))

(assert (= (and d!8586 c!1974) b!30094))

(assert (= (and d!8586 (not c!1974)) b!30095))

(assert (= (and d!8586 c!1973) b!30096))

(assert (= (and d!8586 (not c!1973)) b!30097))

(declare-fun m!43821 () Bool)

(assert (=> b!30097 m!43821))

(declare-fun m!43823 () Bool)

(assert (=> b!30095 m!43823))

(declare-fun m!43825 () Bool)

(assert (=> b!30095 m!43825))

(declare-fun m!43827 () Bool)

(assert (=> b!30096 m!43827))

(assert (=> b!30006 d!8586))

(declare-fun d!8588 () Bool)

(assert (=> d!8588 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43298) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305)))) lt!43298))))

(declare-fun bs!2417 () Bool)

(assert (= bs!2417 d!8588))

(declare-fun m!43829 () Bool)

(assert (=> bs!2417 m!43829))

(assert (=> b!30006 d!8588))

(declare-fun d!8590 () Bool)

(assert (=> d!8590 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43298)))

(declare-fun lt!43444 () Unit!2321)

(declare-fun choose!9 (BitStream!1368 array!1780 (_ BitVec 64) BitStream!1368) Unit!2321)

(assert (=> d!8590 (= lt!43444 (choose!9 (_2!1674 lt!43305) (buf!1104 (_2!1674 lt!43312)) lt!43298 (BitStream!1369 (buf!1104 (_2!1674 lt!43312)) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305)))))))

(assert (=> d!8590 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1674 lt!43305) (buf!1104 (_2!1674 lt!43312)) lt!43298) lt!43444)))

(declare-fun bs!2418 () Bool)

(assert (= bs!2418 d!8590))

(assert (=> bs!2418 m!43637))

(declare-fun m!43831 () Bool)

(assert (=> bs!2418 m!43831))

(assert (=> b!30006 d!8590))

(declare-fun d!8592 () Bool)

(declare-fun e!20097 () Bool)

(assert (=> d!8592 e!20097))

(declare-fun c!1975 () Bool)

(assert (=> d!8592 (= c!1975 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!43447 () List!385)

(declare-fun e!20096 () tuple2!3182)

(assert (=> d!8592 (= lt!43447 (_1!1678 e!20096))))

(declare-fun c!1976 () Bool)

(assert (=> d!8592 (= c!1976 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8592 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8592 (= (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_1!1675 lt!43306) (bvsub to!314 i!635)) lt!43447)))

(declare-fun b!30101 () Bool)

(assert (=> b!30101 (= e!20097 (> (length!111 lt!43447) 0))))

(declare-fun b!30099 () Bool)

(declare-fun lt!43445 () tuple2!3184)

(declare-fun lt!43446 () (_ BitVec 64))

(assert (=> b!30099 (= e!20096 (tuple2!3183 (Cons!381 (_1!1679 lt!43445) (bitStreamReadBitsIntoList!0 (_2!1674 lt!43312) (_2!1679 lt!43445) (bvsub (bvsub to!314 i!635) lt!43446))) (_2!1679 lt!43445)))))

(assert (=> b!30099 (= lt!43445 (readBit!0 (_1!1675 lt!43306)))))

(assert (=> b!30099 (= lt!43446 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30100 () Bool)

(assert (=> b!30100 (= e!20097 (isEmpty!79 lt!43447))))

(declare-fun b!30098 () Bool)

(assert (=> b!30098 (= e!20096 (tuple2!3183 Nil!382 (_1!1675 lt!43306)))))

(assert (= (and d!8592 c!1976) b!30098))

(assert (= (and d!8592 (not c!1976)) b!30099))

(assert (= (and d!8592 c!1975) b!30100))

(assert (= (and d!8592 (not c!1975)) b!30101))

(declare-fun m!43833 () Bool)

(assert (=> b!30101 m!43833))

(declare-fun m!43835 () Bool)

(assert (=> b!30099 m!43835))

(declare-fun m!43837 () Bool)

(assert (=> b!30099 m!43837))

(declare-fun m!43839 () Bool)

(assert (=> b!30100 m!43839))

(assert (=> b!30006 d!8592))

(declare-fun d!8594 () Bool)

(assert (=> d!8594 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!43448 () Unit!2321)

(assert (=> d!8594 (= lt!43448 (choose!9 thiss!1379 (buf!1104 (_2!1674 lt!43312)) (bvsub to!314 i!635) (BitStream!1369 (buf!1104 (_2!1674 lt!43312)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379))))))

(assert (=> d!8594 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1104 (_2!1674 lt!43312)) (bvsub to!314 i!635)) lt!43448)))

(declare-fun bs!2419 () Bool)

(assert (= bs!2419 d!8594))

(assert (=> bs!2419 m!43627))

(declare-fun m!43841 () Bool)

(assert (=> bs!2419 m!43841))

(assert (=> b!30006 d!8594))

(declare-fun b!30102 () Bool)

(declare-fun e!20099 () Unit!2321)

(declare-fun lt!43465 () Unit!2321)

(assert (=> b!30102 (= e!20099 lt!43465)))

(declare-fun lt!43454 () (_ BitVec 64))

(assert (=> b!30102 (= lt!43454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43455 () (_ BitVec 64))

(assert (=> b!30102 (= lt!43455 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))))))

(assert (=> b!30102 (= lt!43465 (arrayBitRangesEqSymmetric!0 (buf!1104 (_2!1674 lt!43305)) (buf!1104 (_2!1674 lt!43312)) lt!43454 lt!43455))))

(assert (=> b!30102 (arrayBitRangesEq!0 (buf!1104 (_2!1674 lt!43312)) (buf!1104 (_2!1674 lt!43305)) lt!43454 lt!43455)))

(declare-fun b!30103 () Bool)

(declare-fun res!25913 () Bool)

(declare-fun e!20098 () Bool)

(assert (=> b!30103 (=> (not res!25913) (not e!20098))))

(declare-fun lt!43467 () tuple2!3176)

(assert (=> b!30103 (= res!25913 (isPrefixOf!0 (_2!1675 lt!43467) (_2!1674 lt!43312)))))

(declare-fun lt!43453 () (_ BitVec 64))

(declare-fun b!30104 () Bool)

(declare-fun lt!43461 () (_ BitVec 64))

(assert (=> b!30104 (= e!20098 (= (_1!1675 lt!43467) (withMovedBitIndex!0 (_2!1675 lt!43467) (bvsub lt!43453 lt!43461))))))

(assert (=> b!30104 (or (= (bvand lt!43453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43453 lt!43461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30104 (= lt!43461 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43312))) (currentByte!2447 (_2!1674 lt!43312)) (currentBit!2442 (_2!1674 lt!43312))))))

(assert (=> b!30104 (= lt!43453 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))))))

(declare-fun d!8596 () Bool)

(assert (=> d!8596 e!20098))

(declare-fun res!25914 () Bool)

(assert (=> d!8596 (=> (not res!25914) (not e!20098))))

(assert (=> d!8596 (= res!25914 (isPrefixOf!0 (_1!1675 lt!43467) (_2!1675 lt!43467)))))

(declare-fun lt!43457 () BitStream!1368)

(assert (=> d!8596 (= lt!43467 (tuple2!3177 lt!43457 (_2!1674 lt!43312)))))

(declare-fun lt!43466 () Unit!2321)

(declare-fun lt!43450 () Unit!2321)

(assert (=> d!8596 (= lt!43466 lt!43450)))

(assert (=> d!8596 (isPrefixOf!0 lt!43457 (_2!1674 lt!43312))))

(assert (=> d!8596 (= lt!43450 (lemmaIsPrefixTransitive!0 lt!43457 (_2!1674 lt!43312) (_2!1674 lt!43312)))))

(declare-fun lt!43468 () Unit!2321)

(declare-fun lt!43458 () Unit!2321)

(assert (=> d!8596 (= lt!43468 lt!43458)))

(assert (=> d!8596 (isPrefixOf!0 lt!43457 (_2!1674 lt!43312))))

(assert (=> d!8596 (= lt!43458 (lemmaIsPrefixTransitive!0 lt!43457 (_2!1674 lt!43305) (_2!1674 lt!43312)))))

(declare-fun lt!43464 () Unit!2321)

(assert (=> d!8596 (= lt!43464 e!20099)))

(declare-fun c!1977 () Bool)

(assert (=> d!8596 (= c!1977 (not (= (size!776 (buf!1104 (_2!1674 lt!43305))) #b00000000000000000000000000000000)))))

(declare-fun lt!43452 () Unit!2321)

(declare-fun lt!43449 () Unit!2321)

(assert (=> d!8596 (= lt!43452 lt!43449)))

(assert (=> d!8596 (isPrefixOf!0 (_2!1674 lt!43312) (_2!1674 lt!43312))))

(assert (=> d!8596 (= lt!43449 (lemmaIsPrefixRefl!0 (_2!1674 lt!43312)))))

(declare-fun lt!43463 () Unit!2321)

(declare-fun lt!43456 () Unit!2321)

(assert (=> d!8596 (= lt!43463 lt!43456)))

(assert (=> d!8596 (= lt!43456 (lemmaIsPrefixRefl!0 (_2!1674 lt!43312)))))

(declare-fun lt!43459 () Unit!2321)

(declare-fun lt!43451 () Unit!2321)

(assert (=> d!8596 (= lt!43459 lt!43451)))

(assert (=> d!8596 (isPrefixOf!0 lt!43457 lt!43457)))

(assert (=> d!8596 (= lt!43451 (lemmaIsPrefixRefl!0 lt!43457))))

(declare-fun lt!43462 () Unit!2321)

(declare-fun lt!43460 () Unit!2321)

(assert (=> d!8596 (= lt!43462 lt!43460)))

(assert (=> d!8596 (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43305))))

(assert (=> d!8596 (= lt!43460 (lemmaIsPrefixRefl!0 (_2!1674 lt!43305)))))

(assert (=> d!8596 (= lt!43457 (BitStream!1369 (buf!1104 (_2!1674 lt!43312)) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))))))

(assert (=> d!8596 (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43312))))

(assert (=> d!8596 (= (reader!0 (_2!1674 lt!43305) (_2!1674 lt!43312)) lt!43467)))

(declare-fun b!30105 () Bool)

(declare-fun res!25912 () Bool)

(assert (=> b!30105 (=> (not res!25912) (not e!20098))))

(assert (=> b!30105 (= res!25912 (isPrefixOf!0 (_1!1675 lt!43467) (_2!1674 lt!43305)))))

(declare-fun b!30106 () Bool)

(declare-fun Unit!2326 () Unit!2321)

(assert (=> b!30106 (= e!20099 Unit!2326)))

(assert (= (and d!8596 c!1977) b!30102))

(assert (= (and d!8596 (not c!1977)) b!30106))

(assert (= (and d!8596 res!25914) b!30105))

(assert (= (and b!30105 res!25912) b!30103))

(assert (= (and b!30103 res!25913) b!30104))

(declare-fun m!43843 () Bool)

(assert (=> b!30104 m!43843))

(assert (=> b!30104 m!43647))

(assert (=> b!30104 m!43623))

(declare-fun m!43845 () Bool)

(assert (=> b!30103 m!43845))

(assert (=> b!30102 m!43623))

(declare-fun m!43847 () Bool)

(assert (=> b!30102 m!43847))

(declare-fun m!43849 () Bool)

(assert (=> b!30102 m!43849))

(declare-fun m!43851 () Bool)

(assert (=> b!30105 m!43851))

(declare-fun m!43853 () Bool)

(assert (=> d!8596 m!43853))

(assert (=> d!8596 m!43805))

(declare-fun m!43855 () Bool)

(assert (=> d!8596 m!43855))

(assert (=> d!8596 m!43809))

(assert (=> d!8596 m!43663))

(declare-fun m!43857 () Bool)

(assert (=> d!8596 m!43857))

(declare-fun m!43859 () Bool)

(assert (=> d!8596 m!43859))

(declare-fun m!43861 () Bool)

(assert (=> d!8596 m!43861))

(declare-fun m!43863 () Bool)

(assert (=> d!8596 m!43863))

(declare-fun m!43865 () Bool)

(assert (=> d!8596 m!43865))

(declare-fun m!43867 () Bool)

(assert (=> d!8596 m!43867))

(assert (=> b!30006 d!8596))

(declare-fun d!8598 () Bool)

(assert (=> d!8598 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2420 () Bool)

(assert (= bs!2420 d!8598))

(declare-fun m!43869 () Bool)

(assert (=> bs!2420 m!43869))

(assert (=> b!30011 d!8598))

(declare-fun d!8600 () Bool)

(assert (=> d!8600 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43469 () Unit!2321)

(assert (=> d!8600 (= lt!43469 (choose!9 thiss!1379 (buf!1104 (_2!1674 lt!43305)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1369 (buf!1104 (_2!1674 lt!43305)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379))))))

(assert (=> d!8600 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1104 (_2!1674 lt!43305)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43469)))

(declare-fun bs!2421 () Bool)

(assert (= bs!2421 d!8600))

(assert (=> bs!2421 m!43667))

(declare-fun m!43871 () Bool)

(assert (=> bs!2421 m!43871))

(assert (=> b!30011 d!8600))

(declare-fun d!8602 () Bool)

(assert (=> d!8602 (isPrefixOf!0 thiss!1379 (_2!1674 lt!43312))))

(declare-fun lt!43472 () Unit!2321)

(declare-fun choose!30 (BitStream!1368 BitStream!1368 BitStream!1368) Unit!2321)

(assert (=> d!8602 (= lt!43472 (choose!30 thiss!1379 (_2!1674 lt!43305) (_2!1674 lt!43312)))))

(assert (=> d!8602 (isPrefixOf!0 thiss!1379 (_2!1674 lt!43305))))

(assert (=> d!8602 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1674 lt!43305) (_2!1674 lt!43312)) lt!43472)))

(declare-fun bs!2422 () Bool)

(assert (= bs!2422 d!8602))

(assert (=> bs!2422 m!43669))

(declare-fun m!43873 () Bool)

(assert (=> bs!2422 m!43873))

(assert (=> bs!2422 m!43649))

(assert (=> b!30011 d!8602))

(declare-fun d!8604 () Bool)

(declare-fun res!25921 () Bool)

(declare-fun e!20104 () Bool)

(assert (=> d!8604 (=> (not res!25921) (not e!20104))))

(assert (=> d!8604 (= res!25921 (= (size!776 (buf!1104 (_2!1674 lt!43305))) (size!776 (buf!1104 (_2!1674 lt!43312)))))))

(assert (=> d!8604 (= (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43312)) e!20104)))

(declare-fun b!30113 () Bool)

(declare-fun res!25923 () Bool)

(assert (=> b!30113 (=> (not res!25923) (not e!20104))))

(assert (=> b!30113 (= res!25923 (bvsle (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))) (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43312))) (currentByte!2447 (_2!1674 lt!43312)) (currentBit!2442 (_2!1674 lt!43312)))))))

(declare-fun b!30114 () Bool)

(declare-fun e!20105 () Bool)

(assert (=> b!30114 (= e!20104 e!20105)))

(declare-fun res!25922 () Bool)

(assert (=> b!30114 (=> res!25922 e!20105)))

(assert (=> b!30114 (= res!25922 (= (size!776 (buf!1104 (_2!1674 lt!43305))) #b00000000000000000000000000000000))))

(declare-fun b!30115 () Bool)

(assert (=> b!30115 (= e!20105 (arrayBitRangesEq!0 (buf!1104 (_2!1674 lt!43305)) (buf!1104 (_2!1674 lt!43312)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305)))))))

(assert (= (and d!8604 res!25921) b!30113))

(assert (= (and b!30113 res!25923) b!30114))

(assert (= (and b!30114 (not res!25922)) b!30115))

(assert (=> b!30113 m!43623))

(assert (=> b!30113 m!43647))

(assert (=> b!30115 m!43623))

(assert (=> b!30115 m!43623))

(declare-fun m!43875 () Bool)

(assert (=> b!30115 m!43875))

(assert (=> b!30011 d!8604))

(declare-fun b!30116 () Bool)

(declare-fun e!20107 () Unit!2321)

(declare-fun lt!43489 () Unit!2321)

(assert (=> b!30116 (= e!20107 lt!43489)))

(declare-fun lt!43478 () (_ BitVec 64))

(assert (=> b!30116 (= lt!43478 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43479 () (_ BitVec 64))

(assert (=> b!30116 (= lt!43479 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(assert (=> b!30116 (= lt!43489 (arrayBitRangesEqSymmetric!0 (buf!1104 thiss!1379) (buf!1104 (_2!1674 lt!43305)) lt!43478 lt!43479))))

(assert (=> b!30116 (arrayBitRangesEq!0 (buf!1104 (_2!1674 lt!43305)) (buf!1104 thiss!1379) lt!43478 lt!43479)))

(declare-fun b!30117 () Bool)

(declare-fun res!25925 () Bool)

(declare-fun e!20106 () Bool)

(assert (=> b!30117 (=> (not res!25925) (not e!20106))))

(declare-fun lt!43491 () tuple2!3176)

(assert (=> b!30117 (= res!25925 (isPrefixOf!0 (_2!1675 lt!43491) (_2!1674 lt!43305)))))

(declare-fun lt!43485 () (_ BitVec 64))

(declare-fun b!30118 () Bool)

(declare-fun lt!43477 () (_ BitVec 64))

(assert (=> b!30118 (= e!20106 (= (_1!1675 lt!43491) (withMovedBitIndex!0 (_2!1675 lt!43491) (bvsub lt!43477 lt!43485))))))

(assert (=> b!30118 (or (= (bvand lt!43477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43477 lt!43485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30118 (= lt!43485 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))))))

(assert (=> b!30118 (= lt!43477 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(declare-fun d!8606 () Bool)

(assert (=> d!8606 e!20106))

(declare-fun res!25926 () Bool)

(assert (=> d!8606 (=> (not res!25926) (not e!20106))))

(assert (=> d!8606 (= res!25926 (isPrefixOf!0 (_1!1675 lt!43491) (_2!1675 lt!43491)))))

(declare-fun lt!43481 () BitStream!1368)

(assert (=> d!8606 (= lt!43491 (tuple2!3177 lt!43481 (_2!1674 lt!43305)))))

(declare-fun lt!43490 () Unit!2321)

(declare-fun lt!43474 () Unit!2321)

(assert (=> d!8606 (= lt!43490 lt!43474)))

(assert (=> d!8606 (isPrefixOf!0 lt!43481 (_2!1674 lt!43305))))

(assert (=> d!8606 (= lt!43474 (lemmaIsPrefixTransitive!0 lt!43481 (_2!1674 lt!43305) (_2!1674 lt!43305)))))

(declare-fun lt!43492 () Unit!2321)

(declare-fun lt!43482 () Unit!2321)

(assert (=> d!8606 (= lt!43492 lt!43482)))

(assert (=> d!8606 (isPrefixOf!0 lt!43481 (_2!1674 lt!43305))))

(assert (=> d!8606 (= lt!43482 (lemmaIsPrefixTransitive!0 lt!43481 thiss!1379 (_2!1674 lt!43305)))))

(declare-fun lt!43488 () Unit!2321)

(assert (=> d!8606 (= lt!43488 e!20107)))

(declare-fun c!1978 () Bool)

(assert (=> d!8606 (= c!1978 (not (= (size!776 (buf!1104 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!43476 () Unit!2321)

(declare-fun lt!43473 () Unit!2321)

(assert (=> d!8606 (= lt!43476 lt!43473)))

(assert (=> d!8606 (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43305))))

(assert (=> d!8606 (= lt!43473 (lemmaIsPrefixRefl!0 (_2!1674 lt!43305)))))

(declare-fun lt!43487 () Unit!2321)

(declare-fun lt!43480 () Unit!2321)

(assert (=> d!8606 (= lt!43487 lt!43480)))

(assert (=> d!8606 (= lt!43480 (lemmaIsPrefixRefl!0 (_2!1674 lt!43305)))))

(declare-fun lt!43483 () Unit!2321)

(declare-fun lt!43475 () Unit!2321)

(assert (=> d!8606 (= lt!43483 lt!43475)))

(assert (=> d!8606 (isPrefixOf!0 lt!43481 lt!43481)))

(assert (=> d!8606 (= lt!43475 (lemmaIsPrefixRefl!0 lt!43481))))

(declare-fun lt!43486 () Unit!2321)

(declare-fun lt!43484 () Unit!2321)

(assert (=> d!8606 (= lt!43486 lt!43484)))

(assert (=> d!8606 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8606 (= lt!43484 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8606 (= lt!43481 (BitStream!1369 (buf!1104 (_2!1674 lt!43305)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(assert (=> d!8606 (isPrefixOf!0 thiss!1379 (_2!1674 lt!43305))))

(assert (=> d!8606 (= (reader!0 thiss!1379 (_2!1674 lt!43305)) lt!43491)))

(declare-fun b!30119 () Bool)

(declare-fun res!25924 () Bool)

(assert (=> b!30119 (=> (not res!25924) (not e!20106))))

(assert (=> b!30119 (= res!25924 (isPrefixOf!0 (_1!1675 lt!43491) thiss!1379))))

(declare-fun b!30120 () Bool)

(declare-fun Unit!2327 () Unit!2321)

(assert (=> b!30120 (= e!20107 Unit!2327)))

(assert (= (and d!8606 c!1978) b!30116))

(assert (= (and d!8606 (not c!1978)) b!30120))

(assert (= (and d!8606 res!25926) b!30119))

(assert (= (and b!30119 res!25924) b!30117))

(assert (= (and b!30117 res!25925) b!30118))

(declare-fun m!43877 () Bool)

(assert (=> b!30118 m!43877))

(assert (=> b!30118 m!43623))

(assert (=> b!30118 m!43687))

(declare-fun m!43879 () Bool)

(assert (=> b!30117 m!43879))

(assert (=> b!30116 m!43687))

(declare-fun m!43881 () Bool)

(assert (=> b!30116 m!43881))

(declare-fun m!43883 () Bool)

(assert (=> b!30116 m!43883))

(declare-fun m!43885 () Bool)

(assert (=> b!30119 m!43885))

(assert (=> d!8606 m!43685))

(assert (=> d!8606 m!43859))

(declare-fun m!43887 () Bool)

(assert (=> d!8606 m!43887))

(assert (=> d!8606 m!43853))

(assert (=> d!8606 m!43649))

(declare-fun m!43889 () Bool)

(assert (=> d!8606 m!43889))

(assert (=> d!8606 m!43683))

(declare-fun m!43891 () Bool)

(assert (=> d!8606 m!43891))

(declare-fun m!43893 () Bool)

(assert (=> d!8606 m!43893))

(declare-fun m!43895 () Bool)

(assert (=> d!8606 m!43895))

(declare-fun m!43897 () Bool)

(assert (=> d!8606 m!43897))

(assert (=> b!30011 d!8606))

(declare-fun b!30251 () Bool)

(declare-fun res!26017 () Bool)

(declare-fun e!20176 () Bool)

(assert (=> b!30251 (=> (not res!26017) (not e!20176))))

(declare-fun lt!43814 () tuple2!3174)

(assert (=> b!30251 (= res!26017 (invariant!0 (currentBit!2442 (_2!1674 lt!43814)) (currentByte!2447 (_2!1674 lt!43814)) (size!776 (buf!1104 (_2!1674 lt!43814)))))))

(declare-fun b!30252 () Bool)

(declare-fun e!20175 () Bool)

(declare-fun lt!43802 () (_ BitVec 64))

(assert (=> b!30252 (= e!20175 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43802))))

(declare-fun b!30253 () Bool)

(declare-fun e!20177 () tuple2!3174)

(declare-fun lt!43806 () tuple2!3174)

(declare-fun Unit!2328 () Unit!2321)

(assert (=> b!30253 (= e!20177 (tuple2!3175 Unit!2328 (_2!1674 lt!43806)))))

(declare-fun lt!43807 () tuple2!3174)

(assert (=> b!30253 (= lt!43807 (appendBitFromByte!0 (_2!1674 lt!43305) (select (arr!1239 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!43798 () (_ BitVec 64))

(assert (=> b!30253 (= lt!43798 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43791 () (_ BitVec 64))

(assert (=> b!30253 (= lt!43791 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43788 () Unit!2321)

(assert (=> b!30253 (= lt!43788 (validateOffsetBitsIneqLemma!0 (_2!1674 lt!43305) (_2!1674 lt!43807) lt!43798 lt!43791))))

(assert (=> b!30253 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43807)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43807))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43807))) (bvsub lt!43798 lt!43791))))

(declare-fun lt!43785 () Unit!2321)

(assert (=> b!30253 (= lt!43785 lt!43788)))

(declare-fun lt!43805 () tuple2!3176)

(assert (=> b!30253 (= lt!43805 (reader!0 (_2!1674 lt!43305) (_2!1674 lt!43807)))))

(declare-fun lt!43778 () (_ BitVec 64))

(assert (=> b!30253 (= lt!43778 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43817 () Unit!2321)

(assert (=> b!30253 (= lt!43817 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1674 lt!43305) (buf!1104 (_2!1674 lt!43807)) lt!43778))))

(assert (=> b!30253 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43807)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43778)))

(declare-fun lt!43786 () Unit!2321)

(assert (=> b!30253 (= lt!43786 lt!43817)))

(assert (=> b!30253 (= (head!222 (byteArrayBitContentToList!0 (_2!1674 lt!43807) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!222 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43807) (_1!1675 lt!43805) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43808 () Unit!2321)

(declare-fun Unit!2329 () Unit!2321)

(assert (=> b!30253 (= lt!43808 Unit!2329)))

(assert (=> b!30253 (= lt!43806 (appendBitsMSBFirstLoop!0 (_2!1674 lt!43807) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!43796 () Unit!2321)

(assert (=> b!30253 (= lt!43796 (lemmaIsPrefixTransitive!0 (_2!1674 lt!43305) (_2!1674 lt!43807) (_2!1674 lt!43806)))))

(assert (=> b!30253 (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43806))))

(declare-fun lt!43782 () Unit!2321)

(assert (=> b!30253 (= lt!43782 lt!43796)))

(assert (=> b!30253 (= (size!776 (buf!1104 (_2!1674 lt!43806))) (size!776 (buf!1104 (_2!1674 lt!43305))))))

(declare-fun lt!43793 () Unit!2321)

(declare-fun Unit!2330 () Unit!2321)

(assert (=> b!30253 (= lt!43793 Unit!2330)))

(assert (=> b!30253 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43806))) (currentByte!2447 (_2!1674 lt!43806)) (currentBit!2442 (_2!1674 lt!43806))) (bvsub (bvadd (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43795 () Unit!2321)

(declare-fun Unit!2331 () Unit!2321)

(assert (=> b!30253 (= lt!43795 Unit!2331)))

(assert (=> b!30253 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43806))) (currentByte!2447 (_2!1674 lt!43806)) (currentBit!2442 (_2!1674 lt!43806))) (bvsub (bvsub (bvadd (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43807))) (currentByte!2447 (_2!1674 lt!43807)) (currentBit!2442 (_2!1674 lt!43807))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43797 () Unit!2321)

(declare-fun Unit!2332 () Unit!2321)

(assert (=> b!30253 (= lt!43797 Unit!2332)))

(declare-fun lt!43819 () tuple2!3176)

(assert (=> b!30253 (= lt!43819 (reader!0 (_2!1674 lt!43305) (_2!1674 lt!43806)))))

(declare-fun lt!43787 () (_ BitVec 64))

(assert (=> b!30253 (= lt!43787 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43799 () Unit!2321)

(assert (=> b!30253 (= lt!43799 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1674 lt!43305) (buf!1104 (_2!1674 lt!43806)) lt!43787))))

(assert (=> b!30253 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43806)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43787)))

(declare-fun lt!43777 () Unit!2321)

(assert (=> b!30253 (= lt!43777 lt!43799)))

(declare-fun lt!43800 () tuple2!3176)

(declare-fun call!385 () tuple2!3176)

(assert (=> b!30253 (= lt!43800 call!385)))

(declare-fun lt!43790 () (_ BitVec 64))

(assert (=> b!30253 (= lt!43790 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43783 () Unit!2321)

(assert (=> b!30253 (= lt!43783 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1674 lt!43807) (buf!1104 (_2!1674 lt!43806)) lt!43790))))

(assert (=> b!30253 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43806)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43807))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43807))) lt!43790)))

(declare-fun lt!43801 () Unit!2321)

(assert (=> b!30253 (= lt!43801 lt!43783)))

(declare-fun lt!43776 () List!385)

(assert (=> b!30253 (= lt!43776 (byteArrayBitContentToList!0 (_2!1674 lt!43806) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!43818 () List!385)

(assert (=> b!30253 (= lt!43818 (byteArrayBitContentToList!0 (_2!1674 lt!43806) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43815 () List!385)

(assert (=> b!30253 (= lt!43815 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43806) (_1!1675 lt!43819) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!43812 () List!385)

(assert (=> b!30253 (= lt!43812 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43806) (_1!1675 lt!43800) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43794 () (_ BitVec 64))

(assert (=> b!30253 (= lt!43794 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43811 () Unit!2321)

(assert (=> b!30253 (= lt!43811 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1674 lt!43806) (_2!1674 lt!43806) (_1!1675 lt!43819) (_1!1675 lt!43800) lt!43794 lt!43815))))

(assert (=> b!30253 (= (bitStreamReadBitsIntoList!0 (_2!1674 lt!43806) (_1!1675 lt!43800) (bvsub lt!43794 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!102 lt!43815))))

(declare-fun lt!43792 () Unit!2321)

(assert (=> b!30253 (= lt!43792 lt!43811)))

(declare-fun lt!43804 () (_ BitVec 64))

(declare-fun lt!43780 () Unit!2321)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1780 array!1780 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2321)

(assert (=> b!30253 (= lt!43780 (arrayBitRangesEqImpliesEq!0 (buf!1104 (_2!1674 lt!43807)) (buf!1104 (_2!1674 lt!43806)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!43804 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43807))) (currentByte!2447 (_2!1674 lt!43807)) (currentBit!2442 (_2!1674 lt!43807)))))))

(assert (=> b!30253 (= (bitAt!0 (buf!1104 (_2!1674 lt!43807)) lt!43804) (bitAt!0 (buf!1104 (_2!1674 lt!43806)) lt!43804))))

(declare-fun lt!43809 () Unit!2321)

(assert (=> b!30253 (= lt!43809 lt!43780)))

(declare-fun b!30254 () Bool)

(declare-fun res!26016 () Bool)

(assert (=> b!30254 (=> (not res!26016) (not e!20176))))

(assert (=> b!30254 (= res!26016 (= (size!776 (buf!1104 (_2!1674 lt!43814))) (size!776 (buf!1104 (_2!1674 lt!43305)))))))

(declare-fun b!30255 () Bool)

(declare-fun Unit!2333 () Unit!2321)

(assert (=> b!30255 (= e!20177 (tuple2!3175 Unit!2333 (_2!1674 lt!43305)))))

(assert (=> b!30255 (= (size!776 (buf!1104 (_2!1674 lt!43305))) (size!776 (buf!1104 (_2!1674 lt!43305))))))

(declare-fun lt!43781 () Unit!2321)

(declare-fun Unit!2334 () Unit!2321)

(assert (=> b!30255 (= lt!43781 Unit!2334)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1368 array!1780 array!1780 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3186 0))(
  ( (tuple2!3187 (_1!1680 array!1780) (_2!1680 BitStream!1368)) )
))
(declare-fun readBits!0 (BitStream!1368 (_ BitVec 64)) tuple2!3186)

(assert (=> b!30255 (checkByteArrayBitContent!0 (_2!1674 lt!43305) srcBuffer!2 (_1!1680 (readBits!0 (_1!1675 call!385) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!30256 () Bool)

(declare-fun res!26020 () Bool)

(assert (=> b!30256 (=> (not res!26020) (not e!20176))))

(assert (=> b!30256 (= res!26020 (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43814)))))

(declare-fun b!30257 () Bool)

(declare-fun res!26021 () Bool)

(assert (=> b!30257 (=> (not res!26021) (not e!20176))))

(assert (=> b!30257 (= res!26021 (= (size!776 (buf!1104 (_2!1674 lt!43305))) (size!776 (buf!1104 (_2!1674 lt!43814)))))))

(declare-fun lt!43784 () tuple2!3176)

(declare-fun b!30258 () Bool)

(assert (=> b!30258 (= e!20176 (= (bitStreamReadBitsIntoList!0 (_2!1674 lt!43814) (_1!1675 lt!43784) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1674 lt!43814) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!30258 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30258 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!43789 () Unit!2321)

(declare-fun lt!43813 () Unit!2321)

(assert (=> b!30258 (= lt!43789 lt!43813)))

(assert (=> b!30258 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43814)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43802)))

(assert (=> b!30258 (= lt!43813 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1674 lt!43305) (buf!1104 (_2!1674 lt!43814)) lt!43802))))

(assert (=> b!30258 e!20175))

(declare-fun res!26019 () Bool)

(assert (=> b!30258 (=> (not res!26019) (not e!20175))))

(assert (=> b!30258 (= res!26019 (and (= (size!776 (buf!1104 (_2!1674 lt!43305))) (size!776 (buf!1104 (_2!1674 lt!43814)))) (bvsge lt!43802 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30258 (= lt!43802 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!30258 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30258 (= lt!43784 (reader!0 (_2!1674 lt!43305) (_2!1674 lt!43814)))))

(declare-fun bm!382 () Bool)

(declare-fun c!1999 () Bool)

(assert (=> bm!382 (= call!385 (reader!0 (ite c!1999 (_2!1674 lt!43807) (_2!1674 lt!43305)) (ite c!1999 (_2!1674 lt!43806) (_2!1674 lt!43305))))))

(declare-fun d!8608 () Bool)

(assert (=> d!8608 e!20176))

(declare-fun res!26018 () Bool)

(assert (=> d!8608 (=> (not res!26018) (not e!20176))))

(declare-fun lt!43779 () (_ BitVec 64))

(assert (=> d!8608 (= res!26018 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43814))) (currentByte!2447 (_2!1674 lt!43814)) (currentBit!2442 (_2!1674 lt!43814))) (bvsub lt!43779 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8608 (or (= (bvand lt!43779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43779 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!43816 () (_ BitVec 64))

(assert (=> d!8608 (= lt!43779 (bvadd lt!43816 to!314))))

(assert (=> d!8608 (or (not (= (bvand lt!43816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!43816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!43816 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8608 (= lt!43816 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))))))

(assert (=> d!8608 (= lt!43814 e!20177)))

(assert (=> d!8608 (= c!1999 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!43803 () Unit!2321)

(declare-fun lt!43810 () Unit!2321)

(assert (=> d!8608 (= lt!43803 lt!43810)))

(assert (=> d!8608 (isPrefixOf!0 (_2!1674 lt!43305) (_2!1674 lt!43305))))

(assert (=> d!8608 (= lt!43810 (lemmaIsPrefixRefl!0 (_2!1674 lt!43305)))))

(assert (=> d!8608 (= lt!43804 (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))))))

(assert (=> d!8608 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8608 (= (appendBitsMSBFirstLoop!0 (_2!1674 lt!43305) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!43814)))

(assert (= (and d!8608 c!1999) b!30253))

(assert (= (and d!8608 (not c!1999)) b!30255))

(assert (= (or b!30253 b!30255) bm!382))

(assert (= (and d!8608 res!26018) b!30251))

(assert (= (and b!30251 res!26017) b!30257))

(assert (= (and b!30257 res!26021) b!30256))

(assert (= (and b!30256 res!26020) b!30254))

(assert (= (and b!30254 res!26016) b!30258))

(assert (= (and b!30258 res!26019) b!30252))

(declare-fun m!44073 () Bool)

(assert (=> b!30256 m!44073))

(declare-fun m!44075 () Bool)

(assert (=> b!30252 m!44075))

(declare-fun m!44077 () Bool)

(assert (=> b!30253 m!44077))

(declare-fun m!44079 () Bool)

(assert (=> b!30253 m!44079))

(declare-fun m!44081 () Bool)

(assert (=> b!30253 m!44081))

(declare-fun m!44083 () Bool)

(assert (=> b!30253 m!44083))

(declare-fun m!44085 () Bool)

(assert (=> b!30253 m!44085))

(declare-fun m!44087 () Bool)

(assert (=> b!30253 m!44087))

(declare-fun m!44089 () Bool)

(assert (=> b!30253 m!44089))

(assert (=> b!30253 m!44079))

(declare-fun m!44091 () Bool)

(assert (=> b!30253 m!44091))

(declare-fun m!44093 () Bool)

(assert (=> b!30253 m!44093))

(declare-fun m!44095 () Bool)

(assert (=> b!30253 m!44095))

(declare-fun m!44097 () Bool)

(assert (=> b!30253 m!44097))

(declare-fun m!44099 () Bool)

(assert (=> b!30253 m!44099))

(declare-fun m!44101 () Bool)

(assert (=> b!30253 m!44101))

(declare-fun m!44103 () Bool)

(assert (=> b!30253 m!44103))

(declare-fun m!44105 () Bool)

(assert (=> b!30253 m!44105))

(declare-fun m!44107 () Bool)

(assert (=> b!30253 m!44107))

(declare-fun m!44109 () Bool)

(assert (=> b!30253 m!44109))

(declare-fun m!44111 () Bool)

(assert (=> b!30253 m!44111))

(declare-fun m!44113 () Bool)

(assert (=> b!30253 m!44113))

(declare-fun m!44115 () Bool)

(assert (=> b!30253 m!44115))

(declare-fun m!44117 () Bool)

(assert (=> b!30253 m!44117))

(assert (=> b!30253 m!44103))

(declare-fun m!44119 () Bool)

(assert (=> b!30253 m!44119))

(declare-fun m!44121 () Bool)

(assert (=> b!30253 m!44121))

(declare-fun m!44123 () Bool)

(assert (=> b!30253 m!44123))

(declare-fun m!44125 () Bool)

(assert (=> b!30253 m!44125))

(declare-fun m!44127 () Bool)

(assert (=> b!30253 m!44127))

(declare-fun m!44129 () Bool)

(assert (=> b!30253 m!44129))

(assert (=> b!30253 m!44083))

(declare-fun m!44131 () Bool)

(assert (=> b!30253 m!44131))

(declare-fun m!44133 () Bool)

(assert (=> b!30253 m!44133))

(assert (=> b!30253 m!44121))

(declare-fun m!44135 () Bool)

(assert (=> b!30253 m!44135))

(declare-fun m!44137 () Bool)

(assert (=> b!30253 m!44137))

(assert (=> b!30253 m!43623))

(declare-fun m!44139 () Bool)

(assert (=> d!8608 m!44139))

(assert (=> d!8608 m!43623))

(assert (=> d!8608 m!43859))

(assert (=> d!8608 m!43853))

(declare-fun m!44141 () Bool)

(assert (=> b!30251 m!44141))

(declare-fun m!44143 () Bool)

(assert (=> b!30258 m!44143))

(declare-fun m!44145 () Bool)

(assert (=> b!30258 m!44145))

(declare-fun m!44147 () Bool)

(assert (=> b!30258 m!44147))

(declare-fun m!44149 () Bool)

(assert (=> b!30258 m!44149))

(declare-fun m!44151 () Bool)

(assert (=> b!30258 m!44151))

(declare-fun m!44153 () Bool)

(assert (=> b!30255 m!44153))

(declare-fun m!44155 () Bool)

(assert (=> b!30255 m!44155))

(declare-fun m!44157 () Bool)

(assert (=> bm!382 m!44157))

(assert (=> b!30011 d!8608))

(declare-fun d!8688 () Bool)

(declare-fun res!26022 () Bool)

(declare-fun e!20178 () Bool)

(assert (=> d!8688 (=> (not res!26022) (not e!20178))))

(assert (=> d!8688 (= res!26022 (= (size!776 (buf!1104 thiss!1379)) (size!776 (buf!1104 (_2!1674 lt!43312)))))))

(assert (=> d!8688 (= (isPrefixOf!0 thiss!1379 (_2!1674 lt!43312)) e!20178)))

(declare-fun b!30259 () Bool)

(declare-fun res!26024 () Bool)

(assert (=> b!30259 (=> (not res!26024) (not e!20178))))

(assert (=> b!30259 (= res!26024 (bvsle (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)) (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43312))) (currentByte!2447 (_2!1674 lt!43312)) (currentBit!2442 (_2!1674 lt!43312)))))))

(declare-fun b!30260 () Bool)

(declare-fun e!20179 () Bool)

(assert (=> b!30260 (= e!20178 e!20179)))

(declare-fun res!26023 () Bool)

(assert (=> b!30260 (=> res!26023 e!20179)))

(assert (=> b!30260 (= res!26023 (= (size!776 (buf!1104 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30261 () Bool)

(assert (=> b!30261 (= e!20179 (arrayBitRangesEq!0 (buf!1104 thiss!1379) (buf!1104 (_2!1674 lt!43312)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379))))))

(assert (= (and d!8688 res!26022) b!30259))

(assert (= (and b!30259 res!26024) b!30260))

(assert (= (and b!30260 (not res!26023)) b!30261))

(assert (=> b!30259 m!43687))

(assert (=> b!30259 m!43647))

(assert (=> b!30261 m!43687))

(assert (=> b!30261 m!43687))

(declare-fun m!44159 () Bool)

(assert (=> b!30261 m!44159))

(assert (=> b!30011 d!8688))

(declare-fun d!8690 () Bool)

(declare-fun res!26025 () Bool)

(declare-fun e!20180 () Bool)

(assert (=> d!8690 (=> (not res!26025) (not e!20180))))

(assert (=> d!8690 (= res!26025 (= (size!776 (buf!1104 thiss!1379)) (size!776 (buf!1104 thiss!1379))))))

(assert (=> d!8690 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20180)))

(declare-fun b!30262 () Bool)

(declare-fun res!26027 () Bool)

(assert (=> b!30262 (=> (not res!26027) (not e!20180))))

(assert (=> b!30262 (= res!26027 (bvsle (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)) (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379))))))

(declare-fun b!30263 () Bool)

(declare-fun e!20181 () Bool)

(assert (=> b!30263 (= e!20180 e!20181)))

(declare-fun res!26026 () Bool)

(assert (=> b!30263 (=> res!26026 e!20181)))

(assert (=> b!30263 (= res!26026 (= (size!776 (buf!1104 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30264 () Bool)

(assert (=> b!30264 (= e!20181 (arrayBitRangesEq!0 (buf!1104 thiss!1379) (buf!1104 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379))))))

(assert (= (and d!8690 res!26025) b!30262))

(assert (= (and b!30262 res!26027) b!30263))

(assert (= (and b!30263 (not res!26026)) b!30264))

(assert (=> b!30262 m!43687))

(assert (=> b!30262 m!43687))

(assert (=> b!30264 m!43687))

(assert (=> b!30264 m!43687))

(declare-fun m!44161 () Bool)

(assert (=> b!30264 m!44161))

(assert (=> b!30000 d!8690))

(declare-fun d!8692 () Bool)

(assert (=> d!8692 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!43822 () Unit!2321)

(declare-fun choose!11 (BitStream!1368) Unit!2321)

(assert (=> d!8692 (= lt!43822 (choose!11 thiss!1379))))

(assert (=> d!8692 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!43822)))

(declare-fun bs!2439 () Bool)

(assert (= bs!2439 d!8692))

(assert (=> bs!2439 m!43683))

(declare-fun m!44163 () Bool)

(assert (=> bs!2439 m!44163))

(assert (=> b!30000 d!8692))

(declare-fun d!8694 () Bool)

(declare-fun e!20184 () Bool)

(assert (=> d!8694 e!20184))

(declare-fun res!26032 () Bool)

(assert (=> d!8694 (=> (not res!26032) (not e!20184))))

(declare-fun lt!43840 () (_ BitVec 64))

(declare-fun lt!43838 () (_ BitVec 64))

(declare-fun lt!43837 () (_ BitVec 64))

(assert (=> d!8694 (= res!26032 (= lt!43837 (bvsub lt!43840 lt!43838)))))

(assert (=> d!8694 (or (= (bvand lt!43840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43840 lt!43838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8694 (= lt!43838 (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 thiss!1379))) ((_ sign_extend 32) (currentByte!2447 thiss!1379)) ((_ sign_extend 32) (currentBit!2442 thiss!1379))))))

(declare-fun lt!43839 () (_ BitVec 64))

(declare-fun lt!43835 () (_ BitVec 64))

(assert (=> d!8694 (= lt!43840 (bvmul lt!43839 lt!43835))))

(assert (=> d!8694 (or (= lt!43839 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!43835 (bvsdiv (bvmul lt!43839 lt!43835) lt!43839)))))

(assert (=> d!8694 (= lt!43835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8694 (= lt!43839 ((_ sign_extend 32) (size!776 (buf!1104 thiss!1379))))))

(assert (=> d!8694 (= lt!43837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2447 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2442 thiss!1379))))))

(assert (=> d!8694 (invariant!0 (currentBit!2442 thiss!1379) (currentByte!2447 thiss!1379) (size!776 (buf!1104 thiss!1379)))))

(assert (=> d!8694 (= (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)) lt!43837)))

(declare-fun b!30269 () Bool)

(declare-fun res!26033 () Bool)

(assert (=> b!30269 (=> (not res!26033) (not e!20184))))

(assert (=> b!30269 (= res!26033 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!43837))))

(declare-fun b!30270 () Bool)

(declare-fun lt!43836 () (_ BitVec 64))

(assert (=> b!30270 (= e!20184 (bvsle lt!43837 (bvmul lt!43836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30270 (or (= lt!43836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!43836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!43836)))))

(assert (=> b!30270 (= lt!43836 ((_ sign_extend 32) (size!776 (buf!1104 thiss!1379))))))

(assert (= (and d!8694 res!26032) b!30269))

(assert (= (and b!30269 res!26033) b!30270))

(assert (=> d!8694 m!43789))

(assert (=> d!8694 m!43791))

(assert (=> b!30000 d!8694))

(declare-fun d!8696 () Bool)

(assert (=> d!8696 (= (head!222 (byteArrayBitContentToList!0 (_2!1674 lt!43305) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!500 (byteArrayBitContentToList!0 (_2!1674 lt!43305) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30010 d!8696))

(declare-fun d!8698 () Bool)

(declare-fun c!2002 () Bool)

(assert (=> d!8698 (= c!2002 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20187 () List!385)

(assert (=> d!8698 (= (byteArrayBitContentToList!0 (_2!1674 lt!43305) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20187)))

(declare-fun b!30275 () Bool)

(assert (=> b!30275 (= e!20187 Nil!382)))

(declare-fun b!30276 () Bool)

(assert (=> b!30276 (= e!20187 (Cons!381 (not (= (bvand ((_ sign_extend 24) (select (arr!1239 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1674 lt!43305) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8698 c!2002) b!30275))

(assert (= (and d!8698 (not c!2002)) b!30276))

(assert (=> b!30276 m!43651))

(declare-fun m!44165 () Bool)

(assert (=> b!30276 m!44165))

(declare-fun m!44167 () Bool)

(assert (=> b!30276 m!44167))

(assert (=> b!30010 d!8698))

(declare-fun d!8700 () Bool)

(assert (=> d!8700 (= (head!222 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43305) (_1!1675 lt!43300) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!500 (bitStreamReadBitsIntoList!0 (_2!1674 lt!43305) (_1!1675 lt!43300) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30010 d!8700))

(declare-fun d!8702 () Bool)

(declare-fun e!20189 () Bool)

(assert (=> d!8702 e!20189))

(declare-fun c!2003 () Bool)

(assert (=> d!8702 (= c!2003 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!43851 () List!385)

(declare-fun e!20188 () tuple2!3182)

(assert (=> d!8702 (= lt!43851 (_1!1678 e!20188))))

(declare-fun c!2004 () Bool)

(assert (=> d!8702 (= c!2004 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8702 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8702 (= (bitStreamReadBitsIntoList!0 (_2!1674 lt!43305) (_1!1675 lt!43300) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43851)))

(declare-fun b!30280 () Bool)

(assert (=> b!30280 (= e!20189 (> (length!111 lt!43851) 0))))

(declare-fun b!30278 () Bool)

(declare-fun lt!43849 () tuple2!3184)

(declare-fun lt!43850 () (_ BitVec 64))

(assert (=> b!30278 (= e!20188 (tuple2!3183 (Cons!381 (_1!1679 lt!43849) (bitStreamReadBitsIntoList!0 (_2!1674 lt!43305) (_2!1679 lt!43849) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!43850))) (_2!1679 lt!43849)))))

(assert (=> b!30278 (= lt!43849 (readBit!0 (_1!1675 lt!43300)))))

(assert (=> b!30278 (= lt!43850 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30279 () Bool)

(assert (=> b!30279 (= e!20189 (isEmpty!79 lt!43851))))

(declare-fun b!30277 () Bool)

(assert (=> b!30277 (= e!20188 (tuple2!3183 Nil!382 (_1!1675 lt!43300)))))

(assert (= (and d!8702 c!2004) b!30277))

(assert (= (and d!8702 (not c!2004)) b!30278))

(assert (= (and d!8702 c!2003) b!30279))

(assert (= (and d!8702 (not c!2003)) b!30280))

(declare-fun m!44169 () Bool)

(assert (=> b!30280 m!44169))

(declare-fun m!44171 () Bool)

(assert (=> b!30278 m!44171))

(declare-fun m!44173 () Bool)

(assert (=> b!30278 m!44173))

(declare-fun m!44175 () Bool)

(assert (=> b!30279 m!44175))

(assert (=> b!30010 d!8702))

(declare-fun d!8704 () Bool)

(declare-fun size!778 (List!385) Int)

(assert (=> d!8704 (= (length!111 lt!43297) (size!778 lt!43297))))

(declare-fun bs!2440 () Bool)

(assert (= bs!2440 d!8704))

(declare-fun m!44177 () Bool)

(assert (=> bs!2440 m!44177))

(assert (=> b!29999 d!8704))

(declare-fun d!8706 () Bool)

(assert (=> d!8706 (= (bitAt!0 (buf!1104 (_1!1675 lt!43306)) lt!43301) (not (= (bvand ((_ sign_extend 24) (select (arr!1239 (buf!1104 (_1!1675 lt!43306))) ((_ extract 31 0) (bvsdiv lt!43301 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!43301 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2441 () Bool)

(assert (= bs!2441 d!8706))

(declare-fun m!44179 () Bool)

(assert (=> bs!2441 m!44179))

(declare-fun m!44181 () Bool)

(assert (=> bs!2441 m!44181))

(assert (=> b!29998 d!8706))

(declare-fun d!8708 () Bool)

(assert (=> d!8708 (= (bitAt!0 (buf!1104 (_1!1675 lt!43311)) lt!43301) (not (= (bvand ((_ sign_extend 24) (select (arr!1239 (buf!1104 (_1!1675 lt!43311))) ((_ extract 31 0) (bvsdiv lt!43301 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!43301 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2442 () Bool)

(assert (= bs!2442 d!8708))

(declare-fun m!44183 () Bool)

(assert (=> bs!2442 m!44183))

(assert (=> bs!2442 m!44181))

(assert (=> b!29998 d!8708))

(declare-fun d!8710 () Bool)

(declare-fun e!20192 () Bool)

(assert (=> d!8710 e!20192))

(declare-fun res!26034 () Bool)

(assert (=> d!8710 (=> (not res!26034) (not e!20192))))

(declare-fun lt!43885 () (_ BitVec 64))

(declare-fun lt!43887 () (_ BitVec 64))

(declare-fun lt!43884 () (_ BitVec 64))

(assert (=> d!8710 (= res!26034 (= lt!43884 (bvsub lt!43887 lt!43885)))))

(assert (=> d!8710 (or (= (bvand lt!43887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43887 lt!43885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8710 (= lt!43885 (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305)))))))

(declare-fun lt!43886 () (_ BitVec 64))

(declare-fun lt!43882 () (_ BitVec 64))

(assert (=> d!8710 (= lt!43887 (bvmul lt!43886 lt!43882))))

(assert (=> d!8710 (or (= lt!43886 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!43882 (bvsdiv (bvmul lt!43886 lt!43882) lt!43886)))))

(assert (=> d!8710 (= lt!43882 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8710 (= lt!43886 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))))))

(assert (=> d!8710 (= lt!43884 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305)))))))

(assert (=> d!8710 (invariant!0 (currentBit!2442 (_2!1674 lt!43305)) (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43305))))))

(assert (=> d!8710 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305))) lt!43884)))

(declare-fun b!30285 () Bool)

(declare-fun res!26035 () Bool)

(assert (=> b!30285 (=> (not res!26035) (not e!20192))))

(assert (=> b!30285 (= res!26035 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!43884))))

(declare-fun b!30286 () Bool)

(declare-fun lt!43883 () (_ BitVec 64))

(assert (=> b!30286 (= e!20192 (bvsle lt!43884 (bvmul lt!43883 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30286 (or (= lt!43883 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!43883 #b0000000000000000000000000000000000000000000000000000000000001000) lt!43883)))))

(assert (=> b!30286 (= lt!43883 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))))))

(assert (= (and d!8710 res!26034) b!30285))

(assert (= (and b!30285 res!26035) b!30286))

(declare-fun m!44185 () Bool)

(assert (=> d!8710 m!44185))

(assert (=> d!8710 m!43675))

(assert (=> b!30003 d!8710))

(declare-fun d!8712 () Bool)

(declare-fun e!20193 () Bool)

(assert (=> d!8712 e!20193))

(declare-fun res!26036 () Bool)

(assert (=> d!8712 (=> (not res!26036) (not e!20193))))

(declare-fun lt!43895 () (_ BitVec 64))

(declare-fun lt!43897 () (_ BitVec 64))

(declare-fun lt!43894 () (_ BitVec 64))

(assert (=> d!8712 (= res!26036 (= lt!43894 (bvsub lt!43897 lt!43895)))))

(assert (=> d!8712 (or (= (bvand lt!43897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43897 lt!43895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8712 (= lt!43895 (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43312))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43312)))))))

(declare-fun lt!43896 () (_ BitVec 64))

(declare-fun lt!43892 () (_ BitVec 64))

(assert (=> d!8712 (= lt!43897 (bvmul lt!43896 lt!43892))))

(assert (=> d!8712 (or (= lt!43896 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!43892 (bvsdiv (bvmul lt!43896 lt!43892) lt!43896)))))

(assert (=> d!8712 (= lt!43892 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8712 (= lt!43896 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))))))

(assert (=> d!8712 (= lt!43894 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43312))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43312)))))))

(assert (=> d!8712 (invariant!0 (currentBit!2442 (_2!1674 lt!43312)) (currentByte!2447 (_2!1674 lt!43312)) (size!776 (buf!1104 (_2!1674 lt!43312))))))

(assert (=> d!8712 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43312))) (currentByte!2447 (_2!1674 lt!43312)) (currentBit!2442 (_2!1674 lt!43312))) lt!43894)))

(declare-fun b!30287 () Bool)

(declare-fun res!26037 () Bool)

(assert (=> b!30287 (=> (not res!26037) (not e!20193))))

(assert (=> b!30287 (= res!26037 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!43894))))

(declare-fun b!30288 () Bool)

(declare-fun lt!43893 () (_ BitVec 64))

(assert (=> b!30288 (= e!20193 (bvsle lt!43894 (bvmul lt!43893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30288 (or (= lt!43893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!43893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!43893)))))

(assert (=> b!30288 (= lt!43893 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43312)))))))

(assert (= (and d!8712 res!26036) b!30287))

(assert (= (and b!30287 res!26037) b!30288))

(declare-fun m!44187 () Bool)

(assert (=> d!8712 m!44187))

(assert (=> d!8712 m!43681))

(assert (=> b!30013 d!8712))

(declare-fun d!8714 () Bool)

(declare-fun res!26038 () Bool)

(declare-fun e!20194 () Bool)

(assert (=> d!8714 (=> (not res!26038) (not e!20194))))

(assert (=> d!8714 (= res!26038 (= (size!776 (buf!1104 thiss!1379)) (size!776 (buf!1104 (_2!1674 lt!43305)))))))

(assert (=> d!8714 (= (isPrefixOf!0 thiss!1379 (_2!1674 lt!43305)) e!20194)))

(declare-fun b!30289 () Bool)

(declare-fun res!26040 () Bool)

(assert (=> b!30289 (=> (not res!26040) (not e!20194))))

(assert (=> b!30289 (= res!26040 (bvsle (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)) (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!43305))) (currentByte!2447 (_2!1674 lt!43305)) (currentBit!2442 (_2!1674 lt!43305)))))))

(declare-fun b!30290 () Bool)

(declare-fun e!20195 () Bool)

(assert (=> b!30290 (= e!20194 e!20195)))

(declare-fun res!26039 () Bool)

(assert (=> b!30290 (=> res!26039 e!20195)))

(assert (=> b!30290 (= res!26039 (= (size!776 (buf!1104 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30291 () Bool)

(assert (=> b!30291 (= e!20195 (arrayBitRangesEq!0 (buf!1104 thiss!1379) (buf!1104 (_2!1674 lt!43305)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379))))))

(assert (= (and d!8714 res!26038) b!30289))

(assert (= (and b!30289 res!26040) b!30290))

(assert (= (and b!30290 (not res!26039)) b!30291))

(assert (=> b!30289 m!43687))

(assert (=> b!30289 m!43623))

(assert (=> b!30291 m!43687))

(assert (=> b!30291 m!43687))

(declare-fun m!44189 () Bool)

(assert (=> b!30291 m!44189))

(assert (=> b!30012 d!8714))

(declare-fun d!8716 () Bool)

(assert (=> d!8716 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) lt!43298) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305)))) lt!43298))))

(declare-fun bs!2443 () Bool)

(assert (= bs!2443 d!8716))

(assert (=> bs!2443 m!44185))

(assert (=> b!30012 d!8716))

(declare-fun d!8718 () Bool)

(declare-fun e!20202 () Bool)

(assert (=> d!8718 e!20202))

(declare-fun res!26055 () Bool)

(assert (=> d!8718 (=> (not res!26055) (not e!20202))))

(assert (=> d!8718 (= res!26055 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43946 () Unit!2321)

(declare-fun choose!27 (BitStream!1368 BitStream!1368 (_ BitVec 64) (_ BitVec 64)) Unit!2321)

(assert (=> d!8718 (= lt!43946 (choose!27 thiss!1379 (_2!1674 lt!43305) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8718 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1674 lt!43305) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43946)))

(declare-fun b!30306 () Bool)

(assert (=> b!30306 (= e!20202 (validate_offset_bits!1 ((_ sign_extend 32) (size!776 (buf!1104 (_2!1674 lt!43305)))) ((_ sign_extend 32) (currentByte!2447 (_2!1674 lt!43305))) ((_ sign_extend 32) (currentBit!2442 (_2!1674 lt!43305))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8718 res!26055) b!30306))

(declare-fun m!44191 () Bool)

(assert (=> d!8718 m!44191))

(declare-fun m!44193 () Bool)

(assert (=> b!30306 m!44193))

(assert (=> b!30012 d!8718))

(declare-fun b!30376 () Bool)

(declare-fun e!20237 () Bool)

(declare-datatypes ((tuple2!3188 0))(
  ( (tuple2!3189 (_1!1681 BitStream!1368) (_2!1681 Bool)) )
))
(declare-fun lt!44145 () tuple2!3188)

(declare-fun lt!44146 () tuple2!3174)

(assert (=> b!30376 (= e!20237 (= (bitIndex!0 (size!776 (buf!1104 (_1!1681 lt!44145))) (currentByte!2447 (_1!1681 lt!44145)) (currentBit!2442 (_1!1681 lt!44145))) (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!44146))) (currentByte!2447 (_2!1674 lt!44146)) (currentBit!2442 (_2!1674 lt!44146)))))))

(declare-fun b!30377 () Bool)

(declare-fun res!26100 () Bool)

(declare-fun e!20235 () Bool)

(assert (=> b!30377 (=> (not res!26100) (not e!20235))))

(assert (=> b!30377 (= res!26100 (isPrefixOf!0 thiss!1379 (_2!1674 lt!44146)))))

(declare-fun d!8720 () Bool)

(assert (=> d!8720 e!20235))

(declare-fun res!26098 () Bool)

(assert (=> d!8720 (=> (not res!26098) (not e!20235))))

(assert (=> d!8720 (= res!26098 (= (size!776 (buf!1104 (_2!1674 lt!44146))) (size!776 (buf!1104 thiss!1379))))))

(declare-fun lt!44143 () (_ BitVec 8))

(declare-fun lt!44144 () array!1780)

(assert (=> d!8720 (= lt!44143 (select (arr!1239 lt!44144) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8720 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!776 lt!44144)))))

(assert (=> d!8720 (= lt!44144 (array!1781 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!44138 () tuple2!3174)

(assert (=> d!8720 (= lt!44146 (tuple2!3175 (_1!1674 lt!44138) (_2!1674 lt!44138)))))

(declare-fun lt!44141 () tuple2!3174)

(assert (=> d!8720 (= lt!44138 lt!44141)))

(declare-fun e!20236 () Bool)

(assert (=> d!8720 e!20236))

(declare-fun res!26096 () Bool)

(assert (=> d!8720 (=> (not res!26096) (not e!20236))))

(assert (=> d!8720 (= res!26096 (= (size!776 (buf!1104 thiss!1379)) (size!776 (buf!1104 (_2!1674 lt!44141)))))))

(declare-fun lt!44136 () Bool)

(declare-fun appendBit!0 (BitStream!1368 Bool) tuple2!3174)

(assert (=> d!8720 (= lt!44141 (appendBit!0 thiss!1379 lt!44136))))

(assert (=> d!8720 (= lt!44136 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1239 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8720 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8720 (= (appendBitFromByte!0 thiss!1379 (select (arr!1239 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!44146)))

(declare-fun b!30378 () Bool)

(declare-fun res!26102 () Bool)

(assert (=> b!30378 (=> (not res!26102) (not e!20235))))

(declare-fun lt!44135 () (_ BitVec 64))

(declare-fun lt!44140 () (_ BitVec 64))

(assert (=> b!30378 (= res!26102 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!44146))) (currentByte!2447 (_2!1674 lt!44146)) (currentBit!2442 (_2!1674 lt!44146))) (bvadd lt!44140 lt!44135)))))

(assert (=> b!30378 (or (not (= (bvand lt!44140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44135 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!44140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!44140 lt!44135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30378 (= lt!44135 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!30378 (= lt!44140 (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)))))

(declare-fun b!30379 () Bool)

(declare-fun e!20234 () Bool)

(declare-fun lt!44137 () tuple2!3188)

(assert (=> b!30379 (= e!20234 (= (bitIndex!0 (size!776 (buf!1104 (_1!1681 lt!44137))) (currentByte!2447 (_1!1681 lt!44137)) (currentBit!2442 (_1!1681 lt!44137))) (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!44141))) (currentByte!2447 (_2!1674 lt!44141)) (currentBit!2442 (_2!1674 lt!44141)))))))

(declare-fun b!30380 () Bool)

(assert (=> b!30380 (= e!20236 e!20234)))

(declare-fun res!26097 () Bool)

(assert (=> b!30380 (=> (not res!26097) (not e!20234))))

(assert (=> b!30380 (= res!26097 (and (= (_2!1681 lt!44137) lt!44136) (= (_1!1681 lt!44137) (_2!1674 lt!44141))))))

(declare-fun readBitPure!0 (BitStream!1368) tuple2!3188)

(declare-fun readerFrom!0 (BitStream!1368 (_ BitVec 32) (_ BitVec 32)) BitStream!1368)

(assert (=> b!30380 (= lt!44137 (readBitPure!0 (readerFrom!0 (_2!1674 lt!44141) (currentBit!2442 thiss!1379) (currentByte!2447 thiss!1379))))))

(declare-fun b!30381 () Bool)

(declare-fun res!26101 () Bool)

(assert (=> b!30381 (=> (not res!26101) (not e!20236))))

(assert (=> b!30381 (= res!26101 (= (bitIndex!0 (size!776 (buf!1104 (_2!1674 lt!44141))) (currentByte!2447 (_2!1674 lt!44141)) (currentBit!2442 (_2!1674 lt!44141))) (bvadd (bitIndex!0 (size!776 (buf!1104 thiss!1379)) (currentByte!2447 thiss!1379) (currentBit!2442 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30382 () Bool)

(assert (=> b!30382 (= e!20235 e!20237)))

(declare-fun res!26099 () Bool)

(assert (=> b!30382 (=> (not res!26099) (not e!20237))))

(assert (=> b!30382 (= res!26099 (and (= (_2!1681 lt!44145) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1239 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!44143)) #b00000000000000000000000000000000))) (= (_1!1681 lt!44145) (_2!1674 lt!44146))))))

(declare-fun lt!44142 () tuple2!3186)

(declare-fun lt!44139 () BitStream!1368)

(assert (=> b!30382 (= lt!44142 (readBits!0 lt!44139 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!30382 (= lt!44145 (readBitPure!0 lt!44139))))

(assert (=> b!30382 (= lt!44139 (readerFrom!0 (_2!1674 lt!44146) (currentBit!2442 thiss!1379) (currentByte!2447 thiss!1379)))))

(declare-fun b!30383 () Bool)

(declare-fun res!26103 () Bool)

(assert (=> b!30383 (=> (not res!26103) (not e!20236))))

(assert (=> b!30383 (= res!26103 (isPrefixOf!0 thiss!1379 (_2!1674 lt!44141)))))

(assert (= (and d!8720 res!26096) b!30381))

(assert (= (and b!30381 res!26101) b!30383))

(assert (= (and b!30383 res!26103) b!30380))

(assert (= (and b!30380 res!26097) b!30379))

(assert (= (and d!8720 res!26098) b!30378))

(assert (= (and b!30378 res!26102) b!30377))

(assert (= (and b!30377 res!26100) b!30382))

(assert (= (and b!30382 res!26099) b!30376))

(declare-fun m!44389 () Bool)

(assert (=> b!30379 m!44389))

(declare-fun m!44391 () Bool)

(assert (=> b!30379 m!44391))

(declare-fun m!44393 () Bool)

(assert (=> d!8720 m!44393))

(declare-fun m!44395 () Bool)

(assert (=> d!8720 m!44395))

(assert (=> d!8720 m!44165))

(declare-fun m!44397 () Bool)

(assert (=> b!30380 m!44397))

(assert (=> b!30380 m!44397))

(declare-fun m!44399 () Bool)

(assert (=> b!30380 m!44399))

(assert (=> b!30381 m!44391))

(assert (=> b!30381 m!43687))

(declare-fun m!44401 () Bool)

(assert (=> b!30382 m!44401))

(declare-fun m!44403 () Bool)

(assert (=> b!30382 m!44403))

(declare-fun m!44405 () Bool)

(assert (=> b!30382 m!44405))

(declare-fun m!44407 () Bool)

(assert (=> b!30376 m!44407))

(declare-fun m!44409 () Bool)

(assert (=> b!30376 m!44409))

(declare-fun m!44411 () Bool)

(assert (=> b!30383 m!44411))

(declare-fun m!44413 () Bool)

(assert (=> b!30377 m!44413))

(assert (=> b!30378 m!44409))

(assert (=> b!30378 m!43687))

(assert (=> b!30012 d!8720))

(declare-fun d!8754 () Bool)

(assert (=> d!8754 (= (invariant!0 (currentBit!2442 (_2!1674 lt!43305)) (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43312)))) (and (bvsge (currentBit!2442 (_2!1674 lt!43305)) #b00000000000000000000000000000000) (bvslt (currentBit!2442 (_2!1674 lt!43305)) #b00000000000000000000000000001000) (bvsge (currentByte!2447 (_2!1674 lt!43305)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43312)))) (and (= (currentBit!2442 (_2!1674 lt!43305)) #b00000000000000000000000000000000) (= (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43312))))))))))

(assert (=> b!30001 d!8754))

(declare-fun d!8756 () Bool)

(assert (=> d!8756 (= (invariant!0 (currentBit!2442 (_2!1674 lt!43312)) (currentByte!2447 (_2!1674 lt!43312)) (size!776 (buf!1104 (_2!1674 lt!43312)))) (and (bvsge (currentBit!2442 (_2!1674 lt!43312)) #b00000000000000000000000000000000) (bvslt (currentBit!2442 (_2!1674 lt!43312)) #b00000000000000000000000000001000) (bvsge (currentByte!2447 (_2!1674 lt!43312)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2447 (_2!1674 lt!43312)) (size!776 (buf!1104 (_2!1674 lt!43312)))) (and (= (currentBit!2442 (_2!1674 lt!43312)) #b00000000000000000000000000000000) (= (currentByte!2447 (_2!1674 lt!43312)) (size!776 (buf!1104 (_2!1674 lt!43312))))))))))

(assert (=> b!30005 d!8756))

(declare-fun d!8758 () Bool)

(assert (=> d!8758 (= (invariant!0 (currentBit!2442 (_2!1674 lt!43305)) (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43305)))) (and (bvsge (currentBit!2442 (_2!1674 lt!43305)) #b00000000000000000000000000000000) (bvslt (currentBit!2442 (_2!1674 lt!43305)) #b00000000000000000000000000001000) (bvsge (currentByte!2447 (_2!1674 lt!43305)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43305)))) (and (= (currentBit!2442 (_2!1674 lt!43305)) #b00000000000000000000000000000000) (= (currentByte!2447 (_2!1674 lt!43305)) (size!776 (buf!1104 (_2!1674 lt!43305))))))))))

(assert (=> b!30004 d!8758))

(check-sat (not d!8712) (not b!30264) (not d!8596) (not b!30096) (not b!30255) (not b!30116) (not b!30289) (not b!30251) (not b!30377) (not b!30280) (not b!30115) (not b!30380) (not b!30276) (not d!8718) (not b!30306) (not b!30256) (not d!8606) (not d!8594) (not bm!382) (not b!30253) (not d!8710) (not b!30105) (not b!30082) (not d!8692) (not d!8598) (not d!8720) (not d!8574) (not b!30118) (not d!8584) (not b!30081) (not b!30070) (not d!8600) (not b!30259) (not d!8580) (not d!8576) (not b!30376) (not b!30261) (not d!8608) (not b!30381) (not b!30278) (not d!8588) (not b!30095) (not b!30104) (not b!30378) (not b!30100) (not d!8694) (not b!30113) (not b!30083) (not b!30279) (not d!8704) (not b!30099) (not b!30252) (not d!8716) (not b!30262) (not b!30382) (not d!8590) (not b!30102) (not b!30101) (not b!30097) (not b!30379) (not b!30084) (not b!30103) (not b!30117) (not b!30258) (not b!30383) (not d!8602) (not b!30291) (not b!30119) (not d!8582))
