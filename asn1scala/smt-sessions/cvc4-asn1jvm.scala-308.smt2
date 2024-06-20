; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6138 () Bool)

(assert start!6138)

(declare-fun b!28942 () Bool)

(declare-fun e!19448 () Bool)

(declare-fun e!19447 () Bool)

(assert (=> b!28942 (= e!19448 e!19447)))

(declare-fun res!25053 () Bool)

(assert (=> b!28942 (=> res!25053 e!19447)))

(declare-fun lt!41035 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!41039 () (_ BitVec 64))

(assert (=> b!28942 (= res!25053 (not (= lt!41035 (bvsub (bvadd lt!41039 to!314) i!635))))))

(declare-datatypes ((array!1764 0))(
  ( (array!1765 (arr!1228 (Array (_ BitVec 32) (_ BitVec 8))) (size!765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1358 0))(
  ( (BitStream!1359 (buf!1093 array!1764) (currentByte!2424 (_ BitVec 32)) (currentBit!2419 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2251 0))(
  ( (Unit!2252) )
))
(declare-datatypes ((tuple2!3106 0))(
  ( (tuple2!3107 (_1!1640 Unit!2251) (_2!1640 BitStream!1358)) )
))
(declare-fun lt!41033 () tuple2!3106)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28942 (= lt!41035 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41033))) (currentByte!2424 (_2!1640 lt!41033)) (currentBit!2419 (_2!1640 lt!41033))))))

(declare-fun b!28943 () Bool)

(declare-fun e!19445 () Bool)

(declare-fun e!19443 () Bool)

(assert (=> b!28943 (= e!19445 (not e!19443))))

(declare-fun res!25064 () Bool)

(assert (=> b!28943 (=> res!25064 e!19443)))

(assert (=> b!28943 (= res!25064 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1358)

(declare-fun isPrefixOf!0 (BitStream!1358 BitStream!1358) Bool)

(assert (=> b!28943 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!41040 () Unit!2251)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1358) Unit!2251)

(assert (=> b!28943 (= lt!41040 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28943 (= lt!41039 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(declare-fun b!28944 () Bool)

(declare-fun e!19446 () Bool)

(assert (=> b!28944 (= e!19443 e!19446)))

(declare-fun res!25059 () Bool)

(assert (=> b!28944 (=> res!25059 e!19446)))

(declare-fun lt!41030 () tuple2!3106)

(assert (=> b!28944 (= res!25059 (not (isPrefixOf!0 thiss!1379 (_2!1640 lt!41030))))))

(declare-fun lt!41036 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28944 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41036)))

(assert (=> b!28944 (= lt!41036 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41038 () Unit!2251)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1358 BitStream!1358 (_ BitVec 64) (_ BitVec 64)) Unit!2251)

(assert (=> b!28944 (= lt!41038 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1640 lt!41030) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1764)

(declare-fun appendBitFromByte!0 (BitStream!1358 (_ BitVec 8) (_ BitVec 32)) tuple2!3106)

(assert (=> b!28944 (= lt!41030 (appendBitFromByte!0 thiss!1379 (select (arr!1228 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!19452 () Bool)

(declare-fun b!28945 () Bool)

(assert (=> b!28945 (= e!19452 (= lt!41035 (bvsub (bvsub (bvadd (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28946 () Bool)

(declare-fun e!19450 () Bool)

(declare-fun e!19444 () Bool)

(assert (=> b!28946 (= e!19450 e!19444)))

(declare-fun res!25051 () Bool)

(assert (=> b!28946 (=> res!25051 e!19444)))

(assert (=> b!28946 (= res!25051 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3108 0))(
  ( (tuple2!3109 (_1!1641 BitStream!1358) (_2!1641 BitStream!1358)) )
))
(declare-fun lt!41043 () tuple2!3108)

(declare-datatypes ((List!380 0))(
  ( (Nil!377) (Cons!376 (h!495 Bool) (t!1130 List!380)) )
))
(declare-fun lt!41031 () List!380)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1358 BitStream!1358 (_ BitVec 64)) List!380)

(assert (=> b!28946 (= lt!41031 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_1!1641 lt!41043) lt!41036))))

(declare-fun lt!41044 () tuple2!3108)

(declare-fun lt!41034 () List!380)

(assert (=> b!28946 (= lt!41034 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_1!1641 lt!41044) (bvsub to!314 i!635)))))

(assert (=> b!28946 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41036)))

(declare-fun lt!41032 () Unit!2251)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1358 array!1764 (_ BitVec 64)) Unit!2251)

(assert (=> b!28946 (= lt!41032 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1640 lt!41030) (buf!1093 (_2!1640 lt!41033)) lt!41036))))

(declare-fun reader!0 (BitStream!1358 BitStream!1358) tuple2!3108)

(assert (=> b!28946 (= lt!41043 (reader!0 (_2!1640 lt!41030) (_2!1640 lt!41033)))))

(assert (=> b!28946 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!41042 () Unit!2251)

(assert (=> b!28946 (= lt!41042 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1093 (_2!1640 lt!41033)) (bvsub to!314 i!635)))))

(assert (=> b!28946 (= lt!41044 (reader!0 thiss!1379 (_2!1640 lt!41033)))))

(declare-fun b!28947 () Bool)

(assert (=> b!28947 (= e!19446 e!19448)))

(declare-fun res!25057 () Bool)

(assert (=> b!28947 (=> res!25057 e!19448)))

(assert (=> b!28947 (= res!25057 (not (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41033))))))

(assert (=> b!28947 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41033))))

(declare-fun lt!41041 () Unit!2251)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1358 BitStream!1358 BitStream!1358) Unit!2251)

(assert (=> b!28947 (= lt!41041 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1640 lt!41030) (_2!1640 lt!41033)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1358 array!1764 (_ BitVec 64) (_ BitVec 64)) tuple2!3106)

(assert (=> b!28947 (= lt!41033 (appendBitsMSBFirstLoop!0 (_2!1640 lt!41030) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19449 () Bool)

(assert (=> b!28947 e!19449))

(declare-fun res!25065 () Bool)

(assert (=> b!28947 (=> (not res!25065) (not e!19449))))

(assert (=> b!28947 (= res!25065 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41027 () Unit!2251)

(assert (=> b!28947 (= lt!41027 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1093 (_2!1640 lt!41030)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41028 () tuple2!3108)

(assert (=> b!28947 (= lt!41028 (reader!0 thiss!1379 (_2!1640 lt!41030)))))

(declare-fun b!28948 () Bool)

(declare-fun res!25063 () Bool)

(assert (=> b!28948 (=> res!25063 e!19444)))

(declare-fun length!106 (List!380) Int)

(assert (=> b!28948 (= res!25063 (<= (length!106 lt!41034) 0))))

(declare-fun b!28949 () Bool)

(declare-fun e!19442 () Bool)

(declare-fun array_inv!732 (array!1764) Bool)

(assert (=> b!28949 (= e!19442 (array_inv!732 (buf!1093 thiss!1379)))))

(declare-fun b!28950 () Bool)

(declare-fun lt!41029 () List!380)

(assert (=> b!28950 (= e!19444 (or (not (= lt!41029 lt!41031)) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41039) (bvslt lt!41039 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!765 (buf!1093 (_1!1641 lt!41044)))))))))))

(assert (=> b!28950 (= lt!41031 lt!41029)))

(declare-fun tail!97 (List!380) List!380)

(assert (=> b!28950 (= lt!41029 (tail!97 lt!41034))))

(declare-fun lt!41037 () Unit!2251)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1358 BitStream!1358 BitStream!1358 BitStream!1358 (_ BitVec 64) List!380) Unit!2251)

(assert (=> b!28950 (= lt!41037 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1640 lt!41033) (_2!1640 lt!41033) (_1!1641 lt!41044) (_1!1641 lt!41043) (bvsub to!314 i!635) lt!41034))))

(declare-fun res!25062 () Bool)

(assert (=> start!6138 (=> (not res!25062) (not e!19445))))

(assert (=> start!6138 (= res!25062 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!765 srcBuffer!2))))))))

(assert (=> start!6138 e!19445))

(assert (=> start!6138 true))

(assert (=> start!6138 (array_inv!732 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1358) Bool)

(assert (=> start!6138 (and (inv!12 thiss!1379) e!19442)))

(declare-fun b!28951 () Bool)

(assert (=> b!28951 (= e!19447 e!19450)))

(declare-fun res!25061 () Bool)

(assert (=> b!28951 (=> res!25061 e!19450)))

(assert (=> b!28951 (= res!25061 (not (= (size!765 (buf!1093 (_2!1640 lt!41030))) (size!765 (buf!1093 (_2!1640 lt!41033))))))))

(assert (=> b!28951 e!19452))

(declare-fun res!25054 () Bool)

(assert (=> b!28951 (=> (not res!25054) (not e!19452))))

(assert (=> b!28951 (= res!25054 (= (size!765 (buf!1093 (_2!1640 lt!41033))) (size!765 (buf!1093 thiss!1379))))))

(declare-fun b!28952 () Bool)

(declare-fun res!25052 () Bool)

(assert (=> b!28952 (=> res!25052 e!19447)))

(assert (=> b!28952 (= res!25052 (not (= (size!765 (buf!1093 thiss!1379)) (size!765 (buf!1093 (_2!1640 lt!41033))))))))

(declare-fun b!28953 () Bool)

(declare-fun res!25056 () Bool)

(assert (=> b!28953 (=> res!25056 e!19450)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28953 (= res!25056 (not (invariant!0 (currentBit!2419 (_2!1640 lt!41030)) (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41033))))))))

(declare-fun b!28954 () Bool)

(declare-fun res!25060 () Bool)

(assert (=> b!28954 (=> res!25060 e!19450)))

(assert (=> b!28954 (= res!25060 (not (invariant!0 (currentBit!2419 (_2!1640 lt!41030)) (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41030))))))))

(declare-fun b!28955 () Bool)

(declare-fun head!217 (List!380) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1358 array!1764 (_ BitVec 64) (_ BitVec 64)) List!380)

(assert (=> b!28955 (= e!19449 (= (head!217 (byteArrayBitContentToList!0 (_2!1640 lt!41030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!217 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41030) (_1!1641 lt!41028) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28956 () Bool)

(declare-fun res!25055 () Bool)

(assert (=> b!28956 (=> (not res!25055) (not e!19445))))

(assert (=> b!28956 (= res!25055 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 thiss!1379))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28957 () Bool)

(declare-fun res!25058 () Bool)

(assert (=> b!28957 (=> res!25058 e!19447)))

(assert (=> b!28957 (= res!25058 (not (invariant!0 (currentBit!2419 (_2!1640 lt!41033)) (currentByte!2424 (_2!1640 lt!41033)) (size!765 (buf!1093 (_2!1640 lt!41033))))))))

(assert (= (and start!6138 res!25062) b!28956))

(assert (= (and b!28956 res!25055) b!28943))

(assert (= (and b!28943 (not res!25064)) b!28944))

(assert (= (and b!28944 (not res!25059)) b!28947))

(assert (= (and b!28947 res!25065) b!28955))

(assert (= (and b!28947 (not res!25057)) b!28942))

(assert (= (and b!28942 (not res!25053)) b!28957))

(assert (= (and b!28957 (not res!25058)) b!28952))

(assert (= (and b!28952 (not res!25052)) b!28951))

(assert (= (and b!28951 res!25054) b!28945))

(assert (= (and b!28951 (not res!25061)) b!28954))

(assert (= (and b!28954 (not res!25060)) b!28953))

(assert (= (and b!28953 (not res!25056)) b!28946))

(assert (= (and b!28946 (not res!25051)) b!28948))

(assert (= (and b!28948 (not res!25063)) b!28950))

(assert (= start!6138 b!28949))

(declare-fun m!41691 () Bool)

(assert (=> b!28955 m!41691))

(assert (=> b!28955 m!41691))

(declare-fun m!41693 () Bool)

(assert (=> b!28955 m!41693))

(declare-fun m!41695 () Bool)

(assert (=> b!28955 m!41695))

(assert (=> b!28955 m!41695))

(declare-fun m!41697 () Bool)

(assert (=> b!28955 m!41697))

(declare-fun m!41699 () Bool)

(assert (=> b!28945 m!41699))

(declare-fun m!41701 () Bool)

(assert (=> b!28956 m!41701))

(declare-fun m!41703 () Bool)

(assert (=> b!28950 m!41703))

(declare-fun m!41705 () Bool)

(assert (=> b!28950 m!41705))

(declare-fun m!41707 () Bool)

(assert (=> b!28948 m!41707))

(declare-fun m!41709 () Bool)

(assert (=> b!28947 m!41709))

(declare-fun m!41711 () Bool)

(assert (=> b!28947 m!41711))

(declare-fun m!41713 () Bool)

(assert (=> b!28947 m!41713))

(declare-fun m!41715 () Bool)

(assert (=> b!28947 m!41715))

(declare-fun m!41717 () Bool)

(assert (=> b!28947 m!41717))

(declare-fun m!41719 () Bool)

(assert (=> b!28947 m!41719))

(declare-fun m!41721 () Bool)

(assert (=> b!28947 m!41721))

(declare-fun m!41723 () Bool)

(assert (=> b!28943 m!41723))

(declare-fun m!41725 () Bool)

(assert (=> b!28943 m!41725))

(declare-fun m!41727 () Bool)

(assert (=> b!28943 m!41727))

(declare-fun m!41729 () Bool)

(assert (=> b!28953 m!41729))

(declare-fun m!41731 () Bool)

(assert (=> start!6138 m!41731))

(declare-fun m!41733 () Bool)

(assert (=> start!6138 m!41733))

(declare-fun m!41735 () Bool)

(assert (=> b!28957 m!41735))

(declare-fun m!41737 () Bool)

(assert (=> b!28946 m!41737))

(declare-fun m!41739 () Bool)

(assert (=> b!28946 m!41739))

(declare-fun m!41741 () Bool)

(assert (=> b!28946 m!41741))

(declare-fun m!41743 () Bool)

(assert (=> b!28946 m!41743))

(declare-fun m!41745 () Bool)

(assert (=> b!28946 m!41745))

(declare-fun m!41747 () Bool)

(assert (=> b!28946 m!41747))

(declare-fun m!41749 () Bool)

(assert (=> b!28946 m!41749))

(declare-fun m!41751 () Bool)

(assert (=> b!28946 m!41751))

(declare-fun m!41753 () Bool)

(assert (=> b!28944 m!41753))

(declare-fun m!41755 () Bool)

(assert (=> b!28944 m!41755))

(declare-fun m!41757 () Bool)

(assert (=> b!28944 m!41757))

(declare-fun m!41759 () Bool)

(assert (=> b!28944 m!41759))

(assert (=> b!28944 m!41755))

(declare-fun m!41761 () Bool)

(assert (=> b!28944 m!41761))

(declare-fun m!41763 () Bool)

(assert (=> b!28942 m!41763))

(declare-fun m!41765 () Bool)

(assert (=> b!28954 m!41765))

(declare-fun m!41767 () Bool)

(assert (=> b!28949 m!41767))

(push 1)

(assert (not b!28944))

(assert (not b!28947))

(assert (not b!28953))

(assert (not b!28950))

(assert (not b!28946))

(assert (not b!28943))

(assert (not b!28954))

(assert (not b!28955))

(assert (not b!28942))

(assert (not start!6138))

(assert (not b!28949))

(assert (not b!28956))

(assert (not b!28957))

(assert (not b!28945))

(assert (not b!28948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8156 () Bool)

(assert (=> d!8156 (= (invariant!0 (currentBit!2419 (_2!1640 lt!41033)) (currentByte!2424 (_2!1640 lt!41033)) (size!765 (buf!1093 (_2!1640 lt!41033)))) (and (bvsge (currentBit!2419 (_2!1640 lt!41033)) #b00000000000000000000000000000000) (bvslt (currentBit!2419 (_2!1640 lt!41033)) #b00000000000000000000000000001000) (bvsge (currentByte!2424 (_2!1640 lt!41033)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2424 (_2!1640 lt!41033)) (size!765 (buf!1093 (_2!1640 lt!41033)))) (and (= (currentBit!2419 (_2!1640 lt!41033)) #b00000000000000000000000000000000) (= (currentByte!2424 (_2!1640 lt!41033)) (size!765 (buf!1093 (_2!1640 lt!41033))))))))))

(assert (=> b!28957 d!8156))

(declare-fun b!29048 () Bool)

(declare-datatypes ((tuple2!3118 0))(
  ( (tuple2!3119 (_1!1646 List!380) (_2!1646 BitStream!1358)) )
))
(declare-fun e!19498 () tuple2!3118)

(declare-fun lt!41201 () (_ BitVec 64))

(declare-datatypes ((tuple2!3120 0))(
  ( (tuple2!3121 (_1!1647 Bool) (_2!1647 BitStream!1358)) )
))
(declare-fun lt!41200 () tuple2!3120)

(assert (=> b!29048 (= e!19498 (tuple2!3119 (Cons!376 (_1!1647 lt!41200) (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_2!1647 lt!41200) (bvsub lt!41036 lt!41201))) (_2!1647 lt!41200)))))

(declare-fun readBit!0 (BitStream!1358) tuple2!3120)

(assert (=> b!29048 (= lt!41200 (readBit!0 (_1!1641 lt!41043)))))

(assert (=> b!29048 (= lt!41201 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!8158 () Bool)

(declare-fun e!19499 () Bool)

(assert (=> d!8158 e!19499))

(declare-fun c!1868 () Bool)

(assert (=> d!8158 (= c!1868 (= lt!41036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!41202 () List!380)

(assert (=> d!8158 (= lt!41202 (_1!1646 e!19498))))

(declare-fun c!1869 () Bool)

(assert (=> d!8158 (= c!1869 (= lt!41036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8158 (bvsge lt!41036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8158 (= (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_1!1641 lt!41043) lt!41036) lt!41202)))

(declare-fun b!29047 () Bool)

(assert (=> b!29047 (= e!19498 (tuple2!3119 Nil!377 (_1!1641 lt!41043)))))

(declare-fun b!29050 () Bool)

(assert (=> b!29050 (= e!19499 (> (length!106 lt!41202) 0))))

(declare-fun b!29049 () Bool)

(declare-fun isEmpty!74 (List!380) Bool)

(assert (=> b!29049 (= e!19499 (isEmpty!74 lt!41202))))

(assert (= (and d!8158 c!1869) b!29047))

(assert (= (and d!8158 (not c!1869)) b!29048))

(assert (= (and d!8158 c!1868) b!29049))

(assert (= (and d!8158 (not c!1868)) b!29050))

(declare-fun m!41899 () Bool)

(assert (=> b!29048 m!41899))

(declare-fun m!41901 () Bool)

(assert (=> b!29048 m!41901))

(declare-fun m!41903 () Bool)

(assert (=> b!29050 m!41903))

(declare-fun m!41905 () Bool)

(assert (=> b!29049 m!41905))

(assert (=> b!28946 d!8158))

(declare-fun d!8162 () Bool)

(assert (=> d!8162 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!41205 () Unit!2251)

(declare-fun choose!9 (BitStream!1358 array!1764 (_ BitVec 64) BitStream!1358) Unit!2251)

(assert (=> d!8162 (= lt!41205 (choose!9 thiss!1379 (buf!1093 (_2!1640 lt!41033)) (bvsub to!314 i!635) (BitStream!1359 (buf!1093 (_2!1640 lt!41033)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379))))))

(assert (=> d!8162 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1093 (_2!1640 lt!41033)) (bvsub to!314 i!635)) lt!41205)))

(declare-fun bs!2337 () Bool)

(assert (= bs!2337 d!8162))

(assert (=> bs!2337 m!41737))

(declare-fun m!41907 () Bool)

(assert (=> bs!2337 m!41907))

(assert (=> b!28946 d!8162))

(declare-fun lt!41207 () (_ BitVec 64))

(declare-fun b!29052 () Bool)

(declare-fun lt!41206 () tuple2!3120)

(declare-fun e!19500 () tuple2!3118)

(assert (=> b!29052 (= e!19500 (tuple2!3119 (Cons!376 (_1!1647 lt!41206) (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_2!1647 lt!41206) (bvsub (bvsub to!314 i!635) lt!41207))) (_2!1647 lt!41206)))))

(assert (=> b!29052 (= lt!41206 (readBit!0 (_1!1641 lt!41044)))))

(assert (=> b!29052 (= lt!41207 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!8164 () Bool)

(declare-fun e!19501 () Bool)

(assert (=> d!8164 e!19501))

(declare-fun c!1870 () Bool)

(assert (=> d!8164 (= c!1870 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!41208 () List!380)

(assert (=> d!8164 (= lt!41208 (_1!1646 e!19500))))

(declare-fun c!1871 () Bool)

(assert (=> d!8164 (= c!1871 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8164 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8164 (= (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_1!1641 lt!41044) (bvsub to!314 i!635)) lt!41208)))

(declare-fun b!29051 () Bool)

(assert (=> b!29051 (= e!19500 (tuple2!3119 Nil!377 (_1!1641 lt!41044)))))

(declare-fun b!29054 () Bool)

(assert (=> b!29054 (= e!19501 (> (length!106 lt!41208) 0))))

(declare-fun b!29053 () Bool)

(assert (=> b!29053 (= e!19501 (isEmpty!74 lt!41208))))

(assert (= (and d!8164 c!1871) b!29051))

(assert (= (and d!8164 (not c!1871)) b!29052))

(assert (= (and d!8164 c!1870) b!29053))

(assert (= (and d!8164 (not c!1870)) b!29054))

(declare-fun m!41909 () Bool)

(assert (=> b!29052 m!41909))

(declare-fun m!41911 () Bool)

(assert (=> b!29052 m!41911))

(declare-fun m!41913 () Bool)

(assert (=> b!29054 m!41913))

(declare-fun m!41915 () Bool)

(assert (=> b!29053 m!41915))

(assert (=> b!28946 d!8164))

(declare-fun d!8166 () Bool)

(assert (=> d!8166 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41036)))

(declare-fun lt!41209 () Unit!2251)

(assert (=> d!8166 (= lt!41209 (choose!9 (_2!1640 lt!41030) (buf!1093 (_2!1640 lt!41033)) lt!41036 (BitStream!1359 (buf!1093 (_2!1640 lt!41033)) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030)))))))

(assert (=> d!8166 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1640 lt!41030) (buf!1093 (_2!1640 lt!41033)) lt!41036) lt!41209)))

(declare-fun bs!2338 () Bool)

(assert (= bs!2338 d!8166))

(assert (=> bs!2338 m!41751))

(declare-fun m!41917 () Bool)

(assert (=> bs!2338 m!41917))

(assert (=> b!28946 d!8166))

(declare-fun b!29075 () Bool)

(declare-fun res!25111 () Bool)

(declare-fun e!19510 () Bool)

(assert (=> b!29075 (=> (not res!25111) (not e!19510))))

(declare-fun lt!41309 () tuple2!3108)

(assert (=> b!29075 (= res!25111 (isPrefixOf!0 (_2!1641 lt!41309) (_2!1640 lt!41033)))))

(declare-fun d!8168 () Bool)

(assert (=> d!8168 e!19510))

(declare-fun res!25113 () Bool)

(assert (=> d!8168 (=> (not res!25113) (not e!19510))))

(assert (=> d!8168 (= res!25113 (isPrefixOf!0 (_1!1641 lt!41309) (_2!1641 lt!41309)))))

(declare-fun lt!41291 () BitStream!1358)

(assert (=> d!8168 (= lt!41309 (tuple2!3109 lt!41291 (_2!1640 lt!41033)))))

(declare-fun lt!41301 () Unit!2251)

(declare-fun lt!41297 () Unit!2251)

(assert (=> d!8168 (= lt!41301 lt!41297)))

(assert (=> d!8168 (isPrefixOf!0 lt!41291 (_2!1640 lt!41033))))

(assert (=> d!8168 (= lt!41297 (lemmaIsPrefixTransitive!0 lt!41291 (_2!1640 lt!41033) (_2!1640 lt!41033)))))

(declare-fun lt!41294 () Unit!2251)

(declare-fun lt!41300 () Unit!2251)

(assert (=> d!8168 (= lt!41294 lt!41300)))

(assert (=> d!8168 (isPrefixOf!0 lt!41291 (_2!1640 lt!41033))))

(assert (=> d!8168 (= lt!41300 (lemmaIsPrefixTransitive!0 lt!41291 thiss!1379 (_2!1640 lt!41033)))))

(declare-fun lt!41308 () Unit!2251)

(declare-fun e!19511 () Unit!2251)

(assert (=> d!8168 (= lt!41308 e!19511)))

(declare-fun c!1876 () Bool)

(assert (=> d!8168 (= c!1876 (not (= (size!765 (buf!1093 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!41293 () Unit!2251)

(declare-fun lt!41296 () Unit!2251)

(assert (=> d!8168 (= lt!41293 lt!41296)))

(assert (=> d!8168 (isPrefixOf!0 (_2!1640 lt!41033) (_2!1640 lt!41033))))

(assert (=> d!8168 (= lt!41296 (lemmaIsPrefixRefl!0 (_2!1640 lt!41033)))))

(declare-fun lt!41298 () Unit!2251)

(declare-fun lt!41299 () Unit!2251)

(assert (=> d!8168 (= lt!41298 lt!41299)))

(assert (=> d!8168 (= lt!41299 (lemmaIsPrefixRefl!0 (_2!1640 lt!41033)))))

(declare-fun lt!41307 () Unit!2251)

(declare-fun lt!41303 () Unit!2251)

(assert (=> d!8168 (= lt!41307 lt!41303)))

(assert (=> d!8168 (isPrefixOf!0 lt!41291 lt!41291)))

(assert (=> d!8168 (= lt!41303 (lemmaIsPrefixRefl!0 lt!41291))))

(declare-fun lt!41292 () Unit!2251)

(declare-fun lt!41302 () Unit!2251)

(assert (=> d!8168 (= lt!41292 lt!41302)))

(assert (=> d!8168 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8168 (= lt!41302 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8168 (= lt!41291 (BitStream!1359 (buf!1093 (_2!1640 lt!41033)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(assert (=> d!8168 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41033))))

(assert (=> d!8168 (= (reader!0 thiss!1379 (_2!1640 lt!41033)) lt!41309)))

(declare-fun b!29076 () Bool)

(declare-fun res!25112 () Bool)

(assert (=> b!29076 (=> (not res!25112) (not e!19510))))

(assert (=> b!29076 (= res!25112 (isPrefixOf!0 (_1!1641 lt!41309) thiss!1379))))

(declare-fun b!29077 () Bool)

(declare-fun lt!41305 () Unit!2251)

(assert (=> b!29077 (= e!19511 lt!41305)))

(declare-fun lt!41295 () (_ BitVec 64))

(assert (=> b!29077 (= lt!41295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41290 () (_ BitVec 64))

(assert (=> b!29077 (= lt!41290 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1764 array!1764 (_ BitVec 64) (_ BitVec 64)) Unit!2251)

(assert (=> b!29077 (= lt!41305 (arrayBitRangesEqSymmetric!0 (buf!1093 thiss!1379) (buf!1093 (_2!1640 lt!41033)) lt!41295 lt!41290))))

(declare-fun arrayBitRangesEq!0 (array!1764 array!1764 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29077 (arrayBitRangesEq!0 (buf!1093 (_2!1640 lt!41033)) (buf!1093 thiss!1379) lt!41295 lt!41290)))

(declare-fun b!29078 () Bool)

(declare-fun Unit!2263 () Unit!2251)

(assert (=> b!29078 (= e!19511 Unit!2263)))

(declare-fun lt!41304 () (_ BitVec 64))

(declare-fun lt!41306 () (_ BitVec 64))

(declare-fun b!29079 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1358 (_ BitVec 64)) BitStream!1358)

(assert (=> b!29079 (= e!19510 (= (_1!1641 lt!41309) (withMovedBitIndex!0 (_2!1641 lt!41309) (bvsub lt!41304 lt!41306))))))

(assert (=> b!29079 (or (= (bvand lt!41304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41304 lt!41306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29079 (= lt!41306 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41033))) (currentByte!2424 (_2!1640 lt!41033)) (currentBit!2419 (_2!1640 lt!41033))))))

(assert (=> b!29079 (= lt!41304 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(assert (= (and d!8168 c!1876) b!29077))

(assert (= (and d!8168 (not c!1876)) b!29078))

(assert (= (and d!8168 res!25113) b!29076))

(assert (= (and b!29076 res!25112) b!29075))

(assert (= (and b!29075 res!25111) b!29079))

(declare-fun m!41919 () Bool)

(assert (=> b!29076 m!41919))

(declare-fun m!41921 () Bool)

(assert (=> b!29075 m!41921))

(declare-fun m!41923 () Bool)

(assert (=> b!29079 m!41923))

(assert (=> b!29079 m!41763))

(assert (=> b!29079 m!41727))

(assert (=> b!29077 m!41727))

(declare-fun m!41925 () Bool)

(assert (=> b!29077 m!41925))

(declare-fun m!41927 () Bool)

(assert (=> b!29077 m!41927))

(declare-fun m!41929 () Bool)

(assert (=> d!8168 m!41929))

(declare-fun m!41931 () Bool)

(assert (=> d!8168 m!41931))

(assert (=> d!8168 m!41725))

(assert (=> d!8168 m!41715))

(declare-fun m!41933 () Bool)

(assert (=> d!8168 m!41933))

(declare-fun m!41935 () Bool)

(assert (=> d!8168 m!41935))

(assert (=> d!8168 m!41723))

(declare-fun m!41937 () Bool)

(assert (=> d!8168 m!41937))

(declare-fun m!41939 () Bool)

(assert (=> d!8168 m!41939))

(declare-fun m!41941 () Bool)

(assert (=> d!8168 m!41941))

(declare-fun m!41945 () Bool)

(assert (=> d!8168 m!41945))

(assert (=> b!28946 d!8168))

(declare-fun d!8170 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41036) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030)))) lt!41036))))

(declare-fun bs!2339 () Bool)

(assert (= bs!2339 d!8170))

(declare-fun m!41971 () Bool)

(assert (=> bs!2339 m!41971))

(assert (=> b!28946 d!8170))

(declare-fun b!29089 () Bool)

(declare-fun res!25117 () Bool)

(declare-fun e!19516 () Bool)

(assert (=> b!29089 (=> (not res!25117) (not e!19516))))

(declare-fun lt!41352 () tuple2!3108)

(assert (=> b!29089 (= res!25117 (isPrefixOf!0 (_2!1641 lt!41352) (_2!1640 lt!41033)))))

(declare-fun d!8174 () Bool)

(assert (=> d!8174 e!19516))

(declare-fun res!25119 () Bool)

(assert (=> d!8174 (=> (not res!25119) (not e!19516))))

(assert (=> d!8174 (= res!25119 (isPrefixOf!0 (_1!1641 lt!41352) (_2!1641 lt!41352)))))

(declare-fun lt!41334 () BitStream!1358)

(assert (=> d!8174 (= lt!41352 (tuple2!3109 lt!41334 (_2!1640 lt!41033)))))

(declare-fun lt!41344 () Unit!2251)

(declare-fun lt!41340 () Unit!2251)

(assert (=> d!8174 (= lt!41344 lt!41340)))

(assert (=> d!8174 (isPrefixOf!0 lt!41334 (_2!1640 lt!41033))))

(assert (=> d!8174 (= lt!41340 (lemmaIsPrefixTransitive!0 lt!41334 (_2!1640 lt!41033) (_2!1640 lt!41033)))))

(declare-fun lt!41337 () Unit!2251)

(declare-fun lt!41343 () Unit!2251)

(assert (=> d!8174 (= lt!41337 lt!41343)))

(assert (=> d!8174 (isPrefixOf!0 lt!41334 (_2!1640 lt!41033))))

(assert (=> d!8174 (= lt!41343 (lemmaIsPrefixTransitive!0 lt!41334 (_2!1640 lt!41030) (_2!1640 lt!41033)))))

(declare-fun lt!41351 () Unit!2251)

(declare-fun e!19517 () Unit!2251)

(assert (=> d!8174 (= lt!41351 e!19517)))

(declare-fun c!1880 () Bool)

(assert (=> d!8174 (= c!1880 (not (= (size!765 (buf!1093 (_2!1640 lt!41030))) #b00000000000000000000000000000000)))))

(declare-fun lt!41336 () Unit!2251)

(declare-fun lt!41339 () Unit!2251)

(assert (=> d!8174 (= lt!41336 lt!41339)))

(assert (=> d!8174 (isPrefixOf!0 (_2!1640 lt!41033) (_2!1640 lt!41033))))

(assert (=> d!8174 (= lt!41339 (lemmaIsPrefixRefl!0 (_2!1640 lt!41033)))))

(declare-fun lt!41341 () Unit!2251)

(declare-fun lt!41342 () Unit!2251)

(assert (=> d!8174 (= lt!41341 lt!41342)))

(assert (=> d!8174 (= lt!41342 (lemmaIsPrefixRefl!0 (_2!1640 lt!41033)))))

(declare-fun lt!41350 () Unit!2251)

(declare-fun lt!41346 () Unit!2251)

(assert (=> d!8174 (= lt!41350 lt!41346)))

(assert (=> d!8174 (isPrefixOf!0 lt!41334 lt!41334)))

(assert (=> d!8174 (= lt!41346 (lemmaIsPrefixRefl!0 lt!41334))))

(declare-fun lt!41335 () Unit!2251)

(declare-fun lt!41345 () Unit!2251)

(assert (=> d!8174 (= lt!41335 lt!41345)))

(assert (=> d!8174 (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41030))))

(assert (=> d!8174 (= lt!41345 (lemmaIsPrefixRefl!0 (_2!1640 lt!41030)))))

(assert (=> d!8174 (= lt!41334 (BitStream!1359 (buf!1093 (_2!1640 lt!41033)) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))))))

(assert (=> d!8174 (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41033))))

(assert (=> d!8174 (= (reader!0 (_2!1640 lt!41030) (_2!1640 lt!41033)) lt!41352)))

(declare-fun b!29090 () Bool)

(declare-fun res!25118 () Bool)

(assert (=> b!29090 (=> (not res!25118) (not e!19516))))

(assert (=> b!29090 (= res!25118 (isPrefixOf!0 (_1!1641 lt!41352) (_2!1640 lt!41030)))))

(declare-fun b!29091 () Bool)

(declare-fun lt!41348 () Unit!2251)

(assert (=> b!29091 (= e!19517 lt!41348)))

(declare-fun lt!41338 () (_ BitVec 64))

(assert (=> b!29091 (= lt!41338 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41333 () (_ BitVec 64))

(assert (=> b!29091 (= lt!41333 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))))))

(assert (=> b!29091 (= lt!41348 (arrayBitRangesEqSymmetric!0 (buf!1093 (_2!1640 lt!41030)) (buf!1093 (_2!1640 lt!41033)) lt!41338 lt!41333))))

(assert (=> b!29091 (arrayBitRangesEq!0 (buf!1093 (_2!1640 lt!41033)) (buf!1093 (_2!1640 lt!41030)) lt!41338 lt!41333)))

(declare-fun b!29092 () Bool)

(declare-fun Unit!2264 () Unit!2251)

(assert (=> b!29092 (= e!19517 Unit!2264)))

(declare-fun b!29093 () Bool)

(declare-fun lt!41349 () (_ BitVec 64))

(declare-fun lt!41347 () (_ BitVec 64))

(assert (=> b!29093 (= e!19516 (= (_1!1641 lt!41352) (withMovedBitIndex!0 (_2!1641 lt!41352) (bvsub lt!41347 lt!41349))))))

(assert (=> b!29093 (or (= (bvand lt!41347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41347 lt!41349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29093 (= lt!41349 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41033))) (currentByte!2424 (_2!1640 lt!41033)) (currentBit!2419 (_2!1640 lt!41033))))))

(assert (=> b!29093 (= lt!41347 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))))))

(assert (= (and d!8174 c!1880) b!29091))

(assert (= (and d!8174 (not c!1880)) b!29092))

(assert (= (and d!8174 res!25119) b!29090))

(assert (= (and b!29090 res!25118) b!29089))

(assert (= (and b!29089 res!25117) b!29093))

(declare-fun m!41981 () Bool)

(assert (=> b!29090 m!41981))

(declare-fun m!41983 () Bool)

(assert (=> b!29089 m!41983))

(declare-fun m!41985 () Bool)

(assert (=> b!29093 m!41985))

(assert (=> b!29093 m!41763))

(assert (=> b!29093 m!41699))

(assert (=> b!29091 m!41699))

(declare-fun m!41987 () Bool)

(assert (=> b!29091 m!41987))

(declare-fun m!41989 () Bool)

(assert (=> b!29091 m!41989))

(assert (=> d!8174 m!41929))

(assert (=> d!8174 m!41931))

(declare-fun m!41991 () Bool)

(assert (=> d!8174 m!41991))

(assert (=> d!8174 m!41713))

(declare-fun m!41993 () Bool)

(assert (=> d!8174 m!41993))

(declare-fun m!41995 () Bool)

(assert (=> d!8174 m!41995))

(declare-fun m!41997 () Bool)

(assert (=> d!8174 m!41997))

(declare-fun m!41999 () Bool)

(assert (=> d!8174 m!41999))

(declare-fun m!42001 () Bool)

(assert (=> d!8174 m!42001))

(declare-fun m!42003 () Bool)

(assert (=> d!8174 m!42003))

(declare-fun m!42005 () Bool)

(assert (=> d!8174 m!42005))

(assert (=> b!28946 d!8174))

(declare-fun d!8178 () Bool)

(assert (=> d!8178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2340 () Bool)

(assert (= bs!2340 d!8178))

(declare-fun m!42023 () Bool)

(assert (=> bs!2340 m!42023))

(assert (=> b!28946 d!8178))

(declare-fun d!8180 () Bool)

(assert (=> d!8180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 thiss!1379))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 thiss!1379))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2341 () Bool)

(assert (= bs!2341 d!8180))

(declare-fun m!42033 () Bool)

(assert (=> bs!2341 m!42033))

(assert (=> b!28956 d!8180))

(declare-fun d!8182 () Bool)

(declare-fun e!19526 () Bool)

(assert (=> d!8182 e!19526))

(declare-fun res!25133 () Bool)

(assert (=> d!8182 (=> (not res!25133) (not e!19526))))

(declare-fun lt!41391 () (_ BitVec 64))

(declare-fun lt!41392 () (_ BitVec 64))

(declare-fun lt!41389 () (_ BitVec 64))

(assert (=> d!8182 (= res!25133 (= lt!41392 (bvsub lt!41391 lt!41389)))))

(assert (=> d!8182 (or (= (bvand lt!41391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41391 lt!41389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8182 (= lt!41389 (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030)))))))

(declare-fun lt!41390 () (_ BitVec 64))

(declare-fun lt!41394 () (_ BitVec 64))

(assert (=> d!8182 (= lt!41391 (bvmul lt!41390 lt!41394))))

(assert (=> d!8182 (or (= lt!41390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41394 (bvsdiv (bvmul lt!41390 lt!41394) lt!41390)))))

(assert (=> d!8182 (= lt!41394 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8182 (= lt!41390 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))))))

(assert (=> d!8182 (= lt!41392 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030)))))))

(assert (=> d!8182 (invariant!0 (currentBit!2419 (_2!1640 lt!41030)) (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41030))))))

(assert (=> d!8182 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))) lt!41392)))

(declare-fun b!29109 () Bool)

(declare-fun res!25134 () Bool)

(assert (=> b!29109 (=> (not res!25134) (not e!19526))))

(assert (=> b!29109 (= res!25134 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41392))))

(declare-fun b!29110 () Bool)

(declare-fun lt!41393 () (_ BitVec 64))

(assert (=> b!29110 (= e!19526 (bvsle lt!41392 (bvmul lt!41393 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29110 (or (= lt!41393 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41393 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41393)))))

(assert (=> b!29110 (= lt!41393 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))))))

(assert (= (and d!8182 res!25133) b!29109))

(assert (= (and b!29109 res!25134) b!29110))

(declare-fun m!42045 () Bool)

(assert (=> d!8182 m!42045))

(assert (=> d!8182 m!41765))

(assert (=> b!28945 d!8182))

(declare-fun d!8194 () Bool)

(assert (=> d!8194 (= (array_inv!732 srcBuffer!2) (bvsge (size!765 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6138 d!8194))

(declare-fun d!8196 () Bool)

(assert (=> d!8196 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2419 thiss!1379) (currentByte!2424 thiss!1379) (size!765 (buf!1093 thiss!1379))))))

(declare-fun bs!2346 () Bool)

(assert (= bs!2346 d!8196))

(declare-fun m!42049 () Bool)

(assert (=> bs!2346 m!42049))

(assert (=> start!6138 d!8196))

(declare-fun d!8200 () Bool)

(assert (=> d!8200 (= (head!217 (byteArrayBitContentToList!0 (_2!1640 lt!41030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!495 (byteArrayBitContentToList!0 (_2!1640 lt!41030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28955 d!8200))

(declare-fun d!8202 () Bool)

(declare-fun c!1884 () Bool)

(assert (=> d!8202 (= c!1884 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19531 () List!380)

(assert (=> d!8202 (= (byteArrayBitContentToList!0 (_2!1640 lt!41030) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19531)))

(declare-fun b!29118 () Bool)

(assert (=> b!29118 (= e!19531 Nil!377)))

(declare-fun b!29119 () Bool)

(assert (=> b!29119 (= e!19531 (Cons!376 (not (= (bvand ((_ sign_extend 24) (select (arr!1228 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1640 lt!41030) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8202 c!1884) b!29118))

(assert (= (and d!8202 (not c!1884)) b!29119))

(assert (=> b!29119 m!41755))

(declare-fun m!42053 () Bool)

(assert (=> b!29119 m!42053))

(declare-fun m!42055 () Bool)

(assert (=> b!29119 m!42055))

(assert (=> b!28955 d!8202))

(declare-fun d!8206 () Bool)

(assert (=> d!8206 (= (head!217 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41030) (_1!1641 lt!41028) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!495 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41030) (_1!1641 lt!41028) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28955 d!8206))

(declare-fun lt!41399 () (_ BitVec 64))

(declare-fun b!29121 () Bool)

(declare-fun e!19532 () tuple2!3118)

(declare-fun lt!41398 () tuple2!3120)

(assert (=> b!29121 (= e!19532 (tuple2!3119 (Cons!376 (_1!1647 lt!41398) (bitStreamReadBitsIntoList!0 (_2!1640 lt!41030) (_2!1647 lt!41398) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!41399))) (_2!1647 lt!41398)))))

(assert (=> b!29121 (= lt!41398 (readBit!0 (_1!1641 lt!41028)))))

(assert (=> b!29121 (= lt!41399 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!8208 () Bool)

(declare-fun e!19533 () Bool)

(assert (=> d!8208 e!19533))

(declare-fun c!1885 () Bool)

(assert (=> d!8208 (= c!1885 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!41400 () List!380)

(assert (=> d!8208 (= lt!41400 (_1!1646 e!19532))))

(declare-fun c!1886 () Bool)

(assert (=> d!8208 (= c!1886 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8208 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8208 (= (bitStreamReadBitsIntoList!0 (_2!1640 lt!41030) (_1!1641 lt!41028) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41400)))

(declare-fun b!29120 () Bool)

(assert (=> b!29120 (= e!19532 (tuple2!3119 Nil!377 (_1!1641 lt!41028)))))

(declare-fun b!29123 () Bool)

(assert (=> b!29123 (= e!19533 (> (length!106 lt!41400) 0))))

(declare-fun b!29122 () Bool)

(assert (=> b!29122 (= e!19533 (isEmpty!74 lt!41400))))

(assert (= (and d!8208 c!1886) b!29120))

(assert (= (and d!8208 (not c!1886)) b!29121))

(assert (= (and d!8208 c!1885) b!29122))

(assert (= (and d!8208 (not c!1885)) b!29123))

(declare-fun m!42057 () Bool)

(assert (=> b!29121 m!42057))

(declare-fun m!42059 () Bool)

(assert (=> b!29121 m!42059))

(declare-fun m!42061 () Bool)

(assert (=> b!29123 m!42061))

(declare-fun m!42063 () Bool)

(assert (=> b!29122 m!42063))

(assert (=> b!28955 d!8208))

(declare-fun d!8210 () Bool)

(declare-fun res!25144 () Bool)

(declare-fun e!19538 () Bool)

(assert (=> d!8210 (=> (not res!25144) (not e!19538))))

(assert (=> d!8210 (= res!25144 (= (size!765 (buf!1093 thiss!1379)) (size!765 (buf!1093 (_2!1640 lt!41030)))))))

(assert (=> d!8210 (= (isPrefixOf!0 thiss!1379 (_2!1640 lt!41030)) e!19538)))

(declare-fun b!29130 () Bool)

(declare-fun res!25145 () Bool)

(assert (=> b!29130 (=> (not res!25145) (not e!19538))))

(assert (=> b!29130 (= res!25145 (bvsle (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)) (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030)))))))

(declare-fun b!29131 () Bool)

(declare-fun e!19539 () Bool)

(assert (=> b!29131 (= e!19538 e!19539)))

(declare-fun res!25146 () Bool)

(assert (=> b!29131 (=> res!25146 e!19539)))

(assert (=> b!29131 (= res!25146 (= (size!765 (buf!1093 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29132 () Bool)

(assert (=> b!29132 (= e!19539 (arrayBitRangesEq!0 (buf!1093 thiss!1379) (buf!1093 (_2!1640 lt!41030)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379))))))

(assert (= (and d!8210 res!25144) b!29130))

(assert (= (and b!29130 res!25145) b!29131))

(assert (= (and b!29131 (not res!25146)) b!29132))

(assert (=> b!29130 m!41727))

(assert (=> b!29130 m!41699))

(assert (=> b!29132 m!41727))

(assert (=> b!29132 m!41727))

(declare-fun m!42065 () Bool)

(assert (=> b!29132 m!42065))

(assert (=> b!28944 d!8210))

(declare-fun d!8212 () Bool)

(assert (=> d!8212 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41036) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030)))) lt!41036))))

(declare-fun bs!2349 () Bool)

(assert (= bs!2349 d!8212))

(assert (=> bs!2349 m!42045))

(assert (=> b!28944 d!8212))

(declare-fun d!8214 () Bool)

(declare-fun e!19545 () Bool)

(assert (=> d!8214 e!19545))

(declare-fun res!25155 () Bool)

(assert (=> d!8214 (=> (not res!25155) (not e!19545))))

(assert (=> d!8214 (= res!25155 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!41421 () Unit!2251)

(declare-fun choose!27 (BitStream!1358 BitStream!1358 (_ BitVec 64) (_ BitVec 64)) Unit!2251)

(assert (=> d!8214 (= lt!41421 (choose!27 thiss!1379 (_2!1640 lt!41030) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8214 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8214 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1640 lt!41030) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41421)))

(declare-fun b!29141 () Bool)

(assert (=> b!29141 (= e!19545 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8214 res!25155) b!29141))

(declare-fun m!42071 () Bool)

(assert (=> d!8214 m!42071))

(declare-fun m!42073 () Bool)

(assert (=> b!29141 m!42073))

(assert (=> b!28944 d!8214))

(declare-fun b!29176 () Bool)

(declare-fun e!19564 () Bool)

(declare-fun e!19565 () Bool)

(assert (=> b!29176 (= e!19564 e!19565)))

(declare-fun res!25184 () Bool)

(assert (=> b!29176 (=> (not res!25184) (not e!19565))))

(declare-fun lt!41478 () Bool)

(declare-fun lt!41471 () tuple2!3106)

(declare-datatypes ((tuple2!3126 0))(
  ( (tuple2!3127 (_1!1650 BitStream!1358) (_2!1650 Bool)) )
))
(declare-fun lt!41472 () tuple2!3126)

(assert (=> b!29176 (= res!25184 (and (= (_2!1650 lt!41472) lt!41478) (= (_1!1650 lt!41472) (_2!1640 lt!41471))))))

(declare-fun readBitPure!0 (BitStream!1358) tuple2!3126)

(declare-fun readerFrom!0 (BitStream!1358 (_ BitVec 32) (_ BitVec 32)) BitStream!1358)

(assert (=> b!29176 (= lt!41472 (readBitPure!0 (readerFrom!0 (_2!1640 lt!41471) (currentBit!2419 thiss!1379) (currentByte!2424 thiss!1379))))))

(declare-fun b!29177 () Bool)

(declare-fun res!25182 () Bool)

(assert (=> b!29177 (=> (not res!25182) (not e!19564))))

(assert (=> b!29177 (= res!25182 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41471))) (currentByte!2424 (_2!1640 lt!41471)) (currentBit!2419 (_2!1640 lt!41471))) (bvadd (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29179 () Bool)

(declare-fun e!19567 () Bool)

(declare-fun lt!41476 () tuple2!3126)

(declare-fun lt!41482 () tuple2!3106)

(assert (=> b!29179 (= e!19567 (= (bitIndex!0 (size!765 (buf!1093 (_1!1650 lt!41476))) (currentByte!2424 (_1!1650 lt!41476)) (currentBit!2419 (_1!1650 lt!41476))) (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41482))) (currentByte!2424 (_2!1640 lt!41482)) (currentBit!2419 (_2!1640 lt!41482)))))))

(declare-fun b!29180 () Bool)

(declare-fun res!25183 () Bool)

(declare-fun e!19566 () Bool)

(assert (=> b!29180 (=> (not res!25183) (not e!19566))))

(assert (=> b!29180 (= res!25183 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41482)))))

(declare-fun b!29181 () Bool)

(assert (=> b!29181 (= e!19565 (= (bitIndex!0 (size!765 (buf!1093 (_1!1650 lt!41472))) (currentByte!2424 (_1!1650 lt!41472)) (currentBit!2419 (_1!1650 lt!41472))) (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41471))) (currentByte!2424 (_2!1640 lt!41471)) (currentBit!2419 (_2!1640 lt!41471)))))))

(declare-fun b!29178 () Bool)

(assert (=> b!29178 (= e!19566 e!19567)))

(declare-fun res!25179 () Bool)

(assert (=> b!29178 (=> (not res!25179) (not e!19567))))

(declare-fun lt!41480 () (_ BitVec 8))

(assert (=> b!29178 (= res!25179 (and (= (_2!1650 lt!41476) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1228 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!41480)) #b00000000000000000000000000000000))) (= (_1!1650 lt!41476) (_2!1640 lt!41482))))))

(declare-datatypes ((tuple2!3128 0))(
  ( (tuple2!3129 (_1!1651 array!1764) (_2!1651 BitStream!1358)) )
))
(declare-fun lt!41475 () tuple2!3128)

(declare-fun lt!41473 () BitStream!1358)

(declare-fun readBits!0 (BitStream!1358 (_ BitVec 64)) tuple2!3128)

(assert (=> b!29178 (= lt!41475 (readBits!0 lt!41473 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29178 (= lt!41476 (readBitPure!0 lt!41473))))

(assert (=> b!29178 (= lt!41473 (readerFrom!0 (_2!1640 lt!41482) (currentBit!2419 thiss!1379) (currentByte!2424 thiss!1379)))))

(declare-fun d!8220 () Bool)

(assert (=> d!8220 e!19566))

(declare-fun res!25181 () Bool)

(assert (=> d!8220 (=> (not res!25181) (not e!19566))))

(assert (=> d!8220 (= res!25181 (= (size!765 (buf!1093 (_2!1640 lt!41482))) (size!765 (buf!1093 thiss!1379))))))

(declare-fun lt!41481 () array!1764)

(assert (=> d!8220 (= lt!41480 (select (arr!1228 lt!41481) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8220 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!765 lt!41481)))))

(assert (=> d!8220 (= lt!41481 (array!1765 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!41474 () tuple2!3106)

(assert (=> d!8220 (= lt!41482 (tuple2!3107 (_1!1640 lt!41474) (_2!1640 lt!41474)))))

(assert (=> d!8220 (= lt!41474 lt!41471)))

(assert (=> d!8220 e!19564))

(declare-fun res!25180 () Bool)

(assert (=> d!8220 (=> (not res!25180) (not e!19564))))

(assert (=> d!8220 (= res!25180 (= (size!765 (buf!1093 thiss!1379)) (size!765 (buf!1093 (_2!1640 lt!41471)))))))

(declare-fun appendBit!0 (BitStream!1358 Bool) tuple2!3106)

(assert (=> d!8220 (= lt!41471 (appendBit!0 thiss!1379 lt!41478))))

(assert (=> d!8220 (= lt!41478 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1228 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8220 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8220 (= (appendBitFromByte!0 thiss!1379 (select (arr!1228 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!41482)))

(declare-fun b!29182 () Bool)

(declare-fun res!25186 () Bool)

(assert (=> b!29182 (=> (not res!25186) (not e!19566))))

(declare-fun lt!41479 () (_ BitVec 64))

(declare-fun lt!41477 () (_ BitVec 64))

(assert (=> b!29182 (= res!25186 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41482))) (currentByte!2424 (_2!1640 lt!41482)) (currentBit!2419 (_2!1640 lt!41482))) (bvadd lt!41479 lt!41477)))))

(assert (=> b!29182 (or (not (= (bvand lt!41479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41477 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!41479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!41479 lt!41477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29182 (= lt!41477 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!29182 (= lt!41479 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(declare-fun b!29183 () Bool)

(declare-fun res!25185 () Bool)

(assert (=> b!29183 (=> (not res!25185) (not e!19564))))

(assert (=> b!29183 (= res!25185 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41471)))))

(assert (= (and d!8220 res!25180) b!29177))

(assert (= (and b!29177 res!25182) b!29183))

(assert (= (and b!29183 res!25185) b!29176))

(assert (= (and b!29176 res!25184) b!29181))

(assert (= (and d!8220 res!25181) b!29182))

(assert (= (and b!29182 res!25186) b!29180))

(assert (= (and b!29180 res!25183) b!29178))

(assert (= (and b!29178 res!25179) b!29179))

(declare-fun m!42103 () Bool)

(assert (=> b!29180 m!42103))

(declare-fun m!42105 () Bool)

(assert (=> b!29179 m!42105))

(declare-fun m!42107 () Bool)

(assert (=> b!29179 m!42107))

(declare-fun m!42109 () Bool)

(assert (=> d!8220 m!42109))

(declare-fun m!42111 () Bool)

(assert (=> d!8220 m!42111))

(assert (=> d!8220 m!42053))

(declare-fun m!42113 () Bool)

(assert (=> b!29176 m!42113))

(assert (=> b!29176 m!42113))

(declare-fun m!42115 () Bool)

(assert (=> b!29176 m!42115))

(declare-fun m!42117 () Bool)

(assert (=> b!29181 m!42117))

(declare-fun m!42119 () Bool)

(assert (=> b!29181 m!42119))

(declare-fun m!42121 () Bool)

(assert (=> b!29183 m!42121))

(assert (=> b!29177 m!42119))

(assert (=> b!29177 m!41727))

(assert (=> b!29182 m!42107))

(assert (=> b!29182 m!41727))

(declare-fun m!42123 () Bool)

(assert (=> b!29178 m!42123))

(declare-fun m!42125 () Bool)

(assert (=> b!29178 m!42125))

(declare-fun m!42127 () Bool)

(assert (=> b!29178 m!42127))

(assert (=> b!28944 d!8220))

(declare-fun d!8252 () Bool)

(assert (=> d!8252 (= (invariant!0 (currentBit!2419 (_2!1640 lt!41030)) (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41030)))) (and (bvsge (currentBit!2419 (_2!1640 lt!41030)) #b00000000000000000000000000000000) (bvslt (currentBit!2419 (_2!1640 lt!41030)) #b00000000000000000000000000001000) (bvsge (currentByte!2424 (_2!1640 lt!41030)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41030)))) (and (= (currentBit!2419 (_2!1640 lt!41030)) #b00000000000000000000000000000000) (= (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41030))))))))))

(assert (=> b!28954 d!8252))

(declare-fun d!8254 () Bool)

(declare-fun res!25187 () Bool)

(declare-fun e!19568 () Bool)

(assert (=> d!8254 (=> (not res!25187) (not e!19568))))

(assert (=> d!8254 (= res!25187 (= (size!765 (buf!1093 thiss!1379)) (size!765 (buf!1093 thiss!1379))))))

(assert (=> d!8254 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19568)))

(declare-fun b!29184 () Bool)

(declare-fun res!25188 () Bool)

(assert (=> b!29184 (=> (not res!25188) (not e!19568))))

(assert (=> b!29184 (= res!25188 (bvsle (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)) (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379))))))

(declare-fun b!29185 () Bool)

(declare-fun e!19569 () Bool)

(assert (=> b!29185 (= e!19568 e!19569)))

(declare-fun res!25189 () Bool)

(assert (=> b!29185 (=> res!25189 e!19569)))

(assert (=> b!29185 (= res!25189 (= (size!765 (buf!1093 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29186 () Bool)

(assert (=> b!29186 (= e!19569 (arrayBitRangesEq!0 (buf!1093 thiss!1379) (buf!1093 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379))))))

(assert (= (and d!8254 res!25187) b!29184))

(assert (= (and b!29184 res!25188) b!29185))

(assert (= (and b!29185 (not res!25189)) b!29186))

(assert (=> b!29184 m!41727))

(assert (=> b!29184 m!41727))

(assert (=> b!29186 m!41727))

(assert (=> b!29186 m!41727))

(declare-fun m!42129 () Bool)

(assert (=> b!29186 m!42129))

(assert (=> b!28943 d!8254))

(declare-fun d!8256 () Bool)

(assert (=> d!8256 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!41485 () Unit!2251)

(declare-fun choose!11 (BitStream!1358) Unit!2251)

(assert (=> d!8256 (= lt!41485 (choose!11 thiss!1379))))

(assert (=> d!8256 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!41485)))

(declare-fun bs!2357 () Bool)

(assert (= bs!2357 d!8256))

(assert (=> bs!2357 m!41723))

(declare-fun m!42131 () Bool)

(assert (=> bs!2357 m!42131))

(assert (=> b!28943 d!8256))

(declare-fun d!8258 () Bool)

(declare-fun e!19570 () Bool)

(assert (=> d!8258 e!19570))

(declare-fun res!25190 () Bool)

(assert (=> d!8258 (=> (not res!25190) (not e!19570))))

(declare-fun lt!41488 () (_ BitVec 64))

(declare-fun lt!41489 () (_ BitVec 64))

(declare-fun lt!41486 () (_ BitVec 64))

(assert (=> d!8258 (= res!25190 (= lt!41489 (bvsub lt!41488 lt!41486)))))

(assert (=> d!8258 (or (= (bvand lt!41488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41488 lt!41486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8258 (= lt!41486 (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 thiss!1379))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379))))))

(declare-fun lt!41487 () (_ BitVec 64))

(declare-fun lt!41491 () (_ BitVec 64))

(assert (=> d!8258 (= lt!41488 (bvmul lt!41487 lt!41491))))

(assert (=> d!8258 (or (= lt!41487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41491 (bvsdiv (bvmul lt!41487 lt!41491) lt!41487)))))

(assert (=> d!8258 (= lt!41491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8258 (= lt!41487 ((_ sign_extend 32) (size!765 (buf!1093 thiss!1379))))))

(assert (=> d!8258 (= lt!41489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2424 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2419 thiss!1379))))))

(assert (=> d!8258 (invariant!0 (currentBit!2419 thiss!1379) (currentByte!2424 thiss!1379) (size!765 (buf!1093 thiss!1379)))))

(assert (=> d!8258 (= (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)) lt!41489)))

(declare-fun b!29187 () Bool)

(declare-fun res!25191 () Bool)

(assert (=> b!29187 (=> (not res!25191) (not e!19570))))

(assert (=> b!29187 (= res!25191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41489))))

(declare-fun b!29188 () Bool)

(declare-fun lt!41490 () (_ BitVec 64))

(assert (=> b!29188 (= e!19570 (bvsle lt!41489 (bvmul lt!41490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29188 (or (= lt!41490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41490)))))

(assert (=> b!29188 (= lt!41490 ((_ sign_extend 32) (size!765 (buf!1093 thiss!1379))))))

(assert (= (and d!8258 res!25190) b!29187))

(assert (= (and b!29187 res!25191) b!29188))

(assert (=> d!8258 m!42033))

(assert (=> d!8258 m!42049))

(assert (=> b!28943 d!8258))

(declare-fun d!8260 () Bool)

(assert (=> d!8260 (= (invariant!0 (currentBit!2419 (_2!1640 lt!41030)) (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41033)))) (and (bvsge (currentBit!2419 (_2!1640 lt!41030)) #b00000000000000000000000000000000) (bvslt (currentBit!2419 (_2!1640 lt!41030)) #b00000000000000000000000000001000) (bvsge (currentByte!2424 (_2!1640 lt!41030)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41033)))) (and (= (currentBit!2419 (_2!1640 lt!41030)) #b00000000000000000000000000000000) (= (currentByte!2424 (_2!1640 lt!41030)) (size!765 (buf!1093 (_2!1640 lt!41033))))))))))

(assert (=> b!28953 d!8260))

(declare-fun d!8262 () Bool)

(declare-fun e!19571 () Bool)

(assert (=> d!8262 e!19571))

(declare-fun res!25192 () Bool)

(assert (=> d!8262 (=> (not res!25192) (not e!19571))))

(declare-fun lt!41495 () (_ BitVec 64))

(declare-fun lt!41492 () (_ BitVec 64))

(declare-fun lt!41494 () (_ BitVec 64))

(assert (=> d!8262 (= res!25192 (= lt!41495 (bvsub lt!41494 lt!41492)))))

(assert (=> d!8262 (or (= (bvand lt!41494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41494 lt!41492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8262 (= lt!41492 (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41033))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41033)))))))

(declare-fun lt!41493 () (_ BitVec 64))

(declare-fun lt!41497 () (_ BitVec 64))

(assert (=> d!8262 (= lt!41494 (bvmul lt!41493 lt!41497))))

(assert (=> d!8262 (or (= lt!41493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41497 (bvsdiv (bvmul lt!41493 lt!41497) lt!41493)))))

(assert (=> d!8262 (= lt!41497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8262 (= lt!41493 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))))))

(assert (=> d!8262 (= lt!41495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41033))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41033)))))))

(assert (=> d!8262 (invariant!0 (currentBit!2419 (_2!1640 lt!41033)) (currentByte!2424 (_2!1640 lt!41033)) (size!765 (buf!1093 (_2!1640 lt!41033))))))

(assert (=> d!8262 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41033))) (currentByte!2424 (_2!1640 lt!41033)) (currentBit!2419 (_2!1640 lt!41033))) lt!41495)))

(declare-fun b!29189 () Bool)

(declare-fun res!25193 () Bool)

(assert (=> b!29189 (=> (not res!25193) (not e!19571))))

(assert (=> b!29189 (= res!25193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41495))))

(declare-fun b!29190 () Bool)

(declare-fun lt!41496 () (_ BitVec 64))

(assert (=> b!29190 (= e!19571 (bvsle lt!41495 (bvmul lt!41496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29190 (or (= lt!41496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41496)))))

(assert (=> b!29190 (= lt!41496 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41033)))))))

(assert (= (and d!8262 res!25192) b!29189))

(assert (= (and b!29189 res!25193) b!29190))

(declare-fun m!42133 () Bool)

(assert (=> d!8262 m!42133))

(assert (=> d!8262 m!41735))

(assert (=> b!28942 d!8262))

(declare-fun d!8264 () Bool)

(assert (=> d!8264 (= (tail!97 lt!41034) (t!1130 lt!41034))))

(assert (=> b!28950 d!8264))

(declare-fun d!8266 () Bool)

(declare-fun e!19574 () Bool)

(assert (=> d!8266 e!19574))

(declare-fun res!25196 () Bool)

(assert (=> d!8266 (=> (not res!25196) (not e!19574))))

(declare-fun lt!41503 () (_ BitVec 64))

(assert (=> d!8266 (= res!25196 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!41503) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8266 (= lt!41503 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41502 () Unit!2251)

(declare-fun choose!42 (BitStream!1358 BitStream!1358 BitStream!1358 BitStream!1358 (_ BitVec 64) List!380) Unit!2251)

(assert (=> d!8266 (= lt!41502 (choose!42 (_2!1640 lt!41033) (_2!1640 lt!41033) (_1!1641 lt!41044) (_1!1641 lt!41043) (bvsub to!314 i!635) lt!41034))))

(assert (=> d!8266 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8266 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1640 lt!41033) (_2!1640 lt!41033) (_1!1641 lt!41044) (_1!1641 lt!41043) (bvsub to!314 i!635) lt!41034) lt!41502)))

(declare-fun b!29193 () Bool)

(assert (=> b!29193 (= e!19574 (= (bitStreamReadBitsIntoList!0 (_2!1640 lt!41033) (_1!1641 lt!41043) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!97 lt!41034)))))

(assert (= (and d!8266 res!25196) b!29193))

(declare-fun m!42135 () Bool)

(assert (=> d!8266 m!42135))

(declare-fun m!42137 () Bool)

(assert (=> b!29193 m!42137))

(assert (=> b!29193 m!41703))

(assert (=> b!28950 d!8266))

(declare-fun d!8268 () Bool)

(assert (=> d!8268 (= (array_inv!732 (buf!1093 thiss!1379)) (bvsge (size!765 (buf!1093 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!28949 d!8268))

(declare-fun d!8270 () Bool)

(declare-fun size!767 (List!380) Int)

(assert (=> d!8270 (= (length!106 lt!41034) (size!767 lt!41034))))

(declare-fun bs!2358 () Bool)

(assert (= bs!2358 d!8270))

(declare-fun m!42139 () Bool)

(assert (=> bs!2358 m!42139))

(assert (=> b!28948 d!8270))

(declare-fun d!8272 () Bool)

(assert (=> d!8272 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41504 () Unit!2251)

(assert (=> d!8272 (= lt!41504 (choose!9 thiss!1379 (buf!1093 (_2!1640 lt!41030)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1359 (buf!1093 (_2!1640 lt!41030)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379))))))

(assert (=> d!8272 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1093 (_2!1640 lt!41030)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41504)))

(declare-fun bs!2359 () Bool)

(assert (= bs!2359 d!8272))

(assert (=> bs!2359 m!41719))

(declare-fun m!42141 () Bool)

(assert (=> bs!2359 m!42141))

(assert (=> b!28947 d!8272))

(declare-fun call!372 () tuple2!3108)

(declare-fun lt!41883 () tuple2!3106)

(declare-fun bm!369 () Bool)

(declare-fun lt!41897 () tuple2!3106)

(declare-fun c!1899 () Bool)

(assert (=> bm!369 (= call!372 (reader!0 (ite c!1899 (_2!1640 lt!41883) (_2!1640 lt!41030)) (ite c!1899 (_2!1640 lt!41897) (_2!1640 lt!41030))))))

(declare-fun b!29291 () Bool)

(declare-fun e!19621 () tuple2!3106)

(declare-fun Unit!2267 () Unit!2251)

(assert (=> b!29291 (= e!19621 (tuple2!3107 Unit!2267 (_2!1640 lt!41030)))))

(assert (=> b!29291 (= (size!765 (buf!1093 (_2!1640 lt!41030))) (size!765 (buf!1093 (_2!1640 lt!41030))))))

(declare-fun lt!41877 () Unit!2251)

(declare-fun Unit!2268 () Unit!2251)

(assert (=> b!29291 (= lt!41877 Unit!2268)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1358 array!1764 array!1764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29291 (checkByteArrayBitContent!0 (_2!1640 lt!41030) srcBuffer!2 (_1!1651 (readBits!0 (_1!1641 call!372) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!29292 () Bool)

(declare-fun res!25279 () Bool)

(declare-fun e!19620 () Bool)

(assert (=> b!29292 (=> (not res!25279) (not e!19620))))

(declare-fun lt!41911 () tuple2!3106)

(assert (=> b!29292 (= res!25279 (invariant!0 (currentBit!2419 (_2!1640 lt!41911)) (currentByte!2424 (_2!1640 lt!41911)) (size!765 (buf!1093 (_2!1640 lt!41911)))))))

(declare-fun b!29293 () Bool)

(declare-fun res!25281 () Bool)

(assert (=> b!29293 (=> (not res!25281) (not e!19620))))

(assert (=> b!29293 (= res!25281 (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41911)))))

(declare-fun b!29294 () Bool)

(declare-fun lt!41890 () tuple2!3108)

(assert (=> b!29294 (= e!19620 (= (bitStreamReadBitsIntoList!0 (_2!1640 lt!41911) (_1!1641 lt!41890) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1640 lt!41911) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!29294 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29294 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!41906 () Unit!2251)

(declare-fun lt!41893 () Unit!2251)

(assert (=> b!29294 (= lt!41906 lt!41893)))

(declare-fun lt!41896 () (_ BitVec 64))

(assert (=> b!29294 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41911)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41896)))

(assert (=> b!29294 (= lt!41893 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1640 lt!41030) (buf!1093 (_2!1640 lt!41911)) lt!41896))))

(declare-fun e!19622 () Bool)

(assert (=> b!29294 e!19622))

(declare-fun res!25282 () Bool)

(assert (=> b!29294 (=> (not res!25282) (not e!19622))))

(assert (=> b!29294 (= res!25282 (and (= (size!765 (buf!1093 (_2!1640 lt!41030))) (size!765 (buf!1093 (_2!1640 lt!41911)))) (bvsge lt!41896 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29294 (= lt!41896 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!29294 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29294 (= lt!41890 (reader!0 (_2!1640 lt!41030) (_2!1640 lt!41911)))))

(declare-fun b!29295 () Bool)

(declare-fun res!25283 () Bool)

(assert (=> b!29295 (=> (not res!25283) (not e!19620))))

(assert (=> b!29295 (= res!25283 (= (size!765 (buf!1093 (_2!1640 lt!41911))) (size!765 (buf!1093 (_2!1640 lt!41030)))))))

(declare-fun b!29296 () Bool)

(assert (=> b!29296 (= e!19622 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41896))))

(declare-fun b!29298 () Bool)

(declare-fun Unit!2269 () Unit!2251)

(assert (=> b!29298 (= e!19621 (tuple2!3107 Unit!2269 (_2!1640 lt!41897)))))

(assert (=> b!29298 (= lt!41883 (appendBitFromByte!0 (_2!1640 lt!41030) (select (arr!1228 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!41915 () (_ BitVec 64))

(assert (=> b!29298 (= lt!41915 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41891 () (_ BitVec 64))

(assert (=> b!29298 (= lt!41891 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41881 () Unit!2251)

(assert (=> b!29298 (= lt!41881 (validateOffsetBitsIneqLemma!0 (_2!1640 lt!41030) (_2!1640 lt!41883) lt!41915 lt!41891))))

(assert (=> b!29298 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41883)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41883))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41883))) (bvsub lt!41915 lt!41891))))

(declare-fun lt!41901 () Unit!2251)

(assert (=> b!29298 (= lt!41901 lt!41881)))

(declare-fun lt!41895 () tuple2!3108)

(assert (=> b!29298 (= lt!41895 (reader!0 (_2!1640 lt!41030) (_2!1640 lt!41883)))))

(declare-fun lt!41875 () (_ BitVec 64))

(assert (=> b!29298 (= lt!41875 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41908 () Unit!2251)

(assert (=> b!29298 (= lt!41908 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1640 lt!41030) (buf!1093 (_2!1640 lt!41883)) lt!41875))))

(assert (=> b!29298 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41883)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41875)))

(declare-fun lt!41889 () Unit!2251)

(assert (=> b!29298 (= lt!41889 lt!41908)))

(assert (=> b!29298 (= (head!217 (byteArrayBitContentToList!0 (_2!1640 lt!41883) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!217 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41883) (_1!1641 lt!41895) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41909 () Unit!2251)

(declare-fun Unit!2270 () Unit!2251)

(assert (=> b!29298 (= lt!41909 Unit!2270)))

(assert (=> b!29298 (= lt!41897 (appendBitsMSBFirstLoop!0 (_2!1640 lt!41883) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!41912 () Unit!2251)

(assert (=> b!29298 (= lt!41912 (lemmaIsPrefixTransitive!0 (_2!1640 lt!41030) (_2!1640 lt!41883) (_2!1640 lt!41897)))))

(assert (=> b!29298 (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41897))))

(declare-fun lt!41910 () Unit!2251)

(assert (=> b!29298 (= lt!41910 lt!41912)))

(assert (=> b!29298 (= (size!765 (buf!1093 (_2!1640 lt!41897))) (size!765 (buf!1093 (_2!1640 lt!41030))))))

(declare-fun lt!41914 () Unit!2251)

(declare-fun Unit!2271 () Unit!2251)

(assert (=> b!29298 (= lt!41914 Unit!2271)))

(assert (=> b!29298 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41897))) (currentByte!2424 (_2!1640 lt!41897)) (currentBit!2419 (_2!1640 lt!41897))) (bvsub (bvadd (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41876 () Unit!2251)

(declare-fun Unit!2272 () Unit!2251)

(assert (=> b!29298 (= lt!41876 Unit!2272)))

(assert (=> b!29298 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41897))) (currentByte!2424 (_2!1640 lt!41897)) (currentBit!2419 (_2!1640 lt!41897))) (bvsub (bvsub (bvadd (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41883))) (currentByte!2424 (_2!1640 lt!41883)) (currentBit!2419 (_2!1640 lt!41883))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41879 () Unit!2251)

(declare-fun Unit!2273 () Unit!2251)

(assert (=> b!29298 (= lt!41879 Unit!2273)))

(declare-fun lt!41903 () tuple2!3108)

(assert (=> b!29298 (= lt!41903 (reader!0 (_2!1640 lt!41030) (_2!1640 lt!41897)))))

(declare-fun lt!41913 () (_ BitVec 64))

(assert (=> b!29298 (= lt!41913 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41887 () Unit!2251)

(assert (=> b!29298 (= lt!41887 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1640 lt!41030) (buf!1093 (_2!1640 lt!41897)) lt!41913))))

(assert (=> b!29298 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41897)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41030))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41030))) lt!41913)))

(declare-fun lt!41907 () Unit!2251)

(assert (=> b!29298 (= lt!41907 lt!41887)))

(declare-fun lt!41880 () tuple2!3108)

(assert (=> b!29298 (= lt!41880 call!372)))

(declare-fun lt!41917 () (_ BitVec 64))

(assert (=> b!29298 (= lt!41917 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41885 () Unit!2251)

(assert (=> b!29298 (= lt!41885 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1640 lt!41883) (buf!1093 (_2!1640 lt!41897)) lt!41917))))

(assert (=> b!29298 (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41897)))) ((_ sign_extend 32) (currentByte!2424 (_2!1640 lt!41883))) ((_ sign_extend 32) (currentBit!2419 (_2!1640 lt!41883))) lt!41917)))

(declare-fun lt!41902 () Unit!2251)

(assert (=> b!29298 (= lt!41902 lt!41885)))

(declare-fun lt!41900 () List!380)

(assert (=> b!29298 (= lt!41900 (byteArrayBitContentToList!0 (_2!1640 lt!41897) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!41898 () List!380)

(assert (=> b!29298 (= lt!41898 (byteArrayBitContentToList!0 (_2!1640 lt!41897) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41884 () List!380)

(assert (=> b!29298 (= lt!41884 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41897) (_1!1641 lt!41903) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!41894 () List!380)

(assert (=> b!29298 (= lt!41894 (bitStreamReadBitsIntoList!0 (_2!1640 lt!41897) (_1!1641 lt!41880) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41888 () (_ BitVec 64))

(assert (=> b!29298 (= lt!41888 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41899 () Unit!2251)

(assert (=> b!29298 (= lt!41899 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1640 lt!41897) (_2!1640 lt!41897) (_1!1641 lt!41903) (_1!1641 lt!41880) lt!41888 lt!41884))))

(assert (=> b!29298 (= (bitStreamReadBitsIntoList!0 (_2!1640 lt!41897) (_1!1641 lt!41880) (bvsub lt!41888 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!97 lt!41884))))

(declare-fun lt!41874 () Unit!2251)

(assert (=> b!29298 (= lt!41874 lt!41899)))

(declare-fun lt!41882 () (_ BitVec 64))

(declare-fun lt!41904 () Unit!2251)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1764 array!1764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2251)

(assert (=> b!29298 (= lt!41904 (arrayBitRangesEqImpliesEq!0 (buf!1093 (_2!1640 lt!41883)) (buf!1093 (_2!1640 lt!41897)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!41882 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41883))) (currentByte!2424 (_2!1640 lt!41883)) (currentBit!2419 (_2!1640 lt!41883)))))))

(declare-fun bitAt!0 (array!1764 (_ BitVec 64)) Bool)

(assert (=> b!29298 (= (bitAt!0 (buf!1093 (_2!1640 lt!41883)) lt!41882) (bitAt!0 (buf!1093 (_2!1640 lt!41897)) lt!41882))))

(declare-fun lt!41916 () Unit!2251)

(assert (=> b!29298 (= lt!41916 lt!41904)))

(declare-fun b!29297 () Bool)

(declare-fun res!25280 () Bool)

(assert (=> b!29297 (=> (not res!25280) (not e!19620))))

(assert (=> b!29297 (= res!25280 (= (size!765 (buf!1093 (_2!1640 lt!41030))) (size!765 (buf!1093 (_2!1640 lt!41911)))))))

(declare-fun d!8274 () Bool)

(assert (=> d!8274 e!19620))

(declare-fun res!25284 () Bool)

(assert (=> d!8274 (=> (not res!25284) (not e!19620))))

(declare-fun lt!41905 () (_ BitVec 64))

(assert (=> d!8274 (= res!25284 (= (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41911))) (currentByte!2424 (_2!1640 lt!41911)) (currentBit!2419 (_2!1640 lt!41911))) (bvsub lt!41905 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8274 (or (= (bvand lt!41905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41905 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!41892 () (_ BitVec 64))

(assert (=> d!8274 (= lt!41905 (bvadd lt!41892 to!314))))

(assert (=> d!8274 (or (not (= (bvand lt!41892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!41892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!41892 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8274 (= lt!41892 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))))))

(assert (=> d!8274 (= lt!41911 e!19621)))

(assert (=> d!8274 (= c!1899 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!41878 () Unit!2251)

(declare-fun lt!41886 () Unit!2251)

(assert (=> d!8274 (= lt!41878 lt!41886)))

(assert (=> d!8274 (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41030))))

(assert (=> d!8274 (= lt!41886 (lemmaIsPrefixRefl!0 (_2!1640 lt!41030)))))

(assert (=> d!8274 (= lt!41882 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))))))

(assert (=> d!8274 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8274 (= (appendBitsMSBFirstLoop!0 (_2!1640 lt!41030) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!41911)))

(assert (= (and d!8274 c!1899) b!29298))

(assert (= (and d!8274 (not c!1899)) b!29291))

(assert (= (or b!29298 b!29291) bm!369))

(assert (= (and d!8274 res!25284) b!29292))

(assert (= (and b!29292 res!25279) b!29297))

(assert (= (and b!29297 res!25280) b!29293))

(assert (= (and b!29293 res!25281) b!29295))

(assert (= (and b!29295 res!25283) b!29294))

(assert (= (and b!29294 res!25282) b!29296))

(declare-fun m!42277 () Bool)

(assert (=> b!29294 m!42277))

(declare-fun m!42279 () Bool)

(assert (=> b!29294 m!42279))

(declare-fun m!42281 () Bool)

(assert (=> b!29294 m!42281))

(declare-fun m!42283 () Bool)

(assert (=> b!29294 m!42283))

(declare-fun m!42285 () Bool)

(assert (=> b!29294 m!42285))

(declare-fun m!42287 () Bool)

(assert (=> b!29291 m!42287))

(declare-fun m!42289 () Bool)

(assert (=> b!29291 m!42289))

(declare-fun m!42291 () Bool)

(assert (=> b!29293 m!42291))

(declare-fun m!42293 () Bool)

(assert (=> b!29296 m!42293))

(declare-fun m!42295 () Bool)

(assert (=> b!29298 m!42295))

(declare-fun m!42297 () Bool)

(assert (=> b!29298 m!42297))

(declare-fun m!42299 () Bool)

(assert (=> b!29298 m!42299))

(declare-fun m!42301 () Bool)

(assert (=> b!29298 m!42301))

(declare-fun m!42303 () Bool)

(assert (=> b!29298 m!42303))

(declare-fun m!42305 () Bool)

(assert (=> b!29298 m!42305))

(declare-fun m!42307 () Bool)

(assert (=> b!29298 m!42307))

(declare-fun m!42309 () Bool)

(assert (=> b!29298 m!42309))

(declare-fun m!42311 () Bool)

(assert (=> b!29298 m!42311))

(declare-fun m!42313 () Bool)

(assert (=> b!29298 m!42313))

(declare-fun m!42315 () Bool)

(assert (=> b!29298 m!42315))

(declare-fun m!42317 () Bool)

(assert (=> b!29298 m!42317))

(declare-fun m!42319 () Bool)

(assert (=> b!29298 m!42319))

(declare-fun m!42321 () Bool)

(assert (=> b!29298 m!42321))

(declare-fun m!42323 () Bool)

(assert (=> b!29298 m!42323))

(declare-fun m!42325 () Bool)

(assert (=> b!29298 m!42325))

(declare-fun m!42327 () Bool)

(assert (=> b!29298 m!42327))

(declare-fun m!42329 () Bool)

(assert (=> b!29298 m!42329))

(declare-fun m!42331 () Bool)

(assert (=> b!29298 m!42331))

(assert (=> b!29298 m!42309))

(declare-fun m!42333 () Bool)

(assert (=> b!29298 m!42333))

(declare-fun m!42335 () Bool)

(assert (=> b!29298 m!42335))

(declare-fun m!42337 () Bool)

(assert (=> b!29298 m!42337))

(declare-fun m!42339 () Bool)

(assert (=> b!29298 m!42339))

(declare-fun m!42341 () Bool)

(assert (=> b!29298 m!42341))

(assert (=> b!29298 m!41699))

(declare-fun m!42343 () Bool)

(assert (=> b!29298 m!42343))

(declare-fun m!42345 () Bool)

(assert (=> b!29298 m!42345))

(assert (=> b!29298 m!42311))

(declare-fun m!42347 () Bool)

(assert (=> b!29298 m!42347))

(declare-fun m!42349 () Bool)

(assert (=> b!29298 m!42349))

(declare-fun m!42351 () Bool)

(assert (=> b!29298 m!42351))

(assert (=> b!29298 m!42321))

(declare-fun m!42353 () Bool)

(assert (=> b!29298 m!42353))

(assert (=> b!29298 m!42295))

(declare-fun m!42355 () Bool)

(assert (=> b!29298 m!42355))

(declare-fun m!42357 () Bool)

(assert (=> bm!369 m!42357))

(declare-fun m!42359 () Bool)

(assert (=> d!8274 m!42359))

(assert (=> d!8274 m!41699))

(assert (=> d!8274 m!41997))

(assert (=> d!8274 m!41991))

(declare-fun m!42361 () Bool)

(assert (=> b!29292 m!42361))

(assert (=> b!28947 d!8274))

(declare-fun d!8310 () Bool)

(assert (=> d!8310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!765 (buf!1093 (_2!1640 lt!41030)))) ((_ sign_extend 32) (currentByte!2424 thiss!1379)) ((_ sign_extend 32) (currentBit!2419 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2366 () Bool)

(assert (= bs!2366 d!8310))

(declare-fun m!42363 () Bool)

(assert (=> bs!2366 m!42363))

(assert (=> b!28947 d!8310))

(declare-fun b!29299 () Bool)

(declare-fun res!25285 () Bool)

(declare-fun e!19623 () Bool)

(assert (=> b!29299 (=> (not res!25285) (not e!19623))))

(declare-fun lt!41937 () tuple2!3108)

(assert (=> b!29299 (= res!25285 (isPrefixOf!0 (_2!1641 lt!41937) (_2!1640 lt!41030)))))

(declare-fun d!8312 () Bool)

(assert (=> d!8312 e!19623))

(declare-fun res!25287 () Bool)

(assert (=> d!8312 (=> (not res!25287) (not e!19623))))

(assert (=> d!8312 (= res!25287 (isPrefixOf!0 (_1!1641 lt!41937) (_2!1641 lt!41937)))))

(declare-fun lt!41919 () BitStream!1358)

(assert (=> d!8312 (= lt!41937 (tuple2!3109 lt!41919 (_2!1640 lt!41030)))))

(declare-fun lt!41929 () Unit!2251)

(declare-fun lt!41925 () Unit!2251)

(assert (=> d!8312 (= lt!41929 lt!41925)))

(assert (=> d!8312 (isPrefixOf!0 lt!41919 (_2!1640 lt!41030))))

(assert (=> d!8312 (= lt!41925 (lemmaIsPrefixTransitive!0 lt!41919 (_2!1640 lt!41030) (_2!1640 lt!41030)))))

(declare-fun lt!41922 () Unit!2251)

(declare-fun lt!41928 () Unit!2251)

(assert (=> d!8312 (= lt!41922 lt!41928)))

(assert (=> d!8312 (isPrefixOf!0 lt!41919 (_2!1640 lt!41030))))

(assert (=> d!8312 (= lt!41928 (lemmaIsPrefixTransitive!0 lt!41919 thiss!1379 (_2!1640 lt!41030)))))

(declare-fun lt!41936 () Unit!2251)

(declare-fun e!19624 () Unit!2251)

(assert (=> d!8312 (= lt!41936 e!19624)))

(declare-fun c!1900 () Bool)

(assert (=> d!8312 (= c!1900 (not (= (size!765 (buf!1093 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!41921 () Unit!2251)

(declare-fun lt!41924 () Unit!2251)

(assert (=> d!8312 (= lt!41921 lt!41924)))

(assert (=> d!8312 (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41030))))

(assert (=> d!8312 (= lt!41924 (lemmaIsPrefixRefl!0 (_2!1640 lt!41030)))))

(declare-fun lt!41926 () Unit!2251)

(declare-fun lt!41927 () Unit!2251)

(assert (=> d!8312 (= lt!41926 lt!41927)))

(assert (=> d!8312 (= lt!41927 (lemmaIsPrefixRefl!0 (_2!1640 lt!41030)))))

(declare-fun lt!41935 () Unit!2251)

(declare-fun lt!41931 () Unit!2251)

(assert (=> d!8312 (= lt!41935 lt!41931)))

(assert (=> d!8312 (isPrefixOf!0 lt!41919 lt!41919)))

(assert (=> d!8312 (= lt!41931 (lemmaIsPrefixRefl!0 lt!41919))))

(declare-fun lt!41920 () Unit!2251)

(declare-fun lt!41930 () Unit!2251)

(assert (=> d!8312 (= lt!41920 lt!41930)))

(assert (=> d!8312 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8312 (= lt!41930 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8312 (= lt!41919 (BitStream!1359 (buf!1093 (_2!1640 lt!41030)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(assert (=> d!8312 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41030))))

(assert (=> d!8312 (= (reader!0 thiss!1379 (_2!1640 lt!41030)) lt!41937)))

(declare-fun b!29300 () Bool)

(declare-fun res!25286 () Bool)

(assert (=> b!29300 (=> (not res!25286) (not e!19623))))

(assert (=> b!29300 (= res!25286 (isPrefixOf!0 (_1!1641 lt!41937) thiss!1379))))

(declare-fun b!29301 () Bool)

(declare-fun lt!41933 () Unit!2251)

(assert (=> b!29301 (= e!19624 lt!41933)))

(declare-fun lt!41923 () (_ BitVec 64))

(assert (=> b!29301 (= lt!41923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41918 () (_ BitVec 64))

(assert (=> b!29301 (= lt!41918 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(assert (=> b!29301 (= lt!41933 (arrayBitRangesEqSymmetric!0 (buf!1093 thiss!1379) (buf!1093 (_2!1640 lt!41030)) lt!41923 lt!41918))))

(assert (=> b!29301 (arrayBitRangesEq!0 (buf!1093 (_2!1640 lt!41030)) (buf!1093 thiss!1379) lt!41923 lt!41918)))

(declare-fun b!29302 () Bool)

(declare-fun Unit!2282 () Unit!2251)

(assert (=> b!29302 (= e!19624 Unit!2282)))

(declare-fun b!29303 () Bool)

(declare-fun lt!41934 () (_ BitVec 64))

(declare-fun lt!41932 () (_ BitVec 64))

(assert (=> b!29303 (= e!19623 (= (_1!1641 lt!41937) (withMovedBitIndex!0 (_2!1641 lt!41937) (bvsub lt!41932 lt!41934))))))

(assert (=> b!29303 (or (= (bvand lt!41932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41932 lt!41934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29303 (= lt!41934 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))))))

(assert (=> b!29303 (= lt!41932 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)))))

(assert (= (and d!8312 c!1900) b!29301))

(assert (= (and d!8312 (not c!1900)) b!29302))

(assert (= (and d!8312 res!25287) b!29300))

(assert (= (and b!29300 res!25286) b!29299))

(assert (= (and b!29299 res!25285) b!29303))

(declare-fun m!42365 () Bool)

(assert (=> b!29300 m!42365))

(declare-fun m!42367 () Bool)

(assert (=> b!29299 m!42367))

(declare-fun m!42369 () Bool)

(assert (=> b!29303 m!42369))

(assert (=> b!29303 m!41699))

(assert (=> b!29303 m!41727))

(assert (=> b!29301 m!41727))

(declare-fun m!42371 () Bool)

(assert (=> b!29301 m!42371))

(declare-fun m!42373 () Bool)

(assert (=> b!29301 m!42373))

(assert (=> d!8312 m!41991))

(assert (=> d!8312 m!41997))

(assert (=> d!8312 m!41725))

(assert (=> d!8312 m!41757))

(declare-fun m!42375 () Bool)

(assert (=> d!8312 m!42375))

(declare-fun m!42377 () Bool)

(assert (=> d!8312 m!42377))

(assert (=> d!8312 m!41723))

(declare-fun m!42379 () Bool)

(assert (=> d!8312 m!42379))

(declare-fun m!42381 () Bool)

(assert (=> d!8312 m!42381))

(declare-fun m!42383 () Bool)

(assert (=> d!8312 m!42383))

(declare-fun m!42385 () Bool)

(assert (=> d!8312 m!42385))

(assert (=> b!28947 d!8312))

(declare-fun d!8314 () Bool)

(declare-fun res!25288 () Bool)

(declare-fun e!19625 () Bool)

(assert (=> d!8314 (=> (not res!25288) (not e!19625))))

(assert (=> d!8314 (= res!25288 (= (size!765 (buf!1093 thiss!1379)) (size!765 (buf!1093 (_2!1640 lt!41033)))))))

(assert (=> d!8314 (= (isPrefixOf!0 thiss!1379 (_2!1640 lt!41033)) e!19625)))

(declare-fun b!29304 () Bool)

(declare-fun res!25289 () Bool)

(assert (=> b!29304 (=> (not res!25289) (not e!19625))))

(assert (=> b!29304 (= res!25289 (bvsle (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379)) (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41033))) (currentByte!2424 (_2!1640 lt!41033)) (currentBit!2419 (_2!1640 lt!41033)))))))

(declare-fun b!29305 () Bool)

(declare-fun e!19626 () Bool)

(assert (=> b!29305 (= e!19625 e!19626)))

(declare-fun res!25290 () Bool)

(assert (=> b!29305 (=> res!25290 e!19626)))

(assert (=> b!29305 (= res!25290 (= (size!765 (buf!1093 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29306 () Bool)

(assert (=> b!29306 (= e!19626 (arrayBitRangesEq!0 (buf!1093 thiss!1379) (buf!1093 (_2!1640 lt!41033)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!765 (buf!1093 thiss!1379)) (currentByte!2424 thiss!1379) (currentBit!2419 thiss!1379))))))

(assert (= (and d!8314 res!25288) b!29304))

(assert (= (and b!29304 res!25289) b!29305))

(assert (= (and b!29305 (not res!25290)) b!29306))

(assert (=> b!29304 m!41727))

(assert (=> b!29304 m!41763))

(assert (=> b!29306 m!41727))

(assert (=> b!29306 m!41727))

(declare-fun m!42387 () Bool)

(assert (=> b!29306 m!42387))

(assert (=> b!28947 d!8314))

(declare-fun d!8316 () Bool)

(declare-fun res!25291 () Bool)

(declare-fun e!19627 () Bool)

(assert (=> d!8316 (=> (not res!25291) (not e!19627))))

(assert (=> d!8316 (= res!25291 (= (size!765 (buf!1093 (_2!1640 lt!41030))) (size!765 (buf!1093 (_2!1640 lt!41033)))))))

(assert (=> d!8316 (= (isPrefixOf!0 (_2!1640 lt!41030) (_2!1640 lt!41033)) e!19627)))

(declare-fun b!29307 () Bool)

(declare-fun res!25292 () Bool)

(assert (=> b!29307 (=> (not res!25292) (not e!19627))))

(assert (=> b!29307 (= res!25292 (bvsle (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030))) (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41033))) (currentByte!2424 (_2!1640 lt!41033)) (currentBit!2419 (_2!1640 lt!41033)))))))

(declare-fun b!29308 () Bool)

(declare-fun e!19628 () Bool)

(assert (=> b!29308 (= e!19627 e!19628)))

(declare-fun res!25293 () Bool)

(assert (=> b!29308 (=> res!25293 e!19628)))

(assert (=> b!29308 (= res!25293 (= (size!765 (buf!1093 (_2!1640 lt!41030))) #b00000000000000000000000000000000))))

(declare-fun b!29309 () Bool)

(assert (=> b!29309 (= e!19628 (arrayBitRangesEq!0 (buf!1093 (_2!1640 lt!41030)) (buf!1093 (_2!1640 lt!41033)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!765 (buf!1093 (_2!1640 lt!41030))) (currentByte!2424 (_2!1640 lt!41030)) (currentBit!2419 (_2!1640 lt!41030)))))))

(assert (= (and d!8316 res!25291) b!29307))

(assert (= (and b!29307 res!25292) b!29308))

(assert (= (and b!29308 (not res!25293)) b!29309))

(assert (=> b!29307 m!41699))

(assert (=> b!29307 m!41763))

(assert (=> b!29309 m!41699))

(assert (=> b!29309 m!41699))

(declare-fun m!42389 () Bool)

(assert (=> b!29309 m!42389))

(assert (=> b!28947 d!8316))

(declare-fun d!8318 () Bool)

(assert (=> d!8318 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41033))))

(declare-fun lt!41940 () Unit!2251)

(declare-fun choose!30 (BitStream!1358 BitStream!1358 BitStream!1358) Unit!2251)

(assert (=> d!8318 (= lt!41940 (choose!30 thiss!1379 (_2!1640 lt!41030) (_2!1640 lt!41033)))))

(assert (=> d!8318 (isPrefixOf!0 thiss!1379 (_2!1640 lt!41030))))

(assert (=> d!8318 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1640 lt!41030) (_2!1640 lt!41033)) lt!41940)))

(declare-fun bs!2367 () Bool)

(assert (= bs!2367 d!8318))

(assert (=> bs!2367 m!41715))

(declare-fun m!42391 () Bool)

(assert (=> bs!2367 m!42391))

(assert (=> bs!2367 m!41757))

(assert (=> b!28947 d!8318))

(push 1)

(assert (not b!29177))

(assert (not b!29053))

(assert (not d!8256))

(assert (not b!29294))

(assert (not b!29091))

(assert (not b!29079))

(assert (not b!29293))

(assert (not b!29123))

(assert (not b!29178))

(assert (not b!29052))

(assert (not d!8312))

(assert (not bm!369))

(assert (not b!29193))

(assert (not b!29301))

(assert (not d!8196))

(assert (not d!8180))

(assert (not d!8266))

(assert (not b!29050))

(assert (not d!8166))

(assert (not b!29054))

(assert (not b!29183))

(assert (not b!29122))

(assert (not b!29119))

(assert (not b!29296))

(assert (not b!29090))

(assert (not b!29180))

(assert (not d!8174))

(assert (not d!8258))

(assert (not b!29077))

(assert (not b!29049))

(assert (not d!8170))

(assert (not b!29304))

(assert (not b!29298))

(assert (not d!8310))

(assert (not b!29300))

(assert (not d!8162))

(assert (not b!29075))

(assert (not b!29291))

(assert (not b!29307))

(assert (not d!8262))

(assert (not b!29299))

(assert (not d!8272))

(assert (not d!8220))

(assert (not b!29292))

(assert (not d!8270))

(assert (not b!29076))

(assert (not b!29181))

(assert (not b!29306))

(assert (not d!8182))

(assert (not b!29184))

(assert (not b!29048))

(assert (not d!8214))

(assert (not b!29093))

(assert (not d!8212))

(assert (not d!8274))

(assert (not b!29186))

(assert (not b!29089))

(assert (not b!29121))

(assert (not b!29141))

(assert (not b!29182))

(assert (not b!29176))

(assert (not d!8168))

(assert (not b!29303))

(assert (not b!29309))

(assert (not b!29130))

(assert (not b!29179))

(assert (not d!8178))

(assert (not b!29132))

(assert (not d!8318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

