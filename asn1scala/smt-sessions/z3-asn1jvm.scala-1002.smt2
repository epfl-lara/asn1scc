; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28144 () Bool)

(assert start!28144)

(declare-fun b!145880 () Bool)

(declare-fun res!122022 () Bool)

(declare-fun e!97257 () Bool)

(assert (=> b!145880 (=> (not res!122022) (not e!97257))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6631 0))(
  ( (array!6632 (arr!3741 (Array (_ BitVec 32) (_ BitVec 8))) (size!3002 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5262 0))(
  ( (BitStream!5263 (buf!3447 array!6631) (currentByte!6343 (_ BitVec 32)) (currentBit!6338 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5262)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145880 (= res!122022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145881 () Bool)

(declare-fun e!97251 () Bool)

(declare-fun e!97259 () Bool)

(assert (=> b!145881 (= e!97251 e!97259)))

(declare-fun res!122015 () Bool)

(assert (=> b!145881 (=> (not res!122015) (not e!97259))))

(declare-fun lt!226208 () (_ BitVec 64))

(declare-datatypes ((Unit!9086 0))(
  ( (Unit!9087) )
))
(declare-datatypes ((tuple2!13064 0))(
  ( (tuple2!13065 (_1!6881 Unit!9086) (_2!6881 BitStream!5262)) )
))
(declare-fun lt!226224 () tuple2!13064)

(declare-fun lt!226210 () tuple2!13064)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145881 (= res!122015 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210))) (bvadd (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!226208))))))

(assert (=> b!145881 (= lt!226208 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145882 () Bool)

(declare-fun res!122025 () Bool)

(declare-fun e!97256 () Bool)

(assert (=> b!145882 (=> (not res!122025) (not e!97256))))

(declare-fun isPrefixOf!0 (BitStream!5262 BitStream!5262) Bool)

(assert (=> b!145882 (= res!122025 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226224)))))

(declare-fun b!145883 () Bool)

(declare-fun e!97258 () Bool)

(declare-datatypes ((tuple2!13066 0))(
  ( (tuple2!13067 (_1!6882 BitStream!5262) (_2!6882 array!6631)) )
))
(declare-fun lt!226201 () tuple2!13066)

(assert (=> b!145883 (= e!97258 (and (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3002 (_2!6882 lt!226201)))))))

(declare-fun res!122016 () Bool)

(assert (=> start!28144 (=> (not res!122016) (not e!97257))))

(declare-fun arr!237 () array!6631)

(assert (=> start!28144 (= res!122016 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3002 arr!237))))))

(assert (=> start!28144 e!97257))

(assert (=> start!28144 true))

(declare-fun array_inv!2791 (array!6631) Bool)

(assert (=> start!28144 (array_inv!2791 arr!237)))

(declare-fun e!97260 () Bool)

(declare-fun inv!12 (BitStream!5262) Bool)

(assert (=> start!28144 (and (inv!12 thiss!1634) e!97260)))

(declare-fun b!145884 () Bool)

(declare-fun e!97255 () Bool)

(assert (=> b!145884 (= e!97259 (not e!97255))))

(declare-fun res!122026 () Bool)

(assert (=> b!145884 (=> res!122026 e!97255)))

(declare-datatypes ((tuple2!13068 0))(
  ( (tuple2!13069 (_1!6883 BitStream!5262) (_2!6883 BitStream!5262)) )
))
(declare-fun lt!226219 () tuple2!13068)

(declare-fun lt!226220 () tuple2!13066)

(assert (=> b!145884 (= res!122026 (or (not (= (size!3002 (_2!6882 lt!226220)) (size!3002 arr!237))) (not (= (_1!6882 lt!226220) (_2!6883 lt!226219)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5262 array!6631 (_ BitVec 32) (_ BitVec 32)) tuple2!13066)

(assert (=> b!145884 (= lt!226220 (readByteArrayLoopPure!0 (_1!6883 lt!226219) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145884 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226208)))

(declare-fun lt!226217 () Unit!9086)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5262 array!6631 (_ BitVec 64)) Unit!9086)

(assert (=> b!145884 (= lt!226217 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226208))))

(declare-fun reader!0 (BitStream!5262 BitStream!5262) tuple2!13068)

(assert (=> b!145884 (= lt!226219 (reader!0 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(declare-fun lt!226203 () tuple2!13068)

(declare-fun b!145885 () Bool)

(declare-datatypes ((tuple2!13070 0))(
  ( (tuple2!13071 (_1!6884 BitStream!5262) (_2!6884 (_ BitVec 8))) )
))
(declare-fun lt!226209 () tuple2!13070)

(assert (=> b!145885 (= e!97256 (and (= (_2!6884 lt!226209) (select (arr!3741 arr!237) from!447)) (= (_1!6884 lt!226209) (_2!6883 lt!226203))))))

(declare-fun readBytePure!0 (BitStream!5262) tuple2!13070)

(assert (=> b!145885 (= lt!226209 (readBytePure!0 (_1!6883 lt!226203)))))

(assert (=> b!145885 (= lt!226203 (reader!0 thiss!1634 (_2!6881 lt!226224)))))

(declare-fun b!145886 () Bool)

(declare-fun res!122014 () Bool)

(assert (=> b!145886 (=> (not res!122014) (not e!97259))))

(assert (=> b!145886 (= res!122014 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(declare-fun b!145887 () Bool)

(declare-fun res!122017 () Bool)

(assert (=> b!145887 (=> (not res!122017) (not e!97256))))

(assert (=> b!145887 (= res!122017 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))))

(declare-fun b!145888 () Bool)

(declare-fun res!122013 () Bool)

(assert (=> b!145888 (=> (not res!122013) (not e!97257))))

(assert (=> b!145888 (= res!122013 (bvslt from!447 to!404))))

(declare-fun b!145889 () Bool)

(assert (=> b!145889 (= e!97257 (not e!97258))))

(declare-fun res!122023 () Bool)

(assert (=> b!145889 (=> res!122023 e!97258)))

(declare-fun lt!226200 () tuple2!13066)

(declare-fun arrayRangesEq!318 (array!6631 array!6631 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145889 (= res!122023 (not (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226200) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!226216 () tuple2!13066)

(assert (=> b!145889 (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226216) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!226207 () tuple2!13068)

(declare-fun lt!226213 () Unit!9086)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5262 array!6631 (_ BitVec 32) (_ BitVec 32)) Unit!9086)

(assert (=> b!145889 (= lt!226213 (readByteArrayLoopArrayPrefixLemma!0 (_1!6883 lt!226207) arr!237 from!447 to!404))))

(declare-fun lt!226223 () array!6631)

(declare-fun withMovedByteIndex!0 (BitStream!5262 (_ BitVec 32)) BitStream!5262)

(assert (=> b!145889 (= lt!226216 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226221 () tuple2!13068)

(assert (=> b!145889 (= lt!226200 (readByteArrayLoopPure!0 (_1!6883 lt!226221) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226202 () tuple2!13070)

(assert (=> b!145889 (= lt!226223 (array!6632 (store (arr!3741 arr!237) from!447 (_2!6884 lt!226202)) (size!3002 arr!237)))))

(declare-fun lt!226215 () (_ BitVec 32))

(assert (=> b!145889 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226215)))

(declare-fun lt!226211 () Unit!9086)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5262 array!6631 (_ BitVec 32)) Unit!9086)

(assert (=> b!145889 (= lt!226211 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226215))))

(assert (=> b!145889 (= (_1!6882 lt!226201) (_2!6883 lt!226207))))

(assert (=> b!145889 (= lt!226201 (readByteArrayLoopPure!0 (_1!6883 lt!226207) arr!237 from!447 to!404))))

(assert (=> b!145889 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!226218 () Unit!9086)

(assert (=> b!145889 (= lt!226218 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3447 (_2!6881 lt!226210)) (bvsub to!404 from!447)))))

(assert (=> b!145889 (= (_2!6884 lt!226202) (select (arr!3741 arr!237) from!447))))

(assert (=> b!145889 (= lt!226202 (readBytePure!0 (_1!6883 lt!226207)))))

(assert (=> b!145889 (= lt!226221 (reader!0 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(assert (=> b!145889 (= lt!226207 (reader!0 thiss!1634 (_2!6881 lt!226210)))))

(declare-fun e!97250 () Bool)

(assert (=> b!145889 e!97250))

(declare-fun res!122020 () Bool)

(assert (=> b!145889 (=> (not res!122020) (not e!97250))))

(declare-fun lt!226214 () tuple2!13070)

(declare-fun lt!226206 () tuple2!13070)

(assert (=> b!145889 (= res!122020 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226214))) (currentByte!6343 (_1!6884 lt!226214)) (currentBit!6338 (_1!6884 lt!226214))) (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226206))) (currentByte!6343 (_1!6884 lt!226206)) (currentBit!6338 (_1!6884 lt!226206)))))))

(declare-fun lt!226212 () Unit!9086)

(declare-fun lt!226222 () BitStream!5262)

(declare-fun readBytePrefixLemma!0 (BitStream!5262 BitStream!5262) Unit!9086)

(assert (=> b!145889 (= lt!226212 (readBytePrefixLemma!0 lt!226222 (_2!6881 lt!226210)))))

(assert (=> b!145889 (= lt!226206 (readBytePure!0 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (=> b!145889 (= lt!226214 (readBytePure!0 lt!226222))))

(assert (=> b!145889 (= lt!226222 (BitStream!5263 (buf!3447 (_2!6881 lt!226224)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(declare-fun e!97253 () Bool)

(assert (=> b!145889 e!97253))

(declare-fun res!122024 () Bool)

(assert (=> b!145889 (=> (not res!122024) (not e!97253))))

(assert (=> b!145889 (= res!122024 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226210)))))

(declare-fun lt!226205 () Unit!9086)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5262 BitStream!5262 BitStream!5262) Unit!9086)

(assert (=> b!145889 (= lt!226205 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(assert (=> b!145889 e!97251))

(declare-fun res!122021 () Bool)

(assert (=> b!145889 (=> (not res!122021) (not e!97251))))

(assert (=> b!145889 (= res!122021 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5262 array!6631 (_ BitVec 32) (_ BitVec 32)) tuple2!13064)

(assert (=> b!145889 (= lt!226210 (appendByteArrayLoop!0 (_2!6881 lt!226224) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145889 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226215)))

(assert (=> b!145889 (= lt!226215 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!226204 () Unit!9086)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5262 BitStream!5262 (_ BitVec 64) (_ BitVec 32)) Unit!9086)

(assert (=> b!145889 (= lt!226204 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6881 lt!226224) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145889 e!97256))

(declare-fun res!122018 () Bool)

(assert (=> b!145889 (=> (not res!122018) (not e!97256))))

(assert (=> b!145889 (= res!122018 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(declare-fun appendByte!0 (BitStream!5262 (_ BitVec 8)) tuple2!13064)

(assert (=> b!145889 (= lt!226224 (appendByte!0 thiss!1634 (select (arr!3741 arr!237) from!447)))))

(declare-fun b!145890 () Bool)

(assert (=> b!145890 (= e!97260 (array_inv!2791 (buf!3447 thiss!1634)))))

(declare-fun b!145891 () Bool)

(assert (=> b!145891 (= e!97250 (= (_2!6884 lt!226214) (_2!6884 lt!226206)))))

(declare-fun b!145892 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145892 (= e!97253 (invariant!0 (currentBit!6338 thiss!1634) (currentByte!6343 thiss!1634) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(declare-fun b!145893 () Bool)

(declare-fun res!122019 () Bool)

(assert (=> b!145893 (=> (not res!122019) (not e!97257))))

(assert (=> b!145893 (= res!122019 (invariant!0 (currentBit!6338 thiss!1634) (currentByte!6343 thiss!1634) (size!3002 (buf!3447 thiss!1634))))))

(declare-fun b!145894 () Bool)

(assert (=> b!145894 (= e!97255 (not (arrayRangesEq!318 arr!237 (_2!6882 lt!226220) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!28144 res!122016) b!145880))

(assert (= (and b!145880 res!122022) b!145888))

(assert (= (and b!145888 res!122013) b!145893))

(assert (= (and b!145893 res!122019) b!145889))

(assert (= (and b!145889 res!122018) b!145887))

(assert (= (and b!145887 res!122017) b!145882))

(assert (= (and b!145882 res!122025) b!145885))

(assert (= (and b!145889 res!122021) b!145881))

(assert (= (and b!145881 res!122015) b!145886))

(assert (= (and b!145886 res!122014) b!145884))

(assert (= (and b!145884 (not res!122026)) b!145894))

(assert (= (and b!145889 res!122024) b!145892))

(assert (= (and b!145889 res!122020) b!145891))

(assert (= (and b!145889 (not res!122023)) b!145883))

(assert (= start!28144 b!145890))

(declare-fun m!224601 () Bool)

(assert (=> b!145880 m!224601))

(declare-fun m!224603 () Bool)

(assert (=> b!145886 m!224603))

(declare-fun m!224605 () Bool)

(assert (=> b!145894 m!224605))

(declare-fun m!224607 () Bool)

(assert (=> b!145890 m!224607))

(declare-fun m!224609 () Bool)

(assert (=> b!145889 m!224609))

(declare-fun m!224611 () Bool)

(assert (=> b!145889 m!224611))

(declare-fun m!224613 () Bool)

(assert (=> b!145889 m!224613))

(declare-fun m!224615 () Bool)

(assert (=> b!145889 m!224615))

(declare-fun m!224617 () Bool)

(assert (=> b!145889 m!224617))

(declare-fun m!224619 () Bool)

(assert (=> b!145889 m!224619))

(declare-fun m!224621 () Bool)

(assert (=> b!145889 m!224621))

(declare-fun m!224623 () Bool)

(assert (=> b!145889 m!224623))

(declare-fun m!224625 () Bool)

(assert (=> b!145889 m!224625))

(declare-fun m!224627 () Bool)

(assert (=> b!145889 m!224627))

(declare-fun m!224629 () Bool)

(assert (=> b!145889 m!224629))

(declare-fun m!224631 () Bool)

(assert (=> b!145889 m!224631))

(declare-fun m!224633 () Bool)

(assert (=> b!145889 m!224633))

(declare-fun m!224635 () Bool)

(assert (=> b!145889 m!224635))

(declare-fun m!224637 () Bool)

(assert (=> b!145889 m!224637))

(declare-fun m!224639 () Bool)

(assert (=> b!145889 m!224639))

(declare-fun m!224641 () Bool)

(assert (=> b!145889 m!224641))

(assert (=> b!145889 m!224621))

(declare-fun m!224643 () Bool)

(assert (=> b!145889 m!224643))

(declare-fun m!224645 () Bool)

(assert (=> b!145889 m!224645))

(declare-fun m!224647 () Bool)

(assert (=> b!145889 m!224647))

(declare-fun m!224649 () Bool)

(assert (=> b!145889 m!224649))

(declare-fun m!224651 () Bool)

(assert (=> b!145889 m!224651))

(declare-fun m!224653 () Bool)

(assert (=> b!145889 m!224653))

(declare-fun m!224655 () Bool)

(assert (=> b!145889 m!224655))

(declare-fun m!224657 () Bool)

(assert (=> b!145889 m!224657))

(assert (=> b!145889 m!224631))

(declare-fun m!224659 () Bool)

(assert (=> b!145889 m!224659))

(declare-fun m!224661 () Bool)

(assert (=> b!145889 m!224661))

(declare-fun m!224663 () Bool)

(assert (=> b!145892 m!224663))

(declare-fun m!224665 () Bool)

(assert (=> b!145882 m!224665))

(declare-fun m!224667 () Bool)

(assert (=> b!145887 m!224667))

(declare-fun m!224669 () Bool)

(assert (=> b!145887 m!224669))

(declare-fun m!224671 () Bool)

(assert (=> b!145884 m!224671))

(declare-fun m!224673 () Bool)

(assert (=> b!145884 m!224673))

(declare-fun m!224675 () Bool)

(assert (=> b!145884 m!224675))

(assert (=> b!145884 m!224643))

(assert (=> b!145885 m!224631))

(declare-fun m!224677 () Bool)

(assert (=> b!145885 m!224677))

(declare-fun m!224679 () Bool)

(assert (=> b!145885 m!224679))

(declare-fun m!224681 () Bool)

(assert (=> b!145893 m!224681))

(declare-fun m!224683 () Bool)

(assert (=> b!145881 m!224683))

(assert (=> b!145881 m!224667))

(declare-fun m!224685 () Bool)

(assert (=> start!28144 m!224685))

(declare-fun m!224687 () Bool)

(assert (=> start!28144 m!224687))

(check-sat (not b!145881) (not start!28144) (not b!145882) (not b!145885) (not b!145892) (not b!145884) (not b!145893) (not b!145894) (not b!145886) (not b!145880) (not b!145890) (not b!145889) (not b!145887))
(check-sat)
(get-model)

(declare-fun d!46812 () Bool)

(assert (=> d!46812 (= (array_inv!2791 (buf!3447 thiss!1634)) (bvsge (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!145890 d!46812))

(declare-fun d!46814 () Bool)

(assert (=> d!46814 (= (array_inv!2791 arr!237) (bvsge (size!3002 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28144 d!46814))

(declare-fun d!46816 () Bool)

(assert (=> d!46816 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6338 thiss!1634) (currentByte!6343 thiss!1634) (size!3002 (buf!3447 thiss!1634))))))

(declare-fun bs!11483 () Bool)

(assert (= bs!11483 d!46816))

(assert (=> bs!11483 m!224681))

(assert (=> start!28144 d!46816))

(declare-fun d!46818 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!46818 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11484 () Bool)

(assert (= bs!11484 d!46818))

(declare-fun m!225173 () Bool)

(assert (=> bs!11484 m!225173))

(assert (=> b!145880 d!46818))

(declare-fun d!46820 () Bool)

(declare-fun e!97406 () Bool)

(assert (=> d!46820 e!97406))

(declare-fun res!122241 () Bool)

(assert (=> d!46820 (=> (not res!122241) (not e!97406))))

(declare-fun lt!226794 () (_ BitVec 64))

(declare-fun lt!226791 () (_ BitVec 64))

(declare-fun lt!226795 () (_ BitVec 64))

(assert (=> d!46820 (= res!122241 (= lt!226791 (bvsub lt!226794 lt!226795)))))

(assert (=> d!46820 (or (= (bvand lt!226794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226794 lt!226795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46820 (= lt!226795 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226210))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun lt!226793 () (_ BitVec 64))

(declare-fun lt!226790 () (_ BitVec 64))

(assert (=> d!46820 (= lt!226794 (bvmul lt!226793 lt!226790))))

(assert (=> d!46820 (or (= lt!226793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226790 (bvsdiv (bvmul lt!226793 lt!226790) lt!226793)))))

(assert (=> d!46820 (= lt!226790 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46820 (= lt!226793 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46820 (= lt!226791 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226210))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226210)))))))

(assert (=> d!46820 (invariant!0 (currentBit!6338 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226210)) (size!3002 (buf!3447 (_2!6881 lt!226210))))))

(assert (=> d!46820 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210))) lt!226791)))

(declare-fun b!146132 () Bool)

(declare-fun res!122242 () Bool)

(assert (=> b!146132 (=> (not res!122242) (not e!97406))))

(assert (=> b!146132 (= res!122242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226791))))

(declare-fun b!146133 () Bool)

(declare-fun lt!226792 () (_ BitVec 64))

(assert (=> b!146133 (= e!97406 (bvsle lt!226791 (bvmul lt!226792 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146133 (or (= lt!226792 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226792 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226792)))))

(assert (=> b!146133 (= lt!226792 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (= (and d!46820 res!122241) b!146132))

(assert (= (and b!146132 res!122242) b!146133))

(declare-fun m!225175 () Bool)

(assert (=> d!46820 m!225175))

(declare-fun m!225177 () Bool)

(assert (=> d!46820 m!225177))

(assert (=> b!145881 d!46820))

(declare-fun d!46822 () Bool)

(declare-fun e!97407 () Bool)

(assert (=> d!46822 e!97407))

(declare-fun res!122243 () Bool)

(assert (=> d!46822 (=> (not res!122243) (not e!97407))))

(declare-fun lt!226801 () (_ BitVec 64))

(declare-fun lt!226800 () (_ BitVec 64))

(declare-fun lt!226797 () (_ BitVec 64))

(assert (=> d!46822 (= res!122243 (= lt!226797 (bvsub lt!226800 lt!226801)))))

(assert (=> d!46822 (or (= (bvand lt!226800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226801 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226800 lt!226801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46822 (= lt!226801 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun lt!226799 () (_ BitVec 64))

(declare-fun lt!226796 () (_ BitVec 64))

(assert (=> d!46822 (= lt!226800 (bvmul lt!226799 lt!226796))))

(assert (=> d!46822 (or (= lt!226799 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226796 (bvsdiv (bvmul lt!226799 lt!226796) lt!226799)))))

(assert (=> d!46822 (= lt!226796 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46822 (= lt!226799 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (=> d!46822 (= lt!226797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (=> d!46822 (invariant!0 (currentBit!6338 (_2!6881 lt!226224)) (currentByte!6343 (_2!6881 lt!226224)) (size!3002 (buf!3447 (_2!6881 lt!226224))))))

(assert (=> d!46822 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) lt!226797)))

(declare-fun b!146134 () Bool)

(declare-fun res!122244 () Bool)

(assert (=> b!146134 (=> (not res!122244) (not e!97407))))

(assert (=> b!146134 (= res!122244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226797))))

(declare-fun b!146135 () Bool)

(declare-fun lt!226798 () (_ BitVec 64))

(assert (=> b!146135 (= e!97407 (bvsle lt!226797 (bvmul lt!226798 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146135 (or (= lt!226798 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226798 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226798)))))

(assert (=> b!146135 (= lt!226798 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (= (and d!46822 res!122243) b!146134))

(assert (= (and b!146134 res!122244) b!146135))

(declare-fun m!225179 () Bool)

(assert (=> d!46822 m!225179))

(declare-fun m!225181 () Bool)

(assert (=> d!46822 m!225181))

(assert (=> b!145881 d!46822))

(assert (=> b!145887 d!46822))

(declare-fun d!46824 () Bool)

(declare-fun e!97408 () Bool)

(assert (=> d!46824 e!97408))

(declare-fun res!122245 () Bool)

(assert (=> d!46824 (=> (not res!122245) (not e!97408))))

(declare-fun lt!226803 () (_ BitVec 64))

(declare-fun lt!226807 () (_ BitVec 64))

(declare-fun lt!226806 () (_ BitVec 64))

(assert (=> d!46824 (= res!122245 (= lt!226803 (bvsub lt!226806 lt!226807)))))

(assert (=> d!46824 (or (= (bvand lt!226806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226806 lt!226807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46824 (= lt!226807 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))))))

(declare-fun lt!226805 () (_ BitVec 64))

(declare-fun lt!226802 () (_ BitVec 64))

(assert (=> d!46824 (= lt!226806 (bvmul lt!226805 lt!226802))))

(assert (=> d!46824 (or (= lt!226805 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226802 (bvsdiv (bvmul lt!226805 lt!226802) lt!226805)))))

(assert (=> d!46824 (= lt!226802 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46824 (= lt!226805 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))))))

(assert (=> d!46824 (= lt!226803 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 thiss!1634))))))

(assert (=> d!46824 (invariant!0 (currentBit!6338 thiss!1634) (currentByte!6343 thiss!1634) (size!3002 (buf!3447 thiss!1634)))))

(assert (=> d!46824 (= (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) lt!226803)))

(declare-fun b!146136 () Bool)

(declare-fun res!122246 () Bool)

(assert (=> b!146136 (=> (not res!122246) (not e!97408))))

(assert (=> b!146136 (= res!122246 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226803))))

(declare-fun b!146137 () Bool)

(declare-fun lt!226804 () (_ BitVec 64))

(assert (=> b!146137 (= e!97408 (bvsle lt!226803 (bvmul lt!226804 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146137 (or (= lt!226804 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226804 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226804)))))

(assert (=> b!146137 (= lt!226804 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))))))

(assert (= (and d!46824 res!122245) b!146136))

(assert (= (and b!146136 res!122246) b!146137))

(assert (=> d!46824 m!225173))

(assert (=> d!46824 m!224681))

(assert (=> b!145887 d!46824))

(declare-fun d!46826 () Bool)

(assert (=> d!46826 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226215) (bvsle ((_ sign_extend 32) lt!226215) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11485 () Bool)

(assert (= bs!11485 d!46826))

(declare-fun m!225183 () Bool)

(assert (=> bs!11485 m!225183))

(assert (=> b!145889 d!46826))

(declare-fun d!46828 () Bool)

(declare-fun lt!226816 () tuple2!13066)

(declare-fun lt!226818 () tuple2!13066)

(assert (=> d!46828 (arrayRangesEq!318 (_2!6882 lt!226816) (_2!6882 lt!226818) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!226819 () Unit!9086)

(declare-fun lt!226817 () BitStream!5262)

(declare-fun choose!35 (BitStream!5262 array!6631 (_ BitVec 32) (_ BitVec 32) tuple2!13066 array!6631 BitStream!5262 tuple2!13066 array!6631) Unit!9086)

(assert (=> d!46828 (= lt!226819 (choose!35 (_1!6883 lt!226207) arr!237 from!447 to!404 lt!226816 (_2!6882 lt!226816) lt!226817 lt!226818 (_2!6882 lt!226818)))))

(assert (=> d!46828 (= lt!226818 (readByteArrayLoopPure!0 lt!226817 (array!6632 (store (arr!3741 arr!237) from!447 (_2!6884 (readBytePure!0 (_1!6883 lt!226207)))) (size!3002 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!46828 (= lt!226817 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))))

(assert (=> d!46828 (= lt!226816 (readByteArrayLoopPure!0 (_1!6883 lt!226207) arr!237 from!447 to!404))))

(assert (=> d!46828 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6883 lt!226207) arr!237 from!447 to!404) lt!226819)))

(declare-fun bs!11487 () Bool)

(assert (= bs!11487 d!46828))

(assert (=> bs!11487 m!224653))

(declare-fun m!225185 () Bool)

(assert (=> bs!11487 m!225185))

(declare-fun m!225187 () Bool)

(assert (=> bs!11487 m!225187))

(declare-fun m!225189 () Bool)

(assert (=> bs!11487 m!225189))

(assert (=> bs!11487 m!224621))

(declare-fun m!225191 () Bool)

(assert (=> bs!11487 m!225191))

(assert (=> bs!11487 m!224633))

(assert (=> b!145889 d!46828))

(declare-fun b!146148 () Bool)

(declare-fun res!122253 () Bool)

(declare-fun e!97414 () Bool)

(assert (=> b!146148 (=> (not res!122253) (not e!97414))))

(declare-fun lt!226869 () tuple2!13068)

(assert (=> b!146148 (= res!122253 (isPrefixOf!0 (_2!6883 lt!226869) (_2!6881 lt!226210)))))

(declare-fun b!146149 () Bool)

(declare-fun res!122255 () Bool)

(assert (=> b!146149 (=> (not res!122255) (not e!97414))))

(assert (=> b!146149 (= res!122255 (isPrefixOf!0 (_1!6883 lt!226869) thiss!1634))))

(declare-fun lt!226870 () (_ BitVec 64))

(declare-fun lt!226861 () (_ BitVec 64))

(declare-fun b!146150 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5262 (_ BitVec 64)) BitStream!5262)

(assert (=> b!146150 (= e!97414 (= (_1!6883 lt!226869) (withMovedBitIndex!0 (_2!6883 lt!226869) (bvsub lt!226861 lt!226870))))))

(assert (=> b!146150 (or (= (bvand lt!226861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226861 lt!226870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146150 (= lt!226870 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210))))))

(assert (=> b!146150 (= lt!226861 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(declare-fun b!146151 () Bool)

(declare-fun e!97413 () Unit!9086)

(declare-fun lt!226876 () Unit!9086)

(assert (=> b!146151 (= e!97413 lt!226876)))

(declare-fun lt!226865 () (_ BitVec 64))

(assert (=> b!146151 (= lt!226865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226863 () (_ BitVec 64))

(assert (=> b!146151 (= lt!226863 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6631 array!6631 (_ BitVec 64) (_ BitVec 64)) Unit!9086)

(assert (=> b!146151 (= lt!226876 (arrayBitRangesEqSymmetric!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226210)) lt!226865 lt!226863))))

(declare-fun arrayBitRangesEq!0 (array!6631 array!6631 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146151 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 thiss!1634) lt!226865 lt!226863)))

(declare-fun d!46830 () Bool)

(assert (=> d!46830 e!97414))

(declare-fun res!122254 () Bool)

(assert (=> d!46830 (=> (not res!122254) (not e!97414))))

(assert (=> d!46830 (= res!122254 (isPrefixOf!0 (_1!6883 lt!226869) (_2!6883 lt!226869)))))

(declare-fun lt!226867 () BitStream!5262)

(assert (=> d!46830 (= lt!226869 (tuple2!13069 lt!226867 (_2!6881 lt!226210)))))

(declare-fun lt!226862 () Unit!9086)

(declare-fun lt!226878 () Unit!9086)

(assert (=> d!46830 (= lt!226862 lt!226878)))

(assert (=> d!46830 (isPrefixOf!0 lt!226867 (_2!6881 lt!226210))))

(assert (=> d!46830 (= lt!226878 (lemmaIsPrefixTransitive!0 lt!226867 (_2!6881 lt!226210) (_2!6881 lt!226210)))))

(declare-fun lt!226860 () Unit!9086)

(declare-fun lt!226872 () Unit!9086)

(assert (=> d!46830 (= lt!226860 lt!226872)))

(assert (=> d!46830 (isPrefixOf!0 lt!226867 (_2!6881 lt!226210))))

(assert (=> d!46830 (= lt!226872 (lemmaIsPrefixTransitive!0 lt!226867 thiss!1634 (_2!6881 lt!226210)))))

(declare-fun lt!226879 () Unit!9086)

(assert (=> d!46830 (= lt!226879 e!97413)))

(declare-fun c!7913 () Bool)

(assert (=> d!46830 (= c!7913 (not (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226868 () Unit!9086)

(declare-fun lt!226873 () Unit!9086)

(assert (=> d!46830 (= lt!226868 lt!226873)))

(assert (=> d!46830 (isPrefixOf!0 (_2!6881 lt!226210) (_2!6881 lt!226210))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5262) Unit!9086)

(assert (=> d!46830 (= lt!226873 (lemmaIsPrefixRefl!0 (_2!6881 lt!226210)))))

(declare-fun lt!226864 () Unit!9086)

(declare-fun lt!226877 () Unit!9086)

(assert (=> d!46830 (= lt!226864 lt!226877)))

(assert (=> d!46830 (= lt!226877 (lemmaIsPrefixRefl!0 (_2!6881 lt!226210)))))

(declare-fun lt!226866 () Unit!9086)

(declare-fun lt!226874 () Unit!9086)

(assert (=> d!46830 (= lt!226866 lt!226874)))

(assert (=> d!46830 (isPrefixOf!0 lt!226867 lt!226867)))

(assert (=> d!46830 (= lt!226874 (lemmaIsPrefixRefl!0 lt!226867))))

(declare-fun lt!226875 () Unit!9086)

(declare-fun lt!226871 () Unit!9086)

(assert (=> d!46830 (= lt!226875 lt!226871)))

(assert (=> d!46830 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46830 (= lt!226871 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46830 (= lt!226867 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(assert (=> d!46830 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226210))))

(assert (=> d!46830 (= (reader!0 thiss!1634 (_2!6881 lt!226210)) lt!226869)))

(declare-fun b!146152 () Bool)

(declare-fun Unit!9096 () Unit!9086)

(assert (=> b!146152 (= e!97413 Unit!9096)))

(assert (= (and d!46830 c!7913) b!146151))

(assert (= (and d!46830 (not c!7913)) b!146152))

(assert (= (and d!46830 res!122254) b!146149))

(assert (= (and b!146149 res!122255) b!146148))

(assert (= (and b!146148 res!122253) b!146150))

(declare-fun m!225193 () Bool)

(assert (=> d!46830 m!225193))

(declare-fun m!225195 () Bool)

(assert (=> d!46830 m!225195))

(declare-fun m!225197 () Bool)

(assert (=> d!46830 m!225197))

(declare-fun m!225199 () Bool)

(assert (=> d!46830 m!225199))

(assert (=> d!46830 m!224625))

(declare-fun m!225201 () Bool)

(assert (=> d!46830 m!225201))

(declare-fun m!225203 () Bool)

(assert (=> d!46830 m!225203))

(declare-fun m!225205 () Bool)

(assert (=> d!46830 m!225205))

(declare-fun m!225207 () Bool)

(assert (=> d!46830 m!225207))

(declare-fun m!225209 () Bool)

(assert (=> d!46830 m!225209))

(declare-fun m!225211 () Bool)

(assert (=> d!46830 m!225211))

(assert (=> b!146151 m!224669))

(declare-fun m!225213 () Bool)

(assert (=> b!146151 m!225213))

(declare-fun m!225215 () Bool)

(assert (=> b!146151 m!225215))

(declare-fun m!225217 () Bool)

(assert (=> b!146149 m!225217))

(declare-fun m!225219 () Bool)

(assert (=> b!146150 m!225219))

(assert (=> b!146150 m!224683))

(assert (=> b!146150 m!224669))

(declare-fun m!225221 () Bool)

(assert (=> b!146148 m!225221))

(assert (=> b!145889 d!46830))

(declare-fun d!46832 () Bool)

(assert (=> d!46832 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11488 () Bool)

(assert (= bs!11488 d!46832))

(declare-fun m!225223 () Bool)

(assert (=> bs!11488 m!225223))

(assert (=> b!145889 d!46832))

(declare-fun d!46834 () Bool)

(declare-fun e!97417 () Bool)

(assert (=> d!46834 e!97417))

(declare-fun res!122258 () Bool)

(assert (=> d!46834 (=> (not res!122258) (not e!97417))))

(declare-fun lt!226891 () tuple2!13070)

(declare-fun lt!226890 () tuple2!13070)

(assert (=> d!46834 (= res!122258 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226891))) (currentByte!6343 (_1!6884 lt!226891)) (currentBit!6338 (_1!6884 lt!226891))) (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226890))) (currentByte!6343 (_1!6884 lt!226890)) (currentBit!6338 (_1!6884 lt!226890)))))))

(declare-fun lt!226889 () Unit!9086)

(declare-fun lt!226888 () BitStream!5262)

(declare-fun choose!14 (BitStream!5262 BitStream!5262 BitStream!5262 tuple2!13070 tuple2!13070 BitStream!5262 (_ BitVec 8) tuple2!13070 tuple2!13070 BitStream!5262 (_ BitVec 8)) Unit!9086)

(assert (=> d!46834 (= lt!226889 (choose!14 lt!226222 (_2!6881 lt!226210) lt!226888 lt!226891 (tuple2!13071 (_1!6884 lt!226891) (_2!6884 lt!226891)) (_1!6884 lt!226891) (_2!6884 lt!226891) lt!226890 (tuple2!13071 (_1!6884 lt!226890) (_2!6884 lt!226890)) (_1!6884 lt!226890) (_2!6884 lt!226890)))))

(assert (=> d!46834 (= lt!226890 (readBytePure!0 lt!226888))))

(assert (=> d!46834 (= lt!226891 (readBytePure!0 lt!226222))))

(assert (=> d!46834 (= lt!226888 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 lt!226222) (currentBit!6338 lt!226222)))))

(assert (=> d!46834 (= (readBytePrefixLemma!0 lt!226222 (_2!6881 lt!226210)) lt!226889)))

(declare-fun b!146155 () Bool)

(assert (=> b!146155 (= e!97417 (= (_2!6884 lt!226891) (_2!6884 lt!226890)))))

(assert (= (and d!46834 res!122258) b!146155))

(assert (=> d!46834 m!224617))

(declare-fun m!225225 () Bool)

(assert (=> d!46834 m!225225))

(declare-fun m!225227 () Bool)

(assert (=> d!46834 m!225227))

(declare-fun m!225229 () Bool)

(assert (=> d!46834 m!225229))

(declare-fun m!225231 () Bool)

(assert (=> d!46834 m!225231))

(assert (=> b!145889 d!46834))

(declare-fun d!46836 () Bool)

(assert (=> d!46836 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226215)))

(declare-fun lt!226894 () Unit!9086)

(declare-fun choose!26 (BitStream!5262 array!6631 (_ BitVec 32) BitStream!5262) Unit!9086)

(assert (=> d!46836 (= lt!226894 (choose!26 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226215 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (=> d!46836 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226215) lt!226894)))

(declare-fun bs!11489 () Bool)

(assert (= bs!11489 d!46836))

(assert (=> bs!11489 m!224639))

(declare-fun m!225233 () Bool)

(assert (=> bs!11489 m!225233))

(assert (=> b!145889 d!46836))

(declare-fun d!46838 () Bool)

(declare-datatypes ((tuple2!13084 0))(
  ( (tuple2!13085 (_1!6893 (_ BitVec 8)) (_2!6893 BitStream!5262)) )
))
(declare-fun lt!226897 () tuple2!13084)

(declare-fun readByte!0 (BitStream!5262) tuple2!13084)

(assert (=> d!46838 (= lt!226897 (readByte!0 (_1!6883 lt!226207)))))

(assert (=> d!46838 (= (readBytePure!0 (_1!6883 lt!226207)) (tuple2!13071 (_2!6893 lt!226897) (_1!6893 lt!226897)))))

(declare-fun bs!11490 () Bool)

(assert (= bs!11490 d!46838))

(declare-fun m!225235 () Bool)

(assert (=> bs!11490 m!225235))

(assert (=> b!145889 d!46838))

(declare-fun d!46840 () Bool)

(declare-datatypes ((tuple3!568 0))(
  ( (tuple3!569 (_1!6894 Unit!9086) (_2!6894 BitStream!5262) (_3!351 array!6631)) )
))
(declare-fun lt!226900 () tuple3!568)

(declare-fun readByteArrayLoop!0 (BitStream!5262 array!6631 (_ BitVec 32) (_ BitVec 32)) tuple3!568)

(assert (=> d!46840 (= lt!226900 (readByteArrayLoop!0 (_1!6883 lt!226221) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46840 (= (readByteArrayLoopPure!0 (_1!6883 lt!226221) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13067 (_2!6894 lt!226900) (_3!351 lt!226900)))))

(declare-fun bs!11491 () Bool)

(assert (= bs!11491 d!46840))

(declare-fun m!225237 () Bool)

(assert (=> bs!11491 m!225237))

(assert (=> b!145889 d!46840))

(declare-fun d!46842 () Bool)

(declare-fun res!122263 () Bool)

(declare-fun e!97422 () Bool)

(assert (=> d!46842 (=> res!122263 e!97422)))

(assert (=> d!46842 (= res!122263 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46842 (= (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226200) #b00000000000000000000000000000000 to!404) e!97422)))

(declare-fun b!146160 () Bool)

(declare-fun e!97423 () Bool)

(assert (=> b!146160 (= e!97422 e!97423)))

(declare-fun res!122264 () Bool)

(assert (=> b!146160 (=> (not res!122264) (not e!97423))))

(assert (=> b!146160 (= res!122264 (= (select (arr!3741 (_2!6882 lt!226201)) #b00000000000000000000000000000000) (select (arr!3741 (_2!6882 lt!226200)) #b00000000000000000000000000000000)))))

(declare-fun b!146161 () Bool)

(assert (=> b!146161 (= e!97423 (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226200) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46842 (not res!122263)) b!146160))

(assert (= (and b!146160 res!122264) b!146161))

(declare-fun m!225239 () Bool)

(assert (=> b!146160 m!225239))

(declare-fun m!225241 () Bool)

(assert (=> b!146160 m!225241))

(declare-fun m!225243 () Bool)

(assert (=> b!146161 m!225243))

(assert (=> b!145889 d!46842))

(declare-fun d!46844 () Bool)

(declare-fun e!97424 () Bool)

(assert (=> d!46844 e!97424))

(declare-fun res!122265 () Bool)

(assert (=> d!46844 (=> (not res!122265) (not e!97424))))

(declare-fun lt!226906 () (_ BitVec 64))

(declare-fun lt!226902 () (_ BitVec 64))

(declare-fun lt!226905 () (_ BitVec 64))

(assert (=> d!46844 (= res!122265 (= lt!226902 (bvsub lt!226905 lt!226906)))))

(assert (=> d!46844 (or (= (bvand lt!226905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226905 lt!226906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46844 (= lt!226906 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226214)))) ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226214))) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226214)))))))

(declare-fun lt!226904 () (_ BitVec 64))

(declare-fun lt!226901 () (_ BitVec 64))

(assert (=> d!46844 (= lt!226905 (bvmul lt!226904 lt!226901))))

(assert (=> d!46844 (or (= lt!226904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226901 (bvsdiv (bvmul lt!226904 lt!226901) lt!226904)))))

(assert (=> d!46844 (= lt!226901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46844 (= lt!226904 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226214)))))))

(assert (=> d!46844 (= lt!226902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226214))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226214)))))))

(assert (=> d!46844 (invariant!0 (currentBit!6338 (_1!6884 lt!226214)) (currentByte!6343 (_1!6884 lt!226214)) (size!3002 (buf!3447 (_1!6884 lt!226214))))))

(assert (=> d!46844 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226214))) (currentByte!6343 (_1!6884 lt!226214)) (currentBit!6338 (_1!6884 lt!226214))) lt!226902)))

(declare-fun b!146162 () Bool)

(declare-fun res!122266 () Bool)

(assert (=> b!146162 (=> (not res!122266) (not e!97424))))

(assert (=> b!146162 (= res!122266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226902))))

(declare-fun b!146163 () Bool)

(declare-fun lt!226903 () (_ BitVec 64))

(assert (=> b!146163 (= e!97424 (bvsle lt!226902 (bvmul lt!226903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146163 (or (= lt!226903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226903)))))

(assert (=> b!146163 (= lt!226903 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226214)))))))

(assert (= (and d!46844 res!122265) b!146162))

(assert (= (and b!146162 res!122266) b!146163))

(declare-fun m!225245 () Bool)

(assert (=> d!46844 m!225245))

(declare-fun m!225247 () Bool)

(assert (=> d!46844 m!225247))

(assert (=> b!145889 d!46844))

(declare-fun d!46846 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5262 (_ BitVec 32)) tuple2!13064)

(assert (=> d!46846 (= (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) (_2!6881 (moveByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)))))

(declare-fun bs!11492 () Bool)

(assert (= bs!11492 d!46846))

(declare-fun m!225249 () Bool)

(assert (=> bs!11492 m!225249))

(assert (=> b!145889 d!46846))

(declare-fun d!46848 () Bool)

(declare-fun e!97427 () Bool)

(assert (=> d!46848 e!97427))

(declare-fun res!122269 () Bool)

(assert (=> d!46848 (=> (not res!122269) (not e!97427))))

(assert (=> d!46848 (= res!122269 (and (or (let ((rhs!3232 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3232 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3232) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46849 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46849 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46849 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3231 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3231 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3231) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!226913 () Unit!9086)

(declare-fun choose!57 (BitStream!5262 BitStream!5262 (_ BitVec 64) (_ BitVec 32)) Unit!9086)

(assert (=> d!46848 (= lt!226913 (choose!57 thiss!1634 (_2!6881 lt!226224) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46848 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6881 lt!226224) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!226913)))

(declare-fun lt!226915 () (_ BitVec 32))

(declare-fun b!146166 () Bool)

(assert (=> b!146166 (= e!97427 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) (bvsub (bvsub to!404 from!447) lt!226915)))))

(assert (=> b!146166 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!226915 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!226915) #b10000000000000000000000000000000)))))

(declare-fun lt!226914 () (_ BitVec 64))

(assert (=> b!146166 (= lt!226915 ((_ extract 31 0) lt!226914))))

(assert (=> b!146166 (and (bvslt lt!226914 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!226914 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!146166 (= lt!226914 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46848 res!122269) b!146166))

(declare-fun m!225251 () Bool)

(assert (=> d!46848 m!225251))

(declare-fun m!225253 () Bool)

(assert (=> b!146166 m!225253))

(assert (=> b!145889 d!46848))

(declare-fun d!46851 () Bool)

(assert (=> d!46851 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226215) (bvsle ((_ sign_extend 32) lt!226215) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11493 () Bool)

(assert (= bs!11493 d!46851))

(assert (=> bs!11493 m!225179))

(assert (=> b!145889 d!46851))

(declare-fun d!46853 () Bool)

(declare-fun lt!226916 () tuple2!13084)

(assert (=> d!46853 (= lt!226916 (readByte!0 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (=> d!46853 (= (readBytePure!0 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) (tuple2!13071 (_2!6893 lt!226916) (_1!6893 lt!226916)))))

(declare-fun bs!11494 () Bool)

(assert (= bs!11494 d!46853))

(declare-fun m!225255 () Bool)

(assert (=> bs!11494 m!225255))

(assert (=> b!145889 d!46853))

(declare-fun d!46855 () Bool)

(declare-fun res!122270 () Bool)

(declare-fun e!97428 () Bool)

(assert (=> d!46855 (=> res!122270 e!97428)))

(assert (=> d!46855 (= res!122270 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46855 (= (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226216) #b00000000000000000000000000000000 to!404) e!97428)))

(declare-fun b!146167 () Bool)

(declare-fun e!97429 () Bool)

(assert (=> b!146167 (= e!97428 e!97429)))

(declare-fun res!122271 () Bool)

(assert (=> b!146167 (=> (not res!122271) (not e!97429))))

(assert (=> b!146167 (= res!122271 (= (select (arr!3741 (_2!6882 lt!226201)) #b00000000000000000000000000000000) (select (arr!3741 (_2!6882 lt!226216)) #b00000000000000000000000000000000)))))

(declare-fun b!146168 () Bool)

(assert (=> b!146168 (= e!97429 (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46855 (not res!122270)) b!146167))

(assert (= (and b!146167 res!122271) b!146168))

(assert (=> b!146167 m!225239))

(declare-fun m!225257 () Bool)

(assert (=> b!146167 m!225257))

(declare-fun m!225259 () Bool)

(assert (=> b!146168 m!225259))

(assert (=> b!145889 d!46855))

(declare-fun b!146169 () Bool)

(declare-fun res!122272 () Bool)

(declare-fun e!97431 () Bool)

(assert (=> b!146169 (=> (not res!122272) (not e!97431))))

(declare-fun lt!226926 () tuple2!13068)

(assert (=> b!146169 (= res!122272 (isPrefixOf!0 (_2!6883 lt!226926) (_2!6881 lt!226210)))))

(declare-fun b!146170 () Bool)

(declare-fun res!122274 () Bool)

(assert (=> b!146170 (=> (not res!122274) (not e!97431))))

(assert (=> b!146170 (= res!122274 (isPrefixOf!0 (_1!6883 lt!226926) (_2!6881 lt!226224)))))

(declare-fun lt!226918 () (_ BitVec 64))

(declare-fun b!146171 () Bool)

(declare-fun lt!226927 () (_ BitVec 64))

(assert (=> b!146171 (= e!97431 (= (_1!6883 lt!226926) (withMovedBitIndex!0 (_2!6883 lt!226926) (bvsub lt!226918 lt!226927))))))

(assert (=> b!146171 (or (= (bvand lt!226918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226927 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226918 lt!226927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146171 (= lt!226927 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210))))))

(assert (=> b!146171 (= lt!226918 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(declare-fun b!146172 () Bool)

(declare-fun e!97430 () Unit!9086)

(declare-fun lt!226933 () Unit!9086)

(assert (=> b!146172 (= e!97430 lt!226933)))

(declare-fun lt!226922 () (_ BitVec 64))

(assert (=> b!146172 (= lt!226922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226920 () (_ BitVec 64))

(assert (=> b!146172 (= lt!226920 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(assert (=> b!146172 (= lt!226933 (arrayBitRangesEqSymmetric!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226210)) lt!226922 lt!226920))))

(assert (=> b!146172 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 (_2!6881 lt!226224)) lt!226922 lt!226920)))

(declare-fun d!46857 () Bool)

(assert (=> d!46857 e!97431))

(declare-fun res!122273 () Bool)

(assert (=> d!46857 (=> (not res!122273) (not e!97431))))

(assert (=> d!46857 (= res!122273 (isPrefixOf!0 (_1!6883 lt!226926) (_2!6883 lt!226926)))))

(declare-fun lt!226924 () BitStream!5262)

(assert (=> d!46857 (= lt!226926 (tuple2!13069 lt!226924 (_2!6881 lt!226210)))))

(declare-fun lt!226919 () Unit!9086)

(declare-fun lt!226935 () Unit!9086)

(assert (=> d!46857 (= lt!226919 lt!226935)))

(assert (=> d!46857 (isPrefixOf!0 lt!226924 (_2!6881 lt!226210))))

(assert (=> d!46857 (= lt!226935 (lemmaIsPrefixTransitive!0 lt!226924 (_2!6881 lt!226210) (_2!6881 lt!226210)))))

(declare-fun lt!226917 () Unit!9086)

(declare-fun lt!226929 () Unit!9086)

(assert (=> d!46857 (= lt!226917 lt!226929)))

(assert (=> d!46857 (isPrefixOf!0 lt!226924 (_2!6881 lt!226210))))

(assert (=> d!46857 (= lt!226929 (lemmaIsPrefixTransitive!0 lt!226924 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(declare-fun lt!226936 () Unit!9086)

(assert (=> d!46857 (= lt!226936 e!97430)))

(declare-fun c!7914 () Bool)

(assert (=> d!46857 (= c!7914 (not (= (size!3002 (buf!3447 (_2!6881 lt!226224))) #b00000000000000000000000000000000)))))

(declare-fun lt!226925 () Unit!9086)

(declare-fun lt!226930 () Unit!9086)

(assert (=> d!46857 (= lt!226925 lt!226930)))

(assert (=> d!46857 (isPrefixOf!0 (_2!6881 lt!226210) (_2!6881 lt!226210))))

(assert (=> d!46857 (= lt!226930 (lemmaIsPrefixRefl!0 (_2!6881 lt!226210)))))

(declare-fun lt!226921 () Unit!9086)

(declare-fun lt!226934 () Unit!9086)

(assert (=> d!46857 (= lt!226921 lt!226934)))

(assert (=> d!46857 (= lt!226934 (lemmaIsPrefixRefl!0 (_2!6881 lt!226210)))))

(declare-fun lt!226923 () Unit!9086)

(declare-fun lt!226931 () Unit!9086)

(assert (=> d!46857 (= lt!226923 lt!226931)))

(assert (=> d!46857 (isPrefixOf!0 lt!226924 lt!226924)))

(assert (=> d!46857 (= lt!226931 (lemmaIsPrefixRefl!0 lt!226924))))

(declare-fun lt!226932 () Unit!9086)

(declare-fun lt!226928 () Unit!9086)

(assert (=> d!46857 (= lt!226932 lt!226928)))

(assert (=> d!46857 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226224))))

(assert (=> d!46857 (= lt!226928 (lemmaIsPrefixRefl!0 (_2!6881 lt!226224)))))

(assert (=> d!46857 (= lt!226924 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(assert (=> d!46857 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226210))))

(assert (=> d!46857 (= (reader!0 (_2!6881 lt!226224) (_2!6881 lt!226210)) lt!226926)))

(declare-fun b!146173 () Bool)

(declare-fun Unit!9097 () Unit!9086)

(assert (=> b!146173 (= e!97430 Unit!9097)))

(assert (= (and d!46857 c!7914) b!146172))

(assert (= (and d!46857 (not c!7914)) b!146173))

(assert (= (and d!46857 res!122273) b!146170))

(assert (= (and b!146170 res!122274) b!146169))

(assert (= (and b!146169 res!122272) b!146171))

(assert (=> d!46857 m!225193))

(declare-fun m!225261 () Bool)

(assert (=> d!46857 m!225261))

(declare-fun m!225263 () Bool)

(assert (=> d!46857 m!225263))

(declare-fun m!225265 () Bool)

(assert (=> d!46857 m!225265))

(assert (=> d!46857 m!224603))

(declare-fun m!225267 () Bool)

(assert (=> d!46857 m!225267))

(declare-fun m!225269 () Bool)

(assert (=> d!46857 m!225269))

(declare-fun m!225271 () Bool)

(assert (=> d!46857 m!225271))

(declare-fun m!225273 () Bool)

(assert (=> d!46857 m!225273))

(declare-fun m!225275 () Bool)

(assert (=> d!46857 m!225275))

(assert (=> d!46857 m!225211))

(assert (=> b!146172 m!224667))

(declare-fun m!225277 () Bool)

(assert (=> b!146172 m!225277))

(declare-fun m!225279 () Bool)

(assert (=> b!146172 m!225279))

(declare-fun m!225281 () Bool)

(assert (=> b!146170 m!225281))

(declare-fun m!225283 () Bool)

(assert (=> b!146171 m!225283))

(assert (=> b!146171 m!224683))

(assert (=> b!146171 m!224667))

(declare-fun m!225285 () Bool)

(assert (=> b!146169 m!225285))

(assert (=> b!145889 d!46857))

(declare-fun d!46859 () Bool)

(assert (=> d!46859 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!226937 () Unit!9086)

(assert (=> d!46859 (= lt!226937 (choose!26 thiss!1634 (buf!3447 (_2!6881 lt!226210)) (bvsub to!404 from!447) (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (=> d!46859 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3447 (_2!6881 lt!226210)) (bvsub to!404 from!447)) lt!226937)))

(declare-fun bs!11495 () Bool)

(assert (= bs!11495 d!46859))

(assert (=> bs!11495 m!224641))

(declare-fun m!225287 () Bool)

(assert (=> bs!11495 m!225287))

(assert (=> b!145889 d!46859))

(declare-fun d!46861 () Bool)

(assert (=> d!46861 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226210))))

(declare-fun lt!226940 () Unit!9086)

(declare-fun choose!30 (BitStream!5262 BitStream!5262 BitStream!5262) Unit!9086)

(assert (=> d!46861 (= lt!226940 (choose!30 thiss!1634 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(assert (=> d!46861 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226224))))

(assert (=> d!46861 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6881 lt!226224) (_2!6881 lt!226210)) lt!226940)))

(declare-fun bs!11496 () Bool)

(assert (= bs!11496 d!46861))

(assert (=> bs!11496 m!224625))

(declare-fun m!225289 () Bool)

(assert (=> bs!11496 m!225289))

(assert (=> bs!11496 m!224665))

(assert (=> b!145889 d!46861))

(declare-fun d!46863 () Bool)

(declare-fun e!97432 () Bool)

(assert (=> d!46863 e!97432))

(declare-fun res!122275 () Bool)

(assert (=> d!46863 (=> (not res!122275) (not e!97432))))

(declare-fun lt!226946 () (_ BitVec 64))

(declare-fun lt!226942 () (_ BitVec 64))

(declare-fun lt!226945 () (_ BitVec 64))

(assert (=> d!46863 (= res!122275 (= lt!226942 (bvsub lt!226945 lt!226946)))))

(assert (=> d!46863 (or (= (bvand lt!226945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226946 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226945 lt!226946) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46863 (= lt!226946 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226206)))) ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226206))) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226206)))))))

(declare-fun lt!226944 () (_ BitVec 64))

(declare-fun lt!226941 () (_ BitVec 64))

(assert (=> d!46863 (= lt!226945 (bvmul lt!226944 lt!226941))))

(assert (=> d!46863 (or (= lt!226944 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226941 (bvsdiv (bvmul lt!226944 lt!226941) lt!226944)))))

(assert (=> d!46863 (= lt!226941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46863 (= lt!226944 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226206)))))))

(assert (=> d!46863 (= lt!226942 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226206)))))))

(assert (=> d!46863 (invariant!0 (currentBit!6338 (_1!6884 lt!226206)) (currentByte!6343 (_1!6884 lt!226206)) (size!3002 (buf!3447 (_1!6884 lt!226206))))))

(assert (=> d!46863 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226206))) (currentByte!6343 (_1!6884 lt!226206)) (currentBit!6338 (_1!6884 lt!226206))) lt!226942)))

(declare-fun b!146174 () Bool)

(declare-fun res!122276 () Bool)

(assert (=> b!146174 (=> (not res!122276) (not e!97432))))

(assert (=> b!146174 (= res!122276 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226942))))

(declare-fun b!146175 () Bool)

(declare-fun lt!226943 () (_ BitVec 64))

(assert (=> b!146175 (= e!97432 (bvsle lt!226942 (bvmul lt!226943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146175 (or (= lt!226943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226943)))))

(assert (=> b!146175 (= lt!226943 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226206)))))))

(assert (= (and d!46863 res!122275) b!146174))

(assert (= (and b!146174 res!122276) b!146175))

(declare-fun m!225291 () Bool)

(assert (=> d!46863 m!225291))

(declare-fun m!225293 () Bool)

(assert (=> d!46863 m!225293))

(assert (=> b!145889 d!46863))

(declare-fun d!46865 () Bool)

(declare-fun lt!226947 () tuple3!568)

(assert (=> d!46865 (= lt!226947 (readByteArrayLoop!0 (_1!6883 lt!226207) arr!237 from!447 to!404))))

(assert (=> d!46865 (= (readByteArrayLoopPure!0 (_1!6883 lt!226207) arr!237 from!447 to!404) (tuple2!13067 (_2!6894 lt!226947) (_3!351 lt!226947)))))

(declare-fun bs!11497 () Bool)

(assert (= bs!11497 d!46865))

(declare-fun m!225295 () Bool)

(assert (=> bs!11497 m!225295))

(assert (=> b!145889 d!46865))

(declare-fun d!46867 () Bool)

(declare-fun lt!226948 () tuple3!568)

(assert (=> d!46867 (= lt!226948 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46867 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13067 (_2!6894 lt!226948) (_3!351 lt!226948)))))

(declare-fun bs!11498 () Bool)

(assert (= bs!11498 d!46867))

(assert (=> bs!11498 m!224621))

(declare-fun m!225297 () Bool)

(assert (=> bs!11498 m!225297))

(assert (=> b!145889 d!46867))

(declare-fun e!97440 () Bool)

(declare-fun lt!226967 () tuple2!13066)

(declare-fun b!146186 () Bool)

(assert (=> b!146186 (= e!97440 (arrayRangesEq!318 arr!237 (_2!6882 lt!226967) #b00000000000000000000000000000000 to!404))))

(declare-fun b!146187 () Bool)

(declare-fun res!122291 () Bool)

(declare-fun e!97441 () Bool)

(assert (=> b!146187 (=> (not res!122291) (not e!97441))))

(declare-fun lt!226970 () tuple2!13064)

(declare-fun lt!226968 () (_ BitVec 64))

(declare-fun lt!226969 () (_ BitVec 64))

(assert (=> b!146187 (= res!122291 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226970))) (currentByte!6343 (_2!6881 lt!226970)) (currentBit!6338 (_2!6881 lt!226970))) (bvadd lt!226969 lt!226968)))))

(assert (=> b!146187 (or (not (= (bvand lt!226969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226968 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226969 lt!226968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!226972 () (_ BitVec 64))

(assert (=> b!146187 (= lt!226968 (bvmul lt!226972 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!146187 (or (= lt!226972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226972)))))

(assert (=> b!146187 (= lt!226972 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146187 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146187 (= lt!226969 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(declare-fun d!46869 () Bool)

(assert (=> d!46869 e!97441))

(declare-fun res!122289 () Bool)

(assert (=> d!46869 (=> (not res!122289) (not e!97441))))

(assert (=> d!46869 (= res!122289 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 lt!226970)))))))

(declare-fun choose!64 (BitStream!5262 array!6631 (_ BitVec 32) (_ BitVec 32)) tuple2!13064)

(assert (=> d!46869 (= lt!226970 (choose!64 (_2!6881 lt!226224) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46869 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3002 arr!237)))))

(assert (=> d!46869 (= (appendByteArrayLoop!0 (_2!6881 lt!226224) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!226970)))

(declare-fun b!146188 () Bool)

(declare-fun e!97439 () Bool)

(declare-fun lt!226971 () (_ BitVec 64))

(assert (=> b!146188 (= e!97439 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226971))))

(declare-fun b!146189 () Bool)

(declare-fun res!122287 () Bool)

(assert (=> b!146189 (=> (not res!122287) (not e!97441))))

(assert (=> b!146189 (= res!122287 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226970)))))

(declare-fun b!146190 () Bool)

(assert (=> b!146190 (= e!97441 e!97440)))

(declare-fun res!122290 () Bool)

(assert (=> b!146190 (=> (not res!122290) (not e!97440))))

(declare-fun lt!226975 () tuple2!13068)

(assert (=> b!146190 (= res!122290 (and (= (size!3002 (_2!6882 lt!226967)) (size!3002 arr!237)) (= (_1!6882 lt!226967) (_2!6883 lt!226975))))))

(assert (=> b!146190 (= lt!226967 (readByteArrayLoopPure!0 (_1!6883 lt!226975) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226974 () Unit!9086)

(declare-fun lt!226973 () Unit!9086)

(assert (=> b!146190 (= lt!226974 lt!226973)))

(assert (=> b!146190 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226971)))

(assert (=> b!146190 (= lt!226973 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226970)) lt!226971))))

(assert (=> b!146190 e!97439))

(declare-fun res!122288 () Bool)

(assert (=> b!146190 (=> (not res!122288) (not e!97439))))

(assert (=> b!146190 (= res!122288 (and (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 lt!226970)))) (bvsge lt!226971 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146190 (= lt!226971 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146190 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146190 (= lt!226975 (reader!0 (_2!6881 lt!226224) (_2!6881 lt!226970)))))

(assert (= (and d!46869 res!122289) b!146187))

(assert (= (and b!146187 res!122291) b!146189))

(assert (= (and b!146189 res!122287) b!146190))

(assert (= (and b!146190 res!122288) b!146188))

(assert (= (and b!146190 res!122290) b!146186))

(declare-fun m!225299 () Bool)

(assert (=> b!146189 m!225299))

(declare-fun m!225301 () Bool)

(assert (=> d!46869 m!225301))

(declare-fun m!225303 () Bool)

(assert (=> b!146188 m!225303))

(declare-fun m!225305 () Bool)

(assert (=> b!146187 m!225305))

(assert (=> b!146187 m!224667))

(declare-fun m!225307 () Bool)

(assert (=> b!146186 m!225307))

(declare-fun m!225309 () Bool)

(assert (=> b!146190 m!225309))

(declare-fun m!225311 () Bool)

(assert (=> b!146190 m!225311))

(declare-fun m!225313 () Bool)

(assert (=> b!146190 m!225313))

(declare-fun m!225315 () Bool)

(assert (=> b!146190 m!225315))

(assert (=> b!145889 d!46869))

(declare-fun d!46871 () Bool)

(declare-fun res!122298 () Bool)

(declare-fun e!97447 () Bool)

(assert (=> d!46871 (=> (not res!122298) (not e!97447))))

(assert (=> d!46871 (= res!122298 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46871 (= (isPrefixOf!0 thiss!1634 (_2!6881 lt!226210)) e!97447)))

(declare-fun b!146197 () Bool)

(declare-fun res!122299 () Bool)

(assert (=> b!146197 (=> (not res!122299) (not e!97447))))

(assert (=> b!146197 (= res!122299 (bvsle (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146198 () Bool)

(declare-fun e!97446 () Bool)

(assert (=> b!146198 (= e!97447 e!97446)))

(declare-fun res!122300 () Bool)

(assert (=> b!146198 (=> res!122300 e!97446)))

(assert (=> b!146198 (= res!122300 (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146199 () Bool)

(assert (=> b!146199 (= e!97446 (arrayBitRangesEq!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (= (and d!46871 res!122298) b!146197))

(assert (= (and b!146197 res!122299) b!146198))

(assert (= (and b!146198 (not res!122300)) b!146199))

(assert (=> b!146197 m!224669))

(assert (=> b!146197 m!224683))

(assert (=> b!146199 m!224669))

(assert (=> b!146199 m!224669))

(declare-fun m!225317 () Bool)

(assert (=> b!146199 m!225317))

(assert (=> b!145889 d!46871))

(declare-fun d!46873 () Bool)

(declare-fun e!97450 () Bool)

(assert (=> d!46873 e!97450))

(declare-fun res!122308 () Bool)

(assert (=> d!46873 (=> (not res!122308) (not e!97450))))

(declare-fun lt!226986 () tuple2!13064)

(assert (=> d!46873 (= res!122308 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 (_2!6881 lt!226986)))))))

(declare-fun choose!6 (BitStream!5262 (_ BitVec 8)) tuple2!13064)

(assert (=> d!46873 (= lt!226986 (choose!6 thiss!1634 (select (arr!3741 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46873 (validate_offset_byte!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)))))

(assert (=> d!46873 (= (appendByte!0 thiss!1634 (select (arr!3741 arr!237) from!447)) lt!226986)))

(declare-fun b!146206 () Bool)

(declare-fun res!122307 () Bool)

(assert (=> b!146206 (=> (not res!122307) (not e!97450))))

(declare-fun lt!226988 () (_ BitVec 64))

(declare-fun lt!226990 () (_ BitVec 64))

(assert (=> b!146206 (= res!122307 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226986))) (currentByte!6343 (_2!6881 lt!226986)) (currentBit!6338 (_2!6881 lt!226986))) (bvadd lt!226990 lt!226988)))))

(assert (=> b!146206 (or (not (= (bvand lt!226990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226988 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226990 lt!226988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146206 (= lt!226988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146206 (= lt!226990 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(declare-fun b!146207 () Bool)

(declare-fun res!122309 () Bool)

(assert (=> b!146207 (=> (not res!122309) (not e!97450))))

(assert (=> b!146207 (= res!122309 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226986)))))

(declare-fun lt!226989 () tuple2!13070)

(declare-fun lt!226987 () tuple2!13068)

(declare-fun b!146208 () Bool)

(assert (=> b!146208 (= e!97450 (and (= (_2!6884 lt!226989) (select (arr!3741 arr!237) from!447)) (= (_1!6884 lt!226989) (_2!6883 lt!226987))))))

(assert (=> b!146208 (= lt!226989 (readBytePure!0 (_1!6883 lt!226987)))))

(assert (=> b!146208 (= lt!226987 (reader!0 thiss!1634 (_2!6881 lt!226986)))))

(assert (= (and d!46873 res!122308) b!146206))

(assert (= (and b!146206 res!122307) b!146207))

(assert (= (and b!146207 res!122309) b!146208))

(assert (=> d!46873 m!224631))

(declare-fun m!225319 () Bool)

(assert (=> d!46873 m!225319))

(declare-fun m!225321 () Bool)

(assert (=> d!46873 m!225321))

(declare-fun m!225323 () Bool)

(assert (=> b!146206 m!225323))

(assert (=> b!146206 m!224669))

(declare-fun m!225325 () Bool)

(assert (=> b!146207 m!225325))

(declare-fun m!225327 () Bool)

(assert (=> b!146208 m!225327))

(declare-fun m!225329 () Bool)

(assert (=> b!146208 m!225329))

(assert (=> b!145889 d!46873))

(declare-fun d!46875 () Bool)

(declare-fun lt!226991 () tuple2!13084)

(assert (=> d!46875 (= lt!226991 (readByte!0 lt!226222))))

(assert (=> d!46875 (= (readBytePure!0 lt!226222) (tuple2!13071 (_2!6893 lt!226991) (_1!6893 lt!226991)))))

(declare-fun bs!11499 () Bool)

(assert (= bs!11499 d!46875))

(declare-fun m!225331 () Bool)

(assert (=> bs!11499 m!225331))

(assert (=> b!145889 d!46875))

(declare-fun d!46877 () Bool)

(declare-fun lt!226992 () tuple3!568)

(assert (=> d!46877 (= lt!226992 (readByteArrayLoop!0 (_1!6883 lt!226219) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46877 (= (readByteArrayLoopPure!0 (_1!6883 lt!226219) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13067 (_2!6894 lt!226992) (_3!351 lt!226992)))))

(declare-fun bs!11500 () Bool)

(assert (= bs!11500 d!46877))

(declare-fun m!225333 () Bool)

(assert (=> bs!11500 m!225333))

(assert (=> b!145884 d!46877))

(declare-fun d!46879 () Bool)

(assert (=> d!46879 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226208) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) lt!226208))))

(declare-fun bs!11501 () Bool)

(assert (= bs!11501 d!46879))

(assert (=> bs!11501 m!225183))

(assert (=> b!145884 d!46879))

(declare-fun d!46881 () Bool)

(assert (=> d!46881 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226208)))

(declare-fun lt!226995 () Unit!9086)

(declare-fun choose!9 (BitStream!5262 array!6631 (_ BitVec 64) BitStream!5262) Unit!9086)

(assert (=> d!46881 (= lt!226995 (choose!9 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226208 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (=> d!46881 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226208) lt!226995)))

(declare-fun bs!11502 () Bool)

(assert (= bs!11502 d!46881))

(assert (=> bs!11502 m!224673))

(declare-fun m!225335 () Bool)

(assert (=> bs!11502 m!225335))

(assert (=> b!145884 d!46881))

(assert (=> b!145884 d!46857))

(declare-fun d!46883 () Bool)

(declare-fun lt!226996 () tuple2!13084)

(assert (=> d!46883 (= lt!226996 (readByte!0 (_1!6883 lt!226203)))))

(assert (=> d!46883 (= (readBytePure!0 (_1!6883 lt!226203)) (tuple2!13071 (_2!6893 lt!226996) (_1!6893 lt!226996)))))

(declare-fun bs!11503 () Bool)

(assert (= bs!11503 d!46883))

(declare-fun m!225337 () Bool)

(assert (=> bs!11503 m!225337))

(assert (=> b!145885 d!46883))

(declare-fun b!146209 () Bool)

(declare-fun res!122310 () Bool)

(declare-fun e!97452 () Bool)

(assert (=> b!146209 (=> (not res!122310) (not e!97452))))

(declare-fun lt!227006 () tuple2!13068)

(assert (=> b!146209 (= res!122310 (isPrefixOf!0 (_2!6883 lt!227006) (_2!6881 lt!226224)))))

(declare-fun b!146210 () Bool)

(declare-fun res!122312 () Bool)

(assert (=> b!146210 (=> (not res!122312) (not e!97452))))

(assert (=> b!146210 (= res!122312 (isPrefixOf!0 (_1!6883 lt!227006) thiss!1634))))

(declare-fun b!146211 () Bool)

(declare-fun lt!227007 () (_ BitVec 64))

(declare-fun lt!226998 () (_ BitVec 64))

(assert (=> b!146211 (= e!97452 (= (_1!6883 lt!227006) (withMovedBitIndex!0 (_2!6883 lt!227006) (bvsub lt!226998 lt!227007))))))

(assert (=> b!146211 (or (= (bvand lt!226998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226998 lt!227007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146211 (= lt!227007 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(assert (=> b!146211 (= lt!226998 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(declare-fun b!146212 () Bool)

(declare-fun e!97451 () Unit!9086)

(declare-fun lt!227013 () Unit!9086)

(assert (=> b!146212 (= e!97451 lt!227013)))

(declare-fun lt!227002 () (_ BitVec 64))

(assert (=> b!146212 (= lt!227002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!227000 () (_ BitVec 64))

(assert (=> b!146212 (= lt!227000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(assert (=> b!146212 (= lt!227013 (arrayBitRangesEqSymmetric!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226224)) lt!227002 lt!227000))))

(assert (=> b!146212 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 thiss!1634) lt!227002 lt!227000)))

(declare-fun d!46885 () Bool)

(assert (=> d!46885 e!97452))

(declare-fun res!122311 () Bool)

(assert (=> d!46885 (=> (not res!122311) (not e!97452))))

(assert (=> d!46885 (= res!122311 (isPrefixOf!0 (_1!6883 lt!227006) (_2!6883 lt!227006)))))

(declare-fun lt!227004 () BitStream!5262)

(assert (=> d!46885 (= lt!227006 (tuple2!13069 lt!227004 (_2!6881 lt!226224)))))

(declare-fun lt!226999 () Unit!9086)

(declare-fun lt!227015 () Unit!9086)

(assert (=> d!46885 (= lt!226999 lt!227015)))

(assert (=> d!46885 (isPrefixOf!0 lt!227004 (_2!6881 lt!226224))))

(assert (=> d!46885 (= lt!227015 (lemmaIsPrefixTransitive!0 lt!227004 (_2!6881 lt!226224) (_2!6881 lt!226224)))))

(declare-fun lt!226997 () Unit!9086)

(declare-fun lt!227009 () Unit!9086)

(assert (=> d!46885 (= lt!226997 lt!227009)))

(assert (=> d!46885 (isPrefixOf!0 lt!227004 (_2!6881 lt!226224))))

(assert (=> d!46885 (= lt!227009 (lemmaIsPrefixTransitive!0 lt!227004 thiss!1634 (_2!6881 lt!226224)))))

(declare-fun lt!227016 () Unit!9086)

(assert (=> d!46885 (= lt!227016 e!97451)))

(declare-fun c!7915 () Bool)

(assert (=> d!46885 (= c!7915 (not (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!227005 () Unit!9086)

(declare-fun lt!227010 () Unit!9086)

(assert (=> d!46885 (= lt!227005 lt!227010)))

(assert (=> d!46885 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226224))))

(assert (=> d!46885 (= lt!227010 (lemmaIsPrefixRefl!0 (_2!6881 lt!226224)))))

(declare-fun lt!227001 () Unit!9086)

(declare-fun lt!227014 () Unit!9086)

(assert (=> d!46885 (= lt!227001 lt!227014)))

(assert (=> d!46885 (= lt!227014 (lemmaIsPrefixRefl!0 (_2!6881 lt!226224)))))

(declare-fun lt!227003 () Unit!9086)

(declare-fun lt!227011 () Unit!9086)

(assert (=> d!46885 (= lt!227003 lt!227011)))

(assert (=> d!46885 (isPrefixOf!0 lt!227004 lt!227004)))

(assert (=> d!46885 (= lt!227011 (lemmaIsPrefixRefl!0 lt!227004))))

(declare-fun lt!227012 () Unit!9086)

(declare-fun lt!227008 () Unit!9086)

(assert (=> d!46885 (= lt!227012 lt!227008)))

(assert (=> d!46885 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46885 (= lt!227008 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46885 (= lt!227004 (BitStream!5263 (buf!3447 (_2!6881 lt!226224)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(assert (=> d!46885 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226224))))

(assert (=> d!46885 (= (reader!0 thiss!1634 (_2!6881 lt!226224)) lt!227006)))

(declare-fun b!146213 () Bool)

(declare-fun Unit!9098 () Unit!9086)

(assert (=> b!146213 (= e!97451 Unit!9098)))

(assert (= (and d!46885 c!7915) b!146212))

(assert (= (and d!46885 (not c!7915)) b!146213))

(assert (= (and d!46885 res!122311) b!146210))

(assert (= (and b!146210 res!122312) b!146209))

(assert (= (and b!146209 res!122310) b!146211))

(assert (=> d!46885 m!225261))

(assert (=> d!46885 m!225195))

(declare-fun m!225339 () Bool)

(assert (=> d!46885 m!225339))

(declare-fun m!225341 () Bool)

(assert (=> d!46885 m!225341))

(assert (=> d!46885 m!224665))

(declare-fun m!225343 () Bool)

(assert (=> d!46885 m!225343))

(assert (=> d!46885 m!225203))

(declare-fun m!225345 () Bool)

(assert (=> d!46885 m!225345))

(declare-fun m!225347 () Bool)

(assert (=> d!46885 m!225347))

(declare-fun m!225349 () Bool)

(assert (=> d!46885 m!225349))

(assert (=> d!46885 m!225269))

(assert (=> b!146212 m!224669))

(declare-fun m!225351 () Bool)

(assert (=> b!146212 m!225351))

(declare-fun m!225353 () Bool)

(assert (=> b!146212 m!225353))

(declare-fun m!225355 () Bool)

(assert (=> b!146210 m!225355))

(declare-fun m!225357 () Bool)

(assert (=> b!146211 m!225357))

(assert (=> b!146211 m!224667))

(assert (=> b!146211 m!224669))

(declare-fun m!225359 () Bool)

(assert (=> b!146209 m!225359))

(assert (=> b!145885 d!46885))

(declare-fun d!46887 () Bool)

(declare-fun res!122313 () Bool)

(declare-fun e!97454 () Bool)

(assert (=> d!46887 (=> (not res!122313) (not e!97454))))

(assert (=> d!46887 (= res!122313 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46887 (= (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226210)) e!97454)))

(declare-fun b!146214 () Bool)

(declare-fun res!122314 () Bool)

(assert (=> b!146214 (=> (not res!122314) (not e!97454))))

(assert (=> b!146214 (= res!122314 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146215 () Bool)

(declare-fun e!97453 () Bool)

(assert (=> b!146215 (= e!97454 e!97453)))

(declare-fun res!122315 () Bool)

(assert (=> b!146215 (=> res!122315 e!97453)))

(assert (=> b!146215 (= res!122315 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) #b00000000000000000000000000000000))))

(declare-fun b!146216 () Bool)

(assert (=> b!146216 (= e!97453 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (= (and d!46887 res!122313) b!146214))

(assert (= (and b!146214 res!122314) b!146215))

(assert (= (and b!146215 (not res!122315)) b!146216))

(assert (=> b!146214 m!224667))

(assert (=> b!146214 m!224683))

(assert (=> b!146216 m!224667))

(assert (=> b!146216 m!224667))

(declare-fun m!225361 () Bool)

(assert (=> b!146216 m!225361))

(assert (=> b!145886 d!46887))

(declare-fun d!46889 () Bool)

(assert (=> d!46889 (= (invariant!0 (currentBit!6338 thiss!1634) (currentByte!6343 thiss!1634) (size!3002 (buf!3447 (_2!6881 lt!226224)))) (and (bvsge (currentBit!6338 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6338 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6343 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6343 thiss!1634) (size!3002 (buf!3447 (_2!6881 lt!226224)))) (and (= (currentBit!6338 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6343 thiss!1634) (size!3002 (buf!3447 (_2!6881 lt!226224))))))))))

(assert (=> b!145892 d!46889))

(declare-fun d!46891 () Bool)

(assert (=> d!46891 (= (invariant!0 (currentBit!6338 thiss!1634) (currentByte!6343 thiss!1634) (size!3002 (buf!3447 thiss!1634))) (and (bvsge (currentBit!6338 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6338 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6343 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6343 thiss!1634) (size!3002 (buf!3447 thiss!1634))) (and (= (currentBit!6338 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6343 thiss!1634) (size!3002 (buf!3447 thiss!1634)))))))))

(assert (=> b!145893 d!46891))

(declare-fun d!46893 () Bool)

(declare-fun res!122316 () Bool)

(declare-fun e!97456 () Bool)

(assert (=> d!46893 (=> (not res!122316) (not e!97456))))

(assert (=> d!46893 (= res!122316 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (=> d!46893 (= (isPrefixOf!0 thiss!1634 (_2!6881 lt!226224)) e!97456)))

(declare-fun b!146217 () Bool)

(declare-fun res!122317 () Bool)

(assert (=> b!146217 (=> (not res!122317) (not e!97456))))

(assert (=> b!146217 (= res!122317 (bvsle (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun b!146218 () Bool)

(declare-fun e!97455 () Bool)

(assert (=> b!146218 (= e!97456 e!97455)))

(declare-fun res!122318 () Bool)

(assert (=> b!146218 (=> res!122318 e!97455)))

(assert (=> b!146218 (= res!122318 (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146219 () Bool)

(assert (=> b!146219 (= e!97455 (arrayBitRangesEq!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (= (and d!46893 res!122316) b!146217))

(assert (= (and b!146217 res!122317) b!146218))

(assert (= (and b!146218 (not res!122318)) b!146219))

(assert (=> b!146217 m!224669))

(assert (=> b!146217 m!224667))

(assert (=> b!146219 m!224669))

(assert (=> b!146219 m!224669))

(declare-fun m!225363 () Bool)

(assert (=> b!146219 m!225363))

(assert (=> b!145882 d!46893))

(declare-fun d!46895 () Bool)

(declare-fun res!122319 () Bool)

(declare-fun e!97457 () Bool)

(assert (=> d!46895 (=> res!122319 e!97457)))

(assert (=> d!46895 (= res!122319 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46895 (= (arrayRangesEq!318 arr!237 (_2!6882 lt!226220) #b00000000000000000000000000000000 to!404) e!97457)))

(declare-fun b!146220 () Bool)

(declare-fun e!97458 () Bool)

(assert (=> b!146220 (= e!97457 e!97458)))

(declare-fun res!122320 () Bool)

(assert (=> b!146220 (=> (not res!122320) (not e!97458))))

(assert (=> b!146220 (= res!122320 (= (select (arr!3741 arr!237) #b00000000000000000000000000000000) (select (arr!3741 (_2!6882 lt!226220)) #b00000000000000000000000000000000)))))

(declare-fun b!146221 () Bool)

(assert (=> b!146221 (= e!97458 (arrayRangesEq!318 arr!237 (_2!6882 lt!226220) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46895 (not res!122319)) b!146220))

(assert (= (and b!146220 res!122320) b!146221))

(declare-fun m!225365 () Bool)

(assert (=> b!146220 m!225365))

(declare-fun m!225367 () Bool)

(assert (=> b!146220 m!225367))

(declare-fun m!225369 () Bool)

(assert (=> b!146221 m!225369))

(assert (=> b!145894 d!46895))

(check-sat (not b!146207) (not b!146166) (not d!46857) (not d!46816) (not b!146190) (not d!46840) (not d!46826) (not d!46832) (not d!46881) (not b!146214) (not d!46885) (not b!146219) (not b!146206) (not d!46851) (not b!146189) (not b!146150) (not d!46834) (not b!146168) (not d!46875) (not d!46820) (not b!146211) (not d!46818) (not b!146149) (not b!146209) (not d!46873) (not b!146151) (not d!46877) (not b!146188) (not d!46830) (not b!146187) (not d!46846) (not b!146171) (not d!46863) (not b!146217) (not d!46867) (not d!46861) (not b!146170) (not d!46883) (not b!146212) (not b!146221) (not d!46838) (not d!46824) (not d!46828) (not d!46844) (not d!46865) (not d!46879) (not d!46822) (not d!46848) (not b!146169) (not b!146197) (not d!46836) (not b!146186) (not b!146210) (not d!46853) (not b!146148) (not b!146199) (not b!146161) (not b!146208) (not b!146172) (not d!46859) (not b!146216) (not d!46869))
(check-sat)
(get-model)

(assert (=> b!146151 d!46824))

(declare-fun d!46897 () Bool)

(assert (=> d!46897 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 thiss!1634) lt!226865 lt!226863)))

(declare-fun lt!227019 () Unit!9086)

(declare-fun choose!8 (array!6631 array!6631 (_ BitVec 64) (_ BitVec 64)) Unit!9086)

(assert (=> d!46897 (= lt!227019 (choose!8 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226210)) lt!226865 lt!226863))))

(assert (=> d!46897 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226865) (bvsle lt!226865 lt!226863))))

(assert (=> d!46897 (= (arrayBitRangesEqSymmetric!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226210)) lt!226865 lt!226863) lt!227019)))

(declare-fun bs!11504 () Bool)

(assert (= bs!11504 d!46897))

(assert (=> bs!11504 m!225215))

(declare-fun m!225371 () Bool)

(assert (=> bs!11504 m!225371))

(assert (=> b!146151 d!46897))

(declare-fun b!146236 () Bool)

(declare-fun e!97471 () Bool)

(declare-fun call!1897 () Bool)

(assert (=> b!146236 (= e!97471 call!1897)))

(declare-fun b!146237 () Bool)

(declare-fun res!122334 () Bool)

(declare-fun lt!227028 () (_ BitVec 32))

(assert (=> b!146237 (= res!122334 (= lt!227028 #b00000000000000000000000000000000))))

(declare-fun e!97474 () Bool)

(assert (=> b!146237 (=> res!122334 e!97474)))

(declare-fun e!97472 () Bool)

(assert (=> b!146237 (= e!97472 e!97474)))

(declare-fun d!46899 () Bool)

(declare-fun res!122333 () Bool)

(declare-fun e!97475 () Bool)

(assert (=> d!46899 (=> res!122333 e!97475)))

(assert (=> d!46899 (= res!122333 (bvsge lt!226865 lt!226863))))

(assert (=> d!46899 (= (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 thiss!1634) lt!226865 lt!226863) e!97475)))

(declare-datatypes ((tuple4!134 0))(
  ( (tuple4!135 (_1!6895 (_ BitVec 32)) (_2!6895 (_ BitVec 32)) (_3!352 (_ BitVec 32)) (_4!67 (_ BitVec 32))) )
))
(declare-fun lt!227026 () tuple4!134)

(declare-fun lt!227027 () (_ BitVec 32))

(declare-fun bm!1894 () Bool)

(declare-fun c!7918 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1894 (= call!1897 (byteRangesEq!0 (ite c!7918 (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227026)) (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_4!67 lt!227026))) (ite c!7918 (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227026)) (select (arr!3741 (buf!3447 thiss!1634)) (_4!67 lt!227026))) (ite c!7918 lt!227027 #b00000000000000000000000000000000) lt!227028))))

(declare-fun b!146238 () Bool)

(declare-fun e!97473 () Bool)

(assert (=> b!146238 (= e!97473 e!97471)))

(assert (=> b!146238 (= c!7918 (= (_3!352 lt!227026) (_4!67 lt!227026)))))

(declare-fun b!146239 () Bool)

(assert (=> b!146239 (= e!97475 e!97473)))

(declare-fun res!122331 () Bool)

(assert (=> b!146239 (=> (not res!122331) (not e!97473))))

(declare-fun e!97476 () Bool)

(assert (=> b!146239 (= res!122331 e!97476)))

(declare-fun res!122332 () Bool)

(assert (=> b!146239 (=> res!122332 e!97476)))

(assert (=> b!146239 (= res!122332 (bvsge (_1!6895 lt!227026) (_2!6895 lt!227026)))))

(assert (=> b!146239 (= lt!227028 ((_ extract 31 0) (bvsrem lt!226863 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146239 (= lt!227027 ((_ extract 31 0) (bvsrem lt!226865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!134)

(assert (=> b!146239 (= lt!227026 (arrayBitIndices!0 lt!226865 lt!226863))))

(declare-fun b!146240 () Bool)

(assert (=> b!146240 (= e!97471 e!97472)))

(declare-fun res!122335 () Bool)

(assert (=> b!146240 (= res!122335 (byteRangesEq!0 (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227026)) (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227026)) lt!227027 #b00000000000000000000000000001000))))

(assert (=> b!146240 (=> (not res!122335) (not e!97472))))

(declare-fun b!146241 () Bool)

(assert (=> b!146241 (= e!97474 call!1897)))

(declare-fun b!146242 () Bool)

(assert (=> b!146242 (= e!97476 (arrayRangesEq!318 (buf!3447 (_2!6881 lt!226210)) (buf!3447 thiss!1634) (_1!6895 lt!227026) (_2!6895 lt!227026)))))

(assert (= (and d!46899 (not res!122333)) b!146239))

(assert (= (and b!146239 (not res!122332)) b!146242))

(assert (= (and b!146239 res!122331) b!146238))

(assert (= (and b!146238 c!7918) b!146236))

(assert (= (and b!146238 (not c!7918)) b!146240))

(assert (= (and b!146240 res!122335) b!146237))

(assert (= (and b!146237 (not res!122334)) b!146241))

(assert (= (or b!146236 b!146241) bm!1894))

(declare-fun m!225373 () Bool)

(assert (=> bm!1894 m!225373))

(declare-fun m!225375 () Bool)

(assert (=> bm!1894 m!225375))

(declare-fun m!225377 () Bool)

(assert (=> bm!1894 m!225377))

(declare-fun m!225379 () Bool)

(assert (=> bm!1894 m!225379))

(declare-fun m!225381 () Bool)

(assert (=> bm!1894 m!225381))

(declare-fun m!225383 () Bool)

(assert (=> b!146239 m!225383))

(assert (=> b!146240 m!225381))

(assert (=> b!146240 m!225373))

(assert (=> b!146240 m!225381))

(assert (=> b!146240 m!225373))

(declare-fun m!225385 () Bool)

(assert (=> b!146240 m!225385))

(declare-fun m!225387 () Bool)

(assert (=> b!146242 m!225387))

(assert (=> b!146151 d!46899))

(declare-fun d!46901 () Bool)

(declare-fun lt!227043 () (_ BitVec 8))

(declare-fun lt!227045 () (_ BitVec 8))

(assert (=> d!46901 (= lt!227043 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 lt!226222)) (currentByte!6343 lt!226222))) ((_ sign_extend 24) lt!227045))))))

(assert (=> d!46901 (= lt!227045 ((_ extract 7 0) (currentBit!6338 lt!226222)))))

(declare-fun e!97482 () Bool)

(assert (=> d!46901 e!97482))

(declare-fun res!122341 () Bool)

(assert (=> d!46901 (=> (not res!122341) (not e!97482))))

(assert (=> d!46901 (= res!122341 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 lt!226222))) ((_ sign_extend 32) (currentByte!6343 lt!226222)) ((_ sign_extend 32) (currentBit!6338 lt!226222)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13086 0))(
  ( (tuple2!13087 (_1!6896 Unit!9086) (_2!6896 (_ BitVec 8))) )
))
(declare-fun Unit!9099 () Unit!9086)

(declare-fun Unit!9100 () Unit!9086)

(assert (=> d!46901 (= (readByte!0 lt!226222) (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227045) #b00000000000000000000000000000000) (tuple2!13087 Unit!9099 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227043) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 lt!226222)) (bvadd (currentByte!6343 lt!226222) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227045)))))))) (tuple2!13087 Unit!9100 lt!227043))) (BitStream!5263 (buf!3447 lt!226222) (bvadd (currentByte!6343 lt!226222) #b00000000000000000000000000000001) (currentBit!6338 lt!226222))))))

(declare-fun b!146247 () Bool)

(declare-fun e!97481 () Bool)

(assert (=> b!146247 (= e!97482 e!97481)))

(declare-fun res!122342 () Bool)

(assert (=> b!146247 (=> (not res!122342) (not e!97481))))

(declare-fun lt!227047 () tuple2!13084)

(assert (=> b!146247 (= res!122342 (= (buf!3447 (_2!6893 lt!227047)) (buf!3447 lt!226222)))))

(declare-fun lt!227046 () (_ BitVec 8))

(declare-fun lt!227044 () (_ BitVec 8))

(declare-fun Unit!9101 () Unit!9086)

(declare-fun Unit!9102 () Unit!9086)

(assert (=> b!146247 (= lt!227047 (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227044) #b00000000000000000000000000000000) (tuple2!13087 Unit!9101 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227046) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 lt!226222)) (bvadd (currentByte!6343 lt!226222) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227044)))))))) (tuple2!13087 Unit!9102 lt!227046))) (BitStream!5263 (buf!3447 lt!226222) (bvadd (currentByte!6343 lt!226222) #b00000000000000000000000000000001) (currentBit!6338 lt!226222))))))

(assert (=> b!146247 (= lt!227046 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 lt!226222)) (currentByte!6343 lt!226222))) ((_ sign_extend 24) lt!227044))))))

(assert (=> b!146247 (= lt!227044 ((_ extract 7 0) (currentBit!6338 lt!226222)))))

(declare-fun b!146248 () Bool)

(declare-fun lt!227048 () (_ BitVec 64))

(declare-fun lt!227049 () (_ BitVec 64))

(assert (=> b!146248 (= e!97481 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6893 lt!227047))) (currentByte!6343 (_2!6893 lt!227047)) (currentBit!6338 (_2!6893 lt!227047))) (bvadd lt!227049 lt!227048)))))

(assert (=> b!146248 (or (not (= (bvand lt!227049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227048 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227049 lt!227048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146248 (= lt!227048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146248 (= lt!227049 (bitIndex!0 (size!3002 (buf!3447 lt!226222)) (currentByte!6343 lt!226222) (currentBit!6338 lt!226222)))))

(assert (= (and d!46901 res!122341) b!146247))

(assert (= (and b!146247 res!122342) b!146248))

(declare-fun m!225389 () Bool)

(assert (=> d!46901 m!225389))

(declare-fun m!225391 () Bool)

(assert (=> d!46901 m!225391))

(declare-fun m!225393 () Bool)

(assert (=> d!46901 m!225393))

(assert (=> b!146247 m!225393))

(assert (=> b!146247 m!225389))

(declare-fun m!225395 () Bool)

(assert (=> b!146248 m!225395))

(declare-fun m!225397 () Bool)

(assert (=> b!146248 m!225397))

(assert (=> d!46875 d!46901))

(declare-fun d!46903 () Bool)

(declare-fun e!97485 () Bool)

(assert (=> d!46903 e!97485))

(declare-fun res!122345 () Bool)

(assert (=> d!46903 (=> (not res!122345) (not e!97485))))

(declare-fun lt!227054 () BitStream!5262)

(declare-fun lt!227055 () (_ BitVec 64))

(assert (=> d!46903 (= res!122345 (= (bvadd lt!227055 (bvsub lt!226918 lt!226927)) (bitIndex!0 (size!3002 (buf!3447 lt!227054)) (currentByte!6343 lt!227054) (currentBit!6338 lt!227054))))))

(assert (=> d!46903 (or (not (= (bvand lt!227055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226918 lt!226927) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227055 (bvsub lt!226918 lt!226927)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46903 (= lt!227055 (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226926))) (currentByte!6343 (_2!6883 lt!226926)) (currentBit!6338 (_2!6883 lt!226926))))))

(declare-fun moveBitIndex!0 (BitStream!5262 (_ BitVec 64)) tuple2!13064)

(assert (=> d!46903 (= lt!227054 (_2!6881 (moveBitIndex!0 (_2!6883 lt!226926) (bvsub lt!226918 lt!226927))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5262 (_ BitVec 64)) Bool)

(assert (=> d!46903 (moveBitIndexPrecond!0 (_2!6883 lt!226926) (bvsub lt!226918 lt!226927))))

(assert (=> d!46903 (= (withMovedBitIndex!0 (_2!6883 lt!226926) (bvsub lt!226918 lt!226927)) lt!227054)))

(declare-fun b!146251 () Bool)

(assert (=> b!146251 (= e!97485 (= (size!3002 (buf!3447 (_2!6883 lt!226926))) (size!3002 (buf!3447 lt!227054))))))

(assert (= (and d!46903 res!122345) b!146251))

(declare-fun m!225399 () Bool)

(assert (=> d!46903 m!225399))

(declare-fun m!225401 () Bool)

(assert (=> d!46903 m!225401))

(declare-fun m!225403 () Bool)

(assert (=> d!46903 m!225403))

(declare-fun m!225405 () Bool)

(assert (=> d!46903 m!225405))

(assert (=> b!146171 d!46903))

(assert (=> b!146171 d!46820))

(assert (=> b!146171 d!46822))

(declare-fun d!46905 () Bool)

(declare-fun res!122346 () Bool)

(declare-fun e!97487 () Bool)

(assert (=> d!46905 (=> (not res!122346) (not e!97487))))

(assert (=> d!46905 (= res!122346 (= (size!3002 (buf!3447 (_1!6883 lt!226869))) (size!3002 (buf!3447 thiss!1634))))))

(assert (=> d!46905 (= (isPrefixOf!0 (_1!6883 lt!226869) thiss!1634) e!97487)))

(declare-fun b!146252 () Bool)

(declare-fun res!122347 () Bool)

(assert (=> b!146252 (=> (not res!122347) (not e!97487))))

(assert (=> b!146252 (= res!122347 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226869))) (currentByte!6343 (_1!6883 lt!226869)) (currentBit!6338 (_1!6883 lt!226869))) (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(declare-fun b!146253 () Bool)

(declare-fun e!97486 () Bool)

(assert (=> b!146253 (= e!97487 e!97486)))

(declare-fun res!122348 () Bool)

(assert (=> b!146253 (=> res!122348 e!97486)))

(assert (=> b!146253 (= res!122348 (= (size!3002 (buf!3447 (_1!6883 lt!226869))) #b00000000000000000000000000000000))))

(declare-fun b!146254 () Bool)

(assert (=> b!146254 (= e!97486 (arrayBitRangesEq!0 (buf!3447 (_1!6883 lt!226869)) (buf!3447 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226869))) (currentByte!6343 (_1!6883 lt!226869)) (currentBit!6338 (_1!6883 lt!226869)))))))

(assert (= (and d!46905 res!122346) b!146252))

(assert (= (and b!146252 res!122347) b!146253))

(assert (= (and b!146253 (not res!122348)) b!146254))

(declare-fun m!225407 () Bool)

(assert (=> b!146252 m!225407))

(assert (=> b!146252 m!224669))

(assert (=> b!146254 m!225407))

(assert (=> b!146254 m!225407))

(declare-fun m!225409 () Bool)

(assert (=> b!146254 m!225409))

(assert (=> b!146149 d!46905))

(declare-fun d!46907 () Bool)

(assert (=> d!46907 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))))))))

(assert (=> d!46826 d!46907))

(declare-fun d!46909 () Bool)

(declare-fun e!97488 () Bool)

(assert (=> d!46909 e!97488))

(declare-fun res!122349 () Bool)

(assert (=> d!46909 (=> (not res!122349) (not e!97488))))

(declare-fun lt!227057 () (_ BitVec 64))

(declare-fun lt!227056 () BitStream!5262)

(assert (=> d!46909 (= res!122349 (= (bvadd lt!227057 (bvsub lt!226998 lt!227007)) (bitIndex!0 (size!3002 (buf!3447 lt!227056)) (currentByte!6343 lt!227056) (currentBit!6338 lt!227056))))))

(assert (=> d!46909 (or (not (= (bvand lt!227057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226998 lt!227007) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227057 (bvsub lt!226998 lt!227007)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46909 (= lt!227057 (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!227006))) (currentByte!6343 (_2!6883 lt!227006)) (currentBit!6338 (_2!6883 lt!227006))))))

(assert (=> d!46909 (= lt!227056 (_2!6881 (moveBitIndex!0 (_2!6883 lt!227006) (bvsub lt!226998 lt!227007))))))

(assert (=> d!46909 (moveBitIndexPrecond!0 (_2!6883 lt!227006) (bvsub lt!226998 lt!227007))))

(assert (=> d!46909 (= (withMovedBitIndex!0 (_2!6883 lt!227006) (bvsub lt!226998 lt!227007)) lt!227056)))

(declare-fun b!146255 () Bool)

(assert (=> b!146255 (= e!97488 (= (size!3002 (buf!3447 (_2!6883 lt!227006))) (size!3002 (buf!3447 lt!227056))))))

(assert (= (and d!46909 res!122349) b!146255))

(declare-fun m!225411 () Bool)

(assert (=> d!46909 m!225411))

(declare-fun m!225413 () Bool)

(assert (=> d!46909 m!225413))

(declare-fun m!225415 () Bool)

(assert (=> d!46909 m!225415))

(declare-fun m!225417 () Bool)

(assert (=> d!46909 m!225417))

(assert (=> b!146211 d!46909))

(assert (=> b!146211 d!46822))

(assert (=> b!146211 d!46824))

(declare-fun d!46911 () Bool)

(declare-fun lt!227058 () (_ BitVec 8))

(declare-fun lt!227060 () (_ BitVec 8))

(assert (=> d!46911 (= lt!227058 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226207))) (currentByte!6343 (_1!6883 lt!226207)))) ((_ sign_extend 24) lt!227060))))))

(assert (=> d!46911 (= lt!227060 ((_ extract 7 0) (currentBit!6338 (_1!6883 lt!226207))))))

(declare-fun e!97490 () Bool)

(assert (=> d!46911 e!97490))

(declare-fun res!122350 () Bool)

(assert (=> d!46911 (=> (not res!122350) (not e!97490))))

(assert (=> d!46911 (= res!122350 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6883 lt!226207)))) ((_ sign_extend 32) (currentByte!6343 (_1!6883 lt!226207))) ((_ sign_extend 32) (currentBit!6338 (_1!6883 lt!226207))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9103 () Unit!9086)

(declare-fun Unit!9104 () Unit!9086)

(assert (=> d!46911 (= (readByte!0 (_1!6883 lt!226207)) (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227060) #b00000000000000000000000000000000) (tuple2!13087 Unit!9103 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227058) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226207))) (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227060)))))))) (tuple2!13087 Unit!9104 lt!227058))) (BitStream!5263 (buf!3447 (_1!6883 lt!226207)) (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001) (currentBit!6338 (_1!6883 lt!226207)))))))

(declare-fun b!146256 () Bool)

(declare-fun e!97489 () Bool)

(assert (=> b!146256 (= e!97490 e!97489)))

(declare-fun res!122351 () Bool)

(assert (=> b!146256 (=> (not res!122351) (not e!97489))))

(declare-fun lt!227062 () tuple2!13084)

(assert (=> b!146256 (= res!122351 (= (buf!3447 (_2!6893 lt!227062)) (buf!3447 (_1!6883 lt!226207))))))

(declare-fun lt!227059 () (_ BitVec 8))

(declare-fun lt!227061 () (_ BitVec 8))

(declare-fun Unit!9105 () Unit!9086)

(declare-fun Unit!9106 () Unit!9086)

(assert (=> b!146256 (= lt!227062 (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227059) #b00000000000000000000000000000000) (tuple2!13087 Unit!9105 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227061) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226207))) (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227059)))))))) (tuple2!13087 Unit!9106 lt!227061))) (BitStream!5263 (buf!3447 (_1!6883 lt!226207)) (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001) (currentBit!6338 (_1!6883 lt!226207)))))))

(assert (=> b!146256 (= lt!227061 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226207))) (currentByte!6343 (_1!6883 lt!226207)))) ((_ sign_extend 24) lt!227059))))))

(assert (=> b!146256 (= lt!227059 ((_ extract 7 0) (currentBit!6338 (_1!6883 lt!226207))))))

(declare-fun b!146257 () Bool)

(declare-fun lt!227063 () (_ BitVec 64))

(declare-fun lt!227064 () (_ BitVec 64))

(assert (=> b!146257 (= e!97489 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6893 lt!227062))) (currentByte!6343 (_2!6893 lt!227062)) (currentBit!6338 (_2!6893 lt!227062))) (bvadd lt!227064 lt!227063)))))

(assert (=> b!146257 (or (not (= (bvand lt!227064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227063 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227064 lt!227063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146257 (= lt!227063 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146257 (= lt!227064 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226207))) (currentByte!6343 (_1!6883 lt!226207)) (currentBit!6338 (_1!6883 lt!226207))))))

(assert (= (and d!46911 res!122350) b!146256))

(assert (= (and b!146256 res!122351) b!146257))

(declare-fun m!225419 () Bool)

(assert (=> d!46911 m!225419))

(declare-fun m!225421 () Bool)

(assert (=> d!46911 m!225421))

(declare-fun m!225423 () Bool)

(assert (=> d!46911 m!225423))

(assert (=> b!146256 m!225423))

(assert (=> b!146256 m!225419))

(declare-fun m!225425 () Bool)

(assert (=> b!146257 m!225425))

(declare-fun m!225427 () Bool)

(assert (=> b!146257 m!225427))

(assert (=> d!46838 d!46911))

(declare-fun d!46913 () Bool)

(declare-fun res!122352 () Bool)

(declare-fun e!97492 () Bool)

(assert (=> d!46913 (=> (not res!122352) (not e!97492))))

(assert (=> d!46913 (= res!122352 (= (size!3002 (buf!3447 (_2!6883 lt!227006))) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (=> d!46913 (= (isPrefixOf!0 (_2!6883 lt!227006) (_2!6881 lt!226224)) e!97492)))

(declare-fun b!146258 () Bool)

(declare-fun res!122353 () Bool)

(assert (=> b!146258 (=> (not res!122353) (not e!97492))))

(assert (=> b!146258 (= res!122353 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!227006))) (currentByte!6343 (_2!6883 lt!227006)) (currentBit!6338 (_2!6883 lt!227006))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun b!146259 () Bool)

(declare-fun e!97491 () Bool)

(assert (=> b!146259 (= e!97492 e!97491)))

(declare-fun res!122354 () Bool)

(assert (=> b!146259 (=> res!122354 e!97491)))

(assert (=> b!146259 (= res!122354 (= (size!3002 (buf!3447 (_2!6883 lt!227006))) #b00000000000000000000000000000000))))

(declare-fun b!146260 () Bool)

(assert (=> b!146260 (= e!97491 (arrayBitRangesEq!0 (buf!3447 (_2!6883 lt!227006)) (buf!3447 (_2!6881 lt!226224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!227006))) (currentByte!6343 (_2!6883 lt!227006)) (currentBit!6338 (_2!6883 lt!227006)))))))

(assert (= (and d!46913 res!122352) b!146258))

(assert (= (and b!146258 res!122353) b!146259))

(assert (= (and b!146259 (not res!122354)) b!146260))

(assert (=> b!146258 m!225413))

(assert (=> b!146258 m!224667))

(assert (=> b!146260 m!225413))

(assert (=> b!146260 m!225413))

(declare-fun m!225429 () Bool)

(assert (=> b!146260 m!225429))

(assert (=> b!146209 d!46913))

(declare-fun d!46915 () Bool)

(declare-fun res!122355 () Bool)

(declare-fun e!97493 () Bool)

(assert (=> d!46915 (=> res!122355 e!97493)))

(assert (=> d!46915 (= res!122355 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!46915 (= (arrayRangesEq!318 arr!237 (_2!6882 lt!226220) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!97493)))

(declare-fun b!146261 () Bool)

(declare-fun e!97494 () Bool)

(assert (=> b!146261 (= e!97493 e!97494)))

(declare-fun res!122356 () Bool)

(assert (=> b!146261 (=> (not res!122356) (not e!97494))))

(assert (=> b!146261 (= res!122356 (= (select (arr!3741 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3741 (_2!6882 lt!226220)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!146262 () Bool)

(assert (=> b!146262 (= e!97494 (arrayRangesEq!318 arr!237 (_2!6882 lt!226220) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46915 (not res!122355)) b!146261))

(assert (= (and b!146261 res!122356) b!146262))

(declare-fun m!225431 () Bool)

(assert (=> b!146261 m!225431))

(declare-fun m!225433 () Bool)

(assert (=> b!146261 m!225433))

(declare-fun m!225435 () Bool)

(assert (=> b!146262 m!225435))

(assert (=> b!146221 d!46915))

(declare-fun lt!227145 () tuple2!13084)

(declare-fun bm!1901 () Bool)

(declare-fun call!1905 () Bool)

(declare-fun c!7921 () Bool)

(assert (=> bm!1901 (= call!1905 (arrayRangesEq!318 arr!237 (ite c!7921 (array!6632 (store (arr!3741 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227145)) (size!3002 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7921 (bvadd #b00000000000000000000000000000001 from!447) (size!3002 arr!237))))))

(declare-fun b!146273 () Bool)

(declare-fun res!122365 () Bool)

(declare-fun e!97503 () Bool)

(assert (=> b!146273 (=> (not res!122365) (not e!97503))))

(declare-fun lt!227151 () tuple3!568)

(assert (=> b!146273 (= res!122365 (and (= (buf!3447 (_1!6883 lt!226219)) (buf!3447 (_2!6894 lt!227151))) (= (size!3002 arr!237) (size!3002 (_3!351 lt!227151)))))))

(declare-fun b!146274 () Bool)

(assert (=> b!146274 (= e!97503 (arrayRangesEq!318 arr!237 (_3!351 lt!227151) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!46917 () Bool)

(declare-fun e!97501 () Bool)

(assert (=> d!46917 e!97501))

(declare-fun res!122364 () Bool)

(assert (=> d!46917 (=> res!122364 e!97501)))

(assert (=> d!46917 (= res!122364 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227158 () Bool)

(assert (=> d!46917 (= lt!227158 e!97503)))

(declare-fun res!122363 () Bool)

(assert (=> d!46917 (=> (not res!122363) (not e!97503))))

(declare-fun lt!227159 () (_ BitVec 64))

(declare-fun lt!227137 () (_ BitVec 64))

(assert (=> d!46917 (= res!122363 (= (bvadd lt!227159 lt!227137) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227151))) (currentByte!6343 (_2!6894 lt!227151)) (currentBit!6338 (_2!6894 lt!227151)))))))

(assert (=> d!46917 (or (not (= (bvand lt!227159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227137 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227159 lt!227137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227164 () (_ BitVec 64))

(assert (=> d!46917 (= lt!227137 (bvmul lt!227164 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!46917 (or (= lt!227164 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227164 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227164)))))

(assert (=> d!46917 (= lt!227164 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!46917 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!46917 (= lt!227159 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226219))) (currentByte!6343 (_1!6883 lt!226219)) (currentBit!6338 (_1!6883 lt!226219))))))

(declare-fun e!97502 () tuple3!568)

(assert (=> d!46917 (= lt!227151 e!97502)))

(assert (=> d!46917 (= c!7921 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46917 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3002 arr!237)))))

(assert (=> d!46917 (= (readByteArrayLoop!0 (_1!6883 lt!226219) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!227151)))

(declare-fun lt!227140 () array!6631)

(declare-fun lt!227165 () tuple3!568)

(declare-fun call!1904 () Bool)

(declare-fun bm!1902 () Bool)

(declare-fun lt!227148 () array!6631)

(declare-fun lt!227169 () (_ BitVec 32))

(declare-fun lt!227172 () (_ BitVec 32))

(declare-fun lt!227157 () (_ BitVec 32))

(assert (=> bm!1902 (= call!1904 (arrayRangesEq!318 (ite c!7921 arr!237 lt!227140) (ite c!7921 (_3!351 lt!227165) lt!227148) (ite c!7921 lt!227169 lt!227172) (ite c!7921 (bvadd #b00000000000000000000000000000001 from!447) lt!227157)))))

(declare-fun b!146275 () Bool)

(declare-fun lt!227154 () Unit!9086)

(assert (=> b!146275 (= e!97502 (tuple3!569 lt!227154 (_2!6894 lt!227165) (_3!351 lt!227165)))))

(assert (=> b!146275 (= lt!227145 (readByte!0 (_1!6883 lt!226219)))))

(declare-fun lt!227150 () array!6631)

(assert (=> b!146275 (= lt!227150 (array!6632 (store (arr!3741 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227145)) (size!3002 arr!237)))))

(declare-fun lt!227139 () (_ BitVec 64))

(assert (=> b!146275 (= lt!227139 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227149 () (_ BitVec 32))

(assert (=> b!146275 (= lt!227149 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227168 () Unit!9086)

(assert (=> b!146275 (= lt!227168 (validateOffsetBytesFromBitIndexLemma!0 (_1!6883 lt!226219) (_2!6893 lt!227145) lt!227139 lt!227149))))

(assert (=> b!146275 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6893 lt!227145)))) ((_ sign_extend 32) (currentByte!6343 (_2!6893 lt!227145))) ((_ sign_extend 32) (currentBit!6338 (_2!6893 lt!227145))) (bvsub lt!227149 ((_ extract 31 0) (bvsdiv (bvadd lt!227139 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227144 () Unit!9086)

(assert (=> b!146275 (= lt!227144 lt!227168)))

(assert (=> b!146275 (= lt!227165 (readByteArrayLoop!0 (_2!6893 lt!227145) lt!227150 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1906 () (_ BitVec 64))

(assert (=> b!146275 (= call!1906 (bvadd (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226219))) (currentByte!6343 (_1!6883 lt!226219)) (currentBit!6338 (_1!6883 lt!226219))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227141 () Unit!9086)

(declare-fun Unit!9107 () Unit!9086)

(assert (=> b!146275 (= lt!227141 Unit!9107)))

(assert (=> b!146275 (= (bvadd call!1906 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227165))) (currentByte!6343 (_2!6894 lt!227165)) (currentBit!6338 (_2!6894 lt!227165))))))

(declare-fun lt!227138 () Unit!9086)

(declare-fun Unit!9108 () Unit!9086)

(assert (=> b!146275 (= lt!227138 Unit!9108)))

(assert (=> b!146275 (= (bvadd (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226219))) (currentByte!6343 (_1!6883 lt!226219)) (currentBit!6338 (_1!6883 lt!226219))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227165))) (currentByte!6343 (_2!6894 lt!227165)) (currentBit!6338 (_2!6894 lt!227165))))))

(declare-fun lt!227167 () Unit!9086)

(declare-fun Unit!9109 () Unit!9086)

(assert (=> b!146275 (= lt!227167 Unit!9109)))

(assert (=> b!146275 (and (= (buf!3447 (_1!6883 lt!226219)) (buf!3447 (_2!6894 lt!227165))) (= (size!3002 arr!237) (size!3002 (_3!351 lt!227165))))))

(declare-fun lt!227163 () Unit!9086)

(declare-fun Unit!9110 () Unit!9086)

(assert (=> b!146275 (= lt!227163 Unit!9110)))

(declare-fun lt!227160 () Unit!9086)

(declare-fun arrayUpdatedAtPrefixLemma!10 (array!6631 (_ BitVec 32) (_ BitVec 8)) Unit!9086)

(assert (=> b!146275 (= lt!227160 (arrayUpdatedAtPrefixLemma!10 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227145)))))

(assert (=> b!146275 call!1905))

(declare-fun lt!227152 () Unit!9086)

(assert (=> b!146275 (= lt!227152 lt!227160)))

(assert (=> b!146275 (= lt!227169 #b00000000000000000000000000000000)))

(declare-fun lt!227143 () Unit!9086)

(declare-fun arrayRangesEqTransitive!50 (array!6631 array!6631 array!6631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9086)

(assert (=> b!146275 (= lt!227143 (arrayRangesEqTransitive!50 arr!237 lt!227150 (_3!351 lt!227165) lt!227169 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146275 call!1904))

(declare-fun lt!227153 () Unit!9086)

(assert (=> b!146275 (= lt!227153 lt!227143)))

(assert (=> b!146275 (arrayRangesEq!318 arr!237 (_3!351 lt!227165) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!227166 () Unit!9086)

(declare-fun Unit!9111 () Unit!9086)

(assert (=> b!146275 (= lt!227166 Unit!9111)))

(declare-fun lt!227155 () Unit!9086)

(declare-fun arrayRangesEqImpliesEq!10 (array!6631 array!6631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9086)

(assert (=> b!146275 (= lt!227155 (arrayRangesEqImpliesEq!10 lt!227150 (_3!351 lt!227165) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146275 (= (select (store (arr!3741 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227145)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3741 (_3!351 lt!227165)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227170 () Unit!9086)

(assert (=> b!146275 (= lt!227170 lt!227155)))

(declare-fun lt!227156 () Bool)

(assert (=> b!146275 (= lt!227156 (= (select (arr!3741 (_3!351 lt!227165)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6893 lt!227145)))))

(declare-fun Unit!9112 () Unit!9086)

(assert (=> b!146275 (= lt!227154 Unit!9112)))

(assert (=> b!146275 lt!227156))

(declare-fun lt!227171 () Unit!9086)

(declare-fun b!146276 () Bool)

(assert (=> b!146276 (= e!97502 (tuple3!569 lt!227171 (_1!6883 lt!226219) arr!237))))

(assert (=> b!146276 (= call!1906 call!1906)))

(declare-fun lt!227142 () Unit!9086)

(declare-fun Unit!9113 () Unit!9086)

(assert (=> b!146276 (= lt!227142 Unit!9113)))

(declare-fun lt!227146 () Unit!9086)

(declare-fun arrayRangesEqReflexiveLemma!10 (array!6631) Unit!9086)

(assert (=> b!146276 (= lt!227146 (arrayRangesEqReflexiveLemma!10 arr!237))))

(assert (=> b!146276 call!1905))

(declare-fun lt!227162 () Unit!9086)

(assert (=> b!146276 (= lt!227162 lt!227146)))

(assert (=> b!146276 (= lt!227140 arr!237)))

(assert (=> b!146276 (= lt!227148 arr!237)))

(declare-fun lt!227147 () (_ BitVec 32))

(assert (=> b!146276 (= lt!227147 #b00000000000000000000000000000000)))

(declare-fun lt!227161 () (_ BitVec 32))

(assert (=> b!146276 (= lt!227161 (size!3002 arr!237))))

(assert (=> b!146276 (= lt!227172 #b00000000000000000000000000000000)))

(assert (=> b!146276 (= lt!227157 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!10 (array!6631 array!6631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9086)

(assert (=> b!146276 (= lt!227171 (arrayRangesEqSlicedLemma!10 lt!227140 lt!227148 lt!227147 lt!227161 lt!227172 lt!227157))))

(assert (=> b!146276 call!1904))

(declare-fun bm!1903 () Bool)

(assert (=> bm!1903 (= call!1906 (bitIndex!0 (ite c!7921 (size!3002 (buf!3447 (_2!6893 lt!227145))) (size!3002 (buf!3447 (_1!6883 lt!226219)))) (ite c!7921 (currentByte!6343 (_2!6893 lt!227145)) (currentByte!6343 (_1!6883 lt!226219))) (ite c!7921 (currentBit!6338 (_2!6893 lt!227145)) (currentBit!6338 (_1!6883 lt!226219)))))))

(declare-fun b!146277 () Bool)

(assert (=> b!146277 (= e!97501 (= (select (arr!3741 (_3!351 lt!227151)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6884 (readBytePure!0 (_1!6883 lt!226219)))))))

(assert (=> b!146277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3002 (_3!351 lt!227151))))))

(assert (= (and d!46917 c!7921) b!146275))

(assert (= (and d!46917 (not c!7921)) b!146276))

(assert (= (or b!146275 b!146276) bm!1902))

(assert (= (or b!146275 b!146276) bm!1901))

(assert (= (or b!146275 b!146276) bm!1903))

(assert (= (and d!46917 res!122363) b!146273))

(assert (= (and b!146273 res!122365) b!146274))

(assert (= (and d!46917 (not res!122364)) b!146277))

(declare-fun m!225437 () Bool)

(assert (=> bm!1902 m!225437))

(declare-fun m!225439 () Bool)

(assert (=> b!146274 m!225439))

(declare-fun m!225441 () Bool)

(assert (=> b!146275 m!225441))

(declare-fun m!225443 () Bool)

(assert (=> b!146275 m!225443))

(declare-fun m!225445 () Bool)

(assert (=> b!146275 m!225445))

(declare-fun m!225447 () Bool)

(assert (=> b!146275 m!225447))

(declare-fun m!225449 () Bool)

(assert (=> b!146275 m!225449))

(declare-fun m!225451 () Bool)

(assert (=> b!146275 m!225451))

(declare-fun m!225453 () Bool)

(assert (=> b!146275 m!225453))

(declare-fun m!225455 () Bool)

(assert (=> b!146275 m!225455))

(declare-fun m!225457 () Bool)

(assert (=> b!146275 m!225457))

(declare-fun m!225459 () Bool)

(assert (=> b!146275 m!225459))

(declare-fun m!225461 () Bool)

(assert (=> b!146275 m!225461))

(declare-fun m!225463 () Bool)

(assert (=> b!146275 m!225463))

(declare-fun m!225465 () Bool)

(assert (=> b!146275 m!225465))

(declare-fun m!225467 () Bool)

(assert (=> b!146277 m!225467))

(declare-fun m!225469 () Bool)

(assert (=> b!146277 m!225469))

(declare-fun m!225471 () Bool)

(assert (=> bm!1903 m!225471))

(declare-fun m!225473 () Bool)

(assert (=> d!46917 m!225473))

(assert (=> d!46917 m!225443))

(assert (=> bm!1901 m!225453))

(declare-fun m!225475 () Bool)

(assert (=> bm!1901 m!225475))

(declare-fun m!225477 () Bool)

(assert (=> b!146276 m!225477))

(declare-fun m!225479 () Bool)

(assert (=> b!146276 m!225479))

(assert (=> d!46877 d!46917))

(declare-fun d!46919 () Bool)

(declare-fun res!122366 () Bool)

(declare-fun e!97505 () Bool)

(assert (=> d!46919 (=> (not res!122366) (not e!97505))))

(assert (=> d!46919 (= res!122366 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 (_2!6881 lt!226986)))))))

(assert (=> d!46919 (= (isPrefixOf!0 thiss!1634 (_2!6881 lt!226986)) e!97505)))

(declare-fun b!146278 () Bool)

(declare-fun res!122367 () Bool)

(assert (=> b!146278 (=> (not res!122367) (not e!97505))))

(assert (=> b!146278 (= res!122367 (bvsle (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226986))) (currentByte!6343 (_2!6881 lt!226986)) (currentBit!6338 (_2!6881 lt!226986)))))))

(declare-fun b!146279 () Bool)

(declare-fun e!97504 () Bool)

(assert (=> b!146279 (= e!97505 e!97504)))

(declare-fun res!122368 () Bool)

(assert (=> b!146279 (=> res!122368 e!97504)))

(assert (=> b!146279 (= res!122368 (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146280 () Bool)

(assert (=> b!146280 (= e!97504 (arrayBitRangesEq!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226986)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (= (and d!46919 res!122366) b!146278))

(assert (= (and b!146278 res!122367) b!146279))

(assert (= (and b!146279 (not res!122368)) b!146280))

(assert (=> b!146278 m!224669))

(assert (=> b!146278 m!225323))

(assert (=> b!146280 m!224669))

(assert (=> b!146280 m!224669))

(declare-fun m!225481 () Bool)

(assert (=> b!146280 m!225481))

(assert (=> b!146207 d!46919))

(declare-fun d!46921 () Bool)

(assert (=> d!46921 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 thiss!1634)))))))

(assert (=> d!46824 d!46921))

(assert (=> d!46824 d!46891))

(declare-fun d!46923 () Bool)

(declare-fun lt!227173 () (_ BitVec 8))

(declare-fun lt!227175 () (_ BitVec 8))

(assert (=> d!46923 (= lt!227173 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226203))) (currentByte!6343 (_1!6883 lt!226203)))) ((_ sign_extend 24) lt!227175))))))

(assert (=> d!46923 (= lt!227175 ((_ extract 7 0) (currentBit!6338 (_1!6883 lt!226203))))))

(declare-fun e!97507 () Bool)

(assert (=> d!46923 e!97507))

(declare-fun res!122369 () Bool)

(assert (=> d!46923 (=> (not res!122369) (not e!97507))))

(assert (=> d!46923 (= res!122369 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6883 lt!226203)))) ((_ sign_extend 32) (currentByte!6343 (_1!6883 lt!226203))) ((_ sign_extend 32) (currentBit!6338 (_1!6883 lt!226203))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9114 () Unit!9086)

(declare-fun Unit!9115 () Unit!9086)

(assert (=> d!46923 (= (readByte!0 (_1!6883 lt!226203)) (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227175) #b00000000000000000000000000000000) (tuple2!13087 Unit!9114 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227173) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226203))) (bvadd (currentByte!6343 (_1!6883 lt!226203)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227175)))))))) (tuple2!13087 Unit!9115 lt!227173))) (BitStream!5263 (buf!3447 (_1!6883 lt!226203)) (bvadd (currentByte!6343 (_1!6883 lt!226203)) #b00000000000000000000000000000001) (currentBit!6338 (_1!6883 lt!226203)))))))

(declare-fun b!146281 () Bool)

(declare-fun e!97506 () Bool)

(assert (=> b!146281 (= e!97507 e!97506)))

(declare-fun res!122370 () Bool)

(assert (=> b!146281 (=> (not res!122370) (not e!97506))))

(declare-fun lt!227177 () tuple2!13084)

(assert (=> b!146281 (= res!122370 (= (buf!3447 (_2!6893 lt!227177)) (buf!3447 (_1!6883 lt!226203))))))

(declare-fun lt!227174 () (_ BitVec 8))

(declare-fun lt!227176 () (_ BitVec 8))

(declare-fun Unit!9116 () Unit!9086)

(declare-fun Unit!9117 () Unit!9086)

(assert (=> b!146281 (= lt!227177 (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227174) #b00000000000000000000000000000000) (tuple2!13087 Unit!9116 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227176) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226203))) (bvadd (currentByte!6343 (_1!6883 lt!226203)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227174)))))))) (tuple2!13087 Unit!9117 lt!227176))) (BitStream!5263 (buf!3447 (_1!6883 lt!226203)) (bvadd (currentByte!6343 (_1!6883 lt!226203)) #b00000000000000000000000000000001) (currentBit!6338 (_1!6883 lt!226203)))))))

(assert (=> b!146281 (= lt!227176 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 (_1!6883 lt!226203))) (currentByte!6343 (_1!6883 lt!226203)))) ((_ sign_extend 24) lt!227174))))))

(assert (=> b!146281 (= lt!227174 ((_ extract 7 0) (currentBit!6338 (_1!6883 lt!226203))))))

(declare-fun lt!227179 () (_ BitVec 64))

(declare-fun b!146282 () Bool)

(declare-fun lt!227178 () (_ BitVec 64))

(assert (=> b!146282 (= e!97506 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6893 lt!227177))) (currentByte!6343 (_2!6893 lt!227177)) (currentBit!6338 (_2!6893 lt!227177))) (bvadd lt!227179 lt!227178)))))

(assert (=> b!146282 (or (not (= (bvand lt!227179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227178 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227179 lt!227178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146282 (= lt!227178 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146282 (= lt!227179 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226203))) (currentByte!6343 (_1!6883 lt!226203)) (currentBit!6338 (_1!6883 lt!226203))))))

(assert (= (and d!46923 res!122369) b!146281))

(assert (= (and b!146281 res!122370) b!146282))

(declare-fun m!225483 () Bool)

(assert (=> d!46923 m!225483))

(declare-fun m!225485 () Bool)

(assert (=> d!46923 m!225485))

(declare-fun m!225487 () Bool)

(assert (=> d!46923 m!225487))

(assert (=> b!146281 m!225487))

(assert (=> b!146281 m!225483))

(declare-fun m!225489 () Bool)

(assert (=> b!146282 m!225489))

(declare-fun m!225491 () Bool)

(assert (=> b!146282 m!225491))

(assert (=> d!46883 d!46923))

(declare-fun d!46925 () Bool)

(declare-fun e!97510 () Bool)

(assert (=> d!46925 e!97510))

(declare-fun res!122373 () Bool)

(assert (=> d!46925 (=> (not res!122373) (not e!97510))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5262 (_ BitVec 32)) Bool)

(assert (=> d!46925 (= res!122373 (moveByteIndexPrecond!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))))

(declare-fun Unit!9118 () Unit!9086)

(assert (=> d!46925 (= (moveByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) (tuple2!13065 Unit!9118 (BitStream!5263 (buf!3447 (_1!6883 lt!226207)) (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001) (currentBit!6338 (_1!6883 lt!226207)))))))

(declare-fun b!146285 () Bool)

(assert (=> b!146285 (= e!97510 (and (or (not (= (bvand (currentByte!6343 (_1!6883 lt!226207)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6343 (_1!6883 lt!226207)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001) (bvadd (currentByte!6343 (_1!6883 lt!226207)) #b00000000000000000000000000000001))))))

(assert (= (and d!46925 res!122373) b!146285))

(declare-fun m!225493 () Bool)

(assert (=> d!46925 m!225493))

(assert (=> d!46846 d!46925))

(declare-fun d!46927 () Bool)

(assert (=> d!46927 (isPrefixOf!0 (_2!6881 lt!226210) (_2!6881 lt!226210))))

(declare-fun lt!227182 () Unit!9086)

(declare-fun choose!11 (BitStream!5262) Unit!9086)

(assert (=> d!46927 (= lt!227182 (choose!11 (_2!6881 lt!226210)))))

(assert (=> d!46927 (= (lemmaIsPrefixRefl!0 (_2!6881 lt!226210)) lt!227182)))

(declare-fun bs!11506 () Bool)

(assert (= bs!11506 d!46927))

(assert (=> bs!11506 m!225193))

(declare-fun m!225495 () Bool)

(assert (=> bs!11506 m!225495))

(assert (=> d!46830 d!46927))

(declare-fun d!46929 () Bool)

(declare-fun res!122374 () Bool)

(declare-fun e!97512 () Bool)

(assert (=> d!46929 (=> (not res!122374) (not e!97512))))

(assert (=> d!46929 (= res!122374 (= (size!3002 (buf!3447 (_1!6883 lt!226869))) (size!3002 (buf!3447 (_2!6883 lt!226869)))))))

(assert (=> d!46929 (= (isPrefixOf!0 (_1!6883 lt!226869) (_2!6883 lt!226869)) e!97512)))

(declare-fun b!146286 () Bool)

(declare-fun res!122375 () Bool)

(assert (=> b!146286 (=> (not res!122375) (not e!97512))))

(assert (=> b!146286 (= res!122375 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226869))) (currentByte!6343 (_1!6883 lt!226869)) (currentBit!6338 (_1!6883 lt!226869))) (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226869))) (currentByte!6343 (_2!6883 lt!226869)) (currentBit!6338 (_2!6883 lt!226869)))))))

(declare-fun b!146287 () Bool)

(declare-fun e!97511 () Bool)

(assert (=> b!146287 (= e!97512 e!97511)))

(declare-fun res!122376 () Bool)

(assert (=> b!146287 (=> res!122376 e!97511)))

(assert (=> b!146287 (= res!122376 (= (size!3002 (buf!3447 (_1!6883 lt!226869))) #b00000000000000000000000000000000))))

(declare-fun b!146288 () Bool)

(assert (=> b!146288 (= e!97511 (arrayBitRangesEq!0 (buf!3447 (_1!6883 lt!226869)) (buf!3447 (_2!6883 lt!226869)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226869))) (currentByte!6343 (_1!6883 lt!226869)) (currentBit!6338 (_1!6883 lt!226869)))))))

(assert (= (and d!46929 res!122374) b!146286))

(assert (= (and b!146286 res!122375) b!146287))

(assert (= (and b!146287 (not res!122376)) b!146288))

(assert (=> b!146286 m!225407))

(declare-fun m!225497 () Bool)

(assert (=> b!146286 m!225497))

(assert (=> b!146288 m!225407))

(assert (=> b!146288 m!225407))

(declare-fun m!225499 () Bool)

(assert (=> b!146288 m!225499))

(assert (=> d!46830 d!46929))

(declare-fun d!46931 () Bool)

(assert (=> d!46931 (isPrefixOf!0 lt!226867 (_2!6881 lt!226210))))

(declare-fun lt!227183 () Unit!9086)

(assert (=> d!46931 (= lt!227183 (choose!30 lt!226867 thiss!1634 (_2!6881 lt!226210)))))

(assert (=> d!46931 (isPrefixOf!0 lt!226867 thiss!1634)))

(assert (=> d!46931 (= (lemmaIsPrefixTransitive!0 lt!226867 thiss!1634 (_2!6881 lt!226210)) lt!227183)))

(declare-fun bs!11507 () Bool)

(assert (= bs!11507 d!46931))

(assert (=> bs!11507 m!225205))

(declare-fun m!225501 () Bool)

(assert (=> bs!11507 m!225501))

(declare-fun m!225503 () Bool)

(assert (=> bs!11507 m!225503))

(assert (=> d!46830 d!46931))

(declare-fun d!46933 () Bool)

(assert (=> d!46933 (isPrefixOf!0 lt!226867 lt!226867)))

(declare-fun lt!227184 () Unit!9086)

(assert (=> d!46933 (= lt!227184 (choose!11 lt!226867))))

(assert (=> d!46933 (= (lemmaIsPrefixRefl!0 lt!226867) lt!227184)))

(declare-fun bs!11508 () Bool)

(assert (= bs!11508 d!46933))

(assert (=> bs!11508 m!225201))

(declare-fun m!225505 () Bool)

(assert (=> bs!11508 m!225505))

(assert (=> d!46830 d!46933))

(declare-fun d!46935 () Bool)

(declare-fun res!122377 () Bool)

(declare-fun e!97514 () Bool)

(assert (=> d!46935 (=> (not res!122377) (not e!97514))))

(assert (=> d!46935 (= res!122377 (= (size!3002 (buf!3447 lt!226867)) (size!3002 (buf!3447 lt!226867))))))

(assert (=> d!46935 (= (isPrefixOf!0 lt!226867 lt!226867) e!97514)))

(declare-fun b!146289 () Bool)

(declare-fun res!122378 () Bool)

(assert (=> b!146289 (=> (not res!122378) (not e!97514))))

(assert (=> b!146289 (= res!122378 (bvsle (bitIndex!0 (size!3002 (buf!3447 lt!226867)) (currentByte!6343 lt!226867) (currentBit!6338 lt!226867)) (bitIndex!0 (size!3002 (buf!3447 lt!226867)) (currentByte!6343 lt!226867) (currentBit!6338 lt!226867))))))

(declare-fun b!146290 () Bool)

(declare-fun e!97513 () Bool)

(assert (=> b!146290 (= e!97514 e!97513)))

(declare-fun res!122379 () Bool)

(assert (=> b!146290 (=> res!122379 e!97513)))

(assert (=> b!146290 (= res!122379 (= (size!3002 (buf!3447 lt!226867)) #b00000000000000000000000000000000))))

(declare-fun b!146291 () Bool)

(assert (=> b!146291 (= e!97513 (arrayBitRangesEq!0 (buf!3447 lt!226867) (buf!3447 lt!226867) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 lt!226867)) (currentByte!6343 lt!226867) (currentBit!6338 lt!226867))))))

(assert (= (and d!46935 res!122377) b!146289))

(assert (= (and b!146289 res!122378) b!146290))

(assert (= (and b!146290 (not res!122379)) b!146291))

(declare-fun m!225507 () Bool)

(assert (=> b!146289 m!225507))

(assert (=> b!146289 m!225507))

(assert (=> b!146291 m!225507))

(assert (=> b!146291 m!225507))

(declare-fun m!225509 () Bool)

(assert (=> b!146291 m!225509))

(assert (=> d!46830 d!46935))

(declare-fun d!46937 () Bool)

(declare-fun res!122380 () Bool)

(declare-fun e!97516 () Bool)

(assert (=> d!46937 (=> (not res!122380) (not e!97516))))

(assert (=> d!46937 (= res!122380 (= (size!3002 (buf!3447 lt!226867)) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46937 (= (isPrefixOf!0 lt!226867 (_2!6881 lt!226210)) e!97516)))

(declare-fun b!146292 () Bool)

(declare-fun res!122381 () Bool)

(assert (=> b!146292 (=> (not res!122381) (not e!97516))))

(assert (=> b!146292 (= res!122381 (bvsle (bitIndex!0 (size!3002 (buf!3447 lt!226867)) (currentByte!6343 lt!226867) (currentBit!6338 lt!226867)) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146293 () Bool)

(declare-fun e!97515 () Bool)

(assert (=> b!146293 (= e!97516 e!97515)))

(declare-fun res!122382 () Bool)

(assert (=> b!146293 (=> res!122382 e!97515)))

(assert (=> b!146293 (= res!122382 (= (size!3002 (buf!3447 lt!226867)) #b00000000000000000000000000000000))))

(declare-fun b!146294 () Bool)

(assert (=> b!146294 (= e!97515 (arrayBitRangesEq!0 (buf!3447 lt!226867) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 lt!226867)) (currentByte!6343 lt!226867) (currentBit!6338 lt!226867))))))

(assert (= (and d!46937 res!122380) b!146292))

(assert (= (and b!146292 res!122381) b!146293))

(assert (= (and b!146293 (not res!122382)) b!146294))

(assert (=> b!146292 m!225507))

(assert (=> b!146292 m!224683))

(assert (=> b!146294 m!225507))

(assert (=> b!146294 m!225507))

(declare-fun m!225511 () Bool)

(assert (=> b!146294 m!225511))

(assert (=> d!46830 d!46937))

(declare-fun d!46939 () Bool)

(assert (=> d!46939 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!227185 () Unit!9086)

(assert (=> d!46939 (= lt!227185 (choose!11 thiss!1634))))

(assert (=> d!46939 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!227185)))

(declare-fun bs!11509 () Bool)

(assert (= bs!11509 d!46939))

(assert (=> bs!11509 m!225195))

(declare-fun m!225513 () Bool)

(assert (=> bs!11509 m!225513))

(assert (=> d!46830 d!46939))

(declare-fun d!46941 () Bool)

(declare-fun res!122383 () Bool)

(declare-fun e!97518 () Bool)

(assert (=> d!46941 (=> (not res!122383) (not e!97518))))

(assert (=> d!46941 (= res!122383 (= (size!3002 (buf!3447 (_2!6881 lt!226210))) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46941 (= (isPrefixOf!0 (_2!6881 lt!226210) (_2!6881 lt!226210)) e!97518)))

(declare-fun b!146295 () Bool)

(declare-fun res!122384 () Bool)

(assert (=> b!146295 (=> (not res!122384) (not e!97518))))

(assert (=> b!146295 (= res!122384 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146296 () Bool)

(declare-fun e!97517 () Bool)

(assert (=> b!146296 (= e!97518 e!97517)))

(declare-fun res!122385 () Bool)

(assert (=> b!146296 (=> res!122385 e!97517)))

(assert (=> b!146296 (= res!122385 (= (size!3002 (buf!3447 (_2!6881 lt!226210))) #b00000000000000000000000000000000))))

(declare-fun b!146297 () Bool)

(assert (=> b!146297 (= e!97517 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(assert (= (and d!46941 res!122383) b!146295))

(assert (= (and b!146295 res!122384) b!146296))

(assert (= (and b!146296 (not res!122385)) b!146297))

(assert (=> b!146295 m!224683))

(assert (=> b!146295 m!224683))

(assert (=> b!146297 m!224683))

(assert (=> b!146297 m!224683))

(declare-fun m!225515 () Bool)

(assert (=> b!146297 m!225515))

(assert (=> d!46830 d!46941))

(declare-fun d!46943 () Bool)

(declare-fun res!122386 () Bool)

(declare-fun e!97520 () Bool)

(assert (=> d!46943 (=> (not res!122386) (not e!97520))))

(assert (=> d!46943 (= res!122386 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 thiss!1634))))))

(assert (=> d!46943 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!97520)))

(declare-fun b!146298 () Bool)

(declare-fun res!122387 () Bool)

(assert (=> b!146298 (=> (not res!122387) (not e!97520))))

(assert (=> b!146298 (= res!122387 (bvsle (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(declare-fun b!146299 () Bool)

(declare-fun e!97519 () Bool)

(assert (=> b!146299 (= e!97520 e!97519)))

(declare-fun res!122388 () Bool)

(assert (=> b!146299 (=> res!122388 e!97519)))

(assert (=> b!146299 (= res!122388 (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146300 () Bool)

(assert (=> b!146300 (= e!97519 (arrayBitRangesEq!0 (buf!3447 thiss!1634) (buf!3447 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (= (and d!46943 res!122386) b!146298))

(assert (= (and b!146298 res!122387) b!146299))

(assert (= (and b!146299 (not res!122388)) b!146300))

(assert (=> b!146298 m!224669))

(assert (=> b!146298 m!224669))

(assert (=> b!146300 m!224669))

(assert (=> b!146300 m!224669))

(declare-fun m!225517 () Bool)

(assert (=> b!146300 m!225517))

(assert (=> d!46830 d!46943))

(assert (=> d!46830 d!46871))

(declare-fun d!46945 () Bool)

(assert (=> d!46945 (isPrefixOf!0 lt!226867 (_2!6881 lt!226210))))

(declare-fun lt!227186 () Unit!9086)

(assert (=> d!46945 (= lt!227186 (choose!30 lt!226867 (_2!6881 lt!226210) (_2!6881 lt!226210)))))

(assert (=> d!46945 (isPrefixOf!0 lt!226867 (_2!6881 lt!226210))))

(assert (=> d!46945 (= (lemmaIsPrefixTransitive!0 lt!226867 (_2!6881 lt!226210) (_2!6881 lt!226210)) lt!227186)))

(declare-fun bs!11510 () Bool)

(assert (= bs!11510 d!46945))

(assert (=> bs!11510 m!225205))

(declare-fun m!225519 () Bool)

(assert (=> bs!11510 m!225519))

(assert (=> bs!11510 m!225205))

(assert (=> d!46830 d!46945))

(assert (=> b!146217 d!46824))

(assert (=> b!146217 d!46822))

(assert (=> b!146214 d!46822))

(assert (=> b!146214 d!46820))

(assert (=> d!46861 d!46871))

(declare-fun d!46947 () Bool)

(assert (=> d!46947 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226210))))

(assert (=> d!46947 true))

(declare-fun _$15!228 () Unit!9086)

(assert (=> d!46947 (= (choose!30 thiss!1634 (_2!6881 lt!226224) (_2!6881 lt!226210)) _$15!228)))

(declare-fun bs!11511 () Bool)

(assert (= bs!11511 d!46947))

(assert (=> bs!11511 m!224625))

(assert (=> d!46861 d!46947))

(assert (=> d!46861 d!46893))

(declare-fun b!146311 () Bool)

(declare-fun res!122400 () Bool)

(declare-fun e!97531 () Bool)

(assert (=> b!146311 (=> (not res!122400) (not e!97531))))

(declare-fun _$39!42 () tuple2!13064)

(assert (=> b!146311 (= res!122400 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 _$39!42))) (currentByte!6343 (_2!6881 _$39!42)) (currentBit!6338 (_2!6881 _$39!42))) (bvadd (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!146312 () Bool)

(declare-fun e!97530 () Bool)

(assert (=> b!146312 (= e!97530 (array_inv!2791 (buf!3447 (_2!6881 _$39!42))))))

(declare-fun b!146313 () Bool)

(declare-fun e!97532 () Bool)

(declare-fun lt!227198 () tuple2!13066)

(assert (=> b!146313 (= e!97532 (arrayRangesEq!318 arr!237 (_2!6882 lt!227198) #b00000000000000000000000000000000 to!404))))

(declare-fun d!46949 () Bool)

(assert (=> d!46949 e!97531))

(declare-fun res!122397 () Bool)

(assert (=> d!46949 (=> (not res!122397) (not e!97531))))

(assert (=> d!46949 (= res!122397 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 _$39!42)))))))

(assert (=> d!46949 (and (inv!12 (_2!6881 _$39!42)) e!97530)))

(assert (=> d!46949 (= (choose!64 (_2!6881 lt!226224) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!42)))

(declare-fun b!146314 () Bool)

(declare-fun res!122398 () Bool)

(assert (=> b!146314 (=> (not res!122398) (not e!97531))))

(assert (=> b!146314 (= res!122398 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 _$39!42)))))

(declare-fun b!146315 () Bool)

(assert (=> b!146315 (= e!97531 e!97532)))

(declare-fun res!122399 () Bool)

(assert (=> b!146315 (=> (not res!122399) (not e!97532))))

(declare-fun lt!227200 () tuple2!13068)

(assert (=> b!146315 (= res!122399 (and (= (size!3002 (_2!6882 lt!227198)) (size!3002 arr!237)) (= (_1!6882 lt!227198) (_2!6883 lt!227200))))))

(assert (=> b!146315 (= lt!227198 (readByteArrayLoopPure!0 (_1!6883 lt!227200) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227197 () Unit!9086)

(declare-fun lt!227201 () Unit!9086)

(assert (=> b!146315 (= lt!227197 lt!227201)))

(declare-fun lt!227199 () (_ BitVec 64))

(assert (=> b!146315 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 _$39!42)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!227199)))

(assert (=> b!146315 (= lt!227201 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 _$39!42)) lt!227199))))

(assert (=> b!146315 (= lt!227199 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146315 (= lt!227200 (reader!0 (_2!6881 lt!226224) (_2!6881 _$39!42)))))

(assert (= d!46949 b!146312))

(assert (= (and d!46949 res!122397) b!146311))

(assert (= (and b!146311 res!122400) b!146314))

(assert (= (and b!146314 res!122398) b!146315))

(assert (= (and b!146315 res!122399) b!146313))

(declare-fun m!225521 () Bool)

(assert (=> b!146311 m!225521))

(assert (=> b!146311 m!224667))

(declare-fun m!225523 () Bool)

(assert (=> d!46949 m!225523))

(declare-fun m!225525 () Bool)

(assert (=> b!146313 m!225525))

(declare-fun m!225527 () Bool)

(assert (=> b!146312 m!225527))

(declare-fun m!225529 () Bool)

(assert (=> b!146314 m!225529))

(declare-fun m!225531 () Bool)

(assert (=> b!146315 m!225531))

(declare-fun m!225533 () Bool)

(assert (=> b!146315 m!225533))

(declare-fun m!225535 () Bool)

(assert (=> b!146315 m!225535))

(declare-fun m!225537 () Bool)

(assert (=> b!146315 m!225537))

(assert (=> d!46869 d!46949))

(declare-fun d!46951 () Bool)

(assert (=> d!46951 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))))))))

(assert (=> d!46851 d!46951))

(declare-fun call!1908 () Bool)

(declare-fun bm!1904 () Bool)

(declare-fun lt!227210 () tuple2!13084)

(declare-fun c!7922 () Bool)

(assert (=> bm!1904 (= call!1908 (arrayRangesEq!318 lt!226223 (ite c!7922 (array!6632 (store (arr!3741 lt!226223) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227210)) (size!3002 lt!226223)) lt!226223) #b00000000000000000000000000000000 (ite c!7922 (bvadd #b00000000000000000000000000000001 from!447) (size!3002 lt!226223))))))

(declare-fun b!146316 () Bool)

(declare-fun res!122403 () Bool)

(declare-fun e!97535 () Bool)

(assert (=> b!146316 (=> (not res!122403) (not e!97535))))

(declare-fun lt!227216 () tuple3!568)

(assert (=> b!146316 (= res!122403 (and (= (buf!3447 (_1!6883 lt!226221)) (buf!3447 (_2!6894 lt!227216))) (= (size!3002 lt!226223) (size!3002 (_3!351 lt!227216)))))))

(declare-fun b!146317 () Bool)

(assert (=> b!146317 (= e!97535 (arrayRangesEq!318 lt!226223 (_3!351 lt!227216) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!46953 () Bool)

(declare-fun e!97533 () Bool)

(assert (=> d!46953 e!97533))

(declare-fun res!122402 () Bool)

(assert (=> d!46953 (=> res!122402 e!97533)))

(assert (=> d!46953 (= res!122402 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227223 () Bool)

(assert (=> d!46953 (= lt!227223 e!97535)))

(declare-fun res!122401 () Bool)

(assert (=> d!46953 (=> (not res!122401) (not e!97535))))

(declare-fun lt!227202 () (_ BitVec 64))

(declare-fun lt!227224 () (_ BitVec 64))

(assert (=> d!46953 (= res!122401 (= (bvadd lt!227224 lt!227202) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227216))) (currentByte!6343 (_2!6894 lt!227216)) (currentBit!6338 (_2!6894 lt!227216)))))))

(assert (=> d!46953 (or (not (= (bvand lt!227224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227202 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227224 lt!227202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227229 () (_ BitVec 64))

(assert (=> d!46953 (= lt!227202 (bvmul lt!227229 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!46953 (or (= lt!227229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227229)))))

(assert (=> d!46953 (= lt!227229 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!46953 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!46953 (= lt!227224 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226221))) (currentByte!6343 (_1!6883 lt!226221)) (currentBit!6338 (_1!6883 lt!226221))))))

(declare-fun e!97534 () tuple3!568)

(assert (=> d!46953 (= lt!227216 e!97534)))

(assert (=> d!46953 (= c!7922 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46953 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3002 lt!226223)))))

(assert (=> d!46953 (= (readByteArrayLoop!0 (_1!6883 lt!226221) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!227216)))

(declare-fun lt!227213 () array!6631)

(declare-fun call!1907 () Bool)

(declare-fun lt!227237 () (_ BitVec 32))

(declare-fun lt!227230 () tuple3!568)

(declare-fun lt!227205 () array!6631)

(declare-fun bm!1905 () Bool)

(declare-fun lt!227222 () (_ BitVec 32))

(declare-fun lt!227234 () (_ BitVec 32))

(assert (=> bm!1905 (= call!1907 (arrayRangesEq!318 (ite c!7922 lt!226223 lt!227205) (ite c!7922 (_3!351 lt!227230) lt!227213) (ite c!7922 lt!227234 lt!227237) (ite c!7922 (bvadd #b00000000000000000000000000000001 from!447) lt!227222)))))

(declare-fun b!146318 () Bool)

(declare-fun lt!227219 () Unit!9086)

(assert (=> b!146318 (= e!97534 (tuple3!569 lt!227219 (_2!6894 lt!227230) (_3!351 lt!227230)))))

(assert (=> b!146318 (= lt!227210 (readByte!0 (_1!6883 lt!226221)))))

(declare-fun lt!227215 () array!6631)

(assert (=> b!146318 (= lt!227215 (array!6632 (store (arr!3741 lt!226223) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227210)) (size!3002 lt!226223)))))

(declare-fun lt!227204 () (_ BitVec 64))

(assert (=> b!146318 (= lt!227204 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227214 () (_ BitVec 32))

(assert (=> b!146318 (= lt!227214 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227233 () Unit!9086)

(assert (=> b!146318 (= lt!227233 (validateOffsetBytesFromBitIndexLemma!0 (_1!6883 lt!226221) (_2!6893 lt!227210) lt!227204 lt!227214))))

(assert (=> b!146318 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6893 lt!227210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6893 lt!227210))) ((_ sign_extend 32) (currentBit!6338 (_2!6893 lt!227210))) (bvsub lt!227214 ((_ extract 31 0) (bvsdiv (bvadd lt!227204 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227209 () Unit!9086)

(assert (=> b!146318 (= lt!227209 lt!227233)))

(assert (=> b!146318 (= lt!227230 (readByteArrayLoop!0 (_2!6893 lt!227210) lt!227215 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1909 () (_ BitVec 64))

(assert (=> b!146318 (= call!1909 (bvadd (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226221))) (currentByte!6343 (_1!6883 lt!226221)) (currentBit!6338 (_1!6883 lt!226221))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227206 () Unit!9086)

(declare-fun Unit!9119 () Unit!9086)

(assert (=> b!146318 (= lt!227206 Unit!9119)))

(assert (=> b!146318 (= (bvadd call!1909 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227230))) (currentByte!6343 (_2!6894 lt!227230)) (currentBit!6338 (_2!6894 lt!227230))))))

(declare-fun lt!227203 () Unit!9086)

(declare-fun Unit!9120 () Unit!9086)

(assert (=> b!146318 (= lt!227203 Unit!9120)))

(assert (=> b!146318 (= (bvadd (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226221))) (currentByte!6343 (_1!6883 lt!226221)) (currentBit!6338 (_1!6883 lt!226221))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227230))) (currentByte!6343 (_2!6894 lt!227230)) (currentBit!6338 (_2!6894 lt!227230))))))

(declare-fun lt!227232 () Unit!9086)

(declare-fun Unit!9121 () Unit!9086)

(assert (=> b!146318 (= lt!227232 Unit!9121)))

(assert (=> b!146318 (and (= (buf!3447 (_1!6883 lt!226221)) (buf!3447 (_2!6894 lt!227230))) (= (size!3002 lt!226223) (size!3002 (_3!351 lt!227230))))))

(declare-fun lt!227228 () Unit!9086)

(declare-fun Unit!9122 () Unit!9086)

(assert (=> b!146318 (= lt!227228 Unit!9122)))

(declare-fun lt!227225 () Unit!9086)

(assert (=> b!146318 (= lt!227225 (arrayUpdatedAtPrefixLemma!10 lt!226223 (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227210)))))

(assert (=> b!146318 call!1908))

(declare-fun lt!227217 () Unit!9086)

(assert (=> b!146318 (= lt!227217 lt!227225)))

(assert (=> b!146318 (= lt!227234 #b00000000000000000000000000000000)))

(declare-fun lt!227208 () Unit!9086)

(assert (=> b!146318 (= lt!227208 (arrayRangesEqTransitive!50 lt!226223 lt!227215 (_3!351 lt!227230) lt!227234 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146318 call!1907))

(declare-fun lt!227218 () Unit!9086)

(assert (=> b!146318 (= lt!227218 lt!227208)))

(assert (=> b!146318 (arrayRangesEq!318 lt!226223 (_3!351 lt!227230) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!227231 () Unit!9086)

(declare-fun Unit!9123 () Unit!9086)

(assert (=> b!146318 (= lt!227231 Unit!9123)))

(declare-fun lt!227220 () Unit!9086)

(assert (=> b!146318 (= lt!227220 (arrayRangesEqImpliesEq!10 lt!227215 (_3!351 lt!227230) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146318 (= (select (store (arr!3741 lt!226223) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227210)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3741 (_3!351 lt!227230)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227235 () Unit!9086)

(assert (=> b!146318 (= lt!227235 lt!227220)))

(declare-fun lt!227221 () Bool)

(assert (=> b!146318 (= lt!227221 (= (select (arr!3741 (_3!351 lt!227230)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6893 lt!227210)))))

(declare-fun Unit!9124 () Unit!9086)

(assert (=> b!146318 (= lt!227219 Unit!9124)))

(assert (=> b!146318 lt!227221))

(declare-fun lt!227236 () Unit!9086)

(declare-fun b!146319 () Bool)

(assert (=> b!146319 (= e!97534 (tuple3!569 lt!227236 (_1!6883 lt!226221) lt!226223))))

(assert (=> b!146319 (= call!1909 call!1909)))

(declare-fun lt!227207 () Unit!9086)

(declare-fun Unit!9125 () Unit!9086)

(assert (=> b!146319 (= lt!227207 Unit!9125)))

(declare-fun lt!227211 () Unit!9086)

(assert (=> b!146319 (= lt!227211 (arrayRangesEqReflexiveLemma!10 lt!226223))))

(assert (=> b!146319 call!1908))

(declare-fun lt!227227 () Unit!9086)

(assert (=> b!146319 (= lt!227227 lt!227211)))

(assert (=> b!146319 (= lt!227205 lt!226223)))

(assert (=> b!146319 (= lt!227213 lt!226223)))

(declare-fun lt!227212 () (_ BitVec 32))

(assert (=> b!146319 (= lt!227212 #b00000000000000000000000000000000)))

(declare-fun lt!227226 () (_ BitVec 32))

(assert (=> b!146319 (= lt!227226 (size!3002 lt!226223))))

(assert (=> b!146319 (= lt!227237 #b00000000000000000000000000000000)))

(assert (=> b!146319 (= lt!227222 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!146319 (= lt!227236 (arrayRangesEqSlicedLemma!10 lt!227205 lt!227213 lt!227212 lt!227226 lt!227237 lt!227222))))

(assert (=> b!146319 call!1907))

(declare-fun bm!1906 () Bool)

(assert (=> bm!1906 (= call!1909 (bitIndex!0 (ite c!7922 (size!3002 (buf!3447 (_2!6893 lt!227210))) (size!3002 (buf!3447 (_1!6883 lt!226221)))) (ite c!7922 (currentByte!6343 (_2!6893 lt!227210)) (currentByte!6343 (_1!6883 lt!226221))) (ite c!7922 (currentBit!6338 (_2!6893 lt!227210)) (currentBit!6338 (_1!6883 lt!226221)))))))

(declare-fun b!146320 () Bool)

(assert (=> b!146320 (= e!97533 (= (select (arr!3741 (_3!351 lt!227216)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6884 (readBytePure!0 (_1!6883 lt!226221)))))))

(assert (=> b!146320 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3002 (_3!351 lt!227216))))))

(assert (= (and d!46953 c!7922) b!146318))

(assert (= (and d!46953 (not c!7922)) b!146319))

(assert (= (or b!146318 b!146319) bm!1905))

(assert (= (or b!146318 b!146319) bm!1904))

(assert (= (or b!146318 b!146319) bm!1906))

(assert (= (and d!46953 res!122401) b!146316))

(assert (= (and b!146316 res!122403) b!146317))

(assert (= (and d!46953 (not res!122402)) b!146320))

(declare-fun m!225539 () Bool)

(assert (=> bm!1905 m!225539))

(declare-fun m!225541 () Bool)

(assert (=> b!146317 m!225541))

(declare-fun m!225543 () Bool)

(assert (=> b!146318 m!225543))

(declare-fun m!225545 () Bool)

(assert (=> b!146318 m!225545))

(declare-fun m!225547 () Bool)

(assert (=> b!146318 m!225547))

(declare-fun m!225549 () Bool)

(assert (=> b!146318 m!225549))

(declare-fun m!225551 () Bool)

(assert (=> b!146318 m!225551))

(declare-fun m!225553 () Bool)

(assert (=> b!146318 m!225553))

(declare-fun m!225555 () Bool)

(assert (=> b!146318 m!225555))

(declare-fun m!225557 () Bool)

(assert (=> b!146318 m!225557))

(declare-fun m!225559 () Bool)

(assert (=> b!146318 m!225559))

(declare-fun m!225561 () Bool)

(assert (=> b!146318 m!225561))

(declare-fun m!225563 () Bool)

(assert (=> b!146318 m!225563))

(declare-fun m!225565 () Bool)

(assert (=> b!146318 m!225565))

(declare-fun m!225567 () Bool)

(assert (=> b!146318 m!225567))

(declare-fun m!225569 () Bool)

(assert (=> b!146320 m!225569))

(declare-fun m!225571 () Bool)

(assert (=> b!146320 m!225571))

(declare-fun m!225573 () Bool)

(assert (=> bm!1906 m!225573))

(declare-fun m!225575 () Bool)

(assert (=> d!46953 m!225575))

(assert (=> d!46953 m!225545))

(assert (=> bm!1904 m!225555))

(declare-fun m!225577 () Bool)

(assert (=> bm!1904 m!225577))

(declare-fun m!225579 () Bool)

(assert (=> b!146319 m!225579))

(declare-fun m!225581 () Bool)

(assert (=> b!146319 m!225581))

(assert (=> d!46840 d!46953))

(assert (=> d!46857 d!46927))

(declare-fun d!46955 () Bool)

(assert (=> d!46955 (isPrefixOf!0 lt!226924 (_2!6881 lt!226210))))

(declare-fun lt!227238 () Unit!9086)

(assert (=> d!46955 (= lt!227238 (choose!30 lt!226924 (_2!6881 lt!226210) (_2!6881 lt!226210)))))

(assert (=> d!46955 (isPrefixOf!0 lt!226924 (_2!6881 lt!226210))))

(assert (=> d!46955 (= (lemmaIsPrefixTransitive!0 lt!226924 (_2!6881 lt!226210) (_2!6881 lt!226210)) lt!227238)))

(declare-fun bs!11512 () Bool)

(assert (= bs!11512 d!46955))

(assert (=> bs!11512 m!225271))

(declare-fun m!225583 () Bool)

(assert (=> bs!11512 m!225583))

(assert (=> bs!11512 m!225271))

(assert (=> d!46857 d!46955))

(declare-fun d!46957 () Bool)

(assert (=> d!46957 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226224))))

(declare-fun lt!227239 () Unit!9086)

(assert (=> d!46957 (= lt!227239 (choose!11 (_2!6881 lt!226224)))))

(assert (=> d!46957 (= (lemmaIsPrefixRefl!0 (_2!6881 lt!226224)) lt!227239)))

(declare-fun bs!11513 () Bool)

(assert (= bs!11513 d!46957))

(assert (=> bs!11513 m!225261))

(declare-fun m!225585 () Bool)

(assert (=> bs!11513 m!225585))

(assert (=> d!46857 d!46957))

(assert (=> d!46857 d!46941))

(declare-fun d!46959 () Bool)

(assert (=> d!46959 (isPrefixOf!0 lt!226924 lt!226924)))

(declare-fun lt!227240 () Unit!9086)

(assert (=> d!46959 (= lt!227240 (choose!11 lt!226924))))

(assert (=> d!46959 (= (lemmaIsPrefixRefl!0 lt!226924) lt!227240)))

(declare-fun bs!11514 () Bool)

(assert (= bs!11514 d!46959))

(assert (=> bs!11514 m!225267))

(declare-fun m!225587 () Bool)

(assert (=> bs!11514 m!225587))

(assert (=> d!46857 d!46959))

(declare-fun d!46961 () Bool)

(declare-fun res!122404 () Bool)

(declare-fun e!97537 () Bool)

(assert (=> d!46961 (=> (not res!122404) (not e!97537))))

(assert (=> d!46961 (= res!122404 (= (size!3002 (buf!3447 lt!226924)) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46961 (= (isPrefixOf!0 lt!226924 (_2!6881 lt!226210)) e!97537)))

(declare-fun b!146321 () Bool)

(declare-fun res!122405 () Bool)

(assert (=> b!146321 (=> (not res!122405) (not e!97537))))

(assert (=> b!146321 (= res!122405 (bvsle (bitIndex!0 (size!3002 (buf!3447 lt!226924)) (currentByte!6343 lt!226924) (currentBit!6338 lt!226924)) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146322 () Bool)

(declare-fun e!97536 () Bool)

(assert (=> b!146322 (= e!97537 e!97536)))

(declare-fun res!122406 () Bool)

(assert (=> b!146322 (=> res!122406 e!97536)))

(assert (=> b!146322 (= res!122406 (= (size!3002 (buf!3447 lt!226924)) #b00000000000000000000000000000000))))

(declare-fun b!146323 () Bool)

(assert (=> b!146323 (= e!97536 (arrayBitRangesEq!0 (buf!3447 lt!226924) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 lt!226924)) (currentByte!6343 lt!226924) (currentBit!6338 lt!226924))))))

(assert (= (and d!46961 res!122404) b!146321))

(assert (= (and b!146321 res!122405) b!146322))

(assert (= (and b!146322 (not res!122406)) b!146323))

(declare-fun m!225589 () Bool)

(assert (=> b!146321 m!225589))

(assert (=> b!146321 m!224683))

(assert (=> b!146323 m!225589))

(assert (=> b!146323 m!225589))

(declare-fun m!225591 () Bool)

(assert (=> b!146323 m!225591))

(assert (=> d!46857 d!46961))

(declare-fun d!46963 () Bool)

(declare-fun res!122407 () Bool)

(declare-fun e!97539 () Bool)

(assert (=> d!46963 (=> (not res!122407) (not e!97539))))

(assert (=> d!46963 (= res!122407 (= (size!3002 (buf!3447 lt!226924)) (size!3002 (buf!3447 lt!226924))))))

(assert (=> d!46963 (= (isPrefixOf!0 lt!226924 lt!226924) e!97539)))

(declare-fun b!146324 () Bool)

(declare-fun res!122408 () Bool)

(assert (=> b!146324 (=> (not res!122408) (not e!97539))))

(assert (=> b!146324 (= res!122408 (bvsle (bitIndex!0 (size!3002 (buf!3447 lt!226924)) (currentByte!6343 lt!226924) (currentBit!6338 lt!226924)) (bitIndex!0 (size!3002 (buf!3447 lt!226924)) (currentByte!6343 lt!226924) (currentBit!6338 lt!226924))))))

(declare-fun b!146325 () Bool)

(declare-fun e!97538 () Bool)

(assert (=> b!146325 (= e!97539 e!97538)))

(declare-fun res!122409 () Bool)

(assert (=> b!146325 (=> res!122409 e!97538)))

(assert (=> b!146325 (= res!122409 (= (size!3002 (buf!3447 lt!226924)) #b00000000000000000000000000000000))))

(declare-fun b!146326 () Bool)

(assert (=> b!146326 (= e!97538 (arrayBitRangesEq!0 (buf!3447 lt!226924) (buf!3447 lt!226924) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 lt!226924)) (currentByte!6343 lt!226924) (currentBit!6338 lt!226924))))))

(assert (= (and d!46963 res!122407) b!146324))

(assert (= (and b!146324 res!122408) b!146325))

(assert (= (and b!146325 (not res!122409)) b!146326))

(assert (=> b!146324 m!225589))

(assert (=> b!146324 m!225589))

(assert (=> b!146326 m!225589))

(assert (=> b!146326 m!225589))

(declare-fun m!225593 () Bool)

(assert (=> b!146326 m!225593))

(assert (=> d!46857 d!46963))

(declare-fun d!46965 () Bool)

(assert (=> d!46965 (isPrefixOf!0 lt!226924 (_2!6881 lt!226210))))

(declare-fun lt!227241 () Unit!9086)

(assert (=> d!46965 (= lt!227241 (choose!30 lt!226924 (_2!6881 lt!226224) (_2!6881 lt!226210)))))

(assert (=> d!46965 (isPrefixOf!0 lt!226924 (_2!6881 lt!226224))))

(assert (=> d!46965 (= (lemmaIsPrefixTransitive!0 lt!226924 (_2!6881 lt!226224) (_2!6881 lt!226210)) lt!227241)))

(declare-fun bs!11515 () Bool)

(assert (= bs!11515 d!46965))

(assert (=> bs!11515 m!225271))

(declare-fun m!225595 () Bool)

(assert (=> bs!11515 m!225595))

(declare-fun m!225597 () Bool)

(assert (=> bs!11515 m!225597))

(assert (=> d!46857 d!46965))

(assert (=> d!46857 d!46887))

(declare-fun d!46967 () Bool)

(declare-fun res!122410 () Bool)

(declare-fun e!97541 () Bool)

(assert (=> d!46967 (=> (not res!122410) (not e!97541))))

(assert (=> d!46967 (= res!122410 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (=> d!46967 (= (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226224)) e!97541)))

(declare-fun b!146327 () Bool)

(declare-fun res!122411 () Bool)

(assert (=> b!146327 (=> (not res!122411) (not e!97541))))

(assert (=> b!146327 (= res!122411 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun b!146328 () Bool)

(declare-fun e!97540 () Bool)

(assert (=> b!146328 (= e!97541 e!97540)))

(declare-fun res!122412 () Bool)

(assert (=> b!146328 (=> res!122412 e!97540)))

(assert (=> b!146328 (= res!122412 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) #b00000000000000000000000000000000))))

(declare-fun b!146329 () Bool)

(assert (=> b!146329 (= e!97540 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (= (and d!46967 res!122410) b!146327))

(assert (= (and b!146327 res!122411) b!146328))

(assert (= (and b!146328 (not res!122412)) b!146329))

(assert (=> b!146327 m!224667))

(assert (=> b!146327 m!224667))

(assert (=> b!146329 m!224667))

(assert (=> b!146329 m!224667))

(declare-fun m!225599 () Bool)

(assert (=> b!146329 m!225599))

(assert (=> d!46857 d!46967))

(declare-fun d!46969 () Bool)

(declare-fun res!122413 () Bool)

(declare-fun e!97543 () Bool)

(assert (=> d!46969 (=> (not res!122413) (not e!97543))))

(assert (=> d!46969 (= res!122413 (= (size!3002 (buf!3447 (_1!6883 lt!226926))) (size!3002 (buf!3447 (_2!6883 lt!226926)))))))

(assert (=> d!46969 (= (isPrefixOf!0 (_1!6883 lt!226926) (_2!6883 lt!226926)) e!97543)))

(declare-fun b!146330 () Bool)

(declare-fun res!122414 () Bool)

(assert (=> b!146330 (=> (not res!122414) (not e!97543))))

(assert (=> b!146330 (= res!122414 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226926))) (currentByte!6343 (_1!6883 lt!226926)) (currentBit!6338 (_1!6883 lt!226926))) (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226926))) (currentByte!6343 (_2!6883 lt!226926)) (currentBit!6338 (_2!6883 lt!226926)))))))

(declare-fun b!146331 () Bool)

(declare-fun e!97542 () Bool)

(assert (=> b!146331 (= e!97543 e!97542)))

(declare-fun res!122415 () Bool)

(assert (=> b!146331 (=> res!122415 e!97542)))

(assert (=> b!146331 (= res!122415 (= (size!3002 (buf!3447 (_1!6883 lt!226926))) #b00000000000000000000000000000000))))

(declare-fun b!146332 () Bool)

(assert (=> b!146332 (= e!97542 (arrayBitRangesEq!0 (buf!3447 (_1!6883 lt!226926)) (buf!3447 (_2!6883 lt!226926)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226926))) (currentByte!6343 (_1!6883 lt!226926)) (currentBit!6338 (_1!6883 lt!226926)))))))

(assert (= (and d!46969 res!122413) b!146330))

(assert (= (and b!146330 res!122414) b!146331))

(assert (= (and b!146331 (not res!122415)) b!146332))

(declare-fun m!225601 () Bool)

(assert (=> b!146330 m!225601))

(assert (=> b!146330 m!225401))

(assert (=> b!146332 m!225601))

(assert (=> b!146332 m!225601))

(declare-fun m!225603 () Bool)

(assert (=> b!146332 m!225603))

(assert (=> d!46857 d!46969))

(declare-fun b!146333 () Bool)

(declare-fun e!97544 () Bool)

(declare-fun call!1910 () Bool)

(assert (=> b!146333 (= e!97544 call!1910)))

(declare-fun b!146334 () Bool)

(declare-fun res!122419 () Bool)

(declare-fun lt!227244 () (_ BitVec 32))

(assert (=> b!146334 (= res!122419 (= lt!227244 #b00000000000000000000000000000000))))

(declare-fun e!97547 () Bool)

(assert (=> b!146334 (=> res!122419 e!97547)))

(declare-fun e!97545 () Bool)

(assert (=> b!146334 (= e!97545 e!97547)))

(declare-fun d!46971 () Bool)

(declare-fun res!122418 () Bool)

(declare-fun e!97548 () Bool)

(assert (=> d!46971 (=> res!122418 e!97548)))

(assert (=> d!46971 (= res!122418 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (=> d!46971 (= (arrayBitRangesEq!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) e!97548)))

(declare-fun lt!227243 () (_ BitVec 32))

(declare-fun bm!1907 () Bool)

(declare-fun lt!227242 () tuple4!134)

(declare-fun c!7923 () Bool)

(assert (=> bm!1907 (= call!1910 (byteRangesEq!0 (ite c!7923 (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227242)) (select (arr!3741 (buf!3447 thiss!1634)) (_4!67 lt!227242))) (ite c!7923 (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227242)) (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_4!67 lt!227242))) (ite c!7923 lt!227243 #b00000000000000000000000000000000) lt!227244))))

(declare-fun b!146335 () Bool)

(declare-fun e!97546 () Bool)

(assert (=> b!146335 (= e!97546 e!97544)))

(assert (=> b!146335 (= c!7923 (= (_3!352 lt!227242) (_4!67 lt!227242)))))

(declare-fun b!146336 () Bool)

(assert (=> b!146336 (= e!97548 e!97546)))

(declare-fun res!122416 () Bool)

(assert (=> b!146336 (=> (not res!122416) (not e!97546))))

(declare-fun e!97549 () Bool)

(assert (=> b!146336 (= res!122416 e!97549)))

(declare-fun res!122417 () Bool)

(assert (=> b!146336 (=> res!122417 e!97549)))

(assert (=> b!146336 (= res!122417 (bvsge (_1!6895 lt!227242) (_2!6895 lt!227242)))))

(assert (=> b!146336 (= lt!227244 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146336 (= lt!227243 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146336 (= lt!227242 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(declare-fun b!146337 () Bool)

(assert (=> b!146337 (= e!97544 e!97545)))

(declare-fun res!122420 () Bool)

(assert (=> b!146337 (= res!122420 (byteRangesEq!0 (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227242)) (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227242)) lt!227243 #b00000000000000000000000000001000))))

(assert (=> b!146337 (=> (not res!122420) (not e!97545))))

(declare-fun b!146338 () Bool)

(assert (=> b!146338 (= e!97547 call!1910)))

(declare-fun b!146339 () Bool)

(assert (=> b!146339 (= e!97549 (arrayRangesEq!318 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226224)) (_1!6895 lt!227242) (_2!6895 lt!227242)))))

(assert (= (and d!46971 (not res!122418)) b!146336))

(assert (= (and b!146336 (not res!122417)) b!146339))

(assert (= (and b!146336 res!122416) b!146335))

(assert (= (and b!146335 c!7923) b!146333))

(assert (= (and b!146335 (not c!7923)) b!146337))

(assert (= (and b!146337 res!122420) b!146334))

(assert (= (and b!146334 (not res!122419)) b!146338))

(assert (= (or b!146333 b!146338) bm!1907))

(declare-fun m!225605 () Bool)

(assert (=> bm!1907 m!225605))

(declare-fun m!225607 () Bool)

(assert (=> bm!1907 m!225607))

(declare-fun m!225609 () Bool)

(assert (=> bm!1907 m!225609))

(declare-fun m!225611 () Bool)

(assert (=> bm!1907 m!225611))

(declare-fun m!225613 () Bool)

(assert (=> bm!1907 m!225613))

(assert (=> b!146336 m!224669))

(declare-fun m!225615 () Bool)

(assert (=> b!146336 m!225615))

(assert (=> b!146337 m!225613))

(assert (=> b!146337 m!225605))

(assert (=> b!146337 m!225613))

(assert (=> b!146337 m!225605))

(declare-fun m!225617 () Bool)

(assert (=> b!146337 m!225617))

(declare-fun m!225619 () Bool)

(assert (=> b!146339 m!225619))

(assert (=> b!146219 d!46971))

(assert (=> b!146219 d!46824))

(declare-fun b!146340 () Bool)

(declare-fun e!97550 () Bool)

(declare-fun call!1911 () Bool)

(assert (=> b!146340 (= e!97550 call!1911)))

(declare-fun b!146341 () Bool)

(declare-fun res!122424 () Bool)

(declare-fun lt!227247 () (_ BitVec 32))

(assert (=> b!146341 (= res!122424 (= lt!227247 #b00000000000000000000000000000000))))

(declare-fun e!97553 () Bool)

(assert (=> b!146341 (=> res!122424 e!97553)))

(declare-fun e!97551 () Bool)

(assert (=> b!146341 (= e!97551 e!97553)))

(declare-fun d!46973 () Bool)

(declare-fun res!122423 () Bool)

(declare-fun e!97554 () Bool)

(assert (=> d!46973 (=> res!122423 e!97554)))

(assert (=> d!46973 (= res!122423 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (=> d!46973 (= (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))) e!97554)))

(declare-fun c!7924 () Bool)

(declare-fun lt!227245 () tuple4!134)

(declare-fun bm!1908 () Bool)

(declare-fun lt!227246 () (_ BitVec 32))

(assert (=> bm!1908 (= call!1911 (byteRangesEq!0 (ite c!7924 (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227245)) (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_4!67 lt!227245))) (ite c!7924 (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227245)) (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_4!67 lt!227245))) (ite c!7924 lt!227246 #b00000000000000000000000000000000) lt!227247))))

(declare-fun b!146342 () Bool)

(declare-fun e!97552 () Bool)

(assert (=> b!146342 (= e!97552 e!97550)))

(assert (=> b!146342 (= c!7924 (= (_3!352 lt!227245) (_4!67 lt!227245)))))

(declare-fun b!146343 () Bool)

(assert (=> b!146343 (= e!97554 e!97552)))

(declare-fun res!122421 () Bool)

(assert (=> b!146343 (=> (not res!122421) (not e!97552))))

(declare-fun e!97555 () Bool)

(assert (=> b!146343 (= res!122421 e!97555)))

(declare-fun res!122422 () Bool)

(assert (=> b!146343 (=> res!122422 e!97555)))

(assert (=> b!146343 (= res!122422 (bvsge (_1!6895 lt!227245) (_2!6895 lt!227245)))))

(assert (=> b!146343 (= lt!227247 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146343 (= lt!227246 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146343 (= lt!227245 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun b!146344 () Bool)

(assert (=> b!146344 (= e!97550 e!97551)))

(declare-fun res!122425 () Bool)

(assert (=> b!146344 (= res!122425 (byteRangesEq!0 (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227245)) (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227245)) lt!227246 #b00000000000000000000000000001000))))

(assert (=> b!146344 (=> (not res!122425) (not e!97551))))

(declare-fun b!146345 () Bool)

(assert (=> b!146345 (= e!97553 call!1911)))

(declare-fun b!146346 () Bool)

(assert (=> b!146346 (= e!97555 (arrayRangesEq!318 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226210)) (_1!6895 lt!227245) (_2!6895 lt!227245)))))

(assert (= (and d!46973 (not res!122423)) b!146343))

(assert (= (and b!146343 (not res!122422)) b!146346))

(assert (= (and b!146343 res!122421) b!146342))

(assert (= (and b!146342 c!7924) b!146340))

(assert (= (and b!146342 (not c!7924)) b!146344))

(assert (= (and b!146344 res!122425) b!146341))

(assert (= (and b!146341 (not res!122424)) b!146345))

(assert (= (or b!146340 b!146345) bm!1908))

(declare-fun m!225621 () Bool)

(assert (=> bm!1908 m!225621))

(declare-fun m!225623 () Bool)

(assert (=> bm!1908 m!225623))

(declare-fun m!225625 () Bool)

(assert (=> bm!1908 m!225625))

(declare-fun m!225627 () Bool)

(assert (=> bm!1908 m!225627))

(declare-fun m!225629 () Bool)

(assert (=> bm!1908 m!225629))

(assert (=> b!146343 m!224667))

(declare-fun m!225631 () Bool)

(assert (=> b!146343 m!225631))

(assert (=> b!146344 m!225629))

(assert (=> b!146344 m!225621))

(assert (=> b!146344 m!225629))

(assert (=> b!146344 m!225621))

(declare-fun m!225633 () Bool)

(assert (=> b!146344 m!225633))

(declare-fun m!225635 () Bool)

(assert (=> b!146346 m!225635))

(assert (=> b!146216 d!46973))

(assert (=> b!146216 d!46822))

(declare-fun d!46975 () Bool)

(assert (=> d!46975 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226214)))) ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226214))) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226214)))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226214)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226214))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226214))))))))

(assert (=> d!46844 d!46975))

(declare-fun d!46977 () Bool)

(assert (=> d!46977 (= (invariant!0 (currentBit!6338 (_1!6884 lt!226214)) (currentByte!6343 (_1!6884 lt!226214)) (size!3002 (buf!3447 (_1!6884 lt!226214)))) (and (bvsge (currentBit!6338 (_1!6884 lt!226214)) #b00000000000000000000000000000000) (bvslt (currentBit!6338 (_1!6884 lt!226214)) #b00000000000000000000000000001000) (bvsge (currentByte!6343 (_1!6884 lt!226214)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6343 (_1!6884 lt!226214)) (size!3002 (buf!3447 (_1!6884 lt!226214)))) (and (= (currentBit!6338 (_1!6884 lt!226214)) #b00000000000000000000000000000000) (= (currentByte!6343 (_1!6884 lt!226214)) (size!3002 (buf!3447 (_1!6884 lt!226214))))))))))

(assert (=> d!46844 d!46977))

(assert (=> d!46881 d!46879))

(declare-fun d!46979 () Bool)

(assert (=> d!46979 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226208)))

(assert (=> d!46979 true))

(declare-fun _$6!307 () Unit!9086)

(assert (=> d!46979 (= (choose!9 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226208 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))) _$6!307)))

(declare-fun bs!11516 () Bool)

(assert (= bs!11516 d!46979))

(assert (=> bs!11516 m!224673))

(assert (=> d!46881 d!46979))

(declare-fun d!46981 () Bool)

(declare-fun res!122426 () Bool)

(declare-fun e!97557 () Bool)

(assert (=> d!46981 (=> (not res!122426) (not e!97557))))

(assert (=> d!46981 (= res!122426 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) (size!3002 (buf!3447 (_2!6881 lt!226970)))))))

(assert (=> d!46981 (= (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226970)) e!97557)))

(declare-fun b!146347 () Bool)

(declare-fun res!122427 () Bool)

(assert (=> b!146347 (=> (not res!122427) (not e!97557))))

(assert (=> b!146347 (= res!122427 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226970))) (currentByte!6343 (_2!6881 lt!226970)) (currentBit!6338 (_2!6881 lt!226970)))))))

(declare-fun b!146348 () Bool)

(declare-fun e!97556 () Bool)

(assert (=> b!146348 (= e!97557 e!97556)))

(declare-fun res!122428 () Bool)

(assert (=> b!146348 (=> res!122428 e!97556)))

(assert (=> b!146348 (= res!122428 (= (size!3002 (buf!3447 (_2!6881 lt!226224))) #b00000000000000000000000000000000))))

(declare-fun b!146349 () Bool)

(assert (=> b!146349 (= e!97556 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226970)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (= (and d!46981 res!122426) b!146347))

(assert (= (and b!146347 res!122427) b!146348))

(assert (= (and b!146348 (not res!122428)) b!146349))

(assert (=> b!146347 m!224667))

(assert (=> b!146347 m!225305))

(assert (=> b!146349 m!224667))

(assert (=> b!146349 m!224667))

(declare-fun m!225637 () Bool)

(assert (=> b!146349 m!225637))

(assert (=> b!146189 d!46981))

(declare-fun d!46983 () Bool)

(declare-fun res!122429 () Bool)

(declare-fun e!97559 () Bool)

(assert (=> d!46983 (=> (not res!122429) (not e!97559))))

(assert (=> d!46983 (= res!122429 (= (size!3002 (buf!3447 (_2!6883 lt!226926))) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!46983 (= (isPrefixOf!0 (_2!6883 lt!226926) (_2!6881 lt!226210)) e!97559)))

(declare-fun b!146350 () Bool)

(declare-fun res!122430 () Bool)

(assert (=> b!146350 (=> (not res!122430) (not e!97559))))

(assert (=> b!146350 (= res!122430 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226926))) (currentByte!6343 (_2!6883 lt!226926)) (currentBit!6338 (_2!6883 lt!226926))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146351 () Bool)

(declare-fun e!97558 () Bool)

(assert (=> b!146351 (= e!97559 e!97558)))

(declare-fun res!122431 () Bool)

(assert (=> b!146351 (=> res!122431 e!97558)))

(assert (=> b!146351 (= res!122431 (= (size!3002 (buf!3447 (_2!6883 lt!226926))) #b00000000000000000000000000000000))))

(declare-fun b!146352 () Bool)

(assert (=> b!146352 (= e!97558 (arrayBitRangesEq!0 (buf!3447 (_2!6883 lt!226926)) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226926))) (currentByte!6343 (_2!6883 lt!226926)) (currentBit!6338 (_2!6883 lt!226926)))))))

(assert (= (and d!46983 res!122429) b!146350))

(assert (= (and b!146350 res!122430) b!146351))

(assert (= (and b!146351 (not res!122431)) b!146352))

(assert (=> b!146350 m!225401))

(assert (=> b!146350 m!224683))

(assert (=> b!146352 m!225401))

(assert (=> b!146352 m!225401))

(declare-fun m!225639 () Bool)

(assert (=> b!146352 m!225639))

(assert (=> b!146169 d!46983))

(assert (=> d!46885 d!46893))

(declare-fun d!46985 () Bool)

(declare-fun res!122432 () Bool)

(declare-fun e!97561 () Bool)

(assert (=> d!46985 (=> (not res!122432) (not e!97561))))

(assert (=> d!46985 (= res!122432 (= (size!3002 (buf!3447 (_1!6883 lt!227006))) (size!3002 (buf!3447 (_2!6883 lt!227006)))))))

(assert (=> d!46985 (= (isPrefixOf!0 (_1!6883 lt!227006) (_2!6883 lt!227006)) e!97561)))

(declare-fun b!146353 () Bool)

(declare-fun res!122433 () Bool)

(assert (=> b!146353 (=> (not res!122433) (not e!97561))))

(assert (=> b!146353 (= res!122433 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!227006))) (currentByte!6343 (_1!6883 lt!227006)) (currentBit!6338 (_1!6883 lt!227006))) (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!227006))) (currentByte!6343 (_2!6883 lt!227006)) (currentBit!6338 (_2!6883 lt!227006)))))))

(declare-fun b!146354 () Bool)

(declare-fun e!97560 () Bool)

(assert (=> b!146354 (= e!97561 e!97560)))

(declare-fun res!122434 () Bool)

(assert (=> b!146354 (=> res!122434 e!97560)))

(assert (=> b!146354 (= res!122434 (= (size!3002 (buf!3447 (_1!6883 lt!227006))) #b00000000000000000000000000000000))))

(declare-fun b!146355 () Bool)

(assert (=> b!146355 (= e!97560 (arrayBitRangesEq!0 (buf!3447 (_1!6883 lt!227006)) (buf!3447 (_2!6883 lt!227006)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!227006))) (currentByte!6343 (_1!6883 lt!227006)) (currentBit!6338 (_1!6883 lt!227006)))))))

(assert (= (and d!46985 res!122432) b!146353))

(assert (= (and b!146353 res!122433) b!146354))

(assert (= (and b!146354 (not res!122434)) b!146355))

(declare-fun m!225641 () Bool)

(assert (=> b!146353 m!225641))

(assert (=> b!146353 m!225413))

(assert (=> b!146355 m!225641))

(assert (=> b!146355 m!225641))

(declare-fun m!225643 () Bool)

(assert (=> b!146355 m!225643))

(assert (=> d!46885 d!46985))

(declare-fun d!46987 () Bool)

(assert (=> d!46987 (isPrefixOf!0 lt!227004 lt!227004)))

(declare-fun lt!227248 () Unit!9086)

(assert (=> d!46987 (= lt!227248 (choose!11 lt!227004))))

(assert (=> d!46987 (= (lemmaIsPrefixRefl!0 lt!227004) lt!227248)))

(declare-fun bs!11517 () Bool)

(assert (= bs!11517 d!46987))

(assert (=> bs!11517 m!225343))

(declare-fun m!225645 () Bool)

(assert (=> bs!11517 m!225645))

(assert (=> d!46885 d!46987))

(declare-fun d!46989 () Bool)

(assert (=> d!46989 (isPrefixOf!0 lt!227004 (_2!6881 lt!226224))))

(declare-fun lt!227249 () Unit!9086)

(assert (=> d!46989 (= lt!227249 (choose!30 lt!227004 (_2!6881 lt!226224) (_2!6881 lt!226224)))))

(assert (=> d!46989 (isPrefixOf!0 lt!227004 (_2!6881 lt!226224))))

(assert (=> d!46989 (= (lemmaIsPrefixTransitive!0 lt!227004 (_2!6881 lt!226224) (_2!6881 lt!226224)) lt!227249)))

(declare-fun bs!11518 () Bool)

(assert (= bs!11518 d!46989))

(assert (=> bs!11518 m!225345))

(declare-fun m!225647 () Bool)

(assert (=> bs!11518 m!225647))

(assert (=> bs!11518 m!225345))

(assert (=> d!46885 d!46989))

(assert (=> d!46885 d!46957))

(assert (=> d!46885 d!46967))

(declare-fun d!46991 () Bool)

(assert (=> d!46991 (isPrefixOf!0 lt!227004 (_2!6881 lt!226224))))

(declare-fun lt!227250 () Unit!9086)

(assert (=> d!46991 (= lt!227250 (choose!30 lt!227004 thiss!1634 (_2!6881 lt!226224)))))

(assert (=> d!46991 (isPrefixOf!0 lt!227004 thiss!1634)))

(assert (=> d!46991 (= (lemmaIsPrefixTransitive!0 lt!227004 thiss!1634 (_2!6881 lt!226224)) lt!227250)))

(declare-fun bs!11519 () Bool)

(assert (= bs!11519 d!46991))

(assert (=> bs!11519 m!225345))

(declare-fun m!225649 () Bool)

(assert (=> bs!11519 m!225649))

(declare-fun m!225651 () Bool)

(assert (=> bs!11519 m!225651))

(assert (=> d!46885 d!46991))

(declare-fun d!46993 () Bool)

(declare-fun res!122435 () Bool)

(declare-fun e!97563 () Bool)

(assert (=> d!46993 (=> (not res!122435) (not e!97563))))

(assert (=> d!46993 (= res!122435 (= (size!3002 (buf!3447 lt!227004)) (size!3002 (buf!3447 lt!227004))))))

(assert (=> d!46993 (= (isPrefixOf!0 lt!227004 lt!227004) e!97563)))

(declare-fun b!146356 () Bool)

(declare-fun res!122436 () Bool)

(assert (=> b!146356 (=> (not res!122436) (not e!97563))))

(assert (=> b!146356 (= res!122436 (bvsle (bitIndex!0 (size!3002 (buf!3447 lt!227004)) (currentByte!6343 lt!227004) (currentBit!6338 lt!227004)) (bitIndex!0 (size!3002 (buf!3447 lt!227004)) (currentByte!6343 lt!227004) (currentBit!6338 lt!227004))))))

(declare-fun b!146357 () Bool)

(declare-fun e!97562 () Bool)

(assert (=> b!146357 (= e!97563 e!97562)))

(declare-fun res!122437 () Bool)

(assert (=> b!146357 (=> res!122437 e!97562)))

(assert (=> b!146357 (= res!122437 (= (size!3002 (buf!3447 lt!227004)) #b00000000000000000000000000000000))))

(declare-fun b!146358 () Bool)

(assert (=> b!146358 (= e!97562 (arrayBitRangesEq!0 (buf!3447 lt!227004) (buf!3447 lt!227004) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 lt!227004)) (currentByte!6343 lt!227004) (currentBit!6338 lt!227004))))))

(assert (= (and d!46993 res!122435) b!146356))

(assert (= (and b!146356 res!122436) b!146357))

(assert (= (and b!146357 (not res!122437)) b!146358))

(declare-fun m!225653 () Bool)

(assert (=> b!146356 m!225653))

(assert (=> b!146356 m!225653))

(assert (=> b!146358 m!225653))

(assert (=> b!146358 m!225653))

(declare-fun m!225655 () Bool)

(assert (=> b!146358 m!225655))

(assert (=> d!46885 d!46993))

(assert (=> d!46885 d!46943))

(declare-fun d!46995 () Bool)

(declare-fun res!122438 () Bool)

(declare-fun e!97565 () Bool)

(assert (=> d!46995 (=> (not res!122438) (not e!97565))))

(assert (=> d!46995 (= res!122438 (= (size!3002 (buf!3447 lt!227004)) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (=> d!46995 (= (isPrefixOf!0 lt!227004 (_2!6881 lt!226224)) e!97565)))

(declare-fun b!146359 () Bool)

(declare-fun res!122439 () Bool)

(assert (=> b!146359 (=> (not res!122439) (not e!97565))))

(assert (=> b!146359 (= res!122439 (bvsle (bitIndex!0 (size!3002 (buf!3447 lt!227004)) (currentByte!6343 lt!227004) (currentBit!6338 lt!227004)) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun b!146360 () Bool)

(declare-fun e!97564 () Bool)

(assert (=> b!146360 (= e!97565 e!97564)))

(declare-fun res!122440 () Bool)

(assert (=> b!146360 (=> res!122440 e!97564)))

(assert (=> b!146360 (= res!122440 (= (size!3002 (buf!3447 lt!227004)) #b00000000000000000000000000000000))))

(declare-fun b!146361 () Bool)

(assert (=> b!146361 (= e!97564 (arrayBitRangesEq!0 (buf!3447 lt!227004) (buf!3447 (_2!6881 lt!226224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 lt!227004)) (currentByte!6343 lt!227004) (currentBit!6338 lt!227004))))))

(assert (= (and d!46995 res!122438) b!146359))

(assert (= (and b!146359 res!122439) b!146360))

(assert (= (and b!146360 (not res!122440)) b!146361))

(assert (=> b!146359 m!225653))

(assert (=> b!146359 m!224667))

(assert (=> b!146361 m!225653))

(assert (=> b!146361 m!225653))

(declare-fun m!225657 () Bool)

(assert (=> b!146361 m!225657))

(assert (=> d!46885 d!46995))

(assert (=> d!46885 d!46939))

(declare-fun d!46997 () Bool)

(declare-fun e!97566 () Bool)

(assert (=> d!46997 e!97566))

(declare-fun res!122441 () Bool)

(assert (=> d!46997 (=> (not res!122441) (not e!97566))))

(declare-fun lt!227252 () (_ BitVec 64))

(declare-fun lt!227255 () (_ BitVec 64))

(declare-fun lt!227256 () (_ BitVec 64))

(assert (=> d!46997 (= res!122441 (= lt!227252 (bvsub lt!227255 lt!227256)))))

(assert (=> d!46997 (or (= (bvand lt!227255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227255 lt!227256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46997 (= lt!227256 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226891)))) ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226891))) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226891)))))))

(declare-fun lt!227254 () (_ BitVec 64))

(declare-fun lt!227251 () (_ BitVec 64))

(assert (=> d!46997 (= lt!227255 (bvmul lt!227254 lt!227251))))

(assert (=> d!46997 (or (= lt!227254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227251 (bvsdiv (bvmul lt!227254 lt!227251) lt!227254)))))

(assert (=> d!46997 (= lt!227251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46997 (= lt!227254 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226891)))))))

(assert (=> d!46997 (= lt!227252 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226891))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226891)))))))

(assert (=> d!46997 (invariant!0 (currentBit!6338 (_1!6884 lt!226891)) (currentByte!6343 (_1!6884 lt!226891)) (size!3002 (buf!3447 (_1!6884 lt!226891))))))

(assert (=> d!46997 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226891))) (currentByte!6343 (_1!6884 lt!226891)) (currentBit!6338 (_1!6884 lt!226891))) lt!227252)))

(declare-fun b!146362 () Bool)

(declare-fun res!122442 () Bool)

(assert (=> b!146362 (=> (not res!122442) (not e!97566))))

(assert (=> b!146362 (= res!122442 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227252))))

(declare-fun b!146363 () Bool)

(declare-fun lt!227253 () (_ BitVec 64))

(assert (=> b!146363 (= e!97566 (bvsle lt!227252 (bvmul lt!227253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146363 (or (= lt!227253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227253)))))

(assert (=> b!146363 (= lt!227253 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226891)))))))

(assert (= (and d!46997 res!122441) b!146362))

(assert (= (and b!146362 res!122442) b!146363))

(declare-fun m!225659 () Bool)

(assert (=> d!46997 m!225659))

(declare-fun m!225661 () Bool)

(assert (=> d!46997 m!225661))

(assert (=> d!46834 d!46997))

(declare-fun d!46999 () Bool)

(declare-fun e!97569 () Bool)

(assert (=> d!46999 e!97569))

(declare-fun res!122445 () Bool)

(assert (=> d!46999 (=> (not res!122445) (not e!97569))))

(declare-fun lt!227261 () tuple2!13070)

(declare-fun lt!227262 () tuple2!13070)

(assert (=> d!46999 (= res!122445 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!227261))) (currentByte!6343 (_1!6884 lt!227261)) (currentBit!6338 (_1!6884 lt!227261))) (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!227262))) (currentByte!6343 (_1!6884 lt!227262)) (currentBit!6338 (_1!6884 lt!227262)))))))

(assert (=> d!46999 (= lt!227262 (readBytePure!0 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 lt!226222) (currentBit!6338 lt!226222))))))

(assert (=> d!46999 (= lt!227261 (readBytePure!0 lt!226222))))

(assert (=> d!46999 true))

(declare-fun _$8!81 () Unit!9086)

(assert (=> d!46999 (= (choose!14 lt!226222 (_2!6881 lt!226210) lt!226888 lt!226891 (tuple2!13071 (_1!6884 lt!226891) (_2!6884 lt!226891)) (_1!6884 lt!226891) (_2!6884 lt!226891) lt!226890 (tuple2!13071 (_1!6884 lt!226890) (_2!6884 lt!226890)) (_1!6884 lt!226890) (_2!6884 lt!226890)) _$8!81)))

(declare-fun b!146366 () Bool)

(assert (=> b!146366 (= e!97569 (= (_2!6884 lt!227261) (_2!6884 lt!227262)))))

(assert (= (and d!46999 res!122445) b!146366))

(declare-fun m!225663 () Bool)

(assert (=> d!46999 m!225663))

(declare-fun m!225665 () Bool)

(assert (=> d!46999 m!225665))

(declare-fun m!225667 () Bool)

(assert (=> d!46999 m!225667))

(assert (=> d!46999 m!224617))

(assert (=> d!46834 d!46999))

(declare-fun d!47001 () Bool)

(declare-fun e!97570 () Bool)

(assert (=> d!47001 e!97570))

(declare-fun res!122446 () Bool)

(assert (=> d!47001 (=> (not res!122446) (not e!97570))))

(declare-fun lt!227268 () (_ BitVec 64))

(declare-fun lt!227264 () (_ BitVec 64))

(declare-fun lt!227267 () (_ BitVec 64))

(assert (=> d!47001 (= res!122446 (= lt!227264 (bvsub lt!227267 lt!227268)))))

(assert (=> d!47001 (or (= (bvand lt!227267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227268 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227267 lt!227268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47001 (= lt!227268 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226890)))) ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226890))) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226890)))))))

(declare-fun lt!227266 () (_ BitVec 64))

(declare-fun lt!227263 () (_ BitVec 64))

(assert (=> d!47001 (= lt!227267 (bvmul lt!227266 lt!227263))))

(assert (=> d!47001 (or (= lt!227266 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227263 (bvsdiv (bvmul lt!227266 lt!227263) lt!227266)))))

(assert (=> d!47001 (= lt!227263 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47001 (= lt!227266 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226890)))))))

(assert (=> d!47001 (= lt!227264 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226890))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226890)))))))

(assert (=> d!47001 (invariant!0 (currentBit!6338 (_1!6884 lt!226890)) (currentByte!6343 (_1!6884 lt!226890)) (size!3002 (buf!3447 (_1!6884 lt!226890))))))

(assert (=> d!47001 (= (bitIndex!0 (size!3002 (buf!3447 (_1!6884 lt!226890))) (currentByte!6343 (_1!6884 lt!226890)) (currentBit!6338 (_1!6884 lt!226890))) lt!227264)))

(declare-fun b!146367 () Bool)

(declare-fun res!122447 () Bool)

(assert (=> b!146367 (=> (not res!122447) (not e!97570))))

(assert (=> b!146367 (= res!122447 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227264))))

(declare-fun b!146368 () Bool)

(declare-fun lt!227265 () (_ BitVec 64))

(assert (=> b!146368 (= e!97570 (bvsle lt!227264 (bvmul lt!227265 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146368 (or (= lt!227265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227265)))))

(assert (=> b!146368 (= lt!227265 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226890)))))))

(assert (= (and d!47001 res!122446) b!146367))

(assert (= (and b!146367 res!122447) b!146368))

(declare-fun m!225669 () Bool)

(assert (=> d!47001 m!225669))

(declare-fun m!225671 () Bool)

(assert (=> d!47001 m!225671))

(assert (=> d!46834 d!47001))

(declare-fun d!47003 () Bool)

(declare-fun lt!227269 () tuple2!13084)

(assert (=> d!47003 (= lt!227269 (readByte!0 lt!226888))))

(assert (=> d!47003 (= (readBytePure!0 lt!226888) (tuple2!13071 (_2!6893 lt!227269) (_1!6893 lt!227269)))))

(declare-fun bs!11520 () Bool)

(assert (= bs!11520 d!47003))

(declare-fun m!225673 () Bool)

(assert (=> bs!11520 m!225673))

(assert (=> d!46834 d!47003))

(assert (=> d!46834 d!46875))

(declare-fun d!47005 () Bool)

(declare-fun e!97571 () Bool)

(assert (=> d!47005 e!97571))

(declare-fun res!122448 () Bool)

(assert (=> d!47005 (=> (not res!122448) (not e!97571))))

(declare-fun lt!227271 () (_ BitVec 64))

(declare-fun lt!227274 () (_ BitVec 64))

(declare-fun lt!227275 () (_ BitVec 64))

(assert (=> d!47005 (= res!122448 (= lt!227271 (bvsub lt!227274 lt!227275)))))

(assert (=> d!47005 (or (= (bvand lt!227274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227274 lt!227275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47005 (= lt!227275 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226970))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226970)))))))

(declare-fun lt!227273 () (_ BitVec 64))

(declare-fun lt!227270 () (_ BitVec 64))

(assert (=> d!47005 (= lt!227274 (bvmul lt!227273 lt!227270))))

(assert (=> d!47005 (or (= lt!227273 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227270 (bvsdiv (bvmul lt!227273 lt!227270) lt!227273)))))

(assert (=> d!47005 (= lt!227270 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47005 (= lt!227273 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))))))

(assert (=> d!47005 (= lt!227271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226970))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226970)))))))

(assert (=> d!47005 (invariant!0 (currentBit!6338 (_2!6881 lt!226970)) (currentByte!6343 (_2!6881 lt!226970)) (size!3002 (buf!3447 (_2!6881 lt!226970))))))

(assert (=> d!47005 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226970))) (currentByte!6343 (_2!6881 lt!226970)) (currentBit!6338 (_2!6881 lt!226970))) lt!227271)))

(declare-fun b!146369 () Bool)

(declare-fun res!122449 () Bool)

(assert (=> b!146369 (=> (not res!122449) (not e!97571))))

(assert (=> b!146369 (= res!122449 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227271))))

(declare-fun b!146370 () Bool)

(declare-fun lt!227272 () (_ BitVec 64))

(assert (=> b!146370 (= e!97571 (bvsle lt!227271 (bvmul lt!227272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146370 (or (= lt!227272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227272)))))

(assert (=> b!146370 (= lt!227272 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))))))

(assert (= (and d!47005 res!122448) b!146369))

(assert (= (and b!146369 res!122449) b!146370))

(declare-fun m!225675 () Bool)

(assert (=> d!47005 m!225675))

(declare-fun m!225677 () Bool)

(assert (=> d!47005 m!225677))

(assert (=> b!146187 d!47005))

(assert (=> b!146187 d!46822))

(declare-fun lt!227284 () tuple2!13084)

(declare-fun bm!1909 () Bool)

(declare-fun call!1913 () Bool)

(declare-fun c!7925 () Bool)

(assert (=> bm!1909 (= call!1913 (arrayRangesEq!318 arr!237 (ite c!7925 (array!6632 (store (arr!3741 arr!237) from!447 (_1!6893 lt!227284)) (size!3002 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7925 from!447 (size!3002 arr!237))))))

(declare-fun b!146371 () Bool)

(declare-fun res!122452 () Bool)

(declare-fun e!97574 () Bool)

(assert (=> b!146371 (=> (not res!122452) (not e!97574))))

(declare-fun lt!227290 () tuple3!568)

(assert (=> b!146371 (= res!122452 (and (= (buf!3447 (_1!6883 lt!226207)) (buf!3447 (_2!6894 lt!227290))) (= (size!3002 arr!237) (size!3002 (_3!351 lt!227290)))))))

(declare-fun b!146372 () Bool)

(assert (=> b!146372 (= e!97574 (arrayRangesEq!318 arr!237 (_3!351 lt!227290) #b00000000000000000000000000000000 from!447))))

(declare-fun d!47007 () Bool)

(declare-fun e!97572 () Bool)

(assert (=> d!47007 e!97572))

(declare-fun res!122451 () Bool)

(assert (=> d!47007 (=> res!122451 e!97572)))

(assert (=> d!47007 (= res!122451 (bvsge from!447 to!404))))

(declare-fun lt!227297 () Bool)

(assert (=> d!47007 (= lt!227297 e!97574)))

(declare-fun res!122450 () Bool)

(assert (=> d!47007 (=> (not res!122450) (not e!97574))))

(declare-fun lt!227276 () (_ BitVec 64))

(declare-fun lt!227298 () (_ BitVec 64))

(assert (=> d!47007 (= res!122450 (= (bvadd lt!227298 lt!227276) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227290))) (currentByte!6343 (_2!6894 lt!227290)) (currentBit!6338 (_2!6894 lt!227290)))))))

(assert (=> d!47007 (or (not (= (bvand lt!227298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227276 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227298 lt!227276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227303 () (_ BitVec 64))

(assert (=> d!47007 (= lt!227276 (bvmul lt!227303 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47007 (or (= lt!227303 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227303 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227303)))))

(assert (=> d!47007 (= lt!227303 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!47007 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!47007 (= lt!227298 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226207))) (currentByte!6343 (_1!6883 lt!226207)) (currentBit!6338 (_1!6883 lt!226207))))))

(declare-fun e!97573 () tuple3!568)

(assert (=> d!47007 (= lt!227290 e!97573)))

(assert (=> d!47007 (= c!7925 (bvslt from!447 to!404))))

(assert (=> d!47007 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3002 arr!237)))))

(assert (=> d!47007 (= (readByteArrayLoop!0 (_1!6883 lt!226207) arr!237 from!447 to!404) lt!227290)))

(declare-fun call!1912 () Bool)

(declare-fun lt!227308 () (_ BitVec 32))

(declare-fun lt!227279 () array!6631)

(declare-fun lt!227304 () tuple3!568)

(declare-fun lt!227287 () array!6631)

(declare-fun lt!227296 () (_ BitVec 32))

(declare-fun lt!227311 () (_ BitVec 32))

(declare-fun bm!1910 () Bool)

(assert (=> bm!1910 (= call!1912 (arrayRangesEq!318 (ite c!7925 arr!237 lt!227279) (ite c!7925 (_3!351 lt!227304) lt!227287) (ite c!7925 lt!227308 lt!227311) (ite c!7925 from!447 lt!227296)))))

(declare-fun b!146373 () Bool)

(declare-fun lt!227293 () Unit!9086)

(assert (=> b!146373 (= e!97573 (tuple3!569 lt!227293 (_2!6894 lt!227304) (_3!351 lt!227304)))))

(assert (=> b!146373 (= lt!227284 (readByte!0 (_1!6883 lt!226207)))))

(declare-fun lt!227289 () array!6631)

(assert (=> b!146373 (= lt!227289 (array!6632 (store (arr!3741 arr!237) from!447 (_1!6893 lt!227284)) (size!3002 arr!237)))))

(declare-fun lt!227278 () (_ BitVec 64))

(assert (=> b!146373 (= lt!227278 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227288 () (_ BitVec 32))

(assert (=> b!146373 (= lt!227288 (bvsub to!404 from!447))))

(declare-fun lt!227307 () Unit!9086)

(assert (=> b!146373 (= lt!227307 (validateOffsetBytesFromBitIndexLemma!0 (_1!6883 lt!226207) (_2!6893 lt!227284) lt!227278 lt!227288))))

(assert (=> b!146373 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6893 lt!227284)))) ((_ sign_extend 32) (currentByte!6343 (_2!6893 lt!227284))) ((_ sign_extend 32) (currentBit!6338 (_2!6893 lt!227284))) (bvsub lt!227288 ((_ extract 31 0) (bvsdiv (bvadd lt!227278 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227283 () Unit!9086)

(assert (=> b!146373 (= lt!227283 lt!227307)))

(assert (=> b!146373 (= lt!227304 (readByteArrayLoop!0 (_2!6893 lt!227284) lt!227289 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1914 () (_ BitVec 64))

(assert (=> b!146373 (= call!1914 (bvadd (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226207))) (currentByte!6343 (_1!6883 lt!226207)) (currentBit!6338 (_1!6883 lt!226207))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227280 () Unit!9086)

(declare-fun Unit!9126 () Unit!9086)

(assert (=> b!146373 (= lt!227280 Unit!9126)))

(assert (=> b!146373 (= (bvadd call!1914 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227304))) (currentByte!6343 (_2!6894 lt!227304)) (currentBit!6338 (_2!6894 lt!227304))))))

(declare-fun lt!227277 () Unit!9086)

(declare-fun Unit!9127 () Unit!9086)

(assert (=> b!146373 (= lt!227277 Unit!9127)))

(assert (=> b!146373 (= (bvadd (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226207))) (currentByte!6343 (_1!6883 lt!226207)) (currentBit!6338 (_1!6883 lt!226207))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227304))) (currentByte!6343 (_2!6894 lt!227304)) (currentBit!6338 (_2!6894 lt!227304))))))

(declare-fun lt!227306 () Unit!9086)

(declare-fun Unit!9128 () Unit!9086)

(assert (=> b!146373 (= lt!227306 Unit!9128)))

(assert (=> b!146373 (and (= (buf!3447 (_1!6883 lt!226207)) (buf!3447 (_2!6894 lt!227304))) (= (size!3002 arr!237) (size!3002 (_3!351 lt!227304))))))

(declare-fun lt!227302 () Unit!9086)

(declare-fun Unit!9129 () Unit!9086)

(assert (=> b!146373 (= lt!227302 Unit!9129)))

(declare-fun lt!227299 () Unit!9086)

(assert (=> b!146373 (= lt!227299 (arrayUpdatedAtPrefixLemma!10 arr!237 from!447 (_1!6893 lt!227284)))))

(assert (=> b!146373 call!1913))

(declare-fun lt!227291 () Unit!9086)

(assert (=> b!146373 (= lt!227291 lt!227299)))

(assert (=> b!146373 (= lt!227308 #b00000000000000000000000000000000)))

(declare-fun lt!227282 () Unit!9086)

(assert (=> b!146373 (= lt!227282 (arrayRangesEqTransitive!50 arr!237 lt!227289 (_3!351 lt!227304) lt!227308 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146373 call!1912))

(declare-fun lt!227292 () Unit!9086)

(assert (=> b!146373 (= lt!227292 lt!227282)))

(assert (=> b!146373 (arrayRangesEq!318 arr!237 (_3!351 lt!227304) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!227305 () Unit!9086)

(declare-fun Unit!9130 () Unit!9086)

(assert (=> b!146373 (= lt!227305 Unit!9130)))

(declare-fun lt!227294 () Unit!9086)

(assert (=> b!146373 (= lt!227294 (arrayRangesEqImpliesEq!10 lt!227289 (_3!351 lt!227304) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146373 (= (select (store (arr!3741 arr!237) from!447 (_1!6893 lt!227284)) from!447) (select (arr!3741 (_3!351 lt!227304)) from!447))))

(declare-fun lt!227309 () Unit!9086)

(assert (=> b!146373 (= lt!227309 lt!227294)))

(declare-fun lt!227295 () Bool)

(assert (=> b!146373 (= lt!227295 (= (select (arr!3741 (_3!351 lt!227304)) from!447) (_1!6893 lt!227284)))))

(declare-fun Unit!9131 () Unit!9086)

(assert (=> b!146373 (= lt!227293 Unit!9131)))

(assert (=> b!146373 lt!227295))

(declare-fun lt!227310 () Unit!9086)

(declare-fun b!146374 () Bool)

(assert (=> b!146374 (= e!97573 (tuple3!569 lt!227310 (_1!6883 lt!226207) arr!237))))

(assert (=> b!146374 (= call!1914 call!1914)))

(declare-fun lt!227281 () Unit!9086)

(declare-fun Unit!9132 () Unit!9086)

(assert (=> b!146374 (= lt!227281 Unit!9132)))

(declare-fun lt!227285 () Unit!9086)

(assert (=> b!146374 (= lt!227285 (arrayRangesEqReflexiveLemma!10 arr!237))))

(assert (=> b!146374 call!1913))

(declare-fun lt!227301 () Unit!9086)

(assert (=> b!146374 (= lt!227301 lt!227285)))

(assert (=> b!146374 (= lt!227279 arr!237)))

(assert (=> b!146374 (= lt!227287 arr!237)))

(declare-fun lt!227286 () (_ BitVec 32))

(assert (=> b!146374 (= lt!227286 #b00000000000000000000000000000000)))

(declare-fun lt!227300 () (_ BitVec 32))

(assert (=> b!146374 (= lt!227300 (size!3002 arr!237))))

(assert (=> b!146374 (= lt!227311 #b00000000000000000000000000000000)))

(assert (=> b!146374 (= lt!227296 from!447)))

(assert (=> b!146374 (= lt!227310 (arrayRangesEqSlicedLemma!10 lt!227279 lt!227287 lt!227286 lt!227300 lt!227311 lt!227296))))

(assert (=> b!146374 call!1912))

(declare-fun bm!1911 () Bool)

(assert (=> bm!1911 (= call!1914 (bitIndex!0 (ite c!7925 (size!3002 (buf!3447 (_2!6893 lt!227284))) (size!3002 (buf!3447 (_1!6883 lt!226207)))) (ite c!7925 (currentByte!6343 (_2!6893 lt!227284)) (currentByte!6343 (_1!6883 lt!226207))) (ite c!7925 (currentBit!6338 (_2!6893 lt!227284)) (currentBit!6338 (_1!6883 lt!226207)))))))

(declare-fun b!146375 () Bool)

(assert (=> b!146375 (= e!97572 (= (select (arr!3741 (_3!351 lt!227290)) from!447) (_2!6884 (readBytePure!0 (_1!6883 lt!226207)))))))

(assert (=> b!146375 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3002 (_3!351 lt!227290))))))

(assert (= (and d!47007 c!7925) b!146373))

(assert (= (and d!47007 (not c!7925)) b!146374))

(assert (= (or b!146373 b!146374) bm!1910))

(assert (= (or b!146373 b!146374) bm!1909))

(assert (= (or b!146373 b!146374) bm!1911))

(assert (= (and d!47007 res!122450) b!146371))

(assert (= (and b!146371 res!122452) b!146372))

(assert (= (and d!47007 (not res!122451)) b!146375))

(declare-fun m!225679 () Bool)

(assert (=> bm!1910 m!225679))

(declare-fun m!225681 () Bool)

(assert (=> b!146372 m!225681))

(declare-fun m!225683 () Bool)

(assert (=> b!146373 m!225683))

(assert (=> b!146373 m!225427))

(declare-fun m!225685 () Bool)

(assert (=> b!146373 m!225685))

(assert (=> b!146373 m!225235))

(declare-fun m!225687 () Bool)

(assert (=> b!146373 m!225687))

(declare-fun m!225689 () Bool)

(assert (=> b!146373 m!225689))

(declare-fun m!225691 () Bool)

(assert (=> b!146373 m!225691))

(declare-fun m!225693 () Bool)

(assert (=> b!146373 m!225693))

(declare-fun m!225695 () Bool)

(assert (=> b!146373 m!225695))

(declare-fun m!225697 () Bool)

(assert (=> b!146373 m!225697))

(declare-fun m!225699 () Bool)

(assert (=> b!146373 m!225699))

(declare-fun m!225701 () Bool)

(assert (=> b!146373 m!225701))

(declare-fun m!225703 () Bool)

(assert (=> b!146373 m!225703))

(declare-fun m!225705 () Bool)

(assert (=> b!146375 m!225705))

(assert (=> b!146375 m!224653))

(declare-fun m!225707 () Bool)

(assert (=> bm!1911 m!225707))

(declare-fun m!225709 () Bool)

(assert (=> d!47007 m!225709))

(assert (=> d!47007 m!225427))

(assert (=> bm!1909 m!225691))

(declare-fun m!225711 () Bool)

(assert (=> bm!1909 m!225711))

(assert (=> b!146374 m!225477))

(declare-fun m!225713 () Bool)

(assert (=> b!146374 m!225713))

(assert (=> d!46865 d!47007))

(declare-fun lt!227312 () tuple3!568)

(declare-fun d!47009 () Bool)

(assert (=> d!47009 (= lt!227312 (readByteArrayLoop!0 (_1!6883 lt!226975) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47009 (= (readByteArrayLoopPure!0 (_1!6883 lt!226975) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13067 (_2!6894 lt!227312) (_3!351 lt!227312)))))

(declare-fun bs!11521 () Bool)

(assert (= bs!11521 d!47009))

(declare-fun m!225715 () Bool)

(assert (=> bs!11521 m!225715))

(assert (=> b!146190 d!47009))

(declare-fun d!47011 () Bool)

(assert (=> d!47011 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226971) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) lt!226971))))

(declare-fun bs!11522 () Bool)

(assert (= bs!11522 d!47011))

(declare-fun m!225717 () Bool)

(assert (=> bs!11522 m!225717))

(assert (=> b!146190 d!47011))

(declare-fun d!47013 () Bool)

(assert (=> d!47013 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226970)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226971)))

(declare-fun lt!227313 () Unit!9086)

(assert (=> d!47013 (= lt!227313 (choose!9 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226970)) lt!226971 (BitStream!5263 (buf!3447 (_2!6881 lt!226970)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(assert (=> d!47013 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226970)) lt!226971) lt!227313)))

(declare-fun bs!11523 () Bool)

(assert (= bs!11523 d!47013))

(assert (=> bs!11523 m!225311))

(declare-fun m!225719 () Bool)

(assert (=> bs!11523 m!225719))

(assert (=> b!146190 d!47013))

(declare-fun b!146376 () Bool)

(declare-fun res!122453 () Bool)

(declare-fun e!97576 () Bool)

(assert (=> b!146376 (=> (not res!122453) (not e!97576))))

(declare-fun lt!227323 () tuple2!13068)

(assert (=> b!146376 (= res!122453 (isPrefixOf!0 (_2!6883 lt!227323) (_2!6881 lt!226970)))))

(declare-fun b!146377 () Bool)

(declare-fun res!122455 () Bool)

(assert (=> b!146377 (=> (not res!122455) (not e!97576))))

(assert (=> b!146377 (= res!122455 (isPrefixOf!0 (_1!6883 lt!227323) (_2!6881 lt!226224)))))

(declare-fun lt!227315 () (_ BitVec 64))

(declare-fun b!146378 () Bool)

(declare-fun lt!227324 () (_ BitVec 64))

(assert (=> b!146378 (= e!97576 (= (_1!6883 lt!227323) (withMovedBitIndex!0 (_2!6883 lt!227323) (bvsub lt!227315 lt!227324))))))

(assert (=> b!146378 (or (= (bvand lt!227315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227315 lt!227324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146378 (= lt!227324 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226970))) (currentByte!6343 (_2!6881 lt!226970)) (currentBit!6338 (_2!6881 lt!226970))))))

(assert (=> b!146378 (= lt!227315 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(declare-fun b!146379 () Bool)

(declare-fun e!97575 () Unit!9086)

(declare-fun lt!227330 () Unit!9086)

(assert (=> b!146379 (= e!97575 lt!227330)))

(declare-fun lt!227319 () (_ BitVec 64))

(assert (=> b!146379 (= lt!227319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!227317 () (_ BitVec 64))

(assert (=> b!146379 (= lt!227317 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(assert (=> b!146379 (= lt!227330 (arrayBitRangesEqSymmetric!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226970)) lt!227319 lt!227317))))

(assert (=> b!146379 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226970)) (buf!3447 (_2!6881 lt!226224)) lt!227319 lt!227317)))

(declare-fun d!47015 () Bool)

(assert (=> d!47015 e!97576))

(declare-fun res!122454 () Bool)

(assert (=> d!47015 (=> (not res!122454) (not e!97576))))

(assert (=> d!47015 (= res!122454 (isPrefixOf!0 (_1!6883 lt!227323) (_2!6883 lt!227323)))))

(declare-fun lt!227321 () BitStream!5262)

(assert (=> d!47015 (= lt!227323 (tuple2!13069 lt!227321 (_2!6881 lt!226970)))))

(declare-fun lt!227316 () Unit!9086)

(declare-fun lt!227332 () Unit!9086)

(assert (=> d!47015 (= lt!227316 lt!227332)))

(assert (=> d!47015 (isPrefixOf!0 lt!227321 (_2!6881 lt!226970))))

(assert (=> d!47015 (= lt!227332 (lemmaIsPrefixTransitive!0 lt!227321 (_2!6881 lt!226970) (_2!6881 lt!226970)))))

(declare-fun lt!227314 () Unit!9086)

(declare-fun lt!227326 () Unit!9086)

(assert (=> d!47015 (= lt!227314 lt!227326)))

(assert (=> d!47015 (isPrefixOf!0 lt!227321 (_2!6881 lt!226970))))

(assert (=> d!47015 (= lt!227326 (lemmaIsPrefixTransitive!0 lt!227321 (_2!6881 lt!226224) (_2!6881 lt!226970)))))

(declare-fun lt!227333 () Unit!9086)

(assert (=> d!47015 (= lt!227333 e!97575)))

(declare-fun c!7926 () Bool)

(assert (=> d!47015 (= c!7926 (not (= (size!3002 (buf!3447 (_2!6881 lt!226224))) #b00000000000000000000000000000000)))))

(declare-fun lt!227322 () Unit!9086)

(declare-fun lt!227327 () Unit!9086)

(assert (=> d!47015 (= lt!227322 lt!227327)))

(assert (=> d!47015 (isPrefixOf!0 (_2!6881 lt!226970) (_2!6881 lt!226970))))

(assert (=> d!47015 (= lt!227327 (lemmaIsPrefixRefl!0 (_2!6881 lt!226970)))))

(declare-fun lt!227318 () Unit!9086)

(declare-fun lt!227331 () Unit!9086)

(assert (=> d!47015 (= lt!227318 lt!227331)))

(assert (=> d!47015 (= lt!227331 (lemmaIsPrefixRefl!0 (_2!6881 lt!226970)))))

(declare-fun lt!227320 () Unit!9086)

(declare-fun lt!227328 () Unit!9086)

(assert (=> d!47015 (= lt!227320 lt!227328)))

(assert (=> d!47015 (isPrefixOf!0 lt!227321 lt!227321)))

(assert (=> d!47015 (= lt!227328 (lemmaIsPrefixRefl!0 lt!227321))))

(declare-fun lt!227329 () Unit!9086)

(declare-fun lt!227325 () Unit!9086)

(assert (=> d!47015 (= lt!227329 lt!227325)))

(assert (=> d!47015 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226224))))

(assert (=> d!47015 (= lt!227325 (lemmaIsPrefixRefl!0 (_2!6881 lt!226224)))))

(assert (=> d!47015 (= lt!227321 (BitStream!5263 (buf!3447 (_2!6881 lt!226970)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224))))))

(assert (=> d!47015 (isPrefixOf!0 (_2!6881 lt!226224) (_2!6881 lt!226970))))

(assert (=> d!47015 (= (reader!0 (_2!6881 lt!226224) (_2!6881 lt!226970)) lt!227323)))

(declare-fun b!146380 () Bool)

(declare-fun Unit!9133 () Unit!9086)

(assert (=> b!146380 (= e!97575 Unit!9133)))

(assert (= (and d!47015 c!7926) b!146379))

(assert (= (and d!47015 (not c!7926)) b!146380))

(assert (= (and d!47015 res!122454) b!146377))

(assert (= (and b!146377 res!122455) b!146376))

(assert (= (and b!146376 res!122453) b!146378))

(declare-fun m!225721 () Bool)

(assert (=> d!47015 m!225721))

(assert (=> d!47015 m!225261))

(declare-fun m!225723 () Bool)

(assert (=> d!47015 m!225723))

(declare-fun m!225725 () Bool)

(assert (=> d!47015 m!225725))

(assert (=> d!47015 m!225299))

(declare-fun m!225727 () Bool)

(assert (=> d!47015 m!225727))

(assert (=> d!47015 m!225269))

(declare-fun m!225729 () Bool)

(assert (=> d!47015 m!225729))

(declare-fun m!225731 () Bool)

(assert (=> d!47015 m!225731))

(declare-fun m!225733 () Bool)

(assert (=> d!47015 m!225733))

(declare-fun m!225735 () Bool)

(assert (=> d!47015 m!225735))

(assert (=> b!146379 m!224667))

(declare-fun m!225737 () Bool)

(assert (=> b!146379 m!225737))

(declare-fun m!225739 () Bool)

(assert (=> b!146379 m!225739))

(declare-fun m!225741 () Bool)

(assert (=> b!146377 m!225741))

(declare-fun m!225743 () Bool)

(assert (=> b!146378 m!225743))

(assert (=> b!146378 m!225305))

(assert (=> b!146378 m!224667))

(declare-fun m!225745 () Bool)

(assert (=> b!146376 m!225745))

(assert (=> b!146190 d!47015))

(assert (=> b!146172 d!46822))

(declare-fun d!47017 () Bool)

(assert (=> d!47017 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 (_2!6881 lt!226224)) lt!226922 lt!226920)))

(declare-fun lt!227334 () Unit!9086)

(assert (=> d!47017 (= lt!227334 (choose!8 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226210)) lt!226922 lt!226920))))

(assert (=> d!47017 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226922) (bvsle lt!226922 lt!226920))))

(assert (=> d!47017 (= (arrayBitRangesEqSymmetric!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 (_2!6881 lt!226210)) lt!226922 lt!226920) lt!227334)))

(declare-fun bs!11524 () Bool)

(assert (= bs!11524 d!47017))

(assert (=> bs!11524 m!225279))

(declare-fun m!225747 () Bool)

(assert (=> bs!11524 m!225747))

(assert (=> b!146172 d!47017))

(declare-fun b!146381 () Bool)

(declare-fun e!97577 () Bool)

(declare-fun call!1915 () Bool)

(assert (=> b!146381 (= e!97577 call!1915)))

(declare-fun b!146382 () Bool)

(declare-fun res!122459 () Bool)

(declare-fun lt!227337 () (_ BitVec 32))

(assert (=> b!146382 (= res!122459 (= lt!227337 #b00000000000000000000000000000000))))

(declare-fun e!97580 () Bool)

(assert (=> b!146382 (=> res!122459 e!97580)))

(declare-fun e!97578 () Bool)

(assert (=> b!146382 (= e!97578 e!97580)))

(declare-fun d!47019 () Bool)

(declare-fun res!122458 () Bool)

(declare-fun e!97581 () Bool)

(assert (=> d!47019 (=> res!122458 e!97581)))

(assert (=> d!47019 (= res!122458 (bvsge lt!226922 lt!226920))))

(assert (=> d!47019 (= (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226210)) (buf!3447 (_2!6881 lt!226224)) lt!226922 lt!226920) e!97581)))

(declare-fun lt!227336 () (_ BitVec 32))

(declare-fun lt!227335 () tuple4!134)

(declare-fun c!7927 () Bool)

(declare-fun bm!1912 () Bool)

(assert (=> bm!1912 (= call!1915 (byteRangesEq!0 (ite c!7927 (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227335)) (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_4!67 lt!227335))) (ite c!7927 (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227335)) (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_4!67 lt!227335))) (ite c!7927 lt!227336 #b00000000000000000000000000000000) lt!227337))))

(declare-fun b!146383 () Bool)

(declare-fun e!97579 () Bool)

(assert (=> b!146383 (= e!97579 e!97577)))

(assert (=> b!146383 (= c!7927 (= (_3!352 lt!227335) (_4!67 lt!227335)))))

(declare-fun b!146384 () Bool)

(assert (=> b!146384 (= e!97581 e!97579)))

(declare-fun res!122456 () Bool)

(assert (=> b!146384 (=> (not res!122456) (not e!97579))))

(declare-fun e!97582 () Bool)

(assert (=> b!146384 (= res!122456 e!97582)))

(declare-fun res!122457 () Bool)

(assert (=> b!146384 (=> res!122457 e!97582)))

(assert (=> b!146384 (= res!122457 (bvsge (_1!6895 lt!227335) (_2!6895 lt!227335)))))

(assert (=> b!146384 (= lt!227337 ((_ extract 31 0) (bvsrem lt!226920 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146384 (= lt!227336 ((_ extract 31 0) (bvsrem lt!226922 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146384 (= lt!227335 (arrayBitIndices!0 lt!226922 lt!226920))))

(declare-fun b!146385 () Bool)

(assert (=> b!146385 (= e!97577 e!97578)))

(declare-fun res!122460 () Bool)

(assert (=> b!146385 (= res!122460 (byteRangesEq!0 (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227335)) (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227335)) lt!227336 #b00000000000000000000000000001000))))

(assert (=> b!146385 (=> (not res!122460) (not e!97578))))

(declare-fun b!146386 () Bool)

(assert (=> b!146386 (= e!97580 call!1915)))

(declare-fun b!146387 () Bool)

(assert (=> b!146387 (= e!97582 (arrayRangesEq!318 (buf!3447 (_2!6881 lt!226210)) (buf!3447 (_2!6881 lt!226224)) (_1!6895 lt!227335) (_2!6895 lt!227335)))))

(assert (= (and d!47019 (not res!122458)) b!146384))

(assert (= (and b!146384 (not res!122457)) b!146387))

(assert (= (and b!146384 res!122456) b!146383))

(assert (= (and b!146383 c!7927) b!146381))

(assert (= (and b!146383 (not c!7927)) b!146385))

(assert (= (and b!146385 res!122460) b!146382))

(assert (= (and b!146382 (not res!122459)) b!146386))

(assert (= (or b!146381 b!146386) bm!1912))

(declare-fun m!225749 () Bool)

(assert (=> bm!1912 m!225749))

(declare-fun m!225751 () Bool)

(assert (=> bm!1912 m!225751))

(declare-fun m!225753 () Bool)

(assert (=> bm!1912 m!225753))

(declare-fun m!225755 () Bool)

(assert (=> bm!1912 m!225755))

(declare-fun m!225757 () Bool)

(assert (=> bm!1912 m!225757))

(declare-fun m!225759 () Bool)

(assert (=> b!146384 m!225759))

(assert (=> b!146385 m!225757))

(assert (=> b!146385 m!225749))

(assert (=> b!146385 m!225757))

(assert (=> b!146385 m!225749))

(declare-fun m!225761 () Bool)

(assert (=> b!146385 m!225761))

(declare-fun m!225763 () Bool)

(assert (=> b!146387 m!225763))

(assert (=> b!146172 d!47019))

(declare-fun d!47021 () Bool)

(declare-fun e!97583 () Bool)

(assert (=> d!47021 e!97583))

(declare-fun res!122461 () Bool)

(assert (=> d!47021 (=> (not res!122461) (not e!97583))))

(declare-fun lt!227339 () (_ BitVec 64))

(declare-fun lt!227338 () BitStream!5262)

(assert (=> d!47021 (= res!122461 (= (bvadd lt!227339 (bvsub lt!226861 lt!226870)) (bitIndex!0 (size!3002 (buf!3447 lt!227338)) (currentByte!6343 lt!227338) (currentBit!6338 lt!227338))))))

(assert (=> d!47021 (or (not (= (bvand lt!227339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226861 lt!226870) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227339 (bvsub lt!226861 lt!226870)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47021 (= lt!227339 (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226869))) (currentByte!6343 (_2!6883 lt!226869)) (currentBit!6338 (_2!6883 lt!226869))))))

(assert (=> d!47021 (= lt!227338 (_2!6881 (moveBitIndex!0 (_2!6883 lt!226869) (bvsub lt!226861 lt!226870))))))

(assert (=> d!47021 (moveBitIndexPrecond!0 (_2!6883 lt!226869) (bvsub lt!226861 lt!226870))))

(assert (=> d!47021 (= (withMovedBitIndex!0 (_2!6883 lt!226869) (bvsub lt!226861 lt!226870)) lt!227338)))

(declare-fun b!146388 () Bool)

(assert (=> b!146388 (= e!97583 (= (size!3002 (buf!3447 (_2!6883 lt!226869))) (size!3002 (buf!3447 lt!227338))))))

(assert (= (and d!47021 res!122461) b!146388))

(declare-fun m!225765 () Bool)

(assert (=> d!47021 m!225765))

(assert (=> d!47021 m!225497))

(declare-fun m!225767 () Bool)

(assert (=> d!47021 m!225767))

(declare-fun m!225769 () Bool)

(assert (=> d!47021 m!225769))

(assert (=> b!146150 d!47021))

(assert (=> b!146150 d!46820))

(assert (=> b!146150 d!46824))

(assert (=> d!46818 d!46921))

(declare-fun d!47023 () Bool)

(assert (=> d!47023 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!47023 true))

(declare-fun _$7!73 () Unit!9086)

(assert (=> d!47023 (= (choose!57 thiss!1634 (_2!6881 lt!226224) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!73)))

(declare-fun bs!11525 () Bool)

(assert (= bs!11525 d!47023))

(declare-fun m!225771 () Bool)

(assert (=> bs!11525 m!225771))

(assert (=> d!46848 d!47023))

(declare-fun lt!227340 () tuple3!568)

(declare-fun d!47025 () Bool)

(assert (=> d!47025 (= lt!227340 (readByteArrayLoop!0 lt!226817 (array!6632 (store (arr!3741 arr!237) from!447 (_2!6884 (readBytePure!0 (_1!6883 lt!226207)))) (size!3002 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47025 (= (readByteArrayLoopPure!0 lt!226817 (array!6632 (store (arr!3741 arr!237) from!447 (_2!6884 (readBytePure!0 (_1!6883 lt!226207)))) (size!3002 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13067 (_2!6894 lt!227340) (_3!351 lt!227340)))))

(declare-fun bs!11526 () Bool)

(assert (= bs!11526 d!47025))

(declare-fun m!225773 () Bool)

(assert (=> bs!11526 m!225773))

(assert (=> d!46828 d!47025))

(assert (=> d!46828 d!46838))

(declare-fun d!47027 () Bool)

(declare-fun res!122462 () Bool)

(declare-fun e!97584 () Bool)

(assert (=> d!47027 (=> res!122462 e!97584)))

(assert (=> d!47027 (= res!122462 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47027 (= (arrayRangesEq!318 (_2!6882 lt!226816) (_2!6882 lt!226818) #b00000000000000000000000000000000 to!404) e!97584)))

(declare-fun b!146389 () Bool)

(declare-fun e!97585 () Bool)

(assert (=> b!146389 (= e!97584 e!97585)))

(declare-fun res!122463 () Bool)

(assert (=> b!146389 (=> (not res!122463) (not e!97585))))

(assert (=> b!146389 (= res!122463 (= (select (arr!3741 (_2!6882 lt!226816)) #b00000000000000000000000000000000) (select (arr!3741 (_2!6882 lt!226818)) #b00000000000000000000000000000000)))))

(declare-fun b!146390 () Bool)

(assert (=> b!146390 (= e!97585 (arrayRangesEq!318 (_2!6882 lt!226816) (_2!6882 lt!226818) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47027 (not res!122462)) b!146389))

(assert (= (and b!146389 res!122463) b!146390))

(declare-fun m!225775 () Bool)

(assert (=> b!146389 m!225775))

(declare-fun m!225777 () Bool)

(assert (=> b!146389 m!225777))

(declare-fun m!225779 () Bool)

(assert (=> b!146390 m!225779))

(assert (=> d!46828 d!47027))

(declare-fun d!47029 () Bool)

(assert (=> d!47029 (arrayRangesEq!318 (_2!6882 (readByteArrayLoopPure!0 (_1!6883 lt!226207) arr!237 from!447 to!404)) (_2!6882 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) (array!6632 (store (arr!3741 arr!237) from!447 (_2!6884 (readBytePure!0 (_1!6883 lt!226207)))) (size!3002 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!47029 true))

(declare-fun _$13!55 () Unit!9086)

(assert (=> d!47029 (= (choose!35 (_1!6883 lt!226207) arr!237 from!447 to!404 lt!226816 (_2!6882 lt!226816) lt!226817 lt!226818 (_2!6882 lt!226818)) _$13!55)))

(declare-fun bs!11528 () Bool)

(assert (= bs!11528 d!47029))

(assert (=> bs!11528 m!225191))

(assert (=> bs!11528 m!224621))

(declare-fun m!225781 () Bool)

(assert (=> bs!11528 m!225781))

(assert (=> bs!11528 m!224653))

(assert (=> bs!11528 m!224633))

(assert (=> bs!11528 m!224621))

(declare-fun m!225783 () Bool)

(assert (=> bs!11528 m!225783))

(assert (=> d!46828 d!47029))

(assert (=> d!46828 d!46846))

(assert (=> d!46828 d!46865))

(declare-fun d!47031 () Bool)

(declare-fun res!122464 () Bool)

(declare-fun e!97587 () Bool)

(assert (=> d!47031 (=> (not res!122464) (not e!97587))))

(assert (=> d!47031 (= res!122464 (= (size!3002 (buf!3447 (_1!6883 lt!227006))) (size!3002 (buf!3447 thiss!1634))))))

(assert (=> d!47031 (= (isPrefixOf!0 (_1!6883 lt!227006) thiss!1634) e!97587)))

(declare-fun b!146391 () Bool)

(declare-fun res!122465 () Bool)

(assert (=> b!146391 (=> (not res!122465) (not e!97587))))

(assert (=> b!146391 (= res!122465 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!227006))) (currentByte!6343 (_1!6883 lt!227006)) (currentBit!6338 (_1!6883 lt!227006))) (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(declare-fun b!146392 () Bool)

(declare-fun e!97586 () Bool)

(assert (=> b!146392 (= e!97587 e!97586)))

(declare-fun res!122466 () Bool)

(assert (=> b!146392 (=> res!122466 e!97586)))

(assert (=> b!146392 (= res!122466 (= (size!3002 (buf!3447 (_1!6883 lt!227006))) #b00000000000000000000000000000000))))

(declare-fun b!146393 () Bool)

(assert (=> b!146393 (= e!97586 (arrayBitRangesEq!0 (buf!3447 (_1!6883 lt!227006)) (buf!3447 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!227006))) (currentByte!6343 (_1!6883 lt!227006)) (currentBit!6338 (_1!6883 lt!227006)))))))

(assert (= (and d!47031 res!122464) b!146391))

(assert (= (and b!146391 res!122465) b!146392))

(assert (= (and b!146392 (not res!122466)) b!146393))

(assert (=> b!146391 m!225641))

(assert (=> b!146391 m!224669))

(assert (=> b!146393 m!225641))

(assert (=> b!146393 m!225641))

(declare-fun m!225785 () Bool)

(assert (=> b!146393 m!225785))

(assert (=> b!146210 d!47031))

(assert (=> b!146197 d!46824))

(assert (=> b!146197 d!46820))

(declare-fun d!47033 () Bool)

(declare-fun lt!227341 () tuple2!13084)

(assert (=> d!47033 (= lt!227341 (readByte!0 (_1!6883 lt!226987)))))

(assert (=> d!47033 (= (readBytePure!0 (_1!6883 lt!226987)) (tuple2!13071 (_2!6893 lt!227341) (_1!6893 lt!227341)))))

(declare-fun bs!11529 () Bool)

(assert (= bs!11529 d!47033))

(declare-fun m!225787 () Bool)

(assert (=> bs!11529 m!225787))

(assert (=> b!146208 d!47033))

(declare-fun b!146394 () Bool)

(declare-fun res!122467 () Bool)

(declare-fun e!97589 () Bool)

(assert (=> b!146394 (=> (not res!122467) (not e!97589))))

(declare-fun lt!227351 () tuple2!13068)

(assert (=> b!146394 (= res!122467 (isPrefixOf!0 (_2!6883 lt!227351) (_2!6881 lt!226986)))))

(declare-fun b!146395 () Bool)

(declare-fun res!122469 () Bool)

(assert (=> b!146395 (=> (not res!122469) (not e!97589))))

(assert (=> b!146395 (= res!122469 (isPrefixOf!0 (_1!6883 lt!227351) thiss!1634))))

(declare-fun b!146396 () Bool)

(declare-fun lt!227352 () (_ BitVec 64))

(declare-fun lt!227343 () (_ BitVec 64))

(assert (=> b!146396 (= e!97589 (= (_1!6883 lt!227351) (withMovedBitIndex!0 (_2!6883 lt!227351) (bvsub lt!227343 lt!227352))))))

(assert (=> b!146396 (or (= (bvand lt!227343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227352 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227343 lt!227352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146396 (= lt!227352 (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226986))) (currentByte!6343 (_2!6881 lt!226986)) (currentBit!6338 (_2!6881 lt!226986))))))

(assert (=> b!146396 (= lt!227343 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(declare-fun b!146397 () Bool)

(declare-fun e!97588 () Unit!9086)

(declare-fun lt!227358 () Unit!9086)

(assert (=> b!146397 (= e!97588 lt!227358)))

(declare-fun lt!227347 () (_ BitVec 64))

(assert (=> b!146397 (= lt!227347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!227345 () (_ BitVec 64))

(assert (=> b!146397 (= lt!227345 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(assert (=> b!146397 (= lt!227358 (arrayBitRangesEqSymmetric!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226986)) lt!227347 lt!227345))))

(assert (=> b!146397 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226986)) (buf!3447 thiss!1634) lt!227347 lt!227345)))

(declare-fun d!47035 () Bool)

(assert (=> d!47035 e!97589))

(declare-fun res!122468 () Bool)

(assert (=> d!47035 (=> (not res!122468) (not e!97589))))

(assert (=> d!47035 (= res!122468 (isPrefixOf!0 (_1!6883 lt!227351) (_2!6883 lt!227351)))))

(declare-fun lt!227349 () BitStream!5262)

(assert (=> d!47035 (= lt!227351 (tuple2!13069 lt!227349 (_2!6881 lt!226986)))))

(declare-fun lt!227344 () Unit!9086)

(declare-fun lt!227360 () Unit!9086)

(assert (=> d!47035 (= lt!227344 lt!227360)))

(assert (=> d!47035 (isPrefixOf!0 lt!227349 (_2!6881 lt!226986))))

(assert (=> d!47035 (= lt!227360 (lemmaIsPrefixTransitive!0 lt!227349 (_2!6881 lt!226986) (_2!6881 lt!226986)))))

(declare-fun lt!227342 () Unit!9086)

(declare-fun lt!227354 () Unit!9086)

(assert (=> d!47035 (= lt!227342 lt!227354)))

(assert (=> d!47035 (isPrefixOf!0 lt!227349 (_2!6881 lt!226986))))

(assert (=> d!47035 (= lt!227354 (lemmaIsPrefixTransitive!0 lt!227349 thiss!1634 (_2!6881 lt!226986)))))

(declare-fun lt!227361 () Unit!9086)

(assert (=> d!47035 (= lt!227361 e!97588)))

(declare-fun c!7928 () Bool)

(assert (=> d!47035 (= c!7928 (not (= (size!3002 (buf!3447 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!227350 () Unit!9086)

(declare-fun lt!227355 () Unit!9086)

(assert (=> d!47035 (= lt!227350 lt!227355)))

(assert (=> d!47035 (isPrefixOf!0 (_2!6881 lt!226986) (_2!6881 lt!226986))))

(assert (=> d!47035 (= lt!227355 (lemmaIsPrefixRefl!0 (_2!6881 lt!226986)))))

(declare-fun lt!227346 () Unit!9086)

(declare-fun lt!227359 () Unit!9086)

(assert (=> d!47035 (= lt!227346 lt!227359)))

(assert (=> d!47035 (= lt!227359 (lemmaIsPrefixRefl!0 (_2!6881 lt!226986)))))

(declare-fun lt!227348 () Unit!9086)

(declare-fun lt!227356 () Unit!9086)

(assert (=> d!47035 (= lt!227348 lt!227356)))

(assert (=> d!47035 (isPrefixOf!0 lt!227349 lt!227349)))

(assert (=> d!47035 (= lt!227356 (lemmaIsPrefixRefl!0 lt!227349))))

(declare-fun lt!227357 () Unit!9086)

(declare-fun lt!227353 () Unit!9086)

(assert (=> d!47035 (= lt!227357 lt!227353)))

(assert (=> d!47035 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47035 (= lt!227353 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47035 (= lt!227349 (BitStream!5263 (buf!3447 (_2!6881 lt!226986)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))

(assert (=> d!47035 (isPrefixOf!0 thiss!1634 (_2!6881 lt!226986))))

(assert (=> d!47035 (= (reader!0 thiss!1634 (_2!6881 lt!226986)) lt!227351)))

(declare-fun b!146398 () Bool)

(declare-fun Unit!9134 () Unit!9086)

(assert (=> b!146398 (= e!97588 Unit!9134)))

(assert (= (and d!47035 c!7928) b!146397))

(assert (= (and d!47035 (not c!7928)) b!146398))

(assert (= (and d!47035 res!122468) b!146395))

(assert (= (and b!146395 res!122469) b!146394))

(assert (= (and b!146394 res!122467) b!146396))

(declare-fun m!225789 () Bool)

(assert (=> d!47035 m!225789))

(assert (=> d!47035 m!225195))

(declare-fun m!225791 () Bool)

(assert (=> d!47035 m!225791))

(declare-fun m!225793 () Bool)

(assert (=> d!47035 m!225793))

(assert (=> d!47035 m!225325))

(declare-fun m!225795 () Bool)

(assert (=> d!47035 m!225795))

(assert (=> d!47035 m!225203))

(declare-fun m!225797 () Bool)

(assert (=> d!47035 m!225797))

(declare-fun m!225799 () Bool)

(assert (=> d!47035 m!225799))

(declare-fun m!225801 () Bool)

(assert (=> d!47035 m!225801))

(declare-fun m!225803 () Bool)

(assert (=> d!47035 m!225803))

(assert (=> b!146397 m!224669))

(declare-fun m!225805 () Bool)

(assert (=> b!146397 m!225805))

(declare-fun m!225807 () Bool)

(assert (=> b!146397 m!225807))

(declare-fun m!225809 () Bool)

(assert (=> b!146395 m!225809))

(declare-fun m!225811 () Bool)

(assert (=> b!146396 m!225811))

(assert (=> b!146396 m!225323))

(assert (=> b!146396 m!224669))

(declare-fun m!225813 () Bool)

(assert (=> b!146394 m!225813))

(assert (=> b!146208 d!47035))

(declare-fun d!47037 () Bool)

(declare-fun res!122470 () Bool)

(declare-fun e!97590 () Bool)

(assert (=> d!47037 (=> res!122470 e!97590)))

(assert (=> d!47037 (= res!122470 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47037 (= (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!97590)))

(declare-fun b!146399 () Bool)

(declare-fun e!97591 () Bool)

(assert (=> b!146399 (= e!97590 e!97591)))

(declare-fun res!122471 () Bool)

(assert (=> b!146399 (=> (not res!122471) (not e!97591))))

(assert (=> b!146399 (= res!122471 (= (select (arr!3741 (_2!6882 lt!226201)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3741 (_2!6882 lt!226216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!146400 () Bool)

(assert (=> b!146400 (= e!97591 (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47037 (not res!122470)) b!146399))

(assert (= (and b!146399 res!122471) b!146400))

(declare-fun m!225815 () Bool)

(assert (=> b!146399 m!225815))

(declare-fun m!225817 () Bool)

(assert (=> b!146399 m!225817))

(declare-fun m!225819 () Bool)

(assert (=> b!146400 m!225819))

(assert (=> b!146168 d!47037))

(assert (=> b!146212 d!46824))

(declare-fun d!47039 () Bool)

(assert (=> d!47039 (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 thiss!1634) lt!227002 lt!227000)))

(declare-fun lt!227362 () Unit!9086)

(assert (=> d!47039 (= lt!227362 (choose!8 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226224)) lt!227002 lt!227000))))

(assert (=> d!47039 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227002) (bvsle lt!227002 lt!227000))))

(assert (=> d!47039 (= (arrayBitRangesEqSymmetric!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226224)) lt!227002 lt!227000) lt!227362)))

(declare-fun bs!11530 () Bool)

(assert (= bs!11530 d!47039))

(assert (=> bs!11530 m!225353))

(declare-fun m!225821 () Bool)

(assert (=> bs!11530 m!225821))

(assert (=> b!146212 d!47039))

(declare-fun b!146401 () Bool)

(declare-fun e!97592 () Bool)

(declare-fun call!1916 () Bool)

(assert (=> b!146401 (= e!97592 call!1916)))

(declare-fun b!146402 () Bool)

(declare-fun res!122475 () Bool)

(declare-fun lt!227365 () (_ BitVec 32))

(assert (=> b!146402 (= res!122475 (= lt!227365 #b00000000000000000000000000000000))))

(declare-fun e!97595 () Bool)

(assert (=> b!146402 (=> res!122475 e!97595)))

(declare-fun e!97593 () Bool)

(assert (=> b!146402 (= e!97593 e!97595)))

(declare-fun d!47041 () Bool)

(declare-fun res!122474 () Bool)

(declare-fun e!97596 () Bool)

(assert (=> d!47041 (=> res!122474 e!97596)))

(assert (=> d!47041 (= res!122474 (bvsge lt!227002 lt!227000))))

(assert (=> d!47041 (= (arrayBitRangesEq!0 (buf!3447 (_2!6881 lt!226224)) (buf!3447 thiss!1634) lt!227002 lt!227000) e!97596)))

(declare-fun lt!227364 () (_ BitVec 32))

(declare-fun c!7929 () Bool)

(declare-fun lt!227363 () tuple4!134)

(declare-fun bm!1913 () Bool)

(assert (=> bm!1913 (= call!1916 (byteRangesEq!0 (ite c!7929 (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227363)) (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_4!67 lt!227363))) (ite c!7929 (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227363)) (select (arr!3741 (buf!3447 thiss!1634)) (_4!67 lt!227363))) (ite c!7929 lt!227364 #b00000000000000000000000000000000) lt!227365))))

(declare-fun b!146403 () Bool)

(declare-fun e!97594 () Bool)

(assert (=> b!146403 (= e!97594 e!97592)))

(assert (=> b!146403 (= c!7929 (= (_3!352 lt!227363) (_4!67 lt!227363)))))

(declare-fun b!146404 () Bool)

(assert (=> b!146404 (= e!97596 e!97594)))

(declare-fun res!122472 () Bool)

(assert (=> b!146404 (=> (not res!122472) (not e!97594))))

(declare-fun e!97597 () Bool)

(assert (=> b!146404 (= res!122472 e!97597)))

(declare-fun res!122473 () Bool)

(assert (=> b!146404 (=> res!122473 e!97597)))

(assert (=> b!146404 (= res!122473 (bvsge (_1!6895 lt!227363) (_2!6895 lt!227363)))))

(assert (=> b!146404 (= lt!227365 ((_ extract 31 0) (bvsrem lt!227000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146404 (= lt!227364 ((_ extract 31 0) (bvsrem lt!227002 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146404 (= lt!227363 (arrayBitIndices!0 lt!227002 lt!227000))))

(declare-fun b!146405 () Bool)

(assert (=> b!146405 (= e!97592 e!97593)))

(declare-fun res!122476 () Bool)

(assert (=> b!146405 (= res!122476 (byteRangesEq!0 (select (arr!3741 (buf!3447 (_2!6881 lt!226224))) (_3!352 lt!227363)) (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227363)) lt!227364 #b00000000000000000000000000001000))))

(assert (=> b!146405 (=> (not res!122476) (not e!97593))))

(declare-fun b!146406 () Bool)

(assert (=> b!146406 (= e!97595 call!1916)))

(declare-fun b!146407 () Bool)

(assert (=> b!146407 (= e!97597 (arrayRangesEq!318 (buf!3447 (_2!6881 lt!226224)) (buf!3447 thiss!1634) (_1!6895 lt!227363) (_2!6895 lt!227363)))))

(assert (= (and d!47041 (not res!122474)) b!146404))

(assert (= (and b!146404 (not res!122473)) b!146407))

(assert (= (and b!146404 res!122472) b!146403))

(assert (= (and b!146403 c!7929) b!146401))

(assert (= (and b!146403 (not c!7929)) b!146405))

(assert (= (and b!146405 res!122476) b!146402))

(assert (= (and b!146402 (not res!122475)) b!146406))

(assert (= (or b!146401 b!146406) bm!1913))

(declare-fun m!225823 () Bool)

(assert (=> bm!1913 m!225823))

(declare-fun m!225825 () Bool)

(assert (=> bm!1913 m!225825))

(declare-fun m!225827 () Bool)

(assert (=> bm!1913 m!225827))

(declare-fun m!225829 () Bool)

(assert (=> bm!1913 m!225829))

(declare-fun m!225831 () Bool)

(assert (=> bm!1913 m!225831))

(declare-fun m!225833 () Bool)

(assert (=> b!146404 m!225833))

(assert (=> b!146405 m!225831))

(assert (=> b!146405 m!225823))

(assert (=> b!146405 m!225831))

(assert (=> b!146405 m!225823))

(declare-fun m!225835 () Bool)

(assert (=> b!146405 m!225835))

(declare-fun m!225837 () Bool)

(assert (=> b!146407 m!225837))

(assert (=> b!146212 d!47041))

(declare-fun b!146408 () Bool)

(declare-fun e!97598 () Bool)

(declare-fun call!1917 () Bool)

(assert (=> b!146408 (= e!97598 call!1917)))

(declare-fun b!146409 () Bool)

(declare-fun res!122480 () Bool)

(declare-fun lt!227368 () (_ BitVec 32))

(assert (=> b!146409 (= res!122480 (= lt!227368 #b00000000000000000000000000000000))))

(declare-fun e!97601 () Bool)

(assert (=> b!146409 (=> res!122480 e!97601)))

(declare-fun e!97599 () Bool)

(assert (=> b!146409 (= e!97599 e!97601)))

(declare-fun d!47043 () Bool)

(declare-fun res!122479 () Bool)

(declare-fun e!97602 () Bool)

(assert (=> d!47043 (=> res!122479 e!97602)))

(assert (=> d!47043 (= res!122479 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(assert (=> d!47043 (= (arrayBitRangesEq!0 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) e!97602)))

(declare-fun lt!227367 () (_ BitVec 32))

(declare-fun bm!1914 () Bool)

(declare-fun lt!227366 () tuple4!134)

(declare-fun c!7930 () Bool)

(assert (=> bm!1914 (= call!1917 (byteRangesEq!0 (ite c!7930 (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227366)) (select (arr!3741 (buf!3447 thiss!1634)) (_4!67 lt!227366))) (ite c!7930 (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227366)) (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_4!67 lt!227366))) (ite c!7930 lt!227367 #b00000000000000000000000000000000) lt!227368))))

(declare-fun b!146410 () Bool)

(declare-fun e!97600 () Bool)

(assert (=> b!146410 (= e!97600 e!97598)))

(assert (=> b!146410 (= c!7930 (= (_3!352 lt!227366) (_4!67 lt!227366)))))

(declare-fun b!146411 () Bool)

(assert (=> b!146411 (= e!97602 e!97600)))

(declare-fun res!122477 () Bool)

(assert (=> b!146411 (=> (not res!122477) (not e!97600))))

(declare-fun e!97603 () Bool)

(assert (=> b!146411 (= res!122477 e!97603)))

(declare-fun res!122478 () Bool)

(assert (=> b!146411 (=> res!122478 e!97603)))

(assert (=> b!146411 (= res!122478 (bvsge (_1!6895 lt!227366) (_2!6895 lt!227366)))))

(assert (=> b!146411 (= lt!227368 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146411 (= lt!227367 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146411 (= lt!227366 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))

(declare-fun b!146412 () Bool)

(assert (=> b!146412 (= e!97598 e!97599)))

(declare-fun res!122481 () Bool)

(assert (=> b!146412 (= res!122481 (byteRangesEq!0 (select (arr!3741 (buf!3447 thiss!1634)) (_3!352 lt!227366)) (select (arr!3741 (buf!3447 (_2!6881 lt!226210))) (_3!352 lt!227366)) lt!227367 #b00000000000000000000000000001000))))

(assert (=> b!146412 (=> (not res!122481) (not e!97599))))

(declare-fun b!146413 () Bool)

(assert (=> b!146413 (= e!97601 call!1917)))

(declare-fun b!146414 () Bool)

(assert (=> b!146414 (= e!97603 (arrayRangesEq!318 (buf!3447 thiss!1634) (buf!3447 (_2!6881 lt!226210)) (_1!6895 lt!227366) (_2!6895 lt!227366)))))

(assert (= (and d!47043 (not res!122479)) b!146411))

(assert (= (and b!146411 (not res!122478)) b!146414))

(assert (= (and b!146411 res!122477) b!146410))

(assert (= (and b!146410 c!7930) b!146408))

(assert (= (and b!146410 (not c!7930)) b!146412))

(assert (= (and b!146412 res!122481) b!146409))

(assert (= (and b!146409 (not res!122480)) b!146413))

(assert (= (or b!146408 b!146413) bm!1914))

(declare-fun m!225839 () Bool)

(assert (=> bm!1914 m!225839))

(declare-fun m!225841 () Bool)

(assert (=> bm!1914 m!225841))

(declare-fun m!225843 () Bool)

(assert (=> bm!1914 m!225843))

(declare-fun m!225845 () Bool)

(assert (=> bm!1914 m!225845))

(declare-fun m!225847 () Bool)

(assert (=> bm!1914 m!225847))

(assert (=> b!146411 m!224669))

(assert (=> b!146411 m!225615))

(assert (=> b!146412 m!225847))

(assert (=> b!146412 m!225839))

(assert (=> b!146412 m!225847))

(assert (=> b!146412 m!225839))

(declare-fun m!225849 () Bool)

(assert (=> b!146412 m!225849))

(declare-fun m!225851 () Bool)

(assert (=> b!146414 m!225851))

(assert (=> b!146199 d!47043))

(assert (=> b!146199 d!46824))

(declare-fun d!47045 () Bool)

(assert (=> d!47045 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226206)))) ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226206))) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226206)))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 (_1!6884 lt!226206)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_1!6884 lt!226206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_1!6884 lt!226206))))))))

(assert (=> d!46863 d!47045))

(declare-fun d!47047 () Bool)

(assert (=> d!47047 (= (invariant!0 (currentBit!6338 (_1!6884 lt!226206)) (currentByte!6343 (_1!6884 lt!226206)) (size!3002 (buf!3447 (_1!6884 lt!226206)))) (and (bvsge (currentBit!6338 (_1!6884 lt!226206)) #b00000000000000000000000000000000) (bvslt (currentBit!6338 (_1!6884 lt!226206)) #b00000000000000000000000000001000) (bvsge (currentByte!6343 (_1!6884 lt!226206)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6343 (_1!6884 lt!226206)) (size!3002 (buf!3447 (_1!6884 lt!226206)))) (and (= (currentBit!6338 (_1!6884 lt!226206)) #b00000000000000000000000000000000) (= (currentByte!6343 (_1!6884 lt!226206)) (size!3002 (buf!3447 (_1!6884 lt!226206))))))))))

(assert (=> d!46863 d!47047))

(declare-fun d!47049 () Bool)

(declare-fun e!97604 () Bool)

(assert (=> d!47049 e!97604))

(declare-fun res!122482 () Bool)

(assert (=> d!47049 (=> (not res!122482) (not e!97604))))

(declare-fun lt!227370 () (_ BitVec 64))

(declare-fun lt!227373 () (_ BitVec 64))

(declare-fun lt!227374 () (_ BitVec 64))

(assert (=> d!47049 (= res!122482 (= lt!227370 (bvsub lt!227373 lt!227374)))))

(assert (=> d!47049 (or (= (bvand lt!227373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227373 lt!227374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47049 (= lt!227374 (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226986)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226986))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226986)))))))

(declare-fun lt!227372 () (_ BitVec 64))

(declare-fun lt!227369 () (_ BitVec 64))

(assert (=> d!47049 (= lt!227373 (bvmul lt!227372 lt!227369))))

(assert (=> d!47049 (or (= lt!227372 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227369 (bvsdiv (bvmul lt!227372 lt!227369) lt!227372)))))

(assert (=> d!47049 (= lt!227369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47049 (= lt!227372 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226986)))))))

(assert (=> d!47049 (= lt!227370 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226986))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226986)))))))

(assert (=> d!47049 (invariant!0 (currentBit!6338 (_2!6881 lt!226986)) (currentByte!6343 (_2!6881 lt!226986)) (size!3002 (buf!3447 (_2!6881 lt!226986))))))

(assert (=> d!47049 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226986))) (currentByte!6343 (_2!6881 lt!226986)) (currentBit!6338 (_2!6881 lt!226986))) lt!227370)))

(declare-fun b!146415 () Bool)

(declare-fun res!122483 () Bool)

(assert (=> b!146415 (=> (not res!122483) (not e!97604))))

(assert (=> b!146415 (= res!122483 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227370))))

(declare-fun b!146416 () Bool)

(declare-fun lt!227371 () (_ BitVec 64))

(assert (=> b!146416 (= e!97604 (bvsle lt!227370 (bvmul lt!227371 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146416 (or (= lt!227371 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227371 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227371)))))

(assert (=> b!146416 (= lt!227371 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226986)))))))

(assert (= (and d!47049 res!122482) b!146415))

(assert (= (and b!146415 res!122483) b!146416))

(declare-fun m!225853 () Bool)

(assert (=> d!47049 m!225853))

(declare-fun m!225855 () Bool)

(assert (=> d!47049 m!225855))

(assert (=> b!146206 d!47049))

(assert (=> b!146206 d!46824))

(declare-fun b!146426 () Bool)

(declare-fun res!122490 () Bool)

(declare-fun e!97612 () Bool)

(assert (=> b!146426 (=> (not res!122490) (not e!97612))))

(declare-fun _$37!38 () tuple2!13064)

(assert (=> b!146426 (= res!122490 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6881 _$37!38))) (currentByte!6343 (_2!6881 _$37!38)) (currentBit!6338 (_2!6881 _$37!38))) (bvadd (bitIndex!0 (size!3002 (buf!3447 thiss!1634)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!146427 () Bool)

(declare-fun res!122491 () Bool)

(assert (=> b!146427 (=> (not res!122491) (not e!97612))))

(assert (=> b!146427 (= res!122491 (isPrefixOf!0 thiss!1634 (_2!6881 _$37!38)))))

(declare-fun d!47051 () Bool)

(assert (=> d!47051 e!97612))

(declare-fun res!122492 () Bool)

(assert (=> d!47051 (=> (not res!122492) (not e!97612))))

(assert (=> d!47051 (= res!122492 (= (size!3002 (buf!3447 thiss!1634)) (size!3002 (buf!3447 (_2!6881 _$37!38)))))))

(declare-fun e!97613 () Bool)

(assert (=> d!47051 (and (inv!12 (_2!6881 _$37!38)) e!97613)))

(assert (=> d!47051 (= (choose!6 thiss!1634 (select (arr!3741 arr!237) from!447)) _$37!38)))

(declare-fun b!146425 () Bool)

(assert (=> b!146425 (= e!97613 (array_inv!2791 (buf!3447 (_2!6881 _$37!38))))))

(declare-fun lt!227379 () tuple2!13068)

(declare-fun lt!227380 () tuple2!13070)

(declare-fun b!146428 () Bool)

(assert (=> b!146428 (= e!97612 (and (= (_2!6884 lt!227380) (select (arr!3741 arr!237) from!447)) (= (_1!6884 lt!227380) (_2!6883 lt!227379))))))

(assert (=> b!146428 (= lt!227380 (readBytePure!0 (_1!6883 lt!227379)))))

(assert (=> b!146428 (= lt!227379 (reader!0 thiss!1634 (_2!6881 _$37!38)))))

(assert (= d!47051 b!146425))

(assert (= (and d!47051 res!122492) b!146426))

(assert (= (and b!146426 res!122490) b!146427))

(assert (= (and b!146427 res!122491) b!146428))

(declare-fun m!225857 () Bool)

(assert (=> b!146428 m!225857))

(declare-fun m!225859 () Bool)

(assert (=> b!146428 m!225859))

(declare-fun m!225861 () Bool)

(assert (=> d!47051 m!225861))

(declare-fun m!225863 () Bool)

(assert (=> b!146427 m!225863))

(declare-fun m!225865 () Bool)

(assert (=> b!146425 m!225865))

(declare-fun m!225867 () Bool)

(assert (=> b!146426 m!225867))

(assert (=> b!146426 m!224669))

(assert (=> d!46873 d!47051))

(declare-fun d!47053 () Bool)

(assert (=> d!47053 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 thiss!1634))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11531 () Bool)

(assert (= bs!11531 d!47053))

(assert (=> bs!11531 m!225173))

(assert (=> d!46873 d!47053))

(assert (=> d!46859 d!46832))

(declare-fun d!47055 () Bool)

(assert (=> d!47055 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!47055 true))

(declare-fun _$5!62 () Unit!9086)

(assert (=> d!47055 (= (choose!26 thiss!1634 (buf!3447 (_2!6881 lt!226210)) (bvsub to!404 from!447) (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) _$5!62)))

(declare-fun bs!11532 () Bool)

(assert (= bs!11532 d!47055))

(assert (=> bs!11532 m!224641))

(assert (=> d!46859 d!47055))

(declare-fun d!47057 () Bool)

(declare-fun res!122493 () Bool)

(declare-fun e!97614 () Bool)

(assert (=> d!47057 (=> res!122493 e!97614)))

(assert (=> d!47057 (= res!122493 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47057 (= (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226200) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!97614)))

(declare-fun b!146429 () Bool)

(declare-fun e!97615 () Bool)

(assert (=> b!146429 (= e!97614 e!97615)))

(declare-fun res!122494 () Bool)

(assert (=> b!146429 (=> (not res!122494) (not e!97615))))

(assert (=> b!146429 (= res!122494 (= (select (arr!3741 (_2!6882 lt!226201)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3741 (_2!6882 lt!226200)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!146430 () Bool)

(assert (=> b!146430 (= e!97615 (arrayRangesEq!318 (_2!6882 lt!226201) (_2!6882 lt!226200) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47057 (not res!122493)) b!146429))

(assert (= (and b!146429 res!122494) b!146430))

(assert (=> b!146429 m!225815))

(declare-fun m!225869 () Bool)

(assert (=> b!146429 m!225869))

(declare-fun m!225871 () Bool)

(assert (=> b!146430 m!225871))

(assert (=> b!146161 d!47057))

(declare-fun c!7931 () Bool)

(declare-fun call!1919 () Bool)

(declare-fun lt!227389 () tuple2!13084)

(declare-fun bm!1915 () Bool)

(assert (=> bm!1915 (= call!1919 (arrayRangesEq!318 lt!226223 (ite c!7931 (array!6632 (store (arr!3741 lt!226223) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227389)) (size!3002 lt!226223)) lt!226223) #b00000000000000000000000000000000 (ite c!7931 (bvadd #b00000000000000000000000000000001 from!447) (size!3002 lt!226223))))))

(declare-fun b!146431 () Bool)

(declare-fun res!122497 () Bool)

(declare-fun e!97618 () Bool)

(assert (=> b!146431 (=> (not res!122497) (not e!97618))))

(declare-fun lt!227395 () tuple3!568)

(assert (=> b!146431 (= res!122497 (and (= (buf!3447 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)) (buf!3447 (_2!6894 lt!227395))) (= (size!3002 lt!226223) (size!3002 (_3!351 lt!227395)))))))

(declare-fun b!146432 () Bool)

(assert (=> b!146432 (= e!97618 (arrayRangesEq!318 lt!226223 (_3!351 lt!227395) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!47059 () Bool)

(declare-fun e!97616 () Bool)

(assert (=> d!47059 e!97616))

(declare-fun res!122496 () Bool)

(assert (=> d!47059 (=> res!122496 e!97616)))

(assert (=> d!47059 (= res!122496 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227402 () Bool)

(assert (=> d!47059 (= lt!227402 e!97618)))

(declare-fun res!122495 () Bool)

(assert (=> d!47059 (=> (not res!122495) (not e!97618))))

(declare-fun lt!227381 () (_ BitVec 64))

(declare-fun lt!227403 () (_ BitVec 64))

(assert (=> d!47059 (= res!122495 (= (bvadd lt!227403 lt!227381) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227395))) (currentByte!6343 (_2!6894 lt!227395)) (currentBit!6338 (_2!6894 lt!227395)))))))

(assert (=> d!47059 (or (not (= (bvand lt!227403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227381 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227403 lt!227381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227408 () (_ BitVec 64))

(assert (=> d!47059 (= lt!227381 (bvmul lt!227408 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47059 (or (= lt!227408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227408)))))

(assert (=> d!47059 (= lt!227408 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47059 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47059 (= lt!227403 (bitIndex!0 (size!3002 (buf!3447 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))) (currentByte!6343 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)) (currentBit!6338 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))))))

(declare-fun e!97617 () tuple3!568)

(assert (=> d!47059 (= lt!227395 e!97617)))

(assert (=> d!47059 (= c!7931 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47059 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3002 lt!226223)))))

(assert (=> d!47059 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) lt!226223 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!227395)))

(declare-fun lt!227401 () (_ BitVec 32))

(declare-fun call!1918 () Bool)

(declare-fun lt!227392 () array!6631)

(declare-fun lt!227416 () (_ BitVec 32))

(declare-fun lt!227413 () (_ BitVec 32))

(declare-fun lt!227409 () tuple3!568)

(declare-fun lt!227384 () array!6631)

(declare-fun bm!1916 () Bool)

(assert (=> bm!1916 (= call!1918 (arrayRangesEq!318 (ite c!7931 lt!226223 lt!227384) (ite c!7931 (_3!351 lt!227409) lt!227392) (ite c!7931 lt!227413 lt!227416) (ite c!7931 (bvadd #b00000000000000000000000000000001 from!447) lt!227401)))))

(declare-fun b!146433 () Bool)

(declare-fun lt!227398 () Unit!9086)

(assert (=> b!146433 (= e!97617 (tuple3!569 lt!227398 (_2!6894 lt!227409) (_3!351 lt!227409)))))

(assert (=> b!146433 (= lt!227389 (readByte!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)))))

(declare-fun lt!227394 () array!6631)

(assert (=> b!146433 (= lt!227394 (array!6632 (store (arr!3741 lt!226223) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227389)) (size!3002 lt!226223)))))

(declare-fun lt!227383 () (_ BitVec 64))

(assert (=> b!146433 (= lt!227383 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227393 () (_ BitVec 32))

(assert (=> b!146433 (= lt!227393 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227412 () Unit!9086)

(assert (=> b!146433 (= lt!227412 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) (_2!6893 lt!227389) lt!227383 lt!227393))))

(assert (=> b!146433 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6893 lt!227389)))) ((_ sign_extend 32) (currentByte!6343 (_2!6893 lt!227389))) ((_ sign_extend 32) (currentBit!6338 (_2!6893 lt!227389))) (bvsub lt!227393 ((_ extract 31 0) (bvsdiv (bvadd lt!227383 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227388 () Unit!9086)

(assert (=> b!146433 (= lt!227388 lt!227412)))

(assert (=> b!146433 (= lt!227409 (readByteArrayLoop!0 (_2!6893 lt!227389) lt!227394 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1920 () (_ BitVec 64))

(assert (=> b!146433 (= call!1920 (bvadd (bitIndex!0 (size!3002 (buf!3447 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))) (currentByte!6343 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)) (currentBit!6338 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227385 () Unit!9086)

(declare-fun Unit!9135 () Unit!9086)

(assert (=> b!146433 (= lt!227385 Unit!9135)))

(assert (=> b!146433 (= (bvadd call!1920 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227409))) (currentByte!6343 (_2!6894 lt!227409)) (currentBit!6338 (_2!6894 lt!227409))))))

(declare-fun lt!227382 () Unit!9086)

(declare-fun Unit!9136 () Unit!9086)

(assert (=> b!146433 (= lt!227382 Unit!9136)))

(assert (=> b!146433 (= (bvadd (bitIndex!0 (size!3002 (buf!3447 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))) (currentByte!6343 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)) (currentBit!6338 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3002 (buf!3447 (_2!6894 lt!227409))) (currentByte!6343 (_2!6894 lt!227409)) (currentBit!6338 (_2!6894 lt!227409))))))

(declare-fun lt!227411 () Unit!9086)

(declare-fun Unit!9137 () Unit!9086)

(assert (=> b!146433 (= lt!227411 Unit!9137)))

(assert (=> b!146433 (and (= (buf!3447 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)) (buf!3447 (_2!6894 lt!227409))) (= (size!3002 lt!226223) (size!3002 (_3!351 lt!227409))))))

(declare-fun lt!227407 () Unit!9086)

(declare-fun Unit!9138 () Unit!9086)

(assert (=> b!146433 (= lt!227407 Unit!9138)))

(declare-fun lt!227404 () Unit!9086)

(assert (=> b!146433 (= lt!227404 (arrayUpdatedAtPrefixLemma!10 lt!226223 (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227389)))))

(assert (=> b!146433 call!1919))

(declare-fun lt!227396 () Unit!9086)

(assert (=> b!146433 (= lt!227396 lt!227404)))

(assert (=> b!146433 (= lt!227413 #b00000000000000000000000000000000)))

(declare-fun lt!227387 () Unit!9086)

(assert (=> b!146433 (= lt!227387 (arrayRangesEqTransitive!50 lt!226223 lt!227394 (_3!351 lt!227409) lt!227413 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146433 call!1918))

(declare-fun lt!227397 () Unit!9086)

(assert (=> b!146433 (= lt!227397 lt!227387)))

(assert (=> b!146433 (arrayRangesEq!318 lt!226223 (_3!351 lt!227409) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!227410 () Unit!9086)

(declare-fun Unit!9139 () Unit!9086)

(assert (=> b!146433 (= lt!227410 Unit!9139)))

(declare-fun lt!227399 () Unit!9086)

(assert (=> b!146433 (= lt!227399 (arrayRangesEqImpliesEq!10 lt!227394 (_3!351 lt!227409) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146433 (= (select (store (arr!3741 lt!226223) (bvadd #b00000000000000000000000000000001 from!447) (_1!6893 lt!227389)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3741 (_3!351 lt!227409)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227414 () Unit!9086)

(assert (=> b!146433 (= lt!227414 lt!227399)))

(declare-fun lt!227400 () Bool)

(assert (=> b!146433 (= lt!227400 (= (select (arr!3741 (_3!351 lt!227409)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6893 lt!227389)))))

(declare-fun Unit!9140 () Unit!9086)

(assert (=> b!146433 (= lt!227398 Unit!9140)))

(assert (=> b!146433 lt!227400))

(declare-fun b!146434 () Bool)

(declare-fun lt!227415 () Unit!9086)

(assert (=> b!146434 (= e!97617 (tuple3!569 lt!227415 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001) lt!226223))))

(assert (=> b!146434 (= call!1920 call!1920)))

(declare-fun lt!227386 () Unit!9086)

(declare-fun Unit!9141 () Unit!9086)

(assert (=> b!146434 (= lt!227386 Unit!9141)))

(declare-fun lt!227390 () Unit!9086)

(assert (=> b!146434 (= lt!227390 (arrayRangesEqReflexiveLemma!10 lt!226223))))

(assert (=> b!146434 call!1919))

(declare-fun lt!227406 () Unit!9086)

(assert (=> b!146434 (= lt!227406 lt!227390)))

(assert (=> b!146434 (= lt!227384 lt!226223)))

(assert (=> b!146434 (= lt!227392 lt!226223)))

(declare-fun lt!227391 () (_ BitVec 32))

(assert (=> b!146434 (= lt!227391 #b00000000000000000000000000000000)))

(declare-fun lt!227405 () (_ BitVec 32))

(assert (=> b!146434 (= lt!227405 (size!3002 lt!226223))))

(assert (=> b!146434 (= lt!227416 #b00000000000000000000000000000000)))

(assert (=> b!146434 (= lt!227401 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!146434 (= lt!227415 (arrayRangesEqSlicedLemma!10 lt!227384 lt!227392 lt!227391 lt!227405 lt!227416 lt!227401))))

(assert (=> b!146434 call!1918))

(declare-fun bm!1917 () Bool)

(assert (=> bm!1917 (= call!1920 (bitIndex!0 (ite c!7931 (size!3002 (buf!3447 (_2!6893 lt!227389))) (size!3002 (buf!3447 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)))) (ite c!7931 (currentByte!6343 (_2!6893 lt!227389)) (currentByte!6343 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001))) (ite c!7931 (currentBit!6338 (_2!6893 lt!227389)) (currentBit!6338 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)))))))

(declare-fun b!146435 () Bool)

(assert (=> b!146435 (= e!97616 (= (select (arr!3741 (_3!351 lt!227395)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6884 (readBytePure!0 (withMovedByteIndex!0 (_1!6883 lt!226207) #b00000000000000000000000000000001)))))))

(assert (=> b!146435 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3002 (_3!351 lt!227395))))))

(assert (= (and d!47059 c!7931) b!146433))

(assert (= (and d!47059 (not c!7931)) b!146434))

(assert (= (or b!146433 b!146434) bm!1916))

(assert (= (or b!146433 b!146434) bm!1915))

(assert (= (or b!146433 b!146434) bm!1917))

(assert (= (and d!47059 res!122495) b!146431))

(assert (= (and b!146431 res!122497) b!146432))

(assert (= (and d!47059 (not res!122496)) b!146435))

(declare-fun m!225873 () Bool)

(assert (=> bm!1916 m!225873))

(declare-fun m!225875 () Bool)

(assert (=> b!146432 m!225875))

(declare-fun m!225877 () Bool)

(assert (=> b!146433 m!225877))

(declare-fun m!225879 () Bool)

(assert (=> b!146433 m!225879))

(declare-fun m!225881 () Bool)

(assert (=> b!146433 m!225881))

(assert (=> b!146433 m!224621))

(declare-fun m!225883 () Bool)

(assert (=> b!146433 m!225883))

(declare-fun m!225885 () Bool)

(assert (=> b!146433 m!225885))

(declare-fun m!225887 () Bool)

(assert (=> b!146433 m!225887))

(declare-fun m!225889 () Bool)

(assert (=> b!146433 m!225889))

(declare-fun m!225891 () Bool)

(assert (=> b!146433 m!225891))

(declare-fun m!225893 () Bool)

(assert (=> b!146433 m!225893))

(declare-fun m!225895 () Bool)

(assert (=> b!146433 m!225895))

(assert (=> b!146433 m!224621))

(declare-fun m!225897 () Bool)

(assert (=> b!146433 m!225897))

(declare-fun m!225899 () Bool)

(assert (=> b!146433 m!225899))

(declare-fun m!225901 () Bool)

(assert (=> b!146433 m!225901))

(declare-fun m!225903 () Bool)

(assert (=> b!146435 m!225903))

(assert (=> b!146435 m!224621))

(declare-fun m!225905 () Bool)

(assert (=> b!146435 m!225905))

(declare-fun m!225907 () Bool)

(assert (=> bm!1917 m!225907))

(declare-fun m!225909 () Bool)

(assert (=> d!47059 m!225909))

(assert (=> d!47059 m!225879))

(assert (=> bm!1915 m!225889))

(declare-fun m!225911 () Bool)

(assert (=> bm!1915 m!225911))

(assert (=> b!146434 m!225579))

(declare-fun m!225913 () Bool)

(assert (=> b!146434 m!225913))

(assert (=> d!46867 d!47059))

(declare-fun d!47061 () Bool)

(assert (=> d!47061 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) (bvsub (bvsub to!404 from!447) lt!226915)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!226915)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11533 () Bool)

(assert (= bs!11533 d!47061))

(assert (=> bs!11533 m!225179))

(assert (=> b!146166 d!47061))

(assert (=> d!46822 d!46951))

(declare-fun d!47063 () Bool)

(assert (=> d!47063 (= (invariant!0 (currentBit!6338 (_2!6881 lt!226224)) (currentByte!6343 (_2!6881 lt!226224)) (size!3002 (buf!3447 (_2!6881 lt!226224)))) (and (bvsge (currentBit!6338 (_2!6881 lt!226224)) #b00000000000000000000000000000000) (bvslt (currentBit!6338 (_2!6881 lt!226224)) #b00000000000000000000000000001000) (bvsge (currentByte!6343 (_2!6881 lt!226224)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6343 (_2!6881 lt!226224)) (size!3002 (buf!3447 (_2!6881 lt!226224)))) (and (= (currentBit!6338 (_2!6881 lt!226224)) #b00000000000000000000000000000000) (= (currentByte!6343 (_2!6881 lt!226224)) (size!3002 (buf!3447 (_2!6881 lt!226224))))))))))

(assert (=> d!46822 d!47063))

(assert (=> d!46879 d!46907))

(declare-fun d!47065 () Bool)

(assert (=> d!47065 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226210))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226210)))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226210))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226210))))))))

(assert (=> d!46820 d!47065))

(declare-fun d!47067 () Bool)

(assert (=> d!47067 (= (invariant!0 (currentBit!6338 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226210)) (size!3002 (buf!3447 (_2!6881 lt!226210)))) (and (bvsge (currentBit!6338 (_2!6881 lt!226210)) #b00000000000000000000000000000000) (bvslt (currentBit!6338 (_2!6881 lt!226210)) #b00000000000000000000000000001000) (bvsge (currentByte!6343 (_2!6881 lt!226210)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6343 (_2!6881 lt!226210)) (size!3002 (buf!3447 (_2!6881 lt!226210)))) (and (= (currentBit!6338 (_2!6881 lt!226210)) #b00000000000000000000000000000000) (= (currentByte!6343 (_2!6881 lt!226210)) (size!3002 (buf!3447 (_2!6881 lt!226210))))))))))

(assert (=> d!46820 d!47067))

(assert (=> d!46836 d!46826))

(declare-fun d!47069 () Bool)

(assert (=> d!47069 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226215)))

(assert (=> d!47069 true))

(declare-fun _$5!63 () Unit!9086)

(assert (=> d!47069 (= (choose!26 (_2!6881 lt!226224) (buf!3447 (_2!6881 lt!226210)) lt!226215 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))) _$5!63)))

(declare-fun bs!11534 () Bool)

(assert (= bs!11534 d!47069))

(assert (=> bs!11534 m!224639))

(assert (=> d!46836 d!47069))

(assert (=> d!46816 d!46891))

(declare-fun d!47071 () Bool)

(assert (=> d!47071 (= (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) ((_ sign_extend 32) (currentByte!6343 thiss!1634)) ((_ sign_extend 32) (currentBit!6338 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226210)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6343 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6338 thiss!1634)))))))

(assert (=> d!46832 d!47071))

(declare-fun d!47073 () Bool)

(declare-fun res!122498 () Bool)

(declare-fun e!97619 () Bool)

(assert (=> d!47073 (=> res!122498 e!97619)))

(assert (=> d!47073 (= res!122498 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47073 (= (arrayRangesEq!318 arr!237 (_2!6882 lt!226967) #b00000000000000000000000000000000 to!404) e!97619)))

(declare-fun b!146436 () Bool)

(declare-fun e!97620 () Bool)

(assert (=> b!146436 (= e!97619 e!97620)))

(declare-fun res!122499 () Bool)

(assert (=> b!146436 (=> (not res!122499) (not e!97620))))

(assert (=> b!146436 (= res!122499 (= (select (arr!3741 arr!237) #b00000000000000000000000000000000) (select (arr!3741 (_2!6882 lt!226967)) #b00000000000000000000000000000000)))))

(declare-fun b!146437 () Bool)

(assert (=> b!146437 (= e!97620 (arrayRangesEq!318 arr!237 (_2!6882 lt!226967) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47073 (not res!122498)) b!146436))

(assert (= (and b!146436 res!122499) b!146437))

(assert (=> b!146436 m!225365))

(declare-fun m!225915 () Bool)

(assert (=> b!146436 m!225915))

(declare-fun m!225917 () Bool)

(assert (=> b!146437 m!225917))

(assert (=> b!146186 d!47073))

(declare-fun lt!227417 () (_ BitVec 8))

(declare-fun lt!227419 () (_ BitVec 8))

(declare-fun d!47075 () Bool)

(assert (=> d!47075 (= lt!227417 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))) ((_ sign_extend 24) lt!227419))))))

(assert (=> d!47075 (= lt!227419 ((_ extract 7 0) (currentBit!6338 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))))

(declare-fun e!97622 () Bool)

(assert (=> d!47075 e!97622))

(declare-fun res!122500 () Bool)

(assert (=> d!47075 (=> (not res!122500) (not e!97622))))

(assert (=> d!47075 (= res!122500 (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))) ((_ sign_extend 32) (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) ((_ sign_extend 32) (currentBit!6338 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9142 () Unit!9086)

(declare-fun Unit!9143 () Unit!9086)

(assert (=> d!47075 (= (readByte!0 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227419) #b00000000000000000000000000000000) (tuple2!13087 Unit!9142 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227417) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) (bvadd (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227419)))))))) (tuple2!13087 Unit!9143 lt!227417))) (BitStream!5263 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) (bvadd (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6338 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))))

(declare-fun b!146438 () Bool)

(declare-fun e!97621 () Bool)

(assert (=> b!146438 (= e!97622 e!97621)))

(declare-fun res!122501 () Bool)

(assert (=> b!146438 (=> (not res!122501) (not e!97621))))

(declare-fun lt!227421 () tuple2!13084)

(assert (=> b!146438 (= res!122501 (= (buf!3447 (_2!6893 lt!227421)) (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))))

(declare-fun lt!227420 () (_ BitVec 8))

(declare-fun lt!227418 () (_ BitVec 8))

(declare-fun Unit!9144 () Unit!9086)

(declare-fun Unit!9145 () Unit!9086)

(assert (=> b!146438 (= lt!227421 (tuple2!13085 (_2!6896 (ite (bvsgt ((_ sign_extend 24) lt!227418) #b00000000000000000000000000000000) (tuple2!13087 Unit!9144 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227420) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3741 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) (bvadd (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227418)))))))) (tuple2!13087 Unit!9145 lt!227420))) (BitStream!5263 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) (bvadd (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6338 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))))))

(assert (=> b!146438 (= lt!227420 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3741 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))))) ((_ sign_extend 24) lt!227418))))))

(assert (=> b!146438 (= lt!227418 ((_ extract 7 0) (currentBit!6338 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))))

(declare-fun lt!227423 () (_ BitVec 64))

(declare-fun b!146439 () Bool)

(declare-fun lt!227422 () (_ BitVec 64))

(assert (=> b!146439 (= e!97621 (= (bitIndex!0 (size!3002 (buf!3447 (_2!6893 lt!227421))) (currentByte!6343 (_2!6893 lt!227421)) (currentBit!6338 (_2!6893 lt!227421))) (bvadd lt!227423 lt!227422)))))

(assert (=> b!146439 (or (not (= (bvand lt!227423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227422 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227423 lt!227422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146439 (= lt!227422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146439 (= lt!227423 (bitIndex!0 (size!3002 (buf!3447 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))) (currentByte!6343 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634))) (currentBit!6338 (BitStream!5263 (buf!3447 (_2!6881 lt!226210)) (currentByte!6343 thiss!1634) (currentBit!6338 thiss!1634)))))))

(assert (= (and d!47075 res!122500) b!146438))

(assert (= (and b!146438 res!122501) b!146439))

(declare-fun m!225919 () Bool)

(assert (=> d!47075 m!225919))

(declare-fun m!225921 () Bool)

(assert (=> d!47075 m!225921))

(declare-fun m!225923 () Bool)

(assert (=> d!47075 m!225923))

(assert (=> b!146438 m!225923))

(assert (=> b!146438 m!225919))

(declare-fun m!225925 () Bool)

(assert (=> b!146439 m!225925))

(declare-fun m!225927 () Bool)

(assert (=> b!146439 m!225927))

(assert (=> d!46853 d!47075))

(declare-fun d!47077 () Bool)

(assert (=> d!47077 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224))) lt!226971) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3002 (buf!3447 (_2!6881 lt!226224)))) ((_ sign_extend 32) (currentByte!6343 (_2!6881 lt!226224))) ((_ sign_extend 32) (currentBit!6338 (_2!6881 lt!226224)))) lt!226971))))

(declare-fun bs!11535 () Bool)

(assert (= bs!11535 d!47077))

(assert (=> bs!11535 m!225179))

(assert (=> b!146188 d!47077))

(declare-fun d!47079 () Bool)

(declare-fun res!122502 () Bool)

(declare-fun e!97624 () Bool)

(assert (=> d!47079 (=> (not res!122502) (not e!97624))))

(assert (=> d!47079 (= res!122502 (= (size!3002 (buf!3447 (_1!6883 lt!226926))) (size!3002 (buf!3447 (_2!6881 lt!226224)))))))

(assert (=> d!47079 (= (isPrefixOf!0 (_1!6883 lt!226926) (_2!6881 lt!226224)) e!97624)))

(declare-fun b!146440 () Bool)

(declare-fun res!122503 () Bool)

(assert (=> b!146440 (=> (not res!122503) (not e!97624))))

(assert (=> b!146440 (= res!122503 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226926))) (currentByte!6343 (_1!6883 lt!226926)) (currentBit!6338 (_1!6883 lt!226926))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226224))) (currentByte!6343 (_2!6881 lt!226224)) (currentBit!6338 (_2!6881 lt!226224)))))))

(declare-fun b!146441 () Bool)

(declare-fun e!97623 () Bool)

(assert (=> b!146441 (= e!97624 e!97623)))

(declare-fun res!122504 () Bool)

(assert (=> b!146441 (=> res!122504 e!97623)))

(assert (=> b!146441 (= res!122504 (= (size!3002 (buf!3447 (_1!6883 lt!226926))) #b00000000000000000000000000000000))))

(declare-fun b!146442 () Bool)

(assert (=> b!146442 (= e!97623 (arrayBitRangesEq!0 (buf!3447 (_1!6883 lt!226926)) (buf!3447 (_2!6881 lt!226224)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_1!6883 lt!226926))) (currentByte!6343 (_1!6883 lt!226926)) (currentBit!6338 (_1!6883 lt!226926)))))))

(assert (= (and d!47079 res!122502) b!146440))

(assert (= (and b!146440 res!122503) b!146441))

(assert (= (and b!146441 (not res!122504)) b!146442))

(assert (=> b!146440 m!225601))

(assert (=> b!146440 m!224667))

(assert (=> b!146442 m!225601))

(assert (=> b!146442 m!225601))

(declare-fun m!225929 () Bool)

(assert (=> b!146442 m!225929))

(assert (=> b!146170 d!47079))

(declare-fun d!47081 () Bool)

(declare-fun res!122505 () Bool)

(declare-fun e!97626 () Bool)

(assert (=> d!47081 (=> (not res!122505) (not e!97626))))

(assert (=> d!47081 (= res!122505 (= (size!3002 (buf!3447 (_2!6883 lt!226869))) (size!3002 (buf!3447 (_2!6881 lt!226210)))))))

(assert (=> d!47081 (= (isPrefixOf!0 (_2!6883 lt!226869) (_2!6881 lt!226210)) e!97626)))

(declare-fun b!146443 () Bool)

(declare-fun res!122506 () Bool)

(assert (=> b!146443 (=> (not res!122506) (not e!97626))))

(assert (=> b!146443 (= res!122506 (bvsle (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226869))) (currentByte!6343 (_2!6883 lt!226869)) (currentBit!6338 (_2!6883 lt!226869))) (bitIndex!0 (size!3002 (buf!3447 (_2!6881 lt!226210))) (currentByte!6343 (_2!6881 lt!226210)) (currentBit!6338 (_2!6881 lt!226210)))))))

(declare-fun b!146444 () Bool)

(declare-fun e!97625 () Bool)

(assert (=> b!146444 (= e!97626 e!97625)))

(declare-fun res!122507 () Bool)

(assert (=> b!146444 (=> res!122507 e!97625)))

(assert (=> b!146444 (= res!122507 (= (size!3002 (buf!3447 (_2!6883 lt!226869))) #b00000000000000000000000000000000))))

(declare-fun b!146445 () Bool)

(assert (=> b!146445 (= e!97625 (arrayBitRangesEq!0 (buf!3447 (_2!6883 lt!226869)) (buf!3447 (_2!6881 lt!226210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3002 (buf!3447 (_2!6883 lt!226869))) (currentByte!6343 (_2!6883 lt!226869)) (currentBit!6338 (_2!6883 lt!226869)))))))

(assert (= (and d!47081 res!122505) b!146443))

(assert (= (and b!146443 res!122506) b!146444))

(assert (= (and b!146444 (not res!122507)) b!146445))

(assert (=> b!146443 m!225497))

(assert (=> b!146443 m!224683))

(assert (=> b!146445 m!225497))

(assert (=> b!146445 m!225497))

(declare-fun m!225931 () Bool)

(assert (=> b!146445 m!225931))

(assert (=> b!146148 d!47081))

(check-sat (not bm!1904) (not b!146384) (not d!47017) (not d!47029) (not d!46911) (not b!146439) (not b!146407) (not b!146393) (not b!146323) (not bm!1902) (not b!146358) (not d!46989) (not b!146376) (not b!146374) (not b!146397) (not d!47011) (not d!46925) (not b!146319) (not b!146314) (not b!146400) (not d!47033) (not b!146288) (not b!146361) (not b!146295) (not b!146324) (not b!146258) (not b!146257) (not b!146282) (not b!146332) (not b!146248) (not d!47075) (not b!146260) (not b!146315) (not d!47061) (not d!46991) (not b!146445) (not d!47001) (not b!146343) (not b!146329) (not d!47021) (not d!46959) (not d!47077) (not b!146435) (not b!146346) (not d!47051) (not b!146336) (not b!146375) (not b!146274) (not b!146411) (not bm!1894) (not bm!1910) (not b!146289) (not d!47035) (not bm!1911) (not b!146344) (not d!47013) (not b!146391) (not b!146313) (not d!47023) (not d!47059) (not bm!1914) (not d!47003) (not b!146242) (not bm!1906) (not b!146355) (not b!146427) (not bm!1909) (not d!46945) (not b!146252) (not b!146277) (not b!146278) (not b!146320) (not b!146350) (not b!146428) (not b!146318) (not d!46947) (not d!46903) (not b!146404) (not b!146321) (not b!146379) (not bm!1901) (not bm!1903) (not d!47005) (not d!46955) (not b!146337) (not b!146442) (not b!146294) (not b!146262) (not b!146347) (not b!146396) (not bm!1915) (not b!146432) (not b!146430) (not d!46897) (not b!146443) (not b!146276) (not b!146387) (not b!146339) (not b!146298) (not d!46901) (not d!46965) (not d!47015) (not d!47009) (not b!146330) (not b!146300) (not b!146311) (not b!146437) (not b!146326) (not b!146317) (not b!146327) (not b!146390) (not b!146312) (not bm!1908) (not d!46931) (not b!146353) (not d!47007) (not b!146440) (not bm!1916) (not d!46923) (not d!47049) (not b!146297) (not b!146395) (not d!46953) (not d!46987) (not d!46933) (not b!146286) (not d!46939) (not d!46909) (not d!46927) (not b!146405) (not bm!1907) (not d!46979) (not d!46999) (not d!47055) (not b!146372) (not b!146359) (not b!146385) (not d!46957) (not b!146280) (not d!47053) (not b!146275) (not b!146349) (not d!46917) (not d!46949) (not d!47039) (not b!146291) (not b!146377) (not b!146412) (not b!146426) (not b!146394) (not b!146433) (not bm!1913) (not b!146239) (not d!47025) (not b!146425) (not b!146352) (not bm!1905) (not b!146434) (not d!47069) (not b!146292) (not bm!1917) (not b!146254) (not bm!1912) (not b!146414) (not b!146373) (not b!146240) (not b!146378) (not b!146356) (not d!46997))
(check-sat)
