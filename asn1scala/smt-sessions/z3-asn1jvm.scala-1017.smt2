; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28940 () Bool)

(assert start!28940)

(declare-fun b!150486 () Bool)

(declare-fun res!126153 () Bool)

(declare-fun e!100500 () Bool)

(assert (=> b!150486 (=> res!126153 e!100500)))

(declare-fun lt!235192 () (_ BitVec 64))

(assert (=> b!150486 (= res!126153 (bvslt lt!235192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!150487 () Bool)

(declare-fun e!100499 () Bool)

(declare-fun e!100507 () Bool)

(assert (=> b!150487 (= e!100499 (not e!100507))))

(declare-fun res!126156 () Bool)

(assert (=> b!150487 (=> res!126156 e!100507)))

(declare-datatypes ((array!6733 0))(
  ( (array!6734 (arr!3840 (Array (_ BitVec 32) (_ BitVec 8))) (size!3047 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5352 0))(
  ( (BitStream!5353 (buf!3528 array!6733) (currentByte!6448 (_ BitVec 32)) (currentBit!6443 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13460 0))(
  ( (tuple2!13461 (_1!7097 BitStream!5352) (_2!7097 BitStream!5352)) )
))
(declare-fun lt!235180 () tuple2!13460)

(declare-fun arr!237 () array!6733)

(declare-datatypes ((tuple2!13462 0))(
  ( (tuple2!13463 (_1!7098 BitStream!5352) (_2!7098 array!6733)) )
))
(declare-fun lt!235197 () tuple2!13462)

(assert (=> b!150487 (= res!126156 (or (not (= (size!3047 (_2!7098 lt!235197)) (size!3047 arr!237))) (not (= (_1!7098 lt!235197) (_2!7097 lt!235180)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5352 array!6733 (_ BitVec 32) (_ BitVec 32)) tuple2!13462)

(assert (=> b!150487 (= lt!235197 (readByteArrayLoopPure!0 (_1!7097 lt!235180) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9494 0))(
  ( (Unit!9495) )
))
(declare-datatypes ((tuple2!13464 0))(
  ( (tuple2!13465 (_1!7099 Unit!9494) (_2!7099 BitStream!5352)) )
))
(declare-fun lt!235184 () tuple2!13464)

(declare-fun lt!235179 () tuple2!13464)

(declare-fun lt!235201 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150487 (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235201)))

(declare-fun lt!235190 () Unit!9494)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5352 array!6733 (_ BitVec 64)) Unit!9494)

(assert (=> b!150487 (= lt!235190 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235184)) lt!235201))))

(declare-fun reader!0 (BitStream!5352 BitStream!5352) tuple2!13460)

(assert (=> b!150487 (= lt!235180 (reader!0 (_2!7099 lt!235179) (_2!7099 lt!235184)))))

(declare-fun res!126157 () Bool)

(declare-fun e!100510 () Bool)

(assert (=> start!28940 (=> (not res!126157) (not e!100510))))

(assert (=> start!28940 (= res!126157 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3047 arr!237))))))

(assert (=> start!28940 e!100510))

(assert (=> start!28940 true))

(declare-fun array_inv!2836 (array!6733) Bool)

(assert (=> start!28940 (array_inv!2836 arr!237)))

(declare-fun thiss!1634 () BitStream!5352)

(declare-fun e!100506 () Bool)

(declare-fun inv!12 (BitStream!5352) Bool)

(assert (=> start!28940 (and (inv!12 thiss!1634) e!100506)))

(declare-fun b!150488 () Bool)

(declare-fun e!100503 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150488 (= e!100503 (invariant!0 (currentBit!6443 thiss!1634) (currentByte!6448 thiss!1634) (size!3047 (buf!3528 (_2!7099 lt!235179)))))))

(declare-fun b!150489 () Bool)

(assert (=> b!150489 (= e!100506 (array_inv!2836 (buf!3528 thiss!1634)))))

(declare-fun b!150490 () Bool)

(assert (=> b!150490 (= e!100500 (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) lt!235192))))

(declare-fun b!150491 () Bool)

(declare-fun arrayRangesEq!363 (array!6733 array!6733 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150491 (= e!100507 (not (arrayRangesEq!363 arr!237 (_2!7098 lt!235197) #b00000000000000000000000000000000 to!404)))))

(declare-datatypes ((tuple2!13466 0))(
  ( (tuple2!13467 (_1!7100 BitStream!5352) (_2!7100 (_ BitVec 8))) )
))
(declare-fun lt!235205 () tuple2!13466)

(declare-fun b!150492 () Bool)

(declare-fun e!100505 () Bool)

(declare-fun lt!235195 () tuple2!13460)

(assert (=> b!150492 (= e!100505 (and (= (_2!7100 lt!235205) (select (arr!3840 arr!237) from!447)) (= (_1!7100 lt!235205) (_2!7097 lt!235195))))))

(declare-fun readBytePure!0 (BitStream!5352) tuple2!13466)

(assert (=> b!150492 (= lt!235205 (readBytePure!0 (_1!7097 lt!235195)))))

(assert (=> b!150492 (= lt!235195 (reader!0 thiss!1634 (_2!7099 lt!235179)))))

(declare-fun b!150493 () Bool)

(declare-fun res!126148 () Bool)

(assert (=> b!150493 (=> (not res!126148) (not e!100499))))

(declare-fun isPrefixOf!0 (BitStream!5352 BitStream!5352) Bool)

(assert (=> b!150493 (= res!126148 (isPrefixOf!0 (_2!7099 lt!235179) (_2!7099 lt!235184)))))

(declare-fun b!150494 () Bool)

(declare-fun res!126149 () Bool)

(assert (=> b!150494 (=> (not res!126149) (not e!100510))))

(assert (=> b!150494 (= res!126149 (invariant!0 (currentBit!6443 thiss!1634) (currentByte!6448 thiss!1634) (size!3047 (buf!3528 thiss!1634))))))

(declare-fun b!150495 () Bool)

(declare-fun e!100504 () Bool)

(assert (=> b!150495 (= e!100504 e!100499)))

(declare-fun res!126145 () Bool)

(assert (=> b!150495 (=> (not res!126145) (not e!100499))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150495 (= res!126145 (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184))) (bvadd (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235201))))))

(assert (=> b!150495 (= lt!235201 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150496 () Bool)

(declare-fun res!126155 () Bool)

(assert (=> b!150496 (=> (not res!126155) (not e!100510))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150496 (= res!126155 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150497 () Bool)

(declare-fun res!126152 () Bool)

(assert (=> b!150497 (=> (not res!126152) (not e!100505))))

(assert (=> b!150497 (= res!126152 (isPrefixOf!0 thiss!1634 (_2!7099 lt!235179)))))

(declare-fun b!150498 () Bool)

(declare-fun e!100509 () Bool)

(assert (=> b!150498 (= e!100509 e!100500)))

(declare-fun res!126142 () Bool)

(assert (=> b!150498 (=> res!126142 e!100500)))

(assert (=> b!150498 (= res!126142 (not (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184))) (bvadd (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235192)))))))

(assert (=> b!150498 (= lt!235192 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150499 () Bool)

(declare-fun res!126146 () Bool)

(assert (=> b!150499 (=> (not res!126146) (not e!100510))))

(assert (=> b!150499 (= res!126146 (bvslt from!447 to!404))))

(declare-fun b!150500 () Bool)

(declare-fun e!100501 () Bool)

(declare-fun lt!235203 () tuple2!13466)

(declare-fun lt!235194 () tuple2!13466)

(assert (=> b!150500 (= e!100501 (= (_2!7100 lt!235203) (_2!7100 lt!235194)))))

(declare-fun b!150501 () Bool)

(declare-fun e!100498 () Bool)

(assert (=> b!150501 (= e!100510 (not e!100498))))

(declare-fun res!126144 () Bool)

(assert (=> b!150501 (=> res!126144 e!100498)))

(declare-fun lt!235188 () tuple2!13462)

(declare-fun lt!235186 () tuple2!13462)

(assert (=> b!150501 (= res!126144 (not (arrayRangesEq!363 (_2!7098 lt!235188) (_2!7098 lt!235186) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!235204 () tuple2!13462)

(assert (=> b!150501 (arrayRangesEq!363 (_2!7098 lt!235188) (_2!7098 lt!235204) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235191 () Unit!9494)

(declare-fun lt!235189 () tuple2!13460)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5352 array!6733 (_ BitVec 32) (_ BitVec 32)) Unit!9494)

(assert (=> b!150501 (= lt!235191 (readByteArrayLoopArrayPrefixLemma!0 (_1!7097 lt!235189) arr!237 from!447 to!404))))

(declare-fun lt!235183 () array!6733)

(declare-fun withMovedByteIndex!0 (BitStream!5352 (_ BitVec 32)) BitStream!5352)

(assert (=> b!150501 (= lt!235204 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7097 lt!235189) #b00000000000000000000000000000001) lt!235183 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235202 () tuple2!13460)

(assert (=> b!150501 (= lt!235186 (readByteArrayLoopPure!0 (_1!7097 lt!235202) lt!235183 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235193 () tuple2!13466)

(assert (=> b!150501 (= lt!235183 (array!6734 (store (arr!3840 arr!237) from!447 (_2!7100 lt!235193)) (size!3047 arr!237)))))

(declare-fun lt!235187 () (_ BitVec 32))

(assert (=> b!150501 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235187)))

(declare-fun lt!235200 () Unit!9494)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5352 array!6733 (_ BitVec 32)) Unit!9494)

(assert (=> b!150501 (= lt!235200 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235184)) lt!235187))))

(assert (=> b!150501 (= (_1!7098 lt!235188) (_2!7097 lt!235189))))

(assert (=> b!150501 (= lt!235188 (readByteArrayLoopPure!0 (_1!7097 lt!235189) arr!237 from!447 to!404))))

(assert (=> b!150501 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235181 () Unit!9494)

(assert (=> b!150501 (= lt!235181 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3528 (_2!7099 lt!235184)) (bvsub to!404 from!447)))))

(assert (=> b!150501 (= (_2!7100 lt!235193) (select (arr!3840 arr!237) from!447))))

(assert (=> b!150501 (= lt!235193 (readBytePure!0 (_1!7097 lt!235189)))))

(assert (=> b!150501 (= lt!235202 (reader!0 (_2!7099 lt!235179) (_2!7099 lt!235184)))))

(assert (=> b!150501 (= lt!235189 (reader!0 thiss!1634 (_2!7099 lt!235184)))))

(assert (=> b!150501 e!100501))

(declare-fun res!126147 () Bool)

(assert (=> b!150501 (=> (not res!126147) (not e!100501))))

(assert (=> b!150501 (= res!126147 (= (bitIndex!0 (size!3047 (buf!3528 (_1!7100 lt!235203))) (currentByte!6448 (_1!7100 lt!235203)) (currentBit!6443 (_1!7100 lt!235203))) (bitIndex!0 (size!3047 (buf!3528 (_1!7100 lt!235194))) (currentByte!6448 (_1!7100 lt!235194)) (currentBit!6443 (_1!7100 lt!235194)))))))

(declare-fun lt!235182 () Unit!9494)

(declare-fun lt!235196 () BitStream!5352)

(declare-fun readBytePrefixLemma!0 (BitStream!5352 BitStream!5352) Unit!9494)

(assert (=> b!150501 (= lt!235182 (readBytePrefixLemma!0 lt!235196 (_2!7099 lt!235184)))))

(assert (=> b!150501 (= lt!235194 (readBytePure!0 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634))))))

(assert (=> b!150501 (= lt!235203 (readBytePure!0 lt!235196))))

(assert (=> b!150501 (= lt!235196 (BitStream!5353 (buf!3528 (_2!7099 lt!235179)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(assert (=> b!150501 e!100503))

(declare-fun res!126143 () Bool)

(assert (=> b!150501 (=> (not res!126143) (not e!100503))))

(assert (=> b!150501 (= res!126143 (isPrefixOf!0 thiss!1634 (_2!7099 lt!235184)))))

(declare-fun lt!235185 () Unit!9494)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5352 BitStream!5352 BitStream!5352) Unit!9494)

(assert (=> b!150501 (= lt!235185 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7099 lt!235179) (_2!7099 lt!235184)))))

(assert (=> b!150501 e!100504))

(declare-fun res!126150 () Bool)

(assert (=> b!150501 (=> (not res!126150) (not e!100504))))

(assert (=> b!150501 (= res!126150 (= (size!3047 (buf!3528 (_2!7099 lt!235179))) (size!3047 (buf!3528 (_2!7099 lt!235184)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5352 array!6733 (_ BitVec 32) (_ BitVec 32)) tuple2!13464)

(assert (=> b!150501 (= lt!235184 (appendByteArrayLoop!0 (_2!7099 lt!235179) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150501 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235187)))

(assert (=> b!150501 (= lt!235187 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!235199 () Unit!9494)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5352 BitStream!5352 (_ BitVec 64) (_ BitVec 32)) Unit!9494)

(assert (=> b!150501 (= lt!235199 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7099 lt!235179) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!150501 e!100505))

(declare-fun res!126158 () Bool)

(assert (=> b!150501 (=> (not res!126158) (not e!100505))))

(assert (=> b!150501 (= res!126158 (= (size!3047 (buf!3528 thiss!1634)) (size!3047 (buf!3528 (_2!7099 lt!235179)))))))

(declare-fun appendByte!0 (BitStream!5352 (_ BitVec 8)) tuple2!13464)

(assert (=> b!150501 (= lt!235179 (appendByte!0 thiss!1634 (select (arr!3840 arr!237) from!447)))))

(declare-fun b!150502 () Bool)

(declare-fun res!126154 () Bool)

(assert (=> b!150502 (=> (not res!126154) (not e!100505))))

(assert (=> b!150502 (= res!126154 (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))))

(declare-fun b!150503 () Bool)

(assert (=> b!150503 (= e!100498 e!100509)))

(declare-fun res!126151 () Bool)

(assert (=> b!150503 (=> res!126151 e!100509)))

(assert (=> b!150503 (= res!126151 (not (= (size!3047 (buf!3528 thiss!1634)) (size!3047 (buf!3528 (_2!7099 lt!235184))))))))

(assert (=> b!150503 (arrayRangesEq!363 arr!237 (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235198 () Unit!9494)

(declare-fun arrayRangesEqTransitive!78 (array!6733 array!6733 array!6733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9494)

(assert (=> b!150503 (= lt!235198 (arrayRangesEqTransitive!78 arr!237 (_2!7098 lt!235186) (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150503 (arrayRangesEq!363 (_2!7098 lt!235186) (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235206 () Unit!9494)

(declare-fun arrayRangesEqSymmetricLemma!95 (array!6733 array!6733 (_ BitVec 32) (_ BitVec 32)) Unit!9494)

(assert (=> b!150503 (= lt!235206 (arrayRangesEqSymmetricLemma!95 (_2!7098 lt!235188) (_2!7098 lt!235186) #b00000000000000000000000000000000 to!404))))

(assert (= (and start!28940 res!126157) b!150496))

(assert (= (and b!150496 res!126155) b!150499))

(assert (= (and b!150499 res!126146) b!150494))

(assert (= (and b!150494 res!126149) b!150501))

(assert (= (and b!150501 res!126158) b!150502))

(assert (= (and b!150502 res!126154) b!150497))

(assert (= (and b!150497 res!126152) b!150492))

(assert (= (and b!150501 res!126150) b!150495))

(assert (= (and b!150495 res!126145) b!150493))

(assert (= (and b!150493 res!126148) b!150487))

(assert (= (and b!150487 (not res!126156)) b!150491))

(assert (= (and b!150501 res!126143) b!150488))

(assert (= (and b!150501 res!126147) b!150500))

(assert (= (and b!150501 (not res!126144)) b!150503))

(assert (= (and b!150503 (not res!126151)) b!150498))

(assert (= (and b!150498 (not res!126142)) b!150486))

(assert (= (and b!150486 (not res!126153)) b!150490))

(assert (= start!28940 b!150489))

(declare-fun m!234587 () Bool)

(assert (=> start!28940 m!234587))

(declare-fun m!234589 () Bool)

(assert (=> start!28940 m!234589))

(declare-fun m!234591 () Bool)

(assert (=> b!150489 m!234591))

(declare-fun m!234593 () Bool)

(assert (=> b!150501 m!234593))

(declare-fun m!234595 () Bool)

(assert (=> b!150501 m!234595))

(declare-fun m!234597 () Bool)

(assert (=> b!150501 m!234597))

(declare-fun m!234599 () Bool)

(assert (=> b!150501 m!234599))

(declare-fun m!234601 () Bool)

(assert (=> b!150501 m!234601))

(declare-fun m!234603 () Bool)

(assert (=> b!150501 m!234603))

(declare-fun m!234605 () Bool)

(assert (=> b!150501 m!234605))

(declare-fun m!234607 () Bool)

(assert (=> b!150501 m!234607))

(declare-fun m!234609 () Bool)

(assert (=> b!150501 m!234609))

(declare-fun m!234611 () Bool)

(assert (=> b!150501 m!234611))

(declare-fun m!234613 () Bool)

(assert (=> b!150501 m!234613))

(declare-fun m!234615 () Bool)

(assert (=> b!150501 m!234615))

(declare-fun m!234617 () Bool)

(assert (=> b!150501 m!234617))

(declare-fun m!234619 () Bool)

(assert (=> b!150501 m!234619))

(declare-fun m!234621 () Bool)

(assert (=> b!150501 m!234621))

(declare-fun m!234623 () Bool)

(assert (=> b!150501 m!234623))

(declare-fun m!234625 () Bool)

(assert (=> b!150501 m!234625))

(declare-fun m!234627 () Bool)

(assert (=> b!150501 m!234627))

(assert (=> b!150501 m!234623))

(declare-fun m!234629 () Bool)

(assert (=> b!150501 m!234629))

(declare-fun m!234631 () Bool)

(assert (=> b!150501 m!234631))

(declare-fun m!234633 () Bool)

(assert (=> b!150501 m!234633))

(declare-fun m!234635 () Bool)

(assert (=> b!150501 m!234635))

(declare-fun m!234637 () Bool)

(assert (=> b!150501 m!234637))

(declare-fun m!234639 () Bool)

(assert (=> b!150501 m!234639))

(declare-fun m!234641 () Bool)

(assert (=> b!150501 m!234641))

(declare-fun m!234643 () Bool)

(assert (=> b!150501 m!234643))

(declare-fun m!234645 () Bool)

(assert (=> b!150501 m!234645))

(assert (=> b!150501 m!234611))

(declare-fun m!234647 () Bool)

(assert (=> b!150491 m!234647))

(declare-fun m!234649 () Bool)

(assert (=> b!150494 m!234649))

(declare-fun m!234651 () Bool)

(assert (=> b!150495 m!234651))

(declare-fun m!234653 () Bool)

(assert (=> b!150495 m!234653))

(declare-fun m!234655 () Bool)

(assert (=> b!150493 m!234655))

(assert (=> b!150498 m!234651))

(declare-fun m!234657 () Bool)

(assert (=> b!150498 m!234657))

(declare-fun m!234659 () Bool)

(assert (=> b!150497 m!234659))

(assert (=> b!150492 m!234611))

(declare-fun m!234661 () Bool)

(assert (=> b!150492 m!234661))

(declare-fun m!234663 () Bool)

(assert (=> b!150492 m!234663))

(assert (=> b!150502 m!234653))

(assert (=> b!150502 m!234657))

(declare-fun m!234665 () Bool)

(assert (=> b!150488 m!234665))

(declare-fun m!234667 () Bool)

(assert (=> b!150490 m!234667))

(declare-fun m!234669 () Bool)

(assert (=> b!150503 m!234669))

(declare-fun m!234671 () Bool)

(assert (=> b!150503 m!234671))

(declare-fun m!234673 () Bool)

(assert (=> b!150503 m!234673))

(declare-fun m!234675 () Bool)

(assert (=> b!150503 m!234675))

(declare-fun m!234677 () Bool)

(assert (=> b!150487 m!234677))

(declare-fun m!234679 () Bool)

(assert (=> b!150487 m!234679))

(declare-fun m!234681 () Bool)

(assert (=> b!150487 m!234681))

(assert (=> b!150487 m!234643))

(declare-fun m!234683 () Bool)

(assert (=> b!150496 m!234683))

(check-sat (not b!150490) (not b!150494) (not b!150487) (not b!150489) (not b!150491) (not b!150497) (not b!150502) (not b!150501) (not start!28940) (not b!150492) (not b!150493) (not b!150488) (not b!150495) (not b!150496) (not b!150498) (not b!150503))
(check-sat)
(get-model)

(declare-fun d!49042 () Bool)

(declare-fun e!100670 () Bool)

(assert (=> d!49042 e!100670))

(declare-fun res!126391 () Bool)

(assert (=> d!49042 (=> (not res!126391) (not e!100670))))

(declare-fun lt!235795 () (_ BitVec 64))

(declare-fun lt!235798 () (_ BitVec 64))

(declare-fun lt!235797 () (_ BitVec 64))

(assert (=> d!49042 (= res!126391 (= lt!235797 (bvsub lt!235795 lt!235798)))))

(assert (=> d!49042 (or (= (bvand lt!235795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235795 lt!235798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49042 (= lt!235798 (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179)))))))

(declare-fun lt!235796 () (_ BitVec 64))

(declare-fun lt!235794 () (_ BitVec 64))

(assert (=> d!49042 (= lt!235795 (bvmul lt!235796 lt!235794))))

(assert (=> d!49042 (or (= lt!235796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235794 (bvsdiv (bvmul lt!235796 lt!235794) lt!235796)))))

(assert (=> d!49042 (= lt!235794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49042 (= lt!235796 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))))))

(assert (=> d!49042 (= lt!235797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179)))))))

(assert (=> d!49042 (invariant!0 (currentBit!6443 (_2!7099 lt!235179)) (currentByte!6448 (_2!7099 lt!235179)) (size!3047 (buf!3528 (_2!7099 lt!235179))))))

(assert (=> d!49042 (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))) lt!235797)))

(declare-fun b!150758 () Bool)

(declare-fun res!126390 () Bool)

(assert (=> b!150758 (=> (not res!126390) (not e!100670))))

(assert (=> b!150758 (= res!126390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235797))))

(declare-fun b!150759 () Bool)

(declare-fun lt!235793 () (_ BitVec 64))

(assert (=> b!150759 (= e!100670 (bvsle lt!235797 (bvmul lt!235793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150759 (or (= lt!235793 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235793 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235793)))))

(assert (=> b!150759 (= lt!235793 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))))))

(assert (= (and d!49042 res!126391) b!150758))

(assert (= (and b!150758 res!126390) b!150759))

(declare-fun m!235195 () Bool)

(assert (=> d!49042 m!235195))

(declare-fun m!235197 () Bool)

(assert (=> d!49042 m!235197))

(assert (=> b!150502 d!49042))

(declare-fun d!49044 () Bool)

(declare-fun e!100671 () Bool)

(assert (=> d!49044 e!100671))

(declare-fun res!126393 () Bool)

(assert (=> d!49044 (=> (not res!126393) (not e!100671))))

(declare-fun lt!235803 () (_ BitVec 64))

(declare-fun lt!235804 () (_ BitVec 64))

(declare-fun lt!235801 () (_ BitVec 64))

(assert (=> d!49044 (= res!126393 (= lt!235803 (bvsub lt!235801 lt!235804)))))

(assert (=> d!49044 (or (= (bvand lt!235801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235804 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235801 lt!235804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49044 (= lt!235804 (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634))))))

(declare-fun lt!235802 () (_ BitVec 64))

(declare-fun lt!235800 () (_ BitVec 64))

(assert (=> d!49044 (= lt!235801 (bvmul lt!235802 lt!235800))))

(assert (=> d!49044 (or (= lt!235802 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235800 (bvsdiv (bvmul lt!235802 lt!235800) lt!235802)))))

(assert (=> d!49044 (= lt!235800 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49044 (= lt!235802 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))))))

(assert (=> d!49044 (= lt!235803 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6448 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6443 thiss!1634))))))

(assert (=> d!49044 (invariant!0 (currentBit!6443 thiss!1634) (currentByte!6448 thiss!1634) (size!3047 (buf!3528 thiss!1634)))))

(assert (=> d!49044 (= (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)) lt!235803)))

(declare-fun b!150760 () Bool)

(declare-fun res!126392 () Bool)

(assert (=> b!150760 (=> (not res!126392) (not e!100671))))

(assert (=> b!150760 (= res!126392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235803))))

(declare-fun b!150761 () Bool)

(declare-fun lt!235799 () (_ BitVec 64))

(assert (=> b!150761 (= e!100671 (bvsle lt!235803 (bvmul lt!235799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150761 (or (= lt!235799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235799)))))

(assert (=> b!150761 (= lt!235799 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))))))

(assert (= (and d!49044 res!126393) b!150760))

(assert (= (and b!150760 res!126392) b!150761))

(declare-fun m!235199 () Bool)

(assert (=> d!49044 m!235199))

(assert (=> d!49044 m!234649))

(assert (=> b!150502 d!49044))

(declare-fun d!49046 () Bool)

(declare-fun res!126398 () Bool)

(declare-fun e!100676 () Bool)

(assert (=> d!49046 (=> res!126398 e!100676)))

(assert (=> d!49046 (= res!126398 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49046 (= (arrayRangesEq!363 arr!237 (_2!7098 lt!235197) #b00000000000000000000000000000000 to!404) e!100676)))

(declare-fun b!150766 () Bool)

(declare-fun e!100677 () Bool)

(assert (=> b!150766 (= e!100676 e!100677)))

(declare-fun res!126399 () Bool)

(assert (=> b!150766 (=> (not res!126399) (not e!100677))))

(assert (=> b!150766 (= res!126399 (= (select (arr!3840 arr!237) #b00000000000000000000000000000000) (select (arr!3840 (_2!7098 lt!235197)) #b00000000000000000000000000000000)))))

(declare-fun b!150767 () Bool)

(assert (=> b!150767 (= e!100677 (arrayRangesEq!363 arr!237 (_2!7098 lt!235197) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49046 (not res!126398)) b!150766))

(assert (= (and b!150766 res!126399) b!150767))

(declare-fun m!235201 () Bool)

(assert (=> b!150766 m!235201))

(declare-fun m!235203 () Bool)

(assert (=> b!150766 m!235203))

(declare-fun m!235205 () Bool)

(assert (=> b!150767 m!235205))

(assert (=> b!150491 d!49046))

(declare-fun d!49048 () Bool)

(declare-fun res!126407 () Bool)

(declare-fun e!100683 () Bool)

(assert (=> d!49048 (=> (not res!126407) (not e!100683))))

(assert (=> d!49048 (= res!126407 (= (size!3047 (buf!3528 (_2!7099 lt!235179))) (size!3047 (buf!3528 (_2!7099 lt!235184)))))))

(assert (=> d!49048 (= (isPrefixOf!0 (_2!7099 lt!235179) (_2!7099 lt!235184)) e!100683)))

(declare-fun b!150774 () Bool)

(declare-fun res!126408 () Bool)

(assert (=> b!150774 (=> (not res!126408) (not e!100683))))

(assert (=> b!150774 (= res!126408 (bvsle (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))) (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184)))))))

(declare-fun b!150775 () Bool)

(declare-fun e!100682 () Bool)

(assert (=> b!150775 (= e!100683 e!100682)))

(declare-fun res!126406 () Bool)

(assert (=> b!150775 (=> res!126406 e!100682)))

(assert (=> b!150775 (= res!126406 (= (size!3047 (buf!3528 (_2!7099 lt!235179))) #b00000000000000000000000000000000))))

(declare-fun b!150776 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6733 array!6733 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150776 (= e!100682 (arrayBitRangesEq!0 (buf!3528 (_2!7099 lt!235179)) (buf!3528 (_2!7099 lt!235184)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179)))))))

(assert (= (and d!49048 res!126407) b!150774))

(assert (= (and b!150774 res!126408) b!150775))

(assert (= (and b!150775 (not res!126406)) b!150776))

(assert (=> b!150774 m!234653))

(assert (=> b!150774 m!234651))

(assert (=> b!150776 m!234653))

(assert (=> b!150776 m!234653))

(declare-fun m!235207 () Bool)

(assert (=> b!150776 m!235207))

(assert (=> b!150493 d!49048))

(declare-fun d!49050 () Bool)

(declare-fun res!126409 () Bool)

(declare-fun e!100684 () Bool)

(assert (=> d!49050 (=> res!126409 e!100684)))

(assert (=> d!49050 (= res!126409 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49050 (= (arrayRangesEq!363 arr!237 (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404) e!100684)))

(declare-fun b!150777 () Bool)

(declare-fun e!100685 () Bool)

(assert (=> b!150777 (= e!100684 e!100685)))

(declare-fun res!126410 () Bool)

(assert (=> b!150777 (=> (not res!126410) (not e!100685))))

(assert (=> b!150777 (= res!126410 (= (select (arr!3840 arr!237) #b00000000000000000000000000000000) (select (arr!3840 (_2!7098 lt!235188)) #b00000000000000000000000000000000)))))

(declare-fun b!150778 () Bool)

(assert (=> b!150778 (= e!100685 (arrayRangesEq!363 arr!237 (_2!7098 lt!235188) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49050 (not res!126409)) b!150777))

(assert (= (and b!150777 res!126410) b!150778))

(assert (=> b!150777 m!235201))

(declare-fun m!235209 () Bool)

(assert (=> b!150777 m!235209))

(declare-fun m!235211 () Bool)

(assert (=> b!150778 m!235211))

(assert (=> b!150503 d!49050))

(declare-fun d!49052 () Bool)

(assert (=> d!49052 (arrayRangesEq!363 arr!237 (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235807 () Unit!9494)

(declare-fun choose!96 (array!6733 array!6733 array!6733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9494)

(assert (=> d!49052 (= lt!235807 (choose!96 arr!237 (_2!7098 lt!235186) (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!49052 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!49052 (= (arrayRangesEqTransitive!78 arr!237 (_2!7098 lt!235186) (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404 to!404) lt!235807)))

(declare-fun bs!11989 () Bool)

(assert (= bs!11989 d!49052))

(assert (=> bs!11989 m!234669))

(declare-fun m!235213 () Bool)

(assert (=> bs!11989 m!235213))

(assert (=> b!150503 d!49052))

(declare-fun d!49054 () Bool)

(declare-fun res!126411 () Bool)

(declare-fun e!100686 () Bool)

(assert (=> d!49054 (=> res!126411 e!100686)))

(assert (=> d!49054 (= res!126411 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49054 (= (arrayRangesEq!363 (_2!7098 lt!235186) (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404) e!100686)))

(declare-fun b!150779 () Bool)

(declare-fun e!100687 () Bool)

(assert (=> b!150779 (= e!100686 e!100687)))

(declare-fun res!126412 () Bool)

(assert (=> b!150779 (=> (not res!126412) (not e!100687))))

(assert (=> b!150779 (= res!126412 (= (select (arr!3840 (_2!7098 lt!235186)) #b00000000000000000000000000000000) (select (arr!3840 (_2!7098 lt!235188)) #b00000000000000000000000000000000)))))

(declare-fun b!150780 () Bool)

(assert (=> b!150780 (= e!100687 (arrayRangesEq!363 (_2!7098 lt!235186) (_2!7098 lt!235188) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49054 (not res!126411)) b!150779))

(assert (= (and b!150779 res!126412) b!150780))

(declare-fun m!235215 () Bool)

(assert (=> b!150779 m!235215))

(assert (=> b!150779 m!235209))

(declare-fun m!235217 () Bool)

(assert (=> b!150780 m!235217))

(assert (=> b!150503 d!49054))

(declare-fun d!49056 () Bool)

(assert (=> d!49056 (arrayRangesEq!363 (_2!7098 lt!235186) (_2!7098 lt!235188) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235810 () Unit!9494)

(declare-fun choose!97 (array!6733 array!6733 (_ BitVec 32) (_ BitVec 32)) Unit!9494)

(assert (=> d!49056 (= lt!235810 (choose!97 (_2!7098 lt!235188) (_2!7098 lt!235186) #b00000000000000000000000000000000 to!404))))

(assert (=> d!49056 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3047 (_2!7098 lt!235188))))))

(assert (=> d!49056 (= (arrayRangesEqSymmetricLemma!95 (_2!7098 lt!235188) (_2!7098 lt!235186) #b00000000000000000000000000000000 to!404) lt!235810)))

(declare-fun bs!11990 () Bool)

(assert (= bs!11990 d!49056))

(assert (=> bs!11990 m!234673))

(declare-fun m!235219 () Bool)

(assert (=> bs!11990 m!235219))

(assert (=> b!150503 d!49056))

(declare-fun d!49058 () Bool)

(declare-datatypes ((tuple2!13480 0))(
  ( (tuple2!13481 (_1!7109 (_ BitVec 8)) (_2!7109 BitStream!5352)) )
))
(declare-fun lt!235813 () tuple2!13480)

(declare-fun readByte!0 (BitStream!5352) tuple2!13480)

(assert (=> d!49058 (= lt!235813 (readByte!0 (_1!7097 lt!235195)))))

(assert (=> d!49058 (= (readBytePure!0 (_1!7097 lt!235195)) (tuple2!13467 (_2!7109 lt!235813) (_1!7109 lt!235813)))))

(declare-fun bs!11991 () Bool)

(assert (= bs!11991 d!49058))

(declare-fun m!235221 () Bool)

(assert (=> bs!11991 m!235221))

(assert (=> b!150492 d!49058))

(declare-fun d!49060 () Bool)

(declare-fun e!100693 () Bool)

(assert (=> d!49060 e!100693))

(declare-fun res!126421 () Bool)

(assert (=> d!49060 (=> (not res!126421) (not e!100693))))

(declare-fun lt!235872 () tuple2!13460)

(assert (=> d!49060 (= res!126421 (isPrefixOf!0 (_1!7097 lt!235872) (_2!7097 lt!235872)))))

(declare-fun lt!235855 () BitStream!5352)

(assert (=> d!49060 (= lt!235872 (tuple2!13461 lt!235855 (_2!7099 lt!235179)))))

(declare-fun lt!235856 () Unit!9494)

(declare-fun lt!235861 () Unit!9494)

(assert (=> d!49060 (= lt!235856 lt!235861)))

(assert (=> d!49060 (isPrefixOf!0 lt!235855 (_2!7099 lt!235179))))

(assert (=> d!49060 (= lt!235861 (lemmaIsPrefixTransitive!0 lt!235855 (_2!7099 lt!235179) (_2!7099 lt!235179)))))

(declare-fun lt!235870 () Unit!9494)

(declare-fun lt!235854 () Unit!9494)

(assert (=> d!49060 (= lt!235870 lt!235854)))

(assert (=> d!49060 (isPrefixOf!0 lt!235855 (_2!7099 lt!235179))))

(assert (=> d!49060 (= lt!235854 (lemmaIsPrefixTransitive!0 lt!235855 thiss!1634 (_2!7099 lt!235179)))))

(declare-fun lt!235857 () Unit!9494)

(declare-fun e!100692 () Unit!9494)

(assert (=> d!49060 (= lt!235857 e!100692)))

(declare-fun c!8069 () Bool)

(assert (=> d!49060 (= c!8069 (not (= (size!3047 (buf!3528 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!235873 () Unit!9494)

(declare-fun lt!235858 () Unit!9494)

(assert (=> d!49060 (= lt!235873 lt!235858)))

(assert (=> d!49060 (isPrefixOf!0 (_2!7099 lt!235179) (_2!7099 lt!235179))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5352) Unit!9494)

(assert (=> d!49060 (= lt!235858 (lemmaIsPrefixRefl!0 (_2!7099 lt!235179)))))

(declare-fun lt!235862 () Unit!9494)

(declare-fun lt!235859 () Unit!9494)

(assert (=> d!49060 (= lt!235862 lt!235859)))

(assert (=> d!49060 (= lt!235859 (lemmaIsPrefixRefl!0 (_2!7099 lt!235179)))))

(declare-fun lt!235871 () Unit!9494)

(declare-fun lt!235860 () Unit!9494)

(assert (=> d!49060 (= lt!235871 lt!235860)))

(assert (=> d!49060 (isPrefixOf!0 lt!235855 lt!235855)))

(assert (=> d!49060 (= lt!235860 (lemmaIsPrefixRefl!0 lt!235855))))

(declare-fun lt!235863 () Unit!9494)

(declare-fun lt!235869 () Unit!9494)

(assert (=> d!49060 (= lt!235863 lt!235869)))

(assert (=> d!49060 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49060 (= lt!235869 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49060 (= lt!235855 (BitStream!5353 (buf!3528 (_2!7099 lt!235179)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(assert (=> d!49060 (isPrefixOf!0 thiss!1634 (_2!7099 lt!235179))))

(assert (=> d!49060 (= (reader!0 thiss!1634 (_2!7099 lt!235179)) lt!235872)))

(declare-fun b!150791 () Bool)

(declare-fun Unit!9504 () Unit!9494)

(assert (=> b!150791 (= e!100692 Unit!9504)))

(declare-fun b!150792 () Bool)

(declare-fun res!126419 () Bool)

(assert (=> b!150792 (=> (not res!126419) (not e!100693))))

(assert (=> b!150792 (= res!126419 (isPrefixOf!0 (_2!7097 lt!235872) (_2!7099 lt!235179)))))

(declare-fun b!150793 () Bool)

(declare-fun res!126420 () Bool)

(assert (=> b!150793 (=> (not res!126420) (not e!100693))))

(assert (=> b!150793 (= res!126420 (isPrefixOf!0 (_1!7097 lt!235872) thiss!1634))))

(declare-fun b!150794 () Bool)

(declare-fun lt!235866 () Unit!9494)

(assert (=> b!150794 (= e!100692 lt!235866)))

(declare-fun lt!235867 () (_ BitVec 64))

(assert (=> b!150794 (= lt!235867 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235865 () (_ BitVec 64))

(assert (=> b!150794 (= lt!235865 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6733 array!6733 (_ BitVec 64) (_ BitVec 64)) Unit!9494)

(assert (=> b!150794 (= lt!235866 (arrayBitRangesEqSymmetric!0 (buf!3528 thiss!1634) (buf!3528 (_2!7099 lt!235179)) lt!235867 lt!235865))))

(assert (=> b!150794 (arrayBitRangesEq!0 (buf!3528 (_2!7099 lt!235179)) (buf!3528 thiss!1634) lt!235867 lt!235865)))

(declare-fun lt!235868 () (_ BitVec 64))

(declare-fun lt!235864 () (_ BitVec 64))

(declare-fun b!150795 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5352 (_ BitVec 64)) BitStream!5352)

(assert (=> b!150795 (= e!100693 (= (_1!7097 lt!235872) (withMovedBitIndex!0 (_2!7097 lt!235872) (bvsub lt!235868 lt!235864))))))

(assert (=> b!150795 (or (= (bvand lt!235868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235864 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235868 lt!235864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150795 (= lt!235864 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))))))

(assert (=> b!150795 (= lt!235868 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(assert (= (and d!49060 c!8069) b!150794))

(assert (= (and d!49060 (not c!8069)) b!150791))

(assert (= (and d!49060 res!126421) b!150793))

(assert (= (and b!150793 res!126420) b!150792))

(assert (= (and b!150792 res!126419) b!150795))

(declare-fun m!235223 () Bool)

(assert (=> b!150795 m!235223))

(assert (=> b!150795 m!234653))

(assert (=> b!150795 m!234657))

(declare-fun m!235225 () Bool)

(assert (=> d!49060 m!235225))

(declare-fun m!235227 () Bool)

(assert (=> d!49060 m!235227))

(declare-fun m!235229 () Bool)

(assert (=> d!49060 m!235229))

(declare-fun m!235231 () Bool)

(assert (=> d!49060 m!235231))

(assert (=> d!49060 m!234659))

(declare-fun m!235233 () Bool)

(assert (=> d!49060 m!235233))

(declare-fun m!235235 () Bool)

(assert (=> d!49060 m!235235))

(declare-fun m!235237 () Bool)

(assert (=> d!49060 m!235237))

(declare-fun m!235239 () Bool)

(assert (=> d!49060 m!235239))

(declare-fun m!235241 () Bool)

(assert (=> d!49060 m!235241))

(declare-fun m!235243 () Bool)

(assert (=> d!49060 m!235243))

(declare-fun m!235245 () Bool)

(assert (=> b!150793 m!235245))

(assert (=> b!150794 m!234657))

(declare-fun m!235247 () Bool)

(assert (=> b!150794 m!235247))

(declare-fun m!235249 () Bool)

(assert (=> b!150794 m!235249))

(declare-fun m!235251 () Bool)

(assert (=> b!150792 m!235251))

(assert (=> b!150492 d!49060))

(declare-fun d!49062 () Bool)

(assert (=> d!49062 (= (invariant!0 (currentBit!6443 thiss!1634) (currentByte!6448 thiss!1634) (size!3047 (buf!3528 thiss!1634))) (and (bvsge (currentBit!6443 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6443 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6448 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6448 thiss!1634) (size!3047 (buf!3528 thiss!1634))) (and (= (currentBit!6443 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6448 thiss!1634) (size!3047 (buf!3528 thiss!1634)))))))))

(assert (=> b!150494 d!49062))

(declare-fun d!49064 () Bool)

(declare-fun e!100694 () Bool)

(assert (=> d!49064 e!100694))

(declare-fun res!126423 () Bool)

(assert (=> d!49064 (=> (not res!126423) (not e!100694))))

(declare-fun lt!235876 () (_ BitVec 64))

(declare-fun lt!235878 () (_ BitVec 64))

(declare-fun lt!235879 () (_ BitVec 64))

(assert (=> d!49064 (= res!126423 (= lt!235878 (bvsub lt!235876 lt!235879)))))

(assert (=> d!49064 (or (= (bvand lt!235876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235876 lt!235879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49064 (= lt!235879 (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235184))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235184)))))))

(declare-fun lt!235877 () (_ BitVec 64))

(declare-fun lt!235875 () (_ BitVec 64))

(assert (=> d!49064 (= lt!235876 (bvmul lt!235877 lt!235875))))

(assert (=> d!49064 (or (= lt!235877 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235875 (bvsdiv (bvmul lt!235877 lt!235875) lt!235877)))))

(assert (=> d!49064 (= lt!235875 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49064 (= lt!235877 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))))))

(assert (=> d!49064 (= lt!235878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235184))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235184)))))))

(assert (=> d!49064 (invariant!0 (currentBit!6443 (_2!7099 lt!235184)) (currentByte!6448 (_2!7099 lt!235184)) (size!3047 (buf!3528 (_2!7099 lt!235184))))))

(assert (=> d!49064 (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184))) lt!235878)))

(declare-fun b!150796 () Bool)

(declare-fun res!126422 () Bool)

(assert (=> b!150796 (=> (not res!126422) (not e!100694))))

(assert (=> b!150796 (= res!126422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235878))))

(declare-fun b!150797 () Bool)

(declare-fun lt!235874 () (_ BitVec 64))

(assert (=> b!150797 (= e!100694 (bvsle lt!235878 (bvmul lt!235874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150797 (or (= lt!235874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235874)))))

(assert (=> b!150797 (= lt!235874 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))))))

(assert (= (and d!49064 res!126423) b!150796))

(assert (= (and b!150796 res!126422) b!150797))

(declare-fun m!235253 () Bool)

(assert (=> d!49064 m!235253))

(declare-fun m!235255 () Bool)

(assert (=> d!49064 m!235255))

(assert (=> b!150495 d!49064))

(assert (=> b!150495 d!49042))

(declare-fun d!49066 () Bool)

(declare-fun res!126425 () Bool)

(declare-fun e!100696 () Bool)

(assert (=> d!49066 (=> (not res!126425) (not e!100696))))

(assert (=> d!49066 (= res!126425 (= (size!3047 (buf!3528 thiss!1634)) (size!3047 (buf!3528 (_2!7099 lt!235179)))))))

(assert (=> d!49066 (= (isPrefixOf!0 thiss!1634 (_2!7099 lt!235179)) e!100696)))

(declare-fun b!150798 () Bool)

(declare-fun res!126426 () Bool)

(assert (=> b!150798 (=> (not res!126426) (not e!100696))))

(assert (=> b!150798 (= res!126426 (bvsle (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)) (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179)))))))

(declare-fun b!150799 () Bool)

(declare-fun e!100695 () Bool)

(assert (=> b!150799 (= e!100696 e!100695)))

(declare-fun res!126424 () Bool)

(assert (=> b!150799 (=> res!126424 e!100695)))

(assert (=> b!150799 (= res!126424 (= (size!3047 (buf!3528 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!150800 () Bool)

(assert (=> b!150800 (= e!100695 (arrayBitRangesEq!0 (buf!3528 thiss!1634) (buf!3528 (_2!7099 lt!235179)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634))))))

(assert (= (and d!49066 res!126425) b!150798))

(assert (= (and b!150798 res!126426) b!150799))

(assert (= (and b!150799 (not res!126424)) b!150800))

(assert (=> b!150798 m!234657))

(assert (=> b!150798 m!234653))

(assert (=> b!150800 m!234657))

(assert (=> b!150800 m!234657))

(declare-fun m!235257 () Bool)

(assert (=> b!150800 m!235257))

(assert (=> b!150497 d!49066))

(declare-fun d!49068 () Bool)

(assert (=> d!49068 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11992 () Bool)

(assert (= bs!11992 d!49068))

(assert (=> bs!11992 m!235199))

(assert (=> b!150496 d!49068))

(assert (=> b!150498 d!49064))

(assert (=> b!150498 d!49044))

(declare-fun d!49070 () Bool)

(assert (=> d!49070 (= (array_inv!2836 arr!237) (bvsge (size!3047 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28940 d!49070))

(declare-fun d!49072 () Bool)

(assert (=> d!49072 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6443 thiss!1634) (currentByte!6448 thiss!1634) (size!3047 (buf!3528 thiss!1634))))))

(declare-fun bs!11993 () Bool)

(assert (= bs!11993 d!49072))

(assert (=> bs!11993 m!234649))

(assert (=> start!28940 d!49072))

(declare-datatypes ((tuple3!592 0))(
  ( (tuple3!593 (_1!7110 Unit!9494) (_2!7110 BitStream!5352) (_3!369 array!6733)) )
))
(declare-fun lt!235882 () tuple3!592)

(declare-fun d!49074 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5352 array!6733 (_ BitVec 32) (_ BitVec 32)) tuple3!592)

(assert (=> d!49074 (= lt!235882 (readByteArrayLoop!0 (_1!7097 lt!235180) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49074 (= (readByteArrayLoopPure!0 (_1!7097 lt!235180) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13463 (_2!7110 lt!235882) (_3!369 lt!235882)))))

(declare-fun bs!11994 () Bool)

(assert (= bs!11994 d!49074))

(declare-fun m!235259 () Bool)

(assert (=> bs!11994 m!235259))

(assert (=> b!150487 d!49074))

(declare-fun d!49076 () Bool)

(assert (=> d!49076 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235201) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179)))) lt!235201))))

(declare-fun bs!11995 () Bool)

(assert (= bs!11995 d!49076))

(declare-fun m!235261 () Bool)

(assert (=> bs!11995 m!235261))

(assert (=> b!150487 d!49076))

(declare-fun d!49078 () Bool)

(assert (=> d!49078 (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235201)))

(declare-fun lt!235885 () Unit!9494)

(declare-fun choose!9 (BitStream!5352 array!6733 (_ BitVec 64) BitStream!5352) Unit!9494)

(assert (=> d!49078 (= lt!235885 (choose!9 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235184)) lt!235201 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179)))))))

(assert (=> d!49078 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235184)) lt!235201) lt!235885)))

(declare-fun bs!11996 () Bool)

(assert (= bs!11996 d!49078))

(assert (=> bs!11996 m!234679))

(declare-fun m!235263 () Bool)

(assert (=> bs!11996 m!235263))

(assert (=> b!150487 d!49078))

(declare-fun d!49080 () Bool)

(declare-fun e!100698 () Bool)

(assert (=> d!49080 e!100698))

(declare-fun res!126429 () Bool)

(assert (=> d!49080 (=> (not res!126429) (not e!100698))))

(declare-fun lt!235904 () tuple2!13460)

(assert (=> d!49080 (= res!126429 (isPrefixOf!0 (_1!7097 lt!235904) (_2!7097 lt!235904)))))

(declare-fun lt!235887 () BitStream!5352)

(assert (=> d!49080 (= lt!235904 (tuple2!13461 lt!235887 (_2!7099 lt!235184)))))

(declare-fun lt!235888 () Unit!9494)

(declare-fun lt!235893 () Unit!9494)

(assert (=> d!49080 (= lt!235888 lt!235893)))

(assert (=> d!49080 (isPrefixOf!0 lt!235887 (_2!7099 lt!235184))))

(assert (=> d!49080 (= lt!235893 (lemmaIsPrefixTransitive!0 lt!235887 (_2!7099 lt!235184) (_2!7099 lt!235184)))))

(declare-fun lt!235902 () Unit!9494)

(declare-fun lt!235886 () Unit!9494)

(assert (=> d!49080 (= lt!235902 lt!235886)))

(assert (=> d!49080 (isPrefixOf!0 lt!235887 (_2!7099 lt!235184))))

(assert (=> d!49080 (= lt!235886 (lemmaIsPrefixTransitive!0 lt!235887 (_2!7099 lt!235179) (_2!7099 lt!235184)))))

(declare-fun lt!235889 () Unit!9494)

(declare-fun e!100697 () Unit!9494)

(assert (=> d!49080 (= lt!235889 e!100697)))

(declare-fun c!8070 () Bool)

(assert (=> d!49080 (= c!8070 (not (= (size!3047 (buf!3528 (_2!7099 lt!235179))) #b00000000000000000000000000000000)))))

(declare-fun lt!235905 () Unit!9494)

(declare-fun lt!235890 () Unit!9494)

(assert (=> d!49080 (= lt!235905 lt!235890)))

(assert (=> d!49080 (isPrefixOf!0 (_2!7099 lt!235184) (_2!7099 lt!235184))))

(assert (=> d!49080 (= lt!235890 (lemmaIsPrefixRefl!0 (_2!7099 lt!235184)))))

(declare-fun lt!235894 () Unit!9494)

(declare-fun lt!235891 () Unit!9494)

(assert (=> d!49080 (= lt!235894 lt!235891)))

(assert (=> d!49080 (= lt!235891 (lemmaIsPrefixRefl!0 (_2!7099 lt!235184)))))

(declare-fun lt!235903 () Unit!9494)

(declare-fun lt!235892 () Unit!9494)

(assert (=> d!49080 (= lt!235903 lt!235892)))

(assert (=> d!49080 (isPrefixOf!0 lt!235887 lt!235887)))

(assert (=> d!49080 (= lt!235892 (lemmaIsPrefixRefl!0 lt!235887))))

(declare-fun lt!235895 () Unit!9494)

(declare-fun lt!235901 () Unit!9494)

(assert (=> d!49080 (= lt!235895 lt!235901)))

(assert (=> d!49080 (isPrefixOf!0 (_2!7099 lt!235179) (_2!7099 lt!235179))))

(assert (=> d!49080 (= lt!235901 (lemmaIsPrefixRefl!0 (_2!7099 lt!235179)))))

(assert (=> d!49080 (= lt!235887 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))))))

(assert (=> d!49080 (isPrefixOf!0 (_2!7099 lt!235179) (_2!7099 lt!235184))))

(assert (=> d!49080 (= (reader!0 (_2!7099 lt!235179) (_2!7099 lt!235184)) lt!235904)))

(declare-fun b!150801 () Bool)

(declare-fun Unit!9505 () Unit!9494)

(assert (=> b!150801 (= e!100697 Unit!9505)))

(declare-fun b!150802 () Bool)

(declare-fun res!126427 () Bool)

(assert (=> b!150802 (=> (not res!126427) (not e!100698))))

(assert (=> b!150802 (= res!126427 (isPrefixOf!0 (_2!7097 lt!235904) (_2!7099 lt!235184)))))

(declare-fun b!150803 () Bool)

(declare-fun res!126428 () Bool)

(assert (=> b!150803 (=> (not res!126428) (not e!100698))))

(assert (=> b!150803 (= res!126428 (isPrefixOf!0 (_1!7097 lt!235904) (_2!7099 lt!235179)))))

(declare-fun b!150804 () Bool)

(declare-fun lt!235898 () Unit!9494)

(assert (=> b!150804 (= e!100697 lt!235898)))

(declare-fun lt!235899 () (_ BitVec 64))

(assert (=> b!150804 (= lt!235899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235897 () (_ BitVec 64))

(assert (=> b!150804 (= lt!235897 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))))))

(assert (=> b!150804 (= lt!235898 (arrayBitRangesEqSymmetric!0 (buf!3528 (_2!7099 lt!235179)) (buf!3528 (_2!7099 lt!235184)) lt!235899 lt!235897))))

(assert (=> b!150804 (arrayBitRangesEq!0 (buf!3528 (_2!7099 lt!235184)) (buf!3528 (_2!7099 lt!235179)) lt!235899 lt!235897)))

(declare-fun lt!235896 () (_ BitVec 64))

(declare-fun lt!235900 () (_ BitVec 64))

(declare-fun b!150805 () Bool)

(assert (=> b!150805 (= e!100698 (= (_1!7097 lt!235904) (withMovedBitIndex!0 (_2!7097 lt!235904) (bvsub lt!235900 lt!235896))))))

(assert (=> b!150805 (or (= (bvand lt!235900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235896 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235900 lt!235896) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150805 (= lt!235896 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184))))))

(assert (=> b!150805 (= lt!235900 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))))))

(assert (= (and d!49080 c!8070) b!150804))

(assert (= (and d!49080 (not c!8070)) b!150801))

(assert (= (and d!49080 res!126429) b!150803))

(assert (= (and b!150803 res!126428) b!150802))

(assert (= (and b!150802 res!126427) b!150805))

(declare-fun m!235265 () Bool)

(assert (=> b!150805 m!235265))

(assert (=> b!150805 m!234651))

(assert (=> b!150805 m!234653))

(assert (=> d!49080 m!235229))

(declare-fun m!235267 () Bool)

(assert (=> d!49080 m!235267))

(declare-fun m!235269 () Bool)

(assert (=> d!49080 m!235269))

(assert (=> d!49080 m!235243))

(assert (=> d!49080 m!234655))

(declare-fun m!235271 () Bool)

(assert (=> d!49080 m!235271))

(declare-fun m!235273 () Bool)

(assert (=> d!49080 m!235273))

(declare-fun m!235275 () Bool)

(assert (=> d!49080 m!235275))

(declare-fun m!235277 () Bool)

(assert (=> d!49080 m!235277))

(declare-fun m!235279 () Bool)

(assert (=> d!49080 m!235279))

(declare-fun m!235281 () Bool)

(assert (=> d!49080 m!235281))

(declare-fun m!235283 () Bool)

(assert (=> b!150803 m!235283))

(assert (=> b!150804 m!234653))

(declare-fun m!235285 () Bool)

(assert (=> b!150804 m!235285))

(declare-fun m!235287 () Bool)

(assert (=> b!150804 m!235287))

(declare-fun m!235289 () Bool)

(assert (=> b!150802 m!235289))

(assert (=> b!150487 d!49080))

(declare-fun d!49082 () Bool)

(assert (=> d!49082 (= (array_inv!2836 (buf!3528 thiss!1634)) (bvsge (size!3047 (buf!3528 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!150489 d!49082))

(declare-fun d!49084 () Bool)

(assert (=> d!49084 (= (invariant!0 (currentBit!6443 thiss!1634) (currentByte!6448 thiss!1634) (size!3047 (buf!3528 (_2!7099 lt!235179)))) (and (bvsge (currentBit!6443 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6443 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6448 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6448 thiss!1634) (size!3047 (buf!3528 (_2!7099 lt!235179)))) (and (= (currentBit!6443 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6448 thiss!1634) (size!3047 (buf!3528 (_2!7099 lt!235179))))))))))

(assert (=> b!150488 d!49084))

(declare-fun d!49086 () Bool)

(assert (=> d!49086 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11997 () Bool)

(assert (= bs!11997 d!49086))

(declare-fun m!235291 () Bool)

(assert (=> bs!11997 m!235291))

(assert (=> b!150501 d!49086))

(declare-fun d!49088 () Bool)

(declare-fun e!100699 () Bool)

(assert (=> d!49088 e!100699))

(declare-fun res!126431 () Bool)

(assert (=> d!49088 (=> (not res!126431) (not e!100699))))

(declare-fun lt!235908 () (_ BitVec 64))

(declare-fun lt!235911 () (_ BitVec 64))

(declare-fun lt!235910 () (_ BitVec 64))

(assert (=> d!49088 (= res!126431 (= lt!235910 (bvsub lt!235908 lt!235911)))))

(assert (=> d!49088 (or (= (bvand lt!235908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235908 lt!235911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49088 (= lt!235911 (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_1!7100 lt!235203)))) ((_ sign_extend 32) (currentByte!6448 (_1!7100 lt!235203))) ((_ sign_extend 32) (currentBit!6443 (_1!7100 lt!235203)))))))

(declare-fun lt!235909 () (_ BitVec 64))

(declare-fun lt!235907 () (_ BitVec 64))

(assert (=> d!49088 (= lt!235908 (bvmul lt!235909 lt!235907))))

(assert (=> d!49088 (or (= lt!235909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235907 (bvsdiv (bvmul lt!235909 lt!235907) lt!235909)))))

(assert (=> d!49088 (= lt!235907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49088 (= lt!235909 ((_ sign_extend 32) (size!3047 (buf!3528 (_1!7100 lt!235203)))))))

(assert (=> d!49088 (= lt!235910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6448 (_1!7100 lt!235203))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6443 (_1!7100 lt!235203)))))))

(assert (=> d!49088 (invariant!0 (currentBit!6443 (_1!7100 lt!235203)) (currentByte!6448 (_1!7100 lt!235203)) (size!3047 (buf!3528 (_1!7100 lt!235203))))))

(assert (=> d!49088 (= (bitIndex!0 (size!3047 (buf!3528 (_1!7100 lt!235203))) (currentByte!6448 (_1!7100 lt!235203)) (currentBit!6443 (_1!7100 lt!235203))) lt!235910)))

(declare-fun b!150806 () Bool)

(declare-fun res!126430 () Bool)

(assert (=> b!150806 (=> (not res!126430) (not e!100699))))

(assert (=> b!150806 (= res!126430 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235910))))

(declare-fun b!150807 () Bool)

(declare-fun lt!235906 () (_ BitVec 64))

(assert (=> b!150807 (= e!100699 (bvsle lt!235910 (bvmul lt!235906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150807 (or (= lt!235906 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235906 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235906)))))

(assert (=> b!150807 (= lt!235906 ((_ sign_extend 32) (size!3047 (buf!3528 (_1!7100 lt!235203)))))))

(assert (= (and d!49088 res!126431) b!150806))

(assert (= (and b!150806 res!126430) b!150807))

(declare-fun m!235293 () Bool)

(assert (=> d!49088 m!235293))

(declare-fun m!235295 () Bool)

(assert (=> d!49088 m!235295))

(assert (=> b!150501 d!49088))

(declare-fun d!49090 () Bool)

(assert (=> d!49090 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235187) (bvsle ((_ sign_extend 32) lt!235187) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11998 () Bool)

(assert (= bs!11998 d!49090))

(assert (=> bs!11998 m!235261))

(assert (=> b!150501 d!49090))

(declare-fun d!49092 () Bool)

(declare-fun lt!235920 () tuple2!13462)

(declare-fun lt!235922 () tuple2!13462)

(assert (=> d!49092 (arrayRangesEq!363 (_2!7098 lt!235920) (_2!7098 lt!235922) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235921 () BitStream!5352)

(declare-fun lt!235923 () Unit!9494)

(declare-fun choose!35 (BitStream!5352 array!6733 (_ BitVec 32) (_ BitVec 32) tuple2!13462 array!6733 BitStream!5352 tuple2!13462 array!6733) Unit!9494)

(assert (=> d!49092 (= lt!235923 (choose!35 (_1!7097 lt!235189) arr!237 from!447 to!404 lt!235920 (_2!7098 lt!235920) lt!235921 lt!235922 (_2!7098 lt!235922)))))

(assert (=> d!49092 (= lt!235922 (readByteArrayLoopPure!0 lt!235921 (array!6734 (store (arr!3840 arr!237) from!447 (_2!7100 (readBytePure!0 (_1!7097 lt!235189)))) (size!3047 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49092 (= lt!235921 (withMovedByteIndex!0 (_1!7097 lt!235189) #b00000000000000000000000000000001))))

(assert (=> d!49092 (= lt!235920 (readByteArrayLoopPure!0 (_1!7097 lt!235189) arr!237 from!447 to!404))))

(assert (=> d!49092 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7097 lt!235189) arr!237 from!447 to!404) lt!235923)))

(declare-fun bs!12000 () Bool)

(assert (= bs!12000 d!49092))

(declare-fun m!235297 () Bool)

(assert (=> bs!12000 m!235297))

(assert (=> bs!12000 m!234615))

(declare-fun m!235299 () Bool)

(assert (=> bs!12000 m!235299))

(declare-fun m!235301 () Bool)

(assert (=> bs!12000 m!235301))

(declare-fun m!235303 () Bool)

(assert (=> bs!12000 m!235303))

(assert (=> bs!12000 m!234623))

(assert (=> bs!12000 m!234601))

(assert (=> b!150501 d!49092))

(declare-fun d!49094 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5352 (_ BitVec 32)) tuple2!13464)

(assert (=> d!49094 (= (withMovedByteIndex!0 (_1!7097 lt!235189) #b00000000000000000000000000000001) (_2!7099 (moveByteIndex!0 (_1!7097 lt!235189) #b00000000000000000000000000000001)))))

(declare-fun bs!12001 () Bool)

(assert (= bs!12001 d!49094))

(declare-fun m!235305 () Bool)

(assert (=> bs!12001 m!235305))

(assert (=> b!150501 d!49094))

(declare-fun d!49096 () Bool)

(assert (=> d!49096 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235926 () Unit!9494)

(declare-fun choose!26 (BitStream!5352 array!6733 (_ BitVec 32) BitStream!5352) Unit!9494)

(assert (=> d!49096 (= lt!235926 (choose!26 thiss!1634 (buf!3528 (_2!7099 lt!235184)) (bvsub to!404 from!447) (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634))))))

(assert (=> d!49096 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3528 (_2!7099 lt!235184)) (bvsub to!404 from!447)) lt!235926)))

(declare-fun bs!12002 () Bool)

(assert (= bs!12002 d!49096))

(assert (=> bs!12002 m!234633))

(declare-fun m!235307 () Bool)

(assert (=> bs!12002 m!235307))

(assert (=> b!150501 d!49096))

(declare-fun d!49098 () Bool)

(declare-fun e!100701 () Bool)

(assert (=> d!49098 e!100701))

(declare-fun res!126434 () Bool)

(assert (=> d!49098 (=> (not res!126434) (not e!100701))))

(declare-fun lt!235945 () tuple2!13460)

(assert (=> d!49098 (= res!126434 (isPrefixOf!0 (_1!7097 lt!235945) (_2!7097 lt!235945)))))

(declare-fun lt!235928 () BitStream!5352)

(assert (=> d!49098 (= lt!235945 (tuple2!13461 lt!235928 (_2!7099 lt!235184)))))

(declare-fun lt!235929 () Unit!9494)

(declare-fun lt!235934 () Unit!9494)

(assert (=> d!49098 (= lt!235929 lt!235934)))

(assert (=> d!49098 (isPrefixOf!0 lt!235928 (_2!7099 lt!235184))))

(assert (=> d!49098 (= lt!235934 (lemmaIsPrefixTransitive!0 lt!235928 (_2!7099 lt!235184) (_2!7099 lt!235184)))))

(declare-fun lt!235943 () Unit!9494)

(declare-fun lt!235927 () Unit!9494)

(assert (=> d!49098 (= lt!235943 lt!235927)))

(assert (=> d!49098 (isPrefixOf!0 lt!235928 (_2!7099 lt!235184))))

(assert (=> d!49098 (= lt!235927 (lemmaIsPrefixTransitive!0 lt!235928 thiss!1634 (_2!7099 lt!235184)))))

(declare-fun lt!235930 () Unit!9494)

(declare-fun e!100700 () Unit!9494)

(assert (=> d!49098 (= lt!235930 e!100700)))

(declare-fun c!8071 () Bool)

(assert (=> d!49098 (= c!8071 (not (= (size!3047 (buf!3528 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!235946 () Unit!9494)

(declare-fun lt!235931 () Unit!9494)

(assert (=> d!49098 (= lt!235946 lt!235931)))

(assert (=> d!49098 (isPrefixOf!0 (_2!7099 lt!235184) (_2!7099 lt!235184))))

(assert (=> d!49098 (= lt!235931 (lemmaIsPrefixRefl!0 (_2!7099 lt!235184)))))

(declare-fun lt!235935 () Unit!9494)

(declare-fun lt!235932 () Unit!9494)

(assert (=> d!49098 (= lt!235935 lt!235932)))

(assert (=> d!49098 (= lt!235932 (lemmaIsPrefixRefl!0 (_2!7099 lt!235184)))))

(declare-fun lt!235944 () Unit!9494)

(declare-fun lt!235933 () Unit!9494)

(assert (=> d!49098 (= lt!235944 lt!235933)))

(assert (=> d!49098 (isPrefixOf!0 lt!235928 lt!235928)))

(assert (=> d!49098 (= lt!235933 (lemmaIsPrefixRefl!0 lt!235928))))

(declare-fun lt!235936 () Unit!9494)

(declare-fun lt!235942 () Unit!9494)

(assert (=> d!49098 (= lt!235936 lt!235942)))

(assert (=> d!49098 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49098 (= lt!235942 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49098 (= lt!235928 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(assert (=> d!49098 (isPrefixOf!0 thiss!1634 (_2!7099 lt!235184))))

(assert (=> d!49098 (= (reader!0 thiss!1634 (_2!7099 lt!235184)) lt!235945)))

(declare-fun b!150808 () Bool)

(declare-fun Unit!9506 () Unit!9494)

(assert (=> b!150808 (= e!100700 Unit!9506)))

(declare-fun b!150809 () Bool)

(declare-fun res!126432 () Bool)

(assert (=> b!150809 (=> (not res!126432) (not e!100701))))

(assert (=> b!150809 (= res!126432 (isPrefixOf!0 (_2!7097 lt!235945) (_2!7099 lt!235184)))))

(declare-fun b!150810 () Bool)

(declare-fun res!126433 () Bool)

(assert (=> b!150810 (=> (not res!126433) (not e!100701))))

(assert (=> b!150810 (= res!126433 (isPrefixOf!0 (_1!7097 lt!235945) thiss!1634))))

(declare-fun b!150811 () Bool)

(declare-fun lt!235939 () Unit!9494)

(assert (=> b!150811 (= e!100700 lt!235939)))

(declare-fun lt!235940 () (_ BitVec 64))

(assert (=> b!150811 (= lt!235940 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235938 () (_ BitVec 64))

(assert (=> b!150811 (= lt!235938 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(assert (=> b!150811 (= lt!235939 (arrayBitRangesEqSymmetric!0 (buf!3528 thiss!1634) (buf!3528 (_2!7099 lt!235184)) lt!235940 lt!235938))))

(assert (=> b!150811 (arrayBitRangesEq!0 (buf!3528 (_2!7099 lt!235184)) (buf!3528 thiss!1634) lt!235940 lt!235938)))

(declare-fun b!150812 () Bool)

(declare-fun lt!235941 () (_ BitVec 64))

(declare-fun lt!235937 () (_ BitVec 64))

(assert (=> b!150812 (= e!100701 (= (_1!7097 lt!235945) (withMovedBitIndex!0 (_2!7097 lt!235945) (bvsub lt!235941 lt!235937))))))

(assert (=> b!150812 (or (= (bvand lt!235941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235941 lt!235937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150812 (= lt!235937 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184))))))

(assert (=> b!150812 (= lt!235941 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(assert (= (and d!49098 c!8071) b!150811))

(assert (= (and d!49098 (not c!8071)) b!150808))

(assert (= (and d!49098 res!126434) b!150810))

(assert (= (and b!150810 res!126433) b!150809))

(assert (= (and b!150809 res!126432) b!150812))

(declare-fun m!235309 () Bool)

(assert (=> b!150812 m!235309))

(assert (=> b!150812 m!234651))

(assert (=> b!150812 m!234657))

(assert (=> d!49098 m!235225))

(declare-fun m!235311 () Bool)

(assert (=> d!49098 m!235311))

(assert (=> d!49098 m!235269))

(assert (=> d!49098 m!235231))

(assert (=> d!49098 m!234595))

(declare-fun m!235313 () Bool)

(assert (=> d!49098 m!235313))

(declare-fun m!235315 () Bool)

(assert (=> d!49098 m!235315))

(declare-fun m!235317 () Bool)

(assert (=> d!49098 m!235317))

(declare-fun m!235319 () Bool)

(assert (=> d!49098 m!235319))

(declare-fun m!235321 () Bool)

(assert (=> d!49098 m!235321))

(assert (=> d!49098 m!235281))

(declare-fun m!235323 () Bool)

(assert (=> b!150810 m!235323))

(assert (=> b!150811 m!234657))

(declare-fun m!235325 () Bool)

(assert (=> b!150811 m!235325))

(declare-fun m!235327 () Bool)

(assert (=> b!150811 m!235327))

(declare-fun m!235329 () Bool)

(assert (=> b!150809 m!235329))

(assert (=> b!150501 d!49098))

(declare-fun d!49100 () Bool)

(declare-fun lt!235947 () tuple3!592)

(assert (=> d!49100 (= lt!235947 (readByteArrayLoop!0 (_1!7097 lt!235189) arr!237 from!447 to!404))))

(assert (=> d!49100 (= (readByteArrayLoopPure!0 (_1!7097 lt!235189) arr!237 from!447 to!404) (tuple2!13463 (_2!7110 lt!235947) (_3!369 lt!235947)))))

(declare-fun bs!12003 () Bool)

(assert (= bs!12003 d!49100))

(declare-fun m!235331 () Bool)

(assert (=> bs!12003 m!235331))

(assert (=> b!150501 d!49100))

(declare-fun d!49102 () Bool)

(declare-fun lt!235948 () tuple2!13480)

(assert (=> d!49102 (= lt!235948 (readByte!0 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634))))))

(assert (=> d!49102 (= (readBytePure!0 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634))) (tuple2!13467 (_2!7109 lt!235948) (_1!7109 lt!235948)))))

(declare-fun bs!12004 () Bool)

(assert (= bs!12004 d!49102))

(declare-fun m!235333 () Bool)

(assert (=> bs!12004 m!235333))

(assert (=> b!150501 d!49102))

(declare-fun d!49104 () Bool)

(assert (=> d!49104 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235184)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235187)))

(declare-fun lt!235949 () Unit!9494)

(assert (=> d!49104 (= lt!235949 (choose!26 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235184)) lt!235187 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179)))))))

(assert (=> d!49104 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235184)) lt!235187) lt!235949)))

(declare-fun bs!12005 () Bool)

(assert (= bs!12005 d!49104))

(assert (=> bs!12005 m!234637))

(declare-fun m!235335 () Bool)

(assert (=> bs!12005 m!235335))

(assert (=> b!150501 d!49104))

(declare-fun d!49106 () Bool)

(declare-fun res!126435 () Bool)

(declare-fun e!100702 () Bool)

(assert (=> d!49106 (=> res!126435 e!100702)))

(assert (=> d!49106 (= res!126435 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49106 (= (arrayRangesEq!363 (_2!7098 lt!235188) (_2!7098 lt!235204) #b00000000000000000000000000000000 to!404) e!100702)))

(declare-fun b!150813 () Bool)

(declare-fun e!100703 () Bool)

(assert (=> b!150813 (= e!100702 e!100703)))

(declare-fun res!126436 () Bool)

(assert (=> b!150813 (=> (not res!126436) (not e!100703))))

(assert (=> b!150813 (= res!126436 (= (select (arr!3840 (_2!7098 lt!235188)) #b00000000000000000000000000000000) (select (arr!3840 (_2!7098 lt!235204)) #b00000000000000000000000000000000)))))

(declare-fun b!150814 () Bool)

(assert (=> b!150814 (= e!100703 (arrayRangesEq!363 (_2!7098 lt!235188) (_2!7098 lt!235204) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49106 (not res!126435)) b!150813))

(assert (= (and b!150813 res!126436) b!150814))

(assert (=> b!150813 m!235209))

(declare-fun m!235337 () Bool)

(assert (=> b!150813 m!235337))

(declare-fun m!235339 () Bool)

(assert (=> b!150814 m!235339))

(assert (=> b!150501 d!49106))

(declare-fun d!49108 () Bool)

(declare-fun e!100711 () Bool)

(assert (=> d!49108 e!100711))

(declare-fun res!126447 () Bool)

(assert (=> d!49108 (=> (not res!126447) (not e!100711))))

(declare-fun lt!235974 () tuple2!13464)

(assert (=> d!49108 (= res!126447 (= (size!3047 (buf!3528 (_2!7099 lt!235179))) (size!3047 (buf!3528 (_2!7099 lt!235974)))))))

(declare-fun choose!64 (BitStream!5352 array!6733 (_ BitVec 32) (_ BitVec 32)) tuple2!13464)

(assert (=> d!49108 (= lt!235974 (choose!64 (_2!7099 lt!235179) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49108 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3047 arr!237)))))

(assert (=> d!49108 (= (appendByteArrayLoop!0 (_2!7099 lt!235179) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!235974)))

(declare-fun b!150825 () Bool)

(declare-fun e!100712 () Bool)

(declare-fun lt!235976 () (_ BitVec 64))

(assert (=> b!150825 (= e!100712 (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235976))))

(declare-fun b!150826 () Bool)

(declare-fun res!126450 () Bool)

(assert (=> b!150826 (=> (not res!126450) (not e!100711))))

(declare-fun lt!235973 () (_ BitVec 64))

(declare-fun lt!235975 () (_ BitVec 64))

(assert (=> b!150826 (= res!126450 (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235974))) (currentByte!6448 (_2!7099 lt!235974)) (currentBit!6443 (_2!7099 lt!235974))) (bvadd lt!235973 lt!235975)))))

(assert (=> b!150826 (or (not (= (bvand lt!235973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235975 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!235973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!235973 lt!235975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!235969 () (_ BitVec 64))

(assert (=> b!150826 (= lt!235975 (bvmul lt!235969 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!150826 (or (= lt!235969 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235969 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235969)))))

(assert (=> b!150826 (= lt!235969 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!150826 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!150826 (= lt!235973 (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235179))) (currentByte!6448 (_2!7099 lt!235179)) (currentBit!6443 (_2!7099 lt!235179))))))

(declare-fun b!150827 () Bool)

(declare-fun res!126449 () Bool)

(assert (=> b!150827 (=> (not res!126449) (not e!100711))))

(assert (=> b!150827 (= res!126449 (isPrefixOf!0 (_2!7099 lt!235179) (_2!7099 lt!235974)))))

(declare-fun b!150828 () Bool)

(declare-fun e!100710 () Bool)

(declare-fun lt!235970 () tuple2!13462)

(assert (=> b!150828 (= e!100710 (arrayRangesEq!363 arr!237 (_2!7098 lt!235970) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150829 () Bool)

(assert (=> b!150829 (= e!100711 e!100710)))

(declare-fun res!126448 () Bool)

(assert (=> b!150829 (=> (not res!126448) (not e!100710))))

(declare-fun lt!235972 () tuple2!13460)

(assert (=> b!150829 (= res!126448 (and (= (size!3047 (_2!7098 lt!235970)) (size!3047 arr!237)) (= (_1!7098 lt!235970) (_2!7097 lt!235972))))))

(assert (=> b!150829 (= lt!235970 (readByteArrayLoopPure!0 (_1!7097 lt!235972) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235968 () Unit!9494)

(declare-fun lt!235971 () Unit!9494)

(assert (=> b!150829 (= lt!235968 lt!235971)))

(assert (=> b!150829 (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235974)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235976)))

(assert (=> b!150829 (= lt!235971 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7099 lt!235179) (buf!3528 (_2!7099 lt!235974)) lt!235976))))

(assert (=> b!150829 e!100712))

(declare-fun res!126451 () Bool)

(assert (=> b!150829 (=> (not res!126451) (not e!100712))))

(assert (=> b!150829 (= res!126451 (and (= (size!3047 (buf!3528 (_2!7099 lt!235179))) (size!3047 (buf!3528 (_2!7099 lt!235974)))) (bvsge lt!235976 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150829 (= lt!235976 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!150829 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!150829 (= lt!235972 (reader!0 (_2!7099 lt!235179) (_2!7099 lt!235974)))))

(assert (= (and d!49108 res!126447) b!150826))

(assert (= (and b!150826 res!126450) b!150827))

(assert (= (and b!150827 res!126449) b!150829))

(assert (= (and b!150829 res!126451) b!150825))

(assert (= (and b!150829 res!126448) b!150828))

(declare-fun m!235341 () Bool)

(assert (=> b!150826 m!235341))

(assert (=> b!150826 m!234653))

(declare-fun m!235343 () Bool)

(assert (=> b!150827 m!235343))

(declare-fun m!235345 () Bool)

(assert (=> d!49108 m!235345))

(declare-fun m!235347 () Bool)

(assert (=> b!150828 m!235347))

(declare-fun m!235349 () Bool)

(assert (=> b!150829 m!235349))

(declare-fun m!235351 () Bool)

(assert (=> b!150829 m!235351))

(declare-fun m!235353 () Bool)

(assert (=> b!150829 m!235353))

(declare-fun m!235355 () Bool)

(assert (=> b!150829 m!235355))

(declare-fun m!235357 () Bool)

(assert (=> b!150825 m!235357))

(assert (=> b!150501 d!49108))

(declare-fun d!49110 () Bool)

(declare-fun lt!235977 () tuple3!592)

(assert (=> d!49110 (= lt!235977 (readByteArrayLoop!0 (_1!7097 lt!235202) lt!235183 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49110 (= (readByteArrayLoopPure!0 (_1!7097 lt!235202) lt!235183 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13463 (_2!7110 lt!235977) (_3!369 lt!235977)))))

(declare-fun bs!12006 () Bool)

(assert (= bs!12006 d!49110))

(declare-fun m!235359 () Bool)

(assert (=> bs!12006 m!235359))

(assert (=> b!150501 d!49110))

(assert (=> b!150501 d!49080))

(declare-fun d!49112 () Bool)

(declare-fun e!100715 () Bool)

(assert (=> d!49112 e!100715))

(declare-fun res!126454 () Bool)

(assert (=> d!49112 (=> (not res!126454) (not e!100715))))

(declare-fun lt!235986 () tuple2!13466)

(declare-fun lt!235988 () tuple2!13466)

(assert (=> d!49112 (= res!126454 (= (bitIndex!0 (size!3047 (buf!3528 (_1!7100 lt!235986))) (currentByte!6448 (_1!7100 lt!235986)) (currentBit!6443 (_1!7100 lt!235986))) (bitIndex!0 (size!3047 (buf!3528 (_1!7100 lt!235988))) (currentByte!6448 (_1!7100 lt!235988)) (currentBit!6443 (_1!7100 lt!235988)))))))

(declare-fun lt!235987 () BitStream!5352)

(declare-fun lt!235989 () Unit!9494)

(declare-fun choose!14 (BitStream!5352 BitStream!5352 BitStream!5352 tuple2!13466 tuple2!13466 BitStream!5352 (_ BitVec 8) tuple2!13466 tuple2!13466 BitStream!5352 (_ BitVec 8)) Unit!9494)

(assert (=> d!49112 (= lt!235989 (choose!14 lt!235196 (_2!7099 lt!235184) lt!235987 lt!235986 (tuple2!13467 (_1!7100 lt!235986) (_2!7100 lt!235986)) (_1!7100 lt!235986) (_2!7100 lt!235986) lt!235988 (tuple2!13467 (_1!7100 lt!235988) (_2!7100 lt!235988)) (_1!7100 lt!235988) (_2!7100 lt!235988)))))

(assert (=> d!49112 (= lt!235988 (readBytePure!0 lt!235987))))

(assert (=> d!49112 (= lt!235986 (readBytePure!0 lt!235196))))

(assert (=> d!49112 (= lt!235987 (BitStream!5353 (buf!3528 (_2!7099 lt!235184)) (currentByte!6448 lt!235196) (currentBit!6443 lt!235196)))))

(assert (=> d!49112 (= (readBytePrefixLemma!0 lt!235196 (_2!7099 lt!235184)) lt!235989)))

(declare-fun b!150832 () Bool)

(assert (=> b!150832 (= e!100715 (= (_2!7100 lt!235986) (_2!7100 lt!235988)))))

(assert (= (and d!49112 res!126454) b!150832))

(declare-fun m!235361 () Bool)

(assert (=> d!49112 m!235361))

(declare-fun m!235363 () Bool)

(assert (=> d!49112 m!235363))

(assert (=> d!49112 m!234639))

(declare-fun m!235365 () Bool)

(assert (=> d!49112 m!235365))

(declare-fun m!235367 () Bool)

(assert (=> d!49112 m!235367))

(assert (=> b!150501 d!49112))

(declare-fun d!49114 () Bool)

(declare-fun res!126455 () Bool)

(declare-fun e!100716 () Bool)

(assert (=> d!49114 (=> res!126455 e!100716)))

(assert (=> d!49114 (= res!126455 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49114 (= (arrayRangesEq!363 (_2!7098 lt!235188) (_2!7098 lt!235186) #b00000000000000000000000000000000 to!404) e!100716)))

(declare-fun b!150833 () Bool)

(declare-fun e!100717 () Bool)

(assert (=> b!150833 (= e!100716 e!100717)))

(declare-fun res!126456 () Bool)

(assert (=> b!150833 (=> (not res!126456) (not e!100717))))

(assert (=> b!150833 (= res!126456 (= (select (arr!3840 (_2!7098 lt!235188)) #b00000000000000000000000000000000) (select (arr!3840 (_2!7098 lt!235186)) #b00000000000000000000000000000000)))))

(declare-fun b!150834 () Bool)

(assert (=> b!150834 (= e!100717 (arrayRangesEq!363 (_2!7098 lt!235188) (_2!7098 lt!235186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49114 (not res!126455)) b!150833))

(assert (= (and b!150833 res!126456) b!150834))

(assert (=> b!150833 m!235209))

(assert (=> b!150833 m!235215))

(declare-fun m!235369 () Bool)

(assert (=> b!150834 m!235369))

(assert (=> b!150501 d!49114))

(declare-fun d!49116 () Bool)

(assert (=> d!49116 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) lt!235187) (bvsle ((_ sign_extend 32) lt!235187) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12007 () Bool)

(assert (= bs!12007 d!49116))

(assert (=> bs!12007 m!235195))

(assert (=> b!150501 d!49116))

(declare-fun d!49118 () Bool)

(declare-fun res!126458 () Bool)

(declare-fun e!100719 () Bool)

(assert (=> d!49118 (=> (not res!126458) (not e!100719))))

(assert (=> d!49118 (= res!126458 (= (size!3047 (buf!3528 thiss!1634)) (size!3047 (buf!3528 (_2!7099 lt!235184)))))))

(assert (=> d!49118 (= (isPrefixOf!0 thiss!1634 (_2!7099 lt!235184)) e!100719)))

(declare-fun b!150835 () Bool)

(declare-fun res!126459 () Bool)

(assert (=> b!150835 (=> (not res!126459) (not e!100719))))

(assert (=> b!150835 (= res!126459 (bvsle (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)) (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!235184))) (currentByte!6448 (_2!7099 lt!235184)) (currentBit!6443 (_2!7099 lt!235184)))))))

(declare-fun b!150836 () Bool)

(declare-fun e!100718 () Bool)

(assert (=> b!150836 (= e!100719 e!100718)))

(declare-fun res!126457 () Bool)

(assert (=> b!150836 (=> res!126457 e!100718)))

(assert (=> b!150836 (= res!126457 (= (size!3047 (buf!3528 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!150837 () Bool)

(assert (=> b!150837 (= e!100718 (arrayBitRangesEq!0 (buf!3528 thiss!1634) (buf!3528 (_2!7099 lt!235184)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634))))))

(assert (= (and d!49118 res!126458) b!150835))

(assert (= (and b!150835 res!126459) b!150836))

(assert (= (and b!150836 (not res!126457)) b!150837))

(assert (=> b!150835 m!234657))

(assert (=> b!150835 m!234651))

(assert (=> b!150837 m!234657))

(assert (=> b!150837 m!234657))

(declare-fun m!235371 () Bool)

(assert (=> b!150837 m!235371))

(assert (=> b!150501 d!49118))

(declare-fun d!49120 () Bool)

(declare-fun e!100720 () Bool)

(assert (=> d!49120 e!100720))

(declare-fun res!126461 () Bool)

(assert (=> d!49120 (=> (not res!126461) (not e!100720))))

(declare-fun lt!235995 () (_ BitVec 64))

(declare-fun lt!235992 () (_ BitVec 64))

(declare-fun lt!235994 () (_ BitVec 64))

(assert (=> d!49120 (= res!126461 (= lt!235994 (bvsub lt!235992 lt!235995)))))

(assert (=> d!49120 (or (= (bvand lt!235992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235992 lt!235995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49120 (= lt!235995 (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_1!7100 lt!235194)))) ((_ sign_extend 32) (currentByte!6448 (_1!7100 lt!235194))) ((_ sign_extend 32) (currentBit!6443 (_1!7100 lt!235194)))))))

(declare-fun lt!235993 () (_ BitVec 64))

(declare-fun lt!235991 () (_ BitVec 64))

(assert (=> d!49120 (= lt!235992 (bvmul lt!235993 lt!235991))))

(assert (=> d!49120 (or (= lt!235993 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235991 (bvsdiv (bvmul lt!235993 lt!235991) lt!235993)))))

(assert (=> d!49120 (= lt!235991 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49120 (= lt!235993 ((_ sign_extend 32) (size!3047 (buf!3528 (_1!7100 lt!235194)))))))

(assert (=> d!49120 (= lt!235994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6448 (_1!7100 lt!235194))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6443 (_1!7100 lt!235194)))))))

(assert (=> d!49120 (invariant!0 (currentBit!6443 (_1!7100 lt!235194)) (currentByte!6448 (_1!7100 lt!235194)) (size!3047 (buf!3528 (_1!7100 lt!235194))))))

(assert (=> d!49120 (= (bitIndex!0 (size!3047 (buf!3528 (_1!7100 lt!235194))) (currentByte!6448 (_1!7100 lt!235194)) (currentBit!6443 (_1!7100 lt!235194))) lt!235994)))

(declare-fun b!150838 () Bool)

(declare-fun res!126460 () Bool)

(assert (=> b!150838 (=> (not res!126460) (not e!100720))))

(assert (=> b!150838 (= res!126460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235994))))

(declare-fun b!150839 () Bool)

(declare-fun lt!235990 () (_ BitVec 64))

(assert (=> b!150839 (= e!100720 (bvsle lt!235994 (bvmul lt!235990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150839 (or (= lt!235990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235990)))))

(assert (=> b!150839 (= lt!235990 ((_ sign_extend 32) (size!3047 (buf!3528 (_1!7100 lt!235194)))))))

(assert (= (and d!49120 res!126461) b!150838))

(assert (= (and b!150838 res!126460) b!150839))

(declare-fun m!235373 () Bool)

(assert (=> d!49120 m!235373))

(declare-fun m!235375 () Bool)

(assert (=> d!49120 m!235375))

(assert (=> b!150501 d!49120))

(declare-fun d!49122 () Bool)

(declare-fun e!100723 () Bool)

(assert (=> d!49122 e!100723))

(declare-fun res!126470 () Bool)

(assert (=> d!49122 (=> (not res!126470) (not e!100723))))

(declare-fun lt!236007 () tuple2!13464)

(assert (=> d!49122 (= res!126470 (= (size!3047 (buf!3528 thiss!1634)) (size!3047 (buf!3528 (_2!7099 lt!236007)))))))

(declare-fun choose!6 (BitStream!5352 (_ BitVec 8)) tuple2!13464)

(assert (=> d!49122 (= lt!236007 (choose!6 thiss!1634 (select (arr!3840 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!49122 (validate_offset_byte!0 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)))))

(assert (=> d!49122 (= (appendByte!0 thiss!1634 (select (arr!3840 arr!237) from!447)) lt!236007)))

(declare-fun b!150846 () Bool)

(declare-fun res!126469 () Bool)

(assert (=> b!150846 (=> (not res!126469) (not e!100723))))

(declare-fun lt!236006 () (_ BitVec 64))

(declare-fun lt!236009 () (_ BitVec 64))

(assert (=> b!150846 (= res!126469 (= (bitIndex!0 (size!3047 (buf!3528 (_2!7099 lt!236007))) (currentByte!6448 (_2!7099 lt!236007)) (currentBit!6443 (_2!7099 lt!236007))) (bvadd lt!236009 lt!236006)))))

(assert (=> b!150846 (or (not (= (bvand lt!236009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236006 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236009 lt!236006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150846 (= lt!236006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!150846 (= lt!236009 (bitIndex!0 (size!3047 (buf!3528 thiss!1634)) (currentByte!6448 thiss!1634) (currentBit!6443 thiss!1634)))))

(declare-fun b!150847 () Bool)

(declare-fun res!126468 () Bool)

(assert (=> b!150847 (=> (not res!126468) (not e!100723))))

(assert (=> b!150847 (= res!126468 (isPrefixOf!0 thiss!1634 (_2!7099 lt!236007)))))

(declare-fun lt!236008 () tuple2!13460)

(declare-fun b!150848 () Bool)

(declare-fun lt!236010 () tuple2!13466)

(assert (=> b!150848 (= e!100723 (and (= (_2!7100 lt!236010) (select (arr!3840 arr!237) from!447)) (= (_1!7100 lt!236010) (_2!7097 lt!236008))))))

(assert (=> b!150848 (= lt!236010 (readBytePure!0 (_1!7097 lt!236008)))))

(assert (=> b!150848 (= lt!236008 (reader!0 thiss!1634 (_2!7099 lt!236007)))))

(assert (= (and d!49122 res!126470) b!150846))

(assert (= (and b!150846 res!126469) b!150847))

(assert (= (and b!150847 res!126468) b!150848))

(assert (=> d!49122 m!234611))

(declare-fun m!235377 () Bool)

(assert (=> d!49122 m!235377))

(declare-fun m!235379 () Bool)

(assert (=> d!49122 m!235379))

(declare-fun m!235381 () Bool)

(assert (=> b!150846 m!235381))

(assert (=> b!150846 m!234657))

(declare-fun m!235383 () Bool)

(assert (=> b!150847 m!235383))

(declare-fun m!235385 () Bool)

(assert (=> b!150848 m!235385))

(declare-fun m!235387 () Bool)

(assert (=> b!150848 m!235387))

(assert (=> b!150501 d!49122))

(declare-fun d!49124 () Bool)

(declare-fun lt!236011 () tuple3!592)

(assert (=> d!49124 (= lt!236011 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7097 lt!235189) #b00000000000000000000000000000001) lt!235183 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49124 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7097 lt!235189) #b00000000000000000000000000000001) lt!235183 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13463 (_2!7110 lt!236011) (_3!369 lt!236011)))))

(declare-fun bs!12008 () Bool)

(assert (= bs!12008 d!49124))

(assert (=> bs!12008 m!234623))

(declare-fun m!235389 () Bool)

(assert (=> bs!12008 m!235389))

(assert (=> b!150501 d!49124))

(declare-fun d!49126 () Bool)

(assert (=> d!49126 (isPrefixOf!0 thiss!1634 (_2!7099 lt!235184))))

(declare-fun lt!236014 () Unit!9494)

(declare-fun choose!30 (BitStream!5352 BitStream!5352 BitStream!5352) Unit!9494)

(assert (=> d!49126 (= lt!236014 (choose!30 thiss!1634 (_2!7099 lt!235179) (_2!7099 lt!235184)))))

(assert (=> d!49126 (isPrefixOf!0 thiss!1634 (_2!7099 lt!235179))))

(assert (=> d!49126 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7099 lt!235179) (_2!7099 lt!235184)) lt!236014)))

(declare-fun bs!12009 () Bool)

(assert (= bs!12009 d!49126))

(assert (=> bs!12009 m!234595))

(declare-fun m!235391 () Bool)

(assert (=> bs!12009 m!235391))

(assert (=> bs!12009 m!234659))

(assert (=> b!150501 d!49126))

(declare-fun d!49128 () Bool)

(declare-fun e!100726 () Bool)

(assert (=> d!49128 e!100726))

(declare-fun res!126473 () Bool)

(assert (=> d!49128 (=> (not res!126473) (not e!100726))))

(assert (=> d!49128 (= res!126473 (and (or (let ((rhs!3292 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3292 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3292) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!49129 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!49129 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!49129 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3291 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3291 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3291) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!236022 () Unit!9494)

(declare-fun choose!57 (BitStream!5352 BitStream!5352 (_ BitVec 64) (_ BitVec 32)) Unit!9494)

(assert (=> d!49128 (= lt!236022 (choose!57 thiss!1634 (_2!7099 lt!235179) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!49128 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7099 lt!235179) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!236022)))

(declare-fun b!150851 () Bool)

(declare-fun lt!236023 () (_ BitVec 32))

(assert (=> b!150851 (= e!100726 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3047 (buf!3528 (_2!7099 lt!235179)))) ((_ sign_extend 32) (currentByte!6448 (_2!7099 lt!235179))) ((_ sign_extend 32) (currentBit!6443 (_2!7099 lt!235179))) (bvsub (bvsub to!404 from!447) lt!236023)))))

(assert (=> b!150851 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!236023 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!236023) #b10000000000000000000000000000000)))))

(declare-fun lt!236021 () (_ BitVec 64))

(assert (=> b!150851 (= lt!236023 ((_ extract 31 0) lt!236021))))

(assert (=> b!150851 (and (bvslt lt!236021 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!236021 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!150851 (= lt!236021 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!49128 res!126473) b!150851))

(declare-fun m!235393 () Bool)

(assert (=> d!49128 m!235393))

(declare-fun m!235395 () Bool)

(assert (=> b!150851 m!235395))

(assert (=> b!150501 d!49128))

(declare-fun d!49131 () Bool)

(declare-fun lt!236024 () tuple2!13480)

(assert (=> d!49131 (= lt!236024 (readByte!0 lt!235196))))

(assert (=> d!49131 (= (readBytePure!0 lt!235196) (tuple2!13467 (_2!7109 lt!236024) (_1!7109 lt!236024)))))

(declare-fun bs!12010 () Bool)

(assert (= bs!12010 d!49131))

(declare-fun m!235397 () Bool)

(assert (=> bs!12010 m!235397))

(assert (=> b!150501 d!49131))

(declare-fun d!49133 () Bool)

(declare-fun lt!236025 () tuple2!13480)

(assert (=> d!49133 (= lt!236025 (readByte!0 (_1!7097 lt!235189)))))

(assert (=> d!49133 (= (readBytePure!0 (_1!7097 lt!235189)) (tuple2!13467 (_2!7109 lt!236025) (_1!7109 lt!236025)))))

(declare-fun bs!12011 () Bool)

(assert (= bs!12011 d!49133))

(declare-fun m!235399 () Bool)

(assert (=> bs!12011 m!235399))

(assert (=> b!150501 d!49133))

(declare-fun d!49135 () Bool)

(assert (=> d!49135 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634)) lt!235192) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3047 (buf!3528 thiss!1634))) ((_ sign_extend 32) (currentByte!6448 thiss!1634)) ((_ sign_extend 32) (currentBit!6443 thiss!1634))) lt!235192))))

(declare-fun bs!12012 () Bool)

(assert (= bs!12012 d!49135))

(assert (=> bs!12012 m!235199))

(assert (=> b!150490 d!49135))

(check-sat (not d!49112) (not b!150827) (not d!49042) (not b!150798) (not d!49120) (not d!49094) (not b!150794) (not d!49092) (not d!49044) (not d!49086) (not d!49072) (not d!49100) (not d!49116) (not b!150811) (not b!150846) (not d!49078) (not b!150814) (not b!150805) (not b!150767) (not d!49124) (not d!49122) (not b!150829) (not b!150812) (not b!150793) (not b!150847) (not b!150774) (not d!49058) (not b!150828) (not b!150780) (not b!150800) (not d!49128) (not d!49074) (not d!49133) (not d!49060) (not d!49076) (not b!150809) (not b!150851) (not d!49056) (not b!150834) (not d!49126) (not d!49090) (not b!150776) (not d!49068) (not b!150792) (not d!49064) (not d!49080) (not d!49102) (not b!150803) (not b!150804) (not d!49110) (not d!49052) (not d!49088) (not b!150795) (not d!49135) (not b!150826) (not b!150837) (not d!49096) (not b!150810) (not d!49108) (not b!150825) (not d!49131) (not b!150848) (not b!150835) (not b!150802) (not b!150778) (not d!49104) (not d!49098))
(check-sat)
