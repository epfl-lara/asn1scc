; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5690 () Bool)

(assert start!5690)

(declare-fun b!24126 () Bool)

(declare-fun e!16414 () Bool)

(declare-fun e!16410 () Bool)

(assert (=> b!24126 (= e!16414 e!16410)))

(declare-fun res!20809 () Bool)

(assert (=> b!24126 (=> res!20809 e!16410)))

(declare-datatypes ((array!1613 0))(
  ( (array!1614 (arr!1148 (Array (_ BitVec 32) (_ BitVec 8))) (size!692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1216 0))(
  ( (BitStream!1217 (buf!1013 array!1613) (currentByte!2326 (_ BitVec 32)) (currentBit!2321 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2027 0))(
  ( (Unit!2028) )
))
(declare-datatypes ((tuple2!2750 0))(
  ( (tuple2!2751 (_1!1462 Unit!2027) (_2!1462 BitStream!1216)) )
))
(declare-fun lt!34614 () tuple2!2750)

(declare-fun lt!34613 () tuple2!2750)

(assert (=> b!24126 (= res!20809 (not (= (size!692 (buf!1013 (_2!1462 lt!34614))) (size!692 (buf!1013 (_2!1462 lt!34613))))))))

(declare-fun e!16409 () Bool)

(assert (=> b!24126 e!16409))

(declare-fun res!20805 () Bool)

(assert (=> b!24126 (=> (not res!20805) (not e!16409))))

(declare-fun thiss!1379 () BitStream!1216)

(assert (=> b!24126 (= res!20805 (= (size!692 (buf!1013 (_2!1462 lt!34613))) (size!692 (buf!1013 thiss!1379))))))

(declare-fun b!24127 () Bool)

(declare-fun e!16412 () Bool)

(declare-fun e!16413 () Bool)

(assert (=> b!24127 (= e!16412 (not e!16413))))

(declare-fun res!20799 () Bool)

(assert (=> b!24127 (=> res!20799 e!16413)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24127 (= res!20799 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1216 BitStream!1216) Bool)

(assert (=> b!24127 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34608 () Unit!2027)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1216) Unit!2027)

(assert (=> b!24127 (= lt!34608 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34604 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24127 (= lt!34604 (bitIndex!0 (size!692 (buf!1013 thiss!1379)) (currentByte!2326 thiss!1379) (currentBit!2321 thiss!1379)))))

(declare-fun b!24128 () Bool)

(declare-fun res!20800 () Bool)

(assert (=> b!24128 (=> res!20800 e!16414)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24128 (= res!20800 (not (invariant!0 (currentBit!2321 (_2!1462 lt!34613)) (currentByte!2326 (_2!1462 lt!34613)) (size!692 (buf!1013 (_2!1462 lt!34613))))))))

(declare-fun b!24129 () Bool)

(declare-fun e!16416 () Bool)

(declare-fun e!16407 () Bool)

(assert (=> b!24129 (= e!16416 e!16407)))

(declare-fun res!20810 () Bool)

(assert (=> b!24129 (=> res!20810 e!16407)))

(assert (=> b!24129 (= res!20810 (not (isPrefixOf!0 (_2!1462 lt!34614) (_2!1462 lt!34613))))))

(assert (=> b!24129 (isPrefixOf!0 thiss!1379 (_2!1462 lt!34613))))

(declare-fun lt!34615 () Unit!2027)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1216 BitStream!1216 BitStream!1216) Unit!2027)

(assert (=> b!24129 (= lt!34615 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1462 lt!34614) (_2!1462 lt!34613)))))

(declare-fun srcBuffer!2 () array!1613)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1216 array!1613 (_ BitVec 64) (_ BitVec 64)) tuple2!2750)

(assert (=> b!24129 (= lt!34613 (appendBitsMSBFirstLoop!0 (_2!1462 lt!34614) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16417 () Bool)

(assert (=> b!24129 e!16417))

(declare-fun res!20806 () Bool)

(assert (=> b!24129 (=> (not res!20806) (not e!16417))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24129 (= res!20806 (validate_offset_bits!1 ((_ sign_extend 32) (size!692 (buf!1013 (_2!1462 lt!34614)))) ((_ sign_extend 32) (currentByte!2326 thiss!1379)) ((_ sign_extend 32) (currentBit!2321 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34606 () Unit!2027)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1216 array!1613 (_ BitVec 64)) Unit!2027)

(assert (=> b!24129 (= lt!34606 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1013 (_2!1462 lt!34614)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2752 0))(
  ( (tuple2!2753 (_1!1463 BitStream!1216) (_2!1463 BitStream!1216)) )
))
(declare-fun lt!34611 () tuple2!2752)

(declare-fun reader!0 (BitStream!1216 BitStream!1216) tuple2!2752)

(assert (=> b!24129 (= lt!34611 (reader!0 thiss!1379 (_2!1462 lt!34614)))))

(declare-fun lt!34603 () (_ BitVec 64))

(declare-fun b!24130 () Bool)

(assert (=> b!24130 (= e!16409 (= lt!34603 (bvsub (bvsub (bvadd (bitIndex!0 (size!692 (buf!1013 (_2!1462 lt!34614))) (currentByte!2326 (_2!1462 lt!34614)) (currentBit!2321 (_2!1462 lt!34614))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24131 () Bool)

(assert (=> b!24131 (= e!16413 e!16416)))

(declare-fun res!20808 () Bool)

(assert (=> b!24131 (=> res!20808 e!16416)))

(assert (=> b!24131 (= res!20808 (not (isPrefixOf!0 thiss!1379 (_2!1462 lt!34614))))))

(declare-fun lt!34602 () (_ BitVec 64))

(assert (=> b!24131 (validate_offset_bits!1 ((_ sign_extend 32) (size!692 (buf!1013 (_2!1462 lt!34614)))) ((_ sign_extend 32) (currentByte!2326 (_2!1462 lt!34614))) ((_ sign_extend 32) (currentBit!2321 (_2!1462 lt!34614))) lt!34602)))

(assert (=> b!24131 (= lt!34602 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34609 () Unit!2027)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1216 BitStream!1216 (_ BitVec 64) (_ BitVec 64)) Unit!2027)

(assert (=> b!24131 (= lt!34609 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1462 lt!34614) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1216 (_ BitVec 8) (_ BitVec 32)) tuple2!2750)

(assert (=> b!24131 (= lt!34614 (appendBitFromByte!0 thiss!1379 (select (arr!1148 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24132 () Bool)

(declare-fun res!20802 () Bool)

(assert (=> b!24132 (=> res!20802 e!16410)))

(assert (=> b!24132 (= res!20802 (not (invariant!0 (currentBit!2321 (_2!1462 lt!34614)) (currentByte!2326 (_2!1462 lt!34614)) (size!692 (buf!1013 (_2!1462 lt!34613))))))))

(declare-fun b!24133 () Bool)

(declare-fun e!16408 () Bool)

(declare-fun array_inv!661 (array!1613) Bool)

(assert (=> b!24133 (= e!16408 (array_inv!661 (buf!1013 thiss!1379)))))

(declare-fun b!24134 () Bool)

(declare-fun res!20804 () Bool)

(assert (=> b!24134 (=> (not res!20804) (not e!16412))))

(assert (=> b!24134 (= res!20804 (validate_offset_bits!1 ((_ sign_extend 32) (size!692 (buf!1013 thiss!1379))) ((_ sign_extend 32) (currentByte!2326 thiss!1379)) ((_ sign_extend 32) (currentBit!2321 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24135 () Bool)

(declare-fun res!20811 () Bool)

(assert (=> b!24135 (=> res!20811 e!16410)))

(assert (=> b!24135 (= res!20811 (not (invariant!0 (currentBit!2321 (_2!1462 lt!34614)) (currentByte!2326 (_2!1462 lt!34614)) (size!692 (buf!1013 (_2!1462 lt!34614))))))))

(declare-fun res!20803 () Bool)

(assert (=> start!5690 (=> (not res!20803) (not e!16412))))

(assert (=> start!5690 (= res!20803 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!692 srcBuffer!2))))))))

(assert (=> start!5690 e!16412))

(assert (=> start!5690 true))

(assert (=> start!5690 (array_inv!661 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1216) Bool)

(assert (=> start!5690 (and (inv!12 thiss!1379) e!16408)))

(declare-fun b!24136 () Bool)

(assert (=> b!24136 (= e!16407 e!16414)))

(declare-fun res!20801 () Bool)

(assert (=> b!24136 (=> res!20801 e!16414)))

(assert (=> b!24136 (= res!20801 (not (= lt!34603 (bvsub (bvadd lt!34604 to!314) i!635))))))

(assert (=> b!24136 (= lt!34603 (bitIndex!0 (size!692 (buf!1013 (_2!1462 lt!34613))) (currentByte!2326 (_2!1462 lt!34613)) (currentBit!2321 (_2!1462 lt!34613))))))

(declare-fun b!24137 () Bool)

(declare-fun res!20807 () Bool)

(assert (=> b!24137 (=> res!20807 e!16414)))

(assert (=> b!24137 (= res!20807 (not (= (size!692 (buf!1013 thiss!1379)) (size!692 (buf!1013 (_2!1462 lt!34613))))))))

(declare-fun b!24138 () Bool)

(assert (=> b!24138 (= e!16410 true)))

(assert (=> b!24138 (validate_offset_bits!1 ((_ sign_extend 32) (size!692 (buf!1013 (_2!1462 lt!34613)))) ((_ sign_extend 32) (currentByte!2326 (_2!1462 lt!34614))) ((_ sign_extend 32) (currentBit!2321 (_2!1462 lt!34614))) lt!34602)))

(declare-fun lt!34607 () Unit!2027)

(assert (=> b!24138 (= lt!34607 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1462 lt!34614) (buf!1013 (_2!1462 lt!34613)) lt!34602))))

(declare-fun lt!34605 () tuple2!2752)

(assert (=> b!24138 (= lt!34605 (reader!0 (_2!1462 lt!34614) (_2!1462 lt!34613)))))

(assert (=> b!24138 (validate_offset_bits!1 ((_ sign_extend 32) (size!692 (buf!1013 (_2!1462 lt!34613)))) ((_ sign_extend 32) (currentByte!2326 thiss!1379)) ((_ sign_extend 32) (currentBit!2321 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34610 () Unit!2027)

(assert (=> b!24138 (= lt!34610 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1013 (_2!1462 lt!34613)) (bvsub to!314 i!635)))))

(declare-fun lt!34612 () tuple2!2752)

(assert (=> b!24138 (= lt!34612 (reader!0 thiss!1379 (_2!1462 lt!34613)))))

(declare-fun b!24139 () Bool)

(declare-datatypes ((List!309 0))(
  ( (Nil!306) (Cons!305 (h!424 Bool) (t!1059 List!309)) )
))
(declare-fun head!146 (List!309) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1216 array!1613 (_ BitVec 64) (_ BitVec 64)) List!309)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1216 BitStream!1216 (_ BitVec 64)) List!309)

(assert (=> b!24139 (= e!16417 (= (head!146 (byteArrayBitContentToList!0 (_2!1462 lt!34614) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!146 (bitStreamReadBitsIntoList!0 (_2!1462 lt!34614) (_1!1463 lt!34611) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5690 res!20803) b!24134))

(assert (= (and b!24134 res!20804) b!24127))

(assert (= (and b!24127 (not res!20799)) b!24131))

(assert (= (and b!24131 (not res!20808)) b!24129))

(assert (= (and b!24129 res!20806) b!24139))

(assert (= (and b!24129 (not res!20810)) b!24136))

(assert (= (and b!24136 (not res!20801)) b!24128))

(assert (= (and b!24128 (not res!20800)) b!24137))

(assert (= (and b!24137 (not res!20807)) b!24126))

(assert (= (and b!24126 res!20805) b!24130))

(assert (= (and b!24126 (not res!20809)) b!24135))

(assert (= (and b!24135 (not res!20811)) b!24132))

(assert (= (and b!24132 (not res!20802)) b!24138))

(assert (= start!5690 b!24133))

(declare-fun m!34005 () Bool)

(assert (=> b!24130 m!34005))

(declare-fun m!34007 () Bool)

(assert (=> b!24129 m!34007))

(declare-fun m!34009 () Bool)

(assert (=> b!24129 m!34009))

(declare-fun m!34011 () Bool)

(assert (=> b!24129 m!34011))

(declare-fun m!34013 () Bool)

(assert (=> b!24129 m!34013))

(declare-fun m!34015 () Bool)

(assert (=> b!24129 m!34015))

(declare-fun m!34017 () Bool)

(assert (=> b!24129 m!34017))

(declare-fun m!34019 () Bool)

(assert (=> b!24129 m!34019))

(declare-fun m!34021 () Bool)

(assert (=> b!24132 m!34021))

(declare-fun m!34023 () Bool)

(assert (=> b!24134 m!34023))

(declare-fun m!34025 () Bool)

(assert (=> start!5690 m!34025))

(declare-fun m!34027 () Bool)

(assert (=> start!5690 m!34027))

(declare-fun m!34029 () Bool)

(assert (=> b!24131 m!34029))

(declare-fun m!34031 () Bool)

(assert (=> b!24131 m!34031))

(declare-fun m!34033 () Bool)

(assert (=> b!24131 m!34033))

(declare-fun m!34035 () Bool)

(assert (=> b!24131 m!34035))

(declare-fun m!34037 () Bool)

(assert (=> b!24131 m!34037))

(assert (=> b!24131 m!34033))

(declare-fun m!34039 () Bool)

(assert (=> b!24136 m!34039))

(declare-fun m!34041 () Bool)

(assert (=> b!24139 m!34041))

(assert (=> b!24139 m!34041))

(declare-fun m!34043 () Bool)

(assert (=> b!24139 m!34043))

(declare-fun m!34045 () Bool)

(assert (=> b!24139 m!34045))

(assert (=> b!24139 m!34045))

(declare-fun m!34047 () Bool)

(assert (=> b!24139 m!34047))

(declare-fun m!34049 () Bool)

(assert (=> b!24135 m!34049))

(declare-fun m!34051 () Bool)

(assert (=> b!24133 m!34051))

(declare-fun m!34053 () Bool)

(assert (=> b!24127 m!34053))

(declare-fun m!34055 () Bool)

(assert (=> b!24127 m!34055))

(declare-fun m!34057 () Bool)

(assert (=> b!24127 m!34057))

(declare-fun m!34059 () Bool)

(assert (=> b!24138 m!34059))

(declare-fun m!34061 () Bool)

(assert (=> b!24138 m!34061))

(declare-fun m!34063 () Bool)

(assert (=> b!24138 m!34063))

(declare-fun m!34065 () Bool)

(assert (=> b!24138 m!34065))

(declare-fun m!34067 () Bool)

(assert (=> b!24138 m!34067))

(declare-fun m!34069 () Bool)

(assert (=> b!24138 m!34069))

(declare-fun m!34071 () Bool)

(assert (=> b!24128 m!34071))

(push 1)

