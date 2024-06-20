; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25814 () Bool)

(assert start!25814)

(declare-fun b!131899 () Bool)

(declare-fun res!109471 () Bool)

(declare-fun e!87448 () Bool)

(assert (=> b!131899 (=> (not res!109471) (not e!87448))))

(declare-datatypes ((array!6089 0))(
  ( (array!6090 (arr!3386 (Array (_ BitVec 32) (_ BitVec 8))) (size!2757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4778 0))(
  ( (BitStream!4779 (buf!3124 array!6089) (currentByte!5903 (_ BitVec 32)) (currentBit!5898 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4778)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131899 (= res!109471 (invariant!0 (currentBit!5898 thiss!1634) (currentByte!5903 thiss!1634) (size!2757 (buf!3124 thiss!1634))))))

(declare-fun b!131900 () Bool)

(declare-datatypes ((tuple2!11426 0))(
  ( (tuple2!11427 (_1!6016 BitStream!4778) (_2!6016 BitStream!4778)) )
))
(declare-fun lt!203454 () tuple2!11426)

(declare-fun arr!237 () array!6089)

(declare-datatypes ((tuple2!11428 0))(
  ( (tuple2!11429 (_1!6017 BitStream!4778) (_2!6017 (_ BitVec 8))) )
))
(declare-fun lt!203462 () tuple2!11428)

(declare-fun e!87452 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!131900 (= e!87452 (and (= (_2!6017 lt!203462) (select (arr!3386 arr!237) from!447)) (= (_1!6017 lt!203462) (_2!6016 lt!203454))))))

(declare-fun readBytePure!0 (BitStream!4778) tuple2!11428)

(assert (=> b!131900 (= lt!203462 (readBytePure!0 (_1!6016 lt!203454)))))

(declare-datatypes ((Unit!8137 0))(
  ( (Unit!8138) )
))
(declare-datatypes ((tuple2!11430 0))(
  ( (tuple2!11431 (_1!6018 Unit!8137) (_2!6018 BitStream!4778)) )
))
(declare-fun lt!203449 () tuple2!11430)

(declare-fun reader!0 (BitStream!4778 BitStream!4778) tuple2!11426)

(assert (=> b!131900 (= lt!203454 (reader!0 thiss!1634 (_2!6018 lt!203449)))))

(declare-fun b!131901 () Bool)

(declare-fun res!109472 () Bool)

(declare-fun e!87451 () Bool)

(assert (=> b!131901 (=> (not res!109472) (not e!87451))))

(declare-fun lt!203460 () tuple2!11430)

(declare-fun isPrefixOf!0 (BitStream!4778 BitStream!4778) Bool)

(assert (=> b!131901 (= res!109472 (isPrefixOf!0 (_2!6018 lt!203449) (_2!6018 lt!203460)))))

(declare-fun b!131902 () Bool)

(declare-fun res!109473 () Bool)

(assert (=> b!131902 (=> (not res!109473) (not e!87448))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!131902 (= res!109473 (bvslt from!447 to!404))))

(declare-fun e!87443 () Bool)

(declare-fun b!131903 () Bool)

(declare-fun lt!203464 () tuple2!11426)

(declare-datatypes ((tuple2!11432 0))(
  ( (tuple2!11433 (_1!6019 BitStream!4778) (_2!6019 array!6089)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4778 array!6089 (_ BitVec 32) (_ BitVec 32)) tuple2!11432)

(assert (=> b!131903 (= e!87443 (= (_1!6019 (readByteArrayLoopPure!0 (_1!6016 lt!203464) arr!237 from!447 to!404)) (_2!6016 lt!203464)))))

(declare-fun b!131904 () Bool)

(declare-fun lt!203447 () tuple2!11432)

(declare-fun e!87444 () Bool)

(declare-fun arrayRangesEq!160 (array!6089 array!6089 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131904 (= e!87444 (not (arrayRangesEq!160 arr!237 (_2!6019 lt!203447) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131905 () Bool)

(declare-fun e!87442 () Bool)

(assert (=> b!131905 (= e!87442 e!87451)))

(declare-fun res!109469 () Bool)

(assert (=> b!131905 (=> (not res!109469) (not e!87451))))

(declare-fun lt!203458 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131905 (= res!109469 (= (bitIndex!0 (size!2757 (buf!3124 (_2!6018 lt!203460))) (currentByte!5903 (_2!6018 lt!203460)) (currentBit!5898 (_2!6018 lt!203460))) (bvadd (bitIndex!0 (size!2757 (buf!3124 (_2!6018 lt!203449))) (currentByte!5903 (_2!6018 lt!203449)) (currentBit!5898 (_2!6018 lt!203449))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203458))))))

(assert (=> b!131905 (= lt!203458 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131906 () Bool)

(assert (=> b!131906 (= e!87448 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!203448 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131906 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2757 (buf!3124 (_2!6018 lt!203460)))) ((_ sign_extend 32) (currentByte!5903 (_2!6018 lt!203449))) ((_ sign_extend 32) (currentBit!5898 (_2!6018 lt!203449))) lt!203448)))

(declare-fun lt!203456 () Unit!8137)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4778 array!6089 (_ BitVec 32)) Unit!8137)

(assert (=> b!131906 (= lt!203456 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6018 lt!203449) (buf!3124 (_2!6018 lt!203460)) lt!203448))))

(assert (=> b!131906 e!87443))

(declare-fun res!109466 () Bool)

(assert (=> b!131906 (=> (not res!109466) (not e!87443))))

(assert (=> b!131906 (= res!109466 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2757 (buf!3124 (_2!6018 lt!203460)))) ((_ sign_extend 32) (currentByte!5903 thiss!1634)) ((_ sign_extend 32) (currentBit!5898 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203453 () Unit!8137)

(assert (=> b!131906 (= lt!203453 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3124 (_2!6018 lt!203460)) (bvsub to!404 from!447)))))

(assert (=> b!131906 (= (_2!6017 (readBytePure!0 (_1!6016 lt!203464))) (select (arr!3386 arr!237) from!447))))

(declare-fun lt!203457 () tuple2!11426)

(assert (=> b!131906 (= lt!203457 (reader!0 (_2!6018 lt!203449) (_2!6018 lt!203460)))))

(assert (=> b!131906 (= lt!203464 (reader!0 thiss!1634 (_2!6018 lt!203460)))))

(declare-fun e!87446 () Bool)

(assert (=> b!131906 e!87446))

(declare-fun res!109475 () Bool)

(assert (=> b!131906 (=> (not res!109475) (not e!87446))))

(declare-fun lt!203461 () tuple2!11428)

(declare-fun lt!203451 () tuple2!11428)

(assert (=> b!131906 (= res!109475 (= (bitIndex!0 (size!2757 (buf!3124 (_1!6017 lt!203461))) (currentByte!5903 (_1!6017 lt!203461)) (currentBit!5898 (_1!6017 lt!203461))) (bitIndex!0 (size!2757 (buf!3124 (_1!6017 lt!203451))) (currentByte!5903 (_1!6017 lt!203451)) (currentBit!5898 (_1!6017 lt!203451)))))))

(declare-fun lt!203463 () Unit!8137)

(declare-fun lt!203452 () BitStream!4778)

(declare-fun readBytePrefixLemma!0 (BitStream!4778 BitStream!4778) Unit!8137)

(assert (=> b!131906 (= lt!203463 (readBytePrefixLemma!0 lt!203452 (_2!6018 lt!203460)))))

(assert (=> b!131906 (= lt!203451 (readBytePure!0 (BitStream!4779 (buf!3124 (_2!6018 lt!203460)) (currentByte!5903 thiss!1634) (currentBit!5898 thiss!1634))))))

(assert (=> b!131906 (= lt!203461 (readBytePure!0 lt!203452))))

(assert (=> b!131906 (= lt!203452 (BitStream!4779 (buf!3124 (_2!6018 lt!203449)) (currentByte!5903 thiss!1634) (currentBit!5898 thiss!1634)))))

(declare-fun e!87449 () Bool)

(assert (=> b!131906 e!87449))

(declare-fun res!109470 () Bool)

(assert (=> b!131906 (=> (not res!109470) (not e!87449))))

(assert (=> b!131906 (= res!109470 (isPrefixOf!0 thiss!1634 (_2!6018 lt!203460)))))

(declare-fun lt!203455 () Unit!8137)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4778 BitStream!4778 BitStream!4778) Unit!8137)

(assert (=> b!131906 (= lt!203455 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6018 lt!203449) (_2!6018 lt!203460)))))

(assert (=> b!131906 e!87442))

(declare-fun res!109474 () Bool)

(assert (=> b!131906 (=> (not res!109474) (not e!87442))))

(assert (=> b!131906 (= res!109474 (= (size!2757 (buf!3124 (_2!6018 lt!203449))) (size!2757 (buf!3124 (_2!6018 lt!203460)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4778 array!6089 (_ BitVec 32) (_ BitVec 32)) tuple2!11430)

(assert (=> b!131906 (= lt!203460 (appendByteArrayLoop!0 (_2!6018 lt!203449) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131906 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2757 (buf!3124 (_2!6018 lt!203449)))) ((_ sign_extend 32) (currentByte!5903 (_2!6018 lt!203449))) ((_ sign_extend 32) (currentBit!5898 (_2!6018 lt!203449))) lt!203448)))

(assert (=> b!131906 (= lt!203448 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203450 () Unit!8137)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4778 BitStream!4778 (_ BitVec 64) (_ BitVec 32)) Unit!8137)

(assert (=> b!131906 (= lt!203450 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6018 lt!203449) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131906 e!87452))

(declare-fun res!109465 () Bool)

(assert (=> b!131906 (=> (not res!109465) (not e!87452))))

(assert (=> b!131906 (= res!109465 (= (size!2757 (buf!3124 thiss!1634)) (size!2757 (buf!3124 (_2!6018 lt!203449)))))))

(declare-fun appendByte!0 (BitStream!4778 (_ BitVec 8)) tuple2!11430)

(assert (=> b!131906 (= lt!203449 (appendByte!0 thiss!1634 (select (arr!3386 arr!237) from!447)))))

(declare-fun b!131907 () Bool)

(assert (=> b!131907 (= e!87449 (invariant!0 (currentBit!5898 thiss!1634) (currentByte!5903 thiss!1634) (size!2757 (buf!3124 (_2!6018 lt!203449)))))))

(declare-fun b!131908 () Bool)

(declare-fun res!109476 () Bool)

(assert (=> b!131908 (=> (not res!109476) (not e!87448))))

(assert (=> b!131908 (= res!109476 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2757 (buf!3124 thiss!1634))) ((_ sign_extend 32) (currentByte!5903 thiss!1634)) ((_ sign_extend 32) (currentBit!5898 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131909 () Bool)

(declare-fun res!109468 () Bool)

(assert (=> b!131909 (=> (not res!109468) (not e!87452))))

(assert (=> b!131909 (= res!109468 (isPrefixOf!0 thiss!1634 (_2!6018 lt!203449)))))

(declare-fun b!131910 () Bool)

(assert (=> b!131910 (= e!87446 (= (_2!6017 lt!203461) (_2!6017 lt!203451)))))

(declare-fun res!109467 () Bool)

(assert (=> start!25814 (=> (not res!109467) (not e!87448))))

(assert (=> start!25814 (= res!109467 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2757 arr!237))))))

(assert (=> start!25814 e!87448))

(assert (=> start!25814 true))

(declare-fun array_inv!2546 (array!6089) Bool)

(assert (=> start!25814 (array_inv!2546 arr!237)))

(declare-fun e!87450 () Bool)

(declare-fun inv!12 (BitStream!4778) Bool)

(assert (=> start!25814 (and (inv!12 thiss!1634) e!87450)))

(declare-fun b!131898 () Bool)

(assert (=> b!131898 (= e!87450 (array_inv!2546 (buf!3124 thiss!1634)))))

(declare-fun b!131911 () Bool)

(declare-fun res!109477 () Bool)

(assert (=> b!131911 (=> (not res!109477) (not e!87452))))

(assert (=> b!131911 (= res!109477 (= (bitIndex!0 (size!2757 (buf!3124 (_2!6018 lt!203449))) (currentByte!5903 (_2!6018 lt!203449)) (currentBit!5898 (_2!6018 lt!203449))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2757 (buf!3124 thiss!1634)) (currentByte!5903 thiss!1634) (currentBit!5898 thiss!1634)))))))

(declare-fun b!131912 () Bool)

(assert (=> b!131912 (= e!87451 (not e!87444))))

(declare-fun res!109464 () Bool)

(assert (=> b!131912 (=> res!109464 e!87444)))

(declare-fun lt!203465 () tuple2!11426)

(assert (=> b!131912 (= res!109464 (or (not (= (size!2757 (_2!6019 lt!203447)) (size!2757 arr!237))) (not (= (_1!6019 lt!203447) (_2!6016 lt!203465)))))))

(assert (=> b!131912 (= lt!203447 (readByteArrayLoopPure!0 (_1!6016 lt!203465) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131912 (validate_offset_bits!1 ((_ sign_extend 32) (size!2757 (buf!3124 (_2!6018 lt!203460)))) ((_ sign_extend 32) (currentByte!5903 (_2!6018 lt!203449))) ((_ sign_extend 32) (currentBit!5898 (_2!6018 lt!203449))) lt!203458)))

(declare-fun lt!203459 () Unit!8137)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4778 array!6089 (_ BitVec 64)) Unit!8137)

(assert (=> b!131912 (= lt!203459 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6018 lt!203449) (buf!3124 (_2!6018 lt!203460)) lt!203458))))

(assert (=> b!131912 (= lt!203465 (reader!0 (_2!6018 lt!203449) (_2!6018 lt!203460)))))

(assert (= (and start!25814 res!109467) b!131908))

(assert (= (and b!131908 res!109476) b!131902))

(assert (= (and b!131902 res!109473) b!131899))

(assert (= (and b!131899 res!109471) b!131906))

(assert (= (and b!131906 res!109465) b!131911))

(assert (= (and b!131911 res!109477) b!131909))

(assert (= (and b!131909 res!109468) b!131900))

(assert (= (and b!131906 res!109474) b!131905))

(assert (= (and b!131905 res!109469) b!131901))

(assert (= (and b!131901 res!109472) b!131912))

(assert (= (and b!131912 (not res!109464)) b!131904))

(assert (= (and b!131906 res!109470) b!131907))

(assert (= (and b!131906 res!109475) b!131910))

(assert (= (and b!131906 res!109466) b!131903))

(assert (= start!25814 b!131898))

(declare-fun m!199121 () Bool)

(assert (=> b!131907 m!199121))

(declare-fun m!199123 () Bool)

(assert (=> b!131905 m!199123))

(declare-fun m!199125 () Bool)

(assert (=> b!131905 m!199125))

(declare-fun m!199127 () Bool)

(assert (=> b!131908 m!199127))

(declare-fun m!199129 () Bool)

(assert (=> b!131903 m!199129))

(declare-fun m!199131 () Bool)

(assert (=> b!131900 m!199131))

(declare-fun m!199133 () Bool)

(assert (=> b!131900 m!199133))

(declare-fun m!199135 () Bool)

(assert (=> b!131900 m!199135))

(declare-fun m!199137 () Bool)

(assert (=> b!131906 m!199137))

(declare-fun m!199139 () Bool)

(assert (=> b!131906 m!199139))

(declare-fun m!199141 () Bool)

(assert (=> b!131906 m!199141))

(declare-fun m!199143 () Bool)

(assert (=> b!131906 m!199143))

(declare-fun m!199145 () Bool)

(assert (=> b!131906 m!199145))

(declare-fun m!199147 () Bool)

(assert (=> b!131906 m!199147))

(declare-fun m!199149 () Bool)

(assert (=> b!131906 m!199149))

(declare-fun m!199151 () Bool)

(assert (=> b!131906 m!199151))

(declare-fun m!199153 () Bool)

(assert (=> b!131906 m!199153))

(declare-fun m!199155 () Bool)

(assert (=> b!131906 m!199155))

(declare-fun m!199157 () Bool)

(assert (=> b!131906 m!199157))

(declare-fun m!199159 () Bool)

(assert (=> b!131906 m!199159))

(declare-fun m!199161 () Bool)

(assert (=> b!131906 m!199161))

(assert (=> b!131906 m!199131))

(declare-fun m!199163 () Bool)

(assert (=> b!131906 m!199163))

(assert (=> b!131906 m!199131))

(declare-fun m!199165 () Bool)

(assert (=> b!131906 m!199165))

(declare-fun m!199167 () Bool)

(assert (=> b!131906 m!199167))

(declare-fun m!199169 () Bool)

(assert (=> b!131906 m!199169))

(declare-fun m!199171 () Bool)

(assert (=> b!131906 m!199171))

(declare-fun m!199173 () Bool)

(assert (=> b!131898 m!199173))

(declare-fun m!199175 () Bool)

(assert (=> b!131909 m!199175))

(declare-fun m!199177 () Bool)

(assert (=> b!131899 m!199177))

(declare-fun m!199179 () Bool)

(assert (=> start!25814 m!199179))

(declare-fun m!199181 () Bool)

(assert (=> start!25814 m!199181))

(declare-fun m!199183 () Bool)

(assert (=> b!131912 m!199183))

(declare-fun m!199185 () Bool)

(assert (=> b!131912 m!199185))

(declare-fun m!199187 () Bool)

(assert (=> b!131912 m!199187))

(assert (=> b!131912 m!199157))

(assert (=> b!131911 m!199125))

(declare-fun m!199189 () Bool)

(assert (=> b!131911 m!199189))

(declare-fun m!199191 () Bool)

(assert (=> b!131904 m!199191))

(declare-fun m!199193 () Bool)

(assert (=> b!131901 m!199193))

(push 1)

(assert (not b!131904))

(assert (not b!131911))

(assert (not b!131906))

(assert (not b!131912))

(assert (not b!131909))

(assert (not b!131907))

(assert (not b!131900))

(assert (not b!131908))

(assert (not b!131899))

(assert (not b!131903))

(assert (not start!25814))

(assert (not b!131905))

(assert (not b!131898))

(assert (not b!131901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

