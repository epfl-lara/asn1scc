; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27988 () Bool)

(assert start!27988)

(declare-fun b!144530 () Bool)

(declare-fun res!120766 () Bool)

(declare-fun e!96306 () Bool)

(assert (=> b!144530 (=> (not res!120766) (not e!96306))))

(declare-datatypes ((array!6580 0))(
  ( (array!6581 (arr!3711 (Array (_ BitVec 32) (_ BitVec 8))) (size!2978 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5214 0))(
  ( (BitStream!5215 (buf!3417 array!6580) (currentByte!6307 (_ BitVec 32)) (currentBit!6302 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9029 0))(
  ( (Unit!9030) )
))
(declare-datatypes ((tuple2!12866 0))(
  ( (tuple2!12867 (_1!6779 Unit!9029) (_2!6779 BitStream!5214)) )
))
(declare-fun lt!224144 () tuple2!12866)

(declare-fun lt!224147 () tuple2!12866)

(declare-fun isPrefixOf!0 (BitStream!5214 BitStream!5214) Bool)

(assert (=> b!144530 (= res!120766 (isPrefixOf!0 (_2!6779 lt!224144) (_2!6779 lt!224147)))))

(declare-fun b!144531 () Bool)

(declare-fun e!96305 () Bool)

(assert (=> b!144531 (= e!96306 (not e!96305))))

(declare-fun res!120775 () Bool)

(assert (=> b!144531 (=> res!120775 e!96305)))

(declare-datatypes ((tuple2!12868 0))(
  ( (tuple2!12869 (_1!6780 BitStream!5214) (_2!6780 array!6580)) )
))
(declare-fun lt!224148 () tuple2!12868)

(declare-fun arr!237 () array!6580)

(declare-datatypes ((tuple2!12870 0))(
  ( (tuple2!12871 (_1!6781 BitStream!5214) (_2!6781 BitStream!5214)) )
))
(declare-fun lt!224157 () tuple2!12870)

(assert (=> b!144531 (= res!120775 (or (not (= (size!2978 (_2!6780 lt!224148)) (size!2978 arr!237))) (not (= (_1!6780 lt!224148) (_2!6781 lt!224157)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5214 array!6580 (_ BitVec 32) (_ BitVec 32)) tuple2!12868)

(assert (=> b!144531 (= lt!224148 (readByteArrayLoopPure!0 (_1!6781 lt!224157) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224156 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144531 (validate_offset_bits!1 ((_ sign_extend 32) (size!2978 (buf!3417 (_2!6779 lt!224147)))) ((_ sign_extend 32) (currentByte!6307 (_2!6779 lt!224144))) ((_ sign_extend 32) (currentBit!6302 (_2!6779 lt!224144))) lt!224156)))

(declare-fun lt!224159 () Unit!9029)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5214 array!6580 (_ BitVec 64)) Unit!9029)

(assert (=> b!144531 (= lt!224159 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6779 lt!224144) (buf!3417 (_2!6779 lt!224147)) lt!224156))))

(declare-fun reader!0 (BitStream!5214 BitStream!5214) tuple2!12870)

(assert (=> b!144531 (= lt!224157 (reader!0 (_2!6779 lt!224144) (_2!6779 lt!224147)))))

(declare-fun b!144532 () Bool)

(declare-fun lt!224158 () tuple2!12870)

(declare-fun e!96313 () Bool)

(assert (=> b!144532 (= e!96313 (= (_1!6780 (readByteArrayLoopPure!0 (_1!6781 lt!224158) arr!237 from!447 to!404)) (_2!6781 lt!224158)))))

(declare-fun b!144533 () Bool)

(declare-fun res!120774 () Bool)

(declare-fun e!96307 () Bool)

(assert (=> b!144533 (=> (not res!120774) (not e!96307))))

(declare-fun thiss!1634 () BitStream!5214)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144533 (= res!120774 (= (bitIndex!0 (size!2978 (buf!3417 (_2!6779 lt!224144))) (currentByte!6307 (_2!6779 lt!224144)) (currentBit!6302 (_2!6779 lt!224144))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2978 (buf!3417 thiss!1634)) (currentByte!6307 thiss!1634) (currentBit!6302 thiss!1634)))))))

(declare-fun b!144534 () Bool)

(declare-fun e!96315 () Bool)

(declare-fun lt!224160 () (_ BitVec 32))

(declare-fun lt!224142 () (_ BitVec 32))

(assert (=> b!144534 (= e!96315 (not (or (= lt!224160 #b00000000000000000000000000000000) (= lt!224160 (bvand lt!224142 #b10000000000000000000000000000000)))))))

(assert (=> b!144534 (= lt!224160 (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))

(assert (=> b!144534 e!96313))

(declare-fun res!120767 () Bool)

(assert (=> b!144534 (=> (not res!120767) (not e!96313))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144534 (= res!120767 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2978 (buf!3417 (_2!6779 lt!224147)))) ((_ sign_extend 32) (currentByte!6307 thiss!1634)) ((_ sign_extend 32) (currentBit!6302 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224150 () Unit!9029)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5214 array!6580 (_ BitVec 32)) Unit!9029)

(assert (=> b!144534 (= lt!224150 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3417 (_2!6779 lt!224147)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12872 0))(
  ( (tuple2!12873 (_1!6782 BitStream!5214) (_2!6782 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5214) tuple2!12872)

(assert (=> b!144534 (= (_2!6782 (readBytePure!0 (_1!6781 lt!224158))) (select (arr!3711 arr!237) from!447))))

(declare-fun lt!224145 () tuple2!12870)

(assert (=> b!144534 (= lt!224145 (reader!0 (_2!6779 lt!224144) (_2!6779 lt!224147)))))

(assert (=> b!144534 (= lt!224158 (reader!0 thiss!1634 (_2!6779 lt!224147)))))

(declare-fun e!96308 () Bool)

(assert (=> b!144534 e!96308))

(declare-fun res!120778 () Bool)

(assert (=> b!144534 (=> (not res!120778) (not e!96308))))

(declare-fun lt!224146 () tuple2!12872)

(declare-fun lt!224149 () tuple2!12872)

(assert (=> b!144534 (= res!120778 (= (bitIndex!0 (size!2978 (buf!3417 (_1!6782 lt!224146))) (currentByte!6307 (_1!6782 lt!224146)) (currentBit!6302 (_1!6782 lt!224146))) (bitIndex!0 (size!2978 (buf!3417 (_1!6782 lt!224149))) (currentByte!6307 (_1!6782 lt!224149)) (currentBit!6302 (_1!6782 lt!224149)))))))

(declare-fun lt!224154 () Unit!9029)

(declare-fun lt!224153 () BitStream!5214)

(declare-fun readBytePrefixLemma!0 (BitStream!5214 BitStream!5214) Unit!9029)

(assert (=> b!144534 (= lt!224154 (readBytePrefixLemma!0 lt!224153 (_2!6779 lt!224147)))))

(assert (=> b!144534 (= lt!224149 (readBytePure!0 (BitStream!5215 (buf!3417 (_2!6779 lt!224147)) (currentByte!6307 thiss!1634) (currentBit!6302 thiss!1634))))))

(assert (=> b!144534 (= lt!224146 (readBytePure!0 lt!224153))))

(assert (=> b!144534 (= lt!224153 (BitStream!5215 (buf!3417 (_2!6779 lt!224144)) (currentByte!6307 thiss!1634) (currentBit!6302 thiss!1634)))))

(declare-fun e!96309 () Bool)

(assert (=> b!144534 e!96309))

(declare-fun res!120777 () Bool)

(assert (=> b!144534 (=> (not res!120777) (not e!96309))))

(assert (=> b!144534 (= res!120777 (isPrefixOf!0 thiss!1634 (_2!6779 lt!224147)))))

(declare-fun lt!224155 () Unit!9029)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5214 BitStream!5214 BitStream!5214) Unit!9029)

(assert (=> b!144534 (= lt!224155 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6779 lt!224144) (_2!6779 lt!224147)))))

(declare-fun e!96314 () Bool)

(assert (=> b!144534 e!96314))

(declare-fun res!120771 () Bool)

(assert (=> b!144534 (=> (not res!120771) (not e!96314))))

(assert (=> b!144534 (= res!120771 (= (size!2978 (buf!3417 (_2!6779 lt!224144))) (size!2978 (buf!3417 (_2!6779 lt!224147)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5214 array!6580 (_ BitVec 32) (_ BitVec 32)) tuple2!12866)

(assert (=> b!144534 (= lt!224147 (appendByteArrayLoop!0 (_2!6779 lt!224144) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144534 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2978 (buf!3417 (_2!6779 lt!224144)))) ((_ sign_extend 32) (currentByte!6307 (_2!6779 lt!224144))) ((_ sign_extend 32) (currentBit!6302 (_2!6779 lt!224144))) lt!224142)))

(assert (=> b!144534 (= lt!224142 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224151 () Unit!9029)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5214 BitStream!5214 (_ BitVec 64) (_ BitVec 32)) Unit!9029)

(assert (=> b!144534 (= lt!224151 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6779 lt!224144) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144534 e!96307))

(declare-fun res!120772 () Bool)

(assert (=> b!144534 (=> (not res!120772) (not e!96307))))

(assert (=> b!144534 (= res!120772 (= (size!2978 (buf!3417 thiss!1634)) (size!2978 (buf!3417 (_2!6779 lt!224144)))))))

(declare-fun appendByte!0 (BitStream!5214 (_ BitVec 8)) tuple2!12866)

(assert (=> b!144534 (= lt!224144 (appendByte!0 thiss!1634 (select (arr!3711 arr!237) from!447)))))

(declare-fun b!144535 () Bool)

(declare-fun res!120776 () Bool)

(assert (=> b!144535 (=> (not res!120776) (not e!96315))))

(assert (=> b!144535 (= res!120776 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2978 (buf!3417 thiss!1634))) ((_ sign_extend 32) (currentByte!6307 thiss!1634)) ((_ sign_extend 32) (currentBit!6302 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144537 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144537 (= e!96309 (invariant!0 (currentBit!6302 thiss!1634) (currentByte!6307 thiss!1634) (size!2978 (buf!3417 (_2!6779 lt!224144)))))))

(declare-fun b!144538 () Bool)

(assert (=> b!144538 (= e!96314 e!96306)))

(declare-fun res!120770 () Bool)

(assert (=> b!144538 (=> (not res!120770) (not e!96306))))

(assert (=> b!144538 (= res!120770 (= (bitIndex!0 (size!2978 (buf!3417 (_2!6779 lt!224147))) (currentByte!6307 (_2!6779 lt!224147)) (currentBit!6302 (_2!6779 lt!224147))) (bvadd (bitIndex!0 (size!2978 (buf!3417 (_2!6779 lt!224144))) (currentByte!6307 (_2!6779 lt!224144)) (currentBit!6302 (_2!6779 lt!224144))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224156))))))

(assert (=> b!144538 (= lt!224156 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144539 () Bool)

(assert (=> b!144539 (= e!96308 (= (_2!6782 lt!224146) (_2!6782 lt!224149)))))

(declare-fun b!144540 () Bool)

(declare-fun res!120773 () Bool)

(assert (=> b!144540 (=> (not res!120773) (not e!96315))))

(assert (=> b!144540 (= res!120773 (bvslt from!447 to!404))))

(declare-fun b!144541 () Bool)

(declare-fun res!120769 () Bool)

(assert (=> b!144541 (=> (not res!120769) (not e!96315))))

(assert (=> b!144541 (= res!120769 (invariant!0 (currentBit!6302 thiss!1634) (currentByte!6307 thiss!1634) (size!2978 (buf!3417 thiss!1634))))))

(declare-fun b!144542 () Bool)

(declare-fun e!96312 () Bool)

(declare-fun array_inv!2767 (array!6580) Bool)

(assert (=> b!144542 (= e!96312 (array_inv!2767 (buf!3417 thiss!1634)))))

(declare-fun res!120768 () Bool)

(assert (=> start!27988 (=> (not res!120768) (not e!96315))))

(assert (=> start!27988 (= res!120768 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2978 arr!237))))))

(assert (=> start!27988 e!96315))

(assert (=> start!27988 true))

(assert (=> start!27988 (array_inv!2767 arr!237)))

(declare-fun inv!12 (BitStream!5214) Bool)

(assert (=> start!27988 (and (inv!12 thiss!1634) e!96312)))

(declare-fun lt!224143 () tuple2!12872)

(declare-fun b!144536 () Bool)

(declare-fun lt!224152 () tuple2!12870)

(assert (=> b!144536 (= e!96307 (and (= (_2!6782 lt!224143) (select (arr!3711 arr!237) from!447)) (= (_1!6782 lt!224143) (_2!6781 lt!224152))))))

(assert (=> b!144536 (= lt!224143 (readBytePure!0 (_1!6781 lt!224152)))))

(assert (=> b!144536 (= lt!224152 (reader!0 thiss!1634 (_2!6779 lt!224144)))))

(declare-fun b!144543 () Bool)

(declare-fun arrayRangesEq!294 (array!6580 array!6580 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144543 (= e!96305 (not (arrayRangesEq!294 arr!237 (_2!6780 lt!224148) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144544 () Bool)

(declare-fun res!120765 () Bool)

(assert (=> b!144544 (=> (not res!120765) (not e!96307))))

(assert (=> b!144544 (= res!120765 (isPrefixOf!0 thiss!1634 (_2!6779 lt!224144)))))

(assert (= (and start!27988 res!120768) b!144535))

(assert (= (and b!144535 res!120776) b!144540))

(assert (= (and b!144540 res!120773) b!144541))

(assert (= (and b!144541 res!120769) b!144534))

(assert (= (and b!144534 res!120772) b!144533))

(assert (= (and b!144533 res!120774) b!144544))

(assert (= (and b!144544 res!120765) b!144536))

(assert (= (and b!144534 res!120771) b!144538))

(assert (= (and b!144538 res!120770) b!144530))

(assert (= (and b!144530 res!120766) b!144531))

(assert (= (and b!144531 (not res!120775)) b!144543))

(assert (= (and b!144534 res!120777) b!144537))

(assert (= (and b!144534 res!120778) b!144539))

(assert (= (and b!144534 res!120767) b!144532))

(assert (= start!27988 b!144542))

(declare-fun m!222291 () Bool)

(assert (=> b!144532 m!222291))

(declare-fun m!222293 () Bool)

(assert (=> b!144538 m!222293))

(declare-fun m!222295 () Bool)

(assert (=> b!144538 m!222295))

(declare-fun m!222297 () Bool)

(assert (=> b!144531 m!222297))

(declare-fun m!222299 () Bool)

(assert (=> b!144531 m!222299))

(declare-fun m!222301 () Bool)

(assert (=> b!144531 m!222301))

(declare-fun m!222303 () Bool)

(assert (=> b!144531 m!222303))

(declare-fun m!222305 () Bool)

(assert (=> b!144542 m!222305))

(declare-fun m!222307 () Bool)

(assert (=> start!27988 m!222307))

(declare-fun m!222309 () Bool)

(assert (=> start!27988 m!222309))

(declare-fun m!222311 () Bool)

(assert (=> b!144535 m!222311))

(declare-fun m!222313 () Bool)

(assert (=> b!144536 m!222313))

(declare-fun m!222315 () Bool)

(assert (=> b!144536 m!222315))

(declare-fun m!222317 () Bool)

(assert (=> b!144536 m!222317))

(declare-fun m!222319 () Bool)

(assert (=> b!144544 m!222319))

(declare-fun m!222321 () Bool)

(assert (=> b!144537 m!222321))

(declare-fun m!222323 () Bool)

(assert (=> b!144543 m!222323))

(declare-fun m!222325 () Bool)

(assert (=> b!144530 m!222325))

(assert (=> b!144533 m!222295))

(declare-fun m!222327 () Bool)

(assert (=> b!144533 m!222327))

(declare-fun m!222329 () Bool)

(assert (=> b!144534 m!222329))

(declare-fun m!222331 () Bool)

(assert (=> b!144534 m!222331))

(declare-fun m!222333 () Bool)

(assert (=> b!144534 m!222333))

(declare-fun m!222335 () Bool)

(assert (=> b!144534 m!222335))

(declare-fun m!222337 () Bool)

(assert (=> b!144534 m!222337))

(declare-fun m!222339 () Bool)

(assert (=> b!144534 m!222339))

(declare-fun m!222341 () Bool)

(assert (=> b!144534 m!222341))

(declare-fun m!222343 () Bool)

(assert (=> b!144534 m!222343))

(declare-fun m!222345 () Bool)

(assert (=> b!144534 m!222345))

(declare-fun m!222347 () Bool)

(assert (=> b!144534 m!222347))

(declare-fun m!222349 () Bool)

(assert (=> b!144534 m!222349))

(declare-fun m!222351 () Bool)

(assert (=> b!144534 m!222351))

(declare-fun m!222353 () Bool)

(assert (=> b!144534 m!222353))

(declare-fun m!222355 () Bool)

(assert (=> b!144534 m!222355))

(assert (=> b!144534 m!222313))

(declare-fun m!222357 () Bool)

(assert (=> b!144534 m!222357))

(assert (=> b!144534 m!222303))

(assert (=> b!144534 m!222313))

(declare-fun m!222359 () Bool)

(assert (=> b!144541 m!222359))

(check-sat (not b!144537) (not b!144542) (not b!144541) (not b!144538) (not b!144531) (not b!144544) (not start!27988) (not b!144532) (not b!144536) (not b!144530) (not b!144534) (not b!144535) (not b!144533) (not b!144543))
(check-sat)
