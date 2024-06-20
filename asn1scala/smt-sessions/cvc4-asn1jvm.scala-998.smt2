; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28014 () Bool)

(assert start!28014)

(declare-fun b!145115 () Bool)

(declare-fun res!121312 () Bool)

(declare-fun e!96742 () Bool)

(assert (=> b!145115 (=> (not res!121312) (not e!96742))))

(declare-datatypes ((array!6606 0))(
  ( (array!6607 (arr!3724 (Array (_ BitVec 32) (_ BitVec 8))) (size!2991 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5240 0))(
  ( (BitStream!5241 (buf!3430 array!6606) (currentByte!6320 (_ BitVec 32)) (currentBit!6315 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9055 0))(
  ( (Unit!9056) )
))
(declare-datatypes ((tuple2!12970 0))(
  ( (tuple2!12971 (_1!6831 Unit!9055) (_2!6831 BitStream!5240)) )
))
(declare-fun lt!224846 () tuple2!12970)

(declare-fun lt!224842 () tuple2!12970)

(declare-fun isPrefixOf!0 (BitStream!5240 BitStream!5240) Bool)

(assert (=> b!145115 (= res!121312 (isPrefixOf!0 (_2!6831 lt!224846) (_2!6831 lt!224842)))))

(declare-fun b!145116 () Bool)

(declare-fun res!121323 () Bool)

(declare-fun e!96739 () Bool)

(assert (=> b!145116 (=> (not res!121323) (not e!96739))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun thiss!1634 () BitStream!5240)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145116 (= res!121323 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2991 (buf!3430 thiss!1634))) ((_ sign_extend 32) (currentByte!6320 thiss!1634)) ((_ sign_extend 32) (currentBit!6315 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145117 () Bool)

(declare-fun e!96734 () Bool)

(declare-fun array_inv!2780 (array!6606) Bool)

(assert (=> b!145117 (= e!96734 (array_inv!2780 (buf!3430 thiss!1634)))))

(declare-fun b!145118 () Bool)

(declare-fun res!121324 () Bool)

(assert (=> b!145118 (=> (not res!121324) (not e!96739))))

(assert (=> b!145118 (= res!121324 (bvslt from!447 to!404))))

(declare-fun b!145119 () Bool)

(declare-fun e!96735 () Bool)

(assert (=> b!145119 (= e!96742 (not e!96735))))

(declare-fun res!121320 () Bool)

(assert (=> b!145119 (=> res!121320 e!96735)))

(declare-datatypes ((tuple2!12972 0))(
  ( (tuple2!12973 (_1!6832 BitStream!5240) (_2!6832 array!6606)) )
))
(declare-fun lt!224832 () tuple2!12972)

(declare-fun arr!237 () array!6606)

(declare-datatypes ((tuple2!12974 0))(
  ( (tuple2!12975 (_1!6833 BitStream!5240) (_2!6833 BitStream!5240)) )
))
(declare-fun lt!224831 () tuple2!12974)

(assert (=> b!145119 (= res!121320 (or (not (= (size!2991 (_2!6832 lt!224832)) (size!2991 arr!237))) (not (= (_1!6832 lt!224832) (_2!6833 lt!224831)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5240 array!6606 (_ BitVec 32) (_ BitVec 32)) tuple2!12972)

(assert (=> b!145119 (= lt!224832 (readByteArrayLoopPure!0 (_1!6833 lt!224831) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224833 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2991 (buf!3430 (_2!6831 lt!224842)))) ((_ sign_extend 32) (currentByte!6320 (_2!6831 lt!224846))) ((_ sign_extend 32) (currentBit!6315 (_2!6831 lt!224846))) lt!224833)))

(declare-fun lt!224829 () Unit!9055)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5240 array!6606 (_ BitVec 64)) Unit!9055)

(assert (=> b!145119 (= lt!224829 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6831 lt!224846) (buf!3430 (_2!6831 lt!224842)) lt!224833))))

(declare-fun reader!0 (BitStream!5240 BitStream!5240) tuple2!12974)

(assert (=> b!145119 (= lt!224831 (reader!0 (_2!6831 lt!224846) (_2!6831 lt!224842)))))

(declare-fun b!145120 () Bool)

(declare-fun res!121317 () Bool)

(declare-fun e!96740 () Bool)

(assert (=> b!145120 (=> (not res!121317) (not e!96740))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145120 (= res!121317 (= (bitIndex!0 (size!2991 (buf!3430 (_2!6831 lt!224846))) (currentByte!6320 (_2!6831 lt!224846)) (currentBit!6315 (_2!6831 lt!224846))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2991 (buf!3430 thiss!1634)) (currentByte!6320 thiss!1634) (currentBit!6315 thiss!1634)))))))

(declare-fun b!145121 () Bool)

(declare-fun e!96741 () Bool)

(assert (=> b!145121 (= e!96741 e!96742)))

(declare-fun res!121321 () Bool)

(assert (=> b!145121 (=> (not res!121321) (not e!96742))))

(assert (=> b!145121 (= res!121321 (= (bitIndex!0 (size!2991 (buf!3430 (_2!6831 lt!224842))) (currentByte!6320 (_2!6831 lt!224842)) (currentBit!6315 (_2!6831 lt!224842))) (bvadd (bitIndex!0 (size!2991 (buf!3430 (_2!6831 lt!224846))) (currentByte!6320 (_2!6831 lt!224846)) (currentBit!6315 (_2!6831 lt!224846))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224833))))))

(assert (=> b!145121 (= lt!224833 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!224845 () tuple2!12974)

(declare-fun b!145123 () Bool)

(declare-fun e!96738 () Bool)

(assert (=> b!145123 (= e!96738 (= (_1!6832 (readByteArrayLoopPure!0 (_1!6833 lt!224845) arr!237 from!447 to!404)) (_2!6833 lt!224845)))))

(declare-fun b!145124 () Bool)

(assert (=> b!145124 (= e!96739 (not (bvslt from!447 (size!2991 arr!237))))))

(declare-fun lt!224830 () (_ BitVec 32))

(assert (=> b!145124 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2991 (buf!3430 (_2!6831 lt!224842)))) ((_ sign_extend 32) (currentByte!6320 (_2!6831 lt!224846))) ((_ sign_extend 32) (currentBit!6315 (_2!6831 lt!224846))) lt!224830)))

(declare-fun lt!224836 () Unit!9055)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5240 array!6606 (_ BitVec 32)) Unit!9055)

(assert (=> b!145124 (= lt!224836 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6831 lt!224846) (buf!3430 (_2!6831 lt!224842)) lt!224830))))

(assert (=> b!145124 e!96738))

(declare-fun res!121311 () Bool)

(assert (=> b!145124 (=> (not res!121311) (not e!96738))))

(assert (=> b!145124 (= res!121311 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2991 (buf!3430 (_2!6831 lt!224842)))) ((_ sign_extend 32) (currentByte!6320 thiss!1634)) ((_ sign_extend 32) (currentBit!6315 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224843 () Unit!9055)

(assert (=> b!145124 (= lt!224843 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3430 (_2!6831 lt!224842)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12976 0))(
  ( (tuple2!12977 (_1!6834 BitStream!5240) (_2!6834 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5240) tuple2!12976)

(assert (=> b!145124 (= (_2!6834 (readBytePure!0 (_1!6833 lt!224845))) (select (arr!3724 arr!237) from!447))))

(declare-fun lt!224838 () tuple2!12974)

(assert (=> b!145124 (= lt!224838 (reader!0 (_2!6831 lt!224846) (_2!6831 lt!224842)))))

(assert (=> b!145124 (= lt!224845 (reader!0 thiss!1634 (_2!6831 lt!224842)))))

(declare-fun e!96744 () Bool)

(assert (=> b!145124 e!96744))

(declare-fun res!121315 () Bool)

(assert (=> b!145124 (=> (not res!121315) (not e!96744))))

(declare-fun lt!224841 () tuple2!12976)

(declare-fun lt!224837 () tuple2!12976)

(assert (=> b!145124 (= res!121315 (= (bitIndex!0 (size!2991 (buf!3430 (_1!6834 lt!224841))) (currentByte!6320 (_1!6834 lt!224841)) (currentBit!6315 (_1!6834 lt!224841))) (bitIndex!0 (size!2991 (buf!3430 (_1!6834 lt!224837))) (currentByte!6320 (_1!6834 lt!224837)) (currentBit!6315 (_1!6834 lt!224837)))))))

(declare-fun lt!224847 () Unit!9055)

(declare-fun lt!224844 () BitStream!5240)

(declare-fun readBytePrefixLemma!0 (BitStream!5240 BitStream!5240) Unit!9055)

(assert (=> b!145124 (= lt!224847 (readBytePrefixLemma!0 lt!224844 (_2!6831 lt!224842)))))

(assert (=> b!145124 (= lt!224837 (readBytePure!0 (BitStream!5241 (buf!3430 (_2!6831 lt!224842)) (currentByte!6320 thiss!1634) (currentBit!6315 thiss!1634))))))

(assert (=> b!145124 (= lt!224841 (readBytePure!0 lt!224844))))

(assert (=> b!145124 (= lt!224844 (BitStream!5241 (buf!3430 (_2!6831 lt!224846)) (currentByte!6320 thiss!1634) (currentBit!6315 thiss!1634)))))

(declare-fun e!96737 () Bool)

(assert (=> b!145124 e!96737))

(declare-fun res!121319 () Bool)

(assert (=> b!145124 (=> (not res!121319) (not e!96737))))

(assert (=> b!145124 (= res!121319 (isPrefixOf!0 thiss!1634 (_2!6831 lt!224842)))))

(declare-fun lt!224840 () Unit!9055)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5240 BitStream!5240 BitStream!5240) Unit!9055)

(assert (=> b!145124 (= lt!224840 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6831 lt!224846) (_2!6831 lt!224842)))))

(assert (=> b!145124 e!96741))

(declare-fun res!121314 () Bool)

(assert (=> b!145124 (=> (not res!121314) (not e!96741))))

(assert (=> b!145124 (= res!121314 (= (size!2991 (buf!3430 (_2!6831 lt!224846))) (size!2991 (buf!3430 (_2!6831 lt!224842)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5240 array!6606 (_ BitVec 32) (_ BitVec 32)) tuple2!12970)

(assert (=> b!145124 (= lt!224842 (appendByteArrayLoop!0 (_2!6831 lt!224846) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145124 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2991 (buf!3430 (_2!6831 lt!224846)))) ((_ sign_extend 32) (currentByte!6320 (_2!6831 lt!224846))) ((_ sign_extend 32) (currentBit!6315 (_2!6831 lt!224846))) lt!224830)))

(assert (=> b!145124 (= lt!224830 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224839 () Unit!9055)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5240 BitStream!5240 (_ BitVec 64) (_ BitVec 32)) Unit!9055)

(assert (=> b!145124 (= lt!224839 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6831 lt!224846) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145124 e!96740))

(declare-fun res!121322 () Bool)

(assert (=> b!145124 (=> (not res!121322) (not e!96740))))

(assert (=> b!145124 (= res!121322 (= (size!2991 (buf!3430 thiss!1634)) (size!2991 (buf!3430 (_2!6831 lt!224846)))))))

(declare-fun appendByte!0 (BitStream!5240 (_ BitVec 8)) tuple2!12970)

(assert (=> b!145124 (= lt!224846 (appendByte!0 thiss!1634 (select (arr!3724 arr!237) from!447)))))

(declare-fun b!145125 () Bool)

(declare-fun arrayRangesEq!307 (array!6606 array!6606 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145125 (= e!96735 (not (arrayRangesEq!307 arr!237 (_2!6832 lt!224832) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!224834 () tuple2!12974)

(declare-fun lt!224835 () tuple2!12976)

(declare-fun b!145126 () Bool)

(assert (=> b!145126 (= e!96740 (and (= (_2!6834 lt!224835) (select (arr!3724 arr!237) from!447)) (= (_1!6834 lt!224835) (_2!6833 lt!224834))))))

(assert (=> b!145126 (= lt!224835 (readBytePure!0 (_1!6833 lt!224834)))))

(assert (=> b!145126 (= lt!224834 (reader!0 thiss!1634 (_2!6831 lt!224846)))))

(declare-fun b!145127 () Bool)

(declare-fun res!121318 () Bool)

(assert (=> b!145127 (=> (not res!121318) (not e!96739))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145127 (= res!121318 (invariant!0 (currentBit!6315 thiss!1634) (currentByte!6320 thiss!1634) (size!2991 (buf!3430 thiss!1634))))))

(declare-fun b!145122 () Bool)

(assert (=> b!145122 (= e!96737 (invariant!0 (currentBit!6315 thiss!1634) (currentByte!6320 thiss!1634) (size!2991 (buf!3430 (_2!6831 lt!224846)))))))

(declare-fun res!121316 () Bool)

(assert (=> start!28014 (=> (not res!121316) (not e!96739))))

(assert (=> start!28014 (= res!121316 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2991 arr!237))))))

(assert (=> start!28014 e!96739))

(assert (=> start!28014 true))

(assert (=> start!28014 (array_inv!2780 arr!237)))

(declare-fun inv!12 (BitStream!5240) Bool)

(assert (=> start!28014 (and (inv!12 thiss!1634) e!96734)))

(declare-fun b!145128 () Bool)

(declare-fun res!121313 () Bool)

(assert (=> b!145128 (=> (not res!121313) (not e!96740))))

(assert (=> b!145128 (= res!121313 (isPrefixOf!0 thiss!1634 (_2!6831 lt!224846)))))

(declare-fun b!145129 () Bool)

(assert (=> b!145129 (= e!96744 (= (_2!6834 lt!224841) (_2!6834 lt!224837)))))

(assert (= (and start!28014 res!121316) b!145116))

(assert (= (and b!145116 res!121323) b!145118))

(assert (= (and b!145118 res!121324) b!145127))

(assert (= (and b!145127 res!121318) b!145124))

(assert (= (and b!145124 res!121322) b!145120))

(assert (= (and b!145120 res!121317) b!145128))

(assert (= (and b!145128 res!121313) b!145126))

(assert (= (and b!145124 res!121314) b!145121))

(assert (= (and b!145121 res!121321) b!145115))

(assert (= (and b!145115 res!121312) b!145119))

(assert (= (and b!145119 (not res!121320)) b!145125))

(assert (= (and b!145124 res!121319) b!145122))

(assert (= (and b!145124 res!121315) b!145129))

(assert (= (and b!145124 res!121311) b!145123))

(assert (= start!28014 b!145117))

(declare-fun m!223209 () Bool)

(assert (=> start!28014 m!223209))

(declare-fun m!223211 () Bool)

(assert (=> start!28014 m!223211))

(declare-fun m!223213 () Bool)

(assert (=> b!145116 m!223213))

(declare-fun m!223215 () Bool)

(assert (=> b!145120 m!223215))

(declare-fun m!223217 () Bool)

(assert (=> b!145120 m!223217))

(declare-fun m!223219 () Bool)

(assert (=> b!145122 m!223219))

(declare-fun m!223221 () Bool)

(assert (=> b!145128 m!223221))

(declare-fun m!223223 () Bool)

(assert (=> b!145124 m!223223))

(declare-fun m!223225 () Bool)

(assert (=> b!145124 m!223225))

(declare-fun m!223227 () Bool)

(assert (=> b!145124 m!223227))

(declare-fun m!223229 () Bool)

(assert (=> b!145124 m!223229))

(declare-fun m!223231 () Bool)

(assert (=> b!145124 m!223231))

(declare-fun m!223233 () Bool)

(assert (=> b!145124 m!223233))

(declare-fun m!223235 () Bool)

(assert (=> b!145124 m!223235))

(declare-fun m!223237 () Bool)

(assert (=> b!145124 m!223237))

(declare-fun m!223239 () Bool)

(assert (=> b!145124 m!223239))

(declare-fun m!223241 () Bool)

(assert (=> b!145124 m!223241))

(declare-fun m!223243 () Bool)

(assert (=> b!145124 m!223243))

(declare-fun m!223245 () Bool)

(assert (=> b!145124 m!223245))

(declare-fun m!223247 () Bool)

(assert (=> b!145124 m!223247))

(declare-fun m!223249 () Bool)

(assert (=> b!145124 m!223249))

(declare-fun m!223251 () Bool)

(assert (=> b!145124 m!223251))

(declare-fun m!223253 () Bool)

(assert (=> b!145124 m!223253))

(declare-fun m!223255 () Bool)

(assert (=> b!145124 m!223255))

(assert (=> b!145124 m!223241))

(declare-fun m!223257 () Bool)

(assert (=> b!145124 m!223257))

(declare-fun m!223259 () Bool)

(assert (=> b!145124 m!223259))

(declare-fun m!223261 () Bool)

(assert (=> b!145123 m!223261))

(declare-fun m!223263 () Bool)

(assert (=> b!145115 m!223263))

(declare-fun m!223265 () Bool)

(assert (=> b!145121 m!223265))

(assert (=> b!145121 m!223215))

(declare-fun m!223267 () Bool)

(assert (=> b!145127 m!223267))

(declare-fun m!223269 () Bool)

(assert (=> b!145125 m!223269))

(declare-fun m!223271 () Bool)

(assert (=> b!145119 m!223271))

(declare-fun m!223273 () Bool)

(assert (=> b!145119 m!223273))

(declare-fun m!223275 () Bool)

(assert (=> b!145119 m!223275))

(assert (=> b!145119 m!223239))

(assert (=> b!145126 m!223241))

(declare-fun m!223277 () Bool)

(assert (=> b!145126 m!223277))

(declare-fun m!223279 () Bool)

(assert (=> b!145126 m!223279))

(declare-fun m!223281 () Bool)

(assert (=> b!145117 m!223281))

(push 1)

(assert (not b!145121))

(assert (not b!145115))

(assert (not b!145125))

(assert (not b!145122))

(assert (not b!145119))

(assert (not b!145124))

(assert (not start!28014))

(assert (not b!145123))

(assert (not b!145128))

(assert (not b!145126))

(assert (not b!145117))

(assert (not b!145116))

(assert (not b!145120))

(assert (not b!145127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

