; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26362 () Bool)

(assert start!26362)

(declare-fun b!135021 () Bool)

(declare-fun e!89612 () Bool)

(declare-fun e!89609 () Bool)

(assert (=> b!135021 (= e!89612 e!89609)))

(declare-fun res!112257 () Bool)

(assert (=> b!135021 (=> (not res!112257) (not e!89609))))

(declare-fun lt!209526 () (_ BitVec 64))

(declare-datatypes ((array!6162 0))(
  ( (array!6163 (arr!3454 (Array (_ BitVec 32) (_ BitVec 8))) (size!2789 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4842 0))(
  ( (BitStream!4843 (buf!3182 array!6162) (currentByte!5979 (_ BitVec 32)) (currentBit!5974 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8416 0))(
  ( (Unit!8417) )
))
(declare-datatypes ((tuple2!11708 0))(
  ( (tuple2!11709 (_1!6170 Unit!8416) (_2!6170 BitStream!4842)) )
))
(declare-fun lt!209508 () tuple2!11708)

(declare-fun lt!209525 () tuple2!11708)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135021 (= res!112257 (= (bitIndex!0 (size!2789 (buf!3182 (_2!6170 lt!209508))) (currentByte!5979 (_2!6170 lt!209508)) (currentBit!5974 (_2!6170 lt!209508))) (bvadd (bitIndex!0 (size!2789 (buf!3182 (_2!6170 lt!209525))) (currentByte!5979 (_2!6170 lt!209525)) (currentBit!5974 (_2!6170 lt!209525))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209526))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!135021 (= lt!209526 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135022 () Bool)

(declare-fun res!112265 () Bool)

(declare-fun e!89611 () Bool)

(assert (=> b!135022 (=> (not res!112265) (not e!89611))))

(declare-fun thiss!1634 () BitStream!4842)

(assert (=> b!135022 (= res!112265 (= (bitIndex!0 (size!2789 (buf!3182 (_2!6170 lt!209525))) (currentByte!5979 (_2!6170 lt!209525)) (currentBit!5974 (_2!6170 lt!209525))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2789 (buf!3182 thiss!1634)) (currentByte!5979 thiss!1634) (currentBit!5974 thiss!1634)))))))

(declare-fun b!135023 () Bool)

(declare-fun res!112254 () Bool)

(assert (=> b!135023 (=> (not res!112254) (not e!89609))))

(declare-fun isPrefixOf!0 (BitStream!4842 BitStream!4842) Bool)

(assert (=> b!135023 (= res!112254 (isPrefixOf!0 (_2!6170 lt!209525) (_2!6170 lt!209508)))))

(declare-fun b!135024 () Bool)

(declare-fun e!89614 () Bool)

(assert (=> b!135024 (= e!89609 (not e!89614))))

(declare-fun res!112261 () Bool)

(assert (=> b!135024 (=> res!112261 e!89614)))

(declare-datatypes ((tuple2!11710 0))(
  ( (tuple2!11711 (_1!6171 BitStream!4842) (_2!6171 array!6162)) )
))
(declare-fun lt!209522 () tuple2!11710)

(declare-fun arr!237 () array!6162)

(declare-datatypes ((tuple2!11712 0))(
  ( (tuple2!11713 (_1!6172 BitStream!4842) (_2!6172 BitStream!4842)) )
))
(declare-fun lt!209527 () tuple2!11712)

(assert (=> b!135024 (= res!112261 (or (not (= (size!2789 (_2!6171 lt!209522)) (size!2789 arr!237))) (not (= (_1!6171 lt!209522) (_2!6172 lt!209527)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4842 array!6162 (_ BitVec 32) (_ BitVec 32)) tuple2!11710)

(assert (=> b!135024 (= lt!209522 (readByteArrayLoopPure!0 (_1!6172 lt!209527) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135024 (validate_offset_bits!1 ((_ sign_extend 32) (size!2789 (buf!3182 (_2!6170 lt!209508)))) ((_ sign_extend 32) (currentByte!5979 (_2!6170 lt!209525))) ((_ sign_extend 32) (currentBit!5974 (_2!6170 lt!209525))) lt!209526)))

(declare-fun lt!209513 () Unit!8416)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4842 array!6162 (_ BitVec 64)) Unit!8416)

(assert (=> b!135024 (= lt!209513 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6170 lt!209525) (buf!3182 (_2!6170 lt!209508)) lt!209526))))

(declare-fun reader!0 (BitStream!4842 BitStream!4842) tuple2!11712)

(assert (=> b!135024 (= lt!209527 (reader!0 (_2!6170 lt!209525) (_2!6170 lt!209508)))))

(declare-fun b!135025 () Bool)

(declare-fun arrayRangesEq!192 (array!6162 array!6162 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135025 (= e!89614 (not (arrayRangesEq!192 arr!237 (_2!6171 lt!209522) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135026 () Bool)

(declare-fun e!89613 () Bool)

(declare-fun array_inv!2578 (array!6162) Bool)

(assert (=> b!135026 (= e!89613 (array_inv!2578 (buf!3182 thiss!1634)))))

(declare-fun b!135027 () Bool)

(declare-fun e!89615 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135027 (= e!89615 (invariant!0 (currentBit!5974 thiss!1634) (currentByte!5979 thiss!1634) (size!2789 (buf!3182 (_2!6170 lt!209525)))))))

(declare-fun b!135028 () Bool)

(declare-fun res!112263 () Bool)

(declare-fun e!89616 () Bool)

(assert (=> b!135028 (=> (not res!112263) (not e!89616))))

(assert (=> b!135028 (= res!112263 (bvslt from!447 to!404))))

(declare-fun res!112262 () Bool)

(assert (=> start!26362 (=> (not res!112262) (not e!89616))))

(assert (=> start!26362 (= res!112262 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2789 arr!237))))))

(assert (=> start!26362 e!89616))

(assert (=> start!26362 true))

(assert (=> start!26362 (array_inv!2578 arr!237)))

(declare-fun inv!12 (BitStream!4842) Bool)

(assert (=> start!26362 (and (inv!12 thiss!1634) e!89613)))

(declare-fun lt!209512 () tuple2!11712)

(declare-datatypes ((tuple2!11714 0))(
  ( (tuple2!11715 (_1!6173 BitStream!4842) (_2!6173 (_ BitVec 8))) )
))
(declare-fun lt!209516 () tuple2!11714)

(declare-fun b!135029 () Bool)

(assert (=> b!135029 (= e!89611 (and (= (_2!6173 lt!209516) (select (arr!3454 arr!237) from!447)) (= (_1!6173 lt!209516) (_2!6172 lt!209512))))))

(declare-fun readBytePure!0 (BitStream!4842) tuple2!11714)

(assert (=> b!135029 (= lt!209516 (readBytePure!0 (_1!6172 lt!209512)))))

(assert (=> b!135029 (= lt!209512 (reader!0 thiss!1634 (_2!6170 lt!209525)))))

(declare-fun b!135030 () Bool)

(declare-fun e!89607 () Bool)

(assert (=> b!135030 (= e!89607 true)))

(declare-fun lt!209509 () tuple2!11710)

(declare-fun lt!209521 () tuple2!11710)

(assert (=> b!135030 (arrayRangesEq!192 (_2!6171 lt!209509) (_2!6171 lt!209521) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209514 () Unit!8416)

(declare-fun arrayRangesEqSymmetricLemma!5 (array!6162 array!6162 (_ BitVec 32) (_ BitVec 32)) Unit!8416)

(assert (=> b!135030 (= lt!209514 (arrayRangesEqSymmetricLemma!5 (_2!6171 lt!209521) (_2!6171 lt!209509) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135031 () Bool)

(declare-fun res!112256 () Bool)

(assert (=> b!135031 (=> (not res!112256) (not e!89616))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135031 (= res!112256 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2789 (buf!3182 thiss!1634))) ((_ sign_extend 32) (currentByte!5979 thiss!1634)) ((_ sign_extend 32) (currentBit!5974 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135032 () Bool)

(declare-fun res!112258 () Bool)

(assert (=> b!135032 (=> (not res!112258) (not e!89611))))

(assert (=> b!135032 (= res!112258 (isPrefixOf!0 thiss!1634 (_2!6170 lt!209525)))))

(declare-fun b!135033 () Bool)

(assert (=> b!135033 (= e!89616 (not e!89607))))

(declare-fun res!112255 () Bool)

(assert (=> b!135033 (=> res!112255 e!89607)))

(assert (=> b!135033 (= res!112255 (not (arrayRangesEq!192 (_2!6171 lt!209521) (_2!6171 lt!209509) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209520 () tuple2!11710)

(assert (=> b!135033 (arrayRangesEq!192 (_2!6171 lt!209521) (_2!6171 lt!209520) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209502 () tuple2!11712)

(declare-fun lt!209505 () Unit!8416)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4842 array!6162 (_ BitVec 32) (_ BitVec 32)) Unit!8416)

(assert (=> b!135033 (= lt!209505 (readByteArrayLoopArrayPrefixLemma!0 (_1!6172 lt!209502) arr!237 from!447 to!404))))

(declare-fun lt!209519 () array!6162)

(declare-fun withMovedByteIndex!0 (BitStream!4842 (_ BitVec 32)) BitStream!4842)

(assert (=> b!135033 (= lt!209520 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6172 lt!209502) #b00000000000000000000000000000001) lt!209519 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209504 () tuple2!11712)

(assert (=> b!135033 (= lt!209509 (readByteArrayLoopPure!0 (_1!6172 lt!209504) lt!209519 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209517 () tuple2!11714)

(assert (=> b!135033 (= lt!209519 (array!6163 (store (arr!3454 arr!237) from!447 (_2!6173 lt!209517)) (size!2789 arr!237)))))

(declare-fun lt!209507 () (_ BitVec 32))

(assert (=> b!135033 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2789 (buf!3182 (_2!6170 lt!209508)))) ((_ sign_extend 32) (currentByte!5979 (_2!6170 lt!209525))) ((_ sign_extend 32) (currentBit!5974 (_2!6170 lt!209525))) lt!209507)))

(declare-fun lt!209506 () Unit!8416)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4842 array!6162 (_ BitVec 32)) Unit!8416)

(assert (=> b!135033 (= lt!209506 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6170 lt!209525) (buf!3182 (_2!6170 lt!209508)) lt!209507))))

(assert (=> b!135033 (= (_1!6171 lt!209521) (_2!6172 lt!209502))))

(assert (=> b!135033 (= lt!209521 (readByteArrayLoopPure!0 (_1!6172 lt!209502) arr!237 from!447 to!404))))

(assert (=> b!135033 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2789 (buf!3182 (_2!6170 lt!209508)))) ((_ sign_extend 32) (currentByte!5979 thiss!1634)) ((_ sign_extend 32) (currentBit!5974 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209518 () Unit!8416)

(assert (=> b!135033 (= lt!209518 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3182 (_2!6170 lt!209508)) (bvsub to!404 from!447)))))

(assert (=> b!135033 (= (_2!6173 lt!209517) (select (arr!3454 arr!237) from!447))))

(assert (=> b!135033 (= lt!209517 (readBytePure!0 (_1!6172 lt!209502)))))

(assert (=> b!135033 (= lt!209504 (reader!0 (_2!6170 lt!209525) (_2!6170 lt!209508)))))

(assert (=> b!135033 (= lt!209502 (reader!0 thiss!1634 (_2!6170 lt!209508)))))

(declare-fun e!89610 () Bool)

(assert (=> b!135033 e!89610))

(declare-fun res!112266 () Bool)

(assert (=> b!135033 (=> (not res!112266) (not e!89610))))

(declare-fun lt!209503 () tuple2!11714)

(declare-fun lt!209524 () tuple2!11714)

(assert (=> b!135033 (= res!112266 (= (bitIndex!0 (size!2789 (buf!3182 (_1!6173 lt!209503))) (currentByte!5979 (_1!6173 lt!209503)) (currentBit!5974 (_1!6173 lt!209503))) (bitIndex!0 (size!2789 (buf!3182 (_1!6173 lt!209524))) (currentByte!5979 (_1!6173 lt!209524)) (currentBit!5974 (_1!6173 lt!209524)))))))

(declare-fun lt!209510 () Unit!8416)

(declare-fun lt!209511 () BitStream!4842)

(declare-fun readBytePrefixLemma!0 (BitStream!4842 BitStream!4842) Unit!8416)

(assert (=> b!135033 (= lt!209510 (readBytePrefixLemma!0 lt!209511 (_2!6170 lt!209508)))))

(assert (=> b!135033 (= lt!209524 (readBytePure!0 (BitStream!4843 (buf!3182 (_2!6170 lt!209508)) (currentByte!5979 thiss!1634) (currentBit!5974 thiss!1634))))))

(assert (=> b!135033 (= lt!209503 (readBytePure!0 lt!209511))))

(assert (=> b!135033 (= lt!209511 (BitStream!4843 (buf!3182 (_2!6170 lt!209525)) (currentByte!5979 thiss!1634) (currentBit!5974 thiss!1634)))))

(assert (=> b!135033 e!89615))

(declare-fun res!112259 () Bool)

(assert (=> b!135033 (=> (not res!112259) (not e!89615))))

(assert (=> b!135033 (= res!112259 (isPrefixOf!0 thiss!1634 (_2!6170 lt!209508)))))

(declare-fun lt!209515 () Unit!8416)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4842 BitStream!4842 BitStream!4842) Unit!8416)

(assert (=> b!135033 (= lt!209515 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6170 lt!209525) (_2!6170 lt!209508)))))

(assert (=> b!135033 e!89612))

(declare-fun res!112260 () Bool)

(assert (=> b!135033 (=> (not res!112260) (not e!89612))))

(assert (=> b!135033 (= res!112260 (= (size!2789 (buf!3182 (_2!6170 lt!209525))) (size!2789 (buf!3182 (_2!6170 lt!209508)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4842 array!6162 (_ BitVec 32) (_ BitVec 32)) tuple2!11708)

(assert (=> b!135033 (= lt!209508 (appendByteArrayLoop!0 (_2!6170 lt!209525) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135033 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2789 (buf!3182 (_2!6170 lt!209525)))) ((_ sign_extend 32) (currentByte!5979 (_2!6170 lt!209525))) ((_ sign_extend 32) (currentBit!5974 (_2!6170 lt!209525))) lt!209507)))

(assert (=> b!135033 (= lt!209507 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209523 () Unit!8416)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4842 BitStream!4842 (_ BitVec 64) (_ BitVec 32)) Unit!8416)

(assert (=> b!135033 (= lt!209523 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6170 lt!209525) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135033 e!89611))

(declare-fun res!112264 () Bool)

(assert (=> b!135033 (=> (not res!112264) (not e!89611))))

(assert (=> b!135033 (= res!112264 (= (size!2789 (buf!3182 thiss!1634)) (size!2789 (buf!3182 (_2!6170 lt!209525)))))))

(declare-fun appendByte!0 (BitStream!4842 (_ BitVec 8)) tuple2!11708)

(assert (=> b!135033 (= lt!209525 (appendByte!0 thiss!1634 (select (arr!3454 arr!237) from!447)))))

(declare-fun b!135034 () Bool)

(declare-fun res!112253 () Bool)

(assert (=> b!135034 (=> (not res!112253) (not e!89616))))

(assert (=> b!135034 (= res!112253 (invariant!0 (currentBit!5974 thiss!1634) (currentByte!5979 thiss!1634) (size!2789 (buf!3182 thiss!1634))))))

(declare-fun b!135035 () Bool)

(assert (=> b!135035 (= e!89610 (= (_2!6173 lt!209503) (_2!6173 lt!209524)))))

(assert (= (and start!26362 res!112262) b!135031))

(assert (= (and b!135031 res!112256) b!135028))

(assert (= (and b!135028 res!112263) b!135034))

(assert (= (and b!135034 res!112253) b!135033))

(assert (= (and b!135033 res!112264) b!135022))

(assert (= (and b!135022 res!112265) b!135032))

(assert (= (and b!135032 res!112258) b!135029))

(assert (= (and b!135033 res!112260) b!135021))

(assert (= (and b!135021 res!112257) b!135023))

(assert (= (and b!135023 res!112254) b!135024))

(assert (= (and b!135024 (not res!112261)) b!135025))

(assert (= (and b!135033 res!112259) b!135027))

(assert (= (and b!135033 res!112266) b!135035))

(assert (= (and b!135033 (not res!112255)) b!135030))

(assert (= start!26362 b!135026))

(declare-fun m!205767 () Bool)

(assert (=> b!135030 m!205767))

(declare-fun m!205769 () Bool)

(assert (=> b!135030 m!205769))

(declare-fun m!205771 () Bool)

(assert (=> b!135027 m!205771))

(declare-fun m!205773 () Bool)

(assert (=> b!135025 m!205773))

(declare-fun m!205775 () Bool)

(assert (=> b!135031 m!205775))

(declare-fun m!205777 () Bool)

(assert (=> b!135032 m!205777))

(declare-fun m!205779 () Bool)

(assert (=> b!135034 m!205779))

(declare-fun m!205781 () Bool)

(assert (=> start!26362 m!205781))

(declare-fun m!205783 () Bool)

(assert (=> start!26362 m!205783))

(declare-fun m!205785 () Bool)

(assert (=> b!135033 m!205785))

(declare-fun m!205787 () Bool)

(assert (=> b!135033 m!205787))

(declare-fun m!205789 () Bool)

(assert (=> b!135033 m!205789))

(declare-fun m!205791 () Bool)

(assert (=> b!135033 m!205791))

(declare-fun m!205793 () Bool)

(assert (=> b!135033 m!205793))

(declare-fun m!205795 () Bool)

(assert (=> b!135033 m!205795))

(declare-fun m!205797 () Bool)

(assert (=> b!135033 m!205797))

(declare-fun m!205799 () Bool)

(assert (=> b!135033 m!205799))

(declare-fun m!205801 () Bool)

(assert (=> b!135033 m!205801))

(declare-fun m!205803 () Bool)

(assert (=> b!135033 m!205803))

(declare-fun m!205805 () Bool)

(assert (=> b!135033 m!205805))

(declare-fun m!205807 () Bool)

(assert (=> b!135033 m!205807))

(declare-fun m!205809 () Bool)

(assert (=> b!135033 m!205809))

(assert (=> b!135033 m!205805))

(declare-fun m!205811 () Bool)

(assert (=> b!135033 m!205811))

(declare-fun m!205813 () Bool)

(assert (=> b!135033 m!205813))

(declare-fun m!205815 () Bool)

(assert (=> b!135033 m!205815))

(declare-fun m!205817 () Bool)

(assert (=> b!135033 m!205817))

(declare-fun m!205819 () Bool)

(assert (=> b!135033 m!205819))

(declare-fun m!205821 () Bool)

(assert (=> b!135033 m!205821))

(declare-fun m!205823 () Bool)

(assert (=> b!135033 m!205823))

(declare-fun m!205825 () Bool)

(assert (=> b!135033 m!205825))

(declare-fun m!205827 () Bool)

(assert (=> b!135033 m!205827))

(declare-fun m!205829 () Bool)

(assert (=> b!135033 m!205829))

(declare-fun m!205831 () Bool)

(assert (=> b!135033 m!205831))

(declare-fun m!205833 () Bool)

(assert (=> b!135033 m!205833))

(declare-fun m!205835 () Bool)

(assert (=> b!135033 m!205835))

(declare-fun m!205837 () Bool)

(assert (=> b!135033 m!205837))

(assert (=> b!135033 m!205795))

(declare-fun m!205839 () Bool)

(assert (=> b!135024 m!205839))

(declare-fun m!205841 () Bool)

(assert (=> b!135024 m!205841))

(declare-fun m!205843 () Bool)

(assert (=> b!135024 m!205843))

(assert (=> b!135024 m!205823))

(assert (=> b!135029 m!205795))

(declare-fun m!205845 () Bool)

(assert (=> b!135029 m!205845))

(declare-fun m!205847 () Bool)

(assert (=> b!135029 m!205847))

(declare-fun m!205849 () Bool)

(assert (=> b!135022 m!205849))

(declare-fun m!205851 () Bool)

(assert (=> b!135022 m!205851))

(declare-fun m!205853 () Bool)

(assert (=> b!135021 m!205853))

(assert (=> b!135021 m!205849))

(declare-fun m!205855 () Bool)

(assert (=> b!135023 m!205855))

(declare-fun m!205857 () Bool)

(assert (=> b!135026 m!205857))

(check-sat (not b!135032) (not b!135027) (not b!135025) (not start!26362) (not b!135023) (not b!135030) (not b!135034) (not b!135024) (not b!135022) (not b!135031) (not b!135021) (not b!135033) (not b!135029) (not b!135026))
