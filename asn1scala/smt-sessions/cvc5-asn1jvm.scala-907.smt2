; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25516 () Bool)

(assert start!25516)

(declare-fun res!107318 () Bool)

(declare-fun e!85877 () Bool)

(assert (=> start!25516 (=> (not res!107318) (not e!85877))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6001 0))(
  ( (array!6002 (arr!3333 (Array (_ BitVec 32) (_ BitVec 8))) (size!2716 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6001)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25516 (= res!107318 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2716 arr!237))))))

(assert (=> start!25516 e!85877))

(assert (=> start!25516 true))

(declare-fun array_inv!2505 (array!6001) Bool)

(assert (=> start!25516 (array_inv!2505 arr!237)))

(declare-datatypes ((BitStream!4696 0))(
  ( (BitStream!4697 (buf!3074 array!6001) (currentByte!5835 (_ BitVec 32)) (currentBit!5830 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4696)

(declare-fun e!85871 () Bool)

(declare-fun inv!12 (BitStream!4696) Bool)

(assert (=> start!25516 (and (inv!12 thiss!1634) e!85871)))

(declare-fun b!129569 () Bool)

(declare-fun e!85874 () Bool)

(declare-fun e!85878 () Bool)

(assert (=> b!129569 (= e!85874 (not e!85878))))

(declare-fun res!107328 () Bool)

(assert (=> b!129569 (=> res!107328 e!85878)))

(declare-datatypes ((tuple2!11086 0))(
  ( (tuple2!11087 (_1!5840 BitStream!4696) (_2!5840 array!6001)) )
))
(declare-fun lt!200163 () tuple2!11086)

(declare-datatypes ((tuple2!11088 0))(
  ( (tuple2!11089 (_1!5841 BitStream!4696) (_2!5841 BitStream!4696)) )
))
(declare-fun lt!200165 () tuple2!11088)

(assert (=> b!129569 (= res!107328 (or (not (= (size!2716 (_2!5840 lt!200163)) (size!2716 arr!237))) (not (= (_1!5840 lt!200163) (_2!5841 lt!200165)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4696 array!6001 (_ BitVec 32) (_ BitVec 32)) tuple2!11086)

(assert (=> b!129569 (= lt!200163 (readByteArrayLoopPure!0 (_1!5841 lt!200165) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8037 0))(
  ( (Unit!8038) )
))
(declare-datatypes ((tuple2!11090 0))(
  ( (tuple2!11091 (_1!5842 Unit!8037) (_2!5842 BitStream!4696)) )
))
(declare-fun lt!200170 () tuple2!11090)

(declare-fun lt!200160 () tuple2!11090)

(declare-fun lt!200159 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129569 (validate_offset_bits!1 ((_ sign_extend 32) (size!2716 (buf!3074 (_2!5842 lt!200170)))) ((_ sign_extend 32) (currentByte!5835 (_2!5842 lt!200160))) ((_ sign_extend 32) (currentBit!5830 (_2!5842 lt!200160))) lt!200159)))

(declare-fun lt!200169 () Unit!8037)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4696 array!6001 (_ BitVec 64)) Unit!8037)

(assert (=> b!129569 (= lt!200169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5842 lt!200160) (buf!3074 (_2!5842 lt!200170)) lt!200159))))

(declare-fun reader!0 (BitStream!4696 BitStream!4696) tuple2!11088)

(assert (=> b!129569 (= lt!200165 (reader!0 (_2!5842 lt!200160) (_2!5842 lt!200170)))))

(declare-fun b!129570 () Bool)

(declare-fun res!107319 () Bool)

(assert (=> b!129570 (=> (not res!107319) (not e!85877))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129570 (= res!107319 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2716 (buf!3074 thiss!1634))) ((_ sign_extend 32) (currentByte!5835 thiss!1634)) ((_ sign_extend 32) (currentBit!5830 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129571 () Bool)

(declare-fun e!85876 () Bool)

(assert (=> b!129571 (= e!85876 e!85874)))

(declare-fun res!107332 () Bool)

(assert (=> b!129571 (=> (not res!107332) (not e!85874))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129571 (= res!107332 (= (bitIndex!0 (size!2716 (buf!3074 (_2!5842 lt!200170))) (currentByte!5835 (_2!5842 lt!200170)) (currentBit!5830 (_2!5842 lt!200170))) (bvadd (bitIndex!0 (size!2716 (buf!3074 (_2!5842 lt!200160))) (currentByte!5835 (_2!5842 lt!200160)) (currentBit!5830 (_2!5842 lt!200160))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200159))))))

(assert (=> b!129571 (= lt!200159 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129572 () Bool)

(declare-fun res!107327 () Bool)

(assert (=> b!129572 (=> (not res!107327) (not e!85877))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129572 (= res!107327 (invariant!0 (currentBit!5830 thiss!1634) (currentByte!5835 thiss!1634) (size!2716 (buf!3074 thiss!1634))))))

(declare-fun b!129573 () Bool)

(declare-fun res!107323 () Bool)

(declare-fun e!85879 () Bool)

(assert (=> b!129573 (=> res!107323 e!85879)))

(declare-fun lt!200166 () (_ BitVec 64))

(assert (=> b!129573 (= res!107323 (bvsgt lt!200166 (bitIndex!0 (size!2716 (buf!3074 (_2!5842 lt!200170))) (currentByte!5835 (_2!5842 lt!200170)) (currentBit!5830 (_2!5842 lt!200170)))))))

(declare-fun b!129574 () Bool)

(declare-fun res!107320 () Bool)

(assert (=> b!129574 (=> (not res!107320) (not e!85877))))

(assert (=> b!129574 (= res!107320 (bvslt from!447 to!404))))

(declare-fun b!129575 () Bool)

(assert (=> b!129575 (= e!85877 (not e!85879))))

(declare-fun res!107331 () Bool)

(assert (=> b!129575 (=> res!107331 e!85879)))

(assert (=> b!129575 (= res!107331 (bvsgt lt!200166 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2716 (buf!3074 (_2!5842 lt!200160)))))))))

(assert (=> b!129575 (= lt!200166 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2716 (buf!3074 (_2!5842 lt!200160))) (currentByte!5835 thiss!1634) (currentBit!5830 thiss!1634))))))

(declare-fun e!85872 () Bool)

(assert (=> b!129575 e!85872))

(declare-fun res!107329 () Bool)

(assert (=> b!129575 (=> (not res!107329) (not e!85872))))

(declare-fun isPrefixOf!0 (BitStream!4696 BitStream!4696) Bool)

(assert (=> b!129575 (= res!107329 (isPrefixOf!0 thiss!1634 (_2!5842 lt!200170)))))

(declare-fun lt!200162 () Unit!8037)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4696 BitStream!4696 BitStream!4696) Unit!8037)

(assert (=> b!129575 (= lt!200162 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5842 lt!200160) (_2!5842 lt!200170)))))

(assert (=> b!129575 e!85876))

(declare-fun res!107322 () Bool)

(assert (=> b!129575 (=> (not res!107322) (not e!85876))))

(assert (=> b!129575 (= res!107322 (= (size!2716 (buf!3074 (_2!5842 lt!200160))) (size!2716 (buf!3074 (_2!5842 lt!200170)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4696 array!6001 (_ BitVec 32) (_ BitVec 32)) tuple2!11090)

(assert (=> b!129575 (= lt!200170 (appendByteArrayLoop!0 (_2!5842 lt!200160) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129575 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2716 (buf!3074 (_2!5842 lt!200160)))) ((_ sign_extend 32) (currentByte!5835 (_2!5842 lt!200160))) ((_ sign_extend 32) (currentBit!5830 (_2!5842 lt!200160))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200168 () Unit!8037)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4696 BitStream!4696 (_ BitVec 64) (_ BitVec 32)) Unit!8037)

(assert (=> b!129575 (= lt!200168 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5842 lt!200160) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85880 () Bool)

(assert (=> b!129575 e!85880))

(declare-fun res!107324 () Bool)

(assert (=> b!129575 (=> (not res!107324) (not e!85880))))

(assert (=> b!129575 (= res!107324 (= (size!2716 (buf!3074 thiss!1634)) (size!2716 (buf!3074 (_2!5842 lt!200160)))))))

(declare-fun appendByte!0 (BitStream!4696 (_ BitVec 8)) tuple2!11090)

(assert (=> b!129575 (= lt!200160 (appendByte!0 thiss!1634 (select (arr!3333 arr!237) from!447)))))

(declare-fun b!129576 () Bool)

(declare-fun res!107330 () Bool)

(assert (=> b!129576 (=> (not res!107330) (not e!85880))))

(assert (=> b!129576 (= res!107330 (= (bitIndex!0 (size!2716 (buf!3074 (_2!5842 lt!200160))) (currentByte!5835 (_2!5842 lt!200160)) (currentBit!5830 (_2!5842 lt!200160))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2716 (buf!3074 thiss!1634)) (currentByte!5835 thiss!1634) (currentBit!5830 thiss!1634)))))))

(declare-fun b!129577 () Bool)

(declare-fun res!107326 () Bool)

(assert (=> b!129577 (=> res!107326 e!85879)))

(declare-fun arrayBitRangesEq!0 (array!6001 array!6001 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129577 (= res!107326 (not (arrayBitRangesEq!0 (buf!3074 (_2!5842 lt!200160)) (buf!3074 (_2!5842 lt!200170)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200166)))))

(declare-datatypes ((tuple2!11092 0))(
  ( (tuple2!11093 (_1!5843 BitStream!4696) (_2!5843 (_ BitVec 8))) )
))
(declare-fun lt!200161 () tuple2!11092)

(declare-fun lt!200171 () tuple2!11088)

(declare-fun b!129578 () Bool)

(assert (=> b!129578 (= e!85880 (and (= (_2!5843 lt!200161) (select (arr!3333 arr!237) from!447)) (= (_1!5843 lt!200161) (_2!5841 lt!200171))))))

(declare-fun readBytePure!0 (BitStream!4696) tuple2!11092)

(assert (=> b!129578 (= lt!200161 (readBytePure!0 (_1!5841 lt!200171)))))

(assert (=> b!129578 (= lt!200171 (reader!0 thiss!1634 (_2!5842 lt!200160)))))

(declare-fun b!129579 () Bool)

(declare-fun res!107321 () Bool)

(assert (=> b!129579 (=> (not res!107321) (not e!85880))))

(assert (=> b!129579 (= res!107321 (isPrefixOf!0 thiss!1634 (_2!5842 lt!200160)))))

(declare-fun b!129580 () Bool)

(assert (=> b!129580 (= e!85871 (array_inv!2505 (buf!3074 thiss!1634)))))

(declare-fun b!129581 () Bool)

(assert (=> b!129581 (= e!85872 (invariant!0 (currentBit!5830 thiss!1634) (currentByte!5835 thiss!1634) (size!2716 (buf!3074 (_2!5842 lt!200160)))))))

(declare-fun b!129582 () Bool)

(declare-fun arrayRangesEq!119 (array!6001 array!6001 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129582 (= e!85878 (not (arrayRangesEq!119 arr!237 (_2!5840 lt!200163) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129583 () Bool)

(declare-fun res!107325 () Bool)

(assert (=> b!129583 (=> (not res!107325) (not e!85874))))

(assert (=> b!129583 (= res!107325 (isPrefixOf!0 (_2!5842 lt!200160) (_2!5842 lt!200170)))))

(declare-fun b!129584 () Bool)

(assert (=> b!129584 (= e!85879 true)))

(declare-fun lt!200164 () tuple2!11092)

(assert (=> b!129584 (= lt!200164 (readBytePure!0 (BitStream!4697 (buf!3074 (_2!5842 lt!200170)) (currentByte!5835 thiss!1634) (currentBit!5830 thiss!1634))))))

(declare-fun lt!200167 () tuple2!11092)

(assert (=> b!129584 (= lt!200167 (readBytePure!0 (BitStream!4697 (buf!3074 (_2!5842 lt!200160)) (currentByte!5835 thiss!1634) (currentBit!5830 thiss!1634))))))

(assert (= (and start!25516 res!107318) b!129570))

(assert (= (and b!129570 res!107319) b!129574))

(assert (= (and b!129574 res!107320) b!129572))

(assert (= (and b!129572 res!107327) b!129575))

(assert (= (and b!129575 res!107324) b!129576))

(assert (= (and b!129576 res!107330) b!129579))

(assert (= (and b!129579 res!107321) b!129578))

(assert (= (and b!129575 res!107322) b!129571))

(assert (= (and b!129571 res!107332) b!129583))

(assert (= (and b!129583 res!107325) b!129569))

(assert (= (and b!129569 (not res!107328)) b!129582))

(assert (= (and b!129575 res!107329) b!129581))

(assert (= (and b!129575 (not res!107331)) b!129573))

(assert (= (and b!129573 (not res!107323)) b!129577))

(assert (= (and b!129577 (not res!107326)) b!129584))

(assert (= start!25516 b!129580))

(declare-fun m!195433 () Bool)

(assert (=> b!129582 m!195433))

(declare-fun m!195435 () Bool)

(assert (=> b!129576 m!195435))

(declare-fun m!195437 () Bool)

(assert (=> b!129576 m!195437))

(declare-fun m!195439 () Bool)

(assert (=> b!129575 m!195439))

(declare-fun m!195441 () Bool)

(assert (=> b!129575 m!195441))

(declare-fun m!195443 () Bool)

(assert (=> b!129575 m!195443))

(declare-fun m!195445 () Bool)

(assert (=> b!129575 m!195445))

(declare-fun m!195447 () Bool)

(assert (=> b!129575 m!195447))

(declare-fun m!195449 () Bool)

(assert (=> b!129575 m!195449))

(assert (=> b!129575 m!195447))

(declare-fun m!195451 () Bool)

(assert (=> b!129575 m!195451))

(declare-fun m!195453 () Bool)

(assert (=> b!129575 m!195453))

(declare-fun m!195455 () Bool)

(assert (=> b!129579 m!195455))

(declare-fun m!195457 () Bool)

(assert (=> start!25516 m!195457))

(declare-fun m!195459 () Bool)

(assert (=> start!25516 m!195459))

(declare-fun m!195461 () Bool)

(assert (=> b!129580 m!195461))

(declare-fun m!195463 () Bool)

(assert (=> b!129572 m!195463))

(declare-fun m!195465 () Bool)

(assert (=> b!129583 m!195465))

(declare-fun m!195467 () Bool)

(assert (=> b!129584 m!195467))

(declare-fun m!195469 () Bool)

(assert (=> b!129584 m!195469))

(declare-fun m!195471 () Bool)

(assert (=> b!129573 m!195471))

(assert (=> b!129571 m!195471))

(assert (=> b!129571 m!195435))

(assert (=> b!129578 m!195447))

(declare-fun m!195473 () Bool)

(assert (=> b!129578 m!195473))

(declare-fun m!195475 () Bool)

(assert (=> b!129578 m!195475))

(declare-fun m!195477 () Bool)

(assert (=> b!129577 m!195477))

(declare-fun m!195479 () Bool)

(assert (=> b!129581 m!195479))

(declare-fun m!195481 () Bool)

(assert (=> b!129569 m!195481))

(declare-fun m!195483 () Bool)

(assert (=> b!129569 m!195483))

(declare-fun m!195485 () Bool)

(assert (=> b!129569 m!195485))

(declare-fun m!195487 () Bool)

(assert (=> b!129569 m!195487))

(declare-fun m!195489 () Bool)

(assert (=> b!129570 m!195489))

(push 1)

(assert (not b!129570))

(assert (not b!129576))

(assert (not b!129584))

(assert (not b!129579))

(assert (not b!129583))

(assert (not b!129571))

(assert (not b!129577))

(assert (not b!129581))

(assert (not start!25516))

(assert (not b!129578))

(assert (not b!129572))

(assert (not b!129569))

(assert (not b!129575))

(assert (not b!129573))

(assert (not b!129580))

(assert (not b!129582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

