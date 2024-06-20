; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25804 () Bool)

(assert start!25804)

(declare-fun b!131673 () Bool)

(declare-fun res!109261 () Bool)

(declare-fun e!87280 () Bool)

(assert (=> b!131673 (=> (not res!109261) (not e!87280))))

(declare-datatypes ((array!6079 0))(
  ( (array!6080 (arr!3381 (Array (_ BitVec 32) (_ BitVec 8))) (size!2752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4768 0))(
  ( (BitStream!4769 (buf!3119 array!6079) (currentByte!5898 (_ BitVec 32)) (currentBit!5893 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8127 0))(
  ( (Unit!8128) )
))
(declare-datatypes ((tuple2!11386 0))(
  ( (tuple2!11387 (_1!5996 Unit!8127) (_2!5996 BitStream!4768)) )
))
(declare-fun lt!203182 () tuple2!11386)

(declare-fun thiss!1634 () BitStream!4768)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131673 (= res!109261 (= (bitIndex!0 (size!2752 (buf!3119 (_2!5996 lt!203182))) (currentByte!5898 (_2!5996 lt!203182)) (currentBit!5893 (_2!5996 lt!203182))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2752 (buf!3119 thiss!1634)) (currentByte!5898 thiss!1634) (currentBit!5893 thiss!1634)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11388 0))(
  ( (tuple2!11389 (_1!5997 BitStream!4768) (_2!5997 BitStream!4768)) )
))
(declare-fun lt!203187 () tuple2!11388)

(declare-fun arr!237 () array!6079)

(declare-fun b!131674 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!87285 () Bool)

(declare-datatypes ((tuple2!11390 0))(
  ( (tuple2!11391 (_1!5998 BitStream!4768) (_2!5998 array!6079)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4768 array!6079 (_ BitVec 32) (_ BitVec 32)) tuple2!11390)

(assert (=> b!131674 (= e!87285 (= (_1!5998 (readByteArrayLoopPure!0 (_1!5997 lt!203187) arr!237 from!447 to!404)) (_2!5997 lt!203187)))))

(declare-fun b!131675 () Bool)

(declare-fun res!109265 () Bool)

(declare-fun e!87286 () Bool)

(assert (=> b!131675 (=> (not res!109265) (not e!87286))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131675 (= res!109265 (invariant!0 (currentBit!5893 thiss!1634) (currentByte!5898 thiss!1634) (size!2752 (buf!3119 thiss!1634))))))

(declare-fun b!131676 () Bool)

(declare-fun res!109264 () Bool)

(assert (=> b!131676 (=> (not res!109264) (not e!87286))))

(assert (=> b!131676 (= res!109264 (bvslt from!447 to!404))))

(declare-fun b!131677 () Bool)

(declare-fun res!109266 () Bool)

(assert (=> b!131677 (=> (not res!109266) (not e!87286))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131677 (= res!109266 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2752 (buf!3119 thiss!1634))) ((_ sign_extend 32) (currentByte!5898 thiss!1634)) ((_ sign_extend 32) (currentBit!5893 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131678 () Bool)

(declare-fun e!87281 () Bool)

(declare-fun e!87277 () Bool)

(assert (=> b!131678 (= e!87281 (not e!87277))))

(declare-fun res!109258 () Bool)

(assert (=> b!131678 (=> res!109258 e!87277)))

(declare-fun lt!203186 () tuple2!11388)

(declare-fun lt!203180 () tuple2!11390)

(assert (=> b!131678 (= res!109258 (or (not (= (size!2752 (_2!5998 lt!203180)) (size!2752 arr!237))) (not (= (_1!5998 lt!203180) (_2!5997 lt!203186)))))))

(assert (=> b!131678 (= lt!203180 (readByteArrayLoopPure!0 (_1!5997 lt!203186) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!203189 () tuple2!11386)

(declare-fun lt!203184 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131678 (validate_offset_bits!1 ((_ sign_extend 32) (size!2752 (buf!3119 (_2!5996 lt!203189)))) ((_ sign_extend 32) (currentByte!5898 (_2!5996 lt!203182))) ((_ sign_extend 32) (currentBit!5893 (_2!5996 lt!203182))) lt!203184)))

(declare-fun lt!203185 () Unit!8127)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4768 array!6079 (_ BitVec 64)) Unit!8127)

(assert (=> b!131678 (= lt!203185 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5996 lt!203182) (buf!3119 (_2!5996 lt!203189)) lt!203184))))

(declare-fun reader!0 (BitStream!4768 BitStream!4768) tuple2!11388)

(assert (=> b!131678 (= lt!203186 (reader!0 (_2!5996 lt!203182) (_2!5996 lt!203189)))))

(declare-fun b!131679 () Bool)

(assert (=> b!131679 (= e!87286 (not true))))

(assert (=> b!131679 e!87285))

(declare-fun res!109263 () Bool)

(assert (=> b!131679 (=> (not res!109263) (not e!87285))))

(assert (=> b!131679 (= res!109263 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2752 (buf!3119 (_2!5996 lt!203189)))) ((_ sign_extend 32) (currentByte!5898 thiss!1634)) ((_ sign_extend 32) (currentBit!5893 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203190 () Unit!8127)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4768 array!6079 (_ BitVec 32)) Unit!8127)

(assert (=> b!131679 (= lt!203190 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3119 (_2!5996 lt!203189)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!11392 0))(
  ( (tuple2!11393 (_1!5999 BitStream!4768) (_2!5999 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4768) tuple2!11392)

(assert (=> b!131679 (= (_2!5999 (readBytePure!0 (_1!5997 lt!203187))) (select (arr!3381 arr!237) from!447))))

(declare-fun lt!203191 () tuple2!11388)

(assert (=> b!131679 (= lt!203191 (reader!0 (_2!5996 lt!203182) (_2!5996 lt!203189)))))

(assert (=> b!131679 (= lt!203187 (reader!0 thiss!1634 (_2!5996 lt!203189)))))

(declare-fun e!87287 () Bool)

(assert (=> b!131679 e!87287))

(declare-fun res!109255 () Bool)

(assert (=> b!131679 (=> (not res!109255) (not e!87287))))

(declare-fun lt!203188 () tuple2!11392)

(declare-fun lt!203183 () tuple2!11392)

(assert (=> b!131679 (= res!109255 (= (bitIndex!0 (size!2752 (buf!3119 (_1!5999 lt!203188))) (currentByte!5898 (_1!5999 lt!203188)) (currentBit!5893 (_1!5999 lt!203188))) (bitIndex!0 (size!2752 (buf!3119 (_1!5999 lt!203183))) (currentByte!5898 (_1!5999 lt!203183)) (currentBit!5893 (_1!5999 lt!203183)))))))

(declare-fun lt!203176 () Unit!8127)

(declare-fun lt!203181 () BitStream!4768)

(declare-fun readBytePrefixLemma!0 (BitStream!4768 BitStream!4768) Unit!8127)

(assert (=> b!131679 (= lt!203176 (readBytePrefixLemma!0 lt!203181 (_2!5996 lt!203189)))))

(assert (=> b!131679 (= lt!203183 (readBytePure!0 (BitStream!4769 (buf!3119 (_2!5996 lt!203189)) (currentByte!5898 thiss!1634) (currentBit!5893 thiss!1634))))))

(assert (=> b!131679 (= lt!203188 (readBytePure!0 lt!203181))))

(assert (=> b!131679 (= lt!203181 (BitStream!4769 (buf!3119 (_2!5996 lt!203182)) (currentByte!5898 thiss!1634) (currentBit!5893 thiss!1634)))))

(declare-fun e!87283 () Bool)

(assert (=> b!131679 e!87283))

(declare-fun res!109257 () Bool)

(assert (=> b!131679 (=> (not res!109257) (not e!87283))))

(declare-fun isPrefixOf!0 (BitStream!4768 BitStream!4768) Bool)

(assert (=> b!131679 (= res!109257 (isPrefixOf!0 thiss!1634 (_2!5996 lt!203189)))))

(declare-fun lt!203177 () Unit!8127)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4768 BitStream!4768 BitStream!4768) Unit!8127)

(assert (=> b!131679 (= lt!203177 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5996 lt!203182) (_2!5996 lt!203189)))))

(declare-fun e!87278 () Bool)

(assert (=> b!131679 e!87278))

(declare-fun res!109267 () Bool)

(assert (=> b!131679 (=> (not res!109267) (not e!87278))))

(assert (=> b!131679 (= res!109267 (= (size!2752 (buf!3119 (_2!5996 lt!203182))) (size!2752 (buf!3119 (_2!5996 lt!203189)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4768 array!6079 (_ BitVec 32) (_ BitVec 32)) tuple2!11386)

(assert (=> b!131679 (= lt!203189 (appendByteArrayLoop!0 (_2!5996 lt!203182) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131679 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2752 (buf!3119 (_2!5996 lt!203182)))) ((_ sign_extend 32) (currentByte!5898 (_2!5996 lt!203182))) ((_ sign_extend 32) (currentBit!5893 (_2!5996 lt!203182))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203178 () Unit!8127)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4768 BitStream!4768 (_ BitVec 64) (_ BitVec 32)) Unit!8127)

(assert (=> b!131679 (= lt!203178 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5996 lt!203182) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131679 e!87280))

(declare-fun res!109260 () Bool)

(assert (=> b!131679 (=> (not res!109260) (not e!87280))))

(assert (=> b!131679 (= res!109260 (= (size!2752 (buf!3119 thiss!1634)) (size!2752 (buf!3119 (_2!5996 lt!203182)))))))

(declare-fun appendByte!0 (BitStream!4768 (_ BitVec 8)) tuple2!11386)

(assert (=> b!131679 (= lt!203182 (appendByte!0 thiss!1634 (select (arr!3381 arr!237) from!447)))))

(declare-fun b!131680 () Bool)

(assert (=> b!131680 (= e!87287 (= (_2!5999 lt!203188) (_2!5999 lt!203183)))))

(declare-fun b!131681 () Bool)

(declare-fun e!87284 () Bool)

(declare-fun array_inv!2541 (array!6079) Bool)

(assert (=> b!131681 (= e!87284 (array_inv!2541 (buf!3119 thiss!1634)))))

(declare-fun b!131682 () Bool)

(declare-fun res!109254 () Bool)

(assert (=> b!131682 (=> (not res!109254) (not e!87280))))

(assert (=> b!131682 (= res!109254 (isPrefixOf!0 thiss!1634 (_2!5996 lt!203182)))))

(declare-fun lt!203179 () tuple2!11388)

(declare-fun lt!203192 () tuple2!11392)

(declare-fun b!131683 () Bool)

(assert (=> b!131683 (= e!87280 (and (= (_2!5999 lt!203192) (select (arr!3381 arr!237) from!447)) (= (_1!5999 lt!203192) (_2!5997 lt!203179))))))

(assert (=> b!131683 (= lt!203192 (readBytePure!0 (_1!5997 lt!203179)))))

(assert (=> b!131683 (= lt!203179 (reader!0 thiss!1634 (_2!5996 lt!203182)))))

(declare-fun b!131684 () Bool)

(declare-fun arrayRangesEq!155 (array!6079 array!6079 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131684 (= e!87277 (not (arrayRangesEq!155 arr!237 (_2!5998 lt!203180) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131685 () Bool)

(declare-fun res!109262 () Bool)

(assert (=> b!131685 (=> (not res!109262) (not e!87281))))

(assert (=> b!131685 (= res!109262 (isPrefixOf!0 (_2!5996 lt!203182) (_2!5996 lt!203189)))))

(declare-fun res!109256 () Bool)

(assert (=> start!25804 (=> (not res!109256) (not e!87286))))

(assert (=> start!25804 (= res!109256 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2752 arr!237))))))

(assert (=> start!25804 e!87286))

(assert (=> start!25804 true))

(assert (=> start!25804 (array_inv!2541 arr!237)))

(declare-fun inv!12 (BitStream!4768) Bool)

(assert (=> start!25804 (and (inv!12 thiss!1634) e!87284)))

(declare-fun b!131686 () Bool)

(assert (=> b!131686 (= e!87283 (invariant!0 (currentBit!5893 thiss!1634) (currentByte!5898 thiss!1634) (size!2752 (buf!3119 (_2!5996 lt!203182)))))))

(declare-fun b!131687 () Bool)

(assert (=> b!131687 (= e!87278 e!87281)))

(declare-fun res!109259 () Bool)

(assert (=> b!131687 (=> (not res!109259) (not e!87281))))

(assert (=> b!131687 (= res!109259 (= (bitIndex!0 (size!2752 (buf!3119 (_2!5996 lt!203189))) (currentByte!5898 (_2!5996 lt!203189)) (currentBit!5893 (_2!5996 lt!203189))) (bvadd (bitIndex!0 (size!2752 (buf!3119 (_2!5996 lt!203182))) (currentByte!5898 (_2!5996 lt!203182)) (currentBit!5893 (_2!5996 lt!203182))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203184))))))

(assert (=> b!131687 (= lt!203184 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!25804 res!109256) b!131677))

(assert (= (and b!131677 res!109266) b!131676))

(assert (= (and b!131676 res!109264) b!131675))

(assert (= (and b!131675 res!109265) b!131679))

(assert (= (and b!131679 res!109260) b!131673))

(assert (= (and b!131673 res!109261) b!131682))

(assert (= (and b!131682 res!109254) b!131683))

(assert (= (and b!131679 res!109267) b!131687))

(assert (= (and b!131687 res!109259) b!131685))

(assert (= (and b!131685 res!109262) b!131678))

(assert (= (and b!131678 (not res!109258)) b!131684))

(assert (= (and b!131679 res!109257) b!131686))

(assert (= (and b!131679 res!109255) b!131680))

(assert (= (and b!131679 res!109263) b!131674))

(assert (= start!25804 b!131681))

(declare-fun m!198763 () Bool)

(assert (=> b!131673 m!198763))

(declare-fun m!198765 () Bool)

(assert (=> b!131673 m!198765))

(declare-fun m!198767 () Bool)

(assert (=> b!131682 m!198767))

(declare-fun m!198769 () Bool)

(assert (=> b!131675 m!198769))

(declare-fun m!198771 () Bool)

(assert (=> b!131686 m!198771))

(declare-fun m!198773 () Bool)

(assert (=> b!131677 m!198773))

(declare-fun m!198775 () Bool)

(assert (=> start!25804 m!198775))

(declare-fun m!198777 () Bool)

(assert (=> start!25804 m!198777))

(declare-fun m!198779 () Bool)

(assert (=> b!131685 m!198779))

(declare-fun m!198781 () Bool)

(assert (=> b!131674 m!198781))

(declare-fun m!198783 () Bool)

(assert (=> b!131683 m!198783))

(declare-fun m!198785 () Bool)

(assert (=> b!131683 m!198785))

(declare-fun m!198787 () Bool)

(assert (=> b!131683 m!198787))

(declare-fun m!198789 () Bool)

(assert (=> b!131681 m!198789))

(declare-fun m!198791 () Bool)

(assert (=> b!131687 m!198791))

(assert (=> b!131687 m!198763))

(declare-fun m!198793 () Bool)

(assert (=> b!131679 m!198793))

(declare-fun m!198795 () Bool)

(assert (=> b!131679 m!198795))

(declare-fun m!198797 () Bool)

(assert (=> b!131679 m!198797))

(declare-fun m!198799 () Bool)

(assert (=> b!131679 m!198799))

(declare-fun m!198801 () Bool)

(assert (=> b!131679 m!198801))

(assert (=> b!131679 m!198783))

(declare-fun m!198803 () Bool)

(assert (=> b!131679 m!198803))

(declare-fun m!198805 () Bool)

(assert (=> b!131679 m!198805))

(declare-fun m!198807 () Bool)

(assert (=> b!131679 m!198807))

(declare-fun m!198809 () Bool)

(assert (=> b!131679 m!198809))

(declare-fun m!198811 () Bool)

(assert (=> b!131679 m!198811))

(declare-fun m!198813 () Bool)

(assert (=> b!131679 m!198813))

(declare-fun m!198815 () Bool)

(assert (=> b!131679 m!198815))

(declare-fun m!198817 () Bool)

(assert (=> b!131679 m!198817))

(declare-fun m!198819 () Bool)

(assert (=> b!131679 m!198819))

(declare-fun m!198821 () Bool)

(assert (=> b!131679 m!198821))

(declare-fun m!198823 () Bool)

(assert (=> b!131679 m!198823))

(assert (=> b!131679 m!198783))

(declare-fun m!198825 () Bool)

(assert (=> b!131684 m!198825))

(declare-fun m!198827 () Bool)

(assert (=> b!131678 m!198827))

(declare-fun m!198829 () Bool)

(assert (=> b!131678 m!198829))

(declare-fun m!198831 () Bool)

(assert (=> b!131678 m!198831))

(assert (=> b!131678 m!198815))

(push 1)

(assert (not b!131687))

(assert (not b!131678))

(assert (not b!131682))

(assert (not start!25804))

(assert (not b!131674))

(assert (not b!131685))

(assert (not b!131683))

(assert (not b!131681))

(assert (not b!131677))

(assert (not b!131673))

(assert (not b!131675))

(assert (not b!131679))

(assert (not b!131686))

(assert (not b!131684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

