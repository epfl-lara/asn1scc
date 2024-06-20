; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40200 () Bool)

(assert start!40200)

(declare-fun b!183981 () Bool)

(declare-fun e!127488 () Bool)

(declare-datatypes ((array!9768 0))(
  ( (array!9769 (arr!5238 (Array (_ BitVec 32) (_ BitVec 8))) (size!4308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7724 0))(
  ( (BitStream!7725 (buf!4763 array!9768) (currentByte!8997 (_ BitVec 32)) (currentBit!8992 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7724)

(declare-datatypes ((Unit!13191 0))(
  ( (Unit!13192) )
))
(declare-datatypes ((tuple2!15900 0))(
  ( (tuple2!15901 (_1!8595 Unit!13191) (_2!8595 BitStream!7724)) )
))
(declare-fun lt!283014 () tuple2!15900)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183981 (= e!127488 (invariant!0 (currentBit!8992 thiss!1204) (currentByte!8997 thiss!1204) (size!4308 (buf!4763 (_2!8595 lt!283014)))))))

(declare-fun b!183982 () Bool)

(declare-fun res!153031 () Bool)

(declare-fun e!127491 () Bool)

(assert (=> b!183982 (=> res!153031 e!127491)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!283009 () (_ BitVec 64))

(declare-fun lt!283019 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!183982 (= res!153031 (or (not (= (size!4308 (buf!4763 (_2!8595 lt!283014))) (size!4308 (buf!4763 thiss!1204)))) (not (= lt!283009 (bvsub (bvadd lt!283019 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183983 () Bool)

(declare-fun res!153024 () Bool)

(declare-fun e!127496 () Bool)

(assert (=> b!183983 (=> (not res!153024) (not e!127496))))

(assert (=> b!183983 (= res!153024 (invariant!0 (currentBit!8992 thiss!1204) (currentByte!8997 thiss!1204) (size!4308 (buf!4763 thiss!1204))))))

(declare-fun b!183984 () Bool)

(declare-fun e!127493 () Bool)

(declare-fun e!127492 () Bool)

(assert (=> b!183984 (= e!127493 e!127492)))

(declare-fun res!153029 () Bool)

(assert (=> b!183984 (=> (not res!153029) (not e!127492))))

(declare-fun lt!283026 () (_ BitVec 64))

(declare-fun lt!283012 () (_ BitVec 64))

(assert (=> b!183984 (= res!153029 (= lt!283026 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283012)))))

(declare-fun lt!283013 () tuple2!15900)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183984 (= lt!283026 (bitIndex!0 (size!4308 (buf!4763 (_2!8595 lt!283013))) (currentByte!8997 (_2!8595 lt!283013)) (currentBit!8992 (_2!8595 lt!283013))))))

(assert (=> b!183984 (= lt!283012 (bitIndex!0 (size!4308 (buf!4763 thiss!1204)) (currentByte!8997 thiss!1204) (currentBit!8992 thiss!1204)))))

(declare-fun b!183985 () Bool)

(declare-fun res!153030 () Bool)

(assert (=> b!183985 (=> res!153030 e!127491)))

(declare-fun isPrefixOf!0 (BitStream!7724 BitStream!7724) Bool)

(assert (=> b!183985 (= res!153030 (not (isPrefixOf!0 (_2!8595 lt!283013) (_2!8595 lt!283014))))))

(declare-fun b!183986 () Bool)

(declare-fun e!127487 () Bool)

(assert (=> b!183986 (= e!127487 e!127491)))

(declare-fun res!153016 () Bool)

(assert (=> b!183986 (=> res!153016 e!127491)))

(declare-fun lt!283027 () (_ BitVec 64))

(assert (=> b!183986 (= res!153016 (not (= lt!283009 (bvsub (bvsub (bvadd lt!283027 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183986 (= lt!283009 (bitIndex!0 (size!4308 (buf!4763 (_2!8595 lt!283014))) (currentByte!8997 (_2!8595 lt!283014)) (currentBit!8992 (_2!8595 lt!283014))))))

(assert (=> b!183986 (isPrefixOf!0 thiss!1204 (_2!8595 lt!283014))))

(declare-fun lt!283010 () Unit!13191)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7724 BitStream!7724 BitStream!7724) Unit!13191)

(assert (=> b!183986 (= lt!283010 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8595 lt!283013) (_2!8595 lt!283014)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15900)

(assert (=> b!183986 (= lt!283014 (appendBitsLSBFirstLoopTR!0 (_2!8595 lt!283013) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183987 () Bool)

(declare-fun e!127494 () Bool)

(assert (=> b!183987 (= e!127494 e!127496)))

(declare-fun res!153027 () Bool)

(assert (=> b!183987 (=> (not res!153027) (not e!127496))))

(declare-fun lt!283018 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183987 (= res!153027 (validate_offset_bits!1 ((_ sign_extend 32) (size!4308 (buf!4763 thiss!1204))) ((_ sign_extend 32) (currentByte!8997 thiss!1204)) ((_ sign_extend 32) (currentBit!8992 thiss!1204)) lt!283018))))

(assert (=> b!183987 (= lt!283018 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183988 () Bool)

(declare-fun res!153028 () Bool)

(declare-fun e!127489 () Bool)

(assert (=> b!183988 (=> res!153028 e!127489)))

(declare-fun lt!283031 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183988 (= res!153028 (not (= (bvand lt!283031 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183989 () Bool)

(declare-fun e!127495 () Bool)

(declare-fun array_inv!4049 (array!9768) Bool)

(assert (=> b!183989 (= e!127495 (array_inv!4049 (buf!4763 thiss!1204)))))

(declare-fun b!183990 () Bool)

(declare-fun res!153021 () Bool)

(assert (=> b!183990 (=> res!153021 e!127489)))

(assert (=> b!183990 (= res!153021 (bvsge i!590 nBits!348))))

(declare-fun b!183991 () Bool)

(declare-fun res!153026 () Bool)

(assert (=> b!183991 (=> res!153026 e!127491)))

(assert (=> b!183991 (= res!153026 (not (isPrefixOf!0 thiss!1204 (_2!8595 lt!283013))))))

(declare-fun b!183992 () Bool)

(declare-fun e!127490 () Bool)

(declare-datatypes ((tuple2!15902 0))(
  ( (tuple2!15903 (_1!8596 BitStream!7724) (_2!8596 Bool)) )
))
(declare-fun lt!283021 () tuple2!15902)

(declare-fun lt!283022 () tuple2!15902)

(assert (=> b!183992 (= e!127490 (= (_2!8596 lt!283021) (_2!8596 lt!283022)))))

(declare-fun res!153013 () Bool)

(assert (=> start!40200 (=> (not res!153013) (not e!127494))))

(assert (=> start!40200 (= res!153013 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40200 e!127494))

(assert (=> start!40200 true))

(declare-fun inv!12 (BitStream!7724) Bool)

(assert (=> start!40200 (and (inv!12 thiss!1204) e!127495)))

(declare-fun b!183993 () Bool)

(assert (=> b!183993 (= e!127491 e!127489)))

(declare-fun res!153019 () Bool)

(assert (=> b!183993 (=> res!153019 e!127489)))

(declare-fun lt!283015 () (_ BitVec 64))

(declare-datatypes ((tuple2!15904 0))(
  ( (tuple2!15905 (_1!8597 BitStream!7724) (_2!8597 BitStream!7724)) )
))
(declare-fun lt!283033 () tuple2!15904)

(declare-datatypes ((tuple2!15906 0))(
  ( (tuple2!15907 (_1!8598 BitStream!7724) (_2!8598 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15906)

(assert (=> b!183993 (= res!153019 (not (= (_1!8598 (readNBitsLSBFirstsLoopPure!0 (_1!8597 lt!283033) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283015)) (_2!8597 lt!283033))))))

(declare-fun lt!283016 () (_ BitVec 64))

(assert (=> b!183993 (validate_offset_bits!1 ((_ sign_extend 32) (size!4308 (buf!4763 (_2!8595 lt!283014)))) ((_ sign_extend 32) (currentByte!8997 (_2!8595 lt!283013))) ((_ sign_extend 32) (currentBit!8992 (_2!8595 lt!283013))) lt!283016)))

(declare-fun lt!283030 () Unit!13191)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7724 array!9768 (_ BitVec 64)) Unit!13191)

(assert (=> b!183993 (= lt!283030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8595 lt!283013) (buf!4763 (_2!8595 lt!283014)) lt!283016))))

(assert (=> b!183993 (= lt!283016 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283024 () (_ BitVec 64))

(declare-fun lt!283023 () tuple2!15902)

(assert (=> b!183993 (= lt!283015 (bvor lt!283031 (ite (_2!8596 lt!283023) lt!283024 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283032 () tuple2!15904)

(declare-fun lt!283011 () tuple2!15906)

(assert (=> b!183993 (= lt!283011 (readNBitsLSBFirstsLoopPure!0 (_1!8597 lt!283032) nBits!348 i!590 lt!283031))))

(assert (=> b!183993 (validate_offset_bits!1 ((_ sign_extend 32) (size!4308 (buf!4763 (_2!8595 lt!283014)))) ((_ sign_extend 32) (currentByte!8997 thiss!1204)) ((_ sign_extend 32) (currentBit!8992 thiss!1204)) lt!283018)))

(declare-fun lt!283017 () Unit!13191)

(assert (=> b!183993 (= lt!283017 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4763 (_2!8595 lt!283014)) lt!283018))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183993 (= lt!283031 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!283029 () Bool)

(assert (=> b!183993 (= (_2!8596 lt!283023) lt!283029)))

(declare-fun readBitPure!0 (BitStream!7724) tuple2!15902)

(assert (=> b!183993 (= lt!283023 (readBitPure!0 (_1!8597 lt!283032)))))

(declare-fun reader!0 (BitStream!7724 BitStream!7724) tuple2!15904)

(assert (=> b!183993 (= lt!283033 (reader!0 (_2!8595 lt!283013) (_2!8595 lt!283014)))))

(assert (=> b!183993 (= lt!283032 (reader!0 thiss!1204 (_2!8595 lt!283014)))))

(assert (=> b!183993 e!127490))

(declare-fun res!153033 () Bool)

(assert (=> b!183993 (=> (not res!153033) (not e!127490))))

(assert (=> b!183993 (= res!153033 (= (bitIndex!0 (size!4308 (buf!4763 (_1!8596 lt!283021))) (currentByte!8997 (_1!8596 lt!283021)) (currentBit!8992 (_1!8596 lt!283021))) (bitIndex!0 (size!4308 (buf!4763 (_1!8596 lt!283022))) (currentByte!8997 (_1!8596 lt!283022)) (currentBit!8992 (_1!8596 lt!283022)))))))

(declare-fun lt!283020 () Unit!13191)

(declare-fun lt!283028 () BitStream!7724)

(declare-fun readBitPrefixLemma!0 (BitStream!7724 BitStream!7724) Unit!13191)

(assert (=> b!183993 (= lt!283020 (readBitPrefixLemma!0 lt!283028 (_2!8595 lt!283014)))))

(assert (=> b!183993 (= lt!283022 (readBitPure!0 (BitStream!7725 (buf!4763 (_2!8595 lt!283014)) (currentByte!8997 thiss!1204) (currentBit!8992 thiss!1204))))))

(assert (=> b!183993 (= lt!283021 (readBitPure!0 lt!283028))))

(assert (=> b!183993 e!127488))

(declare-fun res!153032 () Bool)

(assert (=> b!183993 (=> (not res!153032) (not e!127488))))

(assert (=> b!183993 (= res!153032 (invariant!0 (currentBit!8992 thiss!1204) (currentByte!8997 thiss!1204) (size!4308 (buf!4763 (_2!8595 lt!283013)))))))

(assert (=> b!183993 (= lt!283028 (BitStream!7725 (buf!4763 (_2!8595 lt!283013)) (currentByte!8997 thiss!1204) (currentBit!8992 thiss!1204)))))

(declare-fun b!183994 () Bool)

(declare-fun res!153023 () Bool)

(assert (=> b!183994 (=> res!153023 e!127489)))

(assert (=> b!183994 (= res!153023 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4308 (buf!4763 (_1!8597 lt!283032)))) ((_ sign_extend 32) (currentByte!8997 (_1!8597 lt!283032))) ((_ sign_extend 32) (currentBit!8992 (_1!8597 lt!283032))) lt!283018)))))

(declare-fun b!183995 () Bool)

(assert (=> b!183995 (= e!127496 (not e!127487))))

(declare-fun res!153015 () Bool)

(assert (=> b!183995 (=> res!153015 e!127487)))

(assert (=> b!183995 (= res!153015 (not (= lt!283027 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283019))))))

(assert (=> b!183995 (= lt!283027 (bitIndex!0 (size!4308 (buf!4763 (_2!8595 lt!283013))) (currentByte!8997 (_2!8595 lt!283013)) (currentBit!8992 (_2!8595 lt!283013))))))

(assert (=> b!183995 (= lt!283019 (bitIndex!0 (size!4308 (buf!4763 thiss!1204)) (currentByte!8997 thiss!1204) (currentBit!8992 thiss!1204)))))

(assert (=> b!183995 e!127493))

(declare-fun res!153018 () Bool)

(assert (=> b!183995 (=> (not res!153018) (not e!127493))))

(assert (=> b!183995 (= res!153018 (= (size!4308 (buf!4763 thiss!1204)) (size!4308 (buf!4763 (_2!8595 lt!283013)))))))

(declare-fun appendBit!0 (BitStream!7724 Bool) tuple2!15900)

(assert (=> b!183995 (= lt!283013 (appendBit!0 thiss!1204 lt!283029))))

(assert (=> b!183995 (= lt!283029 (not (= (bvand v!189 lt!283024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183995 (= lt!283024 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183996 () Bool)

(declare-fun res!153025 () Bool)

(assert (=> b!183996 (=> res!153025 e!127491)))

(assert (=> b!183996 (= res!153025 (not (invariant!0 (currentBit!8992 (_2!8595 lt!283014)) (currentByte!8997 (_2!8595 lt!283014)) (size!4308 (buf!4763 (_2!8595 lt!283014))))))))

(declare-fun b!183997 () Bool)

(declare-fun res!153017 () Bool)

(assert (=> b!183997 (=> (not res!153017) (not e!127496))))

(assert (=> b!183997 (= res!153017 (not (= i!590 nBits!348)))))

(declare-fun b!183998 () Bool)

(declare-fun res!153014 () Bool)

(assert (=> b!183998 (=> (not res!153014) (not e!127492))))

(assert (=> b!183998 (= res!153014 (isPrefixOf!0 thiss!1204 (_2!8595 lt!283013)))))

(declare-fun b!183999 () Bool)

(assert (=> b!183999 (= e!127489 true)))

(declare-fun lt!283025 () tuple2!15906)

(declare-fun withMovedBitIndex!0 (BitStream!7724 (_ BitVec 64)) BitStream!7724)

(assert (=> b!183999 (= lt!283025 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8597 lt!283032) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283015))))

(declare-fun b!184000 () Bool)

(declare-fun e!127498 () Bool)

(assert (=> b!184000 (= e!127492 e!127498)))

(declare-fun res!153022 () Bool)

(assert (=> b!184000 (=> (not res!153022) (not e!127498))))

(declare-fun lt!283034 () tuple2!15902)

(assert (=> b!184000 (= res!153022 (and (= (_2!8596 lt!283034) lt!283029) (= (_1!8596 lt!283034) (_2!8595 lt!283013))))))

(declare-fun readerFrom!0 (BitStream!7724 (_ BitVec 32) (_ BitVec 32)) BitStream!7724)

(assert (=> b!184000 (= lt!283034 (readBitPure!0 (readerFrom!0 (_2!8595 lt!283013) (currentBit!8992 thiss!1204) (currentByte!8997 thiss!1204))))))

(declare-fun b!184001 () Bool)

(assert (=> b!184001 (= e!127498 (= (bitIndex!0 (size!4308 (buf!4763 (_1!8596 lt!283034))) (currentByte!8997 (_1!8596 lt!283034)) (currentBit!8992 (_1!8596 lt!283034))) lt!283026))))

(declare-fun b!184002 () Bool)

(declare-fun res!153020 () Bool)

(assert (=> b!184002 (=> res!153020 e!127489)))

(assert (=> b!184002 (= res!153020 (not (= (bvand lt!283031 #b1111111111111111111111111111111111111111111111111111111111111111) lt!283031)))))

(assert (= (and start!40200 res!153013) b!183987))

(assert (= (and b!183987 res!153027) b!183983))

(assert (= (and b!183983 res!153024) b!183997))

(assert (= (and b!183997 res!153017) b!183995))

(assert (= (and b!183995 res!153018) b!183984))

(assert (= (and b!183984 res!153029) b!183998))

(assert (= (and b!183998 res!153014) b!184000))

(assert (= (and b!184000 res!153022) b!184001))

(assert (= (and b!183995 (not res!153015)) b!183986))

(assert (= (and b!183986 (not res!153016)) b!183996))

(assert (= (and b!183996 (not res!153025)) b!183982))

(assert (= (and b!183982 (not res!153031)) b!183985))

(assert (= (and b!183985 (not res!153030)) b!183991))

(assert (= (and b!183991 (not res!153026)) b!183993))

(assert (= (and b!183993 res!153032) b!183981))

(assert (= (and b!183993 res!153033) b!183992))

(assert (= (and b!183993 (not res!153019)) b!183990))

(assert (= (and b!183990 (not res!153021)) b!183994))

(assert (= (and b!183994 (not res!153023)) b!183988))

(assert (= (and b!183988 (not res!153028)) b!184002))

(assert (= (and b!184002 (not res!153020)) b!183999))

(assert (= start!40200 b!183989))

(declare-fun m!285981 () Bool)

(assert (=> b!183985 m!285981))

(declare-fun m!285983 () Bool)

(assert (=> b!183986 m!285983))

(declare-fun m!285985 () Bool)

(assert (=> b!183986 m!285985))

(declare-fun m!285987 () Bool)

(assert (=> b!183986 m!285987))

(declare-fun m!285989 () Bool)

(assert (=> b!183986 m!285989))

(declare-fun m!285991 () Bool)

(assert (=> b!183993 m!285991))

(declare-fun m!285993 () Bool)

(assert (=> b!183993 m!285993))

(declare-fun m!285995 () Bool)

(assert (=> b!183993 m!285995))

(declare-fun m!285997 () Bool)

(assert (=> b!183993 m!285997))

(declare-fun m!285999 () Bool)

(assert (=> b!183993 m!285999))

(declare-fun m!286001 () Bool)

(assert (=> b!183993 m!286001))

(declare-fun m!286003 () Bool)

(assert (=> b!183993 m!286003))

(declare-fun m!286005 () Bool)

(assert (=> b!183993 m!286005))

(declare-fun m!286007 () Bool)

(assert (=> b!183993 m!286007))

(declare-fun m!286009 () Bool)

(assert (=> b!183993 m!286009))

(declare-fun m!286011 () Bool)

(assert (=> b!183993 m!286011))

(declare-fun m!286013 () Bool)

(assert (=> b!183993 m!286013))

(declare-fun m!286015 () Bool)

(assert (=> b!183993 m!286015))

(declare-fun m!286017 () Bool)

(assert (=> b!183993 m!286017))

(declare-fun m!286019 () Bool)

(assert (=> b!183993 m!286019))

(declare-fun m!286021 () Bool)

(assert (=> b!183993 m!286021))

(declare-fun m!286023 () Bool)

(assert (=> b!183996 m!286023))

(declare-fun m!286025 () Bool)

(assert (=> b!183984 m!286025))

(declare-fun m!286027 () Bool)

(assert (=> b!183984 m!286027))

(declare-fun m!286029 () Bool)

(assert (=> b!183994 m!286029))

(declare-fun m!286031 () Bool)

(assert (=> b!183987 m!286031))

(declare-fun m!286033 () Bool)

(assert (=> b!184000 m!286033))

(assert (=> b!184000 m!286033))

(declare-fun m!286035 () Bool)

(assert (=> b!184000 m!286035))

(declare-fun m!286037 () Bool)

(assert (=> b!184001 m!286037))

(declare-fun m!286039 () Bool)

(assert (=> start!40200 m!286039))

(declare-fun m!286041 () Bool)

(assert (=> b!183983 m!286041))

(declare-fun m!286043 () Bool)

(assert (=> b!183998 m!286043))

(assert (=> b!183995 m!286025))

(assert (=> b!183995 m!286027))

(declare-fun m!286045 () Bool)

(assert (=> b!183995 m!286045))

(assert (=> b!183991 m!286043))

(declare-fun m!286047 () Bool)

(assert (=> b!183999 m!286047))

(assert (=> b!183999 m!286047))

(declare-fun m!286049 () Bool)

(assert (=> b!183999 m!286049))

(declare-fun m!286051 () Bool)

(assert (=> b!183988 m!286051))

(declare-fun m!286053 () Bool)

(assert (=> b!183989 m!286053))

(declare-fun m!286055 () Bool)

(assert (=> b!183981 m!286055))

(push 1)

(assert (not b!183984))

(assert (not b!183999))

(assert (not b!183988))

(assert (not b!183985))

(assert (not b!183986))

(assert (not b!183995))

(assert (not b!183993))

(assert (not b!183989))

(assert (not b!183981))

(assert (not b!184000))

(assert (not b!184001))

(assert (not b!183983))

(assert (not b!183991))

(assert (not b!183994))

(assert (not start!40200))

(assert (not b!183987))

(assert (not b!183996))

(assert (not b!183998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

