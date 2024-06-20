; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44570 () Bool)

(assert start!44570)

(declare-fun b!213028 () Bool)

(declare-fun e!145155 () Bool)

(declare-datatypes ((array!10543 0))(
  ( (array!10544 (arr!5561 (Array (_ BitVec 32) (_ BitVec 8))) (size!4631 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8370 0))(
  ( (BitStream!8371 (buf!5160 array!10543) (currentByte!9726 (_ BitVec 32)) (currentBit!9721 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8370)

(declare-datatypes ((Unit!15168 0))(
  ( (Unit!15169) )
))
(declare-datatypes ((tuple2!18250 0))(
  ( (tuple2!18251 (_1!9780 Unit!15168) (_2!9780 BitStream!8370)) )
))
(declare-fun lt!335825 () tuple2!18250)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!213028 (= e!145155 (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335825)))))))

(declare-fun b!213029 () Bool)

(declare-fun res!179026 () Bool)

(declare-fun e!145151 () Bool)

(assert (=> b!213029 (=> (not res!179026) (not e!145151))))

(declare-datatypes ((tuple2!18252 0))(
  ( (tuple2!18253 (_1!9781 BitStream!8370) (_2!9781 BitStream!8370)) )
))
(declare-fun lt!335833 () tuple2!18252)

(declare-fun lt!335847 () (_ BitVec 64))

(declare-fun lt!335832 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8370 (_ BitVec 64)) BitStream!8370)

(assert (=> b!213029 (= res!179026 (= (_1!9781 lt!335833) (withMovedBitIndex!0 (_2!9781 lt!335833) (bvsub lt!335832 lt!335847))))))

(declare-fun b!213030 () Bool)

(declare-fun e!145153 () Bool)

(declare-fun e!145141 () Bool)

(assert (=> b!213030 (= e!145153 e!145141)))

(declare-fun res!179022 () Bool)

(assert (=> b!213030 (=> (not res!179022) (not e!145141))))

(declare-fun lt!335849 () Bool)

(declare-fun lt!335851 () tuple2!18250)

(declare-datatypes ((tuple2!18254 0))(
  ( (tuple2!18255 (_1!9782 BitStream!8370) (_2!9782 Bool)) )
))
(declare-fun lt!335826 () tuple2!18254)

(assert (=> b!213030 (= res!179022 (and (= (_2!9782 lt!335826) lt!335849) (= (_1!9782 lt!335826) (_2!9780 lt!335851))))))

(declare-fun readBitPure!0 (BitStream!8370) tuple2!18254)

(declare-fun readerFrom!0 (BitStream!8370 (_ BitVec 32) (_ BitVec 32)) BitStream!8370)

(assert (=> b!213030 (= lt!335826 (readBitPure!0 (readerFrom!0 (_2!9780 lt!335851) (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204))))))

(declare-fun b!213031 () Bool)

(declare-fun e!145145 () Bool)

(declare-fun e!145147 () Bool)

(assert (=> b!213031 (= e!145145 (not e!145147))))

(declare-fun res!179025 () Bool)

(assert (=> b!213031 (=> res!179025 e!145147)))

(declare-fun lt!335835 () (_ BitVec 64))

(assert (=> b!213031 (= res!179025 (not (= lt!335832 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335835))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213031 (= lt!335832 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(assert (=> b!213031 (= lt!335835 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun e!145144 () Bool)

(assert (=> b!213031 e!145144))

(declare-fun res!179019 () Bool)

(assert (=> b!213031 (=> (not res!179019) (not e!145144))))

(assert (=> b!213031 (= res!179019 (= (size!4631 (buf!5160 thiss!1204)) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(declare-fun appendBit!0 (BitStream!8370 Bool) tuple2!18250)

(assert (=> b!213031 (= lt!335851 (appendBit!0 thiss!1204 lt!335849))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!335834 () (_ BitVec 64))

(assert (=> b!213031 (= lt!335849 (not (= (bvand v!189 lt!335834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!213031 (= lt!335834 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!213032 () Bool)

(declare-fun lt!335846 () (_ BitVec 64))

(assert (=> b!213032 (= e!145141 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!335826))) (currentByte!9726 (_1!9782 lt!335826)) (currentBit!9721 (_1!9782 lt!335826))) lt!335846))))

(declare-datatypes ((tuple2!18256 0))(
  ( (tuple2!18257 (_1!9783 BitStream!8370) (_2!9783 (_ BitVec 64))) )
))
(declare-fun lt!335836 () tuple2!18256)

(declare-fun b!213033 () Bool)

(declare-fun lt!335844 () BitStream!8370)

(declare-fun lt!335822 () tuple2!18256)

(assert (=> b!213033 (= e!145151 (and (= lt!335835 (bvsub lt!335832 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9781 lt!335833) lt!335844)) (= (_2!9783 lt!335836) (_2!9783 lt!335822)))))))

(declare-fun b!213034 () Bool)

(declare-fun e!145154 () Bool)

(assert (=> b!213034 (= e!145154 e!145145)))

(declare-fun res!179017 () Bool)

(assert (=> b!213034 (=> (not res!179017) (not e!145145))))

(declare-fun lt!335852 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213034 (= res!179017 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204)) lt!335852))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!213034 (= lt!335852 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!213035 () Bool)

(declare-fun res!179013 () Bool)

(declare-fun e!145142 () Bool)

(assert (=> b!213035 (=> res!179013 e!145142)))

(assert (=> b!213035 (= res!179013 (not (= (size!4631 (buf!5160 (_2!9780 lt!335825))) (size!4631 (buf!5160 thiss!1204)))))))

(declare-fun b!213036 () Bool)

(declare-fun res!179015 () Bool)

(assert (=> b!213036 (=> (not res!179015) (not e!145145))))

(assert (=> b!213036 (= res!179015 (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 thiss!1204))))))

(declare-fun res!179016 () Bool)

(assert (=> start!44570 (=> (not res!179016) (not e!145154))))

(assert (=> start!44570 (= res!179016 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44570 e!145154))

(assert (=> start!44570 true))

(declare-fun e!145152 () Bool)

(declare-fun inv!12 (BitStream!8370) Bool)

(assert (=> start!44570 (and (inv!12 thiss!1204) e!145152)))

(declare-fun b!213037 () Bool)

(declare-fun res!179023 () Bool)

(assert (=> b!213037 (=> res!179023 e!145142)))

(assert (=> b!213037 (= res!179023 (not (invariant!0 (currentBit!9721 (_2!9780 lt!335825)) (currentByte!9726 (_2!9780 lt!335825)) (size!4631 (buf!5160 (_2!9780 lt!335825))))))))

(declare-fun b!213038 () Bool)

(declare-fun e!145146 () Bool)

(declare-fun e!145148 () Bool)

(assert (=> b!213038 (= e!145146 e!145148)))

(declare-fun res!179031 () Bool)

(assert (=> b!213038 (=> res!179031 e!145148)))

(assert (=> b!213038 (= res!179031 (not (= (_1!9781 lt!335833) lt!335844)))))

(assert (=> b!213038 e!145151))

(declare-fun res!179029 () Bool)

(assert (=> b!213038 (=> (not res!179029) (not e!145151))))

(declare-fun lt!335843 () tuple2!18256)

(assert (=> b!213038 (= res!179029 (and (= (_2!9783 lt!335836) (_2!9783 lt!335843)) (= (_1!9783 lt!335836) (_1!9783 lt!335843))))))

(declare-fun lt!335842 () tuple2!18252)

(declare-fun lt!335837 () Unit!15168)

(declare-fun lt!335829 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15168)

(assert (=> b!213038 (= lt!335837 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9781 lt!335842) nBits!348 i!590 lt!335829))))

(declare-fun lt!335839 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18256)

(assert (=> b!213038 (= lt!335843 (readNBitsLSBFirstsLoopPure!0 lt!335844 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335839))))

(assert (=> b!213038 (= lt!335844 (withMovedBitIndex!0 (_1!9781 lt!335842) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!335850 () (_ BitVec 64))

(declare-fun lt!335841 () (_ BitVec 64))

(declare-fun b!213039 () Bool)

(assert (=> b!213039 (= e!145148 (or (not (= lt!335850 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!335850 (bvand lt!335841 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213039 (= lt!335850 (bvand lt!335835 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!213039 (= (size!4631 (buf!5160 thiss!1204)) (size!4631 (buf!5160 (_2!9780 lt!335825))))))

(declare-fun b!213040 () Bool)

(declare-fun e!145149 () Bool)

(assert (=> b!213040 (= e!145149 e!145146)))

(declare-fun res!179014 () Bool)

(assert (=> b!213040 (=> res!179014 e!145146)))

(assert (=> b!213040 (= res!179014 (not (= (_1!9783 lt!335822) (_2!9781 lt!335833))))))

(assert (=> b!213040 (= lt!335822 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!335833) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335839))))

(declare-fun lt!335824 () (_ BitVec 64))

(assert (=> b!213040 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!335824)))

(declare-fun lt!335830 () Unit!15168)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8370 array!10543 (_ BitVec 64)) Unit!15168)

(assert (=> b!213040 (= lt!335830 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9780 lt!335851) (buf!5160 (_2!9780 lt!335825)) lt!335824))))

(assert (=> b!213040 (= lt!335824 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!335823 () tuple2!18254)

(assert (=> b!213040 (= lt!335839 (bvor lt!335829 (ite (_2!9782 lt!335823) lt!335834 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213040 (= lt!335836 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!335842) nBits!348 i!590 lt!335829))))

(assert (=> b!213040 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204)) lt!335852)))

(declare-fun lt!335828 () Unit!15168)

(assert (=> b!213040 (= lt!335828 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5160 (_2!9780 lt!335825)) lt!335852))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213040 (= lt!335829 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!213040 (= (_2!9782 lt!335823) lt!335849)))

(assert (=> b!213040 (= lt!335823 (readBitPure!0 (_1!9781 lt!335842)))))

(declare-fun reader!0 (BitStream!8370 BitStream!8370) tuple2!18252)

(assert (=> b!213040 (= lt!335833 (reader!0 (_2!9780 lt!335851) (_2!9780 lt!335825)))))

(assert (=> b!213040 (= lt!335842 (reader!0 thiss!1204 (_2!9780 lt!335825)))))

(declare-fun e!145143 () Bool)

(assert (=> b!213040 e!145143))

(declare-fun res!179011 () Bool)

(assert (=> b!213040 (=> (not res!179011) (not e!145143))))

(declare-fun lt!335827 () tuple2!18254)

(declare-fun lt!335840 () tuple2!18254)

(assert (=> b!213040 (= res!179011 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!335827))) (currentByte!9726 (_1!9782 lt!335827)) (currentBit!9721 (_1!9782 lt!335827))) (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!335840))) (currentByte!9726 (_1!9782 lt!335840)) (currentBit!9721 (_1!9782 lt!335840)))))))

(declare-fun lt!335831 () Unit!15168)

(declare-fun lt!335838 () BitStream!8370)

(declare-fun readBitPrefixLemma!0 (BitStream!8370 BitStream!8370) Unit!15168)

(assert (=> b!213040 (= lt!335831 (readBitPrefixLemma!0 lt!335838 (_2!9780 lt!335825)))))

(assert (=> b!213040 (= lt!335840 (readBitPure!0 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204))))))

(assert (=> b!213040 (= lt!335827 (readBitPure!0 lt!335838))))

(assert (=> b!213040 e!145155))

(declare-fun res!179028 () Bool)

(assert (=> b!213040 (=> (not res!179028) (not e!145155))))

(assert (=> b!213040 (= res!179028 (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(assert (=> b!213040 (= lt!335838 (BitStream!8371 (buf!5160 (_2!9780 lt!335851)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun b!213041 () Bool)

(declare-fun res!179030 () Bool)

(assert (=> b!213041 (=> res!179030 e!145149)))

(declare-fun isPrefixOf!0 (BitStream!8370 BitStream!8370) Bool)

(assert (=> b!213041 (= res!179030 (not (isPrefixOf!0 thiss!1204 (_2!9780 lt!335851))))))

(declare-fun b!213042 () Bool)

(declare-fun res!179033 () Bool)

(assert (=> b!213042 (=> (not res!179033) (not e!145153))))

(assert (=> b!213042 (= res!179033 (isPrefixOf!0 thiss!1204 (_2!9780 lt!335851)))))

(declare-fun b!213043 () Bool)

(assert (=> b!213043 (= e!145142 e!145149)))

(declare-fun res!179020 () Bool)

(assert (=> b!213043 (=> res!179020 e!145149)))

(assert (=> b!213043 (= res!179020 (not (= lt!335847 (bvsub lt!335841 ((_ sign_extend 32) i!590)))))))

(assert (=> b!213043 (= lt!335841 (bvadd lt!335835 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!213044 () Bool)

(declare-fun res!179021 () Bool)

(assert (=> b!213044 (=> res!179021 e!145149)))

(assert (=> b!213044 (= res!179021 (not (isPrefixOf!0 (_2!9780 lt!335851) (_2!9780 lt!335825))))))

(declare-fun b!213045 () Bool)

(declare-fun res!179032 () Bool)

(assert (=> b!213045 (=> (not res!179032) (not e!145145))))

(assert (=> b!213045 (= res!179032 (not (= i!590 nBits!348)))))

(declare-fun b!213046 () Bool)

(declare-fun array_inv!4372 (array!10543) Bool)

(assert (=> b!213046 (= e!145152 (array_inv!4372 (buf!5160 thiss!1204)))))

(declare-fun b!213047 () Bool)

(assert (=> b!213047 (= e!145143 (= (_2!9782 lt!335827) (_2!9782 lt!335840)))))

(declare-fun b!213048 () Bool)

(assert (=> b!213048 (= e!145144 e!145153)))

(declare-fun res!179024 () Bool)

(assert (=> b!213048 (=> (not res!179024) (not e!145153))))

(declare-fun lt!335845 () (_ BitVec 64))

(assert (=> b!213048 (= res!179024 (= lt!335846 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335845)))))

(assert (=> b!213048 (= lt!335846 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(assert (=> b!213048 (= lt!335845 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun b!213049 () Bool)

(declare-fun res!179018 () Bool)

(assert (=> b!213049 (=> (not res!179018) (not e!145151))))

(assert (=> b!213049 (= res!179018 (= (_1!9781 lt!335842) (withMovedBitIndex!0 (_2!9781 lt!335842) (bvsub lt!335835 lt!335847))))))

(declare-fun b!213050 () Bool)

(declare-fun res!179027 () Bool)

(assert (=> b!213050 (=> res!179027 e!145148)))

(assert (=> b!213050 (= res!179027 (not (= (bitIndex!0 (size!4631 (buf!5160 (_1!9783 lt!335836))) (currentByte!9726 (_1!9783 lt!335836)) (currentBit!9721 (_1!9783 lt!335836))) (bitIndex!0 (size!4631 (buf!5160 (_2!9781 lt!335842))) (currentByte!9726 (_2!9781 lt!335842)) (currentBit!9721 (_2!9781 lt!335842))))))))

(declare-fun b!213051 () Bool)

(assert (=> b!213051 (= e!145147 e!145142)))

(declare-fun res!179012 () Bool)

(assert (=> b!213051 (=> res!179012 e!145142)))

(assert (=> b!213051 (= res!179012 (not (= lt!335847 (bvsub (bvsub (bvadd lt!335832 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!213051 (= lt!335847 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335825))) (currentByte!9726 (_2!9780 lt!335825)) (currentBit!9721 (_2!9780 lt!335825))))))

(assert (=> b!213051 (isPrefixOf!0 thiss!1204 (_2!9780 lt!335825))))

(declare-fun lt!335848 () Unit!15168)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8370 BitStream!8370 BitStream!8370) Unit!15168)

(assert (=> b!213051 (= lt!335848 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9780 lt!335851) (_2!9780 lt!335825)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18250)

(assert (=> b!213051 (= lt!335825 (appendBitsLSBFirstLoopTR!0 (_2!9780 lt!335851) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!44570 res!179016) b!213034))

(assert (= (and b!213034 res!179017) b!213036))

(assert (= (and b!213036 res!179015) b!213045))

(assert (= (and b!213045 res!179032) b!213031))

(assert (= (and b!213031 res!179019) b!213048))

(assert (= (and b!213048 res!179024) b!213042))

(assert (= (and b!213042 res!179033) b!213030))

(assert (= (and b!213030 res!179022) b!213032))

(assert (= (and b!213031 (not res!179025)) b!213051))

(assert (= (and b!213051 (not res!179012)) b!213037))

(assert (= (and b!213037 (not res!179023)) b!213035))

(assert (= (and b!213035 (not res!179013)) b!213043))

(assert (= (and b!213043 (not res!179020)) b!213044))

(assert (= (and b!213044 (not res!179021)) b!213041))

(assert (= (and b!213041 (not res!179030)) b!213040))

(assert (= (and b!213040 res!179028) b!213028))

(assert (= (and b!213040 res!179011) b!213047))

(assert (= (and b!213040 (not res!179014)) b!213038))

(assert (= (and b!213038 res!179029) b!213049))

(assert (= (and b!213049 res!179018) b!213029))

(assert (= (and b!213029 res!179026) b!213033))

(assert (= (and b!213038 (not res!179031)) b!213050))

(assert (= (and b!213050 (not res!179027)) b!213039))

(assert (= start!44570 b!213046))

(declare-fun m!328201 () Bool)

(assert (=> b!213029 m!328201))

(declare-fun m!328203 () Bool)

(assert (=> b!213028 m!328203))

(declare-fun m!328205 () Bool)

(assert (=> b!213050 m!328205))

(declare-fun m!328207 () Bool)

(assert (=> b!213050 m!328207))

(declare-fun m!328209 () Bool)

(assert (=> b!213044 m!328209))

(declare-fun m!328211 () Bool)

(assert (=> b!213046 m!328211))

(declare-fun m!328213 () Bool)

(assert (=> b!213030 m!328213))

(assert (=> b!213030 m!328213))

(declare-fun m!328215 () Bool)

(assert (=> b!213030 m!328215))

(declare-fun m!328217 () Bool)

(assert (=> b!213036 m!328217))

(declare-fun m!328219 () Bool)

(assert (=> b!213032 m!328219))

(declare-fun m!328221 () Bool)

(assert (=> b!213038 m!328221))

(declare-fun m!328223 () Bool)

(assert (=> b!213038 m!328223))

(declare-fun m!328225 () Bool)

(assert (=> b!213038 m!328225))

(declare-fun m!328227 () Bool)

(assert (=> b!213034 m!328227))

(declare-fun m!328229 () Bool)

(assert (=> b!213049 m!328229))

(declare-fun m!328231 () Bool)

(assert (=> b!213041 m!328231))

(declare-fun m!328233 () Bool)

(assert (=> b!213031 m!328233))

(declare-fun m!328235 () Bool)

(assert (=> b!213031 m!328235))

(declare-fun m!328237 () Bool)

(assert (=> b!213031 m!328237))

(declare-fun m!328239 () Bool)

(assert (=> b!213051 m!328239))

(declare-fun m!328241 () Bool)

(assert (=> b!213051 m!328241))

(declare-fun m!328243 () Bool)

(assert (=> b!213051 m!328243))

(declare-fun m!328245 () Bool)

(assert (=> b!213051 m!328245))

(declare-fun m!328247 () Bool)

(assert (=> b!213040 m!328247))

(declare-fun m!328249 () Bool)

(assert (=> b!213040 m!328249))

(declare-fun m!328251 () Bool)

(assert (=> b!213040 m!328251))

(declare-fun m!328253 () Bool)

(assert (=> b!213040 m!328253))

(declare-fun m!328255 () Bool)

(assert (=> b!213040 m!328255))

(declare-fun m!328257 () Bool)

(assert (=> b!213040 m!328257))

(declare-fun m!328259 () Bool)

(assert (=> b!213040 m!328259))

(declare-fun m!328261 () Bool)

(assert (=> b!213040 m!328261))

(declare-fun m!328263 () Bool)

(assert (=> b!213040 m!328263))

(declare-fun m!328265 () Bool)

(assert (=> b!213040 m!328265))

(declare-fun m!328267 () Bool)

(assert (=> b!213040 m!328267))

(declare-fun m!328269 () Bool)

(assert (=> b!213040 m!328269))

(declare-fun m!328271 () Bool)

(assert (=> b!213040 m!328271))

(declare-fun m!328273 () Bool)

(assert (=> b!213040 m!328273))

(declare-fun m!328275 () Bool)

(assert (=> b!213040 m!328275))

(declare-fun m!328277 () Bool)

(assert (=> b!213040 m!328277))

(declare-fun m!328279 () Bool)

(assert (=> b!213037 m!328279))

(assert (=> b!213042 m!328231))

(declare-fun m!328281 () Bool)

(assert (=> start!44570 m!328281))

(assert (=> b!213048 m!328233))

(assert (=> b!213048 m!328235))

(check-sat (not b!213048) (not b!213028) (not b!213029) (not b!213031) (not b!213040) (not b!213041) (not start!44570) (not b!213051) (not b!213050) (not b!213030) (not b!213049) (not b!213042) (not b!213034) (not b!213036) (not b!213044) (not b!213037) (not b!213046) (not b!213032) (not b!213038))
(check-sat)
(get-model)

(declare-fun d!71967 () Bool)

(assert (=> d!71967 (= (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 thiss!1204))) (and (bvsge (currentBit!9721 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9721 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9726 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9726 thiss!1204) (size!4631 (buf!5160 thiss!1204))) (and (= (currentBit!9721 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9726 thiss!1204) (size!4631 (buf!5160 thiss!1204)))))))))

(assert (=> b!213036 d!71967))

(declare-fun d!71969 () Bool)

(assert (=> d!71969 (= (invariant!0 (currentBit!9721 (_2!9780 lt!335825)) (currentByte!9726 (_2!9780 lt!335825)) (size!4631 (buf!5160 (_2!9780 lt!335825)))) (and (bvsge (currentBit!9721 (_2!9780 lt!335825)) #b00000000000000000000000000000000) (bvslt (currentBit!9721 (_2!9780 lt!335825)) #b00000000000000000000000000001000) (bvsge (currentByte!9726 (_2!9780 lt!335825)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9726 (_2!9780 lt!335825)) (size!4631 (buf!5160 (_2!9780 lt!335825)))) (and (= (currentBit!9721 (_2!9780 lt!335825)) #b00000000000000000000000000000000) (= (currentByte!9726 (_2!9780 lt!335825)) (size!4631 (buf!5160 (_2!9780 lt!335825))))))))))

(assert (=> b!213037 d!71969))

(declare-fun d!71971 () Bool)

(declare-fun e!145203 () Bool)

(assert (=> d!71971 e!145203))

(declare-fun res!179108 () Bool)

(assert (=> d!71971 (=> (not res!179108) (not e!145203))))

(declare-fun lt!335960 () (_ BitVec 64))

(declare-fun lt!335963 () (_ BitVec 64))

(declare-fun lt!335958 () (_ BitVec 64))

(assert (=> d!71971 (= res!179108 (= lt!335963 (bvsub lt!335960 lt!335958)))))

(assert (=> d!71971 (or (= (bvand lt!335960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!335958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!335960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335960 lt!335958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71971 (= lt!335958 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335851)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851)))))))

(declare-fun lt!335961 () (_ BitVec 64))

(declare-fun lt!335959 () (_ BitVec 64))

(assert (=> d!71971 (= lt!335960 (bvmul lt!335961 lt!335959))))

(assert (=> d!71971 (or (= lt!335961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!335959 (bvsdiv (bvmul lt!335961 lt!335959) lt!335961)))))

(assert (=> d!71971 (= lt!335959 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71971 (= lt!335961 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(assert (=> d!71971 (= lt!335963 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851)))))))

(assert (=> d!71971 (invariant!0 (currentBit!9721 (_2!9780 lt!335851)) (currentByte!9726 (_2!9780 lt!335851)) (size!4631 (buf!5160 (_2!9780 lt!335851))))))

(assert (=> d!71971 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))) lt!335963)))

(declare-fun b!213128 () Bool)

(declare-fun res!179107 () Bool)

(assert (=> b!213128 (=> (not res!179107) (not e!145203))))

(assert (=> b!213128 (= res!179107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!335963))))

(declare-fun b!213129 () Bool)

(declare-fun lt!335962 () (_ BitVec 64))

(assert (=> b!213129 (= e!145203 (bvsle lt!335963 (bvmul lt!335962 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213129 (or (= lt!335962 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!335962 #b0000000000000000000000000000000000000000000000000000000000001000) lt!335962)))))

(assert (=> b!213129 (= lt!335962 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(assert (= (and d!71971 res!179108) b!213128))

(assert (= (and b!213128 res!179107) b!213129))

(declare-fun m!328365 () Bool)

(assert (=> d!71971 m!328365))

(declare-fun m!328367 () Bool)

(assert (=> d!71971 m!328367))

(assert (=> b!213048 d!71971))

(declare-fun d!71973 () Bool)

(declare-fun e!145204 () Bool)

(assert (=> d!71973 e!145204))

(declare-fun res!179110 () Bool)

(assert (=> d!71973 (=> (not res!179110) (not e!145204))))

(declare-fun lt!335966 () (_ BitVec 64))

(declare-fun lt!335964 () (_ BitVec 64))

(declare-fun lt!335969 () (_ BitVec 64))

(assert (=> d!71973 (= res!179110 (= lt!335969 (bvsub lt!335966 lt!335964)))))

(assert (=> d!71973 (or (= (bvand lt!335966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!335964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!335966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335966 lt!335964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71973 (= lt!335964 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204))))))

(declare-fun lt!335967 () (_ BitVec 64))

(declare-fun lt!335965 () (_ BitVec 64))

(assert (=> d!71973 (= lt!335966 (bvmul lt!335967 lt!335965))))

(assert (=> d!71973 (or (= lt!335967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!335965 (bvsdiv (bvmul lt!335967 lt!335965) lt!335967)))))

(assert (=> d!71973 (= lt!335965 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71973 (= lt!335967 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))))))

(assert (=> d!71973 (= lt!335969 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 thiss!1204))))))

(assert (=> d!71973 (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 thiss!1204)))))

(assert (=> d!71973 (= (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)) lt!335969)))

(declare-fun b!213130 () Bool)

(declare-fun res!179109 () Bool)

(assert (=> b!213130 (=> (not res!179109) (not e!145204))))

(assert (=> b!213130 (= res!179109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!335969))))

(declare-fun b!213131 () Bool)

(declare-fun lt!335968 () (_ BitVec 64))

(assert (=> b!213131 (= e!145204 (bvsle lt!335969 (bvmul lt!335968 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213131 (or (= lt!335968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!335968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!335968)))))

(assert (=> b!213131 (= lt!335968 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))))))

(assert (= (and d!71973 res!179110) b!213130))

(assert (= (and b!213130 res!179109) b!213131))

(declare-fun m!328369 () Bool)

(assert (=> d!71973 m!328369))

(assert (=> d!71973 m!328217))

(assert (=> b!213048 d!71973))

(declare-fun d!71975 () Bool)

(declare-fun lt!335984 () tuple2!18256)

(declare-fun lt!335987 () tuple2!18256)

(assert (=> d!71975 (and (= (_2!9783 lt!335984) (_2!9783 lt!335987)) (= (_1!9783 lt!335984) (_1!9783 lt!335987)))))

(declare-fun lt!335983 () Unit!15168)

(declare-fun lt!335982 () BitStream!8370)

(declare-fun lt!335986 () (_ BitVec 64))

(declare-fun lt!335985 () Bool)

(declare-fun choose!56 (BitStream!8370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18256 tuple2!18256 BitStream!8370 (_ BitVec 64) Bool BitStream!8370 (_ BitVec 64) tuple2!18256 tuple2!18256 BitStream!8370 (_ BitVec 64)) Unit!15168)

(assert (=> d!71975 (= lt!335983 (choose!56 (_1!9781 lt!335842) nBits!348 i!590 lt!335829 lt!335984 (tuple2!18257 (_1!9783 lt!335984) (_2!9783 lt!335984)) (_1!9783 lt!335984) (_2!9783 lt!335984) lt!335985 lt!335982 lt!335986 lt!335987 (tuple2!18257 (_1!9783 lt!335987) (_2!9783 lt!335987)) (_1!9783 lt!335987) (_2!9783 lt!335987)))))

(assert (=> d!71975 (= lt!335987 (readNBitsLSBFirstsLoopPure!0 lt!335982 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!335986))))

(assert (=> d!71975 (= lt!335986 (bvor lt!335829 (ite lt!335985 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71975 (= lt!335982 (withMovedBitIndex!0 (_1!9781 lt!335842) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71975 (= lt!335985 (_2!9782 (readBitPure!0 (_1!9781 lt!335842))))))

(assert (=> d!71975 (= lt!335984 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!335842) nBits!348 i!590 lt!335829))))

(assert (=> d!71975 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9781 lt!335842) nBits!348 i!590 lt!335829) lt!335983)))

(declare-fun bs!17665 () Bool)

(assert (= bs!17665 d!71975))

(declare-fun m!328371 () Bool)

(assert (=> bs!17665 m!328371))

(declare-fun m!328373 () Bool)

(assert (=> bs!17665 m!328373))

(assert (=> bs!17665 m!328259))

(assert (=> bs!17665 m!328225))

(assert (=> bs!17665 m!328249))

(assert (=> b!213038 d!71975))

(declare-fun d!71977 () Bool)

(declare-datatypes ((tuple2!18268 0))(
  ( (tuple2!18269 (_1!9789 (_ BitVec 64)) (_2!9789 BitStream!8370)) )
))
(declare-fun lt!335990 () tuple2!18268)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18268)

(assert (=> d!71977 (= lt!335990 (readNBitsLSBFirstsLoop!0 lt!335844 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335839))))

(assert (=> d!71977 (= (readNBitsLSBFirstsLoopPure!0 lt!335844 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335839) (tuple2!18257 (_2!9789 lt!335990) (_1!9789 lt!335990)))))

(declare-fun bs!17666 () Bool)

(assert (= bs!17666 d!71977))

(declare-fun m!328375 () Bool)

(assert (=> bs!17666 m!328375))

(assert (=> b!213038 d!71977))

(declare-fun d!71979 () Bool)

(declare-fun e!145207 () Bool)

(assert (=> d!71979 e!145207))

(declare-fun res!179113 () Bool)

(assert (=> d!71979 (=> (not res!179113) (not e!145207))))

(declare-fun lt!335996 () (_ BitVec 64))

(declare-fun lt!335995 () BitStream!8370)

(assert (=> d!71979 (= res!179113 (= (bvadd lt!335996 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4631 (buf!5160 lt!335995)) (currentByte!9726 lt!335995) (currentBit!9721 lt!335995))))))

(assert (=> d!71979 (or (not (= (bvand lt!335996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!335996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!335996 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71979 (= lt!335996 (bitIndex!0 (size!4631 (buf!5160 (_1!9781 lt!335842))) (currentByte!9726 (_1!9781 lt!335842)) (currentBit!9721 (_1!9781 lt!335842))))))

(declare-fun moveBitIndex!0 (BitStream!8370 (_ BitVec 64)) tuple2!18250)

(assert (=> d!71979 (= lt!335995 (_2!9780 (moveBitIndex!0 (_1!9781 lt!335842) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8370 (_ BitVec 64)) Bool)

(assert (=> d!71979 (moveBitIndexPrecond!0 (_1!9781 lt!335842) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71979 (= (withMovedBitIndex!0 (_1!9781 lt!335842) #b0000000000000000000000000000000000000000000000000000000000000001) lt!335995)))

(declare-fun b!213134 () Bool)

(assert (=> b!213134 (= e!145207 (= (size!4631 (buf!5160 (_1!9781 lt!335842))) (size!4631 (buf!5160 lt!335995))))))

(assert (= (and d!71979 res!179113) b!213134))

(declare-fun m!328377 () Bool)

(assert (=> d!71979 m!328377))

(declare-fun m!328379 () Bool)

(assert (=> d!71979 m!328379))

(declare-fun m!328381 () Bool)

(assert (=> d!71979 m!328381))

(declare-fun m!328383 () Bool)

(assert (=> d!71979 m!328383))

(assert (=> b!213038 d!71979))

(declare-fun d!71981 () Bool)

(declare-fun e!145208 () Bool)

(assert (=> d!71981 e!145208))

(declare-fun res!179114 () Bool)

(assert (=> d!71981 (=> (not res!179114) (not e!145208))))

(declare-fun lt!335997 () BitStream!8370)

(declare-fun lt!335998 () (_ BitVec 64))

(assert (=> d!71981 (= res!179114 (= (bvadd lt!335998 (bvsub lt!335835 lt!335847)) (bitIndex!0 (size!4631 (buf!5160 lt!335997)) (currentByte!9726 lt!335997) (currentBit!9721 lt!335997))))))

(assert (=> d!71981 (or (not (= (bvand lt!335998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335835 lt!335847) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!335998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!335998 (bvsub lt!335835 lt!335847)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71981 (= lt!335998 (bitIndex!0 (size!4631 (buf!5160 (_2!9781 lt!335842))) (currentByte!9726 (_2!9781 lt!335842)) (currentBit!9721 (_2!9781 lt!335842))))))

(assert (=> d!71981 (= lt!335997 (_2!9780 (moveBitIndex!0 (_2!9781 lt!335842) (bvsub lt!335835 lt!335847))))))

(assert (=> d!71981 (moveBitIndexPrecond!0 (_2!9781 lt!335842) (bvsub lt!335835 lt!335847))))

(assert (=> d!71981 (= (withMovedBitIndex!0 (_2!9781 lt!335842) (bvsub lt!335835 lt!335847)) lt!335997)))

(declare-fun b!213135 () Bool)

(assert (=> b!213135 (= e!145208 (= (size!4631 (buf!5160 (_2!9781 lt!335842))) (size!4631 (buf!5160 lt!335997))))))

(assert (= (and d!71981 res!179114) b!213135))

(declare-fun m!328385 () Bool)

(assert (=> d!71981 m!328385))

(assert (=> d!71981 m!328207))

(declare-fun m!328387 () Bool)

(assert (=> d!71981 m!328387))

(declare-fun m!328389 () Bool)

(assert (=> d!71981 m!328389))

(assert (=> b!213049 d!71981))

(declare-fun d!71983 () Bool)

(assert (=> d!71983 (= (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335825)))) (and (bvsge (currentBit!9721 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9721 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9726 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335825)))) (and (= (currentBit!9721 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335825))))))))))

(assert (=> b!213028 d!71983))

(declare-fun d!71985 () Bool)

(assert (=> d!71985 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 thiss!1204))))))

(declare-fun bs!17667 () Bool)

(assert (= bs!17667 d!71985))

(assert (=> bs!17667 m!328217))

(assert (=> start!44570 d!71985))

(declare-fun d!71987 () Bool)

(declare-fun e!145209 () Bool)

(assert (=> d!71987 e!145209))

(declare-fun res!179116 () Bool)

(assert (=> d!71987 (=> (not res!179116) (not e!145209))))

(declare-fun lt!335999 () (_ BitVec 64))

(declare-fun lt!336001 () (_ BitVec 64))

(declare-fun lt!336004 () (_ BitVec 64))

(assert (=> d!71987 (= res!179116 (= lt!336004 (bvsub lt!336001 lt!335999)))))

(assert (=> d!71987 (or (= (bvand lt!336001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!335999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336001 lt!335999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71987 (= lt!335999 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9783 lt!335836)))) ((_ sign_extend 32) (currentByte!9726 (_1!9783 lt!335836))) ((_ sign_extend 32) (currentBit!9721 (_1!9783 lt!335836)))))))

(declare-fun lt!336002 () (_ BitVec 64))

(declare-fun lt!336000 () (_ BitVec 64))

(assert (=> d!71987 (= lt!336001 (bvmul lt!336002 lt!336000))))

(assert (=> d!71987 (or (= lt!336002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336000 (bvsdiv (bvmul lt!336002 lt!336000) lt!336002)))))

(assert (=> d!71987 (= lt!336000 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71987 (= lt!336002 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9783 lt!335836)))))))

(assert (=> d!71987 (= lt!336004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_1!9783 lt!335836))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_1!9783 lt!335836)))))))

(assert (=> d!71987 (invariant!0 (currentBit!9721 (_1!9783 lt!335836)) (currentByte!9726 (_1!9783 lt!335836)) (size!4631 (buf!5160 (_1!9783 lt!335836))))))

(assert (=> d!71987 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9783 lt!335836))) (currentByte!9726 (_1!9783 lt!335836)) (currentBit!9721 (_1!9783 lt!335836))) lt!336004)))

(declare-fun b!213136 () Bool)

(declare-fun res!179115 () Bool)

(assert (=> b!213136 (=> (not res!179115) (not e!145209))))

(assert (=> b!213136 (= res!179115 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336004))))

(declare-fun b!213137 () Bool)

(declare-fun lt!336003 () (_ BitVec 64))

(assert (=> b!213137 (= e!145209 (bvsle lt!336004 (bvmul lt!336003 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213137 (or (= lt!336003 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336003 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336003)))))

(assert (=> b!213137 (= lt!336003 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9783 lt!335836)))))))

(assert (= (and d!71987 res!179116) b!213136))

(assert (= (and b!213136 res!179115) b!213137))

(declare-fun m!328391 () Bool)

(assert (=> d!71987 m!328391))

(declare-fun m!328393 () Bool)

(assert (=> d!71987 m!328393))

(assert (=> b!213050 d!71987))

(declare-fun d!71989 () Bool)

(declare-fun e!145210 () Bool)

(assert (=> d!71989 e!145210))

(declare-fun res!179118 () Bool)

(assert (=> d!71989 (=> (not res!179118) (not e!145210))))

(declare-fun lt!336010 () (_ BitVec 64))

(declare-fun lt!336005 () (_ BitVec 64))

(declare-fun lt!336007 () (_ BitVec 64))

(assert (=> d!71989 (= res!179118 (= lt!336010 (bvsub lt!336007 lt!336005)))))

(assert (=> d!71989 (or (= (bvand lt!336007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336007 lt!336005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71989 (= lt!336005 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9781 lt!335842)))) ((_ sign_extend 32) (currentByte!9726 (_2!9781 lt!335842))) ((_ sign_extend 32) (currentBit!9721 (_2!9781 lt!335842)))))))

(declare-fun lt!336008 () (_ BitVec 64))

(declare-fun lt!336006 () (_ BitVec 64))

(assert (=> d!71989 (= lt!336007 (bvmul lt!336008 lt!336006))))

(assert (=> d!71989 (or (= lt!336008 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336006 (bvsdiv (bvmul lt!336008 lt!336006) lt!336008)))))

(assert (=> d!71989 (= lt!336006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71989 (= lt!336008 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9781 lt!335842)))))))

(assert (=> d!71989 (= lt!336010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_2!9781 lt!335842))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_2!9781 lt!335842)))))))

(assert (=> d!71989 (invariant!0 (currentBit!9721 (_2!9781 lt!335842)) (currentByte!9726 (_2!9781 lt!335842)) (size!4631 (buf!5160 (_2!9781 lt!335842))))))

(assert (=> d!71989 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9781 lt!335842))) (currentByte!9726 (_2!9781 lt!335842)) (currentBit!9721 (_2!9781 lt!335842))) lt!336010)))

(declare-fun b!213138 () Bool)

(declare-fun res!179117 () Bool)

(assert (=> b!213138 (=> (not res!179117) (not e!145210))))

(assert (=> b!213138 (= res!179117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336010))))

(declare-fun b!213139 () Bool)

(declare-fun lt!336009 () (_ BitVec 64))

(assert (=> b!213139 (= e!145210 (bvsle lt!336010 (bvmul lt!336009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213139 (or (= lt!336009 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336009 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336009)))))

(assert (=> b!213139 (= lt!336009 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9781 lt!335842)))))))

(assert (= (and d!71989 res!179118) b!213138))

(assert (= (and b!213138 res!179117) b!213139))

(declare-fun m!328395 () Bool)

(assert (=> d!71989 m!328395))

(declare-fun m!328397 () Bool)

(assert (=> d!71989 m!328397))

(assert (=> b!213050 d!71989))

(declare-fun d!71991 () Bool)

(declare-fun e!145211 () Bool)

(assert (=> d!71991 e!145211))

(declare-fun res!179119 () Bool)

(assert (=> d!71991 (=> (not res!179119) (not e!145211))))

(declare-fun lt!336012 () (_ BitVec 64))

(declare-fun lt!336011 () BitStream!8370)

(assert (=> d!71991 (= res!179119 (= (bvadd lt!336012 (bvsub lt!335832 lt!335847)) (bitIndex!0 (size!4631 (buf!5160 lt!336011)) (currentByte!9726 lt!336011) (currentBit!9721 lt!336011))))))

(assert (=> d!71991 (or (not (= (bvand lt!336012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335832 lt!335847) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336012 (bvsub lt!335832 lt!335847)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71991 (= lt!336012 (bitIndex!0 (size!4631 (buf!5160 (_2!9781 lt!335833))) (currentByte!9726 (_2!9781 lt!335833)) (currentBit!9721 (_2!9781 lt!335833))))))

(assert (=> d!71991 (= lt!336011 (_2!9780 (moveBitIndex!0 (_2!9781 lt!335833) (bvsub lt!335832 lt!335847))))))

(assert (=> d!71991 (moveBitIndexPrecond!0 (_2!9781 lt!335833) (bvsub lt!335832 lt!335847))))

(assert (=> d!71991 (= (withMovedBitIndex!0 (_2!9781 lt!335833) (bvsub lt!335832 lt!335847)) lt!336011)))

(declare-fun b!213140 () Bool)

(assert (=> b!213140 (= e!145211 (= (size!4631 (buf!5160 (_2!9781 lt!335833))) (size!4631 (buf!5160 lt!336011))))))

(assert (= (and d!71991 res!179119) b!213140))

(declare-fun m!328399 () Bool)

(assert (=> d!71991 m!328399))

(declare-fun m!328401 () Bool)

(assert (=> d!71991 m!328401))

(declare-fun m!328403 () Bool)

(assert (=> d!71991 m!328403))

(declare-fun m!328405 () Bool)

(assert (=> d!71991 m!328405))

(assert (=> b!213029 d!71991))

(declare-fun d!71993 () Bool)

(declare-fun lt!336013 () tuple2!18268)

(assert (=> d!71993 (= lt!336013 (readNBitsLSBFirstsLoop!0 (_1!9781 lt!335842) nBits!348 i!590 lt!335829))))

(assert (=> d!71993 (= (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!335842) nBits!348 i!590 lt!335829) (tuple2!18257 (_2!9789 lt!336013) (_1!9789 lt!336013)))))

(declare-fun bs!17668 () Bool)

(assert (= bs!17668 d!71993))

(declare-fun m!328407 () Bool)

(assert (=> bs!17668 m!328407))

(assert (=> b!213040 d!71993))

(declare-fun d!71995 () Bool)

(assert (=> d!71995 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!213040 d!71995))

(declare-fun d!71997 () Bool)

(assert (=> d!71997 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204)) lt!335852) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204))) lt!335852))))

(declare-fun bs!17669 () Bool)

(assert (= bs!17669 d!71997))

(declare-fun m!328409 () Bool)

(assert (=> bs!17669 m!328409))

(assert (=> b!213040 d!71997))

(declare-fun d!71999 () Bool)

(assert (=> d!71999 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204)) lt!335852)))

(declare-fun lt!336016 () Unit!15168)

(declare-fun choose!9 (BitStream!8370 array!10543 (_ BitVec 64) BitStream!8370) Unit!15168)

(assert (=> d!71999 (= lt!336016 (choose!9 thiss!1204 (buf!5160 (_2!9780 lt!335825)) lt!335852 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204))))))

(assert (=> d!71999 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5160 (_2!9780 lt!335825)) lt!335852) lt!336016)))

(declare-fun bs!17670 () Bool)

(assert (= bs!17670 d!71999))

(assert (=> bs!17670 m!328255))

(declare-fun m!328411 () Bool)

(assert (=> bs!17670 m!328411))

(assert (=> b!213040 d!71999))

(declare-fun d!72001 () Bool)

(assert (=> d!72001 (= (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335851)))) (and (bvsge (currentBit!9721 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9721 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9726 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335851)))) (and (= (currentBit!9721 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335851))))))))))

(assert (=> b!213040 d!72001))

(declare-fun d!72003 () Bool)

(declare-fun lt!336017 () tuple2!18268)

(assert (=> d!72003 (= lt!336017 (readNBitsLSBFirstsLoop!0 (_1!9781 lt!335833) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335839))))

(assert (=> d!72003 (= (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!335833) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335839) (tuple2!18257 (_2!9789 lt!336017) (_1!9789 lt!336017)))))

(declare-fun bs!17671 () Bool)

(assert (= bs!17671 d!72003))

(declare-fun m!328413 () Bool)

(assert (=> bs!17671 m!328413))

(assert (=> b!213040 d!72003))

(declare-fun d!72005 () Bool)

(assert (=> d!72005 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!335824) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851)))) lt!335824))))

(declare-fun bs!17672 () Bool)

(assert (= bs!17672 d!72005))

(declare-fun m!328415 () Bool)

(assert (=> bs!17672 m!328415))

(assert (=> b!213040 d!72005))

(declare-fun d!72007 () Bool)

(declare-datatypes ((tuple2!18270 0))(
  ( (tuple2!18271 (_1!9790 Bool) (_2!9790 BitStream!8370)) )
))
(declare-fun lt!336020 () tuple2!18270)

(declare-fun readBit!0 (BitStream!8370) tuple2!18270)

(assert (=> d!72007 (= lt!336020 (readBit!0 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204))))))

(assert (=> d!72007 (= (readBitPure!0 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204))) (tuple2!18255 (_2!9790 lt!336020) (_1!9790 lt!336020)))))

(declare-fun bs!17673 () Bool)

(assert (= bs!17673 d!72007))

(declare-fun m!328417 () Bool)

(assert (=> bs!17673 m!328417))

(assert (=> b!213040 d!72007))

(declare-fun d!72009 () Bool)

(declare-fun e!145212 () Bool)

(assert (=> d!72009 e!145212))

(declare-fun res!179121 () Bool)

(assert (=> d!72009 (=> (not res!179121) (not e!145212))))

(declare-fun lt!336026 () (_ BitVec 64))

(declare-fun lt!336021 () (_ BitVec 64))

(declare-fun lt!336023 () (_ BitVec 64))

(assert (=> d!72009 (= res!179121 (= lt!336026 (bvsub lt!336023 lt!336021)))))

(assert (=> d!72009 (or (= (bvand lt!336023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336023 lt!336021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72009 (= lt!336021 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335827)))) ((_ sign_extend 32) (currentByte!9726 (_1!9782 lt!335827))) ((_ sign_extend 32) (currentBit!9721 (_1!9782 lt!335827)))))))

(declare-fun lt!336024 () (_ BitVec 64))

(declare-fun lt!336022 () (_ BitVec 64))

(assert (=> d!72009 (= lt!336023 (bvmul lt!336024 lt!336022))))

(assert (=> d!72009 (or (= lt!336024 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336022 (bvsdiv (bvmul lt!336024 lt!336022) lt!336024)))))

(assert (=> d!72009 (= lt!336022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72009 (= lt!336024 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335827)))))))

(assert (=> d!72009 (= lt!336026 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_1!9782 lt!335827))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_1!9782 lt!335827)))))))

(assert (=> d!72009 (invariant!0 (currentBit!9721 (_1!9782 lt!335827)) (currentByte!9726 (_1!9782 lt!335827)) (size!4631 (buf!5160 (_1!9782 lt!335827))))))

(assert (=> d!72009 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!335827))) (currentByte!9726 (_1!9782 lt!335827)) (currentBit!9721 (_1!9782 lt!335827))) lt!336026)))

(declare-fun b!213141 () Bool)

(declare-fun res!179120 () Bool)

(assert (=> b!213141 (=> (not res!179120) (not e!145212))))

(assert (=> b!213141 (= res!179120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336026))))

(declare-fun b!213142 () Bool)

(declare-fun lt!336025 () (_ BitVec 64))

(assert (=> b!213142 (= e!145212 (bvsle lt!336026 (bvmul lt!336025 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213142 (or (= lt!336025 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336025 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336025)))))

(assert (=> b!213142 (= lt!336025 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335827)))))))

(assert (= (and d!72009 res!179121) b!213141))

(assert (= (and b!213141 res!179120) b!213142))

(declare-fun m!328419 () Bool)

(assert (=> d!72009 m!328419))

(declare-fun m!328421 () Bool)

(assert (=> d!72009 m!328421))

(assert (=> b!213040 d!72009))

(declare-fun d!72011 () Bool)

(declare-fun e!145215 () Bool)

(assert (=> d!72011 e!145215))

(declare-fun res!179124 () Bool)

(assert (=> d!72011 (=> (not res!179124) (not e!145215))))

(declare-fun lt!336037 () tuple2!18254)

(declare-fun lt!336035 () tuple2!18254)

(assert (=> d!72011 (= res!179124 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!336037))) (currentByte!9726 (_1!9782 lt!336037)) (currentBit!9721 (_1!9782 lt!336037))) (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!336035))) (currentByte!9726 (_1!9782 lt!336035)) (currentBit!9721 (_1!9782 lt!336035)))))))

(declare-fun lt!336038 () Unit!15168)

(declare-fun lt!336036 () BitStream!8370)

(declare-fun choose!50 (BitStream!8370 BitStream!8370 BitStream!8370 tuple2!18254 tuple2!18254 BitStream!8370 Bool tuple2!18254 tuple2!18254 BitStream!8370 Bool) Unit!15168)

(assert (=> d!72011 (= lt!336038 (choose!50 lt!335838 (_2!9780 lt!335825) lt!336036 lt!336037 (tuple2!18255 (_1!9782 lt!336037) (_2!9782 lt!336037)) (_1!9782 lt!336037) (_2!9782 lt!336037) lt!336035 (tuple2!18255 (_1!9782 lt!336035) (_2!9782 lt!336035)) (_1!9782 lt!336035) (_2!9782 lt!336035)))))

(assert (=> d!72011 (= lt!336035 (readBitPure!0 lt!336036))))

(assert (=> d!72011 (= lt!336037 (readBitPure!0 lt!335838))))

(assert (=> d!72011 (= lt!336036 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 lt!335838) (currentBit!9721 lt!335838)))))

(assert (=> d!72011 (invariant!0 (currentBit!9721 lt!335838) (currentByte!9726 lt!335838) (size!4631 (buf!5160 (_2!9780 lt!335825))))))

(assert (=> d!72011 (= (readBitPrefixLemma!0 lt!335838 (_2!9780 lt!335825)) lt!336038)))

(declare-fun b!213145 () Bool)

(assert (=> b!213145 (= e!145215 (= (_2!9782 lt!336037) (_2!9782 lt!336035)))))

(assert (= (and d!72011 res!179124) b!213145))

(declare-fun m!328423 () Bool)

(assert (=> d!72011 m!328423))

(declare-fun m!328425 () Bool)

(assert (=> d!72011 m!328425))

(assert (=> d!72011 m!328267))

(declare-fun m!328427 () Bool)

(assert (=> d!72011 m!328427))

(declare-fun m!328429 () Bool)

(assert (=> d!72011 m!328429))

(declare-fun m!328431 () Bool)

(assert (=> d!72011 m!328431))

(assert (=> b!213040 d!72011))

(declare-fun d!72013 () Bool)

(declare-fun lt!336039 () tuple2!18270)

(assert (=> d!72013 (= lt!336039 (readBit!0 (_1!9781 lt!335842)))))

(assert (=> d!72013 (= (readBitPure!0 (_1!9781 lt!335842)) (tuple2!18255 (_2!9790 lt!336039) (_1!9790 lt!336039)))))

(declare-fun bs!17674 () Bool)

(assert (= bs!17674 d!72013))

(declare-fun m!328433 () Bool)

(assert (=> bs!17674 m!328433))

(assert (=> b!213040 d!72013))

(declare-fun d!72015 () Bool)

(assert (=> d!72015 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!335824)))

(declare-fun lt!336040 () Unit!15168)

(assert (=> d!72015 (= lt!336040 (choose!9 (_2!9780 lt!335851) (buf!5160 (_2!9780 lt!335825)) lt!335824 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851)))))))

(assert (=> d!72015 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9780 lt!335851) (buf!5160 (_2!9780 lt!335825)) lt!335824) lt!336040)))

(declare-fun bs!17675 () Bool)

(assert (= bs!17675 d!72015))

(assert (=> bs!17675 m!328269))

(declare-fun m!328435 () Bool)

(assert (=> bs!17675 m!328435))

(assert (=> b!213040 d!72015))

(declare-fun d!72017 () Bool)

(declare-fun lt!336041 () tuple2!18270)

(assert (=> d!72017 (= lt!336041 (readBit!0 lt!335838))))

(assert (=> d!72017 (= (readBitPure!0 lt!335838) (tuple2!18255 (_2!9790 lt!336041) (_1!9790 lt!336041)))))

(declare-fun bs!17676 () Bool)

(assert (= bs!17676 d!72017))

(declare-fun m!328437 () Bool)

(assert (=> bs!17676 m!328437))

(assert (=> b!213040 d!72017))

(declare-fun d!72019 () Bool)

(declare-fun e!145216 () Bool)

(assert (=> d!72019 e!145216))

(declare-fun res!179126 () Bool)

(assert (=> d!72019 (=> (not res!179126) (not e!145216))))

(declare-fun lt!336042 () (_ BitVec 64))

(declare-fun lt!336047 () (_ BitVec 64))

(declare-fun lt!336044 () (_ BitVec 64))

(assert (=> d!72019 (= res!179126 (= lt!336047 (bvsub lt!336044 lt!336042)))))

(assert (=> d!72019 (or (= (bvand lt!336044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336044 lt!336042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72019 (= lt!336042 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335840)))) ((_ sign_extend 32) (currentByte!9726 (_1!9782 lt!335840))) ((_ sign_extend 32) (currentBit!9721 (_1!9782 lt!335840)))))))

(declare-fun lt!336045 () (_ BitVec 64))

(declare-fun lt!336043 () (_ BitVec 64))

(assert (=> d!72019 (= lt!336044 (bvmul lt!336045 lt!336043))))

(assert (=> d!72019 (or (= lt!336045 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336043 (bvsdiv (bvmul lt!336045 lt!336043) lt!336045)))))

(assert (=> d!72019 (= lt!336043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72019 (= lt!336045 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335840)))))))

(assert (=> d!72019 (= lt!336047 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_1!9782 lt!335840))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_1!9782 lt!335840)))))))

(assert (=> d!72019 (invariant!0 (currentBit!9721 (_1!9782 lt!335840)) (currentByte!9726 (_1!9782 lt!335840)) (size!4631 (buf!5160 (_1!9782 lt!335840))))))

(assert (=> d!72019 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!335840))) (currentByte!9726 (_1!9782 lt!335840)) (currentBit!9721 (_1!9782 lt!335840))) lt!336047)))

(declare-fun b!213146 () Bool)

(declare-fun res!179125 () Bool)

(assert (=> b!213146 (=> (not res!179125) (not e!145216))))

(assert (=> b!213146 (= res!179125 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336047))))

(declare-fun b!213147 () Bool)

(declare-fun lt!336046 () (_ BitVec 64))

(assert (=> b!213147 (= e!145216 (bvsle lt!336047 (bvmul lt!336046 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213147 (or (= lt!336046 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336046 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336046)))))

(assert (=> b!213147 (= lt!336046 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335840)))))))

(assert (= (and d!72019 res!179126) b!213146))

(assert (= (and b!213146 res!179125) b!213147))

(declare-fun m!328439 () Bool)

(assert (=> d!72019 m!328439))

(declare-fun m!328441 () Bool)

(assert (=> d!72019 m!328441))

(assert (=> b!213040 d!72019))

(declare-fun b!213158 () Bool)

(declare-fun res!179133 () Bool)

(declare-fun e!145221 () Bool)

(assert (=> b!213158 (=> (not res!179133) (not e!145221))))

(declare-fun lt!336101 () tuple2!18252)

(assert (=> b!213158 (= res!179133 (isPrefixOf!0 (_2!9781 lt!336101) (_2!9780 lt!335825)))))

(declare-fun d!72021 () Bool)

(assert (=> d!72021 e!145221))

(declare-fun res!179134 () Bool)

(assert (=> d!72021 (=> (not res!179134) (not e!145221))))

(assert (=> d!72021 (= res!179134 (isPrefixOf!0 (_1!9781 lt!336101) (_2!9781 lt!336101)))))

(declare-fun lt!336089 () BitStream!8370)

(assert (=> d!72021 (= lt!336101 (tuple2!18253 lt!336089 (_2!9780 lt!335825)))))

(declare-fun lt!336102 () Unit!15168)

(declare-fun lt!336107 () Unit!15168)

(assert (=> d!72021 (= lt!336102 lt!336107)))

(assert (=> d!72021 (isPrefixOf!0 lt!336089 (_2!9780 lt!335825))))

(assert (=> d!72021 (= lt!336107 (lemmaIsPrefixTransitive!0 lt!336089 (_2!9780 lt!335825) (_2!9780 lt!335825)))))

(declare-fun lt!336099 () Unit!15168)

(declare-fun lt!336104 () Unit!15168)

(assert (=> d!72021 (= lt!336099 lt!336104)))

(assert (=> d!72021 (isPrefixOf!0 lt!336089 (_2!9780 lt!335825))))

(assert (=> d!72021 (= lt!336104 (lemmaIsPrefixTransitive!0 lt!336089 thiss!1204 (_2!9780 lt!335825)))))

(declare-fun lt!336106 () Unit!15168)

(declare-fun e!145222 () Unit!15168)

(assert (=> d!72021 (= lt!336106 e!145222)))

(declare-fun c!10451 () Bool)

(assert (=> d!72021 (= c!10451 (not (= (size!4631 (buf!5160 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!336096 () Unit!15168)

(declare-fun lt!336091 () Unit!15168)

(assert (=> d!72021 (= lt!336096 lt!336091)))

(assert (=> d!72021 (isPrefixOf!0 (_2!9780 lt!335825) (_2!9780 lt!335825))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8370) Unit!15168)

(assert (=> d!72021 (= lt!336091 (lemmaIsPrefixRefl!0 (_2!9780 lt!335825)))))

(declare-fun lt!336092 () Unit!15168)

(declare-fun lt!336088 () Unit!15168)

(assert (=> d!72021 (= lt!336092 lt!336088)))

(assert (=> d!72021 (= lt!336088 (lemmaIsPrefixRefl!0 (_2!9780 lt!335825)))))

(declare-fun lt!336093 () Unit!15168)

(declare-fun lt!336105 () Unit!15168)

(assert (=> d!72021 (= lt!336093 lt!336105)))

(assert (=> d!72021 (isPrefixOf!0 lt!336089 lt!336089)))

(assert (=> d!72021 (= lt!336105 (lemmaIsPrefixRefl!0 lt!336089))))

(declare-fun lt!336094 () Unit!15168)

(declare-fun lt!336097 () Unit!15168)

(assert (=> d!72021 (= lt!336094 lt!336097)))

(assert (=> d!72021 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72021 (= lt!336097 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72021 (= lt!336089 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(assert (=> d!72021 (isPrefixOf!0 thiss!1204 (_2!9780 lt!335825))))

(assert (=> d!72021 (= (reader!0 thiss!1204 (_2!9780 lt!335825)) lt!336101)))

(declare-fun b!213159 () Bool)

(declare-fun lt!336100 () (_ BitVec 64))

(declare-fun lt!336090 () (_ BitVec 64))

(assert (=> b!213159 (= e!145221 (= (_1!9781 lt!336101) (withMovedBitIndex!0 (_2!9781 lt!336101) (bvsub lt!336100 lt!336090))))))

(assert (=> b!213159 (or (= (bvand lt!336100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336100 lt!336090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213159 (= lt!336090 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335825))) (currentByte!9726 (_2!9780 lt!335825)) (currentBit!9721 (_2!9780 lt!335825))))))

(assert (=> b!213159 (= lt!336100 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun b!213160 () Bool)

(declare-fun Unit!15172 () Unit!15168)

(assert (=> b!213160 (= e!145222 Unit!15172)))

(declare-fun b!213161 () Bool)

(declare-fun res!179135 () Bool)

(assert (=> b!213161 (=> (not res!179135) (not e!145221))))

(assert (=> b!213161 (= res!179135 (isPrefixOf!0 (_1!9781 lt!336101) thiss!1204))))

(declare-fun b!213162 () Bool)

(declare-fun lt!336095 () Unit!15168)

(assert (=> b!213162 (= e!145222 lt!336095)))

(declare-fun lt!336098 () (_ BitVec 64))

(assert (=> b!213162 (= lt!336098 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!336103 () (_ BitVec 64))

(assert (=> b!213162 (= lt!336103 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10543 array!10543 (_ BitVec 64) (_ BitVec 64)) Unit!15168)

(assert (=> b!213162 (= lt!336095 (arrayBitRangesEqSymmetric!0 (buf!5160 thiss!1204) (buf!5160 (_2!9780 lt!335825)) lt!336098 lt!336103))))

(declare-fun arrayBitRangesEq!0 (array!10543 array!10543 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213162 (arrayBitRangesEq!0 (buf!5160 (_2!9780 lt!335825)) (buf!5160 thiss!1204) lt!336098 lt!336103)))

(assert (= (and d!72021 c!10451) b!213162))

(assert (= (and d!72021 (not c!10451)) b!213160))

(assert (= (and d!72021 res!179134) b!213161))

(assert (= (and b!213161 res!179135) b!213158))

(assert (= (and b!213158 res!179133) b!213159))

(declare-fun m!328443 () Bool)

(assert (=> b!213158 m!328443))

(declare-fun m!328445 () Bool)

(assert (=> d!72021 m!328445))

(declare-fun m!328447 () Bool)

(assert (=> d!72021 m!328447))

(declare-fun m!328449 () Bool)

(assert (=> d!72021 m!328449))

(declare-fun m!328451 () Bool)

(assert (=> d!72021 m!328451))

(declare-fun m!328453 () Bool)

(assert (=> d!72021 m!328453))

(declare-fun m!328455 () Bool)

(assert (=> d!72021 m!328455))

(declare-fun m!328457 () Bool)

(assert (=> d!72021 m!328457))

(declare-fun m!328459 () Bool)

(assert (=> d!72021 m!328459))

(declare-fun m!328461 () Bool)

(assert (=> d!72021 m!328461))

(assert (=> d!72021 m!328241))

(declare-fun m!328463 () Bool)

(assert (=> d!72021 m!328463))

(declare-fun m!328465 () Bool)

(assert (=> b!213161 m!328465))

(declare-fun m!328467 () Bool)

(assert (=> b!213159 m!328467))

(assert (=> b!213159 m!328239))

(assert (=> b!213159 m!328235))

(assert (=> b!213162 m!328235))

(declare-fun m!328469 () Bool)

(assert (=> b!213162 m!328469))

(declare-fun m!328471 () Bool)

(assert (=> b!213162 m!328471))

(assert (=> b!213040 d!72021))

(declare-fun b!213163 () Bool)

(declare-fun res!179136 () Bool)

(declare-fun e!145223 () Bool)

(assert (=> b!213163 (=> (not res!179136) (not e!145223))))

(declare-fun lt!336121 () tuple2!18252)

(assert (=> b!213163 (= res!179136 (isPrefixOf!0 (_2!9781 lt!336121) (_2!9780 lt!335825)))))

(declare-fun d!72023 () Bool)

(assert (=> d!72023 e!145223))

(declare-fun res!179137 () Bool)

(assert (=> d!72023 (=> (not res!179137) (not e!145223))))

(assert (=> d!72023 (= res!179137 (isPrefixOf!0 (_1!9781 lt!336121) (_2!9781 lt!336121)))))

(declare-fun lt!336109 () BitStream!8370)

(assert (=> d!72023 (= lt!336121 (tuple2!18253 lt!336109 (_2!9780 lt!335825)))))

(declare-fun lt!336122 () Unit!15168)

(declare-fun lt!336127 () Unit!15168)

(assert (=> d!72023 (= lt!336122 lt!336127)))

(assert (=> d!72023 (isPrefixOf!0 lt!336109 (_2!9780 lt!335825))))

(assert (=> d!72023 (= lt!336127 (lemmaIsPrefixTransitive!0 lt!336109 (_2!9780 lt!335825) (_2!9780 lt!335825)))))

(declare-fun lt!336119 () Unit!15168)

(declare-fun lt!336124 () Unit!15168)

(assert (=> d!72023 (= lt!336119 lt!336124)))

(assert (=> d!72023 (isPrefixOf!0 lt!336109 (_2!9780 lt!335825))))

(assert (=> d!72023 (= lt!336124 (lemmaIsPrefixTransitive!0 lt!336109 (_2!9780 lt!335851) (_2!9780 lt!335825)))))

(declare-fun lt!336126 () Unit!15168)

(declare-fun e!145224 () Unit!15168)

(assert (=> d!72023 (= lt!336126 e!145224)))

(declare-fun c!10452 () Bool)

(assert (=> d!72023 (= c!10452 (not (= (size!4631 (buf!5160 (_2!9780 lt!335851))) #b00000000000000000000000000000000)))))

(declare-fun lt!336116 () Unit!15168)

(declare-fun lt!336111 () Unit!15168)

(assert (=> d!72023 (= lt!336116 lt!336111)))

(assert (=> d!72023 (isPrefixOf!0 (_2!9780 lt!335825) (_2!9780 lt!335825))))

(assert (=> d!72023 (= lt!336111 (lemmaIsPrefixRefl!0 (_2!9780 lt!335825)))))

(declare-fun lt!336112 () Unit!15168)

(declare-fun lt!336108 () Unit!15168)

(assert (=> d!72023 (= lt!336112 lt!336108)))

(assert (=> d!72023 (= lt!336108 (lemmaIsPrefixRefl!0 (_2!9780 lt!335825)))))

(declare-fun lt!336113 () Unit!15168)

(declare-fun lt!336125 () Unit!15168)

(assert (=> d!72023 (= lt!336113 lt!336125)))

(assert (=> d!72023 (isPrefixOf!0 lt!336109 lt!336109)))

(assert (=> d!72023 (= lt!336125 (lemmaIsPrefixRefl!0 lt!336109))))

(declare-fun lt!336114 () Unit!15168)

(declare-fun lt!336117 () Unit!15168)

(assert (=> d!72023 (= lt!336114 lt!336117)))

(assert (=> d!72023 (isPrefixOf!0 (_2!9780 lt!335851) (_2!9780 lt!335851))))

(assert (=> d!72023 (= lt!336117 (lemmaIsPrefixRefl!0 (_2!9780 lt!335851)))))

(assert (=> d!72023 (= lt!336109 (BitStream!8371 (buf!5160 (_2!9780 lt!335825)) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(assert (=> d!72023 (isPrefixOf!0 (_2!9780 lt!335851) (_2!9780 lt!335825))))

(assert (=> d!72023 (= (reader!0 (_2!9780 lt!335851) (_2!9780 lt!335825)) lt!336121)))

(declare-fun lt!336110 () (_ BitVec 64))

(declare-fun b!213164 () Bool)

(declare-fun lt!336120 () (_ BitVec 64))

(assert (=> b!213164 (= e!145223 (= (_1!9781 lt!336121) (withMovedBitIndex!0 (_2!9781 lt!336121) (bvsub lt!336120 lt!336110))))))

(assert (=> b!213164 (or (= (bvand lt!336120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336110 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336120 lt!336110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213164 (= lt!336110 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335825))) (currentByte!9726 (_2!9780 lt!335825)) (currentBit!9721 (_2!9780 lt!335825))))))

(assert (=> b!213164 (= lt!336120 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(declare-fun b!213165 () Bool)

(declare-fun Unit!15175 () Unit!15168)

(assert (=> b!213165 (= e!145224 Unit!15175)))

(declare-fun b!213166 () Bool)

(declare-fun res!179138 () Bool)

(assert (=> b!213166 (=> (not res!179138) (not e!145223))))

(assert (=> b!213166 (= res!179138 (isPrefixOf!0 (_1!9781 lt!336121) (_2!9780 lt!335851)))))

(declare-fun b!213167 () Bool)

(declare-fun lt!336115 () Unit!15168)

(assert (=> b!213167 (= e!145224 lt!336115)))

(declare-fun lt!336118 () (_ BitVec 64))

(assert (=> b!213167 (= lt!336118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!336123 () (_ BitVec 64))

(assert (=> b!213167 (= lt!336123 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(assert (=> b!213167 (= lt!336115 (arrayBitRangesEqSymmetric!0 (buf!5160 (_2!9780 lt!335851)) (buf!5160 (_2!9780 lt!335825)) lt!336118 lt!336123))))

(assert (=> b!213167 (arrayBitRangesEq!0 (buf!5160 (_2!9780 lt!335825)) (buf!5160 (_2!9780 lt!335851)) lt!336118 lt!336123)))

(assert (= (and d!72023 c!10452) b!213167))

(assert (= (and d!72023 (not c!10452)) b!213165))

(assert (= (and d!72023 res!179137) b!213166))

(assert (= (and b!213166 res!179138) b!213163))

(assert (= (and b!213163 res!179136) b!213164))

(declare-fun m!328473 () Bool)

(assert (=> b!213163 m!328473))

(declare-fun m!328475 () Bool)

(assert (=> d!72023 m!328475))

(declare-fun m!328477 () Bool)

(assert (=> d!72023 m!328477))

(declare-fun m!328479 () Bool)

(assert (=> d!72023 m!328479))

(declare-fun m!328481 () Bool)

(assert (=> d!72023 m!328481))

(declare-fun m!328483 () Bool)

(assert (=> d!72023 m!328483))

(declare-fun m!328485 () Bool)

(assert (=> d!72023 m!328485))

(declare-fun m!328487 () Bool)

(assert (=> d!72023 m!328487))

(declare-fun m!328489 () Bool)

(assert (=> d!72023 m!328489))

(assert (=> d!72023 m!328461))

(assert (=> d!72023 m!328209))

(assert (=> d!72023 m!328463))

(declare-fun m!328491 () Bool)

(assert (=> b!213166 m!328491))

(declare-fun m!328493 () Bool)

(assert (=> b!213164 m!328493))

(assert (=> b!213164 m!328239))

(assert (=> b!213164 m!328233))

(assert (=> b!213167 m!328233))

(declare-fun m!328495 () Bool)

(assert (=> b!213167 m!328495))

(declare-fun m!328497 () Bool)

(assert (=> b!213167 m!328497))

(assert (=> b!213040 d!72023))

(declare-fun d!72025 () Bool)

(declare-fun e!145225 () Bool)

(assert (=> d!72025 e!145225))

(declare-fun res!179140 () Bool)

(assert (=> d!72025 (=> (not res!179140) (not e!145225))))

(declare-fun lt!336133 () (_ BitVec 64))

(declare-fun lt!336130 () (_ BitVec 64))

(declare-fun lt!336128 () (_ BitVec 64))

(assert (=> d!72025 (= res!179140 (= lt!336133 (bvsub lt!336130 lt!336128)))))

(assert (=> d!72025 (or (= (bvand lt!336130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336128 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336130 lt!336128) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72025 (= lt!336128 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335825))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335825)))))))

(declare-fun lt!336131 () (_ BitVec 64))

(declare-fun lt!336129 () (_ BitVec 64))

(assert (=> d!72025 (= lt!336130 (bvmul lt!336131 lt!336129))))

(assert (=> d!72025 (or (= lt!336131 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336129 (bvsdiv (bvmul lt!336131 lt!336129) lt!336131)))))

(assert (=> d!72025 (= lt!336129 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72025 (= lt!336131 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))))))

(assert (=> d!72025 (= lt!336133 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335825))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335825)))))))

(assert (=> d!72025 (invariant!0 (currentBit!9721 (_2!9780 lt!335825)) (currentByte!9726 (_2!9780 lt!335825)) (size!4631 (buf!5160 (_2!9780 lt!335825))))))

(assert (=> d!72025 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335825))) (currentByte!9726 (_2!9780 lt!335825)) (currentBit!9721 (_2!9780 lt!335825))) lt!336133)))

(declare-fun b!213168 () Bool)

(declare-fun res!179139 () Bool)

(assert (=> b!213168 (=> (not res!179139) (not e!145225))))

(assert (=> b!213168 (= res!179139 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336133))))

(declare-fun b!213169 () Bool)

(declare-fun lt!336132 () (_ BitVec 64))

(assert (=> b!213169 (= e!145225 (bvsle lt!336133 (bvmul lt!336132 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213169 (or (= lt!336132 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336132 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336132)))))

(assert (=> b!213169 (= lt!336132 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335825)))))))

(assert (= (and d!72025 res!179140) b!213168))

(assert (= (and b!213168 res!179139) b!213169))

(declare-fun m!328499 () Bool)

(assert (=> d!72025 m!328499))

(assert (=> d!72025 m!328279))

(assert (=> b!213051 d!72025))

(declare-fun d!72027 () Bool)

(declare-fun res!179149 () Bool)

(declare-fun e!145231 () Bool)

(assert (=> d!72027 (=> (not res!179149) (not e!145231))))

(assert (=> d!72027 (= res!179149 (= (size!4631 (buf!5160 thiss!1204)) (size!4631 (buf!5160 (_2!9780 lt!335825)))))))

(assert (=> d!72027 (= (isPrefixOf!0 thiss!1204 (_2!9780 lt!335825)) e!145231)))

(declare-fun b!213176 () Bool)

(declare-fun res!179148 () Bool)

(assert (=> b!213176 (=> (not res!179148) (not e!145231))))

(assert (=> b!213176 (= res!179148 (bvsle (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335825))) (currentByte!9726 (_2!9780 lt!335825)) (currentBit!9721 (_2!9780 lt!335825)))))))

(declare-fun b!213177 () Bool)

(declare-fun e!145230 () Bool)

(assert (=> b!213177 (= e!145231 e!145230)))

(declare-fun res!179147 () Bool)

(assert (=> b!213177 (=> res!179147 e!145230)))

(assert (=> b!213177 (= res!179147 (= (size!4631 (buf!5160 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213178 () Bool)

(assert (=> b!213178 (= e!145230 (arrayBitRangesEq!0 (buf!5160 thiss!1204) (buf!5160 (_2!9780 lt!335825)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204))))))

(assert (= (and d!72027 res!179149) b!213176))

(assert (= (and b!213176 res!179148) b!213177))

(assert (= (and b!213177 (not res!179147)) b!213178))

(assert (=> b!213176 m!328235))

(assert (=> b!213176 m!328239))

(assert (=> b!213178 m!328235))

(assert (=> b!213178 m!328235))

(declare-fun m!328501 () Bool)

(assert (=> b!213178 m!328501))

(assert (=> b!213051 d!72027))

(declare-fun d!72029 () Bool)

(assert (=> d!72029 (isPrefixOf!0 thiss!1204 (_2!9780 lt!335825))))

(declare-fun lt!336136 () Unit!15168)

(declare-fun choose!30 (BitStream!8370 BitStream!8370 BitStream!8370) Unit!15168)

(assert (=> d!72029 (= lt!336136 (choose!30 thiss!1204 (_2!9780 lt!335851) (_2!9780 lt!335825)))))

(assert (=> d!72029 (isPrefixOf!0 thiss!1204 (_2!9780 lt!335851))))

(assert (=> d!72029 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9780 lt!335851) (_2!9780 lt!335825)) lt!336136)))

(declare-fun bs!17677 () Bool)

(assert (= bs!17677 d!72029))

(assert (=> bs!17677 m!328241))

(declare-fun m!328503 () Bool)

(assert (=> bs!17677 m!328503))

(assert (=> bs!17677 m!328231))

(assert (=> b!213051 d!72029))

(declare-fun b!213361 () Bool)

(declare-fun e!145340 () (_ BitVec 64))

(assert (=> b!213361 (= e!145340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!213362 () Bool)

(declare-fun res!179314 () Bool)

(declare-fun e!145342 () Bool)

(assert (=> b!213362 (=> (not res!179314) (not e!145342))))

(declare-fun lt!336673 () tuple2!18250)

(assert (=> b!213362 (= res!179314 (= (size!4631 (buf!5160 (_2!9780 lt!335851))) (size!4631 (buf!5160 (_2!9780 lt!336673)))))))

(declare-fun b!213363 () Bool)

(declare-fun e!145345 () Bool)

(declare-fun lt!336671 () tuple2!18256)

(declare-fun lt!336658 () tuple2!18252)

(assert (=> b!213363 (= e!145345 (= (_1!9783 lt!336671) (_2!9781 lt!336658)))))

(declare-fun b!213364 () Bool)

(declare-fun e!145341 () Bool)

(declare-fun lt!336677 () tuple2!18254)

(declare-fun lt!336650 () tuple2!18250)

(assert (=> b!213364 (= e!145341 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!336677))) (currentByte!9726 (_1!9782 lt!336677)) (currentBit!9721 (_1!9782 lt!336677))) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336650))) (currentByte!9726 (_2!9780 lt!336650)) (currentBit!9721 (_2!9780 lt!336650)))))))

(declare-fun b!213365 () Bool)

(declare-fun res!179311 () Bool)

(assert (=> b!213365 (=> (not res!179311) (not e!145342))))

(assert (=> b!213365 (= res!179311 (isPrefixOf!0 (_2!9780 lt!335851) (_2!9780 lt!336673)))))

(declare-fun b!213366 () Bool)

(declare-fun e!145338 () Bool)

(declare-fun lt!336703 () (_ BitVec 64))

(assert (=> b!213366 (= e!145338 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!335851)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!336703))))

(declare-fun b!213367 () Bool)

(assert (=> b!213367 (= e!145342 e!145345)))

(declare-fun res!179303 () Bool)

(assert (=> b!213367 (=> (not res!179303) (not e!145345))))

(assert (=> b!213367 (= res!179303 (= (_2!9783 lt!336671) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213367 (= lt!336671 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!336658) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!336675 () Unit!15168)

(declare-fun lt!336684 () Unit!15168)

(assert (=> b!213367 (= lt!336675 lt!336684)))

(assert (=> b!213367 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!336673)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!336703)))

(assert (=> b!213367 (= lt!336684 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9780 lt!335851) (buf!5160 (_2!9780 lt!336673)) lt!336703))))

(assert (=> b!213367 e!145338))

(declare-fun res!179309 () Bool)

(assert (=> b!213367 (=> (not res!179309) (not e!145338))))

(assert (=> b!213367 (= res!179309 (and (= (size!4631 (buf!5160 (_2!9780 lt!335851))) (size!4631 (buf!5160 (_2!9780 lt!336673)))) (bvsge lt!336703 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213367 (= lt!336703 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!213367 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!213367 (= lt!336658 (reader!0 (_2!9780 lt!335851) (_2!9780 lt!336673)))))

(declare-fun b!213368 () Bool)

(declare-fun e!145343 () Bool)

(declare-fun lt!336689 () tuple2!18256)

(declare-fun lt!336692 () tuple2!18252)

(assert (=> b!213368 (= e!145343 (= (_1!9783 lt!336689) (_2!9781 lt!336692)))))

(declare-fun b!213370 () Bool)

(declare-fun e!145346 () tuple2!18250)

(declare-fun lt!336688 () tuple2!18250)

(assert (=> b!213370 (= e!145346 (tuple2!18251 (_1!9780 lt!336688) (_2!9780 lt!336688)))))

(declare-fun lt!336669 () Bool)

(assert (=> b!213370 (= lt!336669 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213370 (= lt!336650 (appendBit!0 (_2!9780 lt!335851) lt!336669))))

(declare-fun res!179306 () Bool)

(assert (=> b!213370 (= res!179306 (= (size!4631 (buf!5160 (_2!9780 lt!335851))) (size!4631 (buf!5160 (_2!9780 lt!336650)))))))

(declare-fun e!145344 () Bool)

(assert (=> b!213370 (=> (not res!179306) (not e!145344))))

(assert (=> b!213370 e!145344))

(declare-fun lt!336660 () tuple2!18250)

(assert (=> b!213370 (= lt!336660 lt!336650)))

(assert (=> b!213370 (= lt!336688 (appendBitsLSBFirstLoopTR!0 (_2!9780 lt!336660) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!336682 () Unit!15168)

(assert (=> b!213370 (= lt!336682 (lemmaIsPrefixTransitive!0 (_2!9780 lt!335851) (_2!9780 lt!336660) (_2!9780 lt!336688)))))

(assert (=> b!213370 (isPrefixOf!0 (_2!9780 lt!335851) (_2!9780 lt!336688))))

(declare-fun lt!336702 () Unit!15168)

(assert (=> b!213370 (= lt!336702 lt!336682)))

(assert (=> b!213370 (invariant!0 (currentBit!9721 (_2!9780 lt!335851)) (currentByte!9726 (_2!9780 lt!335851)) (size!4631 (buf!5160 (_2!9780 lt!336660))))))

(declare-fun lt!336676 () BitStream!8370)

(assert (=> b!213370 (= lt!336676 (BitStream!8371 (buf!5160 (_2!9780 lt!336660)) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(assert (=> b!213370 (invariant!0 (currentBit!9721 lt!336676) (currentByte!9726 lt!336676) (size!4631 (buf!5160 (_2!9780 lt!336688))))))

(declare-fun lt!336681 () BitStream!8370)

(assert (=> b!213370 (= lt!336681 (BitStream!8371 (buf!5160 (_2!9780 lt!336688)) (currentByte!9726 lt!336676) (currentBit!9721 lt!336676)))))

(declare-fun lt!336664 () tuple2!18254)

(assert (=> b!213370 (= lt!336664 (readBitPure!0 lt!336676))))

(declare-fun lt!336667 () tuple2!18254)

(assert (=> b!213370 (= lt!336667 (readBitPure!0 lt!336681))))

(declare-fun lt!336685 () Unit!15168)

(assert (=> b!213370 (= lt!336685 (readBitPrefixLemma!0 lt!336676 (_2!9780 lt!336688)))))

(declare-fun res!179305 () Bool)

(assert (=> b!213370 (= res!179305 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!336664))) (currentByte!9726 (_1!9782 lt!336664)) (currentBit!9721 (_1!9782 lt!336664))) (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!336667))) (currentByte!9726 (_1!9782 lt!336667)) (currentBit!9721 (_1!9782 lt!336667)))))))

(declare-fun e!145339 () Bool)

(assert (=> b!213370 (=> (not res!179305) (not e!145339))))

(assert (=> b!213370 e!145339))

(declare-fun lt!336691 () Unit!15168)

(assert (=> b!213370 (= lt!336691 lt!336685)))

(declare-fun lt!336661 () tuple2!18252)

(assert (=> b!213370 (= lt!336661 (reader!0 (_2!9780 lt!335851) (_2!9780 lt!336688)))))

(declare-fun lt!336663 () tuple2!18252)

(assert (=> b!213370 (= lt!336663 (reader!0 (_2!9780 lt!336660) (_2!9780 lt!336688)))))

(declare-fun lt!336683 () tuple2!18254)

(assert (=> b!213370 (= lt!336683 (readBitPure!0 (_1!9781 lt!336661)))))

(assert (=> b!213370 (= (_2!9782 lt!336683) lt!336669)))

(declare-fun lt!336678 () Unit!15168)

(declare-fun Unit!15186 () Unit!15168)

(assert (=> b!213370 (= lt!336678 Unit!15186)))

(declare-fun lt!336672 () (_ BitVec 64))

(assert (=> b!213370 (= lt!336672 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336696 () (_ BitVec 64))

(assert (=> b!213370 (= lt!336696 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336679 () Unit!15168)

(assert (=> b!213370 (= lt!336679 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9780 lt!335851) (buf!5160 (_2!9780 lt!336688)) lt!336696))))

(assert (=> b!213370 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!336688)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!336696)))

(declare-fun lt!336665 () Unit!15168)

(assert (=> b!213370 (= lt!336665 lt!336679)))

(declare-fun lt!336690 () tuple2!18256)

(assert (=> b!213370 (= lt!336690 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!336661) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336672))))

(declare-fun lt!336699 () (_ BitVec 64))

(assert (=> b!213370 (= lt!336699 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!336668 () Unit!15168)

(assert (=> b!213370 (= lt!336668 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9780 lt!336660) (buf!5160 (_2!9780 lt!336688)) lt!336699))))

(assert (=> b!213370 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!336688)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!336660))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!336660))) lt!336699)))

(declare-fun lt!336697 () Unit!15168)

(assert (=> b!213370 (= lt!336697 lt!336668)))

(declare-fun lt!336670 () tuple2!18256)

(assert (=> b!213370 (= lt!336670 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!336663) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!336672 (ite (_2!9782 lt!336683) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!336686 () tuple2!18256)

(assert (=> b!213370 (= lt!336686 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!336661) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336672))))

(declare-fun c!10467 () Bool)

(assert (=> b!213370 (= c!10467 (_2!9782 (readBitPure!0 (_1!9781 lt!336661))))))

(declare-fun lt!336694 () tuple2!18256)

(assert (=> b!213370 (= lt!336694 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9781 lt!336661) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!336672 e!145340)))))

(declare-fun lt!336680 () Unit!15168)

(assert (=> b!213370 (= lt!336680 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9781 lt!336661) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336672))))

(assert (=> b!213370 (and (= (_2!9783 lt!336686) (_2!9783 lt!336694)) (= (_1!9783 lt!336686) (_1!9783 lt!336694)))))

(declare-fun lt!336662 () Unit!15168)

(assert (=> b!213370 (= lt!336662 lt!336680)))

(assert (=> b!213370 (= (_1!9781 lt!336661) (withMovedBitIndex!0 (_2!9781 lt!336661) (bvsub (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336688))) (currentByte!9726 (_2!9780 lt!336688)) (currentBit!9721 (_2!9780 lt!336688))))))))

(declare-fun lt!336653 () Unit!15168)

(declare-fun Unit!15188 () Unit!15168)

(assert (=> b!213370 (= lt!336653 Unit!15188)))

(assert (=> b!213370 (= (_1!9781 lt!336663) (withMovedBitIndex!0 (_2!9781 lt!336663) (bvsub (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336660))) (currentByte!9726 (_2!9780 lt!336660)) (currentBit!9721 (_2!9780 lt!336660))) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336688))) (currentByte!9726 (_2!9780 lt!336688)) (currentBit!9721 (_2!9780 lt!336688))))))))

(declare-fun lt!336657 () Unit!15168)

(declare-fun Unit!15189 () Unit!15168)

(assert (=> b!213370 (= lt!336657 Unit!15189)))

(assert (=> b!213370 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))) (bvsub (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336660))) (currentByte!9726 (_2!9780 lt!336660)) (currentBit!9721 (_2!9780 lt!336660))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!336705 () Unit!15168)

(declare-fun Unit!15190 () Unit!15168)

(assert (=> b!213370 (= lt!336705 Unit!15190)))

(assert (=> b!213370 (= (_2!9783 lt!336690) (_2!9783 lt!336670))))

(declare-fun lt!336654 () Unit!15168)

(declare-fun Unit!15191 () Unit!15168)

(assert (=> b!213370 (= lt!336654 Unit!15191)))

(assert (=> b!213370 (invariant!0 (currentBit!9721 (_2!9780 lt!336688)) (currentByte!9726 (_2!9780 lt!336688)) (size!4631 (buf!5160 (_2!9780 lt!336688))))))

(declare-fun lt!336698 () Unit!15168)

(declare-fun Unit!15192 () Unit!15168)

(assert (=> b!213370 (= lt!336698 Unit!15192)))

(assert (=> b!213370 (= (size!4631 (buf!5160 (_2!9780 lt!335851))) (size!4631 (buf!5160 (_2!9780 lt!336688))))))

(declare-fun lt!336651 () Unit!15168)

(declare-fun Unit!15193 () Unit!15168)

(assert (=> b!213370 (= lt!336651 Unit!15193)))

(assert (=> b!213370 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336688))) (currentByte!9726 (_2!9780 lt!336688)) (currentBit!9721 (_2!9780 lt!336688))) (bvsub (bvadd (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336659 () Unit!15168)

(declare-fun Unit!15194 () Unit!15168)

(assert (=> b!213370 (= lt!336659 Unit!15194)))

(declare-fun lt!336693 () Unit!15168)

(declare-fun Unit!15195 () Unit!15168)

(assert (=> b!213370 (= lt!336693 Unit!15195)))

(assert (=> b!213370 (= lt!336692 (reader!0 (_2!9780 lt!335851) (_2!9780 lt!336688)))))

(declare-fun lt!336674 () (_ BitVec 64))

(assert (=> b!213370 (= lt!336674 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336695 () Unit!15168)

(assert (=> b!213370 (= lt!336695 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9780 lt!335851) (buf!5160 (_2!9780 lt!336688)) lt!336674))))

(assert (=> b!213370 (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 (_2!9780 lt!336688)))) ((_ sign_extend 32) (currentByte!9726 (_2!9780 lt!335851))) ((_ sign_extend 32) (currentBit!9721 (_2!9780 lt!335851))) lt!336674)))

(declare-fun lt!336700 () Unit!15168)

(assert (=> b!213370 (= lt!336700 lt!336695)))

(assert (=> b!213370 (= lt!336689 (readNBitsLSBFirstsLoopPure!0 (_1!9781 lt!336692) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!179307 () Bool)

(assert (=> b!213370 (= res!179307 (= (_2!9783 lt!336689) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213370 (=> (not res!179307) (not e!145343))))

(assert (=> b!213370 e!145343))

(declare-fun lt!336652 () Unit!15168)

(declare-fun Unit!15198 () Unit!15168)

(assert (=> b!213370 (= lt!336652 Unit!15198)))

(declare-fun b!213371 () Bool)

(declare-fun res!179308 () Bool)

(assert (=> b!213371 (=> (not res!179308) (not e!145342))))

(declare-fun lt!336655 () (_ BitVec 64))

(declare-fun lt!336701 () (_ BitVec 64))

(assert (=> b!213371 (= res!179308 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336673))) (currentByte!9726 (_2!9780 lt!336673)) (currentBit!9721 (_2!9780 lt!336673))) (bvsub lt!336701 lt!336655)))))

(assert (=> b!213371 (or (= (bvand lt!336701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336655 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336701 lt!336655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213371 (= lt!336655 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!336687 () (_ BitVec 64))

(declare-fun lt!336704 () (_ BitVec 64))

(assert (=> b!213371 (= lt!336701 (bvadd lt!336687 lt!336704))))

(assert (=> b!213371 (or (not (= (bvand lt!336687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336704 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336687 lt!336704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213371 (= lt!336704 ((_ sign_extend 32) nBits!348))))

(assert (=> b!213371 (= lt!336687 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))))))

(declare-fun c!10468 () Bool)

(declare-fun call!3350 () Bool)

(declare-fun bm!3347 () Bool)

(assert (=> bm!3347 (= call!3350 (isPrefixOf!0 (_2!9780 lt!335851) (ite c!10468 (_2!9780 lt!335851) (_2!9780 lt!336650))))))

(declare-fun b!213372 () Bool)

(assert (=> b!213372 (= e!145339 (= (_2!9782 lt!336664) (_2!9782 lt!336667)))))

(declare-fun b!213373 () Bool)

(declare-fun res!179304 () Bool)

(assert (=> b!213373 (= res!179304 call!3350)))

(assert (=> b!213373 (=> (not res!179304) (not e!145344))))

(declare-fun b!213374 () Bool)

(declare-fun Unit!15203 () Unit!15168)

(assert (=> b!213374 (= e!145346 (tuple2!18251 Unit!15203 (_2!9780 lt!335851)))))

(declare-fun lt!336656 () Unit!15168)

(assert (=> b!213374 (= lt!336656 (lemmaIsPrefixRefl!0 (_2!9780 lt!335851)))))

(assert (=> b!213374 call!3350))

(declare-fun lt!336666 () Unit!15168)

(assert (=> b!213374 (= lt!336666 lt!336656)))

(declare-fun d!72031 () Bool)

(assert (=> d!72031 e!145342))

(declare-fun res!179313 () Bool)

(assert (=> d!72031 (=> (not res!179313) (not e!145342))))

(assert (=> d!72031 (= res!179313 (invariant!0 (currentBit!9721 (_2!9780 lt!336673)) (currentByte!9726 (_2!9780 lt!336673)) (size!4631 (buf!5160 (_2!9780 lt!336673)))))))

(assert (=> d!72031 (= lt!336673 e!145346)))

(assert (=> d!72031 (= c!10468 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72031 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72031 (= (appendBitsLSBFirstLoopTR!0 (_2!9780 lt!335851) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!336673)))

(declare-fun b!213369 () Bool)

(assert (=> b!213369 (= lt!336677 (readBitPure!0 (readerFrom!0 (_2!9780 lt!336650) (currentBit!9721 (_2!9780 lt!335851)) (currentByte!9726 (_2!9780 lt!335851)))))))

(declare-fun res!179310 () Bool)

(assert (=> b!213369 (= res!179310 (and (= (_2!9782 lt!336677) lt!336669) (= (_1!9782 lt!336677) (_2!9780 lt!336650))))))

(assert (=> b!213369 (=> (not res!179310) (not e!145341))))

(assert (=> b!213369 (= e!145344 e!145341)))

(declare-fun b!213375 () Bool)

(assert (=> b!213375 (= e!145340 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!213376 () Bool)

(declare-fun res!179312 () Bool)

(assert (=> b!213376 (= res!179312 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336650))) (currentByte!9726 (_2!9780 lt!336650)) (currentBit!9721 (_2!9780 lt!336650))) (bvadd (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!213376 (=> (not res!179312) (not e!145344))))

(assert (= (and d!72031 c!10468) b!213374))

(assert (= (and d!72031 (not c!10468)) b!213370))

(assert (= (and b!213370 res!179306) b!213376))

(assert (= (and b!213376 res!179312) b!213373))

(assert (= (and b!213373 res!179304) b!213369))

(assert (= (and b!213369 res!179310) b!213364))

(assert (= (and b!213370 res!179305) b!213372))

(assert (= (and b!213370 c!10467) b!213375))

(assert (= (and b!213370 (not c!10467)) b!213361))

(assert (= (and b!213370 res!179307) b!213368))

(assert (= (or b!213374 b!213373) bm!3347))

(assert (= (and d!72031 res!179313) b!213362))

(assert (= (and b!213362 res!179314) b!213371))

(assert (= (and b!213371 res!179308) b!213365))

(assert (= (and b!213365 res!179311) b!213367))

(assert (= (and b!213367 res!179309) b!213366))

(assert (= (and b!213367 res!179303) b!213363))

(declare-fun m!328685 () Bool)

(assert (=> d!72031 m!328685))

(declare-fun m!328687 () Bool)

(assert (=> b!213369 m!328687))

(assert (=> b!213369 m!328687))

(declare-fun m!328689 () Bool)

(assert (=> b!213369 m!328689))

(declare-fun m!328691 () Bool)

(assert (=> b!213365 m!328691))

(declare-fun m!328693 () Bool)

(assert (=> b!213366 m!328693))

(declare-fun m!328695 () Bool)

(assert (=> b!213376 m!328695))

(assert (=> b!213376 m!328233))

(declare-fun m!328697 () Bool)

(assert (=> bm!3347 m!328697))

(declare-fun m!328699 () Bool)

(assert (=> b!213370 m!328699))

(declare-fun m!328701 () Bool)

(assert (=> b!213370 m!328701))

(declare-fun m!328703 () Bool)

(assert (=> b!213370 m!328703))

(declare-fun m!328705 () Bool)

(assert (=> b!213370 m!328705))

(declare-fun m!328707 () Bool)

(assert (=> b!213370 m!328707))

(declare-fun m!328709 () Bool)

(assert (=> b!213370 m!328709))

(declare-fun m!328711 () Bool)

(assert (=> b!213370 m!328711))

(declare-fun m!328713 () Bool)

(assert (=> b!213370 m!328713))

(declare-fun m!328715 () Bool)

(assert (=> b!213370 m!328715))

(declare-fun m!328717 () Bool)

(assert (=> b!213370 m!328717))

(declare-fun m!328719 () Bool)

(assert (=> b!213370 m!328719))

(declare-fun m!328721 () Bool)

(assert (=> b!213370 m!328721))

(declare-fun m!328723 () Bool)

(assert (=> b!213370 m!328723))

(declare-fun m!328725 () Bool)

(assert (=> b!213370 m!328725))

(declare-fun m!328727 () Bool)

(assert (=> b!213370 m!328727))

(declare-fun m!328729 () Bool)

(assert (=> b!213370 m!328729))

(declare-fun m!328731 () Bool)

(assert (=> b!213370 m!328731))

(declare-fun m!328733 () Bool)

(assert (=> b!213370 m!328733))

(declare-fun m!328735 () Bool)

(assert (=> b!213370 m!328735))

(assert (=> b!213370 m!328233))

(declare-fun m!328737 () Bool)

(assert (=> b!213370 m!328737))

(declare-fun m!328739 () Bool)

(assert (=> b!213370 m!328739))

(declare-fun m!328741 () Bool)

(assert (=> b!213370 m!328741))

(declare-fun m!328743 () Bool)

(assert (=> b!213370 m!328743))

(declare-fun m!328745 () Bool)

(assert (=> b!213370 m!328745))

(declare-fun m!328747 () Bool)

(assert (=> b!213370 m!328747))

(assert (=> b!213370 m!328721))

(declare-fun m!328749 () Bool)

(assert (=> b!213370 m!328749))

(declare-fun m!328751 () Bool)

(assert (=> b!213370 m!328751))

(declare-fun m!328753 () Bool)

(assert (=> b!213370 m!328753))

(declare-fun m!328755 () Bool)

(assert (=> b!213370 m!328755))

(declare-fun m!328757 () Bool)

(assert (=> b!213370 m!328757))

(declare-fun m!328759 () Bool)

(assert (=> b!213370 m!328759))

(declare-fun m!328761 () Bool)

(assert (=> b!213370 m!328761))

(declare-fun m!328763 () Bool)

(assert (=> b!213370 m!328763))

(declare-fun m!328765 () Bool)

(assert (=> b!213364 m!328765))

(assert (=> b!213364 m!328695))

(declare-fun m!328767 () Bool)

(assert (=> b!213367 m!328767))

(declare-fun m!328769 () Bool)

(assert (=> b!213367 m!328769))

(declare-fun m!328771 () Bool)

(assert (=> b!213367 m!328771))

(declare-fun m!328773 () Bool)

(assert (=> b!213367 m!328773))

(assert (=> b!213367 m!328759))

(assert (=> b!213367 m!328763))

(declare-fun m!328775 () Bool)

(assert (=> b!213371 m!328775))

(assert (=> b!213371 m!328233))

(assert (=> b!213374 m!328479))

(assert (=> b!213051 d!72031))

(declare-fun d!72091 () Bool)

(declare-fun lt!336771 () tuple2!18270)

(assert (=> d!72091 (= lt!336771 (readBit!0 (readerFrom!0 (_2!9780 lt!335851) (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204))))))

(assert (=> d!72091 (= (readBitPure!0 (readerFrom!0 (_2!9780 lt!335851) (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204))) (tuple2!18255 (_2!9790 lt!336771) (_1!9790 lt!336771)))))

(declare-fun bs!17685 () Bool)

(assert (= bs!17685 d!72091))

(assert (=> bs!17685 m!328213))

(declare-fun m!328797 () Bool)

(assert (=> bs!17685 m!328797))

(assert (=> b!213030 d!72091))

(declare-fun d!72095 () Bool)

(declare-fun e!145365 () Bool)

(assert (=> d!72095 e!145365))

(declare-fun res!179340 () Bool)

(assert (=> d!72095 (=> (not res!179340) (not e!145365))))

(assert (=> d!72095 (= res!179340 (invariant!0 (currentBit!9721 (_2!9780 lt!335851)) (currentByte!9726 (_2!9780 lt!335851)) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(assert (=> d!72095 (= (readerFrom!0 (_2!9780 lt!335851) (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204)) (BitStream!8371 (buf!5160 (_2!9780 lt!335851)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun b!213404 () Bool)

(assert (=> b!213404 (= e!145365 (invariant!0 (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(assert (= (and d!72095 res!179340) b!213404))

(assert (=> d!72095 m!328367))

(assert (=> b!213404 m!328271))

(assert (=> b!213030 d!72095))

(declare-fun d!72107 () Bool)

(declare-fun res!179345 () Bool)

(declare-fun e!145368 () Bool)

(assert (=> d!72107 (=> (not res!179345) (not e!145368))))

(assert (=> d!72107 (= res!179345 (= (size!4631 (buf!5160 thiss!1204)) (size!4631 (buf!5160 (_2!9780 lt!335851)))))))

(assert (=> d!72107 (= (isPrefixOf!0 thiss!1204 (_2!9780 lt!335851)) e!145368)))

(declare-fun b!213407 () Bool)

(declare-fun res!179344 () Bool)

(assert (=> b!213407 (=> (not res!179344) (not e!145368))))

(assert (=> b!213407 (= res!179344 (bvsle (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851)))))))

(declare-fun b!213408 () Bool)

(declare-fun e!145367 () Bool)

(assert (=> b!213408 (= e!145368 e!145367)))

(declare-fun res!179343 () Bool)

(assert (=> b!213408 (=> res!179343 e!145367)))

(assert (=> b!213408 (= res!179343 (= (size!4631 (buf!5160 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213409 () Bool)

(assert (=> b!213409 (= e!145367 (arrayBitRangesEq!0 (buf!5160 thiss!1204) (buf!5160 (_2!9780 lt!335851)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204))))))

(assert (= (and d!72107 res!179345) b!213407))

(assert (= (and b!213407 res!179344) b!213408))

(assert (= (and b!213408 (not res!179343)) b!213409))

(assert (=> b!213407 m!328235))

(assert (=> b!213407 m!328233))

(assert (=> b!213409 m!328235))

(assert (=> b!213409 m!328235))

(declare-fun m!328895 () Bool)

(assert (=> b!213409 m!328895))

(assert (=> b!213041 d!72107))

(assert (=> b!213031 d!71971))

(assert (=> b!213031 d!71973))

(declare-fun b!213429 () Bool)

(declare-fun e!145380 () Bool)

(declare-fun e!145381 () Bool)

(assert (=> b!213429 (= e!145380 e!145381)))

(declare-fun res!179363 () Bool)

(assert (=> b!213429 (=> (not res!179363) (not e!145381))))

(declare-fun lt!336826 () tuple2!18254)

(declare-fun lt!336825 () tuple2!18250)

(assert (=> b!213429 (= res!179363 (and (= (_2!9782 lt!336826) lt!335849) (= (_1!9782 lt!336826) (_2!9780 lt!336825))))))

(assert (=> b!213429 (= lt!336826 (readBitPure!0 (readerFrom!0 (_2!9780 lt!336825) (currentBit!9721 thiss!1204) (currentByte!9726 thiss!1204))))))

(declare-fun b!213427 () Bool)

(declare-fun res!179362 () Bool)

(assert (=> b!213427 (=> (not res!179362) (not e!145380))))

(declare-fun lt!336827 () (_ BitVec 64))

(declare-fun lt!336824 () (_ BitVec 64))

(assert (=> b!213427 (= res!179362 (= (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336825))) (currentByte!9726 (_2!9780 lt!336825)) (currentBit!9721 (_2!9780 lt!336825))) (bvadd lt!336827 lt!336824)))))

(assert (=> b!213427 (or (not (= (bvand lt!336827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336824 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336827 lt!336824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213427 (= lt!336824 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!213427 (= lt!336827 (bitIndex!0 (size!4631 (buf!5160 thiss!1204)) (currentByte!9726 thiss!1204) (currentBit!9721 thiss!1204)))))

(declare-fun b!213428 () Bool)

(declare-fun res!179364 () Bool)

(assert (=> b!213428 (=> (not res!179364) (not e!145380))))

(assert (=> b!213428 (= res!179364 (isPrefixOf!0 thiss!1204 (_2!9780 lt!336825)))))

(declare-fun d!72113 () Bool)

(assert (=> d!72113 e!145380))

(declare-fun res!179365 () Bool)

(assert (=> d!72113 (=> (not res!179365) (not e!145380))))

(assert (=> d!72113 (= res!179365 (= (size!4631 (buf!5160 thiss!1204)) (size!4631 (buf!5160 (_2!9780 lt!336825)))))))

(declare-fun choose!16 (BitStream!8370 Bool) tuple2!18250)

(assert (=> d!72113 (= lt!336825 (choose!16 thiss!1204 lt!335849))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72113 (validate_offset_bit!0 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204)))))

(assert (=> d!72113 (= (appendBit!0 thiss!1204 lt!335849) lt!336825)))

(declare-fun b!213430 () Bool)

(assert (=> b!213430 (= e!145381 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!336826))) (currentByte!9726 (_1!9782 lt!336826)) (currentBit!9721 (_1!9782 lt!336826))) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!336825))) (currentByte!9726 (_2!9780 lt!336825)) (currentBit!9721 (_2!9780 lt!336825)))))))

(assert (= (and d!72113 res!179365) b!213427))

(assert (= (and b!213427 res!179362) b!213428))

(assert (= (and b!213428 res!179364) b!213429))

(assert (= (and b!213429 res!179363) b!213430))

(declare-fun m!328921 () Bool)

(assert (=> b!213429 m!328921))

(assert (=> b!213429 m!328921))

(declare-fun m!328923 () Bool)

(assert (=> b!213429 m!328923))

(declare-fun m!328925 () Bool)

(assert (=> b!213430 m!328925))

(declare-fun m!328927 () Bool)

(assert (=> b!213430 m!328927))

(declare-fun m!328929 () Bool)

(assert (=> b!213428 m!328929))

(declare-fun m!328931 () Bool)

(assert (=> d!72113 m!328931))

(declare-fun m!328933 () Bool)

(assert (=> d!72113 m!328933))

(assert (=> b!213427 m!328927))

(assert (=> b!213427 m!328235))

(assert (=> b!213031 d!72113))

(assert (=> b!213042 d!72107))

(declare-fun d!72127 () Bool)

(declare-fun e!145382 () Bool)

(assert (=> d!72127 e!145382))

(declare-fun res!179367 () Bool)

(assert (=> d!72127 (=> (not res!179367) (not e!145382))))

(declare-fun lt!336830 () (_ BitVec 64))

(declare-fun lt!336828 () (_ BitVec 64))

(declare-fun lt!336833 () (_ BitVec 64))

(assert (=> d!72127 (= res!179367 (= lt!336833 (bvsub lt!336830 lt!336828)))))

(assert (=> d!72127 (or (= (bvand lt!336830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336828 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336830 lt!336828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72127 (= lt!336828 (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335826)))) ((_ sign_extend 32) (currentByte!9726 (_1!9782 lt!335826))) ((_ sign_extend 32) (currentBit!9721 (_1!9782 lt!335826)))))))

(declare-fun lt!336831 () (_ BitVec 64))

(declare-fun lt!336829 () (_ BitVec 64))

(assert (=> d!72127 (= lt!336830 (bvmul lt!336831 lt!336829))))

(assert (=> d!72127 (or (= lt!336831 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336829 (bvsdiv (bvmul lt!336831 lt!336829) lt!336831)))))

(assert (=> d!72127 (= lt!336829 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72127 (= lt!336831 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335826)))))))

(assert (=> d!72127 (= lt!336833 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9726 (_1!9782 lt!335826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9721 (_1!9782 lt!335826)))))))

(assert (=> d!72127 (invariant!0 (currentBit!9721 (_1!9782 lt!335826)) (currentByte!9726 (_1!9782 lt!335826)) (size!4631 (buf!5160 (_1!9782 lt!335826))))))

(assert (=> d!72127 (= (bitIndex!0 (size!4631 (buf!5160 (_1!9782 lt!335826))) (currentByte!9726 (_1!9782 lt!335826)) (currentBit!9721 (_1!9782 lt!335826))) lt!336833)))

(declare-fun b!213431 () Bool)

(declare-fun res!179366 () Bool)

(assert (=> b!213431 (=> (not res!179366) (not e!145382))))

(assert (=> b!213431 (= res!179366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336833))))

(declare-fun b!213432 () Bool)

(declare-fun lt!336832 () (_ BitVec 64))

(assert (=> b!213432 (= e!145382 (bvsle lt!336833 (bvmul lt!336832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213432 (or (= lt!336832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336832)))))

(assert (=> b!213432 (= lt!336832 ((_ sign_extend 32) (size!4631 (buf!5160 (_1!9782 lt!335826)))))))

(assert (= (and d!72127 res!179367) b!213431))

(assert (= (and b!213431 res!179366) b!213432))

(declare-fun m!328935 () Bool)

(assert (=> d!72127 m!328935))

(declare-fun m!328937 () Bool)

(assert (=> d!72127 m!328937))

(assert (=> b!213032 d!72127))

(declare-fun d!72129 () Bool)

(declare-fun res!179370 () Bool)

(declare-fun e!145384 () Bool)

(assert (=> d!72129 (=> (not res!179370) (not e!145384))))

(assert (=> d!72129 (= res!179370 (= (size!4631 (buf!5160 (_2!9780 lt!335851))) (size!4631 (buf!5160 (_2!9780 lt!335825)))))))

(assert (=> d!72129 (= (isPrefixOf!0 (_2!9780 lt!335851) (_2!9780 lt!335825)) e!145384)))

(declare-fun b!213433 () Bool)

(declare-fun res!179369 () Bool)

(assert (=> b!213433 (=> (not res!179369) (not e!145384))))

(assert (=> b!213433 (= res!179369 (bvsle (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851))) (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335825))) (currentByte!9726 (_2!9780 lt!335825)) (currentBit!9721 (_2!9780 lt!335825)))))))

(declare-fun b!213434 () Bool)

(declare-fun e!145383 () Bool)

(assert (=> b!213434 (= e!145384 e!145383)))

(declare-fun res!179368 () Bool)

(assert (=> b!213434 (=> res!179368 e!145383)))

(assert (=> b!213434 (= res!179368 (= (size!4631 (buf!5160 (_2!9780 lt!335851))) #b00000000000000000000000000000000))))

(declare-fun b!213435 () Bool)

(assert (=> b!213435 (= e!145383 (arrayBitRangesEq!0 (buf!5160 (_2!9780 lt!335851)) (buf!5160 (_2!9780 lt!335825)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4631 (buf!5160 (_2!9780 lt!335851))) (currentByte!9726 (_2!9780 lt!335851)) (currentBit!9721 (_2!9780 lt!335851)))))))

(assert (= (and d!72129 res!179370) b!213433))

(assert (= (and b!213433 res!179369) b!213434))

(assert (= (and b!213434 (not res!179368)) b!213435))

(assert (=> b!213433 m!328233))

(assert (=> b!213433 m!328239))

(assert (=> b!213435 m!328233))

(assert (=> b!213435 m!328233))

(declare-fun m!328939 () Bool)

(assert (=> b!213435 m!328939))

(assert (=> b!213044 d!72129))

(declare-fun d!72131 () Bool)

(assert (=> d!72131 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204)) lt!335852) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4631 (buf!5160 thiss!1204))) ((_ sign_extend 32) (currentByte!9726 thiss!1204)) ((_ sign_extend 32) (currentBit!9721 thiss!1204))) lt!335852))))

(declare-fun bs!17688 () Bool)

(assert (= bs!17688 d!72131))

(assert (=> bs!17688 m!328369))

(assert (=> b!213034 d!72131))

(declare-fun d!72133 () Bool)

(assert (=> d!72133 (= (array_inv!4372 (buf!5160 thiss!1204)) (bvsge (size!4631 (buf!5160 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!213046 d!72133))

(check-sat (not b!213176) (not d!72007) (not b!213435) (not d!72011) (not d!72013) (not b!213161) (not b!213166) (not d!72015) (not d!72003) (not b!213370) (not d!71979) (not d!72131) (not b!213163) (not d!72029) (not d!71989) (not d!71975) (not b!213433) (not b!213427) (not b!213376) (not d!72005) (not b!213167) (not d!71977) (not b!213366) (not d!71981) (not d!72019) (not d!72023) (not d!72113) (not b!213430) (not b!213409) (not b!213164) (not b!213369) (not b!213371) (not b!213407) (not d!71971) (not b!213429) (not bm!3347) (not b!213159) (not d!72009) (not d!72021) (not d!72025) (not b!213364) (not d!72017) (not d!71993) (not b!213158) (not d!72031) (not d!72091) (not d!72095) (not d!71985) (not d!72127) (not b!213404) (not b!213365) (not b!213178) (not d!71973) (not d!71991) (not b!213162) (not b!213374) (not b!213428) (not b!213367) (not d!71997) (not d!71999) (not d!71987))
